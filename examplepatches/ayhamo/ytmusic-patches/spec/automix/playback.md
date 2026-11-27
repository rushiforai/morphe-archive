# Playback targets

What a listener must get from every mix, on every platform. These are targets, not methods: each
platform meets them by its own means. A platform's internal numbers (look-ahead, trims, servo
thresholds, take-over code) are its own business and stay out of this spec.

## Targets

| Where | Target |
|---|---|
| Hand-over and take-over (one player or deck hands the song to another) | The splice lands within 10 ms of the same song position: no audible skip or repeat |
| Any mix, end to end | 0 cuts: no run of audio under −20 dB of the median level around it (2 ms windows, ±0.3 s around each hand-over) |
| Two decks playing the same song together (a deck locked to the player) | Within ±7 ms, ±5 ms where the platform can reach it, after the first second of the lock |
| Fades | Each fade follows the plan's `curves` (plan.schema.json): the gain at any moment within 1 dB of the curve, and no step over 1 dB between 10 ms windows |
| Level | Both songs levelled against YouTube's loudness (analysis.schema.json `ytLoudnessDb`) |

A take-over that has no time to measure (it is due within about 1.5 s) may miss the 10 ms target. It
must still have 0 cuts, and the platform logs it.

## How each side checks them

- **Extension:** test hooks record the graph's output and YouTube's source around each take-over. The
  skip comes from cross-correlating the two, the cuts from the 2 ms level envelope. Runs happen in the
  test Firefox (TESTING.md). Results as of 2026-11-18:
  - blend: −1.3 to +7.6 ms skip, 0 cuts;
  - loop mixes on pairs 1 and 2: the in-app measurement leaves −5.7 to +8 ms; the outside check
    scatters ±11 ms on these songs, because they match poorly there (scores 0.7–0.88);
  - 0 cuts in every recording.
- **Phone:** its own logcat measurements on the real device (the emulator's audio timing doesn't
  count).

Each platform reports its numbers against this table; a miss is a bug on that platform.

## Muting the player at a take-over [phone]

Phone 478a373, measured on Vaina Loca → SI NO ES CONTIGO, 2026-11-25. At a take-over, where the deck
hands the song back to the player, YouTube's own track is heard about 10 ms after the deck's. If the
player is muted only when the deck starts its fade, both play at once for those 10 ms: the samples
add, and the output clips.

**The rule:** mute the player one measured output latency + 10 ms ahead of the deck's 25 ms fade-in.

**Measured on the phone,** 3 runs, before → after:
- full-scale samples at the take-over: 74 → 0;
- no dip: the level from 0 to 50 ms after the take-over within 0.2 dB;
- the sections' levels within 0.1 dB;
- the splice −1 to +2 ms, still within the 10 ms target.

**PC:** not needed. Checked 2026-11-25 on a recorded run of the pair (an 8-bar blend out at
145.66 s), recording the graph's output and YouTube's source together:
- YouTube's `<video>` plays into the PC's own audio graph (`equalizer.js`), so it shares the decks'
  output latency and can't be heard after them. In the recording YouTube's source ran 11 ms ahead
  of the output, not behind it.
- The output had no samples at full scale (peak −1.3 dBFS) and 0 cuts.
- With an add-on copy of the new song, the song passed from deck to deck and YouTube's track never
  came back.

## The queue during a mix [all]

Rules for any app with Automix, not sound targets. Phone: Vivimusic 4370de0. The PC hasn't been
checked against them yet.

1. **Going back aborts the mix.** Once the queue has named the incoming song, the outgoing song named
   again is the listener going back: the mix stops there. (Before the incoming song is named, the
   outgoing song showing up isn't "another song" and the mix carries on.) On the phone a carried-on
   mix's forced hand-over had seeked the outgoing song 23 s off, to the deck's place in the incoming
   one.
2. **A song left "done" is planned again.** A song whose mix began and then ended, or was cut short
   (rule 1), is planned again when it plays again:
   - from more than 5 s before its mix point (the take-over);
   - with the same length, within 0.5 s, so YT's queue still naming it just after the mix moved on
     isn't taken for that.

   Otherwise it stayed "done", and the overview showed "Planning the mix…" for good.
   **PC:** a mix the listener calls off (Previous, Next, going back to the song, a seek, a pause of
   theirs, a queue change) never marks the outgoing song as failed (`crossfade.js` `abortLive`). Only
   a hand-over that fails on its own (Next did nothing) skips the song's next tries.
3. **A pause between our Next and the new song isn't the listener's.** After the mix presses Next and
   before the player names the new song, the player can stop for reasons of its own: an ad slot a
   blocker empties (its flag shows for a moment), or the new song loading. The ad flag gets the same
   grace as after the change (2 s); only a settled pause (the player has its data, isn't seeking) stops
   the mix. A song that never starts is still caught (8 s). PC: `crossfade.js` `driveLive`, 2026-11-24,
   after a blend in the Firefox test was called off "paused" 1.0 s after our Next, 0.2 s before the title
   changed. A clean Next, sampled every 25 ms, never pauses the element: it stays playing at readyState
   4, and the title changes in about 0.9 s.
4. **A stopped audio clock calls the mix off.** A mix's end and its waits run on the audio clock
   (the scheduled end, a copy's `onended`), and a suspended context, or one whose output device is
   gone, never advances it: the mix would hold the player and every later skip for good. A watchdog on
   the wall clock calls the mix off when the audio clock stands still for 3 s while it runs, without
   marking the song (it isn't the song's fault). PC: `crossfade.js` `clockStalled` in `driveLive`
   ("the audio clock stopped"), audit 2026-11-24.
5. **The listener's pause during a mix stops it at once.** From the hand-over to the take-over, what
   is heard is the app's (a copy, the decks), while the player may be silent, loading the next song,
   or held paused, and its button may show a spinner. A press of the app's or the player's
   play/pause in any of those phases means "pause": the mix is called off at once (not marked, rule
   2), the decks fade out in about 0.1 s, and the player is left paused at the song and spot the mix
   had reached: the outgoing song's before the Next, the incoming song's after it. It is never
   started by that press (a hold before the incoming song's start isn't released into play first).
   Found 2026-11-25 by the user: a pause during a mix kept the player loading and the mix playing.
   On the PC the gaps were the time between our Next and the new song (rule 3 waits for a settled
   pause there, and a loading player never settles) and the press while the player was held.
   **PC:** `crossfade.js` `onPlayPauseDuringHold`: the player bar's and the mini player's
   play/pause button, Space and K, captured before YouTube sees them, whenever a mix is live. A
   pause from elsewhere (a media key) is still caught by the checks in `driveLive`.

## Playback speed [all]

Mornye 7d35c877.

1. **Plans are in song time.** Mix points, lengths and curves are positions in the songs, not wall
   time. At a playback speed other than x1 a platform that mixes converts them by the speed; one that
   can't mixes nothing (rule 2).
2. **[PC]** YouTube Music on the web has no speed control. The PC mixes only while the player plays
   at x1 (crossfade.js: `playbackRate === 1`); at any other speed YouTube plays the song through,
   unmixed.

## Sleep timer [all]

Mornye 8a6b7fb5.

1. **A sleep timer set to "end of song" drops a prepared mix.** The song plays to its own end and
   playback stops there: the next song is never faded in, and its deck is let go.
2. **[PC]** YouTube Music on the web has no sleep timer, so there is nothing to build.

## Blend when I skip [all]

Prism `SkipFadeRules.kt`. A skip (Next) that blends into the next song instead of cutting.

Prism's targets:
1. A setting, **off by default**.
2. The blend lasts **1.5 s**.
3. If the next song isn't ready to play within **4 s** of the skip, it is a plain skip.

**[PC]** Built its own way, before this section: "Blend when I skip" (`crossfadeManualSkip`) is **on
by default**; the blend lasts the user's crossfade length (1-12 s), the playing song fading out over
a copy of its tail. After Next the PC waits up to 1.5 s for that copy, else it is a plain Next. Next
(the button and Shift+N) only, and not within the song's last crossfade length + 2 s; Next or Prev
during a planned mix is handled by the mix (`skipDuringMix`). The PC keeps these; a platform building it new
takes Prism's targets.

**[phone]** Counted as built (the user, 2026-11-26): the phone uses Morphe's own Crossfade with its
"Crossfade on skip" (Morphe 2.4.0 `CrossfadePatch`/Settings): on by default once Morphe's Crossfade
is on, lasting Morphe's crossfade length (3 s by default). Next during a planned mix is handled by
the mix itself. No phone code of ours.
