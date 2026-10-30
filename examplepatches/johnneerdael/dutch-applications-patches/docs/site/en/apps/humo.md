# Humo

**Supported app:** 7.53.1 · **Build:** 23136515 · **Input:** APKS · **Channel:** Pre-release

`be.humo.tvgids`

[Use your own APKS](../guides/downloads.md#local-original-inputs){ .md-button }

Select this file in Morphe Manager to apply the patches.

Humo is the DPG magazine edition app; its package name still contains “tvgids”. The patches remove the identified ad requests, optional measurement and automatic setup prompts. Reading improvements apply to article data already supplied by the server; anonymous access to every premium article has not been established for this app.

These controls are available in [pre-release v1.20.0-dev.4](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.20.0-dev.4).

## What did we find in the app? {#what-activity-is-recorded-in-the-inspected-paths}

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Advertising in feeds, articles, video and games | Native loaders, explicit commercial article/feed components and video/game advertising-settings requests are separate paths. De Morgen's bundled configuration also enables Prebid bidding. | The identified requests and components stop. Original disabled/error callbacks let content continue; rewarded ads do not grant rewards. |
| [Snowplow](../trackers/snowplow.md), Firebase and publisher events | The inspected sending paths use app, screen, reading and identifier data. | The identified sending methods, queues, advertising identifiers and known web collectors stop. Push and configuration services remain. |
| [Contentsquare / Heap](../trackers/contentsquare-heap.md) | The app includes screen/interaction measurement, identity linkage and embedded-web instrumentation. | The identified startup, recording, upload and web integration stop while readiness still completes. |
| [Gemius](../trackers/additional-services.md#audience-measurement), Comscore, Piano/Cxense and Usabilla | Belgian brands select real Gemius audience and video measurement. Other traced paths measure pageviews, conversion and feedback events. | The identified collectors stop. The video integration uses the app's original no-op provider; completion callbacks remain. |
| [Catsure](../trackers/additional-services.md#media-telemetry) | Detached uploads contain device identity, ordered queue items and playback position/state. Their responses do not control the inspected local player or queue. | The two upload methods stop. Local queue publication and storage remain; outbound remote queue/playback synchronization stops. |
| Audio/video telemetry and BrandMetrics | Independent player interaction telemetry and `phx.bmtrcs.com` survey URLs are present in the inspected code/configuration. Configured hosts are not proof of captured requests. | The identified independent event senders stop. The web policy covers the `bmtrcs.com` family. |

## What remains and what is still unknown

[Catsure](../trackers/additional-services.md#media-telemetry) queue and heartbeat uploads stop. This removes the identified device, queue and playback-state reporting and disables outbound synchronization of that state across devices. Local queue storage remains; real playback and backend consequences still need device validation. Content, login, push, configuration and edition/PDF services continue using genuine server responses and necessary identifiers.

Read full articles lets received editorial content render without the marketing template. It does not create an account, purchase or server access right. Full premium article delivery without an account, edition downloads, remote HTML, server-stitched audio ads and re-signed device behavior remain unverified. Static checks do not prove that every possible tracking request has stopped. Use the exact original Android 12L+ split set shown above.

## Available controls

Disable tracking, Hide Premium banner, Hide ads, Read full articles, Skip consent screens.

All five controls are enabled by default. Disable tracking includes Hide ads; Skip consent screens includes both. Selecting Skip consent screens also stops the Catsure uploads and outbound queue/playback synchronization described above.

[Control definitions for this prerelease](https://github.com/johnneerdael/dutch-applications-patches/blob/v1.20.0-dev.4/docs/site/en/reference/catalogue.md).

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed on 30 October 2026: [technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/c2d8e30/docs/humo-audit.md) and [research record](https://github.com/johnneerdael/dutch-applications-patches/blob/c2d8e30/docs/research/2026-10-30/humo.md). Fresh original checks pass; all five selected effects fail on the original before implementation. Build and per-selection verification results are recorded in the audit. No phone install or network capture was performed for this work. [How to read the evidence](../reference/methodology.md).
