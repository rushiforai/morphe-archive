# Videoland Android TV candidate

Build separate experimental ad and tracking controls for the supplied publisher-signed
`nl.rtl.videoland.v2` TV APKS, version 1.117.0, code 1622, minSDK 24. The user
will test the finished APK. Keep the original input and split set outside Git.

Use the existing Kotlin Morphe patch architecture, exact method contracts and
original-input signer/version guard. Both controls default on after user-confirmed
Premium playback and the user's request for normal Simple-mode controls. Request
ad-supported feedback in the dev guide. No entitlement, subscription,
authentication or DRM edits.

## Approaches and decision

- Chosen implementation: return the inspected ad requesters' normal empty results
  before HTTP or macro processing. Pin the optional ad-loader switch off; suppress
  legacy and current pause ads. Return null from Yospace resource creation so the
  unchanged live queue uses its supplied fallback asset when available.
- SDK-wide no-ops: rejected because they can abandon player completion and do not
  establish that server-stitched media is removed.
- Generic manifest/segment filtering: deferred until real playback evidence identifies
  a stream format and timeline. No invented Yospace origin URLs or deleted segments.

Tracking uses the application's Tealium/Snowplow/NPAW activation boundaries,
Tealium event sinks, the advertising-ID source's existing limited result, New
Relic startup, automatic Firebase/Facebook flags, and CCT's typed fatal response
for persisted telemetry batches. Stop Snowplow construction only after Object
initialization and its three required dependency field assignments. Preserve
functional consent, Firebase configuration/messaging, account, progress and media.

## PairIP finding

Seen: four ordinary DEX files; only baseline profile assets; the supplied ABI split
contains only `libandroidx.graphics.path.so`. No PairIP classes, VM assets or native
library found in any supplied split. PairIPFix has no identified target here.
Re-signed application startup and paid-account playback still require acceptance.

## Validation

Build the bundle; patch ad-only, tracking-only and combined selections in FULL mode.
Decode real outputs and compare every original method, permitting only the owned
insertions and known DEX alignment padding. Compare all manifest content except the
explicitly owned permissions/provider/flags. Check signer and stock-input rejection.
Verify config-key handling delegates unknown keys to the original implementation,
including remote overrides. Keep original method tails for preservation checks.

Delivery is an experimental signed APK and patch bundle with hashes and a short
test guide. User playback acceptance must cover an ad-supported account, preroll,
midroll, seeking, subtitles, pause/resume and live transitions. Static checks do
not prove server-side ad removal or complete tracking silence.
