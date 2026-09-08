#!/usr/bin/env sh
set -eu

MPP="${1:-}"
if [ -z "$MPP" ]; then
  MPP=$(find patches/build/libs -maxdepth 1 -type f -name 'patches-*.mpp' ! -name '*sources*' ! -name '*javadoc*' | sort | tail -n 1)
fi

if [ -z "${MPP:-}" ] || [ ! -f "$MPP" ]; then
  echo "No built patches .mpp found" >&2
  exit 1
fi

entries=$(unzip -Z1 "$MPP")
for required in extensions/shared.mpe extensions/soundcloud.mpe; do
  if ! printf '%s\n' "$entries" | grep -Fxq "$required"; then
    echo "Missing required MPP entry: $required" >&2
    exit 1
  fi
done

echo "MPP runtime extensions verified:"
printf '%s\n' "$entries" | grep -E '^extensions/(shared|soundcloud)\.mpe$'
