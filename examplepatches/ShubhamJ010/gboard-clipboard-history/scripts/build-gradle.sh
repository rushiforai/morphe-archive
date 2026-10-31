#!/usr/bin/env bash
# ==============================================================================
# Gradle based build of the Morphe patch bundle (.mpp).
#
#   ./scripts/build-gradle.sh
#
# The `app.morphe.patches` plugin is resolved from GitHub Packages, so a
# GITHUB_TOKEN is required:
#   GITHUB_TOKEN=... ./scripts/build-gradle.sh
#
# Prefer ./scripts/build-mpp.sh for local, credential free builds.
# ==============================================================================

set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib/common.sh"

cd "$PROJECT_ROOT"

"$SCRIPTS_DIR/check-release-metadata.sh"

PATCH_VERSION=$(grep -E "^version\s*=" gradle.properties | cut -d'=' -f2 | tr -d ' ')
MPP_PATH="$MPP_OUT"

if [[ ! -f "$MPP_PATH" ]]; then
    log "compiling Gboard Clipboard History patch bundle"
    ./gradlew :patches:buildAndroid
    COMPILED_MPP="patches/build/libs/patches-${PATCH_VERSION}.mpp"
    if [[ ! -f "$COMPILED_MPP" ]]; then
        COMPILED_MPP=$(ls patches/build/libs/*.mpp 2>/dev/null | grep -v javadoc | grep -v sources | head -n 1 || true)
    fi
    [[ -f "$COMPILED_MPP" ]] || die "patch bundle failed to build at patches/build/libs/"
    mkdir -p "$(dirname "$MPP_PATH")"
    cp "$COMPILED_MPP" "$MPP_PATH"
    log "patch bundle saved to $MPP_PATH"
else
    log "patch bundle already present: $MPP_PATH"
fi

log "done. Patch an APK with: ./scripts/build-gboard-clipboard.sh"
