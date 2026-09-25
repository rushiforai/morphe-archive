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
        git -C "$destination" fetch --depth=1 origin "refs/tags/$tag:refs/tags/$tag"
        git -C "$destination" checkout --detach "$commit"
        actual=$(git -C "$destination" rev-parse HEAD)
    fi
    if [[ "$actual" != "$commit" ]]; then
        printf 'Unable to pin %s\nExpected: %s\nActual:   %s\n' \
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
    v1.14.1 \
    6f189f9ffb448ae32ceaf6c136c9d84d9a7ed274 \
    "$DEPS/morphe-patcher"

echo "Pinned Morphe build dependencies are ready."