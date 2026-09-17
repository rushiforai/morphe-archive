#!/usr/bin/env bash
# Fetch the upstream Morphe sources into vendor/ so the build works without GitHub Packages
# credentials. Versions must match the ones referenced by the build.
set -euo pipefail

PLUGIN_VERSION="${PLUGIN_VERSION:-1.3.3}"
PATCHER_VERSION="${PATCHER_VERSION:-1.8.0}"
PLUGIN_REPO="${PLUGIN_REPO:-MorpheApp/morphe-patches-gradle-plugin}"
PATCHER_REPO="${PATCHER_REPO:-MorpheApp/morphe-patcher}"

cd "$(dirname "$0")/.."
mkdir -p vendor
cd vendor

fetch() {
  local repo="$1" tag="$2" out="$3"
  local url="https://github.com/${repo}/archive/refs/tags/${tag}.tar.gz"
  echo "==> ${repo} ${tag}"
  curl -fsSL "$url" -o "${out}.tar.gz"
  tar xzf "${out}.tar.gz"
  rm -f "${out}.tar.gz"
}

fetch "$PLUGIN_REPO" "v${PLUGIN_VERSION}" "morphe-patches-gradle-plugin-${PLUGIN_VERSION}"
fetch "$PATCHER_REPO" "v${PATCHER_VERSION}" "morphe-patcher-${PATCHER_VERSION}"

echo "Vendored upstreams into $(pwd)"
echo "Run: ./gradlew :patches:jar"
