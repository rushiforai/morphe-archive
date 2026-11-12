#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
[[ $# -eq 2 ]] || fail "Usage: $0 ORIGINAL_APK PATCHED_APK"
require_file "$1"
require_file "$2"
require_file "$BUILD_DIR/gemini-patches.jar"
"$KOTLINC" "$ROOT/scripts/kotlin/VerifyCloneContract.kt" -cp "$MORPHE:$BUILD_DIR/gemini-patches.jar" -d "$BUILD_DIR/VerifyCloneContract.jar"
"$JAVA" -cp "$BUILD_DIR/VerifyCloneContract.jar:$MORPHE:$BUILD_DIR/gemini-patches.jar" VerifyCloneContractKt "$@"
