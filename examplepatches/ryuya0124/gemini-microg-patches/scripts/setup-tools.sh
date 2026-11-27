#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
source "$ROOT/scripts/lib/files.sh"
mkdir -p "$ROOT/tools"
lock="$ROOT/config/tools.lock.json"
jq -e 'to_entries | all(.value | (.file | test("^[A-Za-z0-9._-]+$") and . != "." and . != "..") and (.sha256 | test("^[a-f0-9]{64}$")))' "$lock" >/dev/null
while IFS=$'\t' read -r name version url hash file; do
  target="$ROOT/tools/$file"
  download_verified "$url" "$target" "$hash"
  printf 'Verified %s %s\n' "$name" "$version"
  if [[ "$name" == kotlin ]]; then
    if unzip -Z -1 "$target" | grep -E '(^/|(^|/)\.\.(/|$)|\\)' >/dev/null; then
      printf 'Unsafe Kotlin archive path\n' >&2
      exit 1
    fi
    unzip -oq "$target" -d "$ROOT/tools"
    find "$ROOT/tools/kotlinc/bin" -maxdepth 1 -type f ! -name '*.bat' -exec chmod 0755 {} +
  fi
done < <(jq -r 'to_entries[] | [.key, .value.version, .value.url, .value.sha256, .value.file] | @tsv' "$lock")
