#!/usr/bin/env bash
# Tiny app that draws one sample line per Typeface API, to see which ones a device maps to its
# system font. On an OPPO CPH2825 (ColorOS, Android 16) every line rendered in OPPO Sans,
# including Typeface.create(DEFAULT, weight, italic) and create("roboto", NORMAL).
#
# Usage: ANDROID_HOME=... UBER_APK_SIGNER_JAR=... ./build.sh && adb install out/base-aligned-debugSigned.apk
set -euo pipefail
cd "$(dirname "$0")"
: "${ANDROID_HOME:?set ANDROID_HOME}"
: "${UBER_APK_SIGNER_JAR:?set UBER_APK_SIGNER_JAR}"
BUILD_TOOLS="${BUILD_TOOLS:-$(ls -d "$ANDROID_HOME"/build-tools/* | sort -V | tail -1)}"
ANDROID_JAR="${ANDROID_JAR:-$ANDROID_HOME/platforms/android-35/android.jar}"

rm -rf out && mkdir -p out/cls out/dex
javac -source 8 -target 8 -nowarn -cp "$ANDROID_JAR" -d out/cls src/t/fonttest/Main.java
"$BUILD_TOOLS/d8" --min-api 26 --lib "$ANDROID_JAR" --output out/dex $(find out/cls -name '*.class')
"$BUILD_TOOLS/aapt2" link -o out/base.apk --manifest AndroidManifest.xml -I "$ANDROID_JAR"
(cd out/dex && zip -q ../base.apk classes.dex)
java -jar "$UBER_APK_SIGNER_JAR" -a out/base.apk -o out >/dev/null
echo "Built out/base-aligned-debugSigned.apk"
