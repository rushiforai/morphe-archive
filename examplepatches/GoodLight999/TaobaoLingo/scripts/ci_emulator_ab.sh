#!/usr/bin/env bash
# Single shell to ensure both A/B cases execute even if the first one fails.
# android-emulator-runner runs every command separately, so exit handling
# needs to live inside ONE script (not adjacent workflow script: lines).
set -uo pipefail
adb shell getprop ro.product.cpu.abilist | tee out/emulator-abilist.txt
bash scripts/ci_emulator_probe.sh original work/original.apk
ORIGINAL_RESULT=$?
bash scripts/ci_emulator_probe.sh resigned work/resigned.apk
RESIGNED_RESULT=$?
printf 'original_exit=%s\nresigned_exit=%s\n' "$ORIGINAL_RESULT" "$RESIGNED_RESULT" | tee out/probe-exits.txt
if [[ $ORIGINAL_RESULT -ne 0 || $RESIGNED_RESULT -ne 0 ]]; then
  echo 'INCONCLUSIVE: one or both variants did not reach a live Taobao UI on this emulator' >&2
  echo 'The failure does not establish a signing, login, or translation cause.' >&2
  exit 1
fi
echo 'Both reached native Taobao UI; Account/login/English translation are unverified.'
