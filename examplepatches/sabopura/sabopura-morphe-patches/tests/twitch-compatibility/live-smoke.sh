#!/usr/bin/env bash
# usage: live-smoke.sh <on|off|full> [seconds] [output-dir]
#
# Opens a real live stream in the installed, patched Twitch without an account and checks
# that the app keeps working while it plays: no ANR or crash, a main thread that is not
# spinning or stuck in patch code, and a chat that keeps moving. "on"/"off" set every Hide
# option; "full" also turns on the brightness/volume swipes and the danmaku.
#
# Needs a test emulator with a root shell (Google APIs image) and network access. Twitch only
# shows its logged-out home when its Eppo experiment "logged_out_experiment_variant" says
# so, and only for so many launches (logged_out_app_open_count); the script sets "variant1",
# resets the count and removes Twitch's saved experiment answers before each launch, and
# retries when Twitch still asks to log in. Logged-out viewing ends with a sign-up prompt after
# a few minutes; launch again for another run.
#
# Environment: ADB (default "adb"), ANDROID_SERIAL (the emulator), PYTHON (default python3).
set -u
MODE=${1:?on, off or full}; WATCH=${2:-40}; OUT=${3:-live-smoke-out}
ADB=${ADB:-adb}; PYTHON=${PYTHON:-python3}
PKG=tv.twitch.android.app
D=/data/data/$PKG/shared_prefs
export MSYS_NO_PATHCONV=1
mkdir -p "$OUT"
sh() { "$ADB" shell "$@"; }
fail=0
check() { if [ "$1" = ok ]; then echo "PASS $2"; else echo "FAIL $2"; fail=$((fail + 1)); fi; }

"$ADB" root > /dev/null 2>&1; "$ADB" wait-for-device
# Android 15+ cuts the network of background processes; a test may start Twitch that way.
sh dumpsys deviceidle whitelist +$PKG > /dev/null
sh am force-stop $PKG
OWNER=$(sh stat -c %u:%g $D | tr -d '\r\n')
# put <file> <key=value>...: rewrites one of the patch's preference files.
put() {
  local file=$1; shift
  sh cat $D/$file 2>/dev/null | "$PYTHON" -c '
import re, sys
text = sys.stdin.read()
if "<map" not in text:
    text = "<?xml version=\x271.0\x27 encoding=\x27utf-8\x27 standalone=\x27yes\x27 ?>\n<map>\n</map>\n"
text = text.replace("<map />", "<map>\n</map>")
for pair in sys.argv[1:]:
    key, value = pair.split("=", 1)
    line = "    <boolean name=\"%s\" value=\"%s\" />" % (key, value)
    pattern = r"\s*<boolean name=\"%s\" value=\"[a-z]+\" />" % re.escape(key)
    text = re.sub(pattern, "\n" + line, text, count=1) if re.search(pattern, text) else text.replace("</map>", line + "\n</map>")
sys.stdout.write(text)
' "$@" > "$OUT/$file"
  sh "cat > /data/local/tmp/$file" < "$OUT/$file"
  sh "cp /data/local/tmp/$file $D/$file && chown $OWNER $D/$file && chmod 660 $D/$file && restorecon $D/$file"
}
value=true; [ "$MODE" = off ] && value=false
CHAT=""
for key in hide_chat_header hide_vod_header hide_leaderboards hide_hype_train hide_bits hide_cast hide_clips \
    hide_share hide_unfollow hide_create hide_input hide_landscape_input hide_pinned hide_stories hide_discover \
    hide_one_chat_popup hide_recaps; do CHAT="$CHAT $key=$value"; done
[ "$MODE" = full ] && CHAT="$CHAT brightness_gesture=true volume_gesture=true"
put sabopura_chat.xml $CHAT
[ "$MODE" = full ] && put sabopura_twitch_danmaku.xml enabled=true

for attempt in 1 2 3 4 5; do
  sh am force-stop $PKG
  sh "sed -i 's/name=\"logged_out_experiment_variant\">[^<]*</name=\"logged_out_experiment_variant\">variant1</; s/name=\"logged_out_app_open_count\" value=\"[0-9]*\"/name=\"logged_out_app_open_count\" value=\"1\"/' $D/twitch_app_prefs.xml"
  sh "rm -f /data/data/$PKG/files/eppo-sdk-config-*.json"
  "$ADB" logcat -c
  sh monkey -p $PKG -c android.intent.category.LAUNCHER 1 > /dev/null 2>&1
  top=""
  for i in $(seq 1 25); do
    top=$(sh dumpsys activity activities | grep -m1 topResumedActivity)
    case "$top" in *ViewerLandingActivity*|*LoginActivity*) break;; esac
    sleep 1
  done
  case "$top" in *ViewerLandingActivity*) break;; esac
  echo "INFO attempt $attempt: Twitch asked to log in"
done
case "$top" in *ViewerLandingActivity*) ;; *) echo "FAIL Twitch did not open its logged-out home"; echo "RESULT failed=1"; exit 1;; esac
sleep 6
sh input keyevent 4   # the welcome sheet
sleep 2
# A stream with content classification labels opens behind an "intended for certain audiences"
# screen instead of playing; take the first one without labels after the most watched.
CHANNEL=$(curl -s -H "Client-ID: kimne78kx3ncx6brgo4mv6wki5h1ko" https://gql.twitch.tv/gql \
  -d '{"query":"{ streams(first: 10, options: {sort: VIEWER_COUNT}) { edges { node { broadcaster { login } contentClassificationLabels { id } } } } }"}' \
  | "$PYTHON" -c "import sys, json; e = [x['node'] for x in json.load(sys.stdin)['data']['streams']['edges']]; ok = [n for n in e[1:] if not n.get('contentClassificationLabels')]; print((ok or e)[0]['broadcaster']['login'])")
echo "INFO channel $CHANNEL, mode $MODE"
sh am start -a android.intent.action.VIEW -d "https://www.twitch.tv/$CHANNEL" $PKG > /dev/null
sleep 12
PID=$(sh pidof $PKG | tr -d '\r')
ticks() { sh cat /proc/$PID/task/$PID/stat | awk '{print $14 + $15}'; }
# The screen's texts. uiautomator gives up when the screen never goes idle (the danmaku keeps
# moving), so the file is removed first: a failed dump must not hand back an older one.
screen() { sh rm -f /sdcard/live-smoke.xml; sh uiautomator dump /sdcard/live-smoke.xml > /dev/null 2>&1; sh cat /sdcard/live-smoke.xml 2>/dev/null | grep -o 'text="[^"]*"' | sort | cksum; }
NOTHING=$(printf '' | cksum)
# The fallback: the chat area (55-90 % of the portrait screen) in a raw screenshot.
chat_area() { "$ADB" exec-out screencap > "$OUT/chat-$1.raw"; "$PYTHON" -c "import sys, struct, hashlib; d = open(sys.argv[1], 'rb').read(); w, h = struct.unpack('<II', d[:8]); o = len(d) - w * h * 4; print(hashlib.md5(d[o + w * 4 * int(h * 0.55):o + w * 4 * int(h * 0.9)]).hexdigest())" "$OUT/chat-$1.raw"; }
first=$(screen); area0=$(chat_area 0); t0=$(ticks); s0=$(date +%s)
sleep "$WATCH"
t1=$(ticks); s1=$(date +%s); last=$(screen); area1=$(chat_area 1)
"$ADB" exec-out screencap -p > "$OUT/live.png"
busy=$(( (t1 - t0) * 100 / ((s1 - s0) * 100) ))   # clock ticks are 1/100 s
echo "INFO main thread busy ${busy}% over $((s1 - s0)) s"
"$ADB" logcat -d > "$OUT/logcat.txt"
[ "$(grep -cE "ANR in $PKG|Input dispatching timed out" "$OUT/logcat.txt")" = 0 ] && check ok "no ANR" || check no "no ANR"
alive=$(sh pidof $PKG | tr -d '\r')
[ "$(grep -A3 'FATAL EXCEPTION' "$OUT/logcat.txt" | grep -c "$PKG")" = 0 ] && [ "$alive" = "$PID" ] \
  && check ok "no crash, same process" || check no "no crash, same process ($PID -> $alive)"
[ "$busy" -lt 85 ] && check ok "main thread not spinning (${busy}%)" || check no "main thread not spinning (${busy}%)"
if [ "$first" != "$NOTHING" ] && [ "$last" != "$NOTHING" ]; then
  [ "$first" != "$last" ] && check ok "the screen keeps changing (chat moves)" || check no "the screen keeps changing"
else
  [ -n "$area0" ] && [ "$area0" != "$area1" ] && check ok "the chat area keeps changing (screenshots; uiautomator could not read the screen)" \
    || check no "the chat area keeps changing (screenshots; uiautomator could not read the screen)"
fi
stuck=0
for s in 1 2 3; do
  sh debuggerd -j "$PID" > "$OUT/stack$s.txt" 2>&1
  [ "$(awk '/^"main"/,/^$/' "$OUT/stack$s.txt" | grep -c "io.github.sabopura")" != 0 ] && stuck=$((stuck + 1))
  sleep 1
done
[ "$stuck" -lt 3 ] && check ok "main thread not stuck in patch code ($stuck/3 samples)" || check no "main thread not stuck in patch code ($stuck/3 samples)"
echo "RESULT failed=$fail"
