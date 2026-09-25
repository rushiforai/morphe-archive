#!/usr/bin/env bash
set -euo pipefail

ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
PROJECT_ROOT=$(cd -- "$ROOT/.." && pwd)
VERSION=$(sed -n 's/^version = //p' "$ROOT/gradle.properties")

INPUT=${1:-"$PROJECT_ROOT/Stick+War_+Legacy_2026.1.983_APKPure.xapk"}
OUTPUT=${2:-"$PROJECT_ROOT/Stick+War_+Legacy_2026.1.983_no-play.apk"}
MORPHE_JAR="$PROJECT_ROOT/tools/morphe-desktop-1.17.0-all.jar"
MORPHE_URL="https://github.com/MorpheApp/morphe-desktop/releases/download/v1.17.0/morphe-desktop-1.17.0-all.jar"
MPP="$ROOT/patches/build/libs/patches-$VERSION.mpp"
KEYSTORE="$PROJECT_ROOT/stick-war-no-play.keystore"
REPORT="$PROJECT_ROOT/Stick+War_+Legacy_2026.1.983_no-play-result.json"

EXPECTED_INPUT_SHA256="dc51f432633fb727715d318ae544fa1319e53f6676893c198c46e41ad574c561"
EXPECTED_MORPHE_SHA256="8cf6a9eab4ee9dab146bddc24681897851564f53116baec11f36ba2fa2f589be"

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
    --enable="Remove Google Play requirement" \
    --keystore="$KEYSTORE" \
    --out="$OUTPUT" \
    --result-file="$REPORT" \
    "$INPUT"

# This key is required for updating an existing installation of the patched game.
chmod 600 "$KEYSTORE"

"$ROOT/scripts/verify-stick-war-apk.sh" "$OUTPUT" "$INPUT"
echo "Patched APK: $OUTPUT"
echo "Patching report: $REPORT"
echo "Keep the update key private and backed up: $KEYSTORE"