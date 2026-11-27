#!/usr/bin/env bash
# shellcheck shell=bash

sha256_file() { shasum -a 256 -- "$1" | cut -d ' ' -f 1; }

download_verified() (
  set -euo pipefail
  local url=$1 path=$2 expected=$3 temporary
  if [[ -f "$path" && "$(sha256_file "$path")" == "$expected" ]]; then return; fi
  temporary="$(mktemp "$path.download.XXXXXX")"
  trap 'rm -f -- "$temporary"' EXIT
  curl -fsSL --retry 2 --max-time 180 "$url" -o "$temporary"
  if [[ "$(sha256_file "$temporary")" != "$expected" ]]; then
    printf 'Checksum mismatch: %s\n' "$path" >&2
    return 1
  fi
  chmod 0644 "$temporary"
  mv -f -- "$temporary" "$path"
)
