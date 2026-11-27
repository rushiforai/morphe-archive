#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
[[ $# -eq 1 && "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || { printf 'Usage: %s VERSION\n' "$0" >&2; exit 1; }
version=$1
repo=https://github.com/ryuya0124/gemini-microg-patches
staging="$(mktemp "$ROOT/patches-bundle.json.XXXXXX")"
trap 'rm -f -- "$staging"' EXIT
jq -n --arg created "$(date -u +%Y-%m-%dT%H:%M:%S)" --arg repo "$repo" --arg version "$version" '{
  created_at: $created,
  description: "Gemini login and Samsung Secure Folder support with microG",
  download_url: "\($repo)/releases/download/v\($version)/gemini-microg-patches-\($version).mpp",
  page_url: "\($repo)/releases/tag/v\($version)",
  version: $version
}' > "$staging"
chmod 0644 "$staging"
mv -f -- "$staging" "$ROOT/patches-bundle.json"
printf 'Prepared patches-bundle.json for v%s\nWrite docs/releases/v%s.md, then build, commit and tag.\n' "$version" "$version"
