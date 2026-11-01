#!/bin/bash
set -e

# Version of Stockfish to download
SF_VERSION="sf_19"

# Stockfish 19 ships a single "universal" arm64 binary that detects the CPU features
# (dotprod, i8mm, ...) at runtime and runs the fastest code path for the phone.
ARM64_ASSET="stockfish-android-arm64-universal"
ARM64_SHA256="ebb24051aa4a222b4daaf049b882ecf1163d370c128fe02316602643f4d5e426"
ARMV7_ASSET="stockfish-android-armv7-neon"
ARMV7_SHA256="47c34963f1cdf4a6af34c1b5294f7a4e2679b3eb52698c324855af2c6486024b"

BASE_URL="https://github.com/official-stockfish/Stockfish/releases/download/${SF_VERSION}"

echo "Downloading Stockfish ${SF_VERSION} binaries..."

TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

download() {
    local asset="$1" sha="$2"
    echo "Downloading ${asset}..."
    curl -fL --retry 3 -o "$TMP_DIR/${asset}.tar.gz" "${BASE_URL}/${asset}.tar.gz"
    echo "${sha}  $TMP_DIR/${asset}.tar.gz" | sha256sum -c -
    tar -xzf "$TMP_DIR/${asset}.tar.gz" -C "$TMP_DIR"
}

download "$ARM64_ASSET" "$ARM64_SHA256"
download "$ARMV7_ASSET" "$ARMV7_SHA256"

PATHS=(
    "patches/src/main/resources/stockfish"
)

for path in "${PATHS[@]}"; do
    echo "Placing binaries in $path..."
    mkdir -p "$path/arm64-v8a" "$path/armeabi-v7a"
    cp "$TMP_DIR/stockfish/${ARM64_ASSET}" "$path/arm64-v8a/stockfish"
    cp "$TMP_DIR/stockfish/${ARMV7_ASSET}" "$path/armeabi-v7a/stockfish"
    chmod +x "$path/arm64-v8a/stockfish" "$path/armeabi-v7a/stockfish"
done

echo "Stockfish binaries installed successfully!"
