#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
source "$ROOT/scripts/lib/files.sh"

[[ $# -eq 1 ]] || fail "Usage: $0 DEX_DIRECTORY"
metadata="$ROOT/patches-bundle.json"
version="$(jq -er '.version | select(type == "string")' "$metadata")"
[[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+(-[0-9a-z-]+(\.[0-9a-z-]+)*)?$ ]] || fail 'Invalid bundle version'
name="gemini-microg-patches-$version.mpp"
repo=https://github.com/ryuya0124/gemini-microg-patches
jq -e --arg url "$repo/releases/download/v$version/$name" '.download_url == $url' "$metadata" >/dev/null
timestamp="$(jq -er '.created_at | gsub("Z$"; "") | . + "Z" | fromdateiso8601 * 1000' "$metadata")"
staging="$(mktemp -d "$BUILD_DIR/package-mpp.XXXXXX")"
trap 'rm -rf -- "$staging"' EXIT
tree="$staging/contents"
mkdir -p "$tree"
unzip -q "$BUILD_DIR/gemini-patches.jar" -d "$tree"
mkdir -p "$tree/META-INF"
{
  printf '%s\n' 'Manifest-Version: 1.0' 'Name: Gemini microG patches' \
    'Description: Gemini login and Secure Folder support with microG'
  printf '%s\n' "Version: $version" "Timestamp: $timestamp" "Source: $repo" \
    'Author: ryuya0124' "Website: $repo" 'Patcher-Version: 2.5.0'
} | LC_ALL=C awk '{ while(length($0)>70){printf "%s\r\n",substr($0,1,70);$0=" " substr($0,71)} printf "%s\r\n",$0 } END {printf "\r\n"}' > "$tree/META-INF/MANIFEST.MF"
require_file "$1/classes.dex"
dex=("$1"/classes*.dex)
for path in "${dex[@]}"; do
  [[ "$(head -c 3 "$path")" == dex ]] || fail "Invalid DEX: $path"
  cp -- "$path" "$tree/"
done
(
  cd "$tree"
  export LC_ALL=C TZ=UTC
  find . -type f -exec chmod 0644 {} +
  find . -type f -exec touch -t 200001010000 {} +
  find . -type f | cut -c 3- | sort | zip -q -X "$staging/$name" -@
)
output="$BUILD_DIR/release"
mkdir -p "$output"
cp -- "$metadata" "$staging/patches-bundle.json"
(
  cd "$staging"
  shasum -a 256 -- "$name" patches-bundle.json > SHA256SUMS
)
mv -f -- "$staging/$name" "$staging/patches-bundle.json" "$staging/SHA256SUMS" "$output/"
printf 'Packaged %s with %s Android DEX file(s)\n' "$name" "${#dex[@]}"
