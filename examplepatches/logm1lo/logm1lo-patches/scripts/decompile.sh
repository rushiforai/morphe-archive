#!/usr/bin/env bash
set -euo pipefail

for jdk in /usr/lib/jvm/java-21-openjdk /usr/lib/jvm/java-17-openjdk /usr/lib/jvm/default; do
    [ -d "$jdk" ] && { export JAVA_HOME="$jdk"; break; }
done
[ -z "${JAVA_HOME:-}" ] && command -v java >/dev/null 2>&1 && export JAVA_HOME="$(dirname "$(dirname "$(readlink -f "$(command -v java)")")")"

APP_NAME="${1:-}"
if [ -z "$APP_NAME" ]; then
    echo "Usage: $0 <app-name>"
    echo "Example: $0 com.calistree.calistree"
    exit 1
fi

WORKDIR="$(cd "$(dirname "$0")/.." && pwd)"
APK_DIR="$WORKDIR/apks"
ANALYSIS_DIR="$WORKDIR/analysis/$APP_NAME"
DCOMPILED_DIR="$ANALYSIS_DIR/decompiled"
SMALI_DIR="$ANALYSIS_DIR/smali"

echo "==> Decompiling $APP_NAME"
echo "    APK dir: $APK_DIR"
echo "    Output:  $ANALYSIS_DIR"

APK_FILE=$(find "$APK_DIR" -maxdepth 1 -name "*$APP_NAME*" -o -name "*$(echo "$APP_NAME" | tr '.' '_')*" | head -1)
if [ -z "$APK_FILE" ]; then
    echo "ERROR: No APK found for $APP_NAME in $APK_DIR"
    echo "Available APKs:"
    ls -la "$APK_DIR/"
    exit 1
fi

echo "    APK file: $(basename "$APK_FILE")"

EXT="${APK_FILE##*.}"
IS_SPLIT=false
BASE_APK=""

if [ "$EXT" = "apks" ] || [ "$EXT" = "apkm" ] || [ "$EXT" = "xapk" ]; then
    IS_SPLIT=true
    echo "    Type: Split APK ($EXT) — extracting..."
    mkdir -p "/tmp/logm1lo_${APP_NAME}_split"
    unzip -oq "$APK_FILE" -d "/tmp/logm1lo_${APP_NAME}_split/"
    BASE_APK=$(find "/tmp/logm1lo_${APP_NAME}_split" -name "base.apk" -o -name "*.apk" | head -1)
    if [ -z "$BASE_APK" ]; then
        echo "ERROR: No base APK found in split bundle"
        exit 1
    fi
    echo "    Base APK: $(basename "$BASE_APK")"
    APK_FILE="$BASE_APK"
fi

mkdir -p "$DCOMPILED_DIR" "$SMALI_DIR" "$ANALYSIS_DIR/notes"

echo ""
echo "==> Step 1: jadx → Java source"
if command -v jadx &>/dev/null; then
    jadx -d "$DCOMPILED_DIR" "$APK_FILE"
    echo "    Done: $DCOMPILED_DIR/sources/"
else
    echo "    WARNING: jadx not found. Install with: sudo apt install jadx"
    echo "    Download: https://github.com/skylot/jadx/releases"
fi

echo ""
echo "==> Step 2: baksmali → Smali bytecode"
if command -v baksmali &>/dev/null; then
    TMP_DEX="/tmp/logm1lo_${APP_NAME}_dex"
    mkdir -p "$TMP_DEX"
    unzip -oq "$APK_FILE" "*.dex" -d "$TMP_DEX/"
    for f in "$TMP_DEX"/*.dex; do
        name=$(basename "$f" .dex)
        outdir="$SMALI_DIR/$name"
        mkdir -p "$outdir"
        echo "    Disassembling $name..."
        baksmali d "$f" -o "$outdir"
    done
    echo "    Done: $SMALI_DIR/"
else
    echo "    WARNING: baksmali not found."
    echo "    Download: https://github.com/google/smali/releases"
fi

if [ "$IS_SPLIT" = true ]; then
    echo ""
    echo "==> Split APK components:"
    ls "/tmp/logm1lo_${APP_NAME}_split/"
fi

echo ""
echo "==> Decompilation complete"
echo "    Java:  $DCOMPILED_DIR/sources/"
echo "    Smali: $SMALI_DIR/"
echo ""
echo "Next: /morphe-hunt $APP_NAME premium"
