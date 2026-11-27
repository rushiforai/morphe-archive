# Plan: the Automix progress row (next week, with drawn curves)

Draft, 2026-11-21. Asked for by the user after seeing the phone's (Vivimusic) overview. Not in the
rulebook yet: it becomes a section of `editor.md` (or its own file) next week, and BitChord gets it
too. Source: the Morph patches chat, read from the phone's code (paths under
`bundle/extensions/extension/src/main/java/app/ayham/extension/music/`).

## What the phone has

One progress row in the Automix overview, not a list of every part. It shows only while no mix is
live (`automix/Automix.java:639-650`).

- **Which:** this song's analysis first, else the next song's; never both.
  - "Analysing this song: <stage> · NN%" or "Analysing the next song: <stage> · NN%".
  - With neither analysing and the loop mix still pending: "Looking for a loop mix…", with an
    indeterminate bar.
- **Stages, fixed % at each stage's start** (`automix/Analyzer.java`):

  | Stage | % |
  |---|---|
  | waiting its turn | 0 |
  | starting | 0 |
  | downloading | 0 |
  | decoding | 2 |
  | finding the beats | 22, then 52 after the opening's beats |
  | finding the key | 82 |
  | measuring the low end and keys | 84 |
  | finding the vocals | 85 |

  The row hides when the analysis ends.
- **Updates:** nothing is counted inside a stage; the % moves only at stage boundaries. The overview
  redraws every 50 ms.
- **Look:**
  - It sits under the drawing well, above the legend and clock: 12 sp text at 90% white, over a
    6 dp bar in the overview's frame colour on a 20% white track.
  - Hidden until first shown; after that it keeps its room when done (invisible, not gone), so the
    chips below don't jump.
  - No setting.
- **Around it:**
  - "Planning the mix…" when there's no plan; "A plain crossfade is playing"; "Nothing is playing";
    "Nothing queued after this song".
  - The note "The mix is planned once the analysis is done."
  - A stand-in fade while analysing: dashed, dimmed curves, the bars label "for now", and the note
    "A stand-in fade while the analysis runs."
  - The song chips show "Analysing…" instead of BPM, key and length.
- **Player line:** "Automix · this song: <label> · next: <label>", where the label is analysing… /
  waiting / failed / analysed (94 BPM F# major, dsp grid 0.82) / none.

## Gaps not to copy

A failed analysis hides the row with no message. The player line says "waiting" for a song whose
status is failed but has no analysis.

## Proposal for the spec (shared rules, each app's own stages)

1. **[all]** One row, this song before the next: "Analysing this song / the next song: <stage> ·
   NN%". Hidden during a live mix. Keeps its room once shown.
2. **[all, where the app has a separate loop-mix search]** "Looking for a loop mix…" with an
   indeterminate bar while the loop search runs.
3. **[all] New:** "Analysis failed: <reason>" in place of the row, kept until the song changes. The
   reason is always shown. The player line says "failed" for it too. Outcomes that aren't failures
   get their own wording, never "failed": a party stopping it, a decode too short, a song from a
   video. The phone and BitChord need this; neither has it today.
4. **[each app]** The stage names and % are each app's own:
   - The phone's fixed marks are tuned to its timings.
   - The PC analyses in a frame and a worker (`src/automix/automix.js`, `fit.worker.js`), and has
     no separate download or decode per song. Its stages would be e.g. "getting the audio", then
     the worker's own steps, with a real % where the worker can count (beats over the song's
     length).
5. **Open, for the user:**
   - Should the row also show the addon fetch ("Getting the lossless copy: <addon>") and the
     take-over? Neither app does that today.
   - Should it show during a live mix?

## BitChord's feedback (via the master, 2026-11-21)

- **Refining [BitChord]:** BitChord has a usable result after its opening pass while the rest keeps
  running.
  - Proposed: "Refining this song: <stage> · NN%", or hide the row once a usable plan exists.
  - BitChord only. The PC and the phone each analyse in one pass:
    - PC: pending → analyzing → done or error (`automix.js` `status`, lines 159-185).
    - Phone: `Analyzer.java:643-741`, saved at the end (:634-635). Until it's ready the phone plans
      only the fallback fade, dashed with "for now" (`Automix.java:694`).
- **Rule 3, the failure reason must be shown, and some outcomes aren't failures.** These must not
  read as one:
  - a party stopping the analysis;
  - a decode too short;
  - a song that comes from a video, which has its own line.
- **Hidden during a live mix:** BitChord's mix popup is mostly opened mid-mix. That makes the open
  question about a live mix more important.
- **Rule 2:** applies "where the app has a separate loop-mix search". It isn't confirmed that
  BitChord has one.
- **BitChord's stages:** waiting, getting the audio, the opening pass, pass 1 (DSP), pass 2 (the
  models, with a real %), and the v2 evidence pass.
- **Timing:** BitChord builds the row after its upstream v1.10 merge (next week), since v1.10 may
  replace its popup and analyser.

## PC work (next week)

- Have the analysis frame report its stage and %. Today the page only gets 'analyzing' / 'done'
  (automix.js `status`).
- Draw the row in `src/automix-overview.js`.
- Add the stand-in "for now" note, if the PC plans a stand-in fade while analysing.
- Add the failed state (rule 3).
