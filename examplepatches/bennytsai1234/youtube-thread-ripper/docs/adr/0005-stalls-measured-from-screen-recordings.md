# Stalls are counted from screen recordings

2026-10-03, `56d0c2f`. MediaSession BUFFERING disagreed with what the maintainer saw, so it is not used as the stall metric. Stalls are counted from a screen recording per period with ffmpeg freezedetect (freezes of 0.5 s or more after the first PLAYING), by `scripts/device/freeze-ab.sh` and `freeze-report.sh`. Frames with the buffering spinner still count as frozen.
