#!/usr/bin/env bash
set -euo pipefail

ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
AFFINE_ROOT=$(cd -- "$ROOT/.." && pwd)

INPUT=${1:-"$AFFINE_ROOT/AFFiNE_0.27.4_APKPure.xapk"}
OUTPUT=${2:-"$AFFINE_ROOT/AFFiNE_0.27.4_no-gms.apk"}
MORPHE_JAR="$AFFINE_ROOT/tools/morphe-desktop-1.15.0-all.jar"
MORPHE_URL="https://github.com/MorpheApp/morphe-desktop/releases/download/v1.15.0/morphe-desktop-1.15.0-all.jar"
MPP="$ROOT/patches/build/libs/patches-1.0.0.mpp"
KEYSTORE="$AFFINE_ROOT/affine-no-gms.keystore"
REPORT="$AFFINE_ROOT/AFFiNE_0.27.4_no-gms-result.json"

EXPECTED_INPUT_SHA256="daa36b4523e800990249ac8a996e388a09024147be54564b0df5504029525f0a"
EXPECTED_MORPHE_SHA256="727e3744aa5c0006474590de6f4041bd55edc59f3d6cb9b596e95f7116384506"

for command in awk chmod mkdir sha256sum; do
    command -v "$command" >/dev/null || {
        echo "$command is required" >&2
        exit 1
    }
done

verify_hash() {
    local path=$1
    local expected=$2
    local actual
    actual=$(sha256sum "$path" | awk '{print $1}')
    if [[ "$actual" != "$expected" ]]; then
        printf 'SHA-256 mismatch for %s\nExpected: %s\nActual:   %s\n' \
            "$path" "$expected" "$actual" >&2
        exit 1
    fi
}

run_java() {
    if command -v java >/dev/null; then
        "$@"
    elif command -v nix >/dev/null; then
        nix --extra-experimental-features "nix-command flakes" \
            shell nixpkgs#jdk21 -c "$@"
    else
        echo "Java 21+ is required (or Nix, which can provide it)." >&2
        exit 1
    fi
}

[[ -f "$INPUT" ]] || {
    echo "Input XAPK not found: $INPUT" >&2
    exit 1
}
verify_hash "$INPUT" "$EXPECTED_INPUT_SHA256"

"$ROOT/scripts/build.sh"

mkdir -p -- "$(dirname -- "$MORPHE_JAR")" "$(dirname -- "$OUTPUT")"
if [[ ! -f "$MORPHE_JAR" ]]; then
    command -v curl >/dev/null || {
        echo "curl is required to download Morphe Desktop." >&2
        exit 1
    }
    curl --fail --location --silent --show-error "$MORPHE_URL" --output "$MORPHE_JAR"
fi
verify_hash "$MORPHE_JAR" "$EXPECTED_MORPHE_SHA256"

run_java java -jar "$MORPHE_JAR" patch \
    --bytecode-mode=FULL \
    --exclusive \
    --patches="$MPP" \
    --enable="Remove Google requirements" \
    --keystore="$KEYSTORE" \
    --out="$OUTPUT" \
    --result-file="$REPORT" \
    "$INPUT"

# This key is required for updating an existing installation of the patched app.
chmod 600 "$KEYSTORE"

"$ROOT/scripts/verify-apk.sh" "$OUTPUT" "$INPUT"
echo "Patched APK: $OUTPUT"
echo "Patching report: $REPORT"
echo "Keep the update key private and backed up: $KEYSTORE"