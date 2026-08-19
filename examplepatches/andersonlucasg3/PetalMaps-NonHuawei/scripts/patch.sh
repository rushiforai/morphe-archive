#!/bin/bash
# =============================================================================
# patch.sh — End-to-end pipeline: build patches → apply Morphe → sign APK
#
# Usage:
#   ./scripts/patch.sh
#
# Environment variables:
#   PETALAA_KEYSTORE_PASS  – Keystore/storepass/keypass (default: petalaa-dev)
#   JAVA_HOME              – Path to JDK 21+ (default: Android Studio JBR)
#   ANDROID_SDK_ROOT       – Android SDK root (default: %LOCALAPPDATA%\Android\Sdk)
#
# Prerequisites:
#   - tools/morphe-cli/morphe-desktop-*-all.jar (downloaded from Morphe releases)
#   - tools/apk/petal-maps.apk (original Petal Maps 4.7.0.322)
#   - keystore/petalaa.keystore (generated once; see keytool command below)
# =============================================================================
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJECT_DIR"

# ── Environment defaults ────────────────────────────────────────────────────
export JAVA_HOME="${JAVA_HOME:-C:\\Program Files\\Android\\Android Studio\\jbr}"
export GITHUB_ACTOR="${GITHUB_ACTOR:-dummy}"
export GITHUB_TOKEN="${GITHUB_TOKEN:-dummy}"

PETALAA_KEYSTORE_PASS="${PETALAA_KEYSTORE_PASS:-petalaa-dev}"

ANDROID_SDK_ROOT="${ANDROID_SDK_ROOT:-$LOCALAPPDATA/Android/Sdk}"
BUILD_TOOLS="$ANDROID_SDK_ROOT/build-tools/36.0.0"

# ── Paths ───────────────────────────────────────────────────────────────────
MORPHE_CLI="$PROJECT_DIR/tools/morphe-cli/morphe-desktop-1.12.0-all.jar"
PATCHES_VERSION="$(grep -E '^version' "$PROJECT_DIR/gradle.properties" | cut -d= -f2 | tr -d ' ')"
PATCHES_MPP="$PROJECT_DIR/patches/build/libs/patches-${PATCHES_VERSION}.mpp"
INPUT_APK="$PROJECT_DIR/tools/apk/petal-maps.apk"
OUTPUT_UNSIGNED="$PROJECT_DIR/build/petal-maps-nh-unsigned.apk"
OUTPUT_ALIGNED="$PROJECT_DIR/build/petal-maps-nh-aligned.apk"
OUTPUT_PATCHED="$PROJECT_DIR/build/petal-maps-nh-patched.apk"
KEYSTORE="$PROJECT_DIR/keystore/petalaa.keystore"
RESULT_JSON="$PROJECT_DIR/build/patch-result.json"

# ── Pre-flight checks ───────────────────────────────────────────────────────
die() { echo "ERROR: $*" >&2; exit 1; }

for f in "$MORPHE_CLI" "$INPUT_APK"; do
    [ -f "$f" ] || die "Missing required file: $f"
done

find_tool() {
    local name="$1"
    for ext in .exe .bat ""; do
        local candidate="$BUILD_TOOLS/${name}${ext}"
        [ -f "$candidate" ] && { echo "$candidate"; return 0; }
    done
    die "Missing build tool: $name (expected in $BUILD_TOOLS)"
}

ZIPALIGN="$(find_tool zipalign)"
APKSIGNER="$(find_tool apksigner)"

echo "=== Step 1/5: Build patches ==="
# buildAndroid produces the same .mpp plus classes.dex (required by Morphe Manager on-device).
./gradlew :patches:buildAndroid

echo ""
echo "=== Step 2/5: Apply Morphe patches ==="
# Patch list (all enabled by default; the main patches are):
#   "Manufacturer Check Bypass" → bypasses Huawei device restriction
#   "Anti-Repack Bypass"        → neutralizes SecurityDetect.irpj
#   "Huawei Login Fix"          → fixes login on non-Huawei devices
#   "Change Package Name"       → optional: changes package name
"$JAVA_HOME/bin/java" -jar "$MORPHE_CLI" patch \
    --unsigned \
    --force \
    --continue-on-error \
    -p "$PATCHES_MPP" \
    -o "$OUTPUT_UNSIGNED" \
    -r "$RESULT_JSON" \
    "$INPUT_APK"

echo ""
echo "=== Step 3/5: Zipalign ==="
"$ZIPALIGN" -f 4 "$OUTPUT_UNSIGNED" "$OUTPUT_ALIGNED"

echo ""
echo "=== Step 4/5: Sign APK ==="
"$APKSIGNER" sign \
    --ks "$KEYSTORE" \
    --ks-pass "pass:$PETALAA_KEYSTORE_PASS" \
    --ks-key-alias petalaa \
    --key-pass "pass:$PETALAA_KEYSTORE_PASS" \
    --out "$OUTPUT_PATCHED" \
    "$OUTPUT_ALIGNED"

echo ""
echo "=== Step 5/5: Verify signature ==="
"$APKSIGNER" verify --verbose --print-certs "$OUTPUT_PATCHED"

echo ""
echo "=============================================="
echo "✅ APK final: $OUTPUT_PATCHED"
echo "=============================================="