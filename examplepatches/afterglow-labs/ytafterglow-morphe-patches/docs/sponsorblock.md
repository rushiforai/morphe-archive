# SponsorBlock

The separately selectable **SponsorBlock** patch ports the iOS client and all 21
preferences. It uses Afterglow's existing native video-state and timeline adapters;
it does not select Theme Studio, Glow, Seek bar, or the official SponsorBlock patch.

## Behavior

- Master, Shorts, and marker switches default on. Sponsor and interaction skipping
  default on; the other seven skip categories are opt-in. All nine marker categories
  default visible and are independent of automatic skipping.
- A read-only HTTPS client requests the first four SHA-256 characters of a video ID
  from the public [SponsorBlock API](https://wiki.sponsor.ajay.app/w/API_Docs), then
  filters the returned bucket to that exact video. It coalesces concurrent requests,
  caches up to 128 videos (including empty/404 results), bounds response size, and
  does not cache failures. No submission or voting API is called.
- The active native director supplies the video ID, time and seek operation. Ads and
  disabled Shorts are excluded. Each active-video transition advances the session
  generation, including rapid A -> B -> A changes. Late responses and old Undo
  actions cannot change the current video. Failed seeks leave the segment eligible.
- Each selected segment is skipped once per session. The four-second notice offers
  Undo to its start; playing again does not immediately skip the same segment.
- Native Ljsb timeline geometry positions the markers, including its Ljsq Shorts
  interface. Overlapping markers use alternating lanes. Bounds are clipped to video
  duration, colors match the iOS category constants, and contrasting outlines remain
  visible. Markers draw after track glow and before the native/custom scrubber.
  Animated track bounds and paint alpha follow the native controls' fade; markers
  do not require a visible thumb, so the thin Shorts timeline remains supported.
- The notice uses active semantic theme colors, with the iOS notice constants as
  fallbacks. Its normal host is the native player overlay; Shorts uses the activity
  content with space for navigation controls. It is nonmodal and follows player
  replacement and preference changes.

## Verified checkpoint — 2026-11-14

Evidence: `/mnt/c/Users/Corey/ytag-scratch/android/port-completion-20261113/`.

- 87 network/session/marker JVM checks, 151 settings checks, and 438 theme checks pass.
- Builds 19 and 20 pass strict application on YouTube 21.43.523: 25/25 standalone and
  26/26 with GmsCore. Build 19 also passes with only SponsorBlock and GmsCore selected.
  Build 20 additionally passes 27/27 with official GmsCore and Spoof video streams.
- Android 16 watch playback: public segment 3.35–13.363 seconds on `dgNZStXsYwo`
  skipped through the native player, displayed the notice and green marker, and Undo
  returned to 0:03. Continued playback reached 0:08 without re-skipping.
- Marker category off, marker master off, and overall master off remove the marker.
  Turning off sponsor skipping preserves the green marker and permits playback
  within the segment. Portrait and fullscreen retain the native scrubber above it.
- Two Shorts fixtures initially stalled at 0:00: native logs show HTTP 413 from the
  Onesie request, then a buffer-refresh identity error. Adding official **Spoof video
  streams** resolved playback without changing the Afterglow bundle.
- On `-Hhq30B7izg`, enabling Intro skipped 0–9.966 seconds, drew the blue native
  timeline marker and displayed the notice. Undo returned to 0:00 (captured at 0:01).
  Turning off **Enable for Shorts** allowed playback at 0:05 inside the segment, with
  no SponsorBlock request, marker or skip; the watch-page sponsor still skipped.
- Reset restored the iOS defaults, including Intro off and Shorts on. The final
  YTAfterglow runtime log has no errors and the crash buffer is empty.

For this emulator's playback, select official **GmsCore support** and **Spoof video
streams** alongside the desired Afterglow tweaks. The delivered `.mpp` is unchanged
by that choice. `verify_bundle.py --official-patch "Spoof video streams"` reproduces
the tested combination with `--gms-bundle`; `--patch SponsorBlock` restricts Afterglow
selection for an isolation check. Both options retain strict validation and saved
commands/results.

Physical-device, casting, live/DVR and exact iOS rasterization parity are not claimed.

## Marker fade correction — build 24

Gesture testing exposed markers remaining over the video after the native timeline
had faded out. The bridge now reads the animated `Ljsb.aa` rectangle and
`Ljsb.c.j` paint alpha, instead of the static track rectangle alone. Strict runs
pass 25/25, 26/26 and 27/27. The emulator confirms the fullscreen marker disappears
with the controls and returns when paused; the blue Intro marker remains visible
on the thin Shorts timeline with skipping disabled. Evidence:
`marker-fullscreen-{visible,faded,returned}-24.png` and
`marker-shorts-paused-24.png` in the directory above.
