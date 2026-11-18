#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-or-later
# Copy as scripts/release-virustotal.sh. Privileged jobs that publish an asset run it:
# release.yml `publish` (EasyHDR, game-mods) and nightly.yml `scan` (game-mods).
# VirusTotal report for a release asset. Needs only bash, coreutils, curl and jq.
#
#   scan <file> <block.md>           submit <file> (VT_API_KEY) and write the report block
#   notes <release.json> <block.md> <out>
#                                    put the block into the release body (`gh release view
#                                    --json body`), replacing an earlier one
#
# The public API allows 4 requests a minute, so requests start at least 15 s apart, and
# HTTP 429, 5xx and network errors wait a minute and retry. Polling gives up after about
# five minutes: a still-queued analysis keeps its links and the block says so. Once the
# file is submitted, a failed poll only ends the polling.
set -euo pipefail

START='<!-- virustotal-results:start -->'
END='<!-- virustotal-results:end -->'

API="${VT_API_URL:-https://www.virustotal.com/api/v3}"
GUI="${VT_GUI_URL:-https://www.virustotal.com/gui}"
SPACING="${VT_SPACING_SECONDS:-15}"
BACKOFF="${VT_BACKOFF_SECONDS:-60}"
RETRIES="${VT_RETRIES:-4}"
POLLS="${VT_POLLS:-10}"
POLL_WAIT="${VT_POLL_SECONDS:-30}"
LARGE=$((32 * 1024 * 1024)) # above this, upload through /files/upload_url
LIMIT=$((650 * 1024 * 1024)) # VirusTotal's upload limit

die() {
  echo "::error::$*" >&2
  exit 1
}

# Only VirusTotal's error code reaches the log; it can't carry a workflow command.
error_code() {
  jq -r '.error.code? // empty' "$1" 2>/dev/null | tr -cd 'A-Za-z0-9_' | head -c 64 || true
}

last_request=0

# vt <url> [curl args...]: the response body goes to $response; fails on a non-2xx answer.
vt() {
  local url="$1" attempt status wait
  shift
  for ((attempt = 1; attempt <= RETRIES; attempt++)); do
    wait=$((last_request + SPACING - $(date +%s)))
    if ((wait > 0)); then sleep "$wait"; fi
    last_request="$(date +%s)"
    status="$(curl -sS --proto "=${API%%://*}" --max-time 300 -H @"$headers" \
      -o "$response" -w '%{http_code}' "$@" "$url")" || status=000
    case "$status" in
      2??) return 0 ;;
      429 | 5?? | 000)
        echo "::warning::VirusTotal answered HTTP $status $(error_code "$response") (try $attempt of $RETRIES)" >&2
        if ((attempt < RETRIES)); then sleep "$BACKOFF"; fi
        ;;
      *)
        echo "VirusTotal answered HTTP $status $(error_code "$response")" >&2
        return 1
        ;;
    esac
  done
  return 1
}

scan() {
  local file="$1" out="$2" name size sha url id status stats verdict when
  [[ -f "$file" && ! -L "$file" ]] || die "not a regular file: $file"
  [[ -n "${VT_API_KEY:-}" ]] || die "VT_API_KEY is not set"
  name="$(basename "$file")"
  [[ "$name" =~ ^[A-Za-z0-9._-]+$ ]] || die "unexpected file name"
  size="$(($(wc -c <"$file")))"
  ((size > 0 && size <= LIMIT)) || die "$name is $size bytes; VirusTotal accepts 1 to $LIMIT"
  sha="$(sha256sum "$file" | cut -d' ' -f1)"

  work="$(mktemp -d)"
  trap 'rm -rf "$work"' EXIT
  headers="$work/headers"
  response="$work/response.json"
  (umask 077 && printf 'x-apikey: %s\n' "$VT_API_KEY" >"$headers")
  unset VT_API_KEY

  url="$API/files"
  if ((size > LARGE)); then
    vt "$API/files/upload_url" || die "no upload URL from VirusTotal"
    url="$(jq -er '.data | strings' "$response")" || die "malformed upload URL response"
    # The key goes only to VirusTotal's own origin.
    [[ "$url" == "${API%%/api/*}/"* && "$url" != *[[:space:]]* ]] || die "upload URL outside VirusTotal"
  fi
  vt "$url" -F "file=@$file;filename=$name" || die "VirusTotal rejected the upload"
  id="$(jq -er 'select(.data.type == "analysis") | .data.id | strings' "$response")" ||
    die "malformed upload response"
  [[ "$id" =~ ^[A-Za-z0-9+/=_-]{1,200}$ ]] || die "malformed analysis id"
  echo "Submitted $name ($sha), analysis $id"

  status=queued
  stats=""
  for ((poll = 1; poll <= POLLS; poll++)); do
    sleep "$POLL_WAIT"
    if ! vt "$API/analyses/$(jq -rn --arg id "$id" '$id | @uri')"; then
      echo "::warning::Polling failed; keeping the links" >&2
      break
    fi
    status="$(jq -r '.data.attributes.status | strings' "$response" | tr -cd 'a-z-')" || status=""
    if [[ "$status" == completed ]]; then
      jq -e --arg sha "$sha" '.meta.file_info.sha256 == $sha' "$response" >/dev/null ||
        die "VirusTotal analysed a different file"
      stats="$(jq -r '.data.attributes.stats
        | "\(.malicious // 0 | tonumber) malicious, \(.suspicious // 0 | tonumber) suspicious, \(.undetected // 0 | tonumber) undetected"' "$response")" ||
        die "malformed analysis stats"
      break
    fi
    echo "Analysis $status ($poll of $POLLS)"
  done
  when="$(date -u '+%Y-%m-%d %H:%M UTC')"
  if [[ -n "$stats" ]]; then
    verdict="completed $when: $stats"
  else
    verdict="${status:-queued} at $when; the report shows the result once VirusTotal finishes"
  fi

  {
    printf '%s\n---\n\n### VirusTotal\n\n' "$START"
    printf '| File | SHA-256 | Analysis | Reports |\n| --- | --- | --- | --- |\n'
    # shellcheck disable=SC2016 # the backticks are Markdown
    printf '| `%s` | `%s` | %s | [analysis](%s/file-analysis/%s/detection), [file](%s/file/%s/detection) |\n\n' \
      "$name" "$sha" "$verdict" "$GUI" "$(jq -rn --arg id "$id" '$id | @uri')" "$GUI" "$sha"
    printf '%s\n' "$END"
  } >"$out"
}

notes() {
  local release="$1" block="$2" out="$3"
  jq -nj --slurpfile release "$release" --rawfile block "$block" --arg start "$START" --arg end "$END" '
    ($release[0].body // "") as $body
    | ($block | rtrimstr("\n")) as $b
    | ($body | indices($start) | length) as $ns
    | ($body | indices($end) | length) as $ne
    # Replace exactly one start-then-end pair, append when there is none, refuse anything else.
    | if $ns == 1 and $ne == 1 and ($body | index($start)) < ($body | index($end))
      then ($body | split($start)) as $h | $h[0] + $b + ($h[1] | split($end))[1]
      elif $ns == 0 and $ne == 0 then
        (if ($body | gsub("\\s+"; "") | length) == 0 then $b + "\n"
        else ($body | rtrimstr("\n")) + "\n\n" + $b + "\n" end)
      else error("the release body has unmatched VirusTotal markers") end
  ' >"$out"
}

usage="usage: $0 scan <file> <block.md> | notes <release.json> <block.md> <out>"
case "${1:-}" in
  scan) [[ $# -eq 3 ]] || die "$usage"; scan "$2" "$3" ;;
  notes) [[ $# -eq 4 ]] || die "$usage"; notes "$2" "$3" "$4" ;;
  *) die "$usage" ;;
esac
