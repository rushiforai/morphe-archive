#!/usr/bin/env bash
# Self-test for the APK URL check shared by android-smoke.yml, clipboard-e2e.yml and
# keyboard-onboarding-probe.yml. It runs the check as written in the workflows (from
# `test -n "$APK_URL"` to the allowlist `esac`, so nothing is downloaded) and proves
# that only the URL's real host is matched: a query, fragment, userinfo or port cannot
# carry an allowlisted name past it. Usage: bash .github/scripts/url_allowlist_selftest.sh
set -euo pipefail
cd "$(dirname "$0")/../.."
WORKFLOWS=(android-smoke.yml clipboard-e2e.yml keyboard-onboarding-probe.yml)
tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT
rc=0

echo "shared block"
for wf in "${WORKFLOWS[@]}"; do
  sed -n '/^ *test -n "\$APK_URL"$/,/^ *esac$/p' ".github/workflows/$wf" | sed 's/^          //' > "$tmp/$wf.sh"
  if ! grep -Fq 'case "$host" in' "$tmp/$wf.sh"; then
    echo "  NOT OK: $wf: URL check not found"; rc=1
  elif ! cmp -s "$tmp/${WORKFLOWS[0]}.sh" "$tmp/$wf.sh"; then
    echo "  NOT OK: $wf: URL check differs from ${WORKFLOWS[0]}"; rc=1
  else
    echo "  ok: $wf"
  fi
done
check="$tmp/${WORKFLOWS[0]}.sh"

allow() {  # allow <url> <host the check must report>
  local got=""
  got="$(APK_URL="$1" bash -euo pipefail "$check" 2>/dev/null)" || got="rejected"
  if [ "$got" = "APK host allowlisted: $2" ]; then echo "  ok: allows  $1  (host $2)"
  else echo "  NOT OK: must allow $1 as $2 (got: ${got:-nothing})"; rc=1; fi
}
reject() {  # reject <url> <why>
  if APK_URL="$1" bash -euo pipefail "$check" >/dev/null 2>&1; then
    echo "  NOT OK: must reject $1 ($2)"; rc=1
  else echo "  ok: rejects $1  ($2)"; fi
}

echo "allowlisted hosts"
allow 'https://github.com/muhib-karim/Rambler-Bangla/releases/download/v30.0.0/app.apk' github.com
allow 'https://catbox.moe/a.apk'               catbox.moe
allow 'https://litter.catbox.moe/a.apk'        litter.catbox.moe
allow 'https://gofile.io/d/abc'                gofile.io
allow 'https://store5.gofile.io/download/a.apk' store5.gofile.io
allow 'https://tmpfiles.org/123/a.apk'         tmpfiles.org
allow 'https://CatBox.Moe/a.apk'               catbox.moe
allow 'https://catbox.moe:443/a.apk'           catbox.moe
allow 'https://user:pw@catbox.moe/a.apk'       catbox.moe
allow 'https://catbox.moe?dl=1'                catbox.moe
allow 'https://catbox.moe#top'                 catbox.moe

echo "everything else"
reject ''                                            'empty URL'
reject 'http://catbox.moe/a.apk'                     'not https'
reject 'https://evil.example/a.apk'                  'host not listed'
reject 'https://catbox.moe.evil.example/a.apk'       'look-alike suffix'
reject 'https://storex.example?x=.gofile.io'         '? ends the host'
reject 'https://storex.example#.gofile.io'           '# ends the host'
reject 'https://catbox.moe@evil.example/a.apk'       'userinfo before @ is not the host'
reject 'https://store@evil.example#.gofile.io'       '@ and # together'
reject 'https://a@catbox.moe:443@evil.example/a.apk' 'host is what follows the last @'
reject 'https://storex.example:.gofile.io/a.apk'     ':port is not part of the host'
reject 'https://storex.example:443.gofile.io/a.apk'  ':port is not part of the host'
reject 'https://evil.example:443/a.apk'              'host not listed, with a port'
reject 'https:///a.apk'                              'empty host'
reject 'https://@/a.apk'                             'empty host after userinfo'
reject 'https://:443/a.apk'                          'empty host before port'
reject 'https://?x=catbox.moe'                       'empty host before query'
exit "$rc"
