# Where the phone differs from spec/ on purpose

spec/ is the shared rulebook (the YT Music Extension's public repo is the master). Playback timing is
per platform: each platform sets how long its own players need. The phone's values are listed here.

- **The lead before `earliest`** (editor.md §6, the planner's `earliest` and the drag's lower limit):
  the phone uses the playhead + 6.5 s, the PC 4.5 s. On the phone it is `Automix.EARLIEST_LEAD` =
  `Mix.HAND_LEAD` (4 s, the takeover before the mix) + 2.5 s, which is how long the engine needs to get
  the incoming player ready: held silent, then lined up on YT's clock by a seek and speed nudges.
  spec/automix/editor.md §6 lists each platform's lead (extension 610a643); editor-cases.json's
  `plans` give `earliest` = pos + 4.5 s as a fixture input, and EditorCasesTest passes it as given.
- **A pause between our Next and the new song** (playback.md, the queue during a mix, rule 3): the
  PC waits out the ad flag for 2 s and stops the mix only on a settled pause (readyState ≥ 3, not
  seeking). The phone has no readyState: its pause hook (Morphe's `onPauseVideo`) also fires for our
  own media Next, 10-50 ms before it. So each pause starts a check every 120 ms (`PAUSE_CHECK_MS`)
  that stops the mix at once when 3 s have passed since our Next (`NEXT_GRACE_MS`), when the
  listener tapped pause on YT's play button (`Features.ytTapPaused`), or when YT's media session
  reads paused on 2 checks in a row (`PAUSED_READS`, about 240 ms; buffering is no pause). The
  check runs until 1.5 s past the grace, for YT's lag after a tap. A real pause inside the grace
  stops the mix in a quarter of a second. `Automix.onPauseVideo`.
- **HLS and DASH rows** (protocol.md 8.1.5 says the phone plays them through its player's HLS and
  DASH support): YT's player, as our addon player reaches it, builds only progressive sources. So
  the phone reads the playlist or manifest itself, picks one audio stream, fetches its init and
  segments into one local file and plays, fits and mixes that file like any whole file
  (`StreamManifest`, `AddonPrep.streamFileAndFit`). Never through the audio cache (8.1.6.1).
  The refusals and limits are the PC's (stream-assemble.js, 3dce391): encrypted (`EXT-X-KEY` or
  `EXT-X-SESSION-KEY` other than NONE, SAMPLE-AES in the TS program map, `ContentProtection`),
  live, more than one init segment or `Period`, Dolby only, and a link or redirect off https or to
  this machine; 30 s per request, 4 segments at a time, 300 MB and 120 s for the whole stream.
  One difference: the PC always passes Dolby over (a browser can't decode it); the phone does so
  on stereo rows only. An Atmos row (the Dolby Atmos switch, protocol.md §3a) keeps Dolby audio.
  Downloads keep their own 1 GB / 15 min budget.
- **Dolby Atmos plays from our own decode** (protocol.md §3a): YT's player decoding the E-AC-3
  itself ran 41 to 59 ms ahead of the phone's Dolby decode (a different amount after each seek) and
  6 dB quieter, so a hand-over to the mix decks jumped. The phone decodes an Atmos row once into a
  temporary 16-bit stereo WAV with the gain in the samples, and the player, the fit and the decks
  all read it (`AtmosWav`).
- **Levels against an unnormalised YT** (offset-map.md, the level, marked [phone only] there): YT Music on Android plays at
  volume 1 with no loudness normalisation, so the phone ignores YouTube's `loudnessDb` and levels an
  addon by the RMS of its 12 s audition window against YouTube's copy (`AddonPrep.streamWindow`).
  Morphe's **Disable DRC audio** is turned on once on first launch (`Features.drcOffOnce`), so YT's
  stream is the non-DRC one the levels were measured against.
- **Decoded audio kept per song** (editor.md §6, a placed window): the phone keeps the first 150 s
  and the last 120 s of each song decoded (`Analyzer`'s head and tail). A song up to 4:30 is
  covered whole (the two parts are read as one), and a longer song's window must sit inside one of
  them. A placed mix-out or mix-in in the middle of a longer song, or a window ending less than
  2.5 s before the next song's end, plays Morphe's crossfade instead, and the planner says why
  (`Planner.undecoded`).
- **The take-over from YouTube's sound** (protocol.md, the addon deck, 2026-11-27: only where
  YouTube's output is matched on the file, the tap): the phone has no tap. YT's player and ours are
  both ExoPlayers in the same process on the same audio output, so the take-over goes by their
  position clocks, the case the rule leaves to time ("no tap at all"). Ours locks to within 10 ms
  of YT's (20 ms after 4 corrections) before its 200 ms crossfade, on the offset the fit measured on
  the audio (`AddonDirect`). Where the two pipelines differ, the time is wrong: YT decoding Dolby
  Atmos itself ran 41 to 59 ms ahead, which is why Atmos plays from `AtmosWav`.
