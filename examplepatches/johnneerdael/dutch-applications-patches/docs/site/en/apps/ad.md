# AD

**Supported app:** 9.22.0 · **Build:** 9220000 · **Input:** APKS

`be.persgroep.android.news.mobilead`

[Download the original APKS](https://buzzheavier.com/mqhxrgsf0wdu){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

The inspected AD version links reading and playback to publisher statistics, audience measurement and customer data. Privacy and login components also contain measurement functions. The patches stop those measurements while keeping essential account operations working.

## What did we find in the app? {#what-activity-is-recorded-in-the-inspected-paths}

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| [Snowplow](../trackers/snowplow.md), [Comscore](../trackers/additional-services.md#audience-measurement) and [Firebase](../trackers/firebase.md) | The code review traced publisher events, audience measurement and app analytics that link identifiers. | The patches suppress the identified configuration and sending methods, including queued sends and attempts to re-enable measurement. |
| Piano/Cxense and [Usabilla](../trackers/usabilla.md) | These services record pageviews, queue customer and audience events, and collect automatic feedback events and custom variables. | The identified senders and scheduled tasks stop; login and feedback you submit yourself remain. |
| Independent audio and video telemetry | The video route includes `/api/v1/events/video.analytics.v1`; the independent audio `/track` sender is a separate path. | Video telemetry stops. The independent audio sender falls outside patch coverage and still needs privacy research. |
| PrivacyGate and login diagnostics | The same service families handle measurement, consent and authentication. | Measurement methods stop; consent, login and token refresh remain. |

## What remains and what is still unknown

[Catsure](../trackers/additional-services.md#media-telemetry) still coordinates audio using device, player and queue state. Its effects on server functions have not yet been classified.

Editorial `valley.*` embeds also remain. Their name alone is insufficient to classify them as tracking. Article, account and notification services still exchange data.

Article controls preserve content already supplied and do not grant access rights. Use the original Android 12L+ Play split set.

## Available controls

Disable tracking, Hide Premium banner, Hide ads, Read full articles, Skip consent screens.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 28 October 2026 against main `6102fa9`: [technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/AD_PATCH_AUDIT.md) and [source catalogue](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md). Code inspection shows how the inspected code handles events and data. Device tests establish the behaviour checked on those devices. This guide includes no additional captured network traffic. [How to read the evidence](../reference/methodology.md).
