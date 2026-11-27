# Spotify benchmark

Spotify keeps its own mixing analysis for each song (beat grid, mix cues, vocals, tempo, key), and
`research/spotify-mixes/spotify-analysis.json` (in YT Clients, format in its README "Spotify's own
song analysis") exports it for the 363 songs of the four Spotify mix playlists. This benchmark
scores each app's analyser against it. Asked for 2026-11-25: "we only pick from spotify rn to fix
ours, but lets see how far we can go".

Runner on the extension: `scripts/spotify_bench.mjs`. It lines the songs up, writes the key and
scores every app; the other apps only analyse and plan (rules 4 and 5).

**The bench folder** (shared by the three apps, in no repo):
`D:/Programs/Projects/YT Clients/research/spotify-mixes/bench/`

| Path | Written by | What |
|---|---|---|
| `audio/<videoId>.<ext>` | the PC, once | each song's YouTube audio as downloaded (yt-dlp, best audio only); every app reads this copy, none downloads its own |
| `key.json` | the PC | the answer key (rule 3) |
| `<app>/<videoId>.json` | each app (`pc`, `phone`, `bitchord`) | its analysis of that song (rule 4) |
| `<app>/plans.json` | each app | its plans of the export mixes (rule 5) |
| `report-<app>.json` | the PC | the scores (rule 7) |

## Rules

1. **[all] An answer key, not an import.** Spotify's numbers measure our analyser. No app reads
   Spotify's grid, cues or vocals when it plays, and nothing from it enters an app's git: the audio,
   the key file and the reports stay in the bench folder, outside the repos.

2. **[all] The songs:** every track of `spotify-analysis.json` with `beats`, joined by `uri` to the
   four exports (`research/spotify-mixes/*.json`), which give its `youtubeVideoId`, title and
   `durationMs`. A track with no YouTube id is left out and counted.

3. **[all] Lining up (the PC does it once, every app reads it).** A YouTube copy can start earlier or
   later than Spotify's file, and some are another cut (a music video's intro). For each song:
   - Both envelopes in 20 ms windows: Spotify's `threeBand` (low + mid + high; each band is protobuf
     packed varints, one value per 20 ms, a value over 127 taking two bytes) and the YouTube copy's
     RMS of the mono mix × 255, 20 ms windows from 0 s. Each as log(1 + x), with its mean taken off.
     (Spotify's beats and vocal windows run to the YouTube copy's length; on the first 8 songs every
     offset came out within 15 ms, scores 0.95-0.99.)
   - The offset `offsetSec` is the lag with the highest normalized cross-correlation within ±15 s,
     refined between windows by a parabola through the peak and its neighbours (to about 2 ms).
     YouTube time = Spotify time + `offsetSec`.
   - `alignScore` is that correlation. Under 0.6, the song is "not lined up" (another cut or
     another recording): it is reported and left out of every metric.
   - The PC writes the key file `key.json`, with every Spotify time already moved to YouTube time
     and rounded to 1 ms:

     ```json
     { "format": "spotify-bench-key", "version": 1,
       "songs": { "<videoId>": { "uri": "spotify:track:…", "title": "…", "offsetSec": 0.412, "alignScore": 0.93,
         "bpm": 114.71, "camelot": "1A",
         "beats": [0.721, 1.244, …], "downbeats": [0.721, 2.813, …],
         "cues": { "mixIn": 10.137, "mixOut": 160.774, "fadeIn": [10.142, …], "fadeOut": […] },
         "sung": [[12.3, 18.9], …] } },
       "skipped": [{ "videoId": "…", "why": "not lined up (0.41)" }] }
     ```

     `bpm` is 60 over the median beat interval of `beats` (Spotify's `attributes.tempo` is rounded
     to its own grid); `downbeats` are the beats with downbeat 1; `sung` joins Spotify's
     `vocalActivity` windows (value 0-100, window i from `firstWindowStart + i × hop / sampleRate`
     s, `hop / sampleRate` long) at 50 or more into spans, gaps under 0.3 s closed.

4. **[each app] Its analyses.** Each app decodes `audio/<videoId>.<ext>` for every song of the key
   file, analyses it with its own analyser as it runs in the app (its own decoder and resampler; a
   desktop-only analyser may run inside its app, offline), and writes each as analysis.schema.json
   to `<app>/<videoId>.json`.

5. **[each app] Its plans.** For every mix of the four exports whose two songs are both in the key,
   each app plans the pair with its own planner on its own two analyses: Auto, default settings, the
   blend planner (the loop mix is left out: its points come from vocal-free bars, not cues), playhead
   `pos` 30 s and `earliest` 34.5 s, so the planner's own mix-out is free to come anywhere after the
   first 35 s. It writes them to `<app>/plans.json`:

   ```json
   { "format": "spotify-bench-plans", "version": 1, "app": "phone", "analysisVersion": "ayham.2",
     "plans": [ { "playlist": "budget-dj-mix", "index": 4, "from": "<videoId>", "to": "<videoId>",
       "style": "blend", "mixOutTrackTime": 182.31, "mixInTrackTime": 9.6, "durationSec": 19.2, "bars": 8 } ] }
   ```

   `playlist` is the export's file name without `.json`, `index` its mix `index`; times in seconds
   of each song's YouTube copy, as the plan gives them (plan.schema.json).

6. **[all] The metrics,** per song, on YouTube time:

   | Metric | Ours | Scored |
   |---|---|---|
   | Tempo | `bpm` | its ratio to the key's `bpm`: "right" within 2%, else "half", "double", "two-thirds", "three-halves" (each within 2% of that ratio), else "wrong" |
   | Beats | the grid the planner plays on: `firstDownbeatSec + k × beatIntervalSec` over the song, `tailGrid`'s from the first of `tailBeats` on | F-measure at ±70 ms (one-to-one matches), over the span where the key has beats; precision and recall too |
   | Model beats | `headBeats.beats` and `tailBeats.beats` | F-measure at ±70 ms, over the spans they cover |
   | Downbeats | the grid's bar lines (every 4th grid beat from `firstDownbeatSec`) | share of the key's downbeats with one of ours within 70 ms; when under 50%, the bar shift (1, 2 or 3 beats) that fits most |
   | Key | `camelot` | "right", "relative" (same number, other letter), "fifth" (number ±1, same letter), "parallel" (same tonic, other mode), else "wrong"; no key: "none" |
   | Mix-out | `mixOutTrackTime` of each plan (rule 5) the song starts | distance to Spotify's mix in that export (`fromStartMs` + A's `offsetSec`), in A's beats (60 / the key's `bpm`); and whether it is within 1 beat of any of the key's `mixOut` / `fadeOut` cues |
   | Mix-in | the same plans' `mixInTrackTime` | distance to `toStartMs` + B's `offsetSec` (a negative `toStartMs` counts as 0), in B's beats; and within 1 beat of any `mixIn` / `fadeIn` cue |
   | Vocals | `vocals` at 0.25 or more (`VOCAL_SUNG`) | IoU with the key's `sung` on a 50 ms grid; precision and recall too |

   A song whose analysis lacks a field gets "none" for that metric, counted apart.

7. **[all] The report.** Per metric: how many songs, the share right (tempo, key), the median and
   10th percentile (F-measures, IoU, downbeat share), the median distance and the share within 1 beat
   (cues). Then the 10 worst songs: ranked by the number of metrics they fail (tempo not right,
   beats F under 0.8, downbeats under 0.8, key not right or relative, a cue more than 4 beats off,
   vocal IoU under 0.5), ties by beats F; each with its numbers and what goes wrong. Written to
   `report-<app>.json` and printed.

8. **[all] Fixes from it.** The benchmark has no pass mark. A fix it leads to goes into the shared
   spec (analysis-cases.md or the planner's own spec) as a guide each app follows its own way, and
   is checked on Vaina Loca → SI NO ES CONTIGO against the Nov 8 baseline (versions.md "The loop
   mix's baseline"): the same or better, it stays; worse, it goes to the user first. That pair is in
   no Spotify playlist, so it has no key.

9. **[all] Nothing plays.** The benchmark is offline: no player, no queue.
