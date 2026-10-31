#!/usr/bin/env bash
# Builds classes3.dex with a replacement for Facebook Lite's server glyph rasterizer (X.0eF).
#
# Java cannot name classes that start with a digit, so the sources use placeholder names
# (ZZeF, ZZe1, ...) and are renamed in smali after compiling. The names below are for
# Facebook Lite 530.0.0.8.106 and change with every app version.
#
# Usage: ANDROID_HOME=... APKTOOL_JAR=... ./build.sh
#        Output: out/classes3.dex
set -euo pipefail
cd "$(dirname "$0")"

: "${ANDROID_HOME:?set ANDROID_HOME}"
: "${APKTOOL_JAR:?set APKTOOL_JAR (apktool 2.9+ jar)}"
BUILD_TOOLS="${BUILD_TOOLS:-$(ls -d "$ANDROID_HOME"/build-tools/* | sort -V | tail -1)}"
ANDROID_JAR="${ANDROID_JAR:-$ANDROID_HOME/platforms/android-35/android.jar}"

rm -rf out && mkdir -p out/stub out/src out/d8

javac -source 8 -target 8 -nowarn -cp "$ANDROID_JAR" -d out/stub $(find stub -name '*.java')
javac -source 8 -target 8 -nowarn -cp "$ANDROID_JAR:out/stub" -d out/src src/X/ZZeF.java src/app/fblite/research/Preload.java
"$BUILD_TOOLS/d8" --min-api 26 --lib "$ANDROID_JAR" --classpath out/stub --output out/d8 $(find out/src -name '*.class')
(cd out/d8 && zip -q ../shadow.jar classes.dex)

java -jar "$APKTOOL_JAR" d -f -r out/shadow.jar -o out/smali >/dev/null
for smali_file in out/smali/smali/X/ZZeF*.smali; do
  sed -i.bak \
    -e 's#LX/ZZeF#LX/0eF#g' \
    -e 's#LX/ZZe1;#LX/0e1;#g' \
    -e 's#LX/ZZIk;#LX/1Ik;#g' \
    -e 's#LX/ZZeG;#LX/0eG;#g' \
    -e 's#LX/ZZIm;#LX/1Im;#g' \
    -e 's#LX/ZZIn;#LX/1In;#g' \
    -e 's#LX/ZZFD;#LX/0FD;#g' \
    "$smali_file"
  rm -f "$smali_file.bak"
  mv "$smali_file" "${smali_file/ZZeF/0eF}"
done

java -jar "$APKTOOL_JAR" b out/smali -o out/renamed.jar >/dev/null
unzip -o -q out/renamed.jar classes.dex -d out/renamed
mv out/renamed/classes.dex out/classes3.dex
echo "Built out/classes3.dex"
