#!/usr/bin/env bash
# Self-test for the CI pass gate in ci.yml ("Run static suite") and tests.yml ("Run tests").
# The old gate (no pipefail, grep -q ", 0 failed") went green on a failing suite because
# PolicyTest prints its own "..., 0 failed" line. Usage: bash .github/scripts/ci_gate_selftest.sh
set -euo pipefail
cd "$(dirname "$0")/../.."
RE='^TEST SUITE: [0-9]+ passed, 0 failed$'
tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT
rc=0
expect() {  # expect <pass|fail> <label> <command...>
  local want="$1" label="$2" got=pass; shift 2
  "$@" >/dev/null 2>&1 || got=fail
  if [ "$got" = "$want" ]; then echo "  ok: $label"
  else echo "  NOT OK: $label (want $want, got $got)"; rc=1; fi
}
# The step body as the workflows run it; $1 stands in for tests/run_tests.sh.
step() {
  bash -c 'set -euo pipefail; bash "$1" | tee "$2"; grep -Eq "$3" "$2"' _ "$1" "$tmp/test.log" "$RE"
}
fake() {  # fake <name> <exit code> <last line>; every fake prints the PolicyTest decoy first
  printf 'echo "PolicyTest: 51 passed, 0 failed"\necho "%s"\nexit %s\n' "$3" "$2" > "$tmp/$1.sh"
}
fake good       0 'TEST SUITE: 17 passed, 0 failed'
fake bad        1 'TEST SUITE: 16 passed, 1 failed'
fake bad-exit0  0 'TEST SUITE: 16 passed, 1 failed'
fake good-exit1 1 'TEST SUITE: 17 passed, 0 failed'
fake no-summary 0 'suite died before its summary'

echo "simulated runs"
expect pass "good run passes" step "$tmp/good.sh"
expect fail "failing run fails" step "$tmp/bad.sh"
expect fail "failing summary fails even if the suite exits 0 (exact-line grep)" step "$tmp/bad-exit0.sh"
expect fail "non-zero suite exit fails even with a clean summary (pipefail)" step "$tmp/good-exit1.sh"
expect fail "missing summary line fails" step "$tmp/no-summary.sh"

echo "workflows"
for wf in .github/workflows/ci.yml .github/workflows/tests.yml; do
  expect pass "$wf: set -euo pipefail" grep -Fq 'set -euo pipefail' "$wf"
  expect pass "$wf: exact summary-line gate" grep -Fq "grep -Eq '$RE' /tmp/test.log" "$wf"
  expect fail "$wf: loose gate removed" grep -Fq 'grep -q ", 0 failed"' "$wf"
done
exit "$rc"
