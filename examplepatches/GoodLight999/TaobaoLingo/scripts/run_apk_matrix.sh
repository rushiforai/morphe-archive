#!/usr/bin/env bash
# Reproduce original / re-sign-only / native-label-patched Taobao variants
# under BOTH STRIP_SAFE and FULL, signed with one disposable test identity.
# Requires the private original Taobao APK locally; never uploads that APK.
set -euo pipefail
umask 077

if [[ $# -ne 3 ]]; then
  echo "Usage: $0 original-10.66.30.apk morphe-desktop-1.18.1-all.jar output-dir" >&2
  exit 2
fi
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ORIGINAL="$(realpath "$1")"
DESKTOP="$(realpath "$2")"
OUTPUT="$(mkdir -p "$3" && cd "$3" && pwd)"
BUNDLE="$OUTPUT/taobaolingo-legacy.mpp"
SIGNING_KEY="$OUTPUT/diagnostic-signing.p12"
EXPECTED="3e709717a60fdeeb59354df60fb6cf279ffb023c01e095e16bccfbad75f683dd"

for tool in java javac keytool kotlinc python3 sha256sum apksigner; do
  command -v "$tool" >/dev/null || { echo "Missing tool: $tool" >&2; exit 2; }
done
[[ -s "$ORIGINAL" && -s "$DESKTOP" ]] || { echo "APK or Morphe Desktop JAR missing" >&2; exit 2; }
digest="$(sha256sum "$ORIGINAL" | cut -d ' ' -f 1)"
[[ "$digest" == "$EXPECTED" ]] || {
  echo "Refusing unexpected original APK hash: $digest" >&2; exit 2;
}

python3 "$ROOT/scripts/build_legacy_cli.py" --desktop-jar "$DESKTOP" --out "$BUNDLE"

# Deliberately disposable identity, same key for all outputs.
# This is NOT the Taobao original signer and never authorizes successful login.
[[ ! -e "$SIGNING_KEY" ]] || {
  echo "Output signing key already exists. Use a new output directory." >&2; exit 2;
}
keytool -genkeypair -storetype PKCS12 -keystore "$SIGNING_KEY" \
  -storepass Morphe -keypass Morphe -alias Morphe -keyalg RSA \
  -keysize 2048 -validity 2 -dname "CN=TaobaoLingo Test" -noprompt \
  >"$OUTPUT/keytool.log" 2>&1

mkdir -p "$OUTPUT/classes"
javac -cp "$DESKTOP" -d "$OUTPUT/classes" \
  "$ROOT/tests/VerifyDinamicXNativeLabels.java" \
  "$ROOT/tests/AnalyzeDinamicXRoutes.java"

patch_variant() {
  local mode="$1" patch="$2" out="$3"
  local path="$OUTPUT/$out.apk" log="$OUTPUT/$out.log"
  local unsigned="$OUTPUT/$out-unsigned.apk"
  # Do not rely on Morphe's PKCS12->BKS alias conversion: that path has
  # failed even when the correct alias/password are explicitly supplied.
  local args=(patch "$ORIGINAL" --exclusive "--bytecode-mode=$mode"
    "-p=$BUNDLE" "-o=$unsigned" "--unsigned")
  if [[ "$patch" == "native" ]]; then
    args+=("-e=TaobaoLingo: Native DinamicX English labels (experimental)")
  fi
  echo "Building $out (mode=$mode, patch=$patch)"
  if ! java -jar "$DESKTOP" "${args[@]}" >"$log" 2>&1; then
    tail -n 90 "$log" >&2
    exit 1
  fi
  [[ -s "$unsigned" ]] || { echo "Missing unsigned output: $unsigned" >&2; exit 1; }
  apksigner sign --ks "$SIGNING_KEY" --ks-pass pass:Morphe \
    --ks-key-alias Morphe --key-pass pass:Morphe \
    --v1-signing-enabled true --v2-signing-enabled true --v3-signing-enabled true \
    --out "$path" "$unsigned" >>"$log" 2>&1
  apksigner verify --verbose --print-certs "$path" >>"$log" 2>&1
  [[ -s "$path" ]] || { echo "Missing signed output: $path" >&2; exit 1; }
  rm -f "$unsigned"
}

patch_variant STRIP_SAFE none control-safe
patch_variant STRIP_SAFE native native-safe
patch_variant FULL none control-full
patch_variant FULL native native-full

python3 "$ROOT/scripts/triage_apk_variants.py" \
  "$ORIGINAL" "$OUTPUT/control-safe.apk" "$OUTPUT/native-safe.apk" \
  --strict-original-hash --strict-control --strict-native \
  --json-out "$OUTPUT/triage-safe.json" \
  --markdown-out "$OUTPUT/triage-safe.md"
python3 "$ROOT/scripts/triage_apk_variants.py" \
  "$ORIGINAL" "$OUTPUT/control-full.apk" "$OUTPUT/native-full.apk" \
  --strict-original-hash --strict-native \
  --json-out "$OUTPUT/triage-full.json" \
  --markdown-out "$OUTPUT/triage-full.md"

java -cp "$OUTPUT/classes:$DESKTOP" VerifyDinamicXNativeLabels \
  "$ORIGINAL" "$OUTPUT/native-safe.apk" >"$OUTPUT/verified-native-safe.log"
java -cp "$OUTPUT/classes:$DESKTOP" VerifyDinamicXNativeLabels \
  "$ORIGINAL" "$OUTPUT/native-full.apk" >"$OUTPUT/verified-native-full.log"
java -cp "$OUTPUT/classes:$DESKTOP" AnalyzeDinamicXRoutes \
  "$ORIGINAL" "$OUTPUT/dinamicx-original-callpaths.md"

python3 "$ROOT/scripts/inspect_native_elf.py" "$ORIGINAL" \
  --filter 'dinamic|dx|security|sg|umid|login|user|alipay|mtop' \
  --json-out "$OUTPUT/original-native-jni.json"

sha256sum "$ORIGINAL" "$OUTPUT/"{control-safe,native-safe,control-full,native-full}.apk \
  > "$OUTPUT/apk-sha256.txt"
echo "PASS: offline build/DEX/content checks. Device runtime and UI remain untested."
echo "Reports and per-variant build logs are in $OUTPUT"
