#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT_DIR"

rm -rf morphe-deps
mkdir -p morphe-deps

clone_tag() {
  local repo="$1" preferred_tag="$2" fallback_tag="$3" destination="$4"
  if git ls-remote --exit-code --tags "https://github.com/${repo}.git" "refs/tags/${preferred_tag}" >/dev/null 2>&1; then
    git clone --depth 1 --branch "$preferred_tag" "https://github.com/${repo}.git" "$destination"
  else
    git clone --depth 1 --branch "$fallback_tag" "https://github.com/${repo}.git" "$destination"
  fi
}

clone_tag MorpheApp/morphe-patches-gradle-plugin v1.3.4 1.3.4 morphe-deps/morphe-patches-gradle-plugin
clone_tag MorpheApp/morphe-patcher v1.13.0 1.13.0 morphe-deps/morphe-patcher

test -f morphe-deps/morphe-patches-gradle-plugin/gradlew
test -f morphe-deps/morphe-patcher/gradlew
test -f morphe-deps/morphe-patcher/gradle/wrapper/gradle-wrapper.jar

# The root wrapper must be usable after source checkout, without evaluating the
# root settings file to create it.
cp morphe-deps/morphe-patcher/gradle/wrapper/gradle-wrapper.jar gradle/wrapper/gradle-wrapper.jar
chmod +x gradlew morphe-deps/morphe-patches-gradle-plugin/gradlew morphe-deps/morphe-patcher/gradlew

echo "Pinned Morphe source composites are ready."
