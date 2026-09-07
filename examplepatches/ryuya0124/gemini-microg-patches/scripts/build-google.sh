#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
"$ROOT/scripts/check-inputs.sh"
"$ROOT/scripts/compile-patches.sh"
require_file "$PATCHES"
cd "$BUILD_DIR"
"$JAVA" -Xmx6g -jar "$MORPHE" patch "$ROOT/inputs/google-base.apk" \
  -p "$BUILD_DIR/gemini-patches.jar" -p "$PATCHES" \
  -e 'Clone app' -O updatePermissions=true -O updateProviders=true \
  --unsigned -o "$BUILD_DIR/google-login-unsigned.apk" -r "$BUILD_DIR/google-patch-result.json"
"$ROOT/scripts/verify-apks.sh"
