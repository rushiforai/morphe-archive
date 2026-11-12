#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
"$ROOT/scripts/check-inputs.sh"
"$ROOT/scripts/compile-patches.sh"
cd "$BUILD_DIR"
"$ROOT/scripts/patch-apk.sh" "$ROOT/inputs/google-base.apk" "$BUILD_DIR/google-login-unsigned.apk" "$BUILD_DIR/google-patch-result.json" \
  -p "$BUILD_DIR/gemini-patches.jar"
"$ROOT/scripts/verify-apks.sh"
