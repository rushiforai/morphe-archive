# Playback and UI corrections - 0.3.0-beta.2

This revision responds to the phone screenshots 19589/19593/19594 and the animated cover for `WHmexVwElEE` (MAMMAMIA, Maneskin). It preserves the existing project, four categories, official 1.48.0 integration and exact original YouTube Music 9.42.52 / 94252240 arm64-v8a target. No device, MuMu, signing or installation operations are authorized or performed.

## Findings and changes

- The previous cover and backgrounds could create multiple HTML video decoders. Repeated image/metadata updates could also replace artwork state unnecessarily. The cover now has one native TextureView/MediaPlayer, with asynchronous preparation, silent looping and a decoded-first-frame gate. Same-file layout/settings updates retain playback position. Native still artwork remains underneath; codec failures fall back quietly. A contain transform shows the entire animation within native artwork bounds. Native video remains untouched.
- The exact ordinary-service MAMMAMIA MP4 is fragmented, 40,473,185 bytes, 2160 by 2160, with zero header duration and timestamps beginning at 10 seconds. Its 562 encoded samples span 22.48 seconds after origin normalization. A native MediaExtractor/MediaMuxer finalizer copies the encoded video samples without re-encoding, writes a complete index and normalizes timestamps. Cached files are repaired once through profile version 2; atomic commit preserves the original if finalization fails. Encrypted media is rejected. No credentials or remote video are distributed.
- Player and Lyrics backgrounds use actual Kawarp motion over a still image. They do not decode the MP4 again. Native artwork is preferred; a scaled first cover frame is extracted off the UI thread if it is absent. This deliberately uses the user's permitted first-frame fallback, rather than following every cover frame. Canvas resolution is capped at 960 pixels on its longest edge with no device-pixel-ratio multiplication. Offscreen, paused and reduced-motion effects stop.
- Morphe's root preference ListView could be transparent over the original YouTube Music settings. Its native onViewCreated lifecycle now binds one opaque native themed background. It does not add a second list or draw text over existing preferences.
- The native Lyrics body could end above the navigation area while the lyrics view separately added another navigation inset. The window was transparent but showed the player behind it. A shared window-owned LyricsViewport extends only the verified native body to the real window bottom, retaining header/snap/top geometry. It restores dimensions and ancestor clipping when released. The personal renderer receives the actual control-safe overlap once through CSS; Android padding is not added again.
- The collapsed opener touches the bottom safe edge. Expanded collapse stays above the source row and four action buttons. The status dot opens a compact card above the whole dock, with one summary and a Details action. No automatic error banner or repeated tooltip is introduced. Control translucency remains, but continuous backdrop blur is removed to reduce compositing work.
- Braccato remains the only text-motion engine. Host settings/icons are deduplicated and equivalent artwork/metadata updates retain renderer state. No new scrolling algorithm, fabricated word timing or guaranteed-zero-stutter claim is added.

## Evidence and limits

Canonical source, tests, all reports, media fixtures and outputs stay inside YT-Music. The immutable prior release is 0.3.0-beta.1. New output prefix: `Verification/revision33-`; final compatibility prefix: `Verification/scratch/revision33-final-`.

Fresh build, JVM tests and music lint succeeded. Native cover/window/viewport/settings boundaries have 53 actual-source checks; artwork file finalization has 15; artwork repository/cache has 18. Android APIs are simulated in those deterministic harnesses. Existing library/recovery/playlist/token/repository evidence is reusable only after each recorded source hash matches. Final staged verification.json records those checks separately.

Browser checks use exact current assets and the actual pinned Kawarp implementation. They cover all provider variants, Braccato reference transitions, dock bounds, compact popup, effect pacing, high DPI, pause/hide/reduced motion and graphics failure. Browser fixtures use an explicitly synthetic background; they are not Samsung screenshots.

The ordinary artwork challenge, mint and lookup succeeded for MAMMAMIA without persisting tokens. Raw-file browser loop attempts failed because the fragmented duration was still growing; these failed observations are retained. A supplementary reference container fixture with normalized timing played and looped with 80 decoded and zero dropped frames in one desktop run. That fixture is not execution of the production Android muxer or hardware decoder. `productionAndroidMuxerVerified` and `phoneVerified` remain false.

The 23-case APK matrix, 16 compiled feature/isolation audits and 12 native Lyrics audits passed against the same unchanged new bundle before staging/publication. Final compatibility reports bind APK, official bundle, personal bundle and outputs by SHA-256. No broadened target support is implied.

Recording-free phone acceptance remains required for animation completeness/looping, line-boundary smoothness, settings opacity/theme, native video transitions, native panel snap/drag, Samsung three-button/gesture transparency, keyboard/dialog/orientation behavior and actual playlist downloads. The previously observed combined lyrics-service challenge timeout is not reclassified as successful verification.

## Primary contracts

- [MediaPlayer lifecycle](https://developer.android.com/reference/android/media/MediaPlayer)
- [MediaMuxer](https://developer.android.com/reference/android/media/MediaMuxer)
- [TextureView](https://developer.android.com/reference/android/view/TextureView)
- [Manual edge-to-edge and navigation contrast](https://developer.android.com/develop/ui/views/layout/edge-to-edge-manually)
- Better Lyrics 3.0.1 / pinned Braccato and Shaders 1.5.1 / Kawarp pins remain in SOURCE-PINS.json; upstream licenses/notices remain in the source and release.
