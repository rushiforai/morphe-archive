#!/bin/bash
# Builds the SoundSync app with the Android SDK's own tools (no Gradle):
# aapt2 (resources) -> javac -> d8 (dex) -> zipalign -> apksigner.
# Usage: ci-build.sh <versionCode> <versionName> <keystore> <password>
set -euo pipefail
cd "$(dirname "$0")"
VC=$1; VN=$2; KS=$3; PW=$4
SDK=${ANDROID_HOME:-${ANDROID_SDK_ROOT:?Android SDK not found}}
BT="$SDK/build-tools/$(ls "$SDK/build-tools" | sort -V | tail -1)"
PLATFORM=$(ls "$SDK/platforms" | grep -E '^android-[0-9]+$' | sort -t- -k2 -n | tail -1)
JAR="$SDK/platforms/$PLATFORM/android.jar"
echo "Build tools: $BT"; echo "Platform: $PLATFORM"

rm -rf build && mkdir -p build/gen build/classes build/dex
"$BT/aapt2" compile --dir res -o build/res.zip
"$BT/aapt2" link -I "$JAR" --manifest AndroidManifest.xml \
  --min-sdk-version 34 --target-sdk-version 35 --version-code "$VC" --version-name "$VN" \
  --java build/gen -o build/base.apk build/res.zip
javac -encoding UTF-8 -Xlint:all,-options -Werror -source 8 -target 8 -bootclasspath "$JAR" \
  -d build/classes $(find src build/gen -name '*.java')
"$BT/d8" --min-api 34 --lib "$JAR" --output build/dex $(find build/classes -name '*.class')
cp build/base.apk build/unsigned.apk
(cd build/dex && zip -q ../unsigned.apk classes.dex)
"$BT/zipalign" -f -p 4 build/unsigned.apk build/aligned.apk
"$BT/apksigner" sign --ks "$KS" --ks-pass "pass:$PW" --ks-key-alias soundsync --key-pass "pass:$PW" \
  --out build/soundsync.apk build/aligned.apk
"$BT/apksigner" verify build/soundsync.apk
echo "Built build/soundsync.apk ($VN, code $VC)"
