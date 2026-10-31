#!/usr/bin/env bash
# ==============================================================================
# Build the Clipboard History Morphe patch bundle (.mpp).
#
#   ./scripts/build-mpp.sh                  # rebuild classes + bundle
#   ./scripts/build-mpp.sh --rebuild-extension
#
# Output: patches/GboardClipboardHistory.mpp
# ==============================================================================

set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib/common.sh"

REBUILD_EXTENSION=false
while [[ $# -gt 0 ]]; do
    case "$1" in
        --rebuild-extension) REBUILD_EXTENSION=true; shift ;;
        -h|--help) sed -n '2,10p' "$0"; exit 0 ;;
        *) die "unknown argument: $1" ;;
    esac
done

init_tools

"$SCRIPTS_DIR/check-release-metadata.sh"

KOTLINC_BIN="${KOTLINC_BIN:-$(find_kotlinc || true)}"
[[ -n "$KOTLINC_BIN" ]] || die "kotlinc not found (set KOTLINC or install the sibling PixelBoard checkout)"
[[ -n "$D8_BIN" ]]       || die "d8 not found (Android SDK build-tools)"
[[ -n "$ANDROID_JAR" ]] || die "android.jar not found (Android SDK platform)"

EXT_OUT="$BUILD_DIR/extension"
PATCH_CLASSES="$BUILD_DIR/patchclasses"
PATCH_DEX="$BUILD_DIR/patchdex"
MPP_STAGE="$BUILD_DIR/mpp"
VERSION="$(grep -E '^version\s*=' "$PROJECT_ROOT/gradle.properties" | cut -d'=' -f2 | tr -d ' ')"

log "1/5 extension (.rve dex)"
mkdir -p "$EXT_OUT"
EXT_SOURCES="$PROJECT_ROOT/extensions/extension/src/main/java"
NEEDS_EXT_BUILD=false
if [[ "$REBUILD_EXTENSION" == true || ! -f "$EXT_OUT/classes.dex" ]]; then
    NEEDS_EXT_BUILD=true
else
    # rebuild when any extension source is newer than the compiled dex
    while IFS= read -r source; do
        if [[ "$source" -nt "$EXT_OUT/classes.dex" ]]; then
            NEEDS_EXT_BUILD=true
            break
        fi
    done < <(find "$EXT_SOURCES" -name "*.java")
fi

if [[ "$NEEDS_EXT_BUILD" == true ]]; then
    find "$EXT_SOURCES" -name "*.java" > "$BUILD_DIR/extension-sources.txt"
    rm -rf "$EXT_OUT/classes" && mkdir -p "$EXT_OUT/classes"
    javac -nowarn -encoding UTF-8 -d "$EXT_OUT/classes" -cp "$ANDROID_JAR" "@$BUILD_DIR/extension-sources.txt"
    jar cf "$EXT_OUT/ext.jar" -C "$EXT_OUT/classes" .
    "$D8_BIN" --release --min-api 29 --lib "$ANDROID_JAR" --output "$EXT_OUT" "$EXT_OUT/ext.jar"
    echo "    built $EXT_OUT/classes.dex"
else
    echo "    (unchanged, reusing)"
fi

log "2/5 patch module (kotlinc)"
rm -rf "$PATCH_CLASSES" && mkdir -p "$PATCH_CLASSES"
find "$PROJECT_ROOT/patches/src/main/kotlin" -name "*.kt" > "$BUILD_DIR/patch-sources.txt"
"$KOTLINC_BIN" -nowarn -Xcontext-parameters \
    -cp "$PATCHER_JAR" \
    -d "$PATCH_CLASSES" "@$BUILD_DIR/patch-sources.txt"

log "3/5 patch dex"
rm -rf "$PATCH_DEX" && mkdir -p "$PATCH_DEX"
"$D8_BIN" --release --min-api 29 --lib "$PATCHER_JAR" --output "$PATCH_DEX" \
    $(find "$PATCH_CLASSES" -name "*.class")

log "4/5 assemble .mpp"
rm -rf "$MPP_STAGE" && mkdir -p "$MPP_STAGE/extensions" "$MPP_STAGE/META-INF"

# The bundle metadata lives in one place. The Gradle build reads the same file
# for its about block, so the two bundle paths cannot drift apart.
ABOUT_FILE="$PROJECT_ROOT/patches/about.properties"
[[ -f "$ABOUT_FILE" ]] || die "missing patch metadata: $ABOUT_FILE"
about_value() {
    local value
    value="$(sed -n "s/^$1=//p" "$ABOUT_FILE" | head -1)"
    [[ -n "$value" ]] || die "patch metadata is missing the '$1' key: $ABOUT_FILE"
    printf '%s' "$value"
}

cat > "$MPP_STAGE/META-INF/MANIFEST.MF" <<EOF
Manifest-Version: 1.0
Name: $(about_value name)
Description: $(about_value description)
Version: $VERSION
Timestamp: $(date +%s000)
Source: $(about_value source)
Author: $(about_value author)
Contact: $(about_value contact)
Website: $(about_value website)
License: $(about_value license)
Patcher-Version: 1.8.0
EOF
cp "$PATCH_DEX/classes.dex" "$MPP_STAGE/classes.dex"
cp "$EXT_OUT/classes.dex" "$MPP_STAGE/extensions/gboard-clipboard-extension.rve"
if [[ -f "$PATCH_CLASSES/META-INF/main.kotlin_module" ]]; then
    cp "$PATCH_CLASSES/META-INF/main.kotlin_module" "$MPP_STAGE/META-INF/patches.kotlin_module"
fi
cp -R "$PATCH_CLASSES/com" "$MPP_STAGE/com"
cp "$PROJECT_ROOT/patches-list.json" "$PROJECT_ROOT/patches-bundle.json" "$MPP_STAGE/"
mkdir -p "$(dirname "$MPP_OUT")"
rm -f "$MPP_OUT"
(cd "$MPP_STAGE" && zip -q -r -X "$MPP_OUT" .)

echo "    built $MPP_OUT ($(du -h "$MPP_OUT" | cut -f1))"
log "5/5 skipped (no target APK requested)"
echo "Next: ./scripts/build-gboard-clipboard.sh | ./scripts/build-gboard-clipboard-pixelboard.sh | ./scripts/build-pixelboard-clipboard.sh"
