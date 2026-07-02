#!/bin/sh
# Rebuild the Yahoo Finance ad-removal bundle and apply it to an APK/APKM,
# producing a signed APK.
# Usage: ./repatch.sh <input.apkm>
#   e.g. ./repatch.sh com.yahoo.mobile.client.android.finance_26.10.2-xxxx.apkm
set -e

APKM="$1"
if [ -z "$APKM" ]; then echo "Usage: $0 <input.apkm>"; exit 1; fi

export JAVA_HOME="${JAVA_HOME:-/opt/homebrew/opt/openjdk@24}"   # any JDK 21+
export ANDROID_HOME="${ANDROID_HOME:-$HOME/Library/Android/sdk}"

HERE=$(cd "$(dirname "$0")" && pwd)
CLI=$(ls "$HOME"/morphe/morphe-cli/build/libs/morphe-cli-*-all.jar | head -1)
OUTDIR=$(dirname "$APKM")/out
OUT="$OUTDIR/yahoo-finance-noads.apk"

# 1. Rebuild the patches bundle (picks up any edits to the patch source).
(cd "$HERE" && ./gradlew buildAndroid --console=plain -q)
MPP=$(ls "$HERE"/patches/build/libs/patches-*.mpp | head -1)

# 2. Patch the input (auto-merges splits + signs). -f skips the version check.
mkdir -p "$OUTDIR"
"$JAVA_HOME/bin/java" -jar "$CLI" patch -f -p="$MPP" -o="$OUT" -t="$OUTDIR/tmp" "$APKM"

echo
echo "Done -> $OUT"
echo "Install with: adb install -r \"$OUT\""
