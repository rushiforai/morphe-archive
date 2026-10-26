#!/usr/bin/env bash
# Reproducible, fail-closed diagnostic: <label> <original-or-resigned-apk>.
# Original and control MUST use the same non-incremental adb install path.
# This script does not assert account/login or English UI is functional.
set -uo pipefail
LABEL="$1"; APK="$2"; PKG=com.taobao.taobao
OUT="out/$LABEL"
mkdir -p "$OUT"
adb uninstall "$PKG" > "$OUT/uninstall.txt" 2>&1 || true
adb logcat -c || true

# Previous CI allowed adb to install the original by streaming and the
# re-signed control via Incremental FS. This difference confounded its logs.
adb install --no-incremental -r -g "$APK" > "$OUT/install.txt" 2>&1
INSTALL_RESULT=$?
cat "$OUT/install.txt"
if [ "$INSTALL_RESULT" -ne 0 ] || ! adb shell pm path "$PKG" | grep -q 'package:'; then
  echo 'PACKAGE_INSTALL_FAILED' > "$OUT/status-stage.txt"
  timeout 35s adb logcat -d -v threadtime > "$OUT/logcat.txt" || true
  python3 scripts/classify_emulator_probe.py "$OUT" --out "$OUT/status.json" || true
  exit 1
fi

adb shell dumpsys package "$PKG" | grep -iE 'signatures|versionName|primaryCpuAbi' > "$OUT/pkg.txt" || true
adb shell monkey -p "$PKG" -c android.intent.category.LAUNCHER 1 > "$OUT/launch.txt" 2>&1 || true

tap_consent() {
  timeout 12s adb exec-out uiautomator dump /dev/tty 2>/dev/null |
    sed 's/UI hierchary dumped.*//' > "$OUT/consent_ui.xml" || return 1
  python3 - "$OUT/consent_ui.xml" <<'PY'
import re,sys,subprocess,xml.etree.ElementTree as ET
try:
    root=ET.parse(sys.argv[1]).getroot()
except (ET.ParseError,OSError):
    raise SystemExit(1)
# Consent only; never auto-submit a user login or payment action.
words=("同意并继续","同意","Agree","允许","Allow","知道了","跳过","Skip")
for word in words:
    for node in root.iter("node"):
        label=(node.get("text") or "")+"|"+(node.get("content-desc") or "")
        if word not in label: continue
        coords=re.findall(r"\d+",node.get("bounds") or "")
        if len(coords)!=4: continue
        a,b,c,d=map(int,coords)
        subprocess.run(["adb","shell","input","tap",str((a+c)//2),str((b+d)//2)],check=False)
        print("consent control tapped (label suppressed)")
        raise SystemExit(0)
raise SystemExit(1)
PY
}

# Fast exit if the real app dies; previous CI idled and later captured only
# the Android launcher, falsely yielding a green workflow.
for attempt in $(seq 1 9); do
  sleep 5
  timeout 10s adb shell pidof "$PKG" > "$OUT/process-during-start.txt" 2>/dev/null || true
  if [ ! -s "$OUT/process-during-start.txt" ]; then
    echo 'PROCESS_EXITED_DURING_STARTUP' > "$OUT/status-stage.txt"
    break
  fi
  # Do not trigger an expensive uiautomator dump on every poll.
  if [[ "$attempt" == 1 || "$attempt" == 4 || "$attempt" == 8 ]]; then
    tap_consent || true
  fi
done

timeout 20s adb exec-out uiautomator dump /dev/tty > "$OUT/home_ui.xml" 2>/dev/null || true
timeout 20s adb exec-out screencap -p > "$OUT/home.png" 2>/dev/null || true
timeout 10s adb shell pidof "$PKG" > "$OUT/process.txt" 2>/dev/null || true
adb logcat -d -v threadtime > "$OUT/logcat.txt" || true
grep -iE 'mtop|SecurityGuard|sgmain|x-sign|FAIL_SYS|ERRCODE|SG_ERROR|signature|FATAL|ANR|SIGABRT' "$OUT/logcat.txt" |
  head -400 > "$OUT/logcat_key.txt" || true
grep -oE '(FAIL_SYS_[A-Z_]+|SG_ERROR_CODE[^,]*|ANDROID_SYS_[A-Z_]+)' "$OUT/logcat.txt" |
  sort | uniq -c | sort -rn > "$OUT/error_codes.txt" || true
python3 scripts/classify_emulator_probe.py "$OUT" --out "$OUT/status.json"
