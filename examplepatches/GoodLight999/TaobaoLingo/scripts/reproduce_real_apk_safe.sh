#!/usr/bin/env bash
# Reproduce the exact original / Morphe zero-patch / DinamicX-only APK
# experiment on the user's host. Keep original proprietary APK local.
set -euo pipefail
umask 077

if [[ $# != 4 ]]; then
  echo 'Usage: reproduce_real_apk_safe.sh original.apk morphe-desktop-1.19.0-all.jar patches-0.1.0.mpp output-directory' >&2
  exit 2
fi

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ORIGINAL="$(realpath "$1")"
DESKTOP="$(realpath "$2")"
MPP="$(realpath "$3")"
mkdir -p "$4"
OUT="$(cd "$4" && pwd)"
EXPECTED='3e709717a60fdeeb59354df60fb6cf279ffb023c01e095e16bccfbad75f683dd'
EXPECTED_PATCH='TaobaoLingo: Native DinamicX English labels (experimental)'

for bin in sha256sum java javac keytool python3 apksigner; do
  command -v "$bin" >/dev/null || { echo "Missing tool: $bin" >&2; exit 2; }
done
for path in "$ORIGINAL" "$DESKTOP" "$MPP"; do
  [[ -s "$path" ]] || { echo "Missing input: $path" >&2; exit 2; }
done
SOURCE_SHA="$(sha256sum "$ORIGINAL" | cut -d ' ' -f1)"
[[ "$SOURCE_SHA" == "$EXPECTED" ]] || {
  echo "Wrong original APK SHA256: $SOURCE_SHA" >&2
  exit 2
}
KEY="$OUT/diagnostic-only.p12"
if [[ -e "$KEY" ]]; then
  echo 'Refusing to reuse pre-existing diagnostic key/output directory' >&2
  exit 2
fi
# One ephemeral identity shared across BOTH modified/control variants.
# Never commit/output this key in a report or upload it to GitHub.
keytool -genkeypair -storetype PKCS12 -keystore "$KEY" \
  -storepass DiagnosticOnly -keypass DiagnosticOnly -alias diagnostic \
  -keyalg RSA -keysize 2048 -validity 3 \
  -dname 'CN=TaobaoLingo Offline Diagnostic Only' -noprompt \
  >"$OUT/keytool.log" 2>&1

build_variant() {
  local name="$1" enable="$2"
  local unsigned="$OUT/$name-unsigned.apk"
  local signed="$OUT/$name.apk"
  local log="$OUT/$name-morphe.log"
  local args=(patch "$ORIGINAL" --unsigned --exclusive \
    --bytecode-mode=STRIP_SAFE "-p=$MPP" "-o=$unsigned" \
    "-r=$OUT/$name-morphe-result.json")
  if [[ "$enable" == 'native' ]]; then
    args+=("-e=$EXPECTED_PATCH")
  fi
  # Executing the real Patcher 2.0 .mpp, not a legacy translated adapter.
  java -Xmx3900m -jar "$DESKTOP" "${args[@]}" >"$log" 2>&1 || {
    tail -n 80 "$log" >&2
    exit 1
  }
  [[ -s "$unsigned" ]] || { echo "No unsigned output $unsigned" >&2; exit 1; }
  apksigner sign --ks "$KEY" --ks-type PKCS12 \
    --ks-pass pass:DiagnosticOnly --ks-key-alias diagnostic \
    --key-pass pass:DiagnosticOnly \
    --v1-signing-enabled true --v2-signing-enabled true \
    --v3-signing-enabled true --out "$signed" "$unsigned"
  apksigner verify --verbose --print-certs "$signed" \
    >"$OUT/$name-signature.log"
  rm "$unsigned"
}
build_variant control 'none'
build_variant native 'native'

mkdir -p "$OUT/java"
javac -cp "$DESKTOP" -d "$OUT/java" \
  "$ROOT/tests/VerifyDinamicXNativeLabels.java" \
  "$ROOT/tests/AnalyzeDinamicXRoutes.java"
java -Xmx3500m -cp "$OUT/java:$DESKTOP" \
  VerifyDinamicXNativeLabels "$ORIGINAL" "$OUT/native.apk" \
  > "$OUT/native-dex-verified.log"
java -Xmx3500m -cp "$OUT/java:$DESKTOP" \
  AnalyzeDinamicXRoutes "$ORIGINAL" "$OUT/native-callpaths.md"
python3 "$ROOT/scripts/triage_apk_variants.py" \
  "$ORIGINAL" "$OUT/control.apk" "$OUT/native.apk" \
  --strict-original-hash --strict-control --strict-native \
  --json-out "$OUT/triage.json" --markdown-out "$OUT/triage.md"
sha256sum "$ORIGINAL" "$OUT/control.apk" "$OUT/native.apk" \
  > "$OUT/hashes.txt"
echo "OFFLINE PASS: official signatures, unchanged control resources/code, exactly four changed methods."
echo "NOT TESTED: Android ARM64 installation, login, Account tab, or real Taobao UI English."
echo "Output: $OUT"
