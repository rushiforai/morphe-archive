#!/usr/bin/env bash
set -euo pipefail

ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
VERSION=$(sed -n 's/^version = //p' "$ROOT/gradle.properties")

"$ROOT/scripts/bootstrap.sh"

if command -v java >/dev/null; then
    (cd -- "$ROOT" && ./gradlew clean test generatePatchesList --no-daemon)
elif command -v nix >/dev/null; then
    (cd -- "$ROOT" && nix --extra-experimental-features "nix-command flakes" \
        shell nixpkgs#jdk21 -c ./gradlew clean test generatePatchesList --no-daemon)
else
    echo "Java 21+ is required (or Nix, which can provide it)." >&2
    exit 1
fi

python3 "$ROOT/scripts/validate-release-metadata.py"
echo "Patch bundle: $ROOT/patches/build/libs/patches-$VERSION.mpp"
