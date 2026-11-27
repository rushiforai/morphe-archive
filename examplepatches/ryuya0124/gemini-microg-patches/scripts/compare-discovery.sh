#!/usr/bin/env bash
set -euo pipefail
[[ $# -eq 2 ]] || { printf 'Usage: %s OLD_REPORT.json NEW_REPORT.json\n' "$0" >&2; exit 1; }
jq -rs '
  .[0].rules as $old | .[1].rules as $new |
  (($old + $new) | keys[]) as $key |
  ($old[$key] // {}) as $before | ($new[$key] // {}) as $after |
  ([$before.candidates[]?.descriptor] | unique) as $a |
  ([$after.candidates[]?.descriptor] | unique) as $b |
  "\($key): \($before.status // "absent") -> \($after.status // "absent")",
  (($a - $b)[] | "  - " + .), (($b - $a)[] | "  + " + .)
' "$1" "$2"
