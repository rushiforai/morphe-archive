#!/usr/bin/env bash
set -euo pipefail

MPP="${1:-}"
if [ -z "$MPP" ]; then
  MPP=$(find patches/build/libs -maxdepth 1 -type f -name 'patches-*.mpp' ! -name '*sources*' ! -name '*javadoc*' | sort | tail -n 1)
fi

if [ -z "${MPP:-}" ] || [ ! -f "$MPP" ]; then
  echo "No built patches .mpp bundle found in patches/build/libs" >&2
  exit 1
fi

entries=$(unzip -Z1 "$MPP")
for required in extensions/soundcloud.mpe soundcloud/strings-ru.xml soundcloud/plurals-ru.xml; do
  if ! printf '%s\n' "$entries" | grep -Fxq "$required"; then
    echo "Missing required MPP entry: $required" >&2
    exit 1
  fi
done

if [ ! -f "patches-list.json" ]; then
  echo "patches-list.json not found" >&2
  exit 1
fi

python3 - <<'PY'
import json
from pathlib import Path

data = json.loads(Path("patches-list.json").read_text(encoding="utf-8"))
patches = data.get("patches", [])
names = sorted(p["name"] for p in patches)
expected = sorted([
    "AMOLED dark theme",
    "Disable analytics",
    "Disable consent popup",
    "Enable SoundCloud Go",
    "Hide Cast icon",
    "Hide Message icon",
    "Home in Android Auto",
    "Remove ads and upsells",
    "Russian language",
    "Sleep timer in track menu",
])
assert names == expected, f"Unexpected patch list: {names} != {expected}"
non_default = sorted(p["name"] for p in patches if not p.get("default"))
expected_opt_in = ["Hide Cast icon", "Hide Message icon"]
assert non_default == expected_opt_in, f"Expected opt-in patches {expected_opt_in}, found: {non_default}"
print(f"Verified {len(patches)} patches in patches-list.json (8 default=true, 2 opt-in, version={data.get('version')})")
PY

echo "Verified MPP bundle entries in $MPP:"
printf '%s\n' "$entries" | grep -E '^(extensions/soundcloud\.mpe|soundcloud/(strings|plurals)-ru\.xml)$'
