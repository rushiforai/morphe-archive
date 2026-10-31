# Blackmagic Camera (Android) — performance findings from field testing

Independently measured on: **Samsung Galaxy S23 Ultra (SM-S918B, Snapdragon SM8550, Android 16)**, 
app **v3.5.0.0066**, 1080p30 H.265, bitrate MAX. 
Evidence collected via Perfetto traces (`bm.pftrace`, `bm2.pftrace`), logcat capture during recording 
(`logcat_rec1.txt`, `logcat_rec2.txt`), and a 1 Hz memory sampler (`memwatch1.csv`).

---

## 1. Random freezes during recording — root cause chain

**Symptom.** 700–820 ms stretches with zero video frames in the final MP4 while audio continues 
uninterrupted (e.g. 4 such holes in one Oct 24 clip). Sensor/HAL keeps receiving capture requests 
but produces nothing during the hole.

**Measured chain (Perfetto).**

| Metric | Good clip | Bad clip |
|---|---|---|
| Camera service capture request rate | 30/s | ~16.6/s |
| `requestStreamBuffers` avg latency | 1.4 ms | **145 ms** |
| HAL thread state during stall | running | asleep 430 ms |
| kswapd / kcompactd during stall | idle | heavy reclaim activity |
| System free memory around event | — | ~346 MB (lmkd "camera mode") |

**Interpretation.** This is a memory-pressure failure, not CPU overload (encoder thread never 
blocked > 7.5 ms in a clean trace). When RAM gets tight, kernel reclaim stalls the gralloc buffer 
allocation path; the HAL cannot return/request camera buffers, frames are lost permanently, and the 
muxer continues with audio only → the visible "freeze". In the worst case lmkd kills the whole app 
(it reached ~916 MB resident+swap = 0.5 GB RAM + 0.4 GB swapped).

**Contributing app-side factors we identified:**
- Camera session requests ~11 buffers per stream; with a 4K record stream present the buffer pool 
  alone reached ~137 MB (vs ~85 MB when all streams were 1080p-sized). Buffer pool size directly 
  translates into allocation pressure at exactly the point that stalls (`requestStreamBuffers`).
- Each record stop fully releases the encoders, and each start allocates their input graphic-buffer 
  pools again: ~33 MB per 1080p buffer, ≈130–330 MB total at 4K for the main+proxy encoders 
  (`max-input-size` is left at 0 so the codec picks its defaults — `p84.java:162`; envelope 
  construction at `mk7.java:21–31`). Nothing video-sized is retained after stop, so this is churn 
  rather than a leak — but it is allocation pressure at exactly the "next take starts" moment, on 
  devices where `requestStreamBuffers` already stalls under pressure. The muxer additionally keeps 
  a 1–3 s sample window in native memory (up to ~60 MB at 200 Mbps) before flushing fragments 
  (`vb2.java:243–247`, window constants in `d50`), and a small direct-buffer sample pool survives 
  across clips (`wu1` pool, `camera/domain/h.java:1366`).

---

## 2. In-app gallery — the single largest memory spike observed

Protocol: record 2–3 short clips, then open the in-app gallery and play one clip, with 1 Hz 
`dumpsys meminfo` sampling.

**Results (exact, from memwatch1.csv):**

| Event | Graphics mem | PSS | RSS |
|---|---|---|---|
| Camera screen steady | 105–180 MB | ~280 MB | ~380 MB |
| First gallery attempt (21:43:39) | — | — | app died, 6 s of empty samples, cold restart 21:43:45 |
| Gallery playback start (21:44:58) | **+255 MB in <1 s** | 613 MB | 698 MB |
| Playback continues (21:44:59) | **773 MB** (peak) | **1.21 GB** | **1.27 GB** |
| Playback end (21:45:00) | −577 MB collapse | 683→415 MB | 747→475 MB |

For perspective: decoding and presenting a 1080p HEVC clip needs a handful of surfaces — 
everything needed fits in roughly 30–50 MB of gralloc. The gallery path instead allocates 
**~570–600 MB of transient GPU/decoder buffers**, then frees them. On a phone where ~350 MB free 
memory is already marginal, the first gallery open is a coin-flip between "survive after 1.27 GB 
peak" and "low-memory-killed before you even see the grid". The 21:43:39 death of the whole app 
process was almost certainly exactly this pattern.

**Code references (all verified in the decompiled app):**

**Playback screen (largest single contributor):**

- _Player storm._ The player ViewModel (`com/blackmagicdesign/android/media/ui/player/l.java`) keeps
  two `ExoPlayer` instances alive for its whole lifetime and **fully recreates both of them**
  (`recreatePlayer()`, `l.java:358–446`: pause/stop/release, 500 ms suspend, rebuild both factories,
  re-prepare) every time the clip's apply-LUT condition flips in either direction
  (`VideoPlayerViewModel$recreatePlayer$1`, `l.S(Map)` sink chain
  `VideoPlayerViewModel$start$1$3.java:55`).
  Rebuild is also triggered on any playback exception. Volume of churn while simply paging through
  clips is illustrated by our logcat capture (`logcat_rec2.txt`): **30 `ExoPlayerImpl: Init` vs.
  28 `: Release` lines in ~17 s of browsing (~180 ms per player cycle), including 2 orphans created
  at 20:49:26 and never released**. Each recreation rebuilds the whole media3 effects graph
  (Float16 3D-LUT shader + `DefaultVideoFrameProcessor` with its own EGL context).

- _Screen exit keeps everything._ ON_STOP (`ut3`/`vt3` lifecycle effect → `ia5.a()` case 0,
  `ia5.java:52–58`) only pauses, stops, removes media items and prepares-**empty**; both
  players (and their full object graphs, factories and listeners) stay alive until the ViewModel is
  destroyed. Returning to the camera therefore leaves player overhead resident during recording.

- _Double decoder per clip switch._ `l.K(J)` prepares **both** players with the same MediaItem;
  `l.L()` then strips video tracks from the second player once it reaches READY
  (`l.java:222–291`, track-selection `sb1.Var.d(new j47(...))` at `l.smali:628–632`), so each clip
  switch briefly runs two full video decoders (or leaves one up if READY stalls).

- _Background/idle state._ After exit, `J` players stay prepared-empty IDLE (no codec active) but
  with complete ExoPlayer graphs resident.

**Gallery grid / browse:**

- _Unbounded placeholder cache._ `PlayerScreenViewModel` preloads placeholders for ±2 neighboring
  clips and stores them as bitmap copies at half video resolution in an **unbounded** 
  `MutableStateFlow<Map<Uri, Bitmap>>` (`PlayerScreenViewModel$updatePlaceHolders$1.java:112–184` →
  `defpackage/ka5.java:29–44`, field `media/ui/player/k.java:46–48`). 2.07 MB/entry at 1080p,
  8.3 MB at 4K → ≈ 200 MB after ~100 browsed takes.
- _Full-resolution decode for grid thumbs._ Each cell decodes at full video resolution through an
  ExoPlayer + GL renderer with RGBA readback (`defpackage/r94.java:76–103`, `gc2.java:39–110`,
  no resize configured in `fc2.java:27–41`) and then downscales in Java; the last full-res frame is
  pinned on a singleton (`ic2.java:24–27`) for the whole browsing session. 8.3 MB (1080p) / 33 MB
  (4K) per volatile frame.
- `MediaMetadataRetriever` never released (`utils/b.java:471–506`; per-clip native leak).
- Filmstrip thumbnails re-decode and double-copy per DIMS refresh
  (`manager/MediaManager$updateThumbnails$2.java:80–124`, `defpackage/bb4.java:36–55`).

**Instrumented-build patches we applied (personal build, for measurement):**
placeholder map capped at 4 entries; singleton full-frame pin removed; retriever `release()` added;
ON_STOP now fully releases both players and ON_START rebuilds them (mirroring `recreatePlayer`'s
epilogue, skipping the 500 ms delay); muxer pre-flush window halved (1 s→500 ms, 3 s→1.5 s);
remote-JPEG grid thumbs decode with sampling. All measured A/B deltas to follow.

---

## 3. Bitrate tier gap at 1080p30

The bitrate formula (`nr0.java:82`, tier multipliers in `BitrateLevel`) produces for 1080p30 H.265:

LOW 6 / MEDIUM 9 / HIGH 12 / MAX **160 Mbps**.

MAX is the SM8550 HEVC encoder ceiling, so the jump from HIGH to MAX is one order of magnitude — 
and anything 30 Mbps–160 Mbps is simply not selectable by the UI.

**Suggestion.** Keep MAX as the encoder cap, but express LOW/MEDIUM/HIGH as fractions of the 
encoder-reported max (25 / 50 / 75 %). On this device that yields 40 / 80 / 120 Mbps at any 
resolution, which is what our instrumented build now produces (verified: 117 Mbps at HIGH 1080p30).

---

## 4. Timestamp / stale-frame artifacts (secondary)

- The GL retiming path (`l27.a()` in the record renderer path) stamps output frames by slot count, 
  ignoring actual capture time. When the camera produces fewer frames than the target fps (e.g. 
  15 fps into a 30 fps file — see next bullet), the output shows a repeating frame pattern instead 
  of a correct cadence.
- In low light with manual exposure, the frame-duration formula drops the sensor to 15 fps; the 
  record pipeline does not compensate, so half the output frames are duplicates 
  (~202 frozen-frame indices observed in one clip).

---

## 5. Suggested fixes for Blackmagic

1. **Gallery memory:** decode thumbnails with `getScaledFrameAtTime()` at thumbnail size and keep 
   them in an `LruCache`; never hold grid thumbnails as 4K bitmaps. Cap the playback surface/texture 
   to the view size, use a single player instance for the whole gallery, and call `release()` 
   deterministically when leaving playback. Target: < 120 MB additional memory while the gallery is 
   open. *(code refs pending)*
2. **Record start/stop transient:** the encoder pipeline is fully released and rebuilt per clip 
   (~130–330 MB of codec graphic buffers at 4K). Consider keeping the configured codec across takes 
   (the persistent input surface is already reused), or trimming input buffer counts via 
   `KEY_MAX_INPUT_SIZE` / `setParameters` so the "next take" allocation is smaller.
3. **Muxer sample window:** the 1–3 s pre-flush sample window (native RAM, ~60 MB at 200 Mbps) could 
   be time-bounded tighter (e.g. 500 ms) with negligible fragmentation overhead. 
   *(code refs pending)*
4. **Camera buffer pool:** right-size stream capture to the recording output (or expose a "high 
   efficiency" mode that captures at output size); document/consider lowering `requestStreamBuffers` 
   pressure per stream from 11 buffers when the device reports low memory.
5. **Bitrate tiers:** expose intermediate bitrates (percentage of encoder max, or absolute Mbps), 
   particularly for 1080p where the current gap is 12→160 Mbps.
6. **Low-light fps handling:** don't let manual-exposure frame-duration math drop the sensor to 15 fps 
   in video mode without telling the recording pipeline; alternatively target 30 fps with the 
   exposure floor honored per-frame.
7. **Foreground lmkd kills:** investigate measuring/pinning the camera+encoder working set so the 
   foreground recorder survives gallery browsing moments.

---

## Appendix — our own instrumented build (for transparency, not part of the bug report)

We built a personal patch of v3.5.0.0066 (not distributed) to (a) expose intermediate bitrate 
tiers as 25/50/75 % of encoder max, (b) unlock the hidden internal settings menu on our device, 
(c) disable the PairIP license check so the modified build could run at all, and (d) halve the 
muxer's pre-flush sample window (1 s→500 ms, 3 s→1.5 s) to cut transient native RAM at high bitrate. 
Encoder reuse across clips and the wu1 sample-pool clear are planned as a second iteration. 
Findings above were measured on stock behavior, except where noted.
