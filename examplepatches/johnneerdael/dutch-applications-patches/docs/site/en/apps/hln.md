# HLN

**Supported app:** 9.22.0 · **Build:** 2009220000 · **Input:** APKS

`be.persgroep.android.news.mobilehln`

[Download the original APKS](https://buzzheavier.com/0p35mq8c5mu7){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

Use the original Android 12L+ Play split set. The final emitted output passed all five individual controls and their combined selection. With that candidate installed, the HLN home opened without the earlier recommendation-consent warning. The owner subsequently approved HLN for stable release after testing the candidate. These observations do not establish every remote campaign response.

The inspected app contains advertising, audience measurement and separate audio/video analytics. Its account and notification services also contain measurement paths. The controls target those paths while preserving genuine login, account state, push delivery and player synchronization.

## What did we find in the app? {#what-activity-is-recorded-in-the-inspected-paths}

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Advertising | Banner technologies, video and game prerolls, advertorials, and Deals, Shop and Games promotional cards are present. | Hide ads removes the identified commercial surfaces and uses the game's existing error continuation. Editorial articles and media stay. |
| [Snowplow](../trackers/snowplow.md), [Comscore](../trackers/additional-services.md#audience-measurement), [Firebase](../trackers/firebase.md), Facebook and Piano/Cxense | Static call tracing identifies event collectors, queued sends, advertising identifiers and collection re-enable paths. | Disable tracking stops the inspected boundaries, including the Piano scheduler and optional in-app messaging. |
| Gemius CIM | HLN initializes the audience SDK and sends events; video models also enable measurement. | Initialization, event sending and the video measurement flags are suppressed. |
| Independent audio/video telemetry | The audio path builds `tracker.prd.dpge.be/track`; video analytics uses `/api/v1/events/video.analytics.v1`. | Both inspected collectors complete locally with their genuine result types. Local queue publication, persistence and player state remain. |
| Catsure playback and queue reporting | The heartbeat and queue-sync jobs discard their server responses; local queue state is published and persisted independently. | Stop those two detached uploads and their device-ID lookup; keep local queue, radio, car and account logic. |
| Marketing templates and consent screens | The legacy free-login section marketing, startup prompts and personalisation warning are separate UI paths. | The legacy marketing resolver returns its supported disabled result. Skip consent screens suppresses the personalisation warning without setting consent; the genuine provider and guest route remain in control. |
| Companion campaign widget | The scoped filter recognizes the observed companion widget class or dated Valley campaign URL on HTML teaser carriers. | Matching carriers are filtered under Hide ads; unrelated HTML and editorial siblings remain eligible. The owner accepted the tested candidate; unobserved remote campaign behavior remains outside that acceptance. |

## What remains and what is still unknown

Read full articles requests the complete representation through the app's existing article API. It cannot supply text withheld by the server, unlock a paid account or grant newspaper access. Anonymous premium article delivery on HLN has not been verified.

Stopping the two [Catsure](../trackers/additional-services.md#media-telemetry) uploads removes outbound playback-position and queue reporting; cross-device behavior and server effects remain untested. The warning-free home/article screens do not show that personalisation consent was granted: the genuine provider still controls consent, and the original consent check prevents recommendation requests while consent is false. Article access, remote scripts, effective server configuration and complete network silence remain outside these UI observations.

## Available controls

Disable tracking, Hide Premium banner, Hide ads, Read full articles, Skip consent screens.

All five controls are enabled by default. Disable tracking includes Hide ads; Skip consent screens includes both.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 30 October 2026: [HLN technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/main/docs/hln-audit.md). The original passes the retained-contract verifier and each effect was shown RED before implementation. All five individual selections and the combined selection passed Morphe FULL validation, signature checks and independent decoded effect/retained-behavior verification. These output checks are separate from the phone observations above and do not prove complete network silence. [How to read the evidence](../reference/methodology.md).
