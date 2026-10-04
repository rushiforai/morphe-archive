#!/system/bin/sh
# Phone side of net-monitor.sh. Every ~2 s prints:
# <wall time> rssi=<dBm> link=<Mbps> rx=<wlan0 Mbps since last row> drop=<wlan0 rx drops, cumulative>
#   gw=<ms> cf=<ms> node=<ms> thermal=<status 0-6> cpu=<deg C>
# gw = default gateway, cf = 1.1.1.1 (internet outside the cache), node = the video cache host
# (argument; take it from a /videoplayback host in the app log and resolve it, e.g. with ping).
# Ping is ICMP and may be deprioritized; compare it with the app's per-range throughput.
NODE=${1:?usage: netmon.sh CACHE_NODE_IP}
GW=$(ip route show table all | awk '/^default .* wlan0/{print $3; exit}')
p() { ping -c 1 -W 1 "$1" 2>/dev/null | grep -o 'time=[0-9.]*' | cut -d= -f2; }
last=$(awk '/wlan0:/{print $2}' /proc/net/dev); lt=$(cut -d' ' -f1 /proc/uptime)
while true; do
  w=$(cmd wifi status 2>/dev/null | grep -m1 -o 'RSSI: [-0-9]*, Link speed: [0-9]*')
  gw=$(p "$GW"); cf=$(p 1.1.1.1); nd=$(p "$NODE")
  rx=$(awk '/wlan0:/{print $2}' /proc/net/dev); drop=$(awk '/wlan0:/{print $5}' /proc/net/dev)
  t=$(cut -d' ' -f1 /proc/uptime)
  th=$(dumpsys thermalservice 2>/dev/null | awk '/^Thermal Status:/{s=$3} /mName=CPU,/ && !c{c=$0} END{sub(/.*mValue=/,"",c); sub(/,.*/,"",c); print s, c}')
  mbps=$(awk -v a="$last" -v b="$rx" -v t0="$lt" -v t1="$t" 'BEGIN{printf "%.0f", (b-a)*8/(t1-t0)/1e6}')
  last=$rx; lt=$t
  echo "$(date +%H:%M:%S) rssi=$(echo "$w" | sed -E 's/RSSI: ([-0-9]+).*/\1/') link=$(echo "$w" | sed -E 's/.*Link speed: //') rx=$mbps drop=$drop gw=${gw:-x} cf=${cf:-x} node=${nd:-x} thermal=${th% *} cpu=${th#* }"
  sleep 1.5
done
