# Offset map and level: an addon file against YouTube's audio

An addon's file of a song is the same recording as YouTube's, but rarely the same file. It can start with more or less silence, and it is mastered at its own level. Before it plays, it is checked against YouTube's audio and placed on YouTube's timeline. All song times in the apps (the player's position, the analysis, automix plans) are YouTube's. An addon file is read through this map.

Reference code: `src/addons/offset-fit.js` (`fitWindow`, `fit`). Fixtures: `scripts/addon_offset_fixtures.mjs` (synthetic, CI) and `window-cases.json` (real songs, measured; `scripts/addon_window_cases.mjs`, local).

Each rule says who must follow it: **[all]** (the phone, BitChord and the PC), **[phone only]**, **[PC only]**. Decided 2026-11-20 (the user): the window check binds all three.

## Map

`addonTime = youtubeTime + offsetSec`, one constant per file. The same recording plays at the same speed, so there is no rate term. A file that needs one is another edit or master, and is refused.

`offsetSec` is positive when the addon file has more lead-in than YouTube's. Times past the addon file's end clamp to its end. Before its start (a negative `addonTime`) they are silence.

## Window check [all]

Before an addon copy replaces YouTube's, a window of the addon audio is fitted against YouTube's copy at the same spot. No match: the song stays on YouTube. A match: the offset it measured is applied (Map). A swap at the same position without it would be wrong twice over (the phone, 9 songs, 2026-11-20): Poker Face's lossless copy is 117.2 ms off YouTube's, so the swap would jump by that much, and 2 of the 9 copies (Escapism, the Stereo Love smashup) are other recordings or edits.

1. **Window.** 12 s of the addon audio, read from addon time `p` = YouTube's position when the audition starts (before the offset is known, the same position). It is what the audition decodes anyway (protocol.md §8).
2. **Template.** The window less 1 s at each end: addon time `[p + 1, p + 11)`. Its 10 ms envelope (Fit, step 1) is slid over YouTube's copy, so every sample compared is known whatever the offset. (Sliding YouTube's span under the window instead leaves part of the span outside the window once the offset passes about a second, and the coarse stage then locks onto the wrong beat: a synthetic −2.3 s shift was refused that way.)
3. **Coarse.** Lags of ±15 s in 10 ms steps, Pearson over the windows inside both, as in Fit step 3. The best must score 0.8 or more, else no match.
4. **Fine.** The template's waveform at 4 kHz, band-limited to 1 kHz, against YouTube's around the coarse lag, ±20 ms, refined parabolically, as in Fit step 4. 0.8 or more, else no match.
5. **Result.** `offsetSec` (Map's sign), with both scores; or no match with the scores reached.
6. **A full fit counts.** A client that has the whole addon file before it plays (the PC, Full fit below) passes the window check by its full fit, which checks more: the start span, the end span and the length.
7. **Length.** The window check doesn't see the file's end. The length rule (protocol.md §7, the slack) applies to the row and the stream's stated length, and after the swap the length watch (protocol.md §8) catches a file that ends early.

Cases: `window-cases.json` (the phone's 51 windows on 9 songs, as numbers: 37 matches within 0.01 ms of the full fit, every window of the 2 wrong copies refused, Poker Face at −117.2 ms in all 7 windows). Synthetic: shifts of +0.7, −2.3, −0.117, +11 and −9 s at 15 s and 75 s within 1 ms; another song on the same beat grid refused.

## Input [all]

Both sides: the decoded audio, downmixed to mono (the mean of its channels), at 22 050 Hz (`FIT_RATE`). Each side is decoded by the same path that will play it, so any decoder delay (AAC priming, MP3 encoder delay, Opus pre-skip) is removed, or left in, the same way in the fit as in playback. On PC that is Web Audio's `decodeAudioData` for both (the deck plays that buffer), resampled to 22 050 Hz by an `OfflineAudioContext`. On the phone, the window is decoded by the decoder the streaming player uses. A port must not fit on one decoder's output and play another's.

YouTube's side is the client's copy of YouTube's audio of the song (PC: Automix's download; the phone and BitChord: their own). A client without YouTube's audio for the song can't run the check, and so plays YouTube's copy.

## Full fit [PC only]

The PC fetches and decodes the whole addon file before the deck takes over (protocol.md §8), so it fits the whole song:

Coarse first, then fine: the coarse stage finds the offset to 10 ms over ±15 s cheaply; only ±20 ms around it is searched at 4 kHz.

1. **Envelope.** RMS of 10 ms windows: window `i` covers samples `[round(i·220.5), round((i+1)·220.5))`. A window under 0.001 (−60 dBFS) is silent. The envelope is `log1p(rms·100)`.
2. **Start.** 0, or the first whole second holding a non-silent window of YouTube's audio (a song that opens silent is read from its first sound). The span is 60 s from there, or to the end. If either side has no non-silent window, or under half the span's windows are non-silent: refused (`silent`).
3. **Coarse.** For each lag from −15 s to +15 s in 10 ms steps, the Pearson correlation of YouTube's span against the addon envelope at that lag, over the windows inside both (partial overlap at the edges). A lag that covers under half the span is skipped. The best lag must score 0.8 or more, else refused (`no match`).
4. **Fine.** 20 s (or the song less 0.2 s, if shorter) from the start, moved inside both files if it would run outside either. Both sides band-limited to 1 kHz and resampled to 4 kHz in one step: output sample `n` at input time `t = (start + n)·22050/4000` (any real number) is `Σ x[k]·h(t − k)`, with `h(u) = g·sinc(g·u)·(0.5 + 0.5·cos(π·u/W))`, `g = 2·1000/22050`, half-width `W = ceil(4·22050/1000) = 89` input samples, and samples outside the file as 0. The addon side is read on a grid shifted by the coarse offset. Pearson correlation over lags of ±20 ms (±80 samples), refined parabolically on the best lag's neighbours. The result is `offsetSec`. The fine score must be 0.8 or more, else refused (`no match`): two songs on the same beat grid can share an envelope, but not a waveform.
5. **Check.** A second 20 s span, ending 30 s before YouTube's end (a song under 90 s: its middle 20 s), moved inside both files. Coarse over ±0.5 s around `offsetSec` (score ≥ 0.8), then fine. It must agree with `offsetSec` within 30 ms, else refused (`different edit`).
6. **Length.** `|(addonDuration − offsetSec) − youtubeDuration|` must be within the length slack (protocol.md §7, default 5 s), else refused (`length`).

Result: `{ offsetSec, score, coarseScore, checkSec, checkScore }`, or `{ none: 'no match' | 'different edit' | 'length' | 'silent', … }`.

## Level

**[phone only]:** measured on the window against YouTube's copy as it is heard. YT Music's player on the phone plays its own copy at volume 1.000, with no normalisation, so a cut by `loudnessDb` left the lossless file that much under YouTube's copy (the S21 FE, 2026-11-21: Esse Nao E Meu Fim stepped down 7.3 dB at the take-over, its `loudnessDb` 7.49). Phone: Vivimusic 22d27ea, `OffsetFit.windowGainDb`.

- `gainDb = 10·log10(Σyt² / Σfile²)` over the 12 s fit window (the file's own seconds), on the two 10 ms RMS envelopes: file frame `i` is paired with YouTube's frame `j = round(i − offsetSec / 0.01)` (`fileTime = youtubeTime + offsetSec`, the fitted offset). A pair is left out when either frame is under 1e-3 (−60 dBFS), or `j` is outside YouTube's envelope.
- Under 2 s of sound (fewer than 200 pairs counted) the gain is 0 dB.
- Cuts are unlimited. Boosts are capped at +6 dB and play under the phone's limiter.
- `loudnessDb` is logged beside the gain, never used. Measured on the device: five songs from −0.26 to +0.67 dB.
- The BitChord and PC rules below don't apply to the phone.
- **Cases:** `pick-cases.json`, group `windowLevel` (7; checked on the PC by a reference in `scripts/addon_pick_tests.mjs`).

**BitChord:** YouTube's `loudnessDb` for the song, on whichever copy plays: the addon copy gets the same normalisation YouTube's player gives its own copy. No measured gain. (The phone used this rule until 22d27ea.)

- **Cut only.** A gain of −`loudnessDb` dB when `loudnessDb` is positive, 0 dB when it is zero, negative or missing. A quiet song is never boosted, because YouTube's player doesn't boost it, and the aim is the level YouTube's own copy would play at. A cut can't clip, so no peak guard is needed. (BitChord applied −`loudnessDb` both ways, clamped, so a negative value boosted. It follows this rule now.)
- **The value:** `loudnessDb`. In the JSON player response it is `playerConfig.audioConfig.loudnessDb`, and the same value is on each audio format (`streamingData.adaptiveFormats[].loudnessDb`). On the phone it is field 47 (a float) of the song's audio format in the protobuf player response (`streamingData` 4 → `adaptiveFormats` 3 → 47; 53 is `perceptualLoudnessDb`). Every audio format carries the same pair; the playback-config extension 55405814 holds only the perceptual value and the −14 target. Never `perceptualLoudnessDb`: with only that field the gain is 0 dB. Measured on the PC (2026-11-20, 3 songs' watch pages): the JSON audioConfig value equals every audio format's (`enablePerFormatLoudness` is true); one song differed by 0.004 dB, where audioConfig carried itag 140's 5.7441 and the Opus formats 5.74. Where a client has the playing format, its value is the one to use. `perceptualLoudnessDb` was `loudnessDb` − 14 (the `loudnessTargetLkfs`) on all three.
- **Cases:** `pick-cases.json`, group `loudnessGain` (6; the PC's `pick.js loudnessGainDb`).

The PC's boost below is not a `loudnessDb` boost: it is measured against YouTube's copy of the same song and brings the file to that copy's loudness, never above it.

**[PC only]:** the measured gain below. The level is measured before the deck plays (the fit, the level and the decode are done before the take-over), so the deck starts at the measured gain; there is no earlier `loudnessDb` stage. YouTube's own `loudnessDb` cut is already in the element volume the deck plays at. The PC has the whole file, so measuring costs no extra download.

- The deck plays the file at YouTube's playback level times a source gain, which brings the file to YouTube's level for that song. On PC YouTube's playback level is the element volume (the listener's volume times YouTube's normalisation).
- `gainDb = youtubeLufs − addonLufs`, each the EBU R128 integrated loudness (ITU-R BS.1770-4) of the whole decoded song, measured the same way on both sides: the fit's mono 22 050 Hz signal, K-weighted, 400 ms blocks every 100 ms, absolute gate −70 LUFS, relative gate −10 LU. Mono on both sides keeps the difference right for a stereo pair even though the absolute value isn't BS.1770's channel sum. K-weighting at any rate uses libebur128's filter design, which gives the standard's 48 kHz coefficients exactly: a 997 Hz sine at −20 dBFS reads −23.01 LUFS at 48 kHz and −22.98 at 22 050 Hz.
- This is not the automix analysis' `loudnessCurve`: that is a mono K-weighted curve of 100 ms blocks, used for the blend's level match, not an R128 integrated figure.
- At most +6 dB of boost. Cuts are unlimited.
- Never clips. The true peak is measured only when boosting, on each channel of the file at the rate it plays (the audio context's, decoded again at that rate), 4× oversampled (Hann-windowed sinc, 8 input samples each side), and only around samples within 3.5 dB of the level where the boost would reach −1 dBTP (an oversampled peak sits at most about 3 dB over its samples). The boost is lowered until that peak stays at or under −1 dBTP.
- Ramped, never stepped: the deck reaches the gain over its take-over fade, and any later change over at least 0.5 s.

## Fixtures

`scripts/addon_offset_fixtures.mjs` builds synthetic songs and checks the window check, the full fit and the level:

- the window check: the same audio shifted by +0.7, −2.3, −0.1172, +11 and −9 s, a 12 s window at 15 s and at 75 s: each offset within 1 ms, both scores 0.8 or more; a window of another song on the same beat grid: no match;

- the same audio shifted by +0.7 s, −2.3 s and +11 s: each offset within 1 ms;
- YouTube's copy opening with 1.5 s of silence, the addon's with 0.4 s: −1.1 s within 1 ms;
- an edit with 8 s cut from the middle: `different edit`;
- a file 12 s longer at the end: `length`;
- another song on the same beat grid: `no match`;
- the same 10 ms loudness shape on noise (another recording of the same arrangement): coarse ≥ 0.8, fine under 0.8, `no match`;
- silent YouTube audio: `silent`;
- a 60 s song shifted by +0.25 s: found, checked in its middle (20 s);
- the file 4 dB quieter: +4 dB; 9 dB quieter: capped at +6 dB; 3 dB quieter with YouTube's copy peaking at −0.5 dBFS: held where the true peak meets −1 dBTP (about +2.5 dB); 3 dB louder: −3 dB, no peak measured;
- the K-weighting calibration above.

A port builds the same signals:

- **PRNG**: mulberry32. State `a` (uint32) starts at the seed. Each call: `a = (a + 0x6D2B79F5) mod 2³²; t = a; t = imul(t ^ (t >>> 15), t | 1); t ^= t + imul(t ^ (t >>> 7), t | 61); return ((t ^ (t >>> 14)) >>> 0) / 2³²`. `imul` is the low 32 bits of the product.
- **Song** `(seed, seconds, peakDb = −12)` at 22 050 Hz: zeros, then for each beat `b` (every 0.5 s, `ceil(seconds·2)` beats, start sample `round(b·0.5·22050)`), in this order of draws: `kick = 0.3 + 0.7·rnd()`, `hat = 0.1·rnd()`; if `b mod 4 = 0` a chord of 3 tones, each `f = 110 + 770·rnd()`, `g = 0.05 + 0.1·rnd()`. Over the beat's 0.5 s (sample `i`, `t = i/22050`): add `kick·e^(−8t)·sin(2π·60·t)`, and from `t ≥ 0.25` add `hat·e^(−30(t−0.25))·(2·rnd() − 1)` (one draw per sample, in sample order). For a chord, over 2 s from the beat's start add `g·sin(2π·f·T)` per tone, `T` the song time in seconds. Then scale so the absolute peak is `peakDb`.
- **Cases**: YouTube's song is seed 1, 120 s. Unrelated: seed 2. The 12 s tail: seed 7. The 60 s song: seed 3. The loudness-shape noise: seed 5, one `2·rnd() − 1` draw per sample, scaled per 10 ms window to YouTube's RMS there times √3.
