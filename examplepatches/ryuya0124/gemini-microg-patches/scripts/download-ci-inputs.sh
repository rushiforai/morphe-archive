#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
umask 077
mkdir -p "$ROOT/inputs"
variables=(GOOGLE_BASE_APK_URL GOOGLE_SPLIT_APK_URL GEMINI_BASE_APK_URL)
names=(google-base.apk google-xxhdpi.apk gemini-base.apk)
for name in "${variables[@]}"; do
  url=${!name-}
  if [[ "$url" != https://* || "$url" == *$'\n'* || "$url" == *$'\r'* || "$url" == *\\* || "$url" == *'"'* ]]; then
    printf 'Configure an HTTPS URL for %s\n' "$name" >&2
    exit 1
  fi
done
staging="$(mktemp -d "$ROOT/inputs/.downloads.XXXXXX")"
trap 'rm -rf -- "$staging"' EXIT
for i in "${!variables[@]}"; do
  variable=${variables[i]}
  if ! printf 'url = "%s"\n' "${!variable}" |
    curl -fsSL --proto '=https' --proto-redir '=https' --config - -o "$staging/${names[i]}" 2>/dev/null; then
    printf 'Download failed for %s; check its URL secret.\n' "${names[i]}" >&2
    exit 1
  fi
  printf 'Downloaded %s\n' "${names[i]}"
done
for name in "${names[@]}"; do mv -f -- "$staging/$name" "$ROOT/inputs/$name"; done
