#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
git rev-parse --is-inside-work-tree >/dev/null
while IFS= read -r script; do bash -n "$script"; done < <(find scripts -name '*.sh' -type f)
if command -v shellcheck >/dev/null 2>&1; then
  # Globals are shared through common.sh; dynamic source paths are validated by builds.
  shellcheck --exclude=SC1091,SC2034 scripts/*.sh scripts/lib/*.sh
else
  printf '%s\n' 'shellcheck is not installed; Bash syntax validation completed.'
fi
jq -e 'all(.[]; (.url | test("^https://(github\\.com/|dl\\.google\\.com/dl/android/maven2/)")) and
  (.sha256 | test("^[0-9a-f]{64}$")) and (.file | test("^[A-Za-z0-9._-]+$") and . != "." and . != ".."))' \
  config/tools.lock.json >/dev/null
blocked=0
while IFS= read -r -d '' name; do
  case "$name" in
    local/*|build/*|dist/*|.env|*.apk|*.jar|*.mpp|*.p12|*.jks|*.keystore|*.log|*.png|*.py|*.pyc)
      printf 'File must not be tracked: %s\n' "$name" >&2
      blocked=1 ;;
  esac
done < <(git ls-files -z)
[[ "$blocked" == 0 ]]
printf 'Repository layout and tool locks verified\n'
