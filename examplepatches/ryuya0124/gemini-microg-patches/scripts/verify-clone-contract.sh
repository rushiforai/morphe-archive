#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
[[ $# -eq 2 || ( $# -eq 3 && "$3" = --update-blocked ) ]] || fail "Usage: $0 ORIGINAL_APK PATCHED_APK [--update-blocked]"
require_file "$1"
require_file "$2"
require_file "$BUILD_DIR/gemini-patches.jar"
if [[ $# -eq 3 ]]; then
  "$KOTLINC" "$ROOT/scripts/kotlin/VerifyUpdateCompatibility.kt" -cp "$MORPHE" -d "$BUILD_DIR/VerifyUpdateCompatibility.jar"
  "$JAVA" -cp "$BUILD_DIR/VerifyUpdateCompatibility.jar:$MORPHE" VerifyUpdateCompatibilityKt "$2" --required
fi
"$KOTLINC" "$ROOT/scripts/kotlin/VerifyCloneContract.kt" -cp "$MORPHE:$BUILD_DIR/gemini-patches.jar" -d "$BUILD_DIR/VerifyCloneContract.jar"
"$JAVA" -cp "$BUILD_DIR/VerifyCloneContract.jar:$MORPHE:$BUILD_DIR/gemini-patches.jar" VerifyCloneContractKt "$@"
