#!/usr/bin/env bash
# Runs ./gradlew inside the podman build image, building the image first if it is missing.
#
#   container/gradlew.sh buildAndroid generatePatchesList
#   REBUILD_IMAGE=1 container/gradlew.sh buildAndroid
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
image="localhost/maps-patches-build:latest"

if [[ -n "${REBUILD_IMAGE:-}" ]] || ! podman image exists "$image"; then
    podman build -t "$image" -f "$root/container/Containerfile" "$root"
fi

# The Gradle cache lives in a named volume so dependencies are downloaded once.
# The Morphe settings plugin requires GitHub credentials to be set even though every
# Morphe artifact resolves from the image's local Maven repository.
exec podman run --rm \
    -v "$root:/work:z" \
    -v maps-patches-gradle:/root/.gradle \
    -e GITHUB_ACTOR=unused \
    -e GITHUB_TOKEN=unused \
    "$image" ./gradlew --no-daemon "$@"
