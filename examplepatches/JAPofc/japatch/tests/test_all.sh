#!/bin/sh
# Every check this repository has, in order, against the real Discord APKM (developer-only; output in work/).
#   sh tests/test_all.sh [Discord.apkm]          # setup (idempotent), build, port check, UI, cold boot, patch + VerifyApk
#   SKIP=verify,boot sh tests/test_all.sh        # leave steps out: setup build port ui boot verify
#   ONLY=ui sh tests/test_all.sh                 # run just these steps (comma-separated)
#   REUSE=1 sh tests/test_all.sh                 # VerifyApk on the last work/verify/patched.apk instead of patching again
# Runs one step at a time (a 1 GB sandbox can't hold Morphe and Chromium at once), keeps going after a failure, and ends
# with a table of what passed. Exits 1 if anything failed. Each step's full output is in work/test_all/<step>.log, and
# the table is kept in work/test_all/summary as it fills in, so a run cut short still shows how far it got.
cd "$(dirname "$0")/.."
APKM="${1:-$(python3 scripts/hbc/find_apkm.py)}" || exit 2
LOG=work/test_all; mkdir -p "$LOG"; : > "$LOG/summary"
listed() { case ",$1," in *",$2,"*) return 0;; esac; return 1; }
step() {
  name=$1; shift
  if listed "$SKIP" "$name" || { [ -n "$ONLY" ] && ! listed "$ONLY" "$name"; }; then
    printf '%-8s skip\n' "$name" >> "$LOG/summary"; return
  fi
  printf '== %s: %s\n' "$name" "$*"
  start=$(date +%s)
  if "$@" > "$LOG/$name.log" 2>&1; then result=PASS; else result=FAIL; fi
  printf '%-8s %-4s %4ss  %s\n' "$name" "$result" $(( $(date +%s) - start )) "$(grep -v '^\s*$' "$LOG/$name.log" | tail -1 | cut -c1-90)" >> "$LOG/summary"
  [ "$result" = PASS ] || { tail -5 "$LOG/$name.log"; echo "   FAIL: see $LOG/$name.log"; }
}
setup() { sh scripts/hbc/bench_setup.sh "$APKM" && sh tests/ui/setup.sh "$APKM"; }
ui() {
  # Every option page on and off (dark and light), the fresh install, then every Discord scene at full width and on a
  # narrow phone in a long language. STRICT=1: a page error, React error or stand-in warning fails the step.
  sh tests/ui/check.sh &&
  STRICT=1 node tests/ui/shot.cjs --all test &&
  STRICT=1 node tests/ui/shot.cjs --all test-light theme=light &&
  STRICT=1 node tests/ui/shot.cjs --scenes test &&
  WIDTH=360 STRICT=1 node tests/ui/shot.cjs --scenes test-narrow lang=de
}
boot() {
  # The patched real bundle boots on the HBC98 VM with this runtime injected (cold_boot.sh fails without
  # HBC98_REAL_RN_ENVIRONMENT_PASS). Same runtime on both sides: a boot check, not a benchmark.
  sh tests/bench/cold_boot.sh patches/build/bootstrap.js patches/build/bootstrap.js 4
}
step setup setup
step build python3 scripts/build.py
step port python3 scripts/hbc/port_check.py
step ui ui
step boot boot
step verify sh scripts/verify_apk.sh "$APKM"
echo; echo "Discord: $(basename "$APKM")"; cat "$LOG/summary"
! grep -q "^[a-z]* *FAIL" "$LOG/summary"
