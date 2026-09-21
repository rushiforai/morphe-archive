#!/usr/bin/env bash
set -e

# Fast Linux Native Build & Sync Pipeline for Morphe
# Compiles and patches on native Linux SSD (~/.cache/morphe-fast-build),
# avoiding WindowsDrive/NTFS 9P/drvfs overhead and Windows Defender latency.

PROJECT_DIR="/mnt/WindowsDrive/Users/akash/Downloads/Project/Morphe"
FAST_CACHE_DIR="$HOME/.cache/morphe-fast-build"
CLI_JAR="$PROJECT_DIR/morphe-desktop-1.15.1-dev.7-all.jar"
STOCK_APK="$PROJECT_DIR/photos_7.92.0.977185651-52372370.apk"
OUTPUT_APK="$PROJECT_DIR/photos_patched.apk"

SOURCE_TARGET="main"
DO_PATCH=true
DO_INSTALL=false
CLEAN=false
RENAME_PKG=true

# Parse arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        --source| -s)
            SOURCE_TARGET="$2"
            shift 2
            ;;
        --rename|-r)
            RENAME_PKG=true
            shift
            ;;
        --mpp-only)
            DO_PATCH=false
            shift
            ;;
        --install|-i)
            DO_INSTALL=true
            shift
            ;;
        --clean)
            CLEAN=true
            shift
            ;;
        *)
            echo "Unknown argument: $1"
            echo "Usage: $0 [--source test|main] [--rename|-r] [--mpp-only] [--install|-i] [--clean]"
            exit 1
            ;;
    esac
done

if [ "$CLEAN" = true ]; then
    echo "🧹 Cleaning fast build cache: $FAST_CACHE_DIR"
    rm -rf "$FAST_CACHE_DIR"
    echo "Done."
    exit 0
fi

# Resolve source path
if [ "$SOURCE_TARGET" = "main" ]; then
    SRC_DIR="$PROJECT_DIR/morphe-google-photos"
elif [ "$SOURCE_TARGET" = "test" ]; then
    SRC_DIR="$PROJECT_DIR/test"
else
    SRC_DIR="$PROJECT_DIR/$SOURCE_TARGET"
fi

if [ ! -d "$SRC_DIR" ]; then
    echo "❌ Source directory not found: $SRC_DIR"
    exit 1
fi

mkdir -p "$FAST_CACHE_DIR/src"

echo "=========================================================="
echo "⚡ MORPHE FAST BUILD PIPELINE"
echo "📁 Source:    $SRC_DIR"
echo "🚀 Native:    $FAST_CACHE_DIR"
echo "📦 Output:    $OUTPUT_APK"
echo "=========================================================="

# Step 1: Sync Source Code to Native Linux SSD (<1 second)
START_TIME=$(date +%s)
echo "🔄 [1/4] Syncing sources to native Linux filesystem..."
rsync -a --delete \
    --exclude='.git' \
    --exclude='/.gradle' \
    --exclude='/**/.gradle' \
    --exclude='/build' \
    --exclude='/*/build' \
    --exclude='/*/*/build' \
    --exclude='/*/*/*/build' \
    --exclude='*.apk' \
    --exclude='*.mpp' \
    "$SRC_DIR/" "$FAST_CACHE_DIR/src/"

chmod +x "$FAST_CACHE_DIR/src/gradlew"

# Step 2: Compile MPP on Native Linux SSD
echo "🔨 [2/4] Compiling MPP bundle with Gradle on native ext4..."
BUILD_START=$(date +%s)
(
    cd "$FAST_CACHE_DIR/src"
    export ANDROID_USER_HOME="$FAST_CACHE_DIR/.android"
    ./gradlew :extensions:shared:syncExtension --no-daemon
    ./gradlew :patches:buildAndroid generatePatchesList --no-daemon
)
BUILD_END=$(date +%s)
echo "✅ MPP build completed in $((BUILD_END - BUILD_START))s"

# Locate generated binary MPP (exclude -sources and -javadoc)
MPP_FILE=$(find "$FAST_CACHE_DIR/src/patches/build/libs" -name "*.mpp" ! -name "*-sources.mpp" ! -name "*-javadoc.mpp" -type f | head -n 1)
if [ -z "$MPP_FILE" ]; then
    echo "❌ Failed to locate compiled .mpp in $FAST_CACHE_DIR/src/patches/build/libs"
    exit 1
fi

MPP_BASENAME=$(basename "$MPP_FILE")
echo "📦 Generated MPP: $MPP_BASENAME ($(du -h "$MPP_FILE" | cut -f1))"

# Copy MPP back to WindowsDrive source
mkdir -p "$SRC_DIR/patches/build/libs"
cp -f "$MPP_FILE" "$SRC_DIR/patches/build/libs/$MPP_BASENAME"
cp -f "$MPP_FILE" "$PROJECT_DIR/$MPP_BASENAME"
if [ -f "$FAST_CACHE_DIR/src/patches-list.json" ]; then
    cp -f "$FAST_CACHE_DIR/src/patches-list.json" "$SRC_DIR/patches-list.json"
fi
echo "💾 Copied $MPP_BASENAME and patches-list.json back to WindowsDrive project folder."

if [ "$DO_PATCH" = false ]; then
    TOTAL_TIME=$(( $(date +%s) - START_TIME ))
    echo "🎉 MPP build completed in ${TOTAL_TIME}s total!"
    exit 0
fi

# Step 3: Patch APK using Morphe CLI on Native Linux SSD
echo "🧩 [3/4] Patching Google Photos APK on native ext4..."
PATCH_START=$(date +%s)

# Sync stock APK and CLI Jar if needed (only copies if updated)
rsync -u "$STOCK_APK" "$FAST_CACHE_DIR/stock.apk"
rsync -u "$CLI_JAR" "$FAST_CACHE_DIR/morphe-desktop.jar"

    PATCH_ARGS=(
        --patches="$MPP_FILE"
        --exclusive
        -e "Account avatar"
        -e "Disable Play Store updates"
        -e "Enable DCIM folders backup control"
        -e "Enable Phenotype flag manager"
        -e "Fix memory style font loading"
        -e "GmsCore support"
        -e "Model Readiness Gates"
        -e "Spoof features"
    )

    if [ "$SOURCE_TARGET" = "main" ]; then
        # morphe-google-photos has Change package name enabled by default
        PATCH_ARGS+=(-e "Change package name")
        APP_PKG="app.morphe.android.apps.photos"
        echo "🏷️ Mode: Renamed package (morphe-google-photos default) -> $APP_PKG"
    elif [ "$RENAME_PKG" = true ]; then
        PATCH_ARGS+=(-e "Change package name")
        APP_PKG="app.morphe.android.apps.photos"
        echo "🏷️ Mode: Renaming package to $APP_PKG (Experimental)"
    else
        APP_PKG="com.google.android.apps.photos"
        echo "🏷️ Mode: Retaining official package name $APP_PKG"
    fi

    (
        cd "$FAST_CACHE_DIR"
        java -jar morphe-desktop.jar patch \
            "${PATCH_ARGS[@]}" \
            -o="$FAST_CACHE_DIR/photos_patched.apk" \
            "$FAST_CACHE_DIR/stock.apk"
    )
PATCH_END=$(date +%s)
echo "✅ Patching completed in $((PATCH_END - PATCH_START))s"

# Step 4: Copy Patched APK back to WindowsDrive
echo "💾 [4/4] Copying final APK back to $OUTPUT_APK..."
cp -f "$FAST_CACHE_DIR/photos_patched.apk" "$OUTPUT_APK"
echo "✅ Patched APK ready: $OUTPUT_APK ($(du -h "$OUTPUT_APK" | cut -f1))"

TOTAL_TIME=$(( $(date +%s) - START_TIME ))
echo "🎉 Total pipeline completed in ${TOTAL_TIME}s!"

# Step 5 (Optional): Install via ADB
if [ "$DO_INSTALL" = true ]; then
    echo "📱 Installing to connected device via ADB..."
    adb install -r -d "$OUTPUT_APK"
    echo "🚀 Launching $APP_PKG..."
    adb shell am force-stop "$APP_PKG" || true
    adb shell am start -n "$APP_PKG/com.google.android.apps.photos.home.HomeActivity" || \
        adb shell monkey -p "$APP_PKG" -c android.intent.category.LAUNCHER 1 || true
    echo "✅ App launched on device."
fi
