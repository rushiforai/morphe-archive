#!/bin/sh
# The runtime checks: functions sliced out of patches/src/main/resources/japatch/bootstrap.js and run against a
# fake `settings`/`React`, without a phone. Every *.cjs here must pass on main.
#   sh tests/runtime/run.sh
cd "$(dirname "$0")" || exit 2
status=0
for test in *.cjs; do
  printf '== %s\n' "$test"
  if node "$test"; then :; else status=1; fi
done
[ "$status" = 0 ] && echo "runtime tests: PASS" || echo "runtime tests: FAIL"
exit "$status"
