#!/usr/bin/env bash
set -euo pipefail

ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
VERSION=$(sed -n 's/^version = //p' "$ROOT/gradle.properties")
GRADLE_ARGS=(clean test buildAndroid --no-daemon)

"$ROOT/scripts/bootstrap.sh"

# The pinned local source builds replace the authenticated GitHub Packages artifacts,
# but the Gradle settings plugin still requires non-null credential properties while
# configuring its unused repository.
GRADLE_ARGS+=(
    -Pgpr.user=local-source-build
    -Pgpr.key=local-source-build
)

if command -v java >/dev/null; then
    (cd -- "$ROOT" && ./gradlew "${GRADLE_ARGS[@]}")
elif command -v nix >/dev/null; then
    (cd -- "$ROOT" && nix --extra-experimental-features "nix-command flakes" \
        shell nixpkgs#jdk21 -c ./gradlew "${GRADLE_ARGS[@]}")
else
    echo "Java 21+ is required (or Nix, which can provide it)." >&2
    exit 1
fi

echo "Patch bundle: $ROOT/patches/build/libs/patches-$VERSION.mpp"
