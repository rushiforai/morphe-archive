# Live playback, regional access and QoL research (2026-09-23)

Target: SBS Android 6.3.0 (16435). Static inspection of our original APKM copy,
plus local build/patch checks. No device session, server response, manifest or
media segment was captured. Decompiled Java is reconstructed, not original
source; several classes have JADX warnings. No geographic bypass implemented.

## Live playback

The released VOD patch branches only on the exact `vod` stream type. Other
types continue into original provider selection. No direct live modification
was present, but that alone cannot rule out runtime interactions after VOD.

Relevant local evidence under `analysis/sbs-inventory-VsNy8i/`:

- `playback/PlaybackController.java`: `processStreamProvider` selects Google
  DAI first; `setupGoogleDaiProvider` requests a live DAI stream for non-VOD.
- `playback/AdsController.java`: `requestLiveStream` calls
  `createLiveStreamRequest(assetKey, contentSourceId)`. If `adsLoader` is null,
  it silently does not request a stream. This is a possible stall path, not
  the diagnosed cause on the user's phone. SDK error callbacks trigger fallback.
- `architecture/PlayerManager.java`: error recovery retries/falls back for
  several network/decoder/DRM errors. Identical errors within 30 seconds are
  not retried by this method. This is not a general buffering watchdog.
- `fallbackToAkamaiProvider` already handles non-VOD, sets live state and
  calls `loadAkamaiMedia`. The latter supports live-edge seeking. It does not
  establish that every live channel actually receives an Akamai provider.

With the user's approval, added a separate default-off patch:
`Prefer direct live stream (experimental)`. Only exact `live` qualifies.
If the FIRST Akamai provider has a nonempty URL, call the existing fallback
with `isFromError=false`. Otherwise retain original selection. Uses v0-v2,
requires eight registers, and preserves the original VOD patch unchanged.
Distinct labels permit both patches to be selected together.

This skips Google's DAI route when an alternative is available; it does NOT
prove that the alternative contains no inserted ads. Broadcast ads remain.
No invented stream URLs, changed permissions, geo headers, or DRM modifications.

## Regional access

- The inspected manifest has no ACCESS_FINE_LOCATION/ACCESS_COARSE_LOCATION.
- `research-live-geo/PlaybackApiService.java`: POST `/stream/{id}`.
- `PlaybackRequest.java`: top-level fields are advertising, deviceClass,
  streamOptions, streamProvider and subtitle; no top-level GPS/country field.
  Nested fields, all other endpoints and CDN behavior are not exhaustively mapped.
- `PlaybackSerializer.java`: a JSON `error` causes VideoStreamError before a
  PlaybackItem is produced. Ignoring an error would not produce a stream URL.
- `ErrorHandlerKt.java` maps HTTP 403 to FORBIDDEN. This does not establish
  that any particular 403 is a geo error.

SBS's own help says streaming is limited to Australia and describes IP/VPN
location problems, including Australian VPN endpoints. Evidence favors a
server/IP component rather than a simple GPS switch, but no controlled request
comparison was performed. Cannot promise an APK-only geographic bypass or
identify whether this particular failure is at API, DAI or CDN level.

Sources consulted:

- https://help.sbs.com.au/hc/en-au/articles/360002023895-Can-I-watch-or-download-SBS-On-Demand-content-outside-Australia
- https://help.sbs.com.au/hc/en-au/articles/16016472428687-I-am-getting-a-This-video-is-only-available-in-Australia-error-message-even-though-I-am-in-Australia-How-do-I-resolve-this
- https://developers.google.com/ad-manager/dynamic-ad-insertion/sdk/android/get-started?service=full

## QoL candidates (not implemented)

1. Auto-skip intro/recap: PlaybackEventViewModel already uses opening-credit
   and recap begin/end markers; PlayerViewModel has skipIntro/skipRecap.
   Good candidate, but requires per-title metadata and seek-loop prevention.
2. Remember video quality: TrackSelectorController.videoQualitySelected updates
   state and bitrate cap, with no persistence call in that method. Audio/text
   choices already use AppStorage, so do not advertise those as missing.
3. Adjustable seek increments: PlayerManager supplies its forward/backward
   increments to ExoPlayer.Builder. A configurable interval is plausible.
4. Next-episode countdown/end-card preferences: PlaybackEventViewModel exposes
   countdown, watch-credits and recommendation state. Autoplay preferences
   already exist; inspect the existing settings before adding duplicates.
5. Playback diagnostics/retry button: surface provider and sanitized errors
   rather than an endless spinner. Needs UI work and bounded retry behavior.

## Validation and next phone test

Gradle build succeeded (no unit tests currently defined). Morphe successfully
applied both VOD and live to the APKM and rebuilt it; no failed patches.
apkanalyzer reread the output: exact live guard, exact vod guard, URL checks,
fallback calls and original selection/catch block are all present.
These are structural checks, not Android runtime or playback tests.

Local bundle: `output/sbs-patches-live-test-20260923.mpp`.
SHA-256: `869909d1fb10d38f5f7f6546269019c20e02dfbdeface3bdc0b5e87263714ca2`.
Its internal build version remains 1.0.0; it is a LOCAL experimental build,
not the published GitHub 1.0.0 asset. Import as a local source for testing and
avoid selecting duplicate patches from the published source.

Test several live channels, cold start directly into live, VOD -> live,
live -> VOD, pause/resume and live restart. Compare the same network/channel
with the VOD-only build. If buffering persists, capture a narrowly scoped
logcat during one attempt; redact tokens, stream URLs and identifiers before
sharing. Do not clear the global device log buffer. No device logs collected yet.

The user subsequently reported that the live test works and authorized release.
Device details and channel-by-channel coverage were not supplied. Live-only
application and rebuild on the base APK also succeeded. On 2026-09-23 the user
authorized promoting both playback patches from experimental to stable and
default-enabled. Do not imply comprehensive device/channel coverage.
