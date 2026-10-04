#!/bin/sh
# Usage: freeze-report.sh OUTDIR  -> per period: startup, freezes (>= 0.5 s) after playback started,
# frozen seconds, patch download Mbps. Frames with the buffering spinner are still detected as frozen.
W="$1"
for f in "$W"/*.mp4; do
  name=$(basename "$f" .mp4); mode=${name%-*}; r=${name#*-}
  rec=$(grep "^STATE $mode r$r REC" "$W/rows.txt" | awk '{print $5}')
  first=$(grep "^STATE $mode r$r [0-9]" "$W/rows.txt" | awk '$5=="PLAYING"{print $4; exit}')
  skip=$(awk -v a="$first" -v b="$rec" 'BEGIN{printf "%.2f", a-b}')
  dur=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$f")
  ffmpeg -hide_banner -nostats -i "$f" -vf "crop=iw:ih*0.30:0:ih*0.05,freezedetect=n=0.003:d=0.5" -map 0:v -f null - 2>&1 \
    | grep -o "freeze_\(start\|duration\): [0-9.]*" | awk '{print $2}' | paste - - \
    | awk -v m="$mode" -v r="$r" -v skip="$skip" -v dur="$dur" -v mb="$(grep "^LOG $mode r$r .*delivered" "$W/rows.txt" | sed -E 's/.*delivered ([0-9]+) B in ([0-9]+) ms.*/\1 \2/' | awk '{b+=$1;t+=$2} END{if(t) printf "%.0f", b*8/t/1000; else printf "-"}')" \
      '$1 >= skip {n++; s+=$2; list=list sprintf(" %.1f@%.0fs", $2, $1-skip)} END{printf "%-3s r%s  start %5.1fs  watched %4.1fs  freezes %d  frozen %4.1fs (%2.0f%%)  dl %s Mbps |%s\n", m, r, skip, dur-skip, n, s, 100*s/(dur-skip), mb, list}'
done | sort -k2,2 -k1,1
