# Mix files

A mix file holds the edits (`override.schema.json`, editor.md §1) of one or more song pairs, so a
mix made in one app plays in another, and so ready-made mixes can be imported and listened to
without opening the editor. The PC, the phone and BitChord read and write the same file.
Import… also takes a Spotify mix export as it is, converted in the app: `spotify-mixes.md`.

Schema: `mix-file.schema.json`. Functions on the PC: `readMixFile`, `writeMixFile`, `importPlan`,
`mixChanges` and `mixQueue` in `src/automix/automix.js`; `importPairPicks` and `queueSongs` in
`src/automix/crossfade.js` (the queue itself: `queueSongs` in `src/automix/crossfade-page.js`).
Test: `node --test scripts/test_automix_plan.mjs` (the "mix file" tests).

## Rules

1. **[all] The file.** One JSON object, UTF-8, named `<anything>.json` (any name; the `format` field, not the name, says it is a mix file):

   ```json
   { "format": "vivi-mix", "version": 1, "mixes": [ … ] }
   ```

   At most 300 mixes and 2 MB.

2. **[all] A mix.** `{ "from": song, "to": song, "override": override }`.
   - `from` is the playing song (A), `to` the next (B). A song is `{ "videoId", "title"?, "artist"? }`.
     The YouTube video id (11 characters, `A-Z a-z 0-9 _ -`) is the key. The title and artist are only
     for the person reading the file, and the apps never match on them.
   - `override` is the override exactly as the editor saves it (override.schema.json): `preset`,
     `lanes` (shape names or drawings, editor.md §10), `bars`, `beatMatch`, `window`, `lock`, and
     `gridBpm`: the tempo of A that its beats count on (`bars`, and drawings with `unit: "beat"`),
     A's end grid as the writing app read it (`editorGrid(A, 'out').bpm`). Rule 4 uses it.
     `engine` and `savedAt` belong to the app that saved it: a writer leaves them out and a reader
     ignores them.
   - The pair's key is `"<from.videoId>><to.videoId>"`, as the editor's (editor.md §1).
   - `window` positions may be seconds only (`{ "sec": 218.1 }`, no `bar`): a writer that doesn't
     know the reader's beat grid (another app, a converter) gives the song time, and the reader plays
     it at that song's nearest beat (editor.md §6, "Seconds only").
   - **[all] B's late entry.** `window.in` may carry `delaySec` (0.001 to 60 s, to 1 ms): B comes in
     that long after the mix starts, as Spotify's negative `toStartMs` does (spotify-mixes.md rule 3).
     - Until then the incoming song is silent and not started; then it starts at `window.in`'s
       position. The curves are unchanged, still measured from the mix's start, so B's fade-in
       is part-way up when B starts.
     - **[all] With a mix-in past 0:00** nothing of B before its mix-in is ever heard. B's gain is
       0 until the delay ends, whatever the curve says there, then rises to the curve within
       10 ms. A player or deck started early (to warm up, or to be in place on time) stays under
       that 0. A skip or abort during the wait puts B at its mix-in, not before it. (PC audit
       2026-11-26: a mix-in of 30 s with "B in after 4 s" played B from 26 s through the rising
       curve on YouTube's player, and the deck's 0.5 s pre-roll from 29.5 s at about 22%.)
     - **[all] A while B is held.** A trim that keeps the two songs at equal power (Automix v2's
       own blend, `1/sqrt(rise + fall)`) is worked out from B's heard gain, not from B's curve: 0
       while B is held, its 10 ms rise, then its curve. So A plays its own curve, untrimmed, while
       it plays alone, and its trim follows B in, with no step in the output (no more than 1 dB per
       10 ms across B's entry) and no ramp of its own. Only what the trim reads changes: the curves
       as drawn or saved are unchanged, and a preset, which has no such trim, is unaffected.
       (BitChord audit 2026-11-26, 1b #7: A dipped up to 3 dB under B's silent hold. The PC builds
       it in automix.js `djShape`; BitChord's heardInto counts a held B as silent and follows its
       rise; the phone has no trim driven by B.)
     - The plan carries it as `inDelaySec` (plan.schema.json), at most the mix's length − 0.5 s
       (a longer one is shortened, with a warning).
     - Only a plain blend or crossfade plays it. A loop mix never does, and a hand-over, a
       fallback, a glide or a shaped blend (drop-in, muffle, echo) starts B with the mix, with a
       warning. The kick lock leaves such a mix alone.
     - Absent, or on `window.out`: B starts with the mix.
     - The editor shows it as a number field by the window's nudges ("B in after N s"; 0 clears it),
       and the window line reads "B enters at 0:00.0, 3.2 s into the mix". Moving the mix-in keeps
       it. `mixChanges` shows it in the mix-in row.
     - PC: `automix.js` `plan` (`inDelaySec`); `crossfade.js` `inStartOf` (the deck and the
       player start that long into the mix) and `lateEvents` / `lateFade` (B's gain 0 until
       then); `automix-overview.js` `setLate`.

3. **[all] Reading.** The whole file is refused, with nothing imported, when:
   - it isn't JSON, or `format` isn't `"vivi-mix"`: "not a Vivimusic mix file" (`format`
     `"spotify-mix-export"` is read by spotify-mixes.md instead);
   - `version` isn't a whole number from 1 up: "the mix file has no valid version";
   - `version` is higher than the app reads: "this mix file is version N, newer than this app reads
     (1): update the app to import it";
   - `mixes` is missing or empty: "the mix file has no mixes"; or it has more than 300.

   Unknown fields are ignored at every level, so a newer writer's additions within version 1 don't
   break an older reader.

4. **[all] Each mix** is normalized as the editor saves (`normalizeOverride`, editor.md §10 rule 2).
   A mix is skipped, and the rest are imported, when:
   - a song has no valid `videoId`: "a song has no valid videoId";
   - both songs are the same: "the same song on both sides";
   - nothing but Auto is left: "nothing but Auto in it";
   - its preset is unknown to the app: `the preset "<id>" is unknown here`;
   - its `preset` is `custom` and its lanes don't survive: "its lanes are not valid".

   The same pair twice: the later mix is used, and the earlier is reported as skipped.

   **Half and double time.** An app can read A at half or double the writer's tempo (Cinderella: 65
   or 130 BPM). So that the mix plays the same seconds in every app, the reader folds the beats:
   - k = this app's tempo for A (`editorGrid(A, 'out').bpm`) ÷ `gridBpm`. Within 4% of 2: k = 2;
     within 4% of ½: k = ½; within 4% of 1: k = 1.
   - With k = 2 or ½: every x of a drawing in beats and `bars` are multiplied by k, and `gridBpm`
     becomes `gridBpm` × k. Bars that leave 2..32 play as 2 or 32, with "N bars on this song's grid:
     M play".
   - No `gridBpm` (a file from before it), or tempos that don't fold: the beats are taken as they
     are. The import summary says so for that mix (rule 7): "no gridBpm: its beats are taken as they
     are", or "drawn at X BPM, this song reads Y BPM: its beats are taken as they are" (the plan
     shows the second as a warning too).
   - The override is saved as the file has it. The fold is made where the beats are used: the
     planner (`plan`) and the editor (`foldOverride`), since A may not be analysed yet at import.
     An edit in the editor saves the folded override, on this app's grid.

5. **[all] Replacing.** A pair that already has a saved override that differs from the file's is
   replaced only after a confirm that lists, for each such pair, what changes, one line per field:
   preset, volume, eq, effect, length, beat match, mix-out, mix-in, lock (`mixChanges`, "length:
   auto → 16 bars", "volume: crossfade → drawn", "volume: drawn → another drawing"; a position in
   seconds only reads as its time: "mix-out: bar 40.3 → 218.142 s"). Declining keeps
   every saved override and still adds the new pairs. A pair saved exactly as the file has it counts
   as "already saved as they are" and needs no confirm. (`gridBpm` alone is not a change.) Beat
   match is compared as it plays, `beatMatchOf` on both sides (2026-11-27): an own export's
   `beatMatch: "auto"` against a saved mix with none is the same, and a change is named as it
   plays ("beat match: auto → sync").

6. **[all] Saving.** Each imported override is saved per pair as the editor would save it: this app's
   `engine`, `savedAt` now, the 300-pair cap and the locked cap (editor.md §1). A lock past the
   locked cap is refused for that pair with the editor's message. The pair plays the import the next
   time it is planned, also when it is the pair on screen.

   **An imported mix beat-matches as Sync** (ruled 2026-11-26 [all]). A saved mix that carries
   `gridBpm` came from a file (the editor never sets one); with no `beatMatch` it plays as Sync:
   no 8% tempo gate, folded up to about 41%, as a Sync picked in the editor (editor.md §4). Its
   file's `beatMatch` (Off, Glide, Sync) is kept as it is. It is done when the mix plays
   (`beatMatchOf`), not stored at import, so mixes imported before need no re-import. The editor
   shows such a mix's beat match as Sync. Auto picked there is saved as `beatMatch: "auto"` (kept
   only on a mix with `gridBpm`), and that mix then has Automix's limits again. A loop mix has no
   beat match. An export writes each mix's beat match as it plays (`beatMatchOf`, 2026-11-27): the
   file carries `gridBpm`, so a mix made in the app with Auto is written as `beatMatch: "auto"`
   (left out, it would come back as Sync) and an imported one with none as `"sync"`. (Until then an imported mix's Auto kept Automix's 8% limit: on the phone an imported
   Spotify mix 9% apart played without beat match.)

7. **[all] Afterwards** the app says what happened in one line: "Imported N mixes", then any of
   "N already saved as they are", "N kept as saved" (declined replacements), each refused lock and
   each skipped mix with its reason (`mix 3 skipped: …`), and each imported mix whose beats are taken
   as they are (rule 4): `<title>: <why>`.

   **[all] Play these mixes.** After an import, a "Play these mixes" button starts a fresh queue of the
   file's songs in its order and plays them: each mix's `from`, then its `to`, a song that is already
   next in line not added twice (A→B, B→C queues A, B, C; `mixQueue`). The queue before it is replaced
   (the playing song too, unless it is the first of the file's songs), so the file plays exactly in its
   order, whatever was queued before. The first song plays; when it is the playing song, it plays on.
   A second press starts the same fresh queue again. The button
   stays in the Mix files row for the last imported file (while the app or page stays open). The
   readable mixes count, also those kept as saved or skipped by a refused lock; skipped mixes
   (rule 4) don't. With nothing playing, the PC asks to play any song first.

8. **[all] Export.** "This pair" (the pair on screen, when it has an edit) or "all" (every saved
   override), written with `writeMixFile`: the override as saved without `engine` and `savedAt`, its
   `gridBpm` as saved, else this app's tempo for A when A is analysed, and the songs' titles and
   artists where the app knows them. The file name is
   `<from>-<to>.json` for one mix (the titles in lower case, letters and digits only, 24 at
   most each), `mixes-<YYYY-MM-DD>.json` for more. An export imported into any of
   the three apps gives the same normalized override back (the round trip).

9. **[each app] Where.**
   - **PC:** a "Mix files" row at the foot of the Automix overview: Import… (a mix file or a Spotify
     mix export), Export this pair,
     Export all, Play these mixes, and a line for the result (rule 7). Play these mixes makes the queue
     the way YouTube Music makes its own: `music/get_queue` for the songs, then its queue store's
     `CLEAR`, `ADD_ITEMS` at 0 and `SET_INDEX` 0. (Adding after the playing song instead let YouTube
     Music merge a song that was already in its queue, and the wrong song played first.)
   - **Phone, BitChord:** their own place in the Automix screen, with the same four actions.

10. **[all] Ready-made mixes** are kept as files (the user's copies: `D:\Programs\Projects\YT
    Clients\mixes\`). Importing one, then Play these mixes (or playing its songs one after the other
    in a playlist), plays the mix with no editing. Imported mixes are saved unlocked, as the file has
    them (`lock` only when the file says so).

## Notes

- A drawing in beats (`unit: "beat"`) counts on A's grid as the app analysed it (editor.md §10
  rule 4); `gridBpm` (rule 4) keeps half- and double-time readings to the same seconds. Tempos
  apart by any other factor are not folded.
- The ready-made Cinderella → Drowning is drawn on the PC's grid, `gridBpm` 130: Spotify's "8 bars"
  at 65 BPM are 16 bars there, 29.5 s. An app that reads Cinderella at 65 BPM plays it as 8 bars, the
  same 29.5 s.
- Copies of the ready-made files, read by the tests: `spec/automix/mixes/`.
- The file holds no audio and no analysis, only the edit.
