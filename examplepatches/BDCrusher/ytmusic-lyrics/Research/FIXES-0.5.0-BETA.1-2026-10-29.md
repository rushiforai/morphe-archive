# Lyrics, logger and dual-target fixes - 0.5.0-beta.1

Work stays in the existing YT-Music home and repository. Full Collection only, optional Shaders and Download playlist. No device, MuMu, signing, installation, uninstallation or actual playlist downloads. Raw phone logs in revision36 remain private and are excluded from public source/assets.

## Why these changes

The supplied 0.4.0-beta.1 capture showed new video IDs briefly paired with the previous recording's metadata, native Lyrics action enum rejection, repeated direct-provider 401 responses and ~41.7 ms renderer callbacks while tick CPU was typically under a millisecond. Large native component dumps and per-message stacks made the normal export unnecessarily expensive. These are distinct observations; they do not prove that every visible stutter has one cause.

## Implementation

- Guard recording identity before committing metadata or starting current-track lookups. Explicit media IDs/URLs confirm same-title alternate recordings. Unconfirmed old title/artist pairs wait instead of being cached under a new video. Duration/album refinements update matching direct queries without replacing the repository session, valid sources or retry budgets.
- Accept all four verified values of the native Lyrics button state enum (0..3), preserve unrelated native actions/commands, clear the unavailable presentation on success, retain second position while pending/available and last position only after confirmed empty discovery.
- Preserve Braccato as the single scrolling/highlighting engine. Android 35+ votes for high frame rate locally while the lyric view animates, honors an explicit app refresh rate, releases its vote while inactive and restores the previous request on teardown. No window-wide rate override. Skip hidden player/native Lyrics hierarchy scans while the owned Lyrics viewport is active.
- Use the existing Enable debug logging switch and normal Morphe log export. Remove the 60-second workflow, separate report action and report persistence. Include APK/code, Android, WebView, app refresh selection, Native/Fallback entry, line transitions, seeks/large clock corrections, recording/source outcomes and Shaders state. Bound/redact log entries/exports, suppress routine personal-event stack traces and throttle costly component-buffer construction before it runs. Error stacks remain controlled by the native setting.
- Count actual Android FrameMetrics.DEADLINE misses on API 31+, with separate callback cadence, CPU, layout/draw/wait and listener-drop fields. Stable24Hz callbacks no longer produce repeated false stall labels. Older APIs explicitly report no deadline rather than inferring misses from displayHz.
- Dedupe unchanged network-capability callbacks and artwork metadata writes. Retain metadata/availability notes only, no permanent animation-file library. Own-session Recents pause/stop now precedes effect cleanup; Home/Back behavior remains native.

## Compatibility

Exact original arm64-v8a targets: 9.42.52/94252240 and 9.43.51/94351240, minSDK26. Original hashes and native factory profiles are in SOURCE-PINS.json and verification.json. The 9.43 native miniplayer setter was inlined: the port resolves the event-gating field from its native touch callback and redirects all verified writes, preserving false resets and the user's swipe setting. No guessed obfuscated production names.

Jam queue sharing is limited to 9.42.52. The newer player uses a metadata palette source without the source-owned bitmap extractor needed by Jam. It is omitted from the9.43 compatible catalog and explicitly rejects forced selection with an actionable message. The user delegated this scope choice; a larger Jam port is deferred. Older untested APKs are not advertised by this personal collection.

Both button schemas have identical serialized definitions. Actual DEX inspection ties field14 to enum converters accepting0..3 in each APK (revision37/state-domain-94252-r2.txt and state-domain-94351-r2.txt). Native Lyrics factory bytecode hashes are version-scoped; shared protobuf schema checks remain exact.

## Verification boundaries

Final results and exact candidate hashes belong to verification.json. Fresh actual-source harnesses cover normal logging/frame deadlines/recording binding/frame votes, native geometry/settings/cover lifecycle, artwork records, native button wire editing, repository refinements, retry recovery and playback clocks. Android/network/media boundaries in these harnesses are simulated. Existing library/playlist/artwork-token checks are inherited only after source hashes match.

Browser fixtures cover all 16 source variants; exact pinned reference line keyframes/easing/stagger, follow/resume/seek, dock/status layout, cadence logging, equivalent-response DOM preservation, Kawarp 24/30/60 limits and graphics fallback. Desktop CPU-throttled traces are supplementary, not Samsung evidence. The current and0.4 fixtures both showed no reverse scroll steps/long tasks; the desktop comparison does not establish a phone speedup.

Fresh ordinary Java public-provider requests returned Better Lyrics rich timing for sN_tJ8d3c0I, Unison exact-recording rich timing for MYal8NoVQXs and synced LRCLib for gF2KuOJLEQE. The cover's direct Better Lyrics request returned401; Unison succeeded. This is access rejection, not absence, and broker credential renewal cannot fix authorization at another origin. Normal verification is retained; no credentials are borrowed or authentication bypassed. The earlier combined-service browser challenge timeout remains a limitation.

## Test on phone

Enable Morphe > Miscellaneous > Debugging > Enable debug logging (or the shared Debugging page if that optional native page is absent), reproduce without recording, then use the existing Export debug logs. Disable logging afterward to compare observer overhead. There is no capture timer. Useful fields include entry, viewVote, Renderer-cadence, Android-frames/missedDeadlines, line transition and Track-binding/source outcome. Native debug output may still contain song/UI details; inspect before sharing.

Recording-free phone smoothness, both Lyrics entry paths, Samsung navigation across screens/dialogs/keyboard/orientation, actual animated-cover streaming and graphics, Recents audio-stop delay and playlist/offline behavior still require device acceptance. The API 35 view rate request is advisory and can be limited by device/power policies. A same-title alternate recording without exact metadata identity may wait for confirmation. No universal zero-stutter claim.

Sources: [FrameMetrics.DEADLINE](https://developer.android.com/reference/android/view/FrameMetrics#DEADLINE), [adaptive refresh rate](https://developer.android.com/develop/ui/views/animations/adaptive-refresh-rate), [exact Patcher 2.1 source](https://github.com/MorpheApp/morphe-patcher/tree/bd7bca01f438687c34ad4a5d9d8e6e6f20f0a2d1). Better Lyrics3.0.1/Braccato and Shaders1.5.1/Kawarp pins remain in SOURCE-PINS.json.
