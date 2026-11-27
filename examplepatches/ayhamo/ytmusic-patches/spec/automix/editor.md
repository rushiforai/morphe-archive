# Transition editor

The Automix overview grows into an editor: presets, four lanes (volume, EQ, effect, Effects: §12), a draggable
transition window and a beat-match mode. The phone and the extension build the same editor from this
file. The user's edits are saved per pair as an **override** (`override.schema.json`); the planner
turns an override into a plan whose `curves` (plan.schema.json) both engines play.

Fixtures: `editor-cases.json` (an override → its curves and window). Runner on the extension:
`node scripts/editor_cases.mjs`. Functions: `presetCurves`, `resolveWindow`, and for
drawings (§10) `pointCurves`, `drawSec` and `normalizeOverride`, in `src/automix/automix.js`.

Mix files (overrides per pair in a file, to import and export): `mix-file.md`.

Sources: research `Spotify-Apple-Mixing.md` §1.2 (Spotify's editor) and §5 (what we lack), and
SHORTLIST "Overview → editor".

## 1. The override (question 1)

- **Key:** `"<fromVideoId>>``<toVideoId>"`, the same key both apps use today for `{style, bars}`.
- **Fields:**
  - `preset`;
  - `lanes` {volume, eq, effect, fx} (only for `custom`): each a shape name, or a drawing (§10); `fx`
    (§12) may be missing, which is none;
  - `bars`;
  - `beatMatch`;
  - `window` {out, in}, each a bar index plus a nudge in ms plus the seconds it meant when saved;
  - `lock`;
  - `gridBpm` (the tempo of A its beats count on, from a mix file: `mix-file.md` rule 4);
  - `speed` {out, in}: each song's speed in the playlist the mix came from (`spotify-mixes.md` rule
    10); the editor doesn't set it;
  - `engine` (the Automix version the user saw it under; informational);
  - `savedAt`.

  The full shape is in `override.schema.json`.
- **A missing field means Auto.** An override with nothing but Auto in it is deleted: Auto is the reset.
  - Auto values are never stored: no `preset: "auto"`, no `beatMatch: "auto"`, no `bars: 0`. A
    migrated `{style: blend}` is saved as `{family: blend}`.
  - `preset: loop` stores no `bars`, `window` or `beatMatch` (§2).
  - A nudge that rounds to 0 ms is not stored.
- **Lock** marks an edit, so it is never saved alone. On a pair with no edit the Lock button is off.
  When the last edit of a locked pair goes (its fields back to Auto), the override goes with its lock.
- **The cap:** 300 unlocked overrides, oldest saved first out. Locked overrides don't count against
  it and are never evicted. A lock is the user saying "keep this one". Locked overrides have a cap of
  their own, 300, and a lock beyond it is refused, with exactly this message:
  "300 pairs are locked already: unlock one first".
- **Today's picks migrate** as they're read, with no rewrite pass:

  | Today's `{style, bars}` | Becomes |
  |---|---|
  | `style: loop` | `preset: loop` |
  | `style: blend` | `preset: auto`, `family: blend` |
  | `style: filter` | `preset: auto`, `family: filter` |
  | `style: crossfade` | `preset: auto`, `beatMatch: off` |
  | `bars` | `bars` |

  `family` only exists to carry these old picks (the planner's own blend or filter mix, forced). The
  editor never writes it. Picking a preset drops it.

## 2. Presets (questions 2, 7, 9, 12)

A preset sets the lanes together. Editing a lane turns the preset into `custom`, with the
lanes it had. Picking a preset keeps the window and the length (Spotify does the same).

The presets are Spotify's (read in its mix editor 2026-11-25), in its order, then this app's Loop.
The id is what an override stores; the name is what the editor shows. The `effect` lane is
Spotify's Filter. Looping is none in every preset. No preset sets a length: each plays the pair's
own (Auto) unless one is picked.

| Name | id | Volume | EQ | Filter (`effect`) | Effects (`fx`) | Colour chip |
|---|---|---|---|---|---|---|
| Auto | `auto` | the planner's | the planner's | the planner's | none | neutral |
| Custom | `custom` | the user's | the user's | the user's | the user's | the badge only |
| Fade | `smooth` | smooth | centerBassSwap | none | none | blue |
| Rise | `rise` | overlap | endBassSwap | lpInHpOut | none | purple |
| Wave | `wave` | overlap | centerBassSwap | lpBoth | none | purple |
| Blend | `blend` | overlap | threeBandFade | none | none | yellow |
| Slam | `slam` | centerCut | none | none | none | red |
| Melt | `melt` | fadeInFadeOut | centerBassSwap | hpBoth | none | purple |
| Afterglow | `afterglow` | smooth | centerBassSwap | none | reverbOutCenter | purple |
| Surge | `surge` | fadeInCutOut | endBassSwap | hpHalfOut | reverbOutEnd | purple |
| Dissolve | `dissolve` | fadeInCutOut | endBassSwap | hpHalfOut | echoHalfOutEnd | purple |
| No transition | `none` | no mix | | | | neutral |
| Loop | `loop` | the loop mix's | the loop mix's | the loop mix's | none | green |
| Echo out | *reserved, see §5* | | | | | |

- Fade keeps the id `smooth` (its name before 2026-11-25), so saved edits read as they did. Melt's
  volume was `crossfade` before 2026-11-25 and Slam's length 2 bars.
- **No transition:** no mix and no crossfade. The playing song plays to its end and the next starts
  from its beginning, as with Automix off. The lanes, length, window and beat match are off; the
  presets stay, to pick another.
- The dropdowns show Spotify's names for the shapes (`spotify-mixes.md` rule 4, e.g. "Center bass
  swap", "Low pass filter in high pass filter out", "2 beat loop").

**Lane colours (both apps):**

| Lane | Colour |
|---|---|
| volume | blue `#4C8DFF` |
| EQ | yellow `#F5C542` |
| effect | purple `#A779FF` |
| rate | grey `#9AA0A6` |

**The UI:**
- Presets are a chip row. Lanes sit under a folded "Customize", each a dropdown of the named shapes.
- An edited pair shows a "Custom" badge (also for a non-Auto preset). The badge shows exactly when the
  pair has a saved override. That includes a migrated `family` pick, since a lone lock is never saved
  (§1). The Auto chip takes the preset
  back to Auto and keeps the rest of the edit (length, window, beat match, lock); "Reset to Auto"
  clears the whole edit and the badge.

**Loop (question 7):**
- The loop mix keeps its own length and its own curves. The loop planner picks bars it found clear of
  vocals, so the length chips, the lanes and the window drag are off for Loop in v1.
- The phone's loop renderer draws only gain, the 250 Hz shelf and HP, so any lane beyond that would be
  phone-only.
- The beat-match mode doesn't apply either: the loop decks do their own tempo ramp. Picking Loop
  drops a saved beat match.

**Slam (question 9):** a cut, not a fade:
- The volume swap is an 8 ms ramp (`CUT_RAMP_SEC`), which keeps it free of clicks.
- The ramp starts on the window's centre.
- With an even bar count that centre is a bar line.

## 3. Lanes as curves (questions 2, 3)

All curves are `[[t, v], …]` as in plan.schema.json: seconds from the window's start, held before
the first point and after the last, linear between points (Hz: geometric). Below, points are given at
a fraction `x` of the window's length `D` (t = x·D).

**Constants:**

| Name | Value | Note |
|---|---|---|
| `CUT_DB` | −18 dB | the planner's `BASS_CUT_DB` |
| shelves | low shelf 250 Hz, high shelf 4 kHz | slope 1, the Web Audio default; both apps already use these |
| `LP_CLOSED` | 400 Hz | |
| `HP_CLOSED` | 1000 Hz | |
| open filters | LP 20 kHz, HP 20 Hz | |
| `CUT_RAMP_SEC` | 0.008 s | the cut ramp, `e = 0.008 / D` as a fraction |

`hb` is half a beat as a fraction of the window: `0.5 · beatSec / D`. With beat match Off it is
`0.02`.

### Volume (`gain` per deck)

| Shape | Outgoing | Incoming |
|---|---|---|
| smooth | cos(x·π/2) at x = 0, 1/16 … 1 (17 points) | sin(x·π/2) at the same 17 points |
| crossfade | [0, 1] [1, 0] | [0, 0] [1, 1] |
| overlap | [0, 1] [0.75, 1] [1, 0] | [0, 0] [0.25, 1] |
| cutInFadeOut | [0, 1] [1, 0] | [0, 0] [e, 1] |
| fadeInCutOut | [0, 1] [1−e, 1] [1, 0] | [0, 0] [1, 1] |
| centerCut | [0, 1] [0.5, 1] [0.5+e, 0] | [0, 0] [0.5, 0] [0.5+e, 1] |
| fadeInFadeOut | [0, 1] [0.5, 1] [1, 0] | [0, 0] [0.5, 1] |
| fadeInFastOut | [0, 1] [0.75, 1] [1, 0] | [0, 0] [0.75, 1] |
| fadeIn1BarCutOut | [0, 1] [b, 1] [b+e, 0] | [0, 0] [0.5, 1] |
| overlap1BarCutOut | [0, 1] [b, 1] [b+e, 0] | [0, 0] [e, 1] |

`b` is one bar before the end: `max(0.5, 1 − 4 · beatSec / D)`; with beat match Off, `0.875`.

### EQ (`bassDb`, `highDb` per deck)

| Shape | Outgoing | Incoming |
|---|---|---|
| centerBassSwap | bass [0.5−hb, 0] [0.5+hb, CUT] | bass [0, CUT] [0.5−hb, CUT] [0.5+hb, 0] |
| endBassSwap | bass [0.875−hb, 0] [0.875+hb, CUT] | bass [0, CUT] [0.875−hb, CUT] [0.875+hb, 0] |
| threeBandFade | as centerBassSwap, plus high [0.5, 0] [1, CUT] | as centerBassSwap, plus high [0, CUT] [0.5, 0] |
| quickBassCut | bass [0, 0] [2·hb, CUT] | none |
| startBassSwap | bass [0.125−hb, 0] [0.125+hb, CUT] | bass [0, CUT] [0.125−hb, CUT] [0.125+hb, 0] |
| longBassCut | bass [0, 0] [0.5, CUT] | none |
| bassFadeOut | bass CUT · (1 − cos(t·π)) / 2 at x = t / 2, t = 0, 1/16 … 1 (17 points; an S-curve to CUT at 0.5) | none |
| none | none | none |

**Question 3: the mid band.** "3-band fade" uses the two shelves plus the volume lane; no shape
moves the mids. A drawing can (`mid`, plan `midDb`: §12), since Spotify's mixes draw it.

### Effect (`lowpassHz`, `highpassHz` per deck)

| Shape | Outgoing | Incoming |
|---|---|---|
| none | none | none |
| lpOut | LP [0, 20000] [1, 400] | none |
| hpIn | none | HP [0, 1000] [0.5, 20] |
| lpBoth | LP [0.5, 20000] [1, 400] | LP [0, 400] [0.5, 20000] |
| hpBoth | HP [0.5, 20] [1, 1000] | HP [0, 1000] [0.5, 20] |
| lpInHpOut | HP [0, 20] [1, 1000] | LP [0, 400] [1, 20000] |
| hpOut | HP [0, 20] [1, 1000] | none |
| lpIn | none | LP [0, 400] [1, 20000] |
| hpInLpOut | LP [0, 20000] [1, 400] | HP [0, 1000] [1, 20] |
| hpHalfOut | HP [0.5, 20] [1, 1000] | none |
| noiseOutEnd | noise [0.5, 0] [1, 1] (§12) | none |

The shapes added 2026-11-25 (fadeInFadeOut, fadeInFastOut, startBassSwap, longBassCut, hpOut, lpIn,
hpInLpOut, hpHalfOut, noiseOutEnd) carry Spotify's style names (`spotify-mixes.md` rule 4); Spotify's
own curves for them aren't known, so these are this app's. fadeIn1BarCutOut, overlap1BarCutOut and
bassFadeOut (added the same day) follow screenshots of Spotify's editor
(`research/spotify-mixes/styles/`, an 8-bar mix: A cut at bar 7, B's fade and A's bass S-curve
ending at bar 4).

### Rate (`rate`), from the beat-match mode (§4)

- The planner's rate curves stay as they are for Auto.
- Sync: the incoming deck at `r = A's BPM / B's BPM` for the whole window, then its glide back to
  ×1.0, as the planner's blend does today: [0, r] [D, r] [D + glide, 1].
- Glide: the planner's glide (`glideSteps`), one tempo step per beat on both songs: A goes from ×1.0
  towards B's tempo and B from A's tempo to ×1.0, geometrically, so the two meet on every beat and B
  ends at ×1.0. Both engines play the plan's rate points; editor-cases.json checks that the plan
  carries the glide.
- Off: no rate curve.

## 4. Beat match (question 6)

| Mode | What plays |
|---|---|
| Auto | the planner's choice, as today: a stretched blend when the tempos fit, else a hand-over |
| Sync | one tempo over the whole window (key lock), then B glides back to its own. Tempo only ever moves up, as in Auto: B faster, A is brought up to it before the window; B slower, B is sped up to A |
| Glide | B's tempo goes from A's to its own across the window |
| Off | both at their own tempo; a plain overlap with no snapping to beats |

- **No tempo range** (ruled 2026-11-26 [all]: only Automix's own choices have rules): Sync and
  Glide, picked, always beat-match, however far apart the tempos (after folding half and double
  time, at most about 41%). Until then they stretched at most 8% and played Off past it. Auto keeps
  Automix's own limits (`V2_MAX_STRETCH`, `stretchAllowed`): with beat match Auto a pair out of
  them plays without beat match, as before. An imported mix (one with `gridBpm`) with no beat
  match plays as Sync (mix-file.md rule 6, `beatMatchOf`), and the editor shows it as Sync;
  `beatMatch: "auto"` picked on it is kept and gives Automix's limits back.

## 5. Echo out (question 4)

Automix v2 plays an echo out on its own for a pair too far apart in tempo (versions.md "Tempo too
far apart"). Prism `MixMoves` `ECHO_OUT`.
1. **[both]** The catch is a bar line of A's end grid. The beat before it is fed to a delay line of
   one beat (A's beat) with feedback 0.53; the echo is mixed in after A's fader and runs through A's
   EQ and filters.
2. **[both]** On the catch A's dry sound is cut in 10 ms and B comes in at full level in the same
   10 ms, at its own speed, from its first downbeat when that is in its first 10 s, else from its
   start. Nothing is beatmatched and no filter moves. **PC:** a hand-over that comes too late to
   feed that beat (the catch under 20 ms away) plays the catch without the echo.
3. **[both]** The mix lasts 8 beats of A (`bars` 2); the echo has died to 0.53^8, about -44 dB, and is
   faded out over its last 50 ms.
4. **[both]** The plan: `shape` `echo` on style `blend`, `rate` 1, `outRate` 1, and
   `echo: {beats: 8, delaySec, feedback: 0.53, cutSec: 0.01}`. The overview names it "Echo out".
   Kick lock is skipped.
- Not yet in the editor: the preset id `echoOut` and the effect id `echoOut` stay reserved. A picked
  echo out needs a lane for the wet level, feedback and delay in beats, and the phone's loop
  renderer can't take a delay line yet. It gets its own rules here before either app shows it.

## 6. The window (question 5)

**What can move:** A's mix-out and B's mix-in, the window's start in each song. The length comes
from `bars`.

**Snapping:** each position snaps to its own song's grid.
- A's mix-out snaps to A's end grid (`tailGrid`); B's mix-in snaps to B's opening grid.
- Downbeats by default, beats on a long-press (phone) or with Shift (extension).
- With beat match Off, nothing snaps.
- Nudges are 10 ms steps (`nudgeMs`, ±2000 ms at most). A nudge past that is refused with
  "Nudges reach 2 s at most: drag the song instead".
- A nudge stops at the window's limits (below), as a drag does: one that would leave them is refused
  with "Held: " and the limit's reason; a nudge back towards them from outside is allowed. (Past a
  limit the planner clamps the position back, so the nudge would save a position that never plays.)
  **[PC]** `nudgeWindow(pos, dir, limits)` in `automix.js`.
- **The grids** (`editorGrid(analysis, side)` → `{beatSec, downbeatSec, bpm}`):
  - `out` (A): A's end grid, the `tailGrid` fields (`beatIntervalSec`, `firstDownbeatSec`, `bpm`)
    when the analysis has one, else its main grid.
  - `in` (B): B's main grid.
  - None when that grid lacks `bpm`, `beatIntervalSec` or `firstDownbeatSec`. Then nothing snaps,
    and the position is saved as `{bar: 0, sec}`.
  - A bar is 4 beats. Positions are `downbeatSec + j × beatSec`, with bar = floor(j / 4) and beat
    = j − 4 × bar.

**Readout while dragging:**
"A mixes out at 3:12.4 (bar 81) · B enters at 0:32.4 (bar 17)".

**Stored as** a bar index on that song's grid, plus the nudge, plus the seconds it meant when saved
(`sec`).
- A bar index survives a re-analysis that shifts the grid a little. `sec` catches a re-analysis that
  moved it more.
- **Reading it back** (`resolveWindow`): the time is `downbeat(bar) + nudgeMs/1000`. If that is more
  than one beat from `sec`, the grid changed under it. Then the position is `sec`, snapped to the new
  grid's nearest downbeat, and the result says `moved: true` so the editor can mark it.
- **[all] Seconds only** (`{sec}` with no `bar`, as a mix file from another app gives it, mix-file.md
  rule 2): the position plays at that song's nearest beat to `sec − nudgeMs/1000`, plus the nudge,
  never `moved`. With no grid it plays at `sec`. The readout leaves out the bar. A drag saves a
  normal position (with its bar); a nudge keeps it seconds only.

**Limits (a drag past one is held there, and the readout says why).** These are the planner's
`windowLimits(plan, A, B, earliest)`, in song seconds:
- **Inputs:**
  - `earliest` = A's playhead + a lead: the same `earliest` the platform's planner uses. The lead is a
    playback-timing constant, so each platform sets its own (the user's ruling: playback timing is
    per platform):
    - the extension: 4.5 s (`HAND_LEAD` 4 + 0.5, `src/automix/crossfade.js`);
    - the phone: 6.5 s (`EARLIEST_LEAD` = `HAND_LEAD` + 2.5);
    - BitChord: its own value, stated in its port.
    editor-cases.json pins none of them: its `plans` give `earliest` as a fixture input (pos + 4.5 s),
    and they pass with a 6.5 s lead too.
  - A's end = A's length − 0.3, not its music end (`contentEndSec`): a placed window (dragged,
    nudged, saved or imported) may run through A's fading outro, as Spotify's mixes do (ruled
    2026-11-26 [all], on Lush Life → Lean On: Spotify's mix-out 176.4 s was moved to 163.4 s).
    Only a length asked for without a window still has to fit before A's music end (`musicEnd`:
    `contentEndSec` when that is more than 1 s before A's length, cutting at most 20 s).
  - For a blend (`style: blend`, with `bars` and `beatSec`): A's span = bars × 4 × beatSec, and B's
    span = A's span × (`rate` / `outRate`), or ÷ `glide.q` for a glide.
  - For anything else, both spans are the plan's `durationSec`.
- **A's mix-out:**
  - from `earliest`, plus `rampSongSec` for a blend;
  - up to length − 0.3 − A's span (never below the lower limit).
- **B's mix-in:** from 0 up to B's length − 0.3 − B's span (never below 0). (It was − 10 until
  2026-11-26; ruled [all]: a placed or imported window is played as placed, only the songs' ends
  bound it.)
- **The readout's reasons:** "· held: " plus one of these:
  - "A has already played up to there" (A, low);
  - "the window has to end before A does" (A, high);
  - "that is B's start" (B, low);
  - "the window has to end before B does" (B, high).
- A snap that lands past a limit moves one step (a bar, or a beat with Shift or long-press) back
  inside.

What the limits are, in words:
- A's mix-out: no earlier than the planner's `earliest`, and early enough that the window ends 0.3 s
  before A's end (its length, even past where its music fades).
- B's mix-in: 0 or later, the window ending 0.3 s before B's end.
- A saved position past a limit moves to the nearest downbeat inside it (the clamped second itself
  when the song has no grid there), with the reason shown.
- A saved mix-out the playhead has already passed isn't moved to "now": the planner's own mix-out
  plays instead, with "the mix-out at X s has already played" shown.
- A length that doesn't fit before A's end plays as long as there is room, with the reason shown.
- **No cap on a length picked** (ruled 2026-11-26 [all]: only Automix's own choices have rules): a
  length picked plays as picked, however long against either song. It was shortened to a third of
  either song before. Only the songs' ends bound it ("doesn't fit before the end", above).
  The same for a filter mix the user picked (`family: filter`) with a length: it plays that many
  bars, not at most 8 (`FILTER_MAX_BARS`). Automix's own filter mixes keep the 8-bar cap.
- **A retired preset:** a saved pick naming a preset no longer offered plays as Automatic, with
  "the preset "<id>" is no longer offered: Automatic plays". The pick stays saved; its length and
  window still apply.
- **Hear it on the next song:** a button that seeks the playing song to 12 s before the planned
  mix-out, so the listener hears the transition without waiting. Greyed out when no mix is planned
  for this song, or too little of it is left to reach that point.
  - **[PC]** The overview's ▶ Preview: it seeks to about 21 s before the mix-out (the planner's
    4 s hand lead, plus the 14 s tail copy lead + 3 s + the tempo ramp; 8 s instead of the tail
    lead for a loop), because the PC copies A's tail before the mix. Greyed out while the plan isn't
    editable or under 25 s are left.
- The first window edit of one side (a drag or a nudge) saves the other side too, where the plan has
  it at that moment. With one side saved, the planner would still move the other (B's skip cap, the
  vocal re-route), and B's mix-in could jump bars under a 10 ms nudge of A.
- **A length picked is kept** (ruled 2026-11-26 [all]). With a length picked, alone ("Auto, 8 bars")
  or with a preset, Automix still picks the move and runs its gates (key, sub-bass, tempo, the
  fallbacks), but whichever move it picks plays at that length, with no cap:
  - a blend: never shortened by grid confidence. On a grid too weak to beat-match that many bars
    (where Automix's own `effectiveBlendBars` would cut it: under 0.6 past 8 bars, under 0.45 past
    4) it keeps the length and plays without beat match, as with no grid ("the beat grid is too
    weak to beat-match N bars: plays without beat match"). Automix's own lengths keep the cut;
  - a filter mix (no 8-bar `FILTER_MAX_BARS`), a drop-in (not its two bars), a muffle;
  - an echo out: its echo runs the length (`echo.beats` = bars × 4, not 8 beats);
  - a hand-over, a beatless bridge or the plain fallback: a crossfade of that length, ending where
    the move would have ended (not 1.5 s, the bridge's own span or the fade setting).
  Only the songs' ends bound it. A loop mix keeps its own length. Plain Auto with no length picked
  stays wholly Automix's choice. The one move that can't take a length: a song with no tempo at all
  (no grid and no beat interval) has no bars to lay it out on; its fallback keeps its own length and
  shows "N bars not used: <reason> (no tempo for this song)". (Until then a length alone could be
  replaced by a hand-over and showed "N bars not used:" with the reason.)
- A pick from before the editor that forced the filter mix (`family: filter`) places the filter mix
  itself: a saved window shows "the saved window isn't used". Picking a preset uses it.
- A saved mix-in isn't moved by Automix v2's kick lock (`kickLockAllowed`): the lock shifts B by
  up to an eighth of a beat, which would undo a nudge. editor-cases.json `plans` has the cases.
- Unlike Spotify, the first and last moments of a song are reachable when the limits allow.

**The planner's other gates** (question 8):
- An override is the user's choice, so the style gates don't block it: the vocal clash, the sub-bass
  veto (`V2_SUB_BASS_VETO`) and the "beat match or hand-over" ladder.
- When a gate would have refused, the editor shows the reason as a warning ("both sing over the
  window", "the productions clash").
- Physical limits are clamped or fall back, with the reason shown: the tempo range (§4), the song
  bounds, a missing grid for snapping. A pair the planner would hand over or filter out for its
  tempos plays the user's preset, length and window without beat match instead.
- Nothing is refused silently.

## 7. Auto's name and the header (question 10)

**The header** under the title names the plan (numbers rounded; D = the mix's seconds, one decimal):

| Plan | Header |
|---|---|
| `style: loop` | Loop mix · {totalBars} bars · {A BPM}→{B BPM} BPM · {D} s |
| `style: crossfade` | {Beatless bridge | Hand-over | Fade} · {D} s[ · {reason}] |
| anything else | {Filter mix | Drop-in | Muffle | Glide blend | Blend} · {bars} bars · {BPM} · {D} s |

{BPM} is "{outBpm}→{inBpm} BPM" when the two round to different numbers, else "{bpm} BPM".

With no override the preset row shows "Auto · <what the planner chose>":

| Plan | Shown |
|---|---|
| `style: loop` | Auto · Loop |
| `style: blend` | Auto · Blend |
| `style: blend`, `shape: dropin` | Auto · Drop-in |
| `style: blend`, `shape: muffle` | Auto · Muffle |
| `style: blend`, `glide` | Auto · Glide |
| `style: filter` | Auto · Filter |
| `style: crossfade` | Auto · Fade |
| `style: crossfade`, `handoff` | Auto · Hand-over |
| `style: crossfade`, `bridge` | Auto · Bridge |

## 8. Editing during a mix (question 11)

An edit made while the pair's mix is playing applies the next time the pair mixes, as today. The mix
that is playing finishes as planned. Changing curves on running decks would need both engines to
re-schedule mid-mix, and a half-old, half-new transition isn't what the user previewed.

Preview stays a seek on the real player: the overview seeks the playing song to a few seconds before
the window.

## 9. How an override reaches the planner

`plan({ …, pick })` takes the override (today's `{style, bars}` migrated as in §1):
1. `preset: loop` → the loop mix (today's `style: loop`).
2. Beat match Off, or Sync/Glide out of range → the plain overlap (today's crossfade path), at the
   window and length asked for.
3. Otherwise the planner plans its blend at the window and length asked for (`bars`, `window`).
   - A preset other than Auto then replaces the plan's curves with `presetCurves(override, D,
     beatSec)` for gain, the shelves and the filters.
   - It keeps the planner's tempo ramp before the mix and the rate curve for the beat-match mode.
4. `family` (migrated picks only) forces the planner's own blend or filter mix, as today.

Both engines play `plan.curves`. The extension's engine plays gain, the low and high shelves, HP, LP
and rate on both decks. The phone's blend engine plays the same six.

## 10. Drawn curves

Asked for after Spotify mixes the shapes of §3 can't make: a volume gated on and off 20 times, a
bump before a jump at the window's middle, slopes that bend twice. Under Customize, a lane can hold
points the user drew instead of a shape name. Both engines already play any `[[t, v], …]` curve
(plan.schema.json), so only the stored form, the conversion and the editor are new.

**1. The stored drawing.** In `lanes` (with `preset: custom`), a lane is a shape name (§3) or a
drawing:

```json
"lanes": {
  "volume": { "unit": "beat", "out": [[0, 1], [8, 1], [8, 0], [8.5, 0], [8.5, 1]], "in": [[0, 0], [32, 1]] },
  "eq": "centerBassSwap",
  "effect": { "unit": "beat", "out": { "hp": [[24, 20], [32, 1000]] }, "in": {} }
}
```

- `unit`: `beat` (x in beats of A from the window's start) or `sec` (x in seconds of the mix). The
  editor draws in beats, and in seconds when the plan has no beat grid (beat match Off, a hand-over,
  a fade). Either unit plays on any plan (rule 4).
- The curves, each a list of `[x, v]`:

  | Lane | Per deck | Plan curve | Range |
  |---|---|---|---|
  | volume | the list itself | `gain` | 0..1 |
  | eq | `bass`, `mid`, `high` | `bassDb`, `midDb`, `highDb` | −18..0 dB |
  | effect | `lp`, `hp` | `lowpassHz`, `highpassHz` | 20..20000 Hz |
  | effect | `noise` | `noise` | 0..1 |
  | fx (§12) | `echo`, `reverb`, `delay` | `echoSend`, `reverbSend`, `delaySend` | 0..1 |

- A volume drawing has both decks. An EQ or effect curve that's missing is none: the deck plays
  that band or filter open. Rate is never drawn: it comes from the beat-match mode (§3, §4).
- Lanes mix freely: a drawn volume with a named EQ shape is fine.

**2. Saving** (`normalizeOverride`, both apps):
- x is rounded to 0.001 and never below 0; v is clamped to its range and rounded to 0.001 (Hz to
  1 Hz).
- Points are sorted by x, ties kept in the order drawn. At most 2 points share one x (a step): a
  third at that x is dropped.
- At most 128 points per curve (`DRAW_MAX_POINTS`): the ones past 128 are dropped. The editor
  refuses the 129th instead, with exactly "128 points is the most for one line". (A gate is 4
  points, so 20 gates and their lead-in fit; a full drawing of 10 curves is under 20 KB.)
- An EQ or effect drawing with no curve left is saved as `none`. A volume drawing with a deck that
  has no points, or a drawing without a valid `unit`, is invalid: the lanes are refused and the
  override drops `custom`, as an invalid shape name does today.

**3. Steps.** Two points at one x are a step. It plays as a ramp of `CUT_RAMP_SEC` (8 ms, as Slam):
`[t, a] [t + 0.008, b]`, the ramp's end held at the next point's t when that comes sooner. So a gate
never clicks.

**4. From x to the plan's seconds** (`drawSec(x, unit, beatSec, glide)`; `pointCurves`):
- `sec`: t = x.
- `beat` on a beat-matched plan (a blend or a filter mix): one beat of A in the mix's seconds,
  `barSec / 4` (A's beat over its rate, so a sped-up A is counted right). Under Glide the beats
  differ: beat k starts at the glide's `at[k]` and lasts `dur[k]` (`glideSteps`), and t =
  at[floor(x)] + frac(x) · dur[floor(x)]. Past the last beat, its length goes on.
- `beat` on a plan with no beat match (a fade, a hand-over, beat match Off): A's beat from its end
  grid (`editorGrid(A, 'out')`), else 0.5 s (120 BPM).
- A half- or double-time pair counts on A's grid: B's beats land on every other x, or two per x. The
  planner's folding (automix.js `foldRate`) keeps them locked.

**5. The window's length** (decision A): the drawing keeps its beats when the length changes.
- Points past the window's end are cut, and the value there (linear, Hz geometric) is added as the
  last point at D. When the first point is already past D, the curve is its first value held:
  `[[0, v]]`.
- A drawing shorter than the window holds its last value, as every curve does.
- Before the first point, the first value is held.

**6. In the editor** (extension: `src/automix-overview.js`; the phone draws its own, and can show a
drawing read-only first):
- Each lane's dropdown has "Draw". Picking it turns the lane's shape into points
  (`shapeDrawing`): the shape's curves read back to x, an 8 ms ramp read back as a step. A drawing
  starts as the shape it came from.
  - On a loop mix (Auto chose one), Draw first picks Custom and starts the drawing on the blend
    planned for it.
  - A drawing is made for the window it was drawn on, so each drawing edit also saves the length
    shown (`bars`) when Length is Auto. Auto could otherwise shorten the window under it (a key
    clash plays 2 bars). A length picked by hand afterwards still applies (rule 5).
- With a drawn lane, a row of curve chips appears under the canvas (Volume; Bass, Mid, High;
  Lowpass, Highpass, Noise; Echo, Reverb, Delay, for the drawn lanes). The chosen curve is drawn bold with its points, on both decks'
  halves; the others stay as they are.
- On the chosen curve:
  - a click inside the frame adds a point to that deck's curve; a drag moves it; a double-click or a
    right-click deletes it;
  - x snaps to a quarter beat (`beat`), or 10 ms (`sec`); Shift drags free;
  - a drag onto a neighbour's x makes a step, but never a third point at one x;
  - a deck's last point can't be deleted from a volume drawing.
  - While a curve is chosen, the frame is for points: the window is moved with the nudges or after
    "Done" (no curve chosen).
- **Repeat:** "Repeat beats a–b every n until the end" copies that span's points of the chosen
  curve, both decks, along the window (start beat, length in beats; n = the length). The points
  already in each copy's span are replaced. Refused past 128 points, with the same message.
- **Undo** (Ctrl+Z, and a button): one step back per edit while the dialog is open, 50 steps.
- **[all] Replacing a drawing.** Picking a shape in a drawn lane's dropdown, or a preset other than
  Custom while a lane is drawn, first asks "Replace the drawing?" ("Replace the drawings?" when a
  preset would replace more than one). No leaves everything as it was. Yes saves the choice and puts
  the whole override from before it on the Undo list, so Undo brings the drawing back: Ctrl+Z, and
  on the PC an Undo button beside Reset to Auto while the drawing's tools are hidden. Custom keeps
  the drawings and doesn't ask; Reset to Auto is the explicit clear (§1) and doesn't ask either.
- Each edit is saved at once, as any other edit, so the next plan (and Preview) plays it.

**7. To plan.curves** (§9): a drawn lane replaces that lane's curves of the shape; the planner's
tempo stays, as for any preset.

Cases: `editor-cases.json`, group `draw` (`pointCurves` and `normalizeOverride` on drawings).

## 11. The progress row

One row in the overview, under the drawing well and above the legend, for the analysis and the loop
search. From the phone's overview (`automix/Automix.java:639-650`, `automix/Analyzer.java`); rules 3
and 4 are ours. Draft and BitChord's notes: `plan-progress-row.md`.

1. **[all]** One row, this song before the next, never both: "Analysing this song: <stage> · NN%" or
   "Analysing the next song: <stage> · NN%", over a bar filled to NN%. A song waiting in the queue
   reads "waiting its turn · 0%".
2. **[all, where the app has a separate loop-mix search]** With neither song analysing and the loop
   search still running: "Looking for a loop mix…", with an indeterminate bar.
3. **[all]** A failed analysis: "Analysis of this song / the next song failed: <reason>", in the row's
   place, no bar, until the song is analysed again. The reason is always shown. Outcomes that aren't
   failures get their own wording, never "failed": a song over the length limit ("is over 8 minutes:
   not analysed, a plain crossfade"), a party stopping the analysis, a decode too short, a song from
   a video.
4. **[all]** Hidden during a live mix (the overview shows the mix itself then). Hidden until first
   shown; after that the row keeps its room when it has nothing to say (invisible, not gone), so
   the chips below don't jump. No setting.
5. **[each app]** The stages and their % are each app's own, a fixed % at each stage's start:
   nothing is counted inside a stage.
   - Phone: waiting its turn 0, starting 0, downloading 0, decoding 2, finding the beats 22 (52
     after the opening's beats), finding the key 82, measuring the low end and keys 84, finding the
     vocals 85.
   - PC: waiting its turn 0, getting the audio 0, decoding 5, measuring the low end and keys 15,
     finding the beats, the key and the vocals 25, saving 95. The models run in one worker job that
     sends nothing until it ends, so the 25-95 stretch has no steps.
6. **[all]** This song's addon copy (the user, 2026-11-26; replaces "analysis only" of 2026-11-24).
   After this song's own analysis lines, and only when they have nothing to say, the row follows
   the addon copy of the song now playing, with an indeterminate bar:
   - an addon is opening the song's stream: "Asking your addons…";
   - the file is being fetched: "Getting the lossless copy…" (lossless: FLAC, ALAC, WAV, AIFF or a
     stated bit depth; any other copy is "the addon's copy");
   - the copy is lined up with the app's own: "Lining up the lossless copy with <the app's source>'s…";
   - the take-over, from the copy starting until it is what's heard: "Switching to the lossless
     copy…". While the song is paused the copy can't line up with a source that stands still (or,
     taken over before, the source has the sound again): "The lossless copy is ready: it takes over
     when the song plays", with no bar moving (the user, 2026-11-26: the busy bar ran on while paused).
   Nothing once the copy is heard, refused or failed (the badge says that). The next song's copy is
   never shown. Like the rest of the row, hidden during a live mix (rule 4).

PC: built 2026-11-24. `src/automix/automix.js` `progressOf(id)` → `{status, stage, pct}` or
`{status: 'error', why}`; the analysis frame (`host.js` `analyzeSong`) posts `{type: 'progress',
fileKey, stage}` at its stage starts; the overview's `progressRow` in `src/automix-overview.js`
(class `vivi-amx-ov-prog`, `src/plus/plus.css`). The snapshot names the songs (`curId`, `nextId`)
even with no plan. Rule 6 (built 2026-11-26): `addonStage(id)` in the overview reads
`window.__viviAddonsPage.statusOf(id)` (`state` 'opening', `play.state` starting/fetching/fitting/
playing) and `window.__viviCrossfade.addonTakeover(id)` ('switching' until the addon deck is audible,
then 'done'); the app's source is YouTube.

## 12. Effects, the mid band and noise

Asked for 2026-11-25: Spotify's mixes draw them (`spotify-mixes.md`), and a mix imported from
Spotify should sound as drawn there. Functions on the PC: `presetCurves`, `FX_SHAPES` in
`src/automix/automix.js`; `fxBus`, `presetShape` in `src/automix/crossfade.js`; the mid band of the
player's chain in `src/plus/fx-plus.js`.

1. **[all] The Effects lane** (`lanes.fx`; Spotify's white lane, drawn here in `#E8E8E8`): a shape
   name (rule 4) or a drawing (§10) with `echo`, `reverb` and `delay` per deck, each 0..1 (how much
   of that deck goes to the effect). A drawing may also carry `echoBeats` (1, 0.75 or 0.5; missing:
   0.75) and `delayBeats` (0.75 or 0.5; missing: 0.5).
   - Missing is none, and none is not stored: an override from before this lane reads as it did,
     and an app that doesn't read `fx` yet plays the mix without effects.
   - Of the presets, Afterglow, Surge and Dissolve have effects (§2); the others have none.

2. **[all] Two more drawn curves** (§10 rule 1's table): `mid` in an EQ drawing (plan `midDb`,
   −18..0 dB) and `noise` in an effect drawing (plan `noise`, 0..1). No shape of §3 uses them.

3. **[all] How they sound.** Both decks feed the same three effect returns, each deck's sound taken
   after its fader, EQ and filters (so a deck faded out sends nothing), times its send curve. The
   returns play into the mix next to the decks (on the PC: the EQ's entry), and ring on after the mix:
   a tail is never cut at the window's end.
   - **Echo:** a delay of `echoBeats` beats with feedback 0.45 through a 3 kHz low-pass, so each
     repeat is darker; level 1.
   - **Delay:** a delay of `delayBeats` beats, feedback 0.3, no filter; level 1.
   - **Reverb:** a convolution with a generated 2.4 s impulse (stereo white noise decaying by 60 dB
     over 2.4 s, normalized); level 0.7.
   - A beat is the plan's beat (§10 rule 4), 0.5 s without one. The echo and delay times are set at
     the window's start (`curves.fxTime`: `echoSec`, `delaySec`).
   - **Mid:** a peaking filter at 1 kHz, Q 0.7, on each deck between the bass and high shelves; 0 dB
     at rest.
   - **Noise:** white noise through a 1.5 kHz high-pass at `noise` × 0.25 (−12 dB at 1), played from
     the window's start to its end, not under the deck's fader.

4. **[all] Effects shapes** (sends on the outgoing deck; x a fraction of the window):

   | Shape | Send | Curve | Time |
   |---|---|---|---|
   | echo1CutEnd, echo34CutEnd, echoHalfCutEnd | echo | [0.75, 0] [1, 0.5] | 1, ¾, ½ beat |
   | echo1OutEnd, echo34OutEnd, echoHalfOutEnd | echo | [0.5, 0] [1, 0.5] | 1, ¾, ½ beat |
   | delay34CutEnd, delayHalfCutEnd | delay | [0.75, 0] [1, 0.5] | ¾, ½ beat |
   | reverbCutEnd | reverb | [0.75, 0] [1, 0.5] | |
   | reverbOutEnd | reverb | [0.5, 0] [1, 0.5] | |
   | reverbOutCenter | reverb | [0.25, 0] [0.5, 0.5] [0.75, 0] | |

   The names are Spotify's Effects list. Spotify's own shapes for them are not known (its exports
   only hold drawn curves); these are this app's, to compare by ear when Spotify's are found.

5. **[all] To plan.curves:** `midDb`, `noise`, `echoSend`, `reverbSend`, `delaySend` per deck, and
   `fxTime` when the Effects lane is not none (plan.schema.json). An absent curve is neutral (0 dB,
   no noise, no send).

6. **[each app] In the editor:** an "Effects" dropdown under Customize after Effect, with None, the
   shapes of rule 4 and Draw…. The chips of rule 2 and the Effects lane draw like the others (§10
   rule 6). The overview draws the sends and noise as 0 at a lane's bottom, 1 at its top, and the mid
   band as the other EQ curves. The PC has no control for `echoBeats` and `delayBeats` yet: a drawing
   keeps the time it came with.

## 13. The Looping lane

Asked for 2026-11-25: 25 of Spotify's mixes loop the playing song (`spotify-mixes.md` rule 6), and a
mix imported from Spotify should do the same. Functions on the PC: `LOOP_BEATS`, `presetCurves` in
`src/automix/automix.js`; `handOver`, `rampOutgoing`, `steadyOutgoing` in `src/automix/crossfade.js`.

1. **[all] The lane** (`lanes.looping`, drawn here in `#5FD39A`): `loop1`, `loop2`, `loop4`, `loop8`
   or `loop16`, a shape only (never drawn). Missing is none, and none is not stored, as for the
   Effects lane (§12 rule 1). A preset other than Custom has none; the loop mix (§2) ignores it.

2. **[all] What it does:** from the window's start (A's mix-out) A plays its first N beats again
   and again until it ends, under A's fader, EQ and filters as they move. A's beat is the plan's
   beat (§10 rule 4), 0.5 s without one.

3. **[all] To the plan:** `curves.loopBeats` (N), and `loopSec` (N × the beat, in A's seconds)
   on the plan (plan.schema.json).

4. **[PC] Playing it:** on A's copy at x1 the copy loops [mix-out, mix-out + loopSec] and still stops
   where A would have ended; on the stretch deck (a speed-up or a song's speed) the deck loops the
   same span at A's rate. A glide (§4) plays no loop: its rate steps every beat.

5. **[each app] In the editor:** a "Looping" dropdown under Customize after Effects, with None and
   Loop 1, 2, 4, 8 and 16 beats, and no Draw….
