#!/bin/bash
# SPDX-FileCopyrightText: 2026 JoanComasFdz
# SPDX-License-Identifier: GPL-3.0-only
# The phone's lease (tests/BaconReader.E2E/README.md, "The phone"): one device, shared by the cloud sessions and the
# NAS's runner, so whoever plays scenarios on it first writes "<holder id> <expiry>" to /data/local/tmp/e2e-lease.
# Same file in both BaconReader repos; connect.sh and nas/run.sh use it.
#   tools/e2e/lease.sh take <adb serial> <holder id> [<minutes>]    -> takes the lease, or renews it when it's the holder's
#   tools/e2e/lease.sh keep <adb serial> <holder id> [<minutes>]    -> renews it every 10 minutes until killed
#   tools/e2e/lease.sh release <adb serial> <holder id>             -> removes it, only when it's the holder's
# take prints "taken" (exit 0) or "leased by another session: <holder id> <expiry>" (exit 3). release prints "released",
# "other" (another holder's: left in place) or "none" (exit 0). Exit 1: adb couldn't reach the device.
# The check and the write run in one adb shell command, against the device's clock, so two holders can't both take it
# from one read. An expired lease is anyone's. A holder id is letters, digits, '.', '_' and '-'.
set -uo pipefail

FILE=/data/local/tmp/e2e-lease
action=${1:-}
serial=${2:-}
holder=${3:-}
minutes=${4:-30}
if [ -z "$action" ] || [ -z "$serial" ] || [[ ! $holder =~ ^[A-Za-z0-9._-]+$ ]] || [[ ! $minutes =~ ^[0-9]+$ ]]; then
  sed -n '6,13p' "$0" >&2
  exit 2
fi

take() {
  local said
  # $(( )) and the tests run in the device's shell: the \$ are its, the rest is filled in here.
  said=$(adb -s "$serial" shell "now=\$(date +%s); held=\$(cat $FILE 2>/dev/null); \
if [ -n \"\$held\" ] && [ \"\${held##* }\" -gt \"\$now\" ] 2>/dev/null && [ \"\${held%% *}\" != '$holder' ]; then \
echo \"busy \$held\"; else echo \"$holder \$((now + $minutes * 60))\" > $FILE && echo taken; fi" 2>/dev/null | tr -d '\r')
  case "$said" in
    taken) echo taken ;;
    busy\ *) echo "leased by another session: ${said#busy }"; return 3 ;;
    *) echo "lease not checked (device not reachable)"; return 1 ;;
  esac
}

case "$action" in
  take) take ;;
  keep)
    # The sleep runs in the background and the loop waits for it, so a kill stops the sleep too: left behind, it would
    # hold the caller's output (a pipe to tee) open for up to 10 minutes.
    trap 'kill "$nap" 2> /dev/null; exit 0' TERM INT
    while true; do
      sleep 600 &
      nap=$!
      wait "$nap"
      take > /dev/null || echo "lease.sh: couldn't renew the lease of $holder" >&2
    done
    ;;
  release)
    said=$(adb -s "$serial" shell "if grep -q '^$holder ' $FILE 2>/dev/null; then rm -f $FILE && echo released; \
elif [ -s $FILE ]; then echo other; else echo none; fi" 2>/dev/null | tr -d '\r')
    case "$said" in
      released|other|none) echo "$said" ;;
      *) echo "lease not checked (device not reachable)"; exit 1 ;;
    esac
    ;;
  *) sed -n '6,13p' "$0" >&2; exit 2 ;;
esac
