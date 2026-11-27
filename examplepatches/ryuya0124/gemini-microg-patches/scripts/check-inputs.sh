#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
source "$ROOT/scripts/lib/files.sh"
while read -r expected name extra; do
  name="${name%$'\r'}"
  [[ "$expected" =~ ^[a-f0-9]{64}$ && -n "$name" && -z "$extra" ]] || fail 'Invalid input checksum row'
  require_file "$ROOT/inputs/$name"
  [[ "$(sha256_file "$ROOT/inputs/$name")" == "$expected" ]] || fail "Unsupported input/checksum mismatch: $name"
  printf 'Verified input: %s\n' "$name"
done < "$ROOT/config/inputs.sha256"
