#!/usr/bin/env bash
set -euo pipefail

for jdk in /usr/lib/jvm/java-21-openjdk /usr/lib/jvm/java-17-openjdk /usr/lib/jvm/default; do
    [ -d "$jdk" ] && { export JAVA_HOME="$jdk"; break; }
done
[ -z "${JAVA_HOME:-}" ] && command -v java >/dev/null 2>&1 && export JAVA_HOME="$(dirname "$(dirname "$(readlink -f "$(command -v java)")")")"

APP_NAME="${1:-}"
ACTION="${2:-install}"

if [ -z "$APP_NAME" ]; then
    echo "Usage: $0 <app-name> [install|build|both]"
    echo "Example: $0 com.calistree.calistree both"
    exit 1
fi

WORKDIR="$(cd "$(dirname "$0")/.." && pwd)"
APK_FILE=$(find "$WORKDIR/apks" -maxdepth 1 -name "*${APP_NAME}*" -o -name "*$(echo "$APP_NAME" | tr '.' '_')*" | head -1)

if [ -z "$APK_FILE" ]; then
    echo "ERROR: No APK found for $APP_NAME in $WORKDIR/apks/"
    exit 1
fi

echo "==> Building patches..."
cd "$WORKDIR"
./gradlew :patches:buildAndroid
MPP_FILE=$(ls -t patches/build/libs/patches-*.mpp 2>/dev/null | head -1)
if [ -z "$MPP_FILE" ]; then
    echo "ERROR: MPP build failed — no .mpp found"
    exit 1
fi
echo "    Built: $MPP_FILE"

if [ "$ACTION" = "build" ]; then
    echo ""
    echo "==> Build complete (no install). MPP: $MPP_FILE"
    exit 0
fi

MORPHE_CLI="${MORPHE_CLI:-$WORKDIR/morphe-cli.jar}"
KEYSTORE="${KEYSTORE:-$WORKDIR/Morphe.keystore}"

if [ ! -f "$MORPHE_CLI" ]; then
    echo "ERROR: morphe-cli.jar not found at $MORPHE_CLI"
    echo "Set MORPHE_CLI env var or place it in the project root."
    echo "Download from: https://github.com/MorpheApp/morphe-desktop/releases"
    exit 1
fi

OUT_DIR="$WORKDIR/analysis/$APP_NAME/builds"
mkdir -p "$OUT_DIR"
OUT_APK="$OUT_DIR/${APP_NAME}_patched.apk"

echo ""
echo "==> Applying patches..."
java -Xms1024m -jar "$MORPHE_CLI" patch \
    --patches "$MPP_FILE" \
    --out "$OUT_APK" \
    ${KEYSTORE:+--keystore "$KEYSTORE"} \
    ${2:+--force} \
    "$APK_FILE"

echo "    Output: $OUT_APK"

if [ "$ACTION" = "install" ] || [ "$ACTION" = "both" ]; then
    echo ""
    echo "==> Installing to device..."
    if command -v adb &>/dev/null; then
        adb install -r "$OUT_APK" || {
            echo "NOTE: Install failed. You may need to uninstall the original app first:"
            echo "  adb uninstall $APP_NAME"
            echo "  adb install $OUT_APK"
        }
    else
        echo "ERROR: adb not found. Install Android SDK Platform Tools."
        exit 1
    fi
fi

echo ""
echo "==> Done!"
