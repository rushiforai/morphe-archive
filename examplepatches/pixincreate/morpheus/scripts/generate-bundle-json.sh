#!/usr/bin/env bash
# Write patches-bundle.json for a released patch bundle.
#
# The Morphe Manager reads this file from the repository root to learn which
# bundle release to download. The version and the release notes come from the
# GitHub release, so run this after the release exists.
#
# Usage:
#   bash scripts/generate-bundle-json.sh <version> [repository]
#
#   version      project version without the v prefix, for example 0.1.1
#   repository   owner/name (default: GITHUB_REPOSITORY, then the current clone)
#
# Requires gh with a token that can read the release (GH_TOKEN in CI).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
VERSION="${1:?usage: generate-bundle-json.sh <version> [repository]}"
REPOSITORY="${2:-${GITHUB_REPOSITORY:-}}"

if [ -z "$REPOSITORY" ]; then
  REPOSITORY="$(gh repo view --json nameWithOwner --jq .nameWithOwner)"
fi

release="$(gh release view "v$VERSION" --repo "$REPOSITORY" --json body,publishedAt)"
created_at="$(printf '%s' "$release" | python3 -c 'import json,sys; print(json.load(sys.stdin)["publishedAt"][:19])')"
description="$(printf '%s' "$release" | python3 -c 'import json,sys; print(json.load(sys.stdin)["body"], end="")')"

if [ -z "$description" ]; then
  description="Patch bundle $VERSION."
fi

python3 - "$ROOT/patches-bundle.json" "$VERSION" "$created_at" "$description" "$REPOSITORY" <<'PY'
import json
import sys

path, version, created_at, description, repository = sys.argv[1:6]

bundle = {
    "created_at": created_at,
    "description": description,
    "download_url": (
        f"https://github.com/{repository}/releases/download/v{version}/patches-{version}.mpp"
    ),
    "signature_download_url": "",
    "version": version,
}

with open(path, "w", encoding="utf-8") as file:
    json.dump(bundle, file, indent=2, ensure_ascii=False)
    file.write("\n")
PY

echo "Wrote patches-bundle.json for $VERSION"
