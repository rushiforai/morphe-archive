#!/bin/sh
# Background network monitor while the phone is used normally, to localize intermittent slow
# downloads: Wi-Fi (rssi/link, router ping) vs home line/ISP (1.1.1.1) vs the cache node.
# Usage: net-monitor.sh OUTDIR CACHE_NODE_IP   (stop with kill; check `ps -ef` for leftovers afterwards)
# Writes OUTDIR/net.txt (phone samples) and OUTDIR/ranges.txt (per-range throughput, wall clock).
W="$1"; NODE="$2"; mkdir -p "$W"
MSYS_NO_PATHCONV=1 adb push "$(dirname "$0")/netmon.sh" /data/local/tmp/netmon.sh >/dev/null
MSYS_NO_PATHCONV=1 adb shell chmod 755 /data/local/tmp/netmon.sh
adb shell setprop debug.tr.log true
adb logcat -v time -s ThreadRipper:I | grep --line-buffered Closed >> "$W/ranges.txt" &
MSYS_NO_PATHCONV=1 adb shell /data/local/tmp/netmon.sh "$NODE" >> "$W/net.txt"
