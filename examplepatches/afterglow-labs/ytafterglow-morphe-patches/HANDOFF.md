# Handoff

> Updated: 2026-11-17, published build134 icon update
> Project: ytafterglow-morphe-patches (active checkout `/home/corey/projects/ytafterglow-morphe-patches`; original checkout `/home/corey/projects/xuninc/YTAfterglow-Android`, GitHub `afterglow-labs/ytafterglow-morphe-patches`, public as verified 2026-11-15)
> Session summary: Build134 adds the project owner's supplied Afterglow app icon as a default-selected patch. It contains 128 public patches and 105 defaults: 42 Afterglow/compatibility patches and 86 original Morphe features. Afterglow owns Downloads and Vault, Theme Studio and its other custom destinations; original Morphe Return YouTube Dislike, DeArrow, Copy text and post-image downloading remain integrated. Original settings are available through Afterglow settings → Additional features. The functional Android parity ledger is 195 done / 4 n/a / 0 todo. This is implementation coverage, not a claim that every physical device, account, server variant or optional combination has been tested. See the build134 checkpoint for publication status; older build sections below retain their historical evidence.

## Goal

Current user priority (2026-11-16): port Afterglow's own download mechanism,
six-action download sheet, durable queue and Vault presentation to Android.
The user explicitly prefers these over Morphe's download interface. Preserve
and complete Theme Studio and the remaining Afterglow destinations. Morphe
remains the implementation for shared features such as Return YouTube Dislike;
the downloader is the explicit exception to the earlier reuse instruction.
Published build133 includes that work and passes the checks described below.
Build134 adds the supplied Afterglow app icon. The public source feed points to
the verified build134 release bundle.

Deliver a usable Afterglow bundle for Android YouTube **21.43.523**. Reuse Morphe's
existing feature implementations and settings wherever Morphe already provides a
feature, including Return YouTube Dislike, DeArrow and text copying.
Do not delay those features for a bespoke Afterglow implementation or exact iOS
behavior. Focus custom development on features Morphe does not provide, while
preserving existing working Afterglow functionality. The iOS parity ledger remains
a record of custom-port coverage, not a gate on importing useful upstream features.
Deliver the result as the user's own standalone Morphe patch source, a `.mpp`
bundle. The build110 checkpoint below predates this broader integration.
- Each Afterglow feature group is a separately named tweak in Morphe's list (names from `tools/tweaks.json`).
- An Afterglow settings page lives inside YouTube's settings and shows only rows for tweaks that are installed and implemented.
- GmsCore and stream compatibility are included as named patches in this bundle, adapted from pinned Morphe sources. Use these selections with Afterglow; avoid duplicate compatibility patches from another source. The companion GmsCore app remains a separate installation.

## Current checkpoint: published build134 icon update

The user supplied the icon artwork on 2026-11-17. **Afterglow app icon** is
default-selected and updates the application plus all four launcher aliases,
preserving enabled states, package, app label and notifications. The PNG is
unchanged; adaptive foreground padding keeps the wordmark visible in the
system circle and rounded-square/squircle previews. See [app icon](docs/app-icon.md).

All 1,810 frozen production/provenance inputs are in `source-134.json` under
`~/.cache/ytafterglow-android/afterglow-vault-20261116/`. Strict patching and APK
assembly pass for default105, all128, icon-only1 and independent8 without the
icon. Compiled APK checks verify every launcher alias, the adaptive resource,
unchanged alias enablement, and omission of the artwork when unselected.
The loader verifies 128 exports, 105 defaults, 436 acyclic dependency objects,
six forwarded options and original resource hashes. Settings pass 540/540.
The upgraded emulator APK loads the actual adaptive drawable and launches;
playback advances from 7 to 19 seconds with an empty crash buffer. Its existing
Vault still contains five saved items. Physical Samsung testing remains pending.

[Build134 release record](docs/release-build134.md) tracks publication and
Manager consumer verification. Previous runtime evidence below still identifies
the tested builds; this update changes only the launcher icon and its registry.

Source commit `b3841fb0dad062c2b96f4c42f94672cd81f27d9a` is published as
`v0.1.0-build.134`; the feed, anonymous bundle, checksum and manifest are verified.
Manager 2.6 refreshes the existing public source to 128 patches, applies all
105 defaults, rebuilds and signs. The saved APK passes ZIP, Android v2 signature,
launcher-resource and 51 watch-action DEX checks. Its signing certificate matches
the Manager build133 APK previously delivered to Samsung. No temporary source
was added; original Morphe remains disabled. The temporary icon probe is removed.

The ready APK is `Afterglow-build134-YouTube-21.43.523.apk` in
`C:\Users\Corey\ytag-scratch\android\deliveries`. The Samsung is disconnected
from adb and offline in Tailscale at this checkpoint, so build134 has not been
transferred or installed on it. The last verified phone transfer remains build133.

## Historical checkpoint: published build133

All 1,806 production/provenance inputs are recorded in `source-133.json` under
`~/.cache/ytafterglow-android/afterglow-vault-20261116/`. Strict Desktop1.20 /
patcher2.1 application and APK assembly pass for default104, independent8,
all127 and the three-patch Long-press tools/GmsCore/stream-spoofing selection.
The actual bundle has 434 acyclic dependency objects and six forwarded original
Option instances. Settings ownership, visibility, defaults and reset checks pass
540/540. Original resources, source provenance, notices and licenses are retained.

Build133 changes only `PremiumControls.java` and `PremiumControlsSheet.java`
from build132; 1,804 inputs are unchanged. The Premium sheet now disables Lite
Mode when that optional patch is absent, and its action preserves either saved
ON or OFF preference in that case. All 74 actual Premium-session checks,
51 actual watch DEX checks and a fresh 540-setting run pass. Runtime evidence
below retains its tested build number. The exact build133 APK passes playback,
dislike display, installed Lite ON/OFF and the resolved six-action download sheet.
Its installed hash matches the signed candidate and the crash buffer is empty.

Afterglow's six-action download sheet, durable queue and Vault are implemented.
Runtime checks cover adaptive video/audio assembly, captions/thumbnails, a large
paused download resumed across restart and APK upgrade, background completion,
full exported-media decoding, and library import/filter/favorite/collection/file
operations. Native tabs, Lite Mode, Control Center, Premium controls, AB Lab and
the AI Home prompt library also have the individual emulator results recorded in
[port validation](docs/afterglow-port-validation.md). Theme Studio remains the
theme owner; buffered/live scrubber colors and VOD restoration are verified.

Build129 verifies avatar hold, Save, cross-app PNG Copy and preserved native taps.
Build131 verifies full-title/raw-description copying, OFF/ON and native Close,
plus original Morphe carousel-image JPEG downloads. Build132 verifies the
Description icon density, exact comment/post text, rendered-row Save and Copy,
cross-app image grants, selected-image copying after a carousel swipe and the
preserved native image viewer. Hardware capture includes the mounted photo beyond
the visible viewport; an unmounted footer remains blank. It does not reconstruct
content that the native renderer has not mounted.

Physical devices, account login, casting and every optional runtime combination
remain unverified. Native AI feed execution and the paused Shorts subscription
carousel need eligible server/account fixtures. Description copying passes on
the unchanged APK with host GLES; the emulator's software renderer terminated
the Windows qemu process on the same interaction without an Android app fatal
exception or ANR. The host failure's root cause is unproven. Image clipboard QA
temporarily disables emulator-to-Windows clipboard synchronization, whose empty
host-text replacement was independently identified; no app workaround was added.

Final smoke and settings cleanup are complete. The temporary clipboard probe is
removed, and the original emulator renderer and host clipboard sharing are
restored. The scoped acceptance record passes for build133. Source commit
`7ca14e1894419665b6078fd0af7225c979f9a216` is pushed to main and tagged
`v0.1.0-build.133`. The release includes the unique `.mpp`, checksum and
provenance manifest. The public feed and anonymous bundle download are verified. The
[build133 release record](docs/release-build133.md) tracks delivery status. See
[parity audit](docs/morphe-parity-audit.md), [downloads](docs/afterglow-downloads.md),
[long-press tools](docs/long-press-tools.md), [profile/post images](docs/avatar-photos.md)
and [Description copying](docs/description-header.md) for precise scope and limits.

Manager 2.6 refreshes the existing public source to 127 patches and successfully
applies all 104 defaults to the verified stock APK. The saved APK passes ZIP
integrity and Android v2 signature verification. The original Morphe source
remains disabled; no temporary local source is used.

## Historical integrated Morphe feature release: build118

The bundle contains 122 public patches and 99 defaults, adding 87 original Morphe
features from the pinned 2.0.0 source. Return YouTube Dislike, DeArrow, Downloads,
Copy text and other existing upstream features are included now. Their controls
are available under Afterglow settings → Additional features. Custom development
should focus on gaps not supplied by Morphe.

Strict patching and APK assembly pass for default99, independent8 and all122
selections. The loader verifies the shared dependency graph and original options;
settings checks pass 518/518. Source/runtime provenance and licenses are checked.
The original text-copy implementation replaces the excluded Afterglow experiment.
Build118 is published: the public feed/download checksum is verified, and Manager
2.6 updates the existing source to 122 patches, applies all 99 defaults, rebuilds
and signs successfully. The final default APK passes emulator playback, dislike
counts, exact title copying and DeArrow replacement/restoration with an empty
crash buffer. Its installed hash matches the signed candidate; settings are
restored and YouTube is stopped. Physical devices and account login remain
unverified; the download entry reaches sign-in on this emulator.
Existing Afterglow owners and preferences are retained, and overlapping additions
are optional. See [release-build118.md](docs/release-build118.md) for delivery,
Manager/runtime validation and limits, and [morphe-catalog.md](docs/morphe-catalog.md)
for the complete mapping. The build110 checkpoint below is historical.

## Historical integrated compatibility release: build110

The new bundle contains 35 named patches, including GmsCore support and Spoof
video streams. Full35 and independent6 strict application and APK assembly pass
using only this bundle. The existing package identity is retained for upgrades.
All 324 frozen production/provenance inputs match the packaged source, and all
15 pinned upstream resources and bundled notices pass hash checks. Settings
ownership, defaults and reset checks pass 518/518.

Android 16 emulator checks prove decoded watch playback, native Pause timestamp
copying, Android share-sheet OFF/ON/OFF and repeated dismissal/reopening, and
made-for-kids mini-player OFF/ON behavior with Background playback OFF. Manual
mini-player pause and resume remain intact. Playlist restart and playback work;
the OFF baseline already rendered the original resource layout, so no floating-to-full
visual transition is claimed. Image rendering works with the album-host switch
ON; a region-blocked network fixture has not been tested.

The build109 text-copy experiment did not reach its intended title-copy action.
Native description text selection remained available. Build110 excludes the
experimental text-hook dependency and hides Copy video details, even when that
preference was previously enabled or imported. The source experiment is retained
for future work; no title/description-copy completion is claimed.

User-facing names and descriptions use Afterglow. Open-source notices and the
GPL are bundled in both the MPP and APK, with About → Credits entries. The full
iOS port remains incomplete at 131 done / 4 n/a / 64 todo. See
[release-build110.md](docs/release-build110.md) for the final delivery and testing
limits, and [morphe-compatibility.md](docs/morphe-compatibility.md) for pinned
sources and runtime assets. Historical checkpoints below retain their original
build-specific counts and validation scope.

## Verified watch recommendations checkpoint

Build105 completes the default-OFF Hide up-next panel switch under Player >
Playback, owned by the independent Watch page tweak. It uses YouTube's own
information/comments boundary and filters a copy of the main watch-list model.
The original response, metadata, comments, playlist and playback owners remain
intact. Live OFF restores the original list and its continuations. Unknown
information boundaries retain native content.

459 settings checks and strict standalone/GmsCore/streaming/Watch-page-only/
independent selections pass 29/30/31/1/3. All 269 production inputs, signed DEX,
installed APK hashes and bundle integrity match. 36 full and
34 independent observations are visually reviewed (5 limited).
Live hide/restore, cold persistence, native description/comments/Share panels,
fullscreen, repeated scrolling and page/full resets pass. The full build also
preserves children's-video information/actions, Home, playlist entries/minibar
and decoded Shorts playback. The independent install verifies behavior with
native ads present and organic recommendations below them. Defaults and the
exact full APK are restored, hash-verified and stopped.

Two ON description attempts terminated the Windows qemu emulator process with
access violation 0xc0000005. OFF opened, and the identical APK subsequently passed
ON description/comments/Share after restarting with the swangle option. Startup
still reported SwiftShader; the exact host crash cause is unestablished. These
failed runs, Windows events and the successful continuations are retained. The
available app logs have no target-app crash, ANR or Afterglow exception.

QA corrections cover a timed Pause tap, an absent Description accessibility
label, controls covered by the native playlist panel, an ad occupying the first
recommendation viewport, a native pause-ad panel covering information, and
incomplete swipe arguments. Collapsing the pause-ad panel restores the intact
information/comments section with recommendations still hidden. The original scrolled
frame mislabeled as restored information is retained with limited scope; a fresh
OFF baseline verifies the actual information section after a return gesture
entered native fullscreen. Three independent screenshots were black despite
populated UI hierarchies; they remain limited evidence. The affected comments
dismissal, portrait return and scroll transitions pass separate visual follow-ups.
The exact cause of the black captures is unestablished. The DEX reader now
escapes modified UTF-8 bytes. No application source changed during validation.

Physical devices and the separate elevated metapanel architecture remain runtime
untested. Lite/import rules have unit/source proof. Native continuation
cancellation has source proof and hidden-list scroll checks; no forced in-flight
network race is claimed. Evidence: execution-105.json, next-audit-105.json,
next-development-105.json and delivery-105.json under port-completion-20261113.
See docs/watch-next.md. Full port remains incomplete: 131 done / 4 n/a / 64 todo.

## Verified native rewind and fast-forward checkpoint

Build104 completes the default-OFF advanced Fast forward and Rewind buttons
switch under the independent Player overlay tweak. Standalone videos use the
native seek pair; explicit playlists and live playback retain native controls.
The original handlers, configured interval, icons and accessibility labels survive.
Hide Previous and Next buttons also hides the replacement pair. Live changes and
resets refresh attached native owners without changing their source model.

60 transport-policy and 447 settings checks pass. Strict standalone, GmsCore,
streaming and independent selections pass 29/30/31/1/3. All 267 production input
hashes, signed native DEX and bundle integrity match. 41 full and 24
independent observations are visually reviewed (4 limited). Native 10-second
forward/back seeks, fullscreen, hide/show, live OFF, cold persistence, ownership,
page/full reset and Shorts motion pass. Full-app eye-mode composition, live-player
exclusion and playlist Next/Previous round trips with decoded playback pass.
Defaults and the exact full APK are restored, hash-verified and stopped. Retained
log periods have no target-app crash, ANR or Afterglow exception.

Initial playlist tests selected the correct adjacent entry, then paused while
playback was loading and remained at 0:00 without a Play/Pause control. A warm OFF
comparison left that loading state unchanged. A cold OFF baseline played the next
entry. The ON continuation waits for playback readiness before pausing and verifies
both directions, original controls and advancing decoded frames. No production
change was needed; the exact cause of the original stalls is unestablished.
Original failures and the interrupted wait are retained. The initial baseline
also retained a test-only duration-label punctuation mismatch; its corrected
continuation passes. A settings-test API typo was corrected before packaging.

Physical devices, casting and alternate player architecture runtime are untested.
Other seek intervals retain the original native handler but are not runtime
tested. Queue-without-playlist, ad, clip and composite-player exclusions have
policy/source proof only. The live fixture proves control exclusion, not scene
motion. One independent capture has a native ad panel covering the playlist heading;
its control check has limited scope. Full-app playlist metadata and navigation
are separately verified. Evidence: execution-104.json, paddles-audit-104.json and delivery-104.json
under port-completion-20261113. See docs/player-paddles.md. The full port remains
incomplete at 130 done / 4 n/a / 65 todo.

## Verified eye modes checkpoint

Build103 completes the default-ON advanced Clean overlay button under the
independent Overlay buttons tweak. One process-wide mode cycles through native
controls, pinned Afterglow controls, timed controls and the eye alone on standard
watch and Shorts. Timed controls hide after three seconds and a fresh native show
reveals them again. Native requested visibility remains intact for Pause on overlay.

55 session-policy and 445 settings checks pass. Strict standalone, GmsCore,
streaming and independent selections pass 29/30/31/1/3; all 264 production input
hashes and bundle integrity match. 46 full and 34 independent observations are
visually reviewed (3 limited). Watch/Shorts cycle, timeout, reveal, restoration,
surface continuity, fullscreen lock and timed rotation pass. Native mixer gain
changes from 0dB to -inf and back while pinned and locked. Live and cold OFF,
independent ownership, page/full reset, Shorts player-layer composition and
Pause on overlay pass. The page reset preserves session mode; a fresh process
starts at default. Defaults and the exact full APK are restored and stopped.
Final app, extension, crash and ANR logs are clean.

Development101 failed strict matching before installation because its fingerprint
checks had the wrong instruction order. Development102 passed initial runtime
scenarios but failed Pause on overlay in a fresh pinned player. Packaged DEX
proved its visibility mask skipped native lazy controls initialization. Showing
normal controls once made pause/resume work, confirming the missing controller.
Build103 preserves initialization before masking visibility; the fresh-process
pause regression now passes. Native requested visibility remains unmodified.
Development102's navigation, stale media-session and scroll-test corrections
remain documented with their original failures. Native clock and decoded-frame
checks verify warm playback after Shorts without trusting that stale status.
Build103 also retains an initial ADB-server connection failure before app launch;
the recovered baseline passed without a production change.

Independent testing retained three observations with black video captures between
decoded frames. The emulator later disappeared during a cold-launch preroll.
Its configured swiftshader_indirect mode was unsupported by emulator37.2.12 and
fell back to the host GPU, whose log contains graphics memory-import errors.
The exact cause of the process exit and individual black frames is unestablished.
The same AVD and hash-verified APK resumed with supported SwiftShader; cold OFF,
remaining reset checks and a separate five-state Shorts motion follow-up pass.
Both log periods and the interrupted phase are retained in the release audit.

Physical devices, casting and alternate player architecture runtime are untested.
The emulator has audio output disabled; mixer gain is checked, audible output is
not. Reset Player Overlay belongs to the unported Control Center: its internal
reset entry point exists, but the action remains pending and hidden. Evidence:
execution-103.json, eye-modes-audit-103.json and delivery-103.json under
port-completion-20261113. See docs/overlay-eye-modes.md. Continue the remaining
native mappings and full port, now 129 done / 4 n/a / 66 todo.

## Verified native mute and lock checkpoint

Build100 adds the independently named Overlay buttons tweak. Default-ON Mute and
Lock switches retain the advanced Player > Overlay rows and translations. The
utility row includes Afterglow Settings and follows the native player bounds.
Mute uses the native watch facade; Lock requests native fullscreen and publishes
the native lock state. Both custom and native unlock work, including portrait
return. The row stays usable above the native lock input layer.

21 request-policy, 441 settings and 17 threading checks pass. Strict standalone,
GmsCore, streaming and independent selections pass 29/30/31/1/3. All 260 production
inputs and bundle integrity match. 31 full and 21 independent observations are
visually reviewed (1 limited). The same native audio track changes from 0dB to
-inf and back, including while locked. Cold visibility, live OFF, independent
settings ownership, page/full reset, minimized-player exclusion and Shorts motion
pass. Defaults and the exact full APK are restored, hash-verified and stopped.
Final app/extension/crash and ANR logs are clean.

Build97 exposed lazy root binding and input interception; build99 corrected both.
Build99 then exposed a real existing WatchActions deadlock. Its retained ANR trace
proves a component-store/owner monitor inversion. Build100 defers observations
until the callback returns and captures scoped context inside native subscription
and transfer. The deterministic old-code regression fails; the corrected version
passes. Warm unavailable-to-playable navigation and live Share/Save refresh pass.
The third warm intent retained the existing video; that capture proves response
and motion only. A test-script variable collision and strict UTF8 log decoding
failure are retained with their successful corrections; raw logs are preserved.
The independent baseline initially buffered into a preroll. Its original failure
is retained; the continuation skips the native ad and verifies actual content.

Physical devices, casting and alternate player architecture runtime are untested.
The emulator has audio output disabled; mixer gain is verified, audible hardware
output is not. Evidence: execution-100.json, overlay-buttons-audit-100.json and
delivery-100.json under port-completion-20261113. See docs/overlay-buttons.md.
Continue the eye/declutter modes and remaining native mappings. The full port
remains incomplete at 128 done / 4 n/a / 67 todo.

## Verified pause-on-overlay checkpoint

Build96 completes the default-OFF advanced Pause on overlay switch under the
independent Player overlay tweak. It observes the standard controls' final native
visibility and calls that owner's explicit pause/play commands. Native readiness,
foreground ownership and per-owner duplicate/reentrancy guards preserve normal
manual controls and avoid acting on ended or unavailable players.

29 transition-policy and 433 settings checks pass. Strict standalone, GmsCore,
streaming and independent selections pass 28/29/30/1/3. All 256 production input
hashes and bundle integrity match. 35 full and 23 independent observations are
reviewed, including 9 explicitly limited observations. Corrected captures verify
show/pause, hide/resume, native manual Play/Pause, fullscreen and portrait return,
cold persistence, background pause preservation, Shorts motion, live OFF and
actual page/full reset. Final logs are clean, defaults are restored and the exact
full APK is restored, hash-verified and stopped.

Original evidence retains a loading frame, transient control-capture assumptions,
a Shorts accessibility-label mismatch, a premature media-key state check,
independent preroll/autoplay assumptions, an overly restrictive Reset-row
visibility margin and interrupted runner attempts. Their bounded continuations
pass; no production change was needed for those test corrections. The independent
post-reset capture verifies playing content before its extra frames enter a
native midroll; those extra frames have explicitly limited scope. The runner
interruption cause is unknown.

Physical devices, casting and live/DVR playback remain untested. Evidence:
execution-96.json, pause-overlay-audit-96.json and delivery-96.json under
port-completion-20261113. See docs/pause-on-overlay.md. Continue the remaining
native player controls and full Android port.

## Verified preferences-transfer checkpoint

Build95 completes About's preference import/export through Android's document
picker. XML and binary plists carry archived UIKit colors, saved themes, semantic
records, ordered tabs, data, dates and precise numbers. Original values survive
export while their Android representation is unchanged; native edits take
precedence. Invalid files leave the entire current setup intact. Full reset
removes native values and private preservation/encoding records.

103 transfer checks use the actual codec and Android SDK XML serializer; Python's
independent plistlib compares the exports. Settings and theme checks pass at 427
and 438. Strict standalone/GmsCore/streaming/independent selections pass
28/29/30/1/3; all 253 production hashes and bundle integrity match. 15 final full
and 9 independent observations are reviewed. Binary import/export, exact cold
persistence, corrected tab normalization, saved-theme restoration and actual
reset pass. The full final APK is restored, hash-verified and stopped; app,
extension and crash logs are clean.

Development93 has 15 reviewed observations covering XML, live colors and saved
themes, Android rename, atomic rejection and reset. Its missed offscreen picker
file was resolved by bounded scrolling. Development94 has 12 reviewed observations;
two cold observations explicitly retain a real defect: Android's indented XML
serializer appended four spaces after a final newline. The SDK source reproduces
it. Final95 encodes only affected strings with private markers; reads/exports
decode them and edits/removal/reset clear markers. A separate regression prevents
invalid tab entries from returning through retained originals. Both regressions
fail against their original sources and pass with the corrections. Interrupted
patch wrappers and fresh successful retries remain in the evidence.

Physical Android and iOS device interoperability remain untested. Preserving an
unported preference does not implement its feature. Evidence and committed bundle
provenance: execution-95.json, preferences-audit-95.json and delivery-95.json under
port-completion-20261113. See docs/preferences-transfer.md. The full port remains
active; continue the remaining native player-overlay controls and feature mappings.

## Verified About actions and diagnostics checkpoint

Build92 completes the base debug log store, read-only file sharing and app-local
HUD. It keeps a 200-entry ring, rotates its private file at one MiB, redacts
messages before queuing, and records real native player and preference events.
The HUD supports exact dragging, screen-edge/rotation clamping, double-tap clear
and a stationary 600-ms hold to hide. Master OFF also turns Firehose and HUD OFF;
HUD ON enables logging. File sharing grants only the chosen snapshot for reading.

91 log storage/policy checks, 427 settings checks and strict 28/29/30/1/3 patch
selections pass. All 251 production inputs and bundle integrity match. Twenty-six
full-install and fifteen independent-install observations are visually reviewed.
They verify actual decoded playback/pause/resume, exact dragging and rotation,
read-only share receipts, independent cold persistence, clear and actual reset.
Defaults are restored; the final full APK is hash-verified and stopped. Final
full and independent logs have no app/extension errors or crashes.

Build91 has 34 reviewed development observations, including four limited or
incorrect-test observations kept with their scopes. Its valid continuations
verify category filtering, Firehose override, cold playback and persistent file
sharing. A real half-distance drag defect was corrected in build92. The build90
Intent.setClipData chaining compile error, failed QA navigation/taps, a receiver
read race and one explicit WSL adb launch failure are preserved. Final wrapper
interruptions also remain recorded; bounded continuation verified the already
performed reset and resumed the independent run without repeating actions.

The exact delivered player-layer89 APK also verifies Advanced visibility, cache
reduction from 155.4 MB to zero while retaining settings, reset cancellation and
confirmed reset into a new process. Fourteen valid observations are reviewed;
one incorrect native-screen navigation observation remains excluded.

Network Firehose and events for unported download, Premium controls and offline
features remain pending. PiP routing is connected but activation is unverified.
Physical devices remain untested. Evidence and delivery provenance are in
execution-92.json, diagnostics-audit-92.json and delivery-92.json under
port-completion-20261113. See docs/diagnostics.md. The full Android port remains
active; continue preferences transfer, including archived iOS colors and nested
saved-theme/semantic records, then the remaining native feature mappings.

## Verified native Shorts player-layer checkpoint

Build89 adds the default-OFF advanced Hide built-in player layer setting to the
independent Shorts layout and buttons tweak. Lmpo.Y() retains its native S/o
visibility state and masks only the final reel_player_overlay_container request.
Weak controller bindings re-run native visibility on live preference/reset
changes. Decoded video, parent input dispatch and native layout remain intact.
The separate header, navigation and thin progress indicator remain available;
native Clear Screen still controls its own header and exit button.

427 settings checks and strict 28/29/30/1/3 selections pass. All 245 production
input hashes and ZIP integrity match. Sixteen full and ten independent-install
observations are visually reviewed: live hide/restore, native pause/resume, cold
ON, decoded motion and actual page reset. The full installation also verifies
Shorts-only escape and native pinch with the layer hidden. The independent
installation exposes only its owning Shorts layout settings.

An initial test expected fullscreen tabs to remain hidden after a settings
round-trip. An unchanged-setting control showed the same fullscreen exit with
the player-layer setting OFF, so that expectation was corrected without a
production change. The independent Reset attempt stopped before tapping because
the control was below the viewport; a bounded scroll-and-reset continuation
completed it. Original failed evidence and interrupted wrappers are retained.
The mode and standalone paused observations and standalone cleanup were saved
before their wrappers ended during finalization; bounded continuation captured
the same log buffers and verified that the app was stopped. Final logs have no app/extension
errors or crashes. Defaults and Advanced OFF are restored, the full final APK is
hash-verified and stopped. Physical devices and alternate layouts remain untested.

Source and delivery provenance: execution-89.json, shorts-player-layer-audit-89.json
and delivery-89.json under port-completion-20261113. The full port remains active.
Continue About actions/preferences and diagnostic logging. The paused Shorts
subscriptions carousel still needs a proven Android equivalent; it is not the
ordinary Subscribe button. Read-only mapping is in next-shorts-layout-design.md.

## Verified Shorts-only checkpoint

Build 87 completes independent tab hiding, native cold routing and live entry
through Lrun.z("FEshorts", true). Tabs remain available until that command is
ready. Two stable pointers held for 500ms turn the mode OFF, show its localized
toast and restore navigation after one second. Escape clears pinch ownership,
preserves its preference, and retains native touch handling. Native Back closes
panels first, then keeps the Shorts root. Live OFF and actual page reset restore
navigation; rejected short/moving/single-pointer holds leave the mode enabled.

Strict standalone/GmsCore/streaming/independent selections pass 28/29/30/1/3;
427 settings checks pass. All 243 production hashes match the tested bundle.
Thirty-eight full and thirteen independent-install observations are visually
reviewed. Known fixed clips play advancing frames. Confirmed feed changes
SkyeRanks -> yano11onay -> NiloChip retain hidden tabs; a further confirmed
SkyeRanks -> GlobalHoopss change retains pinch Clear Screen and hidden tabs.
The independent installation exposes only the Shorts owner and verifies live/
cold routing, Back, exit, preference state, Home and actual reset.

Short injected swipes initially retained a clip. Diagnostic88 showed complete
native event delivery, no blocked-list flag, no layout interruption and no Back
call during swipes; a sustained ON swipe advanced. The earlier attribution to
blocked navigation is withdrawn. No production correction was made. All traces
were removed and every source hash again matches build87. Failed assertions,
interrupted wrappers and successful bounded continuations remain in the evidence.
Some recommended clips buffered; their observations cover routing/layout only.
Timed screenshots include capture overhead. The earlier full run contains two
crashes in the emulator goldfish VP9 decoder service (UID 1013), with no target-app
crash; their relationship to the feature change is not established. Subsequent
feed, pinch and independent runs have empty crash buffers. Physical devices
remain untested.

The full final APK is restored and hash-verified, defaults and Advanced are OFF,
and the app is stopped. Exact results and committed delivery provenance are in
execution-87.json, shorts-only-audit-87.json and delivery-87.json under
port-completion-20261113. Diagnostic build88 must not be delivered.

The full port remains active. Next: the independent Shorts layout setting that
hides the native player overlay, preserving decoded video, native visibility
requests, pinch and the Shorts-only escape. Its mapped boundary is Lmpo.Y().

## Verified Shorts fullscreen checkpoint

Shorts progress build 80 is committed and pushed as
9296769ddcb743d006cc8604430156a982895265. Its verified 239-input bundle is
recorded in delivery-80.json. All ten full and six isolated observations pass;
the first recommended tab item buffered, and the two affected checks passed on
a playing feed item after visual review caught it. Raw evidence is retained.

The unmodified build80 pinch baseline already enters/exits native Clear Screen;
its bottom tabs remain visible. Candidates81/82 located two separate retained
126-pixel insets. Build 84 connects native navigation hide/show and suppresses the
Shorts fragment's compensating margin only while fullscreen owns the hidden bar.
Both the content and player expand from a bottom coordinate of 2211 to 2337.
Its guarded three-second timer, native tap play/pause, comments-panel guard,
native exit, live OFF and actual page reset pass. Seventeen full observations
completed before the next-reel test caught native clear reset restoring the tabs.
That failure is retained in qa-shorts-fullscreen-84.log; build 84 is not delivered.
Its strict 28/29/30/1/3 results pass, with interrupted 29/30 runs retained and fresh
retry directories used. Settings 427/427 pass; the source snapshot has 242 inputs.

Build 85 preserves the chosen tab/overlay state across a native reel-model reset
while the same player remains attached, focused and outside an engagement panel.
It reapplies after the new native observers mount; leaving the player still
releases ownership. All eight focused continuity observations and their paired
frames are visually verified, with clean app/extension/crash logs. Strict
28/29/30/1/3 and 427 settings checks pass. The install wrapper was terminated
after installation; the device base APK SHA-256 exactly matches candidate85.apk,
and the continuity probe completed in a fresh wrapper. Nineteen full regression
observations and thirteen independent-install observations are complete and
visually reviewed, including advancing frame pairs. The independent run initially
expected idle clear mode after a long hold; native YouTube opens its options sheet.
The original failed assertion is retained. A bounded continuation verifies the
sheet guard, native exit and actual page reset without a production change.
An intervening continuation wrapper exited 143; the installed isolated APK hash
was verified before resuming. All five final log sets have no app, extension or
shell-helper crashes. The setting defaults OFF; native aspect-ratio fitting stays
unchanged. The baseline already enables the native pinch capability, so forcing
an OFF capability is source/policy verified. Physical devices remain untested.

Final execution, strict results, artifact hashes and delivery provenance are in
execution-85.json, shorts-fullscreen-validation-85.json, artifact-85.json and
delivery-85.json under port-completion-20261113. Pinch parity is done. The next
active item is full Shorts-only mode: hidden tabs and the iOS two-finger,
half-second exit with a localized toast and one-second navigation restoration.
The native boundaries and iOS mapping are in next-shorts-only-design.md.

## Verified Shorts progress checkpoint

Build 80 adds Enable progress bar to the independent Shorts tweak, default OFF.
Two reads of the native immutable display model select always-visible progress
when the known native policy disables it or limits it to pause. OFF, unspecified
and unknown values preserve native behavior. Native panel, active-player, pause,
visibility animation, interaction and seek guards remain intact. A preference
change re-evaluates the attached Shorts controller through its native methods.

416 settings checks and strict standalone/GmsCore/streaming/Shorts-only/
Shorts-streaming 28/29/30/1/3 pass. The 239 production inputs match the final
bundle; ZIP, signatures and installation pass. Ten full and six independent-install
observations are visually verified: live setting changes, pause/resume, cold ON,
native seeking, decoded playback, both Shorts routes, Home and actual page reset.
The diagnostic run confirms the fixtures already use native always-visible mode;
there is no claimed OFF/ON visual difference on those fixtures. Disabled and
pause-only policy conversion is covered by source and JVM checks.

Diagnostic 79 completed ten exploratory observations. Its first runner incorrectly
expected the activity-root wrapper to disappear on Home; the wrapper is empty and
the actual native bar is absent. The corrected check and bounded finisher pass
without a source change. Raw failed-run evidence remains preserved. Build 80 removes
only the bounded diagnostic logging. Final80's first recommended tab item stayed
buffering; frame review caught it and the tab/reset cases were repeated on a
playing item, retaining the initial evidence. Final log/wrapper results are recorded in
execution-80.json; source differences are in source-delta-79-to-80.json.
Defaults and Advanced OFF are restored, the full final APK is installed and the
app is stopped. Physical devices, absent-model and alternate server-policy behavior
remain unverified. The full port remains active at 114 done / 4 n/a / 81 todo.

Evidence: shorts-progress-result-80.json, shorts-progress-isolated-result-80.json,
shorts-progress-log-audit-80.json, artifact-80.json and delivery-80.json under
port-completion-20261113. The preceding header delivery is delivery-78.json at
62e723cd1073354e40e4e025ba517e5952d7e731.

Native Shorts pinch is completed in the checkpoint above. Full Shorts-only mode
and its exit gesture are next; the existing startup route alone remains partial.

## Verified Shorts header controls checkpoint

Build 78 adds Search, Camera, More and Lens settings to the independent Shorts
layout tweak, all default OFF. Native icon roles match the iOS families present
in Android; Lens binds its dedicated paused container. Modern Search and More
receive exact role tags through the native Litho builder. Mounted controls use
live visibility bindings, restored before native view recycling. Home's Search,
paused Mute, native menu callbacks and video playback remain available.

57 header identity checks, 394 settings checks and strict standalone/GmsCore/
streaming/Shorts-only/Shorts-streaming 28/29/30/1/3 pass. All 236 production inputs
match the final bundle; ZIP, signatures and installation pass. Eleven full-install
observations on 77 and six isolated plus four final full observations on 78 are
visually verified. Build 78 changes only native icon classification from 77;
source-delta-77-to-78.json records the exact two files. The checks include live
hide/restore, native More and Search commands, cold ON, paused playback, Home,
actual Shorts-tab reuse, page reset and advancing decoded frames.

Build 76's conversion-time removal worked only on a fresh toolbar. It was replaced
by native mount/unmount bindings in 77. That runner later reported 143 after a
repeated video link stayed on Home; a successful bounded finisher completed reset
and the real Shorts-tab route. An initial isolated QA assertion also expected the
category before Advanced mode was enabled; its corrected order passes without a
source change. All raw failed-run evidence is retained. execution-78.json records
the final wrapper and log results. Defaults and Advanced OFF are restored, the
full final APK is installed, and the app is stopped.

Camera and Lens did not appear in these fixtures; their hooks are source/patch
verified, with visual hide/restore unverified. Physical devices, alternate server
header layouts and live/casting behavior remain untested. The full port remains
active at 113 done / 4 n/a / 82 todo. Evidence: shorts-buttons-result-77.json,
shorts-buttons-isolated-result-78.json, shorts-buttons-final-result-78.json,
shorts-log-audit-78.json and delivery-78.json under port-completion-20261113.

Shorts progress is completed in the verified checkpoint above. Native pinch
and Shorts-only exit controls remain active work.

## Verified Persistent progress bar checkpoint

Build 72 adds the independent Seek bar preference, default OFF. Three narrowly
matched native render-fraction reads keep the track drawn; native duration guards,
animators, control visibility, seeking and accessibility state remain intact.
In fullscreen, ON keeps the red segmented track visible after controls hide;
OFF restores YouTube's normal hiding. Portrait already has a thin collapsed
indicator, which remains visible in both states. The iOS setting requires visible
progress, not a different portrait color or thickness.

382 settings checks and six strict selections (28/29/30/1/1/3) pass. Nine full
and five isolated-install observations pass, including pause, cold ON, actual
Seek Bar reset, independent settings routing and advancing decoded frames.
No Afterglow errors or app crashes; crash buffers are empty. Defaults and Advanced
off restored, full candidate restored, app stopped. All 232 production inputs
match build 72 exactly; ZIP/signature/install pass.

The initial QA assessment incorrectly required an expanded red portrait bar.
Candidate 73's extra whole-view alpha hook had no effect; diagnostic 74 confirmed
the portrait view and its parents already have alpha 1. Both experimental changes
were removed, restoring the exact source tested in 72. Original assessments and
raw diagnostic evidence are preserved. The full runtime wrapper exited 143 during
page reset; its finisher exited 0 and completed the ninth case. Isolated runtime
exits 0. Build and all strict wrappers exit 0.

Evidence: progress-result-72.json, progress-isolated-result-72.json,
progress-visual-review-72.json, progress-log-audit-72.json and execution-72.json
under port-completion-20261113. Delivery provenance is in delivery-72.json.
Physical devices, live/DVR, Shorts and casting remain untested.
Key parity: 109 done / 4 n/a / 86 todo; the full port remains active.

Shorts header controls are implemented in the verified checkpoint above.

## Verified Classic video quality checkpoint

Build 64 completes the Classic quality checkpoint. The mounted Advanced action
exposes its own native command, and a bounded parser waits for real resolution
entries in that command before clicking. This fixes the proven race boundary:
the first action has an empty model, and a reactive rebind supplies the formats.
The guard rechecks the current command, sheet identity, setting and attachment
before invoking the native callback outside the draw traversal. No fixed wait,
global pending flag, reflection or diagnostic logging remains.

3707 parser and 336 settings checks pass. Strict standalone/GmsCore/streaming
28/29/30 and quality-only/quality-streaming 1/3 all exit 0; 225 input hashes match.
The watch runtime matrix passes direct populated lists, manual 360p/720p/480p,
fullscreen, live OFF, unrelated speed menu and actual Playback reset. Shorts
ON/OFF selects the native resolution list/three-choice menu, but selection stays
Auto/1080p with both Classic ON and the native OFF Data saver choice. That
selection limitation is recorded rather than claimed working. Playback remains
decoded, with no Afterglow errors and empty crash buffers.

Independent-install runtime also passes on the 19-second watch fixture: direct
240p/144p list, dismissal/reopen, live OFF restoring the quick menu, and decoded
playback. Only the three Video quality settings appear. The long-video fixture
stalls in a native preroll; its buffering evidence is preserved. The automation
now scopes the player gear by resource ID to avoid the ad's identically named
button. Full candidate 64 is restored by the runner; Classic ends OFF. Delivery
provenance is recorded in delivery-64.json after commit/push.

Hide HUD messages is completed in build 65 below. The pane footer is a separate
view and remains untouched.

Native identity: Latqo root path 1/168777401/3/172035250/1. Mounted command route:
ComponentHost -> hfq -> hhl.b -> vmu.E -> vrs.e -> xso.y -> MessageLite bytes.
Builds 55/58/59 failed runtime; 56/57/60/61/63 were diagnostics; 62 failed strict
validation before installation. Evidence: classic-quality-result-64.json,
classic-quality-shorts-result-64.json, quality-command-{0,1}-63.bin and source
maps. Validation outputs use the Linux cache with evidence-directory symlinks.

## Verified Hide HUD messages checkpoint

Build 65 adds Hide HUD messages to Player overlay, default off. Native Lkgx.g
uses its original skip-display callbacks. All constructors of the five native
message-view classes and the dedicated root_pill_container bind through the
existing live visibility controller. The adjacent watch footer is not hooked.
347 settings checks and strict 28/29/30 plus overlay-only 1 pass, all strict
wrappers exit 0; 226 production inputs match and ZIP integrity passes.

Seven final emulator cases verify live ON/OFF, cold start, fullscreen ON/OFF,
actual Overlay reset and decoded playback. Copy link provides the visible native
confirmation baseline; hiding removes it and restoring brings it back. Android's
clipboard preview remains available. Runtime logs have no Afterglow errors and
crash buffers are empty. Overlay defaults restored, Advanced off, app stopped.
Lite Mode's forced override is policy tested only; the full Lite Mode feature
remains unfinished. Not every native message class was separately triggered.
Physical-device, live/DVR and casting runtime remain unverified.

The build helper prints completion after its successful compiler/bundler child;
the outer tool wrapper reports 143. Strict validation, signing, installation and
final runtime wrappers all exit 0. Evidence: hud-result-65.json,
runtime-hud-65.log, crash-hud-65.log; delivery-65.json records committed-source
provenance after commit/push. Classic quality's delivery is delivery-64.json at
ea7f0605b2a1dc65c5a657af3ff7e31287aad069.

The next checkpoint below completes native Hide Subbar. Native feed/search
RecyclerViews and related-chip mirrors are mapped in next-subbar-map.json/txt.

## Verified Hide most replayed graph checkpoint

Build 71 adds the independent Seek bar setting, default OFF. The hook gates only
HeatMarkerView.onDraw; native graph models, previews, seeking and visibility
callbacks remain intact. It also repairs a concrete dependency gap: Seek bar
and Glow selected alone now include Afterglow's activity and settings row.
Both isolated APKs expose the implicit settings action in the target's cairo
settings resource. No app-wide color-resource rewrite was added for this fix.

365 settings checks and all six strict selections pass: standalone/GmsCore/
streaming 28/29/30, Seek bar only/Glow only 1/1 and Seek bar with streaming 3.
Build, strict, signature and install checks exit 0. All 231 production inputs
match the tested bundle, whose ZIP integrity passes.

Eight full-install observations verify native graph OFF/ON/OFF in portrait,
cold ON, fullscreen ON/OFF, actual Seek Bar page reset and advancing decoded
playback. Scrubber, chapter preview and seeking remain available. Four isolated
observations verify the settings action, owner-filtered Themes page and native
OFF/ON/OFF graph behavior with no other Afterglow feature installed.
No Afterglow errors or target-app crashes. Crash buffers are empty.

Two earlier QA attempts are retained: repeated relative scrubbing overran the
video end, then a watch deep link left Home visible. The final runner normalizes
position and requires the expected watch fixture before gestures. Neither
required a production source change. An isolated QA assertion also mistook the
disabled Theme Studio heading for a destination; the corrected check inspects
clickable rows. Interrupted QA setup/install evidence is kept in execution-71.json.
The isolated fixture also had a native preroll: QA now lets it play and uses
YouTube's Skip button when offered before checking the graph.
The final full and isolated wrappers exit 0.
Defaults and Advanced off restored; full candidate restored and app stopped.

Evidence: heatwave-result-71-final2.json, heatwave-isolated-result-71.json,
independent-settings-resources-71.json and heatwave-log-audit-71.json under
port-completion-20261113. Committed-source provenance is in delivery-71.json.
Physical devices, live/DVR, Shorts and casting remain untested. Glow's isolated
settings resources are package verified; isolated Glow runtime was not exercised.
Key parity: 108 done / 4 n/a / 87 todo; 28 named tweaks. Full port incomplete.

Persistent progress is completed in the verified checkpoint above.

## Verified native Hide Subbar checkpoint

Build 70 adds native Home, search and related-video chip rows to Navigation bar's
Hide Subbar setting, alongside the existing Litho filters. It resolves the known
container on attachment, moves it out of the viewport and cancels its occupied
space with a reversible bottom margin. Native height requests, visibility,
adapters and animation callbacks remain intact. New native margins/translations
win over saved values; detach and OFF restore the bound row.

The original zero-height candidate failed intermittently at cold search startup.
Full native logs exposed SearchResultsChipBarCon's caught animation-constructor
exception: `Target view height does not match expected height (0!=126)`.
The final implementation preserves those dimensions. Diagnostic 68's temporary
logging is removed. Build 69 then exposed a separate feed reveal request from
zero while the hidden native row was already at full height; three OFF controls
did not reproduce it. The final hook uses the actual start height only for that
actively collapsed bound row, preserving native validation and completion
callbacks. Builds 66-69 were not deliveries.

- Strict standalone/GmsCore/streaming/navigation-only: 28/29/30/1, all exit 0.
- 59 spacing and animation checks and 355 settings checks pass.
- 230 production inputs match build 70; ZIP, signature and install pass.
- Android 16 completes 17 observations: live Home/search hide/restore without
  gaps, scrolling, three cold Home controllers and cold search, native comment sort chips,
  actual Navigation reset and advancing decoded playback. Defaults and Advanced
  off restored, app stopped. No native chip-controller exception, Afterglow error
  or target-app crash. One shell UiAutomation helper (UID 2000, PID 31944)
  crashed after a successful hierarchy dump; QA continued and exited 0. The raw
  crash buffer is preserved and process attribution is in subbar-log-audit-70.json.
- Related-video and Litho targets are source/strict verified; tested watch pages
  did not expose a related chip row. Lite Mode's forced preference is policy
  verified only; physical devices remain untested.

Evidence: `port-completion-20261113/subbar-result-70-final.json` and full native
runtime logs. Committed-source bundle provenance is recorded in delivery-70.json.
Continue the most-replayed heatwave control, persistent progress bar and remaining full port. Key parity:
107 done / 4 n/a / 88 todo; 28 named tweaks. The full port is still incomplete.

## Verified native controls checkpoint — 2026-11-14

Build 54 binds both native inflated Music buttons and both paid-promotion
TextViews. Remove ads and Player overlay remain independently selectable. Native
ViewStub listeners, fades, layout and other controls are preserved. Strict
standalone/GmsCore/streaming 28/29/30 and isolated overlay/ads 1/1 pass, all exit 0;
328 settings checks and all 223 production input hashes pass.

Android 16 verifies both actual switches, portrait/fullscreen controls, decoded
playback and both page resets. Defaults are restored, Advanced mode is off and
the app is stopped; no Afterglow errors and an empty crash buffer. The Music
button and paid-content label were absent in baseline fixtures, including a
sponsored-video check with Remove ads off. The preroll Sponsored badge is a
different control. Target visual hide/restore is therefore source verified only,
not claimed runtime verified. Physical-device behavior remains untested.

Parity: **104 done / 4 n/a / 91 todo**, 28 named tweaks. Bundle:
`build-54/YTAfterglow-0.1.0-local.mpp`; committed-source delivery provenance is in
`delivery-54.json` under the evidence root. See `docs/player-behavior.md`.
Continue the full port with Classic video quality: the native original quality
list and quick-menu paths are mapped in `native-obm.txt`, `native-obk.txt` and
`native-qqi.txt`; implementation and runtime checks remain pending.

## Verified loop checkpoint — 2026-11-14

Build 53 adds independently selectable **Remember loop mode**, default off. The
native watch loop choice restores after the iOS three-second activation delay.
Five explicit user action sites record choices; automatic new-video resets do
not overwrite the preference. Weak references and session generations reject
stale callbacks and guard startup recording.

Strict standalone/GmsCore/streaming/isolated-loop 28/29/30/1 pass, all exit 0;
26 session-race and 323 settings checks pass. All 222 production inputs match.
Android 16 completes 22 main observations plus an actual 19-second repeat:
ON/OFF cold starts, fullscreen, disabled-recording preservation, warm navigation,
Autoplay Off remaining paused at 0:00, manual Play and page reset. Playback
defaults and native Loop Off are restored, Advanced mode remains off, app stopped;
no Afterglow errors and empty crash buffers. The failed first signing attempt
hit host parallel-read ENOMEM; retry with four Java workers signs/verifies and
installs successfully. Physical-device, Shorts, live/DVR, ads, casting, playlist
mode 1 and imported iOS internal loop enum interpretation remain untested.

Parity: **102 done / 4 n/a / 93 todo**, 28 named tweaks. Bundle:
`build-53/YTAfterglow-0.1.0-local.mpp`; unique delivery/source provenance is in
`delivery-53.json` under the evidence root. See `docs/player-behavior.md`.

Continue the remaining full port. Music button and paid-promotion labels are
mapped in `next-native-controls-map.txt`; uncompiled drafts are in the evidence
root. Native music binds the actual inflated TouchImageView in `Lojg.h/l`,
preserving ViewStub listeners. Paid labels have two TextView binders in `Lomq`
and `Ljwx`; the existing paid_content_overlay Litho filter is separate. See current work above for production edits and verification.

## Verified Captions checkpoint — 2026-11-14

Build 52 remembers the native enabled/language preference in one atomic private
record and restores it through YouTube's initial selection path. Disable auto
captions now gates server ON/ON_RECOMMENDED hints independently; the old 150ms
startup window is removed. Manual choices retain precedence.

Strict standalone/GmsCore/streaming 27/28/29 and isolated Captions 1/1 pass, all
exit 0; 316 settings checks and all 218 production input hashes pass. Android 16
verifies remembered ON/OFF, both switches together, portrait/fullscreen, native
Next Video, page reset and decoded playback. Arabic survives cold starts; an
English-only video falls back to English captions, and reopening the original
video restores Arabic. One other native recommendation stalled at 0:00 after
media HTTP 413; it is not counted as caption fallback proof. Native English/OFF,
Playback defaults and Advanced off are restored; app stopped, no Afterglow errors
and empty crash buffers. Server-hint/muted suppression is source/policy verified;
physical-device, Shorts, live/DVR, ads and casting behavior remain untested.

Parity: **101 done / 4 n/a / 94 todo**, 27 named tweaks. Bundle:
`build-52/YTAfterglow-0.1.0-local.mpp` under the evidence root below. Source and
unique delivery provenance are recorded in `delivery-52.json`. See
`docs/player-behavior.md`. Earlier caption builds 47/50 failed cold persistence;
49 was diagnostic and 51 used unrelated generic settings notifications. None is
a delivery.

Continue Remember loop mode and the remaining full port. Loop baseline build 50
verifies native Off -> manual On -> cold Off. `Lobh` owns the watch menu;
`Lasjv.k(int)` delegates through `Lasjs` to active-player `Lasij.q(int)`. Native
watch menu modes are ON=2/OFF=0. Five explicit user action sites are mapped;
automatic new-video resets must not overwrite the preference. Native mapping and original drafts are in the evidence root; see the current loop
work above.

## Delivered Autoplay checkpoint — 2026-11-14

Build 45 completes Autoplay's initial-paused behavior and binds the native switch
for live visibility. It changes only the new load's private `playWhenReady` flag;
manual Play and YouTube's saved next-video setting remain intact. The native overlay
switch is absent in the baseline, so visibility is source-verified here.

Strict standalone/GmsCore/streaming 27/28/29 and isolated Autoplay 1/1 pass, all
exit 0; 242 settings checks and all 218 production hashes pass. The emulator
verifies Off/Off + hidden, manual Play, fullscreen, live choices, actual reset and
native Next Video opening paused. Default Shorts has advancing decoded frames.
Logs contain no errors, crash buffers are empty, Playback defaults are restored,
Advanced mode remains off and the app is stopped. See `docs/player-behavior.md`.

Parity: **100 done / 4 n/a / 95 todo**, 27 named tweaks. Candidate:
`build-45/YTAfterglow-0.1.0-local.mpp`; source/delivery provenance is in
`delivery-45.json` under the evidence root. Off-mode Shorts, live/DVR, casting,
ads and physical-device behavior remain untested. Continue Captions and the full
port. The caption manager's native saved-choice branch has been mapped; replace
the old auto-caption timing gate with the native server-hint boundary so an
explicit viewer choice survives.

## Previous chapter-snapping checkpoint — 2026-11-14

Build 44 completes **Disable snap to chapter** in the independently selectable
**Player gestures** patch. It chooses the original finger position at the native
scrub-release boundary without changing chapter metadata or two-finger seeking.

Strict standalone/GmsCore/streaming runs pass 27/28/29; Player gestures isolation
passes 1/1, all exit 0. Settings checks pass 216/216 and all 218 production inputs
match. The Android 16 emulator verifies live off/on/off in one paused video,
independent two-finger settings, fullscreen free scrubbing and actual page reset
restoring chapter boundaries. Portrait return and resumed playback pass. Runtime
logs have no errors and the crash buffer is empty; controls defaults are restored,
Advanced mode remains off and the app is stopped.

Parity is **99 done / 4 n/a / 96 todo**, 27 named tweaks. See
[`docs/player-behavior.md`](docs/player-behavior.md). Bundle:
`build-44/YTAfterglow-0.1.0-local.mpp` in the evidence root below; source and delivery
provenance are recorded in `delivery-44.json`. Continue the remaining port.
For Autoplay, the iOS Off mode means
newly opened videos start paused; it does not simply turn off next-video autonav.
Physical-device, Shorts and live/DVR chapter behavior remains unverified.

## Previous playback end-time checkpoint — 2026-11-14

Build 43 adds independently selectable **Playback end time** with the two original
iOS switches, both default off. The native duration label preserves its styling,
accounts for playback speed and switches live between 12/24-hour clocks. Native
text updates are deferred until YouTube finishes measuring its own label; this
fixes the minimum-width cache issue found in build 42.

Strict standalone/GmsCore/streaming runs pass 27/28/29, and end-time-only isolation
passes 1/1; all exit 0. There are 217 verified production inputs. The emulator
checks portrait/fullscreen formats, native paused 2x/0.25x, new videos, Shorts
exclusion and actual page reset. The long-video reset restores the native 135px
width. Runtime logs have no errors; crash buffers are empty. Native speed is 1x,
overlay defaults restored, Advanced mode off and the app stopped.

21 clock checks and 207 settings checks pass. Parity: **98 done / 4 n/a / 97 todo**,
27 named tweaks. See [`docs/player-behavior.md`](docs/player-behavior.md). Bundle:
`build-43/YTAfterglow-0.1.0-local.mpp` in the evidence root below. Committed/pushed
as `ebda3cb3`; delivery provenance is in `delivery-43.json`. Physical-device,
live/DVR and casting behavior remains unverified.

## Previous native action refresh checkpoint — 2026-11-14

Share and Save now refresh live under the video and in landscape fullscreen,
independently and together. The shared native reactive component bridge retains
the latest input/context, replays its original conversion, and calls the native
state update. Disposal clears retained inputs; a weak registry avoids retaining
closed players. The previous fullscreen view/presenter reset hook is removed.

Build 40 passes the complete live matrix, row scrolling, fullscreen return and
resumed playback, with no Afterglow errors and an empty crash buffer. A fresh
portrait fullscreen baseline does not offer Share at the tested width; its
available Save button hides and restores correctly. Earlier assertions requiring
Share there were test errors. See [`docs/player-behavior.md`](docs/player-behavior.md).

Build 41 removes diagnostic logging. Strict standalone/GmsCore/streaming runs
pass 26/27/28, all exit 0; its 214 production inputs match and ZIP integrity passes.
The bundle is `build-41/YTAfterglow-0.1.0-local.mpp` in the evidence root below.
Final build-41 emulator verification passes all 11 live cases and resumed
playback; standalone Player buttons and menus isolation passes 1/1, exit 0.
The final runtime log has no errors and the crash buffer is empty. Hide switches
are restored off, diagnostic properties are INFO and the app is stopped.
46 action-filter and 196 settings checks pass. Parity is
**96 done / 4 n/a / 99 todo**, with 26 named tweaks. Committed/pushed as
`9cf78d24`; exact delivery provenance is in `delivery-41.json` under the evidence root.

## Previous native overlay checkpoint — 2026-11-14

Build 31 adds title, background shading, fullscreen actions and channel watermark
switches to **Player overlay**. All nine overlay switches default off and reset
correctly. The Android 16 emulator verifies independent hides/restoration, combined
fullscreen/portrait behavior, watermark playback and retained control fades.

**Player buttons and menus** now handles fullscreen Share/Save independently with
live restoration. It resets the native cached presenter, restores its current
model and re-emits the native measured dimensions. Shared icon data caused the
old under-video filter to hide neighboring buttons; matching native accessibility
IDs fixes that. Fresh-playback under-video tests pass. Its cached bar still needs
the video reopened after a setting change, so Share/Save remain partial. Continue
that live-refresh boundary, then the remaining full port.

Strict build-31 runs pass 26/26 standalone, 27/27 with GmsCore and 28/28 with
GmsCore plus Spoof video streams, all exit 0. Both independently selected groups
also pass standalone strict isolation on build 30. 46 action-filter regression
checks and 196 settings checks pass. There are 214 recorded production inputs.
Candidate: `build-31/YTAfterglow-0.1.0-local.mpp` under the evidence root below;
the signed emulator APK is `overlay-test-31.apk`. Final build-31 checks confirm
live fullscreen hide/restore and independent under-video hides after reopening.
The final runtime log has no Afterglow errors and its crash buffer is empty;
defaults are restored and the app is stopped. Delivery provenance is recorded in
`delivery-31.json` under the evidence root. See [`docs/player-behavior.md`](docs/player-behavior.md).

## Previous fullscreen checkpoint — 2026-11-14

Build 27 adds separately selectable **Fullscreen**: automatic entry after the iOS
750ms delay, exit at playback completion, and retaining fullscreen through portrait
rotation. Native entry/exit and orientation policy are used. Session checks cancel
stale work; manual exit does not trigger reentry. All three settings default off.
Android 16 verifies independent entry/exit, immediate native autoplay, portrait
rotation with correctly letterboxed playback, restoration when disabled, and
preservation of the native Shorts player with all three switches on.

Strict validation passes 26/26 standalone, 27/27 with GmsCore and 28/28 with GmsCore
plus Spoof video streams, all exit 0. 192 settings and 15 session-race checks pass.
Candidate: `build-27/YTAfterglow-0.1.0-local.mpp` under the evidence root below;
210 source inputs recorded. The emulator has signed `fullscreen-test-27.apk`.
See [`docs/player-behavior.md`](docs/player-behavior.md). Continue the remaining
native player overlay and parity work; the full port remains active.

## Previous gesture checkpoint — 2026-11-14

Build 24 adds independent ordinary/two-finger double-tap switches and disables
continuous free zoom while preserving native pinch-to-fill. The switches reset
and restore native behavior; Android 16 verifies both gesture classifications,
**Zoomed to fill / Original**, and restored **1.8x** continuous zoom. One-finger
quick-scale was unavailable in the native baseline; its saved-flag restoration
is source-verified. SponsorBlock markers now follow native track fading and
still render in Shorts. See [`docs/player-behavior.md`](docs/player-behavior.md)
and [`docs/sponsorblock.md`](docs/sponsorblock.md).

Strict validation passes 25/25 standalone, 26/26 with GmsCore and 27/27 with
GmsCore plus Spoof video streams. Settings checks pass 175/175. Candidate:
`build-24/YTAfterglow-0.1.0-local.mpp` under the evidence root below. The emulator
has signed `gesture-test-24.apk`; no physical device was used. Fullscreen behavior
and the remaining parity list are the next work; the full port remains active.

## Previous SponsorBlock checkpoint — 2026-11-14

Build 20 adds the independently selectable **SponsorBlock** patch: all 21 iOS
preferences, nine independent skip/marker categories, a hash-prefix client,
active-player native seeking, a four-second Undo notice and timeline markers.
87 policy, 151 settings and 438 theme checks pass. Strict runs pass 25/25 standalone,
26/26 with GmsCore and 27/27 with GmsCore plus official **Spoof video streams**.
Android 16 verifies watch/fullscreen and Shorts markers, skip/undo, category/marker
independence, the Shorts-only switch and reset. See [`docs/sponsorblock.md`](docs/sponsorblock.md).

Shorts initially stalled because native Onesie media requests received HTTP 413.
Official **Spoof video streams** fixes playback in this emulator; select it alongside
GmsCore for subsequent runtime checks. `tools/verify_bundle.py --official-patch
"Spoof video streams"` selects it from `--gms-bundle`. The Afterglow bundle does not
include or automatically enable the official client. Build 20 used the
signed `sponsor-streaming-test-20.apk`, with Afterglow settings restored to defaults.

## Previous player checkpoint — 2026-11-14

The current candidate is `build-18/YTAfterglow-0.1.0-local.mpp` under the evidence
root below. **Player gestures** adds native tap-to-seek; **Disable ambient mode**
suppresses the cinematic renderer without changing YouTube's own saved setting.
Both default off and are independently selectable. **Player overlay** adds five
live hide switches for fullscreen, More, collapse, subtitles and previous/next.
Strict validation passes 24/24 standalone and 25/25 with GmsCore; 106 settings
checks pass. Actual emulator switches, the seek position change, ambient lighting
suppression, portrait/fullscreen control hides, playback fades and reset were verified.
See [`docs/player-behavior.md`](docs/player-behavior.md).

## Delivered theme checkpoint — 2026-11-14

The active checkout remains `/home/corey/projects/ytafterglow-morphe-patches`, `main`.
The current candidate is `build-15/YTAfterglow-0.1.0-local.mpp` under
`/mnt/c/Users/Corey/ytag-scratch/android/port-completion-20261113/`.

- Theme Studio: private drafts, 20 semantic roles, foundation/gradient/contrast helpers,
  save/restart, custom library, duplicate, rename, delete, JSON export and JSON/XML import.
- Added separately selectable Typography, Glow and Seek bar patches. 43 unchanged iOS font
  assets; Apple system-only families use Android counterparts. See `docs/font-assets.json`.
- Native feed gradients, navigation/icon tint, neutral text spans, TextView/layout/font-registry
  adapters, styled text, icon bloom, canvas glow, custom PNG scrubber and size/motion policy.
- Strict `--validate` passes with exit code 0: 21/21 standalone and 22/22 with official GmsCore.
  438 theme checks and 83 settings visibility checks pass, including independent patch gating.
- The signed candidate installed on the Android 16 phone emulator. Verified custom save and
  restart, exported/imported theme JSON, XML import, persistent library, discard-without-saving, rename,
  delete, native gradients, tab/player glow, selected font in feed/watch/comments/settings,
  custom PNG/size selection and scrubber rendering, portrait/fullscreen video playback and seeking.
- Typography/seek/color resets restore defaults and preserve the saved library. The final
  build fixes thumbnail mask errors found in build 12; the repeated fullscreen case has no
  YTAfterglow errors and an empty crash buffer.

Important fixes from runtime testing: keep resource background colors opaque for Android's
contrast calculation; clear only verified page/drawable backgrounds for gradients; apply fonts
at measurement and styled-span boundaries; draw the custom scrubber after track bloom.
See [`docs/theme-studio.md`](docs/theme-studio.md) and [`docs/port-progress.md`](docs/port-progress.md).

Remaining native theme work includes buffered/live-specific scrubber roles, broader server
control coverage and Shorts/live/promo-player verification. Exact iOS rasterization is not
claimed. Other port groups below remain unfinished. Keep them tracked; do not mistake this
validated theme delivery for all 199 keys being ported.

## Historical native theme checkpoint — 2026-11-13

The active checkout is still `/home/corey/projects/ytafterglow-morphe-patches`, on `main`.
The **Theme Studio** named patch adds the 30 iOS presets, active identity, swatches, seasonal
group and reset. The editor, saved library and theme-file transfer remain hidden. Native
colors require Android 14+; the screen explains that requirement on older devices.

The native adapter isolates 74 style bindings in 55 aliases and maps 38 additional semantic
resources (93 total). It attaches an overlay to base contexts and the main activity, hooks
the verified Litho background drawable, and selects YouTube's LIGHT/DARK foundation without
changing the saved Appearance setting. Reset returns to that saved setting. Shared white,
black and brand-red constants remain untouched. See [`docs/native-themes.md`](docs/native-themes.md).

Testing exposed two old/new integration boundaries: the 2.1 resource encoder requires the
canonical `colors.xml` / `overlayable.xml` filenames; and restarting in the same process left
the user on Home. The unexported `RestartActivity` now relaunches from a short-lived separate
process after preference writes are flushed. Removing `finishAffinity()` alone did not solve it.

Current totals: **18 named patches; 56 done / 4 n/a / 139 todo**. Theme Studio remains partial.
292 theme-engine and 67 settings-visibility checks pass. Strict `--validate` application
passes 18/18 standalone and 19/19 with official GmsCore. The final candidate is `build-08`
under `/mnt/c/Users/Corey/ytag-scratch/android/native-theme-20261113-01/`.

The signed combined APK was installed on the Android 16 phone emulator. The actual settings
row opens Theme Studio; Warm Sand and Midnight Blue show the expected native foundations and
catalog background colors. Applying a preset now reopens YouTube automatically. Theme Studio
reset removes the native overlay and restores the original appearance. Runtime logs contain
no Afterglow errors or fatal exception, and the crash buffer is empty. Full details/screenshots
are in the native-themes document and evidence directory above. Both reset entry points were
exercised; the emulator was restored to system colors and shut down after testing.

Remaining themes work: native gradient attachment, fuller navigation/icon/player coverage,
exact semantic tinting for server-driven text, custom editor/library and import/export,
then Glow and Typography. No physical-device or video-playback proof is claimed.

## Historical takeover state

**Baseline at takeover (`750b016`; see the checkpoint below for subsequent work):**
- **17 named tweaks**, all applied in a strict Morphe Desktop 1.20.0 run on YouTube 21.43.523: Background playback, Playback speed, Skip content warning, Video quality, Captions, Autoplay, Shorts layout and buttons, Shorts, Player buttons and menus, Watch page, Comments header, Remove ads, Navigation bar, Feed menus, Tab bar, Startup tab and animation, Privacy.
- **Parity:** 55 done, 4 n/a, 140 todo of 199 iOS keys (`tools/parity.json`).
- **Afterglow settings page:** all 24 iOS pages, 346 rows, 21 pickers, 225 search entries, tab editor, iOS-style glowing two-tone wordmark row. Its signature orange/white constants follow current iOS Settings.x; surrounding surfaces read theme keys.
- **Base pieces:**
  - extension init hook (`MainActivity.onCreate`);
  - Litho component filter (`litho/`);
  - menu-row hook (`menus/`);
  - video-state base (`video/VideoState`: id, Shorts, state, time, seek, speed, listeners; for SponsorBlock and others);
  - `InstalledTweaks` gating.
- **Emulator-verified** (Android 16 phone image, patched with Morphe `patches-2.0.0.mpp` "GmsCore support" plus ours, microG installed):
  - the Shorts hides (Like, Comments, Share, Remix, channel name, description);
  - hiding Shorts in search;
  - the settings row and pages.

**Not done / unverified:**
- **No real-device test.** The user's S25 Ultra and Z Fold7 weren't reachable over ADB or Tailscale.
- **The glow look** has never been visually compared on screen with the iOS reference screenshots.
- **Partial keys:** noPromotionCards, noSubbar, noPlayerShareButton/SaveButton (the on-video View parts), autoplayMode "off", shortsOnlyMode, commentsHeaderMode "pinned".
- **Not started**, biggest first:
  - complete native theme coverage and Theme Studio editor/library; Glow and Typography (shared palette, native resource/Litho adapter and preset picker now exist);
  - Control Center (queued, never started);
  - two-row tab bar, side anchors, tab composition from `TabStore` (Messages `FEconnections_inbox`, Afterglow tab);
  - SponsorBlock (Afterglow's own client, incl. Shorts);
  - overlay buttons (mute, lock, download, Premium controls sheet, clean-overlay eye);
  - player gestures and fullscreen, seek bar, end time;
  - Downloads/Vault, AI Home, AB Lab, Lite Mode, long-press tools, classicQuality, rememberCaptionState, rememberLoop, miniplayer, noRelatedWatchNexts.

## Takeover checkpoint — 2026-11-12

The active checkout is `/home/corey/projects/ytafterglow-morphe-patches`, on `main`, remote
`afterglow-labs/ytafterglow-morphe-patches`. The original Android-named checkout is separate.
The user asked Codex to take over; the selected next batch is the theme engine.

The shared **color foundation** is implemented: 20 semantic roles, all 30 iOS master presets,
derived colors, correct iOS light/dark foundation selection, cached immutable snapshots, and
atomic preset/reset APIs. Existing Afterglow settings use that palette. See
[`docs/theme-engine.md`](docs/theme-engine.md) for exact scope, verification and the next boundary.

This does not finish native YouTube theming, Theme Studio, Glow or Typography. No new unfinished
controls are exposed, and parity remains 55 done / 4 n/a / 140 todo, with 17 named patches.
The theme engine JVM suite passes 252 checks; the existing settings visibility suite passes 65.
The local bundle builds. Strict patch validation passes standalone (17/17) and with official GmsCore support (18/18). The signed combined APK installed on the Android 16 phone emulator. Afterglow settings passed a cold launch and imported `theme_background=#909090`, showing the expected light foundation with dark text. Restoring defaults and cold reopening returned to the original appearance. The crash buffer was empty and captured logs contained no Afterglow errors. No physical-device test was performed. The emulator was shut down after testing.
Artifacts/logs: `/mnt/c/Users/Corey/ytag-scratch/android/theme-engine-20261112-01/`.

Strict fingerprint validation found a baseline player-status enum collision with our own merged
extension. The fingerprint now excludes the extension namespace. Cast visibility matching now tolerates the two instructions inserted by the official GmsCore dependency and captures the match before editing. Both configurations pass with `--validate`; keep that gate enabled.

## Files in Play

| File | Why It Matters |
|------|---------------|
| `tools/tweaks.json` | Tweak id → Morphe name + owned iOS keys (`base` keys always show). |
| `tools/parity.json` + `tools/check_parity.py` | Status per iOS key (`done` needs `where`, `n/a` needs `why`). |
| `tools/check_tweaks.py`, `tools/check_settings_ui.py` (+ `tools/jvm/SettingsVisibilityTest.java`) | Every key owned once; every named patch calls `markTweakInstalled`; settings spec plus visibility rules. |
| `tools/generate_from_ios.py <ios repo>` | Registry (`settings/Registry.java`) + 13 languages (`i18n/`) from iOS `YTAGPreferenceDescriptor.m` and `Localizable.strings`. |
| `tools/generate_settings_ui.py`, `tools/ios-settings-ui.json` | iOS settings layout → generated `ui/SettingsSpec.java`. |
| `tools/generate_tweaks.py` | `tweaks.json` + parity → generated `settings/TweakCatalog.java` (`SHOWN_KEYS`). |
| `tools/local_build.sh` | Offline build → `build-local/YTAfterglow-<ver>-local.mpp`. |
| `patches/src/main/kotlin/app/afterglow/patches/TweakPatches.kt` + `tweaks/*Tweaks.kt` | The 41 Afterglow/compatibility wrappers and their owned hooks. |
| `patches/.../shared/{Constants,AfterglowExtensionPatch,Tweaks,BytecodeHelpers}.kt` | Compatibility (21.43.523), extension init, `markTweakInstalled(id)`. |
| `patches/.../settings/AfterglowSettingsPatch.kt` | Adds the exported `AfterglowActivity` with an action intent-filter, the row layout/icon resources, and the row in `res/xml/settings_fragment_cairo.xml`. |
| `extensions/extension/src/main/java/app/afterglow/extension/` | `Afterglow`, `InstalledTweaks`, `settings/` (AfterglowPrefs, TabStore, LiteMode, PrefsTransfer), `ui/`, `litho/`, `menus/`, `video/`, `playback/`, `navigation/`. |
| `vendor/morphe/`, `tools/import_morphe.py`, `tools/morphe-catalog.json` | Pinned original 2.0.0 source/runtime, reproducible integration adapters and selection mapping. Later 2.2 source is research only. |
| `/mnt/c/Users/Corey/ytag-scratch/morphe-research/featuremap.md` + `morphe-feasibility-report.md` | iOS key ↔ Morphe patch line-up. "Afterglow only" means not in Morphe. |
| `/mnt/c/Users/Corey/ytag-scratch/android/yt-21.43.523/dump/classes*.txt` | `dexdump -d` of 21.43.523. Search with `rg -F` (about 2 s). |
| `/mnt/c/Users/Corey/ytag-scratch/android/ios-reference/` | Current iOS screenshots: settings row glow, Control Center (IMG_3190–3198), Theme Studio (IMG_3199–3201). |
| Frozen iOS source (read-only spec) `~/.cache/ytafterglow-android/afterglow-vault-20261116/ios-reference/` | Current behavior snapshot, including download/Vault, tabs and long-press actions. Do not edit the live iOS builder source. |

## What Has Been Tried (and Why It Failed)

### Official add-on API / fork framing
- **What:** first proposed plugging into Morphe's `AddOnManager`/`AddOnApi`, or forking.
- **Why it was rejected:** the user wants their own standalone tweak repo ("I want MY tweaks / MY experience"). It's neither a fork nor the add-on contract.

### One umbrella "YTAfterglow" patch
- **What:** a single named patch, with features toggled only in-app.
- **Why it was rejected:** the user wants a tweak list in Morphe. It was split into named tweaks per `tweaks.json`.

### Rebuilding GmsCore support
- **What:** started our own GmsCore patch.
- **Historical decision:** reuse Morphe's GmsCore implementation. It is now pinned and integrated into the same Afterglow source; a second bundle is no longer required. Our code remains package-name independent.

### Settings row: `targetPackage` intent, then unexported action intent
- **What:** a fixed package broke once GmsCore renamed the package. An implicit intent to an unexported activity was blocked on Android 14+ (`ActivityNotFoundException`).
- **Fix:** exported activity with an action intent-filter (committed).

### Gradle build via GitHub Packages
- **What:** the normal Gradle build.
- **Why it failed:** the gh token lacks `read:packages`. Use `tools/local_build.sh` instead.

### jadx decompiler
- **What:** download and run jadx.
- **Why it failed:** blocked by the auto-mode classifier. Use the SDK's `dexdump`/`aapt2`.

### Plain `invoke-static {p0}` in big methods
- **What:** a plain invoke in `MainActivity.onCreate`.
- **Why it failed:** smali error "maximum allowed register … v15". Use `invoke-static/range {p0 .. p0}`.

### `AfterglowActivity` styling bars before `setContentView`
- **What:** styled the system bars before the content view existed.
- **Why it failed:** NPE on API 36. Fixed: bars are styled after the content is set.

### Hard-coding colors from screenshots
- **What:** sampled colors from iOS screenshots.
- **Why it was wrong:** the user said all colors come from the selected theme. Port the iOS derivation and fallbacks.

### Calling features Morphe has when they're Afterglow-only
- **What:** the research labels made it look as if Morphe had Vault, Theme Studio, glow and the 11-tab bar.
- **Why it was wrong:** Morphe has none of them. The notes are fixed; never describe these as Morphe features.

## Current implementation boundary

- Preserve the pinned Morphe 2.0.0 source/runtime and original settings for shared
  functionality. Imported implementations stay in `app.morphe.*`; Afterglow owns
  the selectable wrappers and settings bridge. Keep provenance and notices.
- Preserve Afterglow's download mechanism, UI, queue and Vault as the explicit
  exception. Reuse compatible stream transport without selecting the original
  Morphe Downloads UI. Theme Studio, Glow and the native theme adapters remain
  Afterglow-owned.
- The 195 done / 4 n/a ledger records functional Android implementation. Eligible
  server/account fixtures, physical devices and additional layouts remain a
  separate runtime matrix; do not recreate already working Morphe behavior or
  impose exact Apple rasterization as a missing-port gate.

## Release state and further coverage

Build133 is published. Preserve its immutable source tag and unique delivery;
new production changes need a new frozen build and validation record. The
single source includes its own GmsCore and Spoof video streams selections; the
companion GmsCore app remains a separate installation.

Physical devices, account login, casting, native AI feed execution and the paused
Shorts subscription carousel remain additional runtime coverage. Use eligible
account/server fixtures for the latter two. Retain the successful host GLES
configuration for Description/image QA and restore temporary host clipboard
settings afterward. The original emulator renderer and clipboard sharing are
restored at this checkpoint.

## Key Constraints

- **Use the frozen iOS behavior with functional Android adaptations.** Reuse existing Morphe functionality where it overlaps, preserving the explicit Afterglow download/Vault and Theme Studio owners. The four n/a keys are floatingKeyboard, stockVolumeHUD, disableFloatingTabBar and hideShortsLogo; Android 21.43 lacks their corresponding iOS surfaces.
- **Patcher 2.1.0, old API** (`bytecodePatch`/`resourcePatch`, `Fingerprint(...)` named args). Check signatures with `javap -classpath /mnt/c/Users/Corey/Downloads/morphe-desktop-1.20.0-all.jar <class>`. kotlinc needs `-Xcontext-parameters`. The bundle loads in the user's current Desktop 1.20.0 and Manager, and in newer hosts.
- **Push straight to main, no PRs.** The repo is public. Publish verified `.mpp` releases and update root `patches-bundle.json` so Manager can add the repository URL as a source; preserve a uniquely named local delivery as provenance. See README.md for the source links. The user also requested matching Morphe implementations as temporary coverage until Afterglow versions are finished; keep attribution and validate conflicts before including them.
- **Afterglow is the product name.** Original imported code retains its `app.morphe.*` packages and accurate secondary attribution. Preserve GPL source, licenses, modification notices and user-accessible credits; do not imply an official Morphe release.
- **The Linux root disk fills up** (other projects). Put build outputs on C: (`/mnt/c/Users/Corey/ytag-scratch/...`). Never delete other projects' files.
- **Installed tools are the verified build path:** JDK, Android SDK, Android Studio kotlinc and Morphe Desktop jar. Earlier download/tool restrictions were session-specific; do not treat them as a permanent environment limitation.
- **Follow the current iOS source for colors and glow.** App surface/control colors derive from the active theme. The settings wordmark has dedicated signature constants in Settings.x; do not recolor those based on a general statement in an older handoff.

## Memory Pointers

- Memory files under `~/.claude/projects/-home-corey-projects-xuninc-YTAfterglow/memory/`: `morphe-port-research`, `morphe-use-their-plumbing`, `existing-tweaks-are-the-spec`, `push-to-main-not-prs`.
- Searches worth re-running: `ytafterglow-morphe-patches parity`, `Afterglow Litho filter 21.43.523`, `Morphe GmsCore emulator Shorts test`.
