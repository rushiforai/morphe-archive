# Analysis cases

The phone and the extension each run their own song analysis (beats, downbeats, tempo, key, vocals).
These cases check the analysers and the mixes they lead to. Cases and thresholds:
`analysis-cases.json`. Runner on the extension: `scripts/analysis_cases.mjs`.

## Rules (decided 2026-11-18 and 2026-11-19)

1. **Neither side is tuned to copy the other.** Each platform runs its analyser as it is: its own
   resampler and model runtime. A case that fails is a finding to look at, not a number to chase.
2. **Two layers**, both strict (on real songs, layer 1 is reported instead: see below):

   **Layer 1: the analysers agree.** Both sides analyse the same decoded file of each song, so this
   tests the analysers and not the streams.

   | What | Must |
   |---|---|
   | Tempo | equal within 0.5 BPM; a half or double reading fails |
   | Beats | at least 95% of each side's beats within 25 ms of a beat of the other side |
   | Downbeat | the same bar start (within the same 25 ms) on at least 90% of bars (every 4th beat from each side's first downbeat) |

   25 ms is one frame of the beat model (Beat This! reads 50 frames a second, so a beat is placed to
   20 ms) plus a few ms of rounding. It was 20 ms until 2026-11-19: a beat placed one frame late, or
   a few ms past its frame, failed at 20 ms though both sides had found the same beat.
   | Vocals | sung frames (the vocal curve at 0.25 or more, the planner's `VOCAL_SUNG`) overlap with an IoU of at least 0.8 |

   **Layer 2: the mixes agree.** Each pair of `pairs/` is planned on each side's analysis (the analyser's
   fields swapped into the captured pair, everything else as captured). For each engine (Classic and
   Automix v2) both must make the same loop / blend / hand-over choice, with mix points within one beat.

   One exception: when the deciding number sits within 5% of a planner threshold, the pair is reported
   as a **threshold case**, not a failure, and the report shows the number and the threshold. The
   thresholds are listed in `analysis-cases.json` (LOOP_MARGIN 0.02, the key score 0.55,
   V2_SUB_BASS_VETO 0.9).
3. **Real songs are allowed.** They make the best test. Their audio stays out of git:
   - Each song is decoded once into a local cache (the extension's is `.cache/analysis/`, git-ignored)
     as `<videoId>.wav`: 44100 Hz, stereo, 32-bit float, from `ffmpeg -i <audio> -ar 44100 -ac 2 -c:a pcm_f32le`.
   - Both sides read that same file.
   - Each side writes its analysis to `<cache>/<side>/<videoId>.json`, with the analysis.schema.json
     field names.
   - `--compare` checks one side's folder against the other's.
   - These cases run on the developer's machine, not in GitHub CI. The songs: every song of
     `pairs/*.json`, plus `real.extra`.
4. **Synthetic songs run everywhere,** CI included, against the truth they were built from (the same
   tolerances as layer 1). `scripts/analysis_signals.mjs` renders them, and its comments spell out every
   sound: mulberry32 noise, a click track, a drum kit with a bar marker, a voice-like tone, a chord pad.
   Each song is rendered once, at 44100 Hz. The beat model's 22050 Hz input is that render through the
   resampler `half` spelled out there (129-tap Blackman-windowed sinc, cut-off 10143 Hz, every second
   sample), so both sides analyse the same samples at both rates; neither uses its own resampler here.
   Real songs are different: there each side resamples as it does in use.
5. **Every synthetic case passes with room:** at least 3 points over each share it needs (beats 98% or
   more for 95%, downbeats 93% or more for 90%, vocal IoU 83% or more for 80%) on the extension's
   analyser, so a second analyser on the same samples isn't failed by rounding. A case that passes
   with less is changed (its song, never the rule), and the change is noted in its `what`.
   - 2026-11-19: `tempo-change-100-110` passed at 95% beats and 91% downbeats, and failed on any
     other resample of the same song; it became `tempo-change-120-126` (98%, 100%). `drums-85`
     passed its beats at 96%; it became `drums-80` (100%).
   - What the margins guard against: on the extension's analyser, beats come out about 20 ms late
     on some tempos (the beat model works in 20 ms frames), mostly between 26 and 30 s into a 50 s
     song, with or without a tempo change there. That finding moved the tolerance to 25 ms (layer 1).
   - With 25 ms, `drums-85` came back (100% beats; its bar start stays a known miss) and `drums-90`
     joined (100%, 100%). `tempo-change-100-110` came back for its downbeat only, as a known miss:
     at 97% its beats are under the margin.

6. **A song over 8 minutes (480 s) isn't analysed** (2026-11-24, versions.md "Analysis length"). The
   check `tooLong` needs no render: both apps answer "too long" from the decoded length, before any
   model runs. The extension's runner reads the cap from `automix.js` and `host.js` and fails when
   they differ.

## The key [all]

From the Spotify benchmark (spotify-benchmark.md), 2026-11-25. This is an exception to rule 1. On
the 323 benchmark songs the PC got 71% of the keys right, the phone 26% and BitChord 25%. So every
app now finds the key the PC's way, step by step as below. The PC's analyser is Essentia's
`KeyExtractor` with its defaults (`src/vendor/automix/analysis.worker.js`).

**What it feeds.** The key isn't only displayed: it is fed to the planner.
- `keyName` and `keyConfidence` (`camelot` is shown only) feed:
  - Automix v2 (version 3): the key score and its trust.
    - Both keys are trusted when the square root of the two confidences is 0.65 or more.
    - Under 0.2: no blend or loop.
    - Under 0.55: a short blend.
    - See versions.md "Keys".
  - Advanced's key-aware blend length: `automixKeyAware`, each confidence 0.5 or more.
- So `keyConfidence` must be on this method's scale.
  - On the benchmark the PC's confidences run 0.77 (10th percentile) to 0.93 (90th), median 0.87,
    and 96% of keys are trusted (0.65 or more).
  - The phone's and BitChord's old methods: 0.28 to 0.61, median 0.43, with only 6–7% trusted. So
    their key rules barely ever fired.

**Input.** The whole song, mono (the mean of the channels), at 44100 Hz. That is the same decode the
rest of the analysis uses.

**Steps.**

1. **Frames:** 4096 samples, hop 4096.
   - Frame k starts at sample −2048 + 4096·k, so the first frame is centred on sample 0. Samples
     outside the song are 0.
   - The last frame is the first one whose centre is at or past the song's end.
   - Essentia adds −100 dB noise to all-zero frames. It changes nothing measurable, so it can be
     left out.
2. **Window:** Hann, w[i] = 0.5 − 0.5·cos(2πi / 4095), then scaled so that Σw = 2.
   - Zero phase: FFT input k is frame[(k + 2048) mod 4096]·w[(k + 2048) mod 4096]. This only
     changes the phase, not the magnitudes.
3. **Spectrum:** the magnitude |FFT| of bins 0..2048, linear and unscaled. Bin b is b·44100/4096 Hz.
4. **Peaks** (Essentia `PeakDetection`):
   - The search starts at bin ceil(25 / (44100/4096)).
   - Going up the spectrum: skip while falling or level, climb while rising, then take a run of
     equal values j as a plateau.
   - A peak is where the next bin falls and the value is over 1e-4.
   - Position and value:
     - A plateau's position is the middle of the run, its value the run's value.
     - Otherwise interpolate a parabola through (j−1, j, j+1): with L, M, R the three values,
       d = 0.5·(L − R)/(L − 2M + R), position j + d, value M − 0.25·(L − R)·d.
   - Stop at the first peak above 3500 Hz.
   - Keep the 60 largest by value; on a tie the lower frequency goes first.
5. **Whitening** (Essentia `SpectralWhitening`, maxFrequency 3500, which it raises to 4200):
   - **Envelope:** for f = 0, 100, … up to 4200 Hz:
     - from bf = f − max(50, 0.34f) to ef = f + max(50, 0.58f);
     - b = round(bf/22050·2048), clamped to [0, 2048]; e = round(ef/22050·2048), at least b + 1 and
       at most 2049;
     - c = (b + e)/2;
     - for each bin i in [b, e): weight = (1 − |i − c|/(e − c))⁴ × spectrum[i]². Add
       spectrum[i]²·weight to a sum, and the weight to a total;
     - the point's value is sum/total.
     - Replace the last point's value with the one before it.
     - Turn every point into dB: 10·log10 of it, or −200 for a value under 1e-20.
     - Between points, interpolate linearly.
   - **For each peak:** a = 20·log10(its value) in dB, env = the envelope at its frequency.
     - From 4100 Hz up: w = a.
     - Below that:
       - w = 0 if a > env; a − env if a > env − 30; else −200.
       - Then w −= 20·f/4000.
     - The peak's new value is 10^(w/20).
6. **Pitch-class profile** (Essentia `HPCP`):
   - 12 bins, bin 0 is A at 440 Hz.
   - Settings: cosine weighting, window 1 semitone, 4 harmonics, no band split, peaks from 25 to
     3500 Hz.
   - Each whitened peak (f, m) adds into 3 bins, each at a shifted frequency f′ = f·2^(−s/12):
     - s = 0, weight 3;
     - s = 12·log2(3) − 12 = 7.01955, weight 1;
     - s = 12·log2(5) − 24 = 3.86314, weight 1/(12·log2(5)/24) = 0.861357.
   - At p = 12·log2(f′/440), for each integer i from ceil(p − 0.5) to floor(p + 0.5):
     bin (i mod 12) += cos(π·|p − i|) · m² · weight².
   - No normalising per frame.
7. **Song profile:**
   - The mean of all frames' profiles.
   - Divide by its largest bin.
   - Set every bin under 0.2 to 0.
8. **Key** (Essentia `Key`, profile "bgate", no polyphony, no three chords, so the tables are used
   as they are):
   - major = 1, 0, 0.42, 0, 0.53, 0.37, 0, 0.77, 0, 0.38, 0.21, 0.30;
   - minor = 1, 0, 0.36, 0.39, 0, 0.38, 0, 0.74, 0.27, 0, 0.42, 0.23.
   - For each table and each shift s = 0..11:
     r = Σᵢ (pᵢ − p̄)(T[(i − s) mod 12] − T̄) / (σp·σT), where σ = √Σ(x − x̄)² (not divided by 12);
     r = 0 if either σ is 0.
   - For each table keep the first s with the largest r.
   - Major only if its r is strictly larger than minor's. A tie is minor.
   - The key is the note names A, Bb, B, C, C#, D, Eb, E, F, F#, G, Ab at index s, with "major"
     or "minor".
     - `keyName` = "<note> <major|minor>".
     - `keyConfidence` = that r.
     - `camelot` from the name (major B: C 8, G 9, D 10, A 11, E 12, B 1, F# 2, C# 3, Ab 4, Eb 5,
       Bb 6, F 7; minor A: A 8, E 9, B 10, F# 11, C# 12, Ab 1, Eb 2, Bb 3, F 4, C 5, G 6, D 7).

**Checked:**
- A plain-JS port of these steps (`scripts/key_port.mjs`, the reference for every port) gave the PC's key on all 323 benchmark songs (323/323), with the
  confidence matching to 4 decimals (mean difference under 0.00005).
- An app's port is done when its `keyName` matches the PC's analysis in `bench/pc/` on at least
  98% of the benchmark songs (rounding in its FFT may move a song whose two best keys are close),
  and its key score on the benchmark is near the PC's 71%.
- Vaina Loca → SI NO ES CONTIGO: the PC's keys are F# major 0.857 and C minor 0.875
  (`pairs/1-...json`). The PC is unchanged. Each app checks the pair against the Nov 8 baseline
  with its new keys before it commits.

## The bar [all]

From the Spotify benchmark, 2026-11-25. Apps used to start a grid's bars at the beat model's first
downbeat, so one stray downbeat (a pickup in the intro, a fill) shifted every bar of the song.

**Rule.** For each grid, the head and the tail separately:
1. Take the beat model's downbeats from the same window: `headBeats.downbeats` for the head grid,
   `tailBeats.downbeats` for `tailGrid`.
2. Each downbeat votes for its place in the bar. Let k = round((downbeat − firstDownbeatSec) /
   beatIntervalSec). It votes for place k mod 4 when it is within a quarter beat of that grid beat;
   otherwise it doesn't vote.
3. The place with the most votes wins. A tie keeps place 0, the first downbeat's.
4. The new `firstDownbeatSec` is the old one + place × `beatIntervalSec`. That is the same grid, only
   later by 0–3 beats.

Applying it a second time changes nothing. The PC applies it to every analysis as it is loaded, so
an analysis saved before the change is phased too (`automix.js` `withBarPhase`). The bench's
`pc/*.json` are phased.

**Measured** (bench, 323 songs, the PC's analyses):
- Downbeat share, median: 0.897 before, 0.929 after.
- 182 songs at 0.8 or more, up from 175; 95 under 0.5, down from 99.
- 19 songs up by 0.2 or more; 5 down (Boyfriend, Levels, 365, Adventure of a Lifetime, Pump It Up).
- Mix-out within 1 beat of a Spotify cue: 46%, up from 44%.

**What it doesn't fix.**
- On 34 songs the beats are right (F 0.9 or more) but the bars sit 1–3 beats off Spotify's.
- On 20 of them the beat model's downbeats themselves are on another place than Spotify's,
  consistently.
- Two cues from the audio, on those 20:
  - Chord changes fall on the model's place on 13 of the 20, never on Spotify's.
  - The strongest low end (30–150 Hz at the beat) falls on Spotify's place on 12 of the 20.
- So Spotify counts its "1" on the big kick, and the model counts it on the chord change.
- A bass rule over every song does worse than the model:
  - the strongest low end's place: 31 songs up, 106 down;
  - only when it leads the model's place by 2×: 9 up, 3 down.
- So it isn't part of the rule. Which "1" sounds better in a mix (where the bass swap and a phrase
  land) is for the ear, not the benchmark.

**Checked:**
- Vaina Loca → SI NO ES CONTIGO:
  - The mix that plays, the loop mix, is unchanged in every variant (v2, v3, lyrics, LRC). It is
    the same as the Nov 8 baseline.
  - SI NO ES CONTIGO's opening has a pickup downbeat at 7.17 s between 6.00 and 9.60, so its head
    grid moves 2 beats.
  - The loop already reads the model's downbeats, so it doesn't move.
  - The blend plan, which plays only when just A has synced lyrics (`v3mixed*`), brings B in
    1.2 s later, on the model's bar (20.40 → 21.60 s).
- `3-unethical__escapism-sped-up`:
  - B's mix-in moves 1.1 s later in every variant.
  - With LRC lyrics (`v3lrc`), Automix v2 now plays an echo out instead of the filter mix. Both
    songs would sing over 40% of the filter mix, and it allows 30%.
- Goldens updated.

## Half or full tempo [all]

From the Spotify benchmark, 2026-11-25. No rule: an app keeps its beat model's tempo.

**What happens:**
- The PC reads 34 of 323 songs at half Spotify's tempo. They are trap and rap at 140–200 BPM, read
  as 70–90.
- The beat model itself marks every second beat there: precision 1.0, recall 0.5.
- The opposite case: 10 songs read at 120–144 that Spotify counts at 60–72.

**Why not double them:**
- Nothing in the audio tells these songs apart from 38 songs that both Spotify and the PC read at
  73–94 BPM:
  - onset strength halfway between beats, against on them: medians 0.85 and 0.82 (30–150 Hz);
  - hi-hats (2–11 kHz) at the quarter-beat places: any threshold that doubles the half-read
    songs also doubles as many of the slow ones. At 0.55: 27 of 33 fixed, 25 of 38 broken;
  - their tempos overlap: 70–82 against 73–94.
- The two readings are a counting convention, not an error the audio can show.

**Why it doesn't matter for mixing:**
- The planner folds half and double tempos when it beat-matches (`foldRate`).
- On the bench, the half-read songs mix as well as the rest, or better:
  - mix-in on a Spotify cue: 94% against 74%;
  - mix-out on a cue: 62% against 43%;
  - their pairs are planned as blends like any other (47 blends, 2 filter mixes, 1 crossfade).
- The bench keeps scoring them "half". That is a known difference, not a target.

## Where the mix leaves the song [all]

From the Spotify benchmark, 2026-11-25. No rule: the planners keep their mix-out. The numbers below
compare Spotify's mix-out in the four exports with the PC's plan of the same pair (339 mixes).
(The PC's bench analyses had no music end then, so its plans here ran without the end trim the
extension uses: "Where the song ends" below has the corrected comparison.)

| | Spotify | PC |
|---|---|---|
| Mix-out, against ours | earlier in 79%, later in 15%; median 30 beats earlier | |
| Left of the song at the mix-out | 31 s (p10 12, p90 72) | 15 s (10–20) |
| Left after the mix ends | 11 s (0–52) | 4 s (2–7) |
| Mix length | 8 bars, 16.6 s (7–31) | 4 bars, 9.9 s (7–15) |
| On its own `mixOut` cue | 11% | 4% |
| On any `fadeOut` cue | 58% | 46% |
| On a downbeat | 62% | 75% |
| On a 4 / 8 / 16-bar line | 29 / 14 / 6% (chance 25 / 13 / 6%) | 22 / 11 / 5% |
| Inside a sung line | 65% | 53% |

**What Spotify's mix-outs are.**
- These playlists' mixes are picks made in Spotify's mix editor, not its automatic cue.
- Only 11% are on the song's own `mixOut` cue, which sits 8 s before the end (median).
- 38% are off the downbeat, and phrase lines are hit at chance level.
- They leave the song earlier: during the singing, often skipping the last chorus and the outro,
  20 s before the last sung line ends (median). The curator's playlist sets the habit: mixes in
  dj-club-mixes leave 48 s before the end, the others 27–31 s.
- The PC plays through the outro and ends its blend a bar before the song does.

**No rule beats the current pick.** Within 1 beat of Spotify's mix-out:
- now: 4.7%;
- our point moved 2–16 bars earlier: 1.5–5.3%;
- any fixed time before the end (best 19.5 s): 3.5%;
- even with the answer key's own sung lines and downbeats, at the first downbeat after the sung line
  that ends 15–45 s before the end: 2.1–6.8%. With the app's own vocal curve it can only be less.
- None clearly beats 4.7%, so none is a rule.

**What is left is a design choice, not a bench number:** whether Automix should leave songs earlier
(about 30 s before the end, before the last chorus) with longer, 8-bar blends, as people mixing in
Spotify do. That is the user's call by ear. It would also move where the loop mix starts.

The user decided by ear on 2026-11-25, after hearing a curator-style mix of Vaina Loca → SI NO ES
CONTIGO against the shipped loop mix: the loop mix stays as it is; a blend leaves the curator's way.
That is the next section.

## The curator blend [all]

Decided by the user 2026-11-25. PC: `automix.js` (`plan`'s `curator`, `CURATOR_*`), `crossfade.js`.
Automix v2 (version 3) only; Classic is unchanged.

**When it applies.**
1. Auto chooses between the loop mix and the blend exactly as before, on the usual blend's numbers
   (`loopOrBlend`). When it picks the loop mix, nothing changes: the same choice and the same plan.
2. When it picks the beat-matched blend, that blend is re-planned the curator's way. Not covered:
   the drop-in and the muffle (they exist because both songs sing), the filter mix, the echo out and
   the hand-overs (no beat match), and anything the user picked (a preset, a length, a window, "Up
   to N bars").

**The curator blend.**
- **Mix-out:** the downbeat nearest 31 s before the song's music ends, on the song's end grid (its
  tail grid when it has one). The music's end is where the planner already takes it: the analysis's
  content end, cut by at most 20 s.
- **Length:** 8 bars of the playing song. A weak grid still shortens it as for any blend (under 0.6
  grid confidence: at most 8; under 0.45: 4).
- **Mix-in:** where the planner already puts it: the next song's full-energy phrase lands at the
  blend's end, no further than a quarter into the song. No vocal reroute, no anchor search: they
  would move the mix-out.
- Everything else as for any blend: the tempo ramp or glide, the bass swap, the loudness trim, the
  curves.
- The plan carries `curator: true` (plan.schema.json).

**Fallbacks: the usual blend, exactly as before,** when any of these holds:
1. **Keys:** not both trusted (the square root of the two key confidences under 0.65), or the key
   score under 0.55, where the usual rules already shorten the blend.
2. **Voices:** both songs sing over more than 30% of the 8 bars (`V2_CLASH_MAX`, the same test that
   sends the usual blend to a drop-in or a muffle), or the next song has no intro for the 8 bars.
3. **Short song:** the playing song's music is under 120 s.
4. **Too late:** the mix-out is before the earliest point the blend can start (a seek near the end).

**Checks, 2026-11-25.**
- Goldens: none change. Vaina Loca → SI NO ES CONTIGO is byte-identical in every variant. The
  variants that play its loop keep it, and the three mixed-lyrics variants that blend fall back on
  the key clash (F# major → C minor, 0.307). Of the other pairs:
  - Stereo Love → Midnight Sun plays a filter mix.
  - Unethical → Escapism and Poker Face → Let Me Love You x Gata Only play an echo out (no beat
    match).
  - Bazovyy Minimum → Montagem Fama blends, but both would sing over the curator's 8 bars, so it
    falls back.
- PC bench, Automix v2, 339 planned mixes (rerun 2026-11-26 on the PC analyses with their music end,
  and the median fixed; see "Where the song ends"): 199 are blends, 106 of them plain beat-matched
  blends.
  - 45 of those 106 become curator blends.
  - The others fall back: 34 on the key score, 1 on untrusted keys, 26 on voices, intro or too
    late.
  - Across all 339 the plan's styles don't change.
- On the 45 mixes that change, against Spotify's own mix:

  | | Before | After |
  |---|---|---|
  | Mix-out, median distance from Spotify's | 31.9 beats | 25.9 beats |
  | Mix-out within 1 beat | 4% | 4% |
  | Mix-out within 1 beat of a Spotify cue | 47% | 18% |
  | Mix-in, median distance | 30.6 beats | 30.6 beats |
  | Mix-in within 1 beat | 18% | 27% |
  | Mix-in within 1 beat of a Spotify cue | 56% | 56% |
  | Blend length, median | 13.7 s | 15.2 s |

  The mix-out moves 13.7 s earlier (median).
- **Note on the drop:** the mix-out is on a Spotify cue less often (47% → 18%). The usual blend's
  anchor search sits on section changes and the music's end, where Spotify's `fadeOut` cues are. The
  curator's point is a time before the end, as Spotify's editors place theirs, and they are on their
  own `mixOut` cue only 11% of the time. This is a taste change chosen by ear; the bench isn't
  asked to improve.

## Where the song ends [all]

Checked 2026-11-26. **Rule (all three apps):** plan against the music's end, `contentEndSec` (the
end with trailing silence cut), the way the PC's `musicEnd` does:
- only when the music ends more than 1 s before the file does;
- never cutting more than 20 s.

Every mix point that counts from the song's end uses it: the Classic blend's natural mix-out, the
Automix v2 anchors, and the curator blend's 31 s.

**What was found.**
- The PC already did this live. The bench's PC analyses didn't carry `contentEndSec`, so its PC
  plans ran without the trim and looked different from the phone's and BitChord's. The bench now
  keeps it (`--analyse` adds it, `--content-end` backfills older analyses), measured with host.js's
  own `contentEnd`.
- The three apps measure the same end: the PC's matches the phone's on all 323 songs (median 0 s).
  The music ends a median 2.65 s before the file; 1 s or more on 260 songs, more than 20 s on 1.
- **A bench bug:** two of Spotify's mixes (straight cuts) have no start time. Their NaN distance in
  the sort made every printed mix-out median wrong before this date (an earlier "PC 9 beats against
  the phone's 22" was that). The bench now leaves them out of the mix-out (337 measured). The
  within-1-beat and on-cue shares weren't affected.

**Measured:** the PC planner on each app's analyses, with no trim, `musicEnd`, and the whole silence
cut (durationSec set to contentEndSec). 337 mix-outs and 339 mix-ins against Spotify's.

| Classic (version 2) | No trim | `musicEnd` | Whole cut |
|---|---|---|---|
| Mix-out median, PC / phone / BitChord analyses | 30.1 / 30.1 / 32 beats | 25.7 / 25.7 / 27.6 | 26 / 26 / 27.7 |
| Mix-out within 1 beat | 5 / 5 / 5% | 4 / 4 / 3% | 3 / 4 / 3% |
| Mix-out on a Spotify cue | 46 / 46 / 47% | 42 / 41 / 42% | 42 / 42 / 43% |
| Mix-in median | 16 / 16 / 16 beats | 16 / 16 / 16 | 16 / 16 / 16 |
| Mix-in within 1 beat | 27 / 26 / 26% | 27 / 26 / 27% | 27 / 26 / 27% |
| Mix-in on a Spotify cue | 75 / 76 / 75% | 76 / 77 / 75% | 76 / 77 / 75% |

| Automix v2 with the curator blend | No trim | `musicEnd` | Whole cut |
|---|---|---|---|
| Mix-out median | 40 / 38.1 / 39 beats | 34.8 / 34.3 / 35.5 | 34.6 / 34.1 / 35 |
| Mix-out on a Spotify cue | 39 / 39 / 39% | 40 / 39 / 39% | 39 / 36 / 38% |
| Mix-in within 1 beat | 33 / 35 / 35% | 32 / 34 / 34% | 33 / 34 / 34% |
| Curator blends | 45 / 46 / 51 | 47 / 48 / 51 | 47 / 48 / 51 |

**Why this rule.**
- The trim brings the mix-out 4–5 beats closer to Spotify's (median), as Spotify's editors leave
  earlier than any of us.
- It costs 1 point within 1 beat and 4 points on a cue in Classic, because Spotify's `fadeOut` cues
  are counted from the file's end.
- Mix-in doesn't move. The curator blend gets closer (40 → 35 beats) with the same cue share.
- The whole cut is no better than `musicEnd` and risks cutting a long quiet outro whole, so the 1 s and
  20 s guards stay.
- Vaina Loca → SI NO ES CONTIGO: no PC change, so all five goldens are unchanged.

## Known misses (found 2026-11-19, kept as found)

On the extension's analyser (BitChord's worker with `beat_this_final0_q8` and `vocals_umxhq_int8`).
A known miss prints as KNOWN and doesn't fail; a side that gets it right should say so.

These four are model limits shared with the extension; a port should match them, not tune them away.

- `drums-85`: tempo and beats are right, but the bar start is half a bar late, every bar.
- `tempo-change-100-110`: a beat is lost 3 to 5 s after the jump to 110 BPM, so the bars after it
  start half a bar off (59% of bars right).
- `no-voice`: noise snares and hats read as voice frame by frame (about 29% of frames at 0.25 or more).
- `voice-over-chord`: a held sine chord reads as voice (92% of frames).

The last two matter to the loop planner when a song has no synced lyrics: it allows at most 3% sung
frames over a loop. A song whose drums or pads trip the vocal model loses its loop mixes.

## Real songs: layer 1 is reported, not failed

On real songs, layer 1 differences are reported per platform pair and don't fail the run; layer 2
still does. The set found on 2026-11-19, against the PC:

- `exHJb5t-6e8`, `JBbSlADtG-g`, `2mUTNSMcezg`: bar starts differ (the PC and the phone disagree on
  these too).
- `6Edmp3yHv1s`: BitChord only, 65% of bars.

All of them pass layer 2.

## Running

```
node scripts/analysis_cases.mjs                         synthetic cases (about a minute)
node scripts/analysis_cases.mjs --only a,b --debug      some of them, with the beats each one missed
node scripts/analysis_cases.mjs --real                  analyse .cache/analysis/*.wav into .cache/analysis/pc/
node scripts/analysis_cases.mjs --compare pc phone      layers 1 (reported) and 2, PC against the phone's results
```
