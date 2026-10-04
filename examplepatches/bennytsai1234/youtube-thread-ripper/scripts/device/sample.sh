#!/system/bin/sh
# Usage: sample.sh SECONDS  -> "<uptime> <STATE> <positionMs> <speed>" rows for the YouTube MediaSession.
# Sync marker: logcat (monotonic clock) gets the uptime value, so the two clocks can be aligned.
log -t TRSYNC "$(cut -d" " -f1 /proc/uptime)"
end=$(( $(cut -d. -f1 /proc/uptime) + $1 ))
while [ "$(cut -d. -f1 /proc/uptime)" -lt "$end" ]; do
  s=$(dumpsys media_session | awk '/package=app.morphe.android.youtube/{f=1} f&&/state=PlaybackState/{print; exit}')
  t=$(cut -d' ' -f1 /proc/uptime)
  echo "$t $s" | sed -E 's/^([0-9.]+) .*state=([A-Z_]+)\([0-9]+\), position=([0-9]+).*speed=([0-9.]+).*/\1 \2 \3 \4/'
  sleep 0.3
done
