#!/usr/bin/env bash
set -euo pipefail

VERSION="$1"

# Update version in patches-list.json
jq --arg v "$VERSION" '.version = $v' patches-list.json > patches-list.json.tmp
mv patches-list.json.tmp patches-list.json

# Generate patches-bundle.json
DOWNLOAD_URL="https://github.com/${GITHUB_REPOSITORY}/releases/download/v${VERSION}/patches-${VERSION}.mpp"
jq -n \
  --arg created_at "$(date -u +"%Y-%m-%dT%H:%M:%S")" \
  --arg version "$VERSION" \
  --arg download_url "$DOWNLOAD_URL" \
  '{
    created_at: $created_at,
    description: "",
    download_url: $download_url,
    signature_download_url: "",
    version: $version
  }' > patches-bundle.json
