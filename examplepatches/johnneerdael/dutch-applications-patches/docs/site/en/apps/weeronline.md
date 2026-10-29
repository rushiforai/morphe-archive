# Weeronline

**Supported app:** 3.61.0 · **Build:** 2030006811 · **Input:** APKS

`com.xs2theworld.weeronline`

[Download the original APKS](https://buzzheavier.com/mj9n1s9e3ihs){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

The inspected Weeronline version delivers weather data and uses services for advertising, video statistics, consent and subscriptions. A hostname can serve several purposes. The patches therefore block specific requests while retaining other functions on the same host.

## What did we find in the app? {#what-activity-is-recorded-in-the-inspected-paths}

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| [Firebase](../trackers/firebase.md) and [Meta](../trackers/meta.md) | The code review traced app, screen and purchase events, properties and linked identifiers. Facebook Graph also supplies Instagram content used by the app. | Optional collection stops, including attempts to re-enable it. The Graph host is not blocked entirely. |
| Advertising identifiers and PubMatic | The app supplies PPID and ad ID to advertising functions. The SDKs contain destinations for auctions and profiling. The data sent to each host was not captured. | The patch suppresses ad setup and the supply of the identified identifiers. |
| [Blue Billywig](../trackers/additional-services.md#media-telemetry) video statistics | The app separately sends video statistics to `stats.bluebillywig.com`. | Statistics stop while video playback remains. |
| [RevenueCat](../trackers/revenuecat.md) and [Didomi](../trackers/didomi.md) | These services include optional Firebase-instance linkage, diagnostics and consent measurements alongside purchases and privacy settings you open yourself. | The optional measurements stop; genuine purchase, customer and consent services remain. |

## What remains and what is still unknown

Weather, Maps, notifications, configuration and billing remain. A first-party advice API receives a Firebase installation ID, and notification services still exchange registration metadata.

Unlock Plus changes the audited decisions in the app about which features are available. It does not change Play purchase records or guarantee that the server delivers the associated content. Use the original Android 8+ Play split set.

## Available controls

Disable tracking, Hide Premium banner, Hide ads, Skip consent screens, Unlock Plus.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 28 October 2026 against main `6102fa9`: [technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/WEERONLINE_TRACKING_AUDIT.md) and [source catalogue](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md). Code inspection shows how the inspected code handles events and data. Device tests establish the behaviour checked on those devices. This guide includes no additional captured network traffic. [How to read the evidence](../reference/methodology.md).
