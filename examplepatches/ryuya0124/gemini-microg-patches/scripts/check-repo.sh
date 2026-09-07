#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
while IFS= read -r script; do bash -n "$script"; done < <(find scripts -name '*.sh' -type f)
if command -v shellcheck >/dev/null 2>&1; then
  # Globals are shared through common.sh; dynamic source paths are validated by builds.
  shellcheck --exclude=SC1091,SC2034 scripts/*.sh scripts/lib/*.sh
else
  printf '%s\n' 'shellcheck is not installed; Bash syntax validation completed.'
fi
python3 scripts/check-repo.py
