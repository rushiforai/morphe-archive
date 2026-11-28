# Spotify mix exports

Mix files → Import… also takes a Spotify mix export as it is (`"format": "spotify-mix-export"`,
read from Spotify's mixed playlists: `D:\Programs\Projects\YT Clients\research\spotify-mixes\`,
its README has the format). Each app converts it to overrides (`override.schema.json`) inside the
app, and Play these mixes plays the playlist. The PC, the phone and BitChord import it the same way.

Functions on the PC: `readMixFile` (which sends this format on to `readSpotifyMixes`),
`spotifyOverride` in `src/automix/automix.js`. The ids: `scripts/spotify_mix_ids.mjs`.
Test: `node --test scripts/test_automix_plan.mjs` (the "Spotify mix exports" test).

## Rules

1. **[all] The file.** `format` `"spotify-mix-export"`, `version` 3. Version 3 is version 2 plus
   `youtubeVideoId` on every track that has one: in `playlist.tracks` and in every mix's `from` and
   `to`, the same id for the same Spotify `uri`. Nothing else differs. The ids are found by
   `spotify_mix_ids.mjs` (a YouTube Music songs search, the weak matches picked by hand) and
   written into the file with its `--write`.

2. **[all] Reading.** The whole file is refused, with nothing imported, when:
   - `version` is below 3: "this Spotify mix file is version N: it has no YouTube ids yet (version 3
     has them)";
   - `version` is above 3: "this Spotify mix file is version N, newer than this app reads (3): update
     the app to import it";
   - `mixes` is missing or empty, or has more than 300 (as mix-file.md rule 3).

   Then each mix is read as mix-file.md rule 4 reads one (normalized, the same song on both sides
   skipped, the same pair twice: the later one used), numbered by its `index`.

3. **[all] A mix becomes** a `custom` override, except a straight cut (`durationMs` under 100 with
   no `fromStartMs`; RAP Mixes #20, #92, which have no `basePresetId` and every lane unset), which
   is Spotify's No transition: `{ "v": 1, "preset": "none" }` (editor.md §2). Otherwise:
   - `bars` 2, 4, 8, 16 or 32: `bars` as is, drawings in beats over `bars` × 4 beats.
   - Any other `bars` (0): no `bars`, `beatMatch: "off"`, drawings in seconds over `durationMs`.
   - `window`: `out` `{ sec: fromStartMs / 1000 }`, `in` `{ sec: toStartMs / 1000 }`; no
     `toStartMs`: 0. Positions in seconds only (editor.md §6 "Seconds only"): each plays at that
     song's nearest beat, so no app needs Spotify's grid.
   - A negative `toStartMs` (22 of the 4 exports' mixes, −6 to −14486 ms): in Spotify, B's 0:00
     comes in that long after the mix starts. Here too: `in` `{ sec: 0, delaySec: −toStartMs / 1000 }`
     (mix-file.md rule 2, B's late entry), the drawings as they are. An older export wrote these
     unsigned (2^64 − x), too far off in a double to read back: any `toStartMs` of 2^53 or more
     counts as negative, B starts with the mix (`{ sec: 0 }`), and the summary says so (rule 9).
   - `gridBpm`: `fromBpm`; with no `fromBpm` and bars, `bars × 4 × 60 / (durationMs / 1000)`.
   - All times rounded to 1 ms.

4. **[all] Lane styles** (`style.volume`, `style.eq`, `style.filter`, `style.fx`; the names as
   Spotify's editor shows them, `research/spotify-mixes/tools/style_names.json`, confirmed on the
   emulator 2026-11-25). Each becomes a shape (editor.md §3, §12):

   | Lane | Spotify number (name) → shape |
   |---|---|
   | volume | 1 (Center cut) `centerCut`, 2 (Crossfade) `crossfade`, 5 (Fade in fade out) `fadeInFadeOut`, 6 (Smooth crossfade) `smooth`, 7 (Overlap) `overlap`, 9 (Fade in cut out) `fadeInCutOut`, 10 (Cut in fade out) `cutInFadeOut`, 11 (Fade in fast out) `fadeInFastOut`, 12 (Fade in 1 bar cut out) `fadeIn1BarCutOut`, 13 (Overlap 1 bar cut out) `overlap1BarCutOut` |
   | eq | 0 (None) `none`, 1 (3-band fade) `threeBandFade`, 4 (Center bass swap) `centerBassSwap`, 10 (End bass swap) `endBassSwap`, 11 (Start bass swap) `startBassSwap`, 12 (Quick bass cut) `quickBassCut`, 13 (Long bass cut) `longBassCut`, 15 (Bass fade out) `bassFadeOut` |
   | filter → effect | 0 (None) `none`, 5 (High pass filter in) `hpIn`, 6 (High pass filter out) `hpOut`, 7 (HP in HP out) `hpBoth`, 9 (Low pass filter in) `lpIn`, 10 (Low pass filter out) `lpOut`, 11 (LP in LP out) `lpBoth`, 12 (HP in LP out) `hpInLpOut`, 13 (LP in HP out) `lpInHpOut`, 14 (High-pass filter half out) `hpHalfOut`, 15 (Noise out end) `noiseOutEnd` |
   | fx → Effects | 0 (None) none, 1 (Reverb out center) `reverbOutCenter`, 2 (Reverb cut end) `reverbCutEnd`, 3 (Reverb out end) `reverbOutEnd`, 4 (Echo ½ cut end) `echoHalfCutEnd`, 5 (Echo ½ out end) `echoHalfOutEnd`, 6 (Echo ¾ cut end) `echo34CutEnd`, 7 (Echo ¾ out end) `echo34OutEnd`, 8 (Delay ½ cut end) `delayHalfCutEnd`, 9 (Delay ¾ cut end) `delay34CutEnd`, 10 (Echo 1 cut end) `echo1CutEnd`, 11 (Echo 1 out end) `echo1OutEnd` |

   - The names are Spotify's; the shapes are this app's (Spotify's own curves for a style aren't in
     the exports), so a named style sounds like its name, not necessarily like Spotify.
   - Not set (`null`): the lane of the mix's base preset (`style.basePresetId`; the ids from Spotify
     9.2.2's preset enum, the fills seen in its editor on 29 mixes 2026-11-25,
     research/spotify-mixes/README.md "Base presets"):

     | `basePresetId` | Unset lanes play |
     |---|---|
     | 1 Fade, 2 Blend, 3 Rise, 4 Melt, 11 Slam, 17 Wave, 20 Dissolve, 21 Surge, 22 Afterglow | that preset's lanes (editor.md §2), Effects and Looping included |
     | 5 (older: BassSwapFilterOut) | volume `fadeInCutOut`, then the default |
     | 10 (older: FilterFadeInOut) | EQ `centerBassSwap`, Filter `hpBoth`, then the default |
     | 19 (older: LowPassFilterFadeInOut) | volume `overlap`, EQ `centerBassSwap`, Filter `lpBoth` |
     | any other (6-9, 12-16, 18, none) | the default: `overlap` / `centerBassSwap` / `none` / none / none |

     0 is No transition; with no id and every lane unset a mix is a straight cut (rule 3). A number
     with no shape here (below) plays the same as unset. A stored number is used as stored, even where
     Spotify's editor showed another (DJ club Mixes #63).
   - Named in Spotify's code but not offered by its editor, so with no shape here and none planned
     (style_names.json; the editor's lists checked 2026-11-25): eq 2, 3, 7, 8, 9, 14; volume 3, 4, 8;
     filter 1-4, 8; looping 5; every jogwheel style (rule 6). The ones the four exports use (eq) each
     come with a drawing on that lane (rule 5), which carries it. A drawn Effects lane takes its echo or delay time
     from its fx name (½, ¾ or 1 beat). A number not in the table on a lane with no drawing: as unset
     (the base preset's lane), counted in the summary (rule 9).
   - An Effects lane that is none is not written (editor.md §12 rule 1).

5. **[all] Curves** (`curves`, a drawn lane) replace that lane with a drawing (editor.md §10); a deck
   the curve leaves out keeps the lane style's shape, drawn:
   - Segments `{ start, end, points }` in fractions of the mix. Two points: a line (as points).
     Four points: a cubic Bézier, sampled at 9 points (t = 0, ⅛ … 1). x = fraction × the
     drawing's length (beats or seconds).
   - `volume.curve`: the gain, y as is (0..1).
   - `eq.low` → `bass`, `eq.mid` → `mid`, `eq.high` → `high`: y 0.5 or above is 0 dB; below, linear
     down to -18 dB at 0. A band that never goes below 0 dB is left out.
   - `filter.cutoff`, y 0.5 open: above, a high-pass of 20 × 50^((y − 0.5) / 0.5) Hz (1 kHz at 1);
     below, a low-pass of 20000 × 0.02^((0.5 − y) / 0.5) Hz (400 Hz at 0). A two-point line is
     sampled at 5 points, so the cutoff glides on the same log scale. `lp` and `hp` are drawn only
     where they move.
   - `filter.noiseColor` → the effect drawing's `noise`: y 0.5 or below is 0; above, (y − 0.5) / 0.5,
     so 1 at 1 (DJ club Mixes #33 and #43, filter style 15 "Noise out end"). A curve that never goes
     above 0.5 is left out. Spotify's noise sound is not known; this app's is editor.md §12 rule 3.
   - `fx.echo`, `fx.reverb`, `fx.delay` → the Effects drawing's `echo`, `reverb`, `delay`, y as is
     (0..1). A curve that never goes above 0 is left out. In the four exports every fx curve is on A
     (`from`): reverb in 42 mixes, echo in 6, delay in none. A named fx style (rule 4) sets the
     drawing's `echoBeats` or `delayBeats`.

6. **[all] Not carried** (no lane here): the filter's `resonance` (no export has one), `jogwheel`.
   The mix plays without them (rule 9 names them).
   - Looping is only a style number in the exports (25 mixes with a loop; `loopingOutBlocks` is in
     none), so the style alone sets the Looping lane (editor.md §13): 0 none, 1 loop2, 2 loop4,
     3 loop8, 4 loop16, 8 loop1. Another number plays none and counts as no match (rule 9).
   - The header's `f6` and `f7` are A's and B's rate in the mix (Spotify's beat match): `f7` is A's
     tempo ÷ B's own (One Dance 104 → Unforgettable 98: 1.0612), `fromBpm` and `toBpm` are both the
     mix's tempo (B's own is `toBpm / f7`), and `f6` is 1 in every mix of the four exports. The beat
     match here works out its own rates from the songs' analysed tempos (editor.md §4; it never slows
     a song), so `f6`/`f7` aren't read; `gridBpm` is `fromBpm`, A's own tempo.

7. **[all] Skipped mixes**, the rest imported:
   - a song with no `youtubeVideoId`: "no YouTube id for <title>" (DJ club Mixes #89 into Linda
     Eh, RAP Mixes #58 into By The Way: songs removed from the playlist);
   - no `fromStartMs` otherwise, or no `durationMs`: "its timing is not valid";
   - and mix-file.md rule 4's reasons.

8. **[all] Play these mixes** starts a fresh queue of `playlist.tracks` in order, each by its
   `youtubeVideoId`, as mix-file.md rule 7 does (the queue before it replaced, the first song plays):
   songs in no mix too, a track with no id left out, the same song twice in a row once.

9. **[all] Afterwards**, mix-file.md rule 7's line, then, when there are any:
   - "N lanes in a Spotify style with no match here play the default shape";
   - "not carried: …", the kinds of rule 6 the file used (filter resonance, jogwheel);
   - "N mixes bring B in late in an older export's unsigned time: here B starts with the mix"
     (rule 3);
   - while an app doesn't play song speeds yet (rule 10): "N mixes set a song's speed: saved, but
     this app plays every song at x1 for now". The PC plays them and has no such line.

10. **[all] Song speed.** `f18` (the APK's itemSpeedA) and `f19` (itemSpeedB) are the speeds Spotify
    plays A and B at; missing is 1.
    - A mix with either one 0.0001 or more from 1 gets `speed` `{ out: f18, in: f19 }` in its override
      (override.schema.json), a 1 left out, each rounded to 0.00001. A speed outside 0.5..2 is dropped.
    - A song keeps its speed for the whole time it plays in the playlist, not only in the mix: BUDGET
      #5 brings Cold Water in at x1.03228 and #6 takes it out at x1.03228. A song's speed
      (`songSpeed`): the `speed.in` of the mix that brought it in (the song before → it), else the
      `speed.out` of the mix taking it out (it → the song after), else 1.
    - In the four exports 235 mixes carry f18/f19. All are 1 except five songs of BUDGET DJ MIX:
      Stay x0.97057 (#4, #5), Cold Water x1.03228 (#5, #6), Stereo Hearts x1.03333 (#6, #7),
      Boom Clap x1.03262 (#7, #8), The Sound x1.02735 (#90, #91).
    - **[each app] Playing it:** the song plays at its speed with its pitch kept, from its start to
      its end, through both its mixes. In a mix, A's tempo is its BPM × its speed and B's its BPM ×
      its speed (the played tempos). Every tempo gate compares the played tempos, not the BPMs: the
      v2 stretch limit (`V2_MAX_STRETCH`, 8%) and the stretch allowed (Sync and Glide, picked, have
      no limit since 2026-11-26, editor.md §4). Found
      2026-11-25 by BitChord on BUDGET #5, Stay x0.97057 → Cold Water x1.03228: on its BPMs 102.3
      and 93.0 the raw tempos are 10% apart and the 2 bars fell back to a plain fade; played, 99.3
      and 96.0 are 3.4% apart, so it beat-matches (editor-cases.json, plans "songs at a speed").
      Within the limit, A plays at its speed (no ramp or glide) and B at A's played tempo, rate
      `speedOut × A's BPM / B's BPM` (folded to the nearest of half, same or double time); after
      the mix B glides back to its speed and stays there. This slows a song too (Stay x0.97), which
      no planner here does on its own (automix.js: "Tempo only ever moves up"). Over the limit it
      plays as any pair that far apart does.
    - **[all] How it plays**, with Automix on only (on the PC: `speedOf`, `steadyOutgoing` in
      crossfade.js; `plan({ speed })` in automix.js):
      - Between mixes the player runs the song at its speed (pitch kept). A speed the user set
        (anything but x1 or the one set here) is left alone, and that song isn't mixed.
      - The plan gets `speedOut` and `speedIn` (plan.schema.json): a blend plays A at `speedOut`
        (`outRate`) and B at A's played tempo (`rate`, above), with no ramp, glide or loop mix; a
        filter mix or fade plays B at `speedIn`.
      - B stays at `speedIn` through the mix and after it (a glide back ends at `speedIn`, not x1).
      - **No echo out** at a song speed: when `speedOut` or `speedIn` is set, a pair too far apart in
        tempo (versions.md "Tempo too far apart") skips the echo out's rung, and the ladder goes on
        from the filter mix to the hand-over; the reason ends "(no echo out at a playlist speed)".
        The echo out is planned as a blend with `rate` 1, so B would start at x1 and glide to its
        speed after the hand-over. Every app plans it this way (decided 2026-11-26: the PC ec24b8c and
        the phone b6e643a; BitChord to follow).
      - Each app plays A at its speed into and through the mix in its own way. On the PC: the
        hand-over finds the playing spot in A's copy with a 0.1 s stretch of what is heard (score
        0.8, the copy's position moving at A's speed); the copy plays 0.6 s at x1, then the stretch
        deck plays A at its speed to its end (the planner's echo out never comes here: the rule
        above); a song at a speed
        other than 1 stays on YouTube's player (no smooth hand-over or addon deck).

## Notes

- Replacing saved edits and saving work as for a mix file (mix-file.md rules 5, 6); imported mixes
  are saved unlocked.
- The four exports (BUDGET DJ MIX, Heavenly Transitions, DJ club Mixes, RAP Mixes) are version 3
  as of 2026-11-25. Weak matches (a music video or another version where YouTube Music has no
  song) can be changed in `youtubeVideoId` by hand; the apps take the id as it is.
