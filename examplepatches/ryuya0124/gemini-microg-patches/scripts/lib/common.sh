#!/usr/bin/env bash
# shellcheck shell=bash
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
if [[ -f "$ROOT/.env" ]]; then
  set -a
  # shellcheck source=/dev/null
  source "$ROOT/.env"
  set +a
fi
JAVA="${JAVA:-java}"
KOTLINC="${KOTLINC:-$ROOT/tools/kotlinc/bin/kotlinc}"
BUILD_DIR="$ROOT/build"
DIST_DIR="$ROOT/dist"
MORPHE="$ROOT/tools/morphe-desktop.jar"
PATCHES="$ROOT/tools/patches.mpp"
export ANDROID_HOME="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$HOME/Library/Android/sdk}}"
fail() { printf 'Error: %s\n' "$*" >&2; exit 1; }
require_file() { [[ -f "$1" ]] || fail "Missing $1"; }
mkdir -p "$BUILD_DIR"
