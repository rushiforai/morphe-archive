# Trouw

**Supported app:** 7.53.1 · **Build:** 23136515 · **Input:** APKS

`be.persgroep.android.news.mobiletr`

[Download the original APKS](https://buzzheavier.com/30zwvpz9wqse){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

Opening an article can generate publisher events, audience counts and records of screen interactions. For audio, there are both optional measurements of your actions and requests that manage the playback queue. The newspaper apps use similar code, but their patches cover different things.

## What did we find in the app? {#what-activity-is-recorded-in-the-inspected-paths}

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| [Snowplow](../trackers/snowplow.md) and publisher events | The app uses identifiers when sending app, screen and reading events. | The patch disables the identified sending methods and queues, along with known web collection endpoints. |
| [Contentsquare / Heap](../trackers/contentsquare-heap.md) | Measurements of screen and component changes, interactions, identity and properties, and measurement code in embedded web pages were traced in code or covered by web-request rules. | The identified initialization, recording, uploads and data transfer between the app and web content stop. |
| Audience and feedback services | [Gemius](../trackers/additional-services.md#audience-measurement), [Comscore](../trackers/additional-services.md#audience-measurement) and Piano/Cxense measure audience, pageviews and conversions. The audit of this app also found automatic [Usabilla](../trackers/usabilla.md) events. | The identified sending methods in the app and web pages stop. The app still receives the expected signals that processing has finished. |
| Audio and video | Independent [Amalia](../trackers/additional-services.md#media-telemetry) measurements record player events. Other requests manage the audio queue and send regular playback status updates (heartbeats). | Video measurements are disabled. The independent audio sender remains outside patch coverage and needs further research. |
| Advertising-effectiveness surveys | The web-request rules name known domains for analytics, experiments and ad measurement. This does not establish that they were all active. | Known requests covered by those rules are blocked. Parool’s additional host coverage does not automatically apply to this app. |

## What remains and what is still unknown

[Catsure](../trackers/additional-services.md#media-telemetry) still sends requests for the queue and regular status updates (heartbeats). They carry a device ID, audio items in playback order, media identifiers, position and playback state. Too little is known about their effects on server functions to remove these requests.

Services for content, login, push, configuration, newspapers and PDFs still use genuine server results. Read full articles preserves received text during the marketing flow. It does not register a purchase or grant access rights on the server. Use the original Android 12L+ Play split set.

## Available controls

Disable tracking, Hide Premium banner, Hide ads, Read full articles, Skip consent screens.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 28 October 2026 against main `6102fa9`: [technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/trouw-audit.md) and [source catalogue](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md). Code inspection shows how the inspected code handles events and data. Device tests establish the behaviour checked on those devices. This guide includes no additional captured network traffic. [How to read the evidence](../reference/methodology.md).
