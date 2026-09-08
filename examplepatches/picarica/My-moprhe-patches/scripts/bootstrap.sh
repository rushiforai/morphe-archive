#!/usr/bin/env bash
set -euo pipefail

ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
DEPS="$ROOT/.build-deps"

clone_pinned() {
    local repo=$1
    local tag=$2
    local commit=$3
    local destination=$4

    if [[ ! -d "$destination/.git" ]]; then
        rm -rf -- "$destination"
        git clone --depth=1 --branch "$tag" "$repo" "$destination"
    fi

    local actual
    actual=$(git -C "$destination" rev-parse HEAD)
    if [[ "$actual" != "$commit" ]]; then
        printf 'Unexpected commit in %s\nExpected: %s\nActual:   %s\n' \
            "$destination" "$commit" "$actual" >&2
        exit 1
    fi
}

command -v git >/dev/null || {
    echo "git is required" >&2
    exit 1
}

mkdir -p -- "$DEPS"
clone_pinned \
    https://github.com/MorpheApp/morphe-patches-gradle-plugin.git \
    v1.3.4 \
    a230c33f7eca1e18b07bf1114ca850421520f98d \
    "$DEPS/morphe-patches-gradle-plugin"
clone_pinned \
    https://github.com/MorpheApp/morphe-patcher.git \
    v1.12.0 \
    ac0d688eaacb7ece80b65ebf719b252f69455783 \
    "$DEPS/morphe-patcher"

echo "Pinned Morphe build dependencies are ready."