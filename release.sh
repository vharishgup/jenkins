#!/bin/sh -ex
#
# Kohsuke's automated release script. Sorry for my checking this in,
# but Maven doesn't let me run release goals unless I have this in CVS.
#
# this script is to be run after release:perform runs successfully
id=$(show-pom-version target/checkout/pom.xml)
#./publish-javadoc.sh
javanettasks uploadFile hudson /releases/$id                "`date +"%Y/%m/%d"` release" Stable target/checkout/war/target/hudson.war
javanettasks uploadFile hudson /releases/source-bundles/$id "`date +"%Y/%m/%d"` release" Stable target/checkout/target/hudson-1.66-src.zip
javanettasks announce hudson "Hudson $id released" << EOF
See <a href="https://hudson.dev.java.net/changelog.html">the changelog</a> for details.
EOF
