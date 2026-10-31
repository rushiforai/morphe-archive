# Full Collection, phone-feedback corrections and expanded diagnostics

This implements the user's October 28 follow-up to PHONE-FEEDBACK-2026-10-28.md. Their subsequent answers explicitly choose **Full Collection only** and identify closing as **swiping the app from Recents**. The earlier documentation-only restriction is superseded for this implementation. MuMu, device access, signing and installation remain untouched. All source, outputs, evidence and scratch stay inside YT-Music; shared Toolkit runs in place.

## Packaging and retained data

The delivered catalog has three categories: Full Collection, optional Shaders, and optional Playlist downloads. Lyrics-only Add-on is retired from the new delivered catalog. Its past releases and history remain intact. The Shaders patch definition moved from the former add-on source into the Full patch source. The historical `lyrics-addon` build module still prepares the isolated shared personal runtime payload; this internal filename does not expose an add-on edition or activate personal lyrics when they are deselected.

Use this collection by itself; do not combine it with official Morphe or old add-on sources. Existing Manager selections need review after updating, especially if every Full patch was previously deselected. Exact experimental input remains original YouTube Music 9.42.52 / 94252240 arm64-v8a, APK SHA-256 `9c38d63907362715f6172545bcb36f11ddbd45f014938626068016f06dcc3c56`. The inspected upstream/official baseline remains 1.48.0; Patcher 2.0.0 and inherited 1.15.1 fingerprint semantics are retained.

Permanent best-lyric storage, source priorities, offsets, connection data and rendering preferences remain. Animated-art files are no longer a retained library: the native muted cover player streams a validated progressive HTTPS URL. Only album lookup data and per-recording availability records are stored. Recognized old hashed animation cache files are removed when Shaders initializes; unrelated files and saved lyrics are not removed. Normal platform/network playback buffering can still occur. The previous 512 MiB media-limit control and native MP4 finalizer are retired. Stream completeness/looping on actual Android hardware still needs acceptance; the earlier file-remux reference test is not evidence for this new streaming path.

## UI, native panel and Shaders corrections

- Release navigation padding previously owned on native ancestors when the Lyrics body registers. This removes a concrete source of double bottom gaps. Extend the verified native body only after its geometry has settled, avoiding repeated resizing during native opening/drag transitions. Restore dimensions/clipping on release. The text viewport clips at safe navigation edges while the native/shader background continues underneath.
- Keep supplied native Lyrics definitions. A cached presentation is reused only for its recording; unrelated recordings use the APK's native fallback profile instead of inheriting stale per-recording presentation data. Native/Fallback entry is recorded for the controller actually opened. Both paths retain Braccato rendering inside the native shell.
- The resume-follow control is a child of the dock, so its position follows the dock's actual animated height. No separate timed position jump is needed. Dock settling updates padding without unnecessarily measuring all lines. Braccato remains the sole scrolling/highlighting engine; timing is not invented.
- Source status expands inline inside the dock with the same translucent surface. Remove the opaque above-controls card and confusing Details action. Reconnect appears only when verification needs interaction. The source chooser retains its compact glass flyout and sync-type icons. Full reports belong in settings.
- Do not show Kawarp's canvas until a real image is ready. Keep native artwork/background visible during missing images and failures. Use additional native metadata artwork keys and existing native thumbnail bitmaps for videos; do not sample the actual music video.
- Animated artwork uses one native silent decoder. Its own small 208 by 117 frames can feed visible backgrounds at a maximum of four updates per second, with 250 ms Kawarp transitions. The background's 24/30/60 FPS cap is independent. Pause/reduced-motion/visibility guards remain. Small readback stalls and codec failures are recorded during diagnostic capture. Conservative title/artist cleanup provides an additional artwork lookup for video metadata when an exact query has no match. Ordinary verification and 80% token renewal remain unchanged.
- Renderer-process failure restores native lyric content and allows bounded reconstruction rather than leaving hidden native content behind a dead renderer. No universal zero-stutter or all-GPU compatibility claim is made.

Shaders keeps its own native Morphe > Shaders page, with clear artwork/background/motion switches, appearance sliders, frame limit, lookup-record storage and separate clearing/reset actions. Source diagnostics are renamed Lyrics and Shaders report. Full settings initialization no longer makes a direct reference to a personal class when no personal feature is applied; selected features install their pages through shared infrastructure.

## Debugging capabilities and use

The additions attach to the existing **Morphe > Miscellaneous > Debugging** screen when present. If Enable debugging was not selected, the personal features provide a **Morphe > Debugging** page. **Morphe > Lyrics > Lyrics and Shaders report** also opens the report.

1. Choose **Capture the next 60 seconds**.
2. Return to Lyrics and reproduce the transition/open-close/background problem without screen recording.
3. Open or copy **Lyrics and Shaders report**. The same detailed events are included in Morphe's normal log export.

The report distinguishes renderer callback gaps and tick CPU duration from actual Android Window FrameMetrics. It records Native/Fallback entry, whether Lyrics is visible, latest started timed-line indices (not lyric text), source selection/outcomes, renderer dimensions, native panel geometry, shader readiness/codec/readback failures and lifecycle/dismissal events. It does not invent GPU timings from JavaScript. Frame totals, over-budget counts, maximum layout/draw/total durations and accumulated dropped-listener reports are separate fields. Old capture callbacks are rejected and listeners/threads are released when capture ends or the window closes.

Detailed capture is off by default; Morphe's existing Debugging switch can also enable it. A bounded 240-entry / 80,000-byte ring redacts URLs and credential-like data. A single atomic app-private last-session report preserves recent evidence across ordinary restarts; there is no unbounded diagnostic-file collection or automatic upload. Clear captured report affects diagnostics only. Ordinary process termination cannot be guaranteed to flush every final event.

## Recents dismissal

Inspect and hook the exact original BackgroundPlayerService.onTaskRemoved and MusicBrowserService task lifecycle. Capture the app-created platform media-session token through its native compatibility-token constructor; never export/serialize it. On dismissal of this app's MusicActivity task, stop personal cover effects/crossfade work and send pause/stop only to a media controller verified to belong to this package. Deduplicate the two service callbacks. Null, unrelated-package and other-task intents do not trigger this behavior. Home, Back and ordinary activity pause do not issue a music stop. Actual time from the Recents gesture to Android's callback/real audio stopping remains a phone acceptance check.

Read-only bytecode evidence is retained in Verification/revision34-native-service.txt and revision34-native-session.txt. No broad media-key broadcast, other-app session enumeration or process kill is used.

## Verification boundaries

Fresh build/JVM/lint and current browser fixtures accompany the final artifact. Native source harnesses exercise 54 navigation/cover checks, 24 debugger/FrameMetrics/dismissal checks and 14 metadata-only artwork checks at simulated Android/network boundaries. Existing 134 library/retry/playlist/token/repository checks are reused only after their exact recorded source hashes match. Final verification.json binds those 226 checks, the exact bundle/input/output hashes, provider fixtures, reference Braccato traces, UI animation, Kawarp pacing/readiness/fallback and compiled hooks/resources/reference audits.

The Full-only matrix contains catalog plus seven valid combinations and a missing-Downloads rejection. Four valid combinations enable personal lyrics; the other three retain the stock lyrics path. Old edition/source-order tests describe retired deliveries and are not presented as new add-on compatibility.

A raw fragmented-MP4 browser-loop experiment again failed its end-position expectation; that browser result is retained and is not a native Android streaming verdict. One private 40 MB regression fixture was retained under Inputs/revision34-artwork; it is excluded from source/release assets and is not an application cache. The final live artwork test checks normal verification and metadata only.

Initial failures are retained: a circular patch-initialization dependency was removed, and the catalog test caught Shaders living in the former add-on source before it was moved into Full. An early resume-geometry test was corrected to explicitly hold the affordance visible while measuring its motion. These are not delivery successes. Earlier candidates are not overwritten.

Remaining acceptance: real Samsung navigation/keyboard/dialog/orientation behavior, both native-panel presentations and drag/snap, recording-free phone line transitions, hardware-decoded streamed cover completeness/looping, real GPU/context/lifecycle failure behavior, stopping audio after a Recents swipe, and actual playlist/offline downloads. No devices/MuMu/sign/install/uninstall or real playlist downloads are used by automated checks. Regenerable unsigned APK/scratch outputs remain under Verification/scratch/revision34-*; cleanup was not authorized.

Primary contracts: [Window FrameMetrics callback](https://developer.android.com/reference/android/view/Window.OnFrameMetricsAvailableListener), [own-session transport controls](https://developer.android.com/reference/android/media/session/MediaController.TransportControls), [Android rendering diagnostics](https://developer.android.com/topic/performance/issues/render), and [pinned Shaders artwork lookup](https://github.com/better-lyrics/shaders/blob/88be3b81450b8d66bd8af445bf6062caac7d2747/contents/lib/animatedArtManager.ts).

The first Full-only feature audit falsely treated dormant coordinator references inside the retained Full runtime as active personal lyrics. It was corrected to require native metadata/playback entry hooks to match the selected lyrics assets; all references remain resolved and selected-feature hooks are still checked. The failed audit log is retained. The production bundle was not changed.
