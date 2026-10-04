#!/bin/sh
# Ground-truth stall comparison on the phone: screen recording + ffmpeg freezedetect per period.
# Usage: freeze-ab.sh OUTDIR [ROUNDS] [PERIOD_S] [VIDEO_ID] [START_S] ["OFF A B P"]
# Modes: OFF native, A one request per segment, B multi-connection, P = B + preload to
# PRELOAD_S (default 300) seconds of media within PRELOAD_MIB (default 250) of buffer memory.
# Each period cold-starts YouTube at a new, uncached position (START + 600 s per period; keep it
# inside the video length). Needs scripts/device/sample.sh pushed to /data/local/tmp (done here).
PRELOAD_S=${PRELOAD_S:-300}; PRELOAD_MIB=${PRELOAD_MIB:-250}
W="$1"; ROUNDS=${2:-3}; PERIOD=${3:-45}; VID=${4:-3YTohytF9oE}; START=${5:-1800}; MODES=${6:-"OFF B"}
mkdir -p "$W"; OUT="$W/rows.txt"; : > "$OUT"
MSYS_NO_PATHCONV=1 adb push "$(dirname "$0")/sample.sh" /data/local/tmp/sample.sh >/dev/null
MSYS_NO_PATHCONV=1 adb shell chmod 755 /data/local/tmp/sample.sh
adb shell setprop debug.tr.log true
pos=$START
for r in $(seq 1 $ROUNDS); do
  for mode in $MODES; do
    [ "$mode" = P ] || adb shell setprop debug.tr.preload_s 0
    case $mode in
      OFF) adb shell "setprop debug.tr.enabled false" ;;
      A) adb shell "setprop debug.tr.enabled true; setprop debug.tr.threads 1; setprop debug.tr.chunk_kib 65536" ;;
      B) adb shell "setprop debug.tr.enabled true; setprop debug.tr.threads 8; setprop debug.tr.chunk_kib 1024; setprop debug.tr.preload_s 0" ;;
      P) adb shell "setprop debug.tr.enabled true; setprop debug.tr.threads 8; setprop debug.tr.chunk_kib 1024; setprop debug.tr.preload_s $PRELOAD_S; setprop debug.tr.preload_mib $PRELOAD_MIB" ;;
    esac
    adb shell am force-stop app.morphe.android.youtube
    adb logcat -c
    MSYS_NO_PATHCONV=1 adb shell am start -a android.intent.action.VIEW -d "https://www.youtube.com/watch?v=$VID\&t=${pos}s" app.morphe.android.youtube >/dev/null
    rec=/sdcard/tr-$mode-$r.mp4
    MSYS_NO_PATHCONV=1 adb shell "echo REC \$(cut -d' ' -f1 /proc/uptime); nohup screenrecord --time-limit $((PERIOD + 3)) --bit-rate 6000000 $rec >/dev/null 2>&1 &" | sed "s/^/STATE $mode r$r /" >> "$OUT"
    MSYS_NO_PATHCONV=1 adb shell /data/local/tmp/sample.sh "$PERIOD" | sed "s/^/STATE $mode r$r /" >> "$OUT"
    sleep 4
    adb logcat -d -v monotonic -s ThreadRipper:* | grep -E "Closed|Load " | sed "s/^/LOG $mode r$r /" >> "$OUT"
    MSYS_NO_PATHCONV=1 adb pull $rec "$W/$mode-$r.mp4" >/dev/null && MSYS_NO_PATHCONV=1 adb shell rm $rec
    pos=$((pos + 600))
  done
done
adb shell "setprop debug.tr.enabled true; setprop debug.tr.threads 8; setprop debug.tr.chunk_kib 1024; setprop debug.tr.preload_s 300"
