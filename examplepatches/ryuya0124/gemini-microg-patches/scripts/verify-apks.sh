#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
for name in VerifyDexBranches VerifyWorkProfile VerifyCompliance VerifyTrampoline VerifyProcessName VerifyPermissionSetup VerifyUpdateCompatibility; do
  "$KOTLINC" "$ROOT/scripts/kotlin/$name.kt" -cp "$MORPHE:$BUILD_DIR/gemini-patches.jar" -d "$BUILD_DIR/$name.jar"
done
"$JAVA" -cp "$BUILD_DIR/VerifyDexBranches.jar:$MORPHE:$BUILD_DIR/gemini-patches.jar" VerifyDexBranchesKt "$BUILD_DIR/google-login-unsigned.apk"
"$JAVA" -cp "$BUILD_DIR/VerifyWorkProfile.jar:$MORPHE:$BUILD_DIR/gemini-patches.jar" VerifyWorkProfileKt "$ROOT/inputs/google-base.apk" "$BUILD_DIR/google-login-unsigned.apk"
"$JAVA" -cp "$BUILD_DIR/VerifyCompliance.jar:$MORPHE:$BUILD_DIR/gemini-patches.jar" VerifyComplianceKt "$ROOT/inputs/google-base.apk" "$BUILD_DIR/google-login-unsigned.apk"
"$JAVA" -cp "$BUILD_DIR/VerifyTrampoline.jar:$MORPHE:$BUILD_DIR/gemini-patches.jar" VerifyTrampolineKt "$ROOT/inputs/google-base.apk" "$BUILD_DIR/google-login-unsigned.apk"
"$ROOT/scripts/verify-clone-contract.sh" "$ROOT/inputs/google-base.apk" "$BUILD_DIR/google-login-unsigned.apk"
"$JAVA" -cp "$BUILD_DIR/VerifyProcessName.jar:$MORPHE:$BUILD_DIR/gemini-patches.jar" VerifyProcessNameKt "$BUILD_DIR/google-login-unsigned.apk"
"$JAVA" -cp "$BUILD_DIR/VerifyPermissionSetup.jar:$MORPHE:$BUILD_DIR/gemini-patches.jar" VerifyPermissionSetupKt "$BUILD_DIR/google-login-unsigned.apk"
"$JAVA" -cp "$BUILD_DIR/VerifyUpdateCompatibility.jar:$MORPHE:$BUILD_DIR/gemini-patches.jar" VerifyUpdateCompatibilityKt "$BUILD_DIR/google-login-unsigned.apk"
