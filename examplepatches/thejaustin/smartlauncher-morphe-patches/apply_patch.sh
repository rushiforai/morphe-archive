#!/usr/bin/env bash
set -e

PATCH_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_APK="$PATCH_DIR/smartlauncher6-patched.apk"

echo "=================================================="
echo " Smart Launcher 6 - Morphe Patch Installer"
echo " Target Device: Samsung Galaxy S22 Ultra"
echo "=================================================="

JAR_FILE="$(find "$PATCH_DIR/patches/build/libs" -maxdepth 1 -name '*.mpp' 2>/dev/null | head -n1)"
if [ -z "$JAR_FILE" ]; then
    echo "🔨 Building Morphe Patch Package (.mpp)..."
    (cd "$PATCH_DIR" && bash ./gradlew buildAndroid)
    JAR_FILE="$(find "$PATCH_DIR/patches/build/libs" -maxdepth 1 -name '*.mpp' 2>/dev/null | head -n1)"
fi

echo "✅ Morphe Patch Package (.mpp) ready at:"
echo "   $JAR_FILE"

if [ -z "$1" ]; then
    echo ""
    echo "📋 Usage Instructions:"
    echo "  1. Option A (Morphe / ReVanced Manager):"
    echo "     - Open Morphe / ReVanced Manager app."
    echo "     - Go to Settings -> Sources / Local Patch Bundle."
    echo "     - Select/Import: $JAR_FILE"
    echo "     - Select Smart Launcher 6 APK and apply the patches:"
    echo "       • Hide archived apps (implemented)"
    echo "       • Shizuku app archiving (not yet implemented)"
    echo "       • Native app archiving (not yet implemented)"
    echo ""
    echo "  2. Option B (CLI / Automation):"
    echo "     - Run: ./apply_patch.sh /path/to/smartlauncher6.apk"
    echo ""
    exit 0
fi

INPUT_APK="$1"

if [ ! -f "$INPUT_APK" ]; then
    echo "❌ Input APK not found: $INPUT_APK"
    exit 1
fi

echo "🚀 Applying patch bundle to $INPUT_APK..."
if command -v morphe &> /dev/null; then
    morphe patch -m "$JAR_FILE" -i "$INPUT_APK" -o "$OUTPUT_APK"
elif command -v revanced-cli &> /dev/null; then
    revanced-cli patch -b "$JAR_FILE" "$INPUT_APK" -o "$OUTPUT_APK"
else
    echo "⚠️ Morphe / ReVanced CLI not found in PATH."
    echo "Import $JAR_FILE directly inside Morphe Manager or ReVanced Manager app."
    exit 0
fi

echo "🎉 Patched APK created successfully: $OUTPUT_APK"
