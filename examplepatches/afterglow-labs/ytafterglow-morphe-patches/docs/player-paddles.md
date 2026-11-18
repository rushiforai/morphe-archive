# Native rewind and fast-forward buttons

`replacePrevNext` exposes the existing advanced **Fast forward and Rewind buttons**
switch under Player > Overlay. It defaults OFF and belongs to the independently
selectable Player overlay tweak. The original settings text, translations and
Lite Mode behavior are retained.

The iOS reference enables
`replaceNextPaddleWithFastForwardButtonForSingletonVods` and
`replacePreviousPaddleWithRewindButtonForSingletonVods`. Android uses YouTube's
existing rewind/fast-forward controls for the same standalone-video scope.
It preserves native icons, accessibility labels, click handlers and seek interval.

## Native integration

`PlayerPaddlesPatch.kt` observes the `Loin.a(Object)` transport subscriber before
its presentation decisions. It reads the original `Loih`/`Loim` transition and
the owner's `Lasbs` playback descriptor through `Loir` and `Laske.g()`.
The descriptor's video ID, playlist ID and explicit video list determine whether
the current playback is a standalone video. A synthetic queue with more than
one item is excluded even when it has no playlist ID.

`PaddlePolicy` accepts the stock YOUTUBE, YOUTUBE_LARGE_CONTROLS and DIBS styles.
The bridge additionally requires native PLAYING or PAUSED state and excludes
clips, composite playback and the meta scrubber. Live/DVR, advertisements,
trailers, remote playback, station and hidden styles retain their native policy.
Original scrub, education, engagement and native layout guards remain in place.

Only four local boolean reads change: the native Previous/Next presentation
decision and three sticky-seek decisions. The original model is never written.
The native `Loir.b(boolean)` handler continues to read the configured interval
from `Larxp.b()` and perform the native seek through `Lassj.g(long)`.
Hide Previous and Next buttons also hides the replacement pair when both
settings are enabled. Turning replacement OFF restores original decisions.

`PlayerPaddles` tracks native owners weakly on the main thread. Preference changes
post a refresh after the preference callback returns, replaying the last original
model with animation disabled. Attached owners update without restarting YouTube;
reset and import notifications use the same path. Other tweaks are not required.

## Validation

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
