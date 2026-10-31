#!/bin/bash
# SPDX-FileCopyrightText: 2026 JoanComasFdz
# SPDX-License-Identifier: GPL-3.0-only
# Per-session connection to the emulator from a Claude Code cloud session (patcher-specific-build.md, "Cloud sessions").
#   source tools/e2e/connect.sh -> joins the tailnet, fetches and verifies the clean base APK into .e2e/, wakes Android,
#                                  forwards ADB, starts Appium here in the session (the session-start hook installs
#                                  it; the emulator host runs none), takes the device lease, exports
#                                  E2E_ADB_SERIAL / E2E_APPIUM_URL / E2E_APPIUM_UDID / E2E_ARTIFACTS_DIR
#   tools/e2e/connect.sh --down -> releases the lease, disconnects, logs out
# Needs the environment's variables: TS_AUTHKEY_CLOUD (Tailscale auth key), E2E_EMULATOR_HOST (the emulator's name on the
# tailnet) and E2E_APK_CHECKSUM (the sha256 of the clean BaconReader Premium 6.1.4 APK the emulator host serves).
# Local ports 15555 (ADB, forwarded to the emulator host) and 14723 (the session's Appium): 5555 would make adb's
# emulator auto-scan show a phantom emulator-5554. Uses the tailnet name, never a 100.x IP: NO_PROXY contains
# 100.64.0.0/10, so curl would bypass the tailnet. `tailscale nc` exits 0 even when nothing answers: check for bytes
# instead.
SOCK=/tmp/ts.sock
TS="tailscale --socket=$SOCK"
CURL="curl -fsS --noproxy '' -x http://127.0.0.1:1055 -m 30"
SERIAL=127.0.0.1:15555
LEASE_MINUTES=${LEASE_MINUTES:-30}
# Lease holder: one random id per session ($HOSTNAME is "vm" in every cloud container).
ID_FILE=/tmp/e2e-session-id
[ -s "$ID_FILE" ] || head -c 6 /dev/urandom | od -An -tx1 | tr -d ' \n' > "$ID_FILE"
SESSION_ID=$(cat "$ID_FILE")
# The repository's root, whatever folder this is sourced from.
REPO=$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")/../.." && pwd)

if [ "${1:-}" = "--down" ]; then
  # only our own lease; say what happened, the lease can't be checked once adb is disconnected
  case "$(adb -s "$SERIAL" shell "if grep -q '^$SESSION_ID ' /data/local/tmp/e2e-lease 2>/dev/null; then rm -f /data/local/tmp/e2e-lease && echo released; elif [ -s /data/local/tmp/e2e-lease ]; then echo other; else echo none; fi" 2>/dev/null | tr -d '\r')" in
    released) echo "lease released" ;;
    other)    echo "lease belongs to another session, left in place" ;;
    none)     echo "no lease on the device" ;;
    *)        echo "lease not checked (device not reachable)" ;;
  esac
  adb disconnect "$SERIAL" >/dev/null 2>&1
  adb kill-server >/dev/null 2>&1
  pkill -f "^socat TCP-LISTEN:15555" ; pkill -f "appium/node_modules/.bin/appium --address 127.0.0.1 --port 14723"
  $TS logout >/dev/null 2>&1; pkill -x tailscaled
  # wait (max 10 s) until they are gone, so a check right after --down sees nothing left
  for _ in $(seq 1 20); do
    pgrep -f "^socat TCP-LISTEN:15555|appium --address 127.0.0.1 --port 14723" >/dev/null || pgrep -x tailscaled >/dev/null || break
    sleep 0.5
  done
  echo "disconnected"; return 0 2>/dev/null || exit 0
fi

H=${E2E_EMULATOR_HOST:-}
[ -n "$H" ] || { echo "E2E_EMULATOR_HOST is not set (the emulator's name on the tailnet): add it to the environment's variables"; return 1 2>/dev/null || exit 1; }
SUM=${E2E_APK_CHECKSUM:-}
[ -n "$SUM" ] || { echo "E2E_APK_CHECKSUM is not set (the sha256 of the clean base APK): add it to the environment's variables"; return 1 2>/dev/null || exit 1; }
[ -n "${TS_AUTHKEY_CLOUD:-}" ] || { echo "TS_AUTHKEY_CLOUD is not set: add it to the environment's variables"; return 1 2>/dev/null || exit 1; }

if ! $TS status >/dev/null 2>&1; then
  setsid -f tailscaled --tun=userspace-networking --state=mem: --socket=$SOCK \
    --outbound-http-proxy-listen=127.0.0.1:1055 </dev/null >/tmp/tailscaled.log 2>&1
  sleep 1
  $TS up --auth-key="$TS_AUTHKEY_CLOUD" --hostname="cloud-$RANDOM" --timeout=90s || { echo "tailscale up failed"; return 1 2>/dev/null || exit 1; }
fi

# The clean base APK from the emulator host's read-only /files/, verified against E2E_APK_CHECKSUM, kept for the
# session. Its file name ends with the checksum's first 8 characters.
ARTIFACTS=$REPO/.e2e
APK=com.onelouder.baconreader.premium-6.1.4-clean-base-${SUM:0:8}.apk
mkdir -p "$ARTIFACTS"
if ! { [ -f "$ARTIFACTS/$APK" ] && echo "$SUM  $ARTIFACTS/$APK" | sha256sum -c --quiet 2>/dev/null; }; then
  eval $CURL -m 300 -o "'$ARTIFACTS/$APK.part'" "https://$H/files/$APK" &&
    echo "$SUM  $ARTIFACTS/$APK.part" | sha256sum -c --quiet && mv "$ARTIFACTS/$APK.part" "$ARTIFACTS/$APK" ||
    { rm -f "$ARTIFACTS/$APK.part"; echo "base APK $APK: download or sha256 check failed"; }
fi

echo "wake: $(eval $CURL -m 120 https://$H/wake)"   # answers at once; 120 s is a safety margin
for i in $(seq 1 60); do
  st=$(eval $CURL https://$H/status)
  case "$st" in ready) break ;; failed*) echo "$st"; return 1 2>/dev/null || exit 1 ;; esac
  sleep 5
done
echo "android: $st"

# setsid -f: fully detached daemons, no shell job holding the caller's stdout. With `cmd || socat … &`
# bash backgrounds the whole list as a subshell that keeps the pipe of `source connect.sh | tee` open.
pgrep -f "^socat TCP-LISTEN:15555" >/dev/null ||
  setsid -f socat TCP-LISTEN:15555,bind=127.0.0.1,fork,reuseaddr EXEC:"$TS nc $H 5555" </dev/null >/dev/null 2>&1
sleep 1
adb connect "$SERIAL" >/dev/null && adb -s "$SERIAL" wait-for-device

holder=$(adb -s "$SERIAL" shell cat /data/local/tmp/e2e-lease 2>/dev/null)
if [ -n "$holder" ] && [ "${holder##* }" -gt "$(date +%s)" ] && [ "${holder%% *}" != "$SESSION_ID" ]; then
  echo "device leased by another session: $holder"
  echo "(tunnel and forwards stay up; wait and re-run, or clean up with: tools/e2e/connect.sh --down)"
  return 1 2>/dev/null || exit 1
fi
adb -s "$SERIAL" shell "echo $SESSION_ID $(( $(date +%s) + LEASE_MINUTES * 60 )) > /data/local/tmp/e2e-lease"

# Appium runs here, in the session, and drives the device over adb (its UiAutomator2 server on the device is reached
# through an adb forward). It finds adb in $ANDROID_HOME/platform-tools (the hook links it there).
APPIUM_BIN=/opt/appium/node_modules/.bin/appium
if ! curl -fsS --noproxy '*' -m 3 http://127.0.0.1:14723/status >/dev/null 2>&1; then
  [ -x "$APPIUM_BIN" ] || { echo "Appium isn't installed ($APPIUM_BIN): rerun .claude/hooks/session-start.sh"; return 1 2>/dev/null || exit 1; }
  ANDROID_HOME=${ANDROID_HOME:-/opt/android-sdk} ANDROID_SDK_ROOT=${ANDROID_HOME:-/opt/android-sdk} APPIUM_HOME=/opt/appium/home \
    setsid -f "$APPIUM_BIN" --address 127.0.0.1 --port 14723 --log /tmp/appium.log --log-level info </dev/null >/dev/null 2>&1
  for _ in $(seq 1 60); do
    curl -fsS --noproxy '*' -m 3 http://127.0.0.1:14723/status >/dev/null 2>&1 && break
    sleep 0.5
  done
  curl -fsS --noproxy '*' -m 3 http://127.0.0.1:14723/status >/dev/null 2>&1 ||
    { echo "Appium didn't start (/tmp/appium.log)"; return 1 2>/dev/null || exit 1; }
fi

# Appium's helper apps live on the device. They are gone after the emulator is recreated: then the first session
# must install them (~25 s), so the tests open it without the two skip capabilities (E2E_APPIUM_INSTALL_HELPERS).
unset E2E_APPIUM_INSTALL_HELPERS
# Each of the three by its exact name: `pm list packages <name>` filters by substring (….server matches ….server.test).
installed=$(adb -s "$SERIAL" shell pm list packages io.appium | tr -d '\r')
missing=0
for helper in io.appium.uiautomator2.server io.appium.uiautomator2.server.test io.appium.settings; do
  grep -qx "package:$helper" <<< "$installed" || missing=1
done
if [ $missing -eq 1 ]; then
  echo "note: Appium helpers not installed on the device: the first Appium session installs them (~25 s)"
  export E2E_APPIUM_INSTALL_HELPERS=1
fi

export E2E_ADB_SERIAL=$SERIAL
export E2E_APPIUM_URL=http://127.0.0.1:14723
export E2E_APPIUM_UDID=$SERIAL    # the device as the session's Appium sees it: adb's serial
export E2E_ARTIFACTS_DIR=$ARTIFACTS    # the clean base APK
echo "ready: adb -s $E2E_ADB_SERIAL, Appium at $E2E_APPIUM_URL (in this session; device udid $SERIAL), lease ${LEASE_MINUTES} min"
