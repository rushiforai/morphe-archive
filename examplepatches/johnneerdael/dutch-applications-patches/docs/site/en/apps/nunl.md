# NU.nl

**Supported app:** 26.9.0 · **Build:** 210156 · **Input:** APKS

`nl.sanomamedia.android.nu`

[Download the original APKS](https://buzzheavier.com/bdaekl17vud0){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

The inspected NU.nl app sends data about screens and sessions to the publisher’s tracking system. Its content server also handles acknowledgements needed to finish first-run setup. Reading, watching videos and completing setup therefore involve different systems.

## What did we find in the app? {#what-activity-is-recorded-in-the-inspected-paths}

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| [Snowplow/publisher tracking](../trackers/snowplow.md) | The publisher tracking integration receives data about installation, sessions, screens, geography and deep links. A persistent UDS header allows further linking. | The patch suppresses the identified sending methods, startup code, identifiers and tracking header. |
| Audience and feedback | The code review traced Comscore/Nobo audience measurement and [Usabilla](../trackers/usabilla.md) events and measurement data. | Initialization, dispatch and the identified queue processing and sending methods stop. |
| Video, surveys and embedded web pages | [JWPlayer](../trackers/additional-services.md#media-telemetry) metrics, [BrandMetrics](../trackers/additional-services.md#experiments-and-surveys), experiments and web destinations for diagnostic data were identified. | Known web requests and the identified methods that send measurement data from the app stop. Not every field sent to external services was captured. |
| First-run acknowledgements | `graph.nu.nl` supplies content and receives three necessary acknowledgements that setup cards have been completed. | These remain; the patch suppresses unrelated tracking events sent through the content server. |

## What remains and what is still unknown

Content, browsing between pages, cookies needed by the service, login, and push, installation and DPNS registration remain.

If you skip first-run setup, you can still choose topics and open account, privacy and notification settings yourself. This option cannot recover NU+ text withheld by the server. Use the original Android 12L+ Play split set.

## Available controls

Disable tracking, Hide Premium banner, Hide ads, Skip consent screens.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 28 October 2026 against main `6102fa9`: [technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/NUNL_TRACKING_AUDIT.md) and [source catalogue](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md). Code inspection shows how the inspected code handles events and data. Device tests establish the behaviour checked on those devices. This guide includes no additional captured network traffic. [How to read the evidence](../reference/methodology.md).
