# Shared spec

What the extension (this repo) and the phone app must agree on. The phone app keeps a copy of this folder and a script that checks its copy against this one; this folder is the master.

The rulebook is a way to keep one design across our apps, so nothing is worked out twice; it isn't a rule above the apps we build on. It covers what we built. When a base app (Morphe on the phone, upstream BitChord, the extension's upstream) ships a feature we built, its version wins: we delete ours and wire theirs into our code, and the rule here says so.

```
spec/
  automix/
    analysis.schema.json   one song's analysis (beats, downbeats, key, energy, vocals, sections, loudness)
    plan.schema.json       one transition plan (loop mix and blend/filter/crossfade)
    pairs/*.json           5 real song pairs, captured from the extension
    golden/*.json          the planner's plans for those pairs: Classic (key v2) and Automix v2 (key v3)
    versions.md            how the engines differ, and Automix v2's rules
    analysis-cases.md      the analysis rules: two layers (the analysers agree, the mixes agree), real songs kept local
    analysis-cases.json    the synthetic songs with their checks, the real-song list and the planner thresholds
    playback.md            what every mix must sound like (splice, cuts, lock, fades), each platform by its own means
    editor.md              the transition editor: presets, lanes as exact curves, the window, beat match, overrides
    override.schema.json   one pair's saved edit
    editor-cases.json      every preset and lane → its curves; saved window positions → seconds
  canvas/
    canvas.md              the canvas sources and their order, the part and clip picking, the display and backdrops
    canvas-cases.json      inputs → the expected choice, for each of those rules
  addons/
    protocol.md            the BitChord-compatible addon protocol and matching rules
    matcher-cases.json     YouTube song + addon rows → the row the matcher must pick; queries() per song
    pick-cases.json        our rules on top of the matcher, and the client's readings (tier, kbps, probe, params, stream answer, base URL)
    offset-map.md          an addon file's timeline against YouTube's, and its level
```

## Automix fixtures

Each pair file holds two songs as the extension saw them: `analysis` (analysis.schema.json, minus the cache flag), `sung` (sung spans from synced lyrics, `[[start, end], …]`, or null when the song had no synced lyrics at capture time), `decodedSec` and `loudness20Hz` (RMS of the decoded audio in 50 ms windows, what the loop planner reads). `listening` says what the transition should sound like: these 5 are the pairs from the comparison report, and pair 2 is the one that must not loop.

Check today's planner against the golden plans:

```
node scripts/automix_fixtures.mjs
```

It loads `src/automix/automix.js` in a sandbox, plans each pair from the playing song's second max(30, duration − 95), and prints `ok` or `DIFF` per pair. After an intended planner change, rewrite the golden files with `--update` and review their diff: the golden files are the baseline the new planner is judged against, so a change there is a change in behaviour.

Every plan carries `curves`: each song's fader, filters, bass and high shelves and rate over the transition, as the engine plays them (the engine takes its shapes from the same planner functions). The overview draws these, so a port that matches the golden curves draws and plays the same transition.

Each song's loudness: `loudness20Hz` (optional in the analysis, used by the overview's waveform; the pair files carry it beside the analysis) and `ytLoudnessDb` (YouTube's own `loudnessDb`, which both decks level against; see analysis.schema.json for where each app reads it and when `perceptualLoudnessDb` is preferred).

Golden plans today (Classic / Automix v2): pair 1 loop / loop, pair 2 loop / hand-over, pair 3 blend / hand-over, pair 4 blend / glide blend, pair 5 blend / hand-over. Two rules are hard and checked by the script: pair 1 must stay a loop under Automix v2 (the user's favourite), and pair 2 must never loop under it (a 2-bar outgoing loop checked only by the vocal mask, tempos 11% apart).

### Recapturing a pair

The test Firefox (`~/.claude/firefox-test/bidi.mjs`, with uBlock) has a `capture` scenario: it plays song A, queues song B, waits until both are analysed, then asks the page for the fixture through the debug message `vivi-automix-fixture` (see README_CUSTOM.md, Debug helpers) and writes the pair file.

Lyrics availability changes between captures: a song with synced lyrics one day may have none the next, and then its `sung` is null and the planner falls back to the vocal mask. Compare `sung` before blaming a planner change for a golden diff.

## Analysis and playback

`analysis-cases.md` holds the rules: neither analyser is tuned to copy the other; layer 1 checks
that the analysers agree on the same decoded file; layer 2 checks that each pair gets the same mix.
Synthetic songs run in CI (`node scripts/analysis_cases.mjs`, about a minute, on the real models).
Real songs run locally from a git-ignored cache. `playback.md` holds the sound targets every
platform must meet.

## Canvas fixtures

`canvas.md` cites the phone's code and its originals (Metrolist, Prism, BitChord) for every rule.
Where they differ, the original is the rule. Rules marked "phone only" are platform-bound.
`node scripts/canvas_cases_tests.mjs` runs every case the extension has a function for.

## Lyrics fixtures

`lyrics/lyrics.md` holds the lyrics rules (timing, offsets, scroll, duets, gaps, layout, sources),
each marked for a full lyrics view, the phone's one-line strip, or both. The original is Metrolist
unless a rule names BitChord. `node scripts/lyrics_cases_tests.mjs` checks `lyrics-cases.json`
against a port of Metrolist's functions kept in the script.

## CI

`.github/workflows/spec-tests.yml` runs every suite above on every push, except the real-song
analysis cases.

## Addon fixtures

`matcher-cases.json` was filled by BitChord's own matcher (v1.9.2, a2d886e6). A port must reproduce every `expect` block. A JS port runs the script below; a port in another language (the phone app's, from a JVM test) reads `matcher-cases.json` in its own test and checks the same `pick`, `ranked`, `scores` and `rejected`.

```
node scripts/addon_matcher_fixtures.mjs --matcher path/to/trackMatcher.js
```

The extension's port is `src/addons/track-matcher.js` (BitChord's file with its types stripped):

```
node scripts/addon_matcher_fixtures.mjs --matcher src/addons/track-matcher.js
```

Our rules on top of the matcher (ISRC first, Atmos rows, previews, length slack, the range probe, at most 3 rows; protocol.md §7) are in `src/addons/pick.js`. Their cases, and the client's readings (tierOf, kbps, probeVerdict, paramsFor, readStream, baseOf, sameAddon), are data in `pick-cases.json`: `node scripts/addon_pick_tests.mjs` reads it, and so does the phone's JVM test.

The offset fit and the level (`offset-map.md`, `src/addons/offset-fit.js`): `node scripts/addon_offset_fixtures.mjs` builds synthetic songs from the PRNG and generator spelled out in `offset-map.md` (about 10 s).

The window check on real songs: `window-cases.json` holds the phone's 51 measured windows on 9 songs as numbers (the audio isn't kept). `node scripts/addon_window_cases.mjs` runs them on local copies in `.cache/addons/` (git-ignored, never in CI) and skips a song without them; the cases' notes say how to rebuild the copies (`scripts/addon_window_fetch.mjs` asks the user's addons, so it runs only with the user's word).

The client (`src/addons/client.js`: discovery, request shape, caching, statuses, health, resolve) is tested against a local mock server by `node scripts/addon_client_tests.mjs`. The PC's addon list and its popup messages (`src/addons/bg-addons.js`; links stay in the background, the popup sees name and host) by `node scripts/addon_store_tests.mjs`. The page side of the look-ahead (`src/addons/page-addons.js`) by `node scripts/addon_page_tests.mjs`.

To check against BitChord itself, export its matcher from the BitChord clone and run it (Node 23.6+ runs the .ts file directly):

```
git -C "../YT Clients/BitChord" show a2d886e6:web/app/src/data/match/trackMatcher.ts > "$TMP/trackMatcher.ts"
node scripts/addon_matcher_fixtures.mjs --matcher "$TMP/trackMatcher.ts"
```
