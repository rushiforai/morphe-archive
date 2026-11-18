#!/usr/bin/env bash
# Follows the app versions nl-morphe-patches targets: reads WazeConstants.kt and the Google Maps
# Constants.kt at NL's newest release tag and moves upstream.lock to them. Only a new Waze or Maps
# version is written, so NL releases that keep the same versions do not trigger a rebuild.
# Prints "changed" or "unchanged".
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
LOCK="$ROOT/upstream.lock"
# shellcheck disable=SC1090
source <(grep -E '^[A-Z_]+=' "$LOCK")

tag="$(git ls-remote --tags --refs "$NL_REPO" 'v*' | sed 's#.*refs/tags/##' \
    | grep -E '^v[0-9]+\.[0-9]+\.[0-9]+$' | sort -V | tail -1)"
[[ -n "$tag" ]] || { echo "could not resolve the newest nl-morphe-patches tag" >&2; exit 1; }
raw="${NL_REPO%.git}/-/raw/$tag/patches/src/main/kotlin/patches"

waze_constants="$raw/waze/WazeConstants.kt"
waze="$(curl -fsSL "$waze_constants" | grep -oE 'AppTarget\(version = "[0-9.]+"' \
    | grep -oE '[0-9]+(\.[0-9]+)+' | sort -V | tail -1)"
[[ -n "$waze" ]] || { echo "no Waze AppTarget in $waze_constants" >&2; exit 1; }

# One AppTarget: version = "...", versionCodes = SupportedAbi.entries.associateWith { N }, minSdk = N.
maps_constants="$raw/googlemaps/shared/Constants.kt"
maps_source="$(curl -fsSL "$maps_constants")"
maps="$(grep -oE 'version = "[0-9.]+"' <<<"$maps_source" | grep -oE '[0-9]+(\.[0-9]+)+' | sort -V | tail -1)"
maps_code="$(grep -oE 'associateWith \{ *[0-9]+ *\}' <<<"$maps_source" | grep -oE '[0-9]+' | sort -n | tail -1)"
maps_sdk="$(grep -oE 'minSdk = [0-9]+' <<<"$maps_source" | grep -oE '[0-9]+' | sort -n | tail -1)"
[[ -n "$maps" && -n "$maps_code" && -n "$maps_sdk" ]] \
    || { echo "no complete Maps AppTarget in $maps_constants" >&2; exit 1; }

if [[ "$waze" == "$WAZE_VERSION" && "$maps" == "$MAPS_VERSION" && "$maps_code" == "$MAPS_VERSION_CODE" ]]; then
    echo unchanged
    exit 0
fi
sed -i -e "s/^NL_TAG=.*/NL_TAG=$tag/" -e "s/^WAZE_VERSION=.*/WAZE_VERSION=$waze/" \
    -e "s/^MAPS_VERSION=.*/MAPS_VERSION=$maps/" -e "s/^MAPS_VERSION_CODE=.*/MAPS_VERSION_CODE=$maps_code/" \
    -e "s/^MAPS_MIN_SDK=.*/MAPS_MIN_SDK=$maps_sdk/" "$LOCK"
echo changed
