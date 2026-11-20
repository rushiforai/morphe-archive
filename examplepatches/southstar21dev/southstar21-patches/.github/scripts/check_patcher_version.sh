#!/usr/bin/env bash
# Fails when the Morphe CLI that verifies the patches runs a different morphe-patcher than the one
# in gradle/libs.versions.toml, so a patcher bump can't leave CI verifying with the old patcher.
#
# Usage: check_patcher_version.sh <Morphe CLI tag>   (needs gh, with GH_TOKEN set in CI)
set -euo pipefail

cli_version=${1:?usage: check_patcher_version.sh <Morphe CLI tag>}

patcher_version() {
  sed -nE 's/^morphe-patcher *= *"([^"]+)".*/\1/p' | head -n 1
}

ours=$(patcher_version < gradle/libs.versions.toml)
theirs=$(gh api "repos/MorpheApp/morphe-cli/contents/gradle/libs.versions.toml?ref=$cli_version" \
  -H 'Accept: application/vnd.github.raw' | patcher_version)

if [ -z "$ours" ] || [ -z "$theirs" ]; then
  echo "::error title=Patcher version check::Could not read morphe-patcher (ours: '$ours', Morphe CLI $cli_version: '$theirs')"
  exit 1
fi

if [ "$ours" != "$theirs" ]; then
  echo "::error title=Patcher version mismatch::gradle/libs.versions.toml has morphe-patcher $ours, but Morphe CLI $cli_version runs $theirs. Update MORPHE_CLI_VERSION in .github/workflows/verify.yml to the CLI that ships morphe-patcher $ours."
  exit 1
fi

echo "morphe-patcher $ours matches Morphe CLI $cli_version"
