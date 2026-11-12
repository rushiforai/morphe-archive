#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/../lib/common.sh"
[[ $# -eq 2 ]] || fail 'Usage: build-android12-fixtures.sh GOOGLE_API30_APK GEMINI_API29_APK'
google="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
gemini="$(cd "$(dirname "$2")" && pwd)/$(basename "$2")"
python3 - "$google" "$gemini" <<'PY'
import hashlib, pathlib, sys
expected = ['a269697a169ce4420b3873d89c9bd0f6c400d793b5cb9c2e2603a476a6a316ac',
            '793fdf8cdaf56729b9f63b1a3895b4a2c0284c38adbb2f638bf727ef491ff9be']
for filename, digest in zip(sys.argv[1:], expected):
    assert hashlib.file_digest(open(filename, 'rb'), 'sha256').hexdigest() == digest, filename
print('Original Android 12-compatible variant hashes verified')
PY
fixture="$ROOT/local/issue8/api31/build"
mkdir -p "$fixture/baseline-src" "$fixture/dist"
"$ROOT/scripts/compile-patches.sh"
git -C "$ROOT" archive v0.3.0 src/main/kotlin | tar -x -C "$fixture/baseline-src"
"$KOTLINC" "$fixture/baseline-src/src/main/kotlin" -cp "$MORPHE" -d "$fixture/baseline-patches.jar"
for name in google gemini; do
  input="$google"
  [[ "$name" != gemini ]] || input="$gemini"
  "$ROOT/scripts/patch-apk.sh" "$input" "$fixture/$name-login-unsigned.apk" "$fixture/$name.json" \
    -p "$BUILD_DIR/gemini-patches.jar"
  "$ROOT/scripts/verify-clone-contract.sh" "$input" "$fixture/$name-login-unsigned.apk"
done
"$ROOT/scripts/patch-apk.sh" "$google" "$fixture/baseline-unsigned.apk" "$fixture/baseline.json" \
  -p "$fixture/baseline-patches.jar" -p "$PATCHES" -e 'Clone app' \
  -O packageName=Default -O updatePermissions=true -O updateProviders=true
"$ROOT/scripts/patch-apk.sh" "$google" "$fixture/bad-unsigned.apk" "$fixture/bad.json" \
  --exclusive -p "$BUILD_DIR/gemini-patches.jar" -e 'Google App Manifest Tweaks' \
  -p "$PATCHES" -e 'Clone app' -O packageName=com.quicksearch.bond -O updatePermissions=false -O updateProviders=true
for name in VerifyDexBranches VerifyWorkProfile VerifyCompliance VerifyTrampoline VerifyProcessName VerifyGeminiManifest; do
  "$KOTLINC" "$ROOT/scripts/kotlin/$name.kt" -cp "$MORPHE:$BUILD_DIR/gemini-patches.jar" -d "$BUILD_DIR/$name.jar"
done
classpath="$MORPHE:$BUILD_DIR/gemini-patches.jar"
"$JAVA" -cp "$BUILD_DIR/VerifyDexBranches.jar:$classpath" VerifyDexBranchesKt "$fixture/google-login-unsigned.apk"
for name in VerifyWorkProfile VerifyCompliance VerifyTrampoline; do
  "$JAVA" -cp "$BUILD_DIR/$name.jar:$classpath" "${name}Kt" "$google" "$fixture/google-login-unsigned.apk"
done
"$JAVA" -cp "$BUILD_DIR/VerifyProcessName.jar:$classpath" VerifyProcessNameKt "$fixture/google-login-unsigned.apk"
"$JAVA" -cp "$BUILD_DIR/VerifyGeminiManifest.jar:$classpath" VerifyGeminiManifestKt "$fixture/gemini-login-unsigned.apk"
: "${GEMINIPATCH_STORE_PASS:?Set local signing environment first}"
export GEMINIPATCH_STORE_PASS
key="${KEYSTORE_PATH:-local/keys/gemini-release.p12}"
[[ "$key" = /* ]] || key="$ROOT/$key"
for name in google-login gemini-login baseline bad; do
  "$ANDROID_HOME/build-tools/36.0.0/apksigner" sign --ks "$key" --ks-key-alias "${KEY_ALIAS:-geminipatch}" \
    --ks-pass env:GEMINIPATCH_STORE_PASS --key-pass env:GEMINIPATCH_STORE_PASS \
    --out "$fixture/dist/$name.apk" "$fixture/$name-unsigned.apk"
  "$ANDROID_HOME/build-tools/36.0.0/apksigner" verify "$fixture/dist/$name.apk"
done
printf 'Android 12 test APKs only: %s\n' "$fixture/dist"
