#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
"$ROOT/scripts/build-google.sh"
cd "$BUILD_DIR"
"$ROOT/scripts/patch-apk.sh" "$ROOT/inputs/gemini-base.apk" "$BUILD_DIR/gemini-login-unsigned.apk" "$BUILD_DIR/gemini-patch-result.json" \
  -p "$BUILD_DIR/gemini-patches.jar"
"$KOTLINC" "$ROOT/scripts/kotlin/PatchSplit.kt" -cp "$MORPHE" -d "$BUILD_DIR/patch-split.jar"
"$JAVA" -cp "$BUILD_DIR/patch-split.jar:$MORPHE" PatchSplitKt "$ROOT/inputs/google-xxhdpi.apk" "$BUILD_DIR/split_config.xxhdpi-unsigned.apk"
printf '%s\n' 'All unsigned APKs built. Next: scripts/sign-apks.sh'

"$KOTLINC" "$ROOT/scripts/kotlin/VerifyGeminiManifest.kt" -cp "$MORPHE" -d "$BUILD_DIR/VerifyGeminiManifest.jar"
"$JAVA" -cp "$BUILD_DIR/VerifyGeminiManifest.jar:$MORPHE" VerifyGeminiManifestKt "$BUILD_DIR/gemini-login-unsigned.apk"
"$ROOT/scripts/verify-clone-contract.sh" "$ROOT/inputs/gemini-base.apk" "$BUILD_DIR/gemini-login-unsigned.apk"
