#!/usr/bin/env bash
# Emulator-only MediaProjection consent discovery. Does not accept any system
# consent automatically; captures a test-only UI hierarchy for CI diagnostics.
set -euo pipefail
pkg=dev.goodlight999.taobaolingo.overlay
dir="${RUNNER_TEMP:-/tmp}"
adb shell appops set "$pkg" SYSTEM_ALERT_WINDOW allow
adb shell am force-stop "$pkg"
adb shell am start -W -n "$pkg/.MainActivity"
sleep 2
adb shell uiautomator dump /sdcard/taobaolingo-main.xml >/dev/null
adb pull /sdcard/taobaolingo-main.xml "$dir/taobaolingo-main.xml" >/dev/null
python3 - "$dir/taobaolingo-main.xml" <<'PY'
import sys
import re
import subprocess
import xml.etree.ElementTree as ET
root = ET.parse(sys.argv[1]).getroot()
found = []
for node in root.iter('node'):
    if node.attrib.get('text') == '画面翻訳を開始':
        bounds = node.attrib.get('bounds', '')
        xy = [int(x) for x in re.findall(r'\d+', bounds)]
        if len(xy) == 4: found.append(((xy[0]+xy[2])//2, (xy[1]+xy[3])//2))
if len(found) != 1:
    raise SystemExit('Could not locate exactly one start-translation button')
subprocess.run(['adb','shell','input','tap',str(found[0][0]),str(found[0][1])],check=True)
PY
sleep 3
adb shell uiautomator dump /sdcard/taobaolingo-projection.xml || true
adb pull /sdcard/taobaolingo-projection.xml "$dir/taobaolingo-projection.xml" || true
adb exec-out screencap -p > "$dir/taobaolingo-projection.png" || true
echo 'Captured the Android MediaProjection consent UI for automated test development.'
cat > "$dir/tap_dialog_node.py" <<'PY'
import re
import subprocess
import sys
import xml.etree.ElementTree as ET
root = ET.parse(sys.argv[1]).getroot()
target = sys.argv[2]
candidates = []
for node in root.iter('node'):
    text = node.attrib.get('text', '')
    if text == target:
        values = [int(v) for v in re.findall(r'\d+', node.attrib.get('bounds', ''))]
        if len(values) == 4:
            candidates.append(((values[0] + values[2]) // 2,
                               (values[1] + values[3]) // 2))
if len(candidates) != 1:
    raise SystemExit(f'Expected one node {target!r}, got {len(candidates)}')
subprocess.run(['adb','shell','input','tap',str(candidates[0][0]),str(candidates[0][1])],
               check=True)
PY
python3 "$dir/tap_dialog_node.py" "$dir/taobaolingo-projection.xml" 'A single app'
sleep 1
adb shell uiautomator dump /sdcard/taobaolingo-projection-choice.xml >/dev/null
adb pull /sdcard/taobaolingo-projection-choice.xml "$dir/taobaolingo-projection-choice.xml" >/dev/null
python3 "$dir/tap_dialog_node.py" "$dir/taobaolingo-projection-choice.xml" 'Entire screen'
sleep 1
adb shell uiautomator dump /sdcard/taobaolingo-projection-ready.xml >/dev/null
adb pull /sdcard/taobaolingo-projection-ready.xml "$dir/taobaolingo-projection-ready.xml" >/dev/null
python3 "$dir/tap_dialog_node.py" "$dir/taobaolingo-projection-ready.xml" 'Start'
sleep 12
adb shell dumpsys activity services > "$dir/taobaolingo-services.txt"
adb shell dumpsys display > "$dir/taobaolingo-display.txt"
adb shell dumpsys notification > "$dir/taobaolingo-notifications.txt"
adb logcat -d -v brief -t 1800 > "$dir/taobaolingo-logcat.txt"
adb exec-out screencap -p > "$dir/taobaolingo-post-consent.png"
grep -Fq 'dev.goodlight999.taobaolingo.overlay/.CaptureService' "$dir/taobaolingo-services.txt" \
  || { echo 'CaptureService did not remain running'; exit 1; }
grep -Fq 'TaobaoLingoOverlay' "$dir/taobaolingo-display.txt" \
  || { echo 'Virtual display was not created'; exit 1; }
if grep -A4 'Process: dev.goodlight999.taobaolingo.overlay' "$dir/taobaolingo-logcat.txt" | grep -q 'FATAL EXCEPTION'; then
  echo 'App process fatal exception detected'
  exit 1
fi
echo 'PASS: MediaProjection permission granted and CaptureService running'

