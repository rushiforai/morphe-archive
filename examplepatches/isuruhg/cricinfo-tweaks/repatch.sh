#!/bin/sh
# Rebuild the ESPNcricinfo ad/tracking-removal bundle and apply it to an
# XAPK/APKM/APKS/APK, producing a signed, installable APK.
# Usage: ./repatch.sh <input.xapk>
#   e.g. ./repatch.sh ~/Downloads/ESPNcricinfo+-+Live+Cricket_26.05.11_APKPure.xapk
set -e

INPUT="$1"
if [ -z "$INPUT" ]; then echo "Usage: $0 <input.xapk|.apkm|.apks|.apk>"; exit 1; fi

# JDK 21-24 (AGP's jlink transform breaks on JDK 25+). Homebrew's `openjdk@24`
# symlink may have been bumped to a newer JDK, so prefer the real 24.x keg and
# fall back sensibly. Override by exporting JAVA_HOME yourself.
if [ -z "$JAVA_HOME" ]; then
  for cand in \
    /opt/homebrew/Cellar/openjdk/24.* \
    /opt/homebrew/opt/openjdk@21 \
    "$(/usr/libexec/java_home -v 24 2>/dev/null)" \
    "$(/usr/libexec/java_home -v 21 2>/dev/null)"; do
    if [ -x "$cand/bin/java" ]; then JAVA_HOME="$cand"; break; fi
  done
fi
export JAVA_HOME
export ANDROID_HOME="${ANDROID_HOME:-$HOME/Library/Android/sdk}"
echo "Using JAVA_HOME=$JAVA_HOME"

HERE=$(cd "$(dirname "$0")" && pwd)
CLI=$(ls "$HOME"/morphe/morphe-cli/build/libs/morphe-cli-*-all.jar | head -1)
OUTDIR=$(dirname "$INPUT")/out
OUT="$OUTDIR/cricinfo-noads.apk"

# 1. Rebuild the patches bundle (picks up any edits to the patch source).
(cd "$HERE" && ./gradlew buildAndroid --console=plain -q)
MPP=$(ls "$HERE"/patches/build/libs/patches-*.mpp | head -1)

# 2. Patch the input (auto-merges splits + signs). -f skips the version check.
mkdir -p "$OUTDIR"
"$JAVA_HOME/bin/java" -jar "$CLI" patch -f -p="$MPP" -o="$OUT" -t="$OUTDIR/tmp" "$INPUT"

echo
echo "Done -> $OUT"
echo "Install with: adb install -r \"$OUT\""
