# HLN

**Supported app:** 9.22.0 · **Build:** 2009220000 · **Input:** APKS · **Channel:** Pre-release

`be.persgroep.android.news.mobilehln`

[Use your own APKS](../guides/downloads.md#local-original-inputs){ .md-button }

Select this file in Morphe Manager to apply the patches.

Use the original Android 12L+ Play split set. The five prerelease controls passed original-input and every-selection plus combined output verification, including the added Catsure upload stops. Device validation remains unverified.

The inspected app contains advertising, audience measurement and separate audio/video analytics. Its account and notification services also contain measurement paths. The controls target those paths while preserving genuine login, account state, push delivery and player synchronization.

These controls are available in [pre-release v1.20.0-dev.4](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.20.0-dev.4).

## What did we find in the app? {#what-activity-is-recorded-in-the-inspected-paths}

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Advertising | Banner technologies, video and game prerolls, advertorials, and Deals, Shop and Games promotional cards are present. | Hide ads removes the identified commercial surfaces and uses the game's existing error continuation. Editorial articles and media stay. |
| [Snowplow](../trackers/snowplow.md), [Comscore](../trackers/additional-services.md#audience-measurement), [Firebase](../trackers/firebase.md), Facebook and Piano/Cxense | Static call tracing identifies event collectors, queued sends, advertising identifiers and collection re-enable paths. | Disable tracking stops the inspected boundaries, including the Piano scheduler and optional in-app messaging. |
| Gemius CIM | HLN initializes the audience SDK and sends events; video models also enable measurement. | Initialization, event sending and the video measurement flags are suppressed. |
| Independent audio/video telemetry | The audio path builds `tracker.prd.dpge.be/track`; video analytics uses `/api/v1/events/video.analytics.v1`. | Both inspected collectors complete locally with their genuine result types. Local queue publication, persistence and player state remain. |
| Catsure playback and queue reporting | The heartbeat and queue-sync jobs discard their server responses; local queue state is published and persisted independently. | Stop those two detached uploads and their device-ID lookup; keep local queue, radio, car and account logic. |
| Marketing templates and consent screens | Two marketing paths return different completed results; startup onboarding can open consent, login and topic prompts. | Empty marketing results suppress their requests. Skip consent screens advances through the existing guest route and leaves notification/newsletter choices off until manually enabled. |

## What remains and what is still unknown

Read full articles requests the complete representation through the app's existing article API. It cannot supply text withheld by the server, unlock a paid account or grant newspaper access. Anonymous premium article delivery on HLN has not been verified.

Stopping the two [Catsure](../trackers/additional-services.md#media-telemetry) uploads removes outbound playback-position and queue reporting. Cross-device behavior and server effects are untested. Account, article, notification, radio and media services continue exchanging the data needed for their functions. Remote scripts, effective server configuration and complete network silence have not been tested. No patched build has been installed for this audit.

## Available controls

Disable tracking, Hide Premium banner, Hide ads, Read full articles, Skip consent screens.

All five controls are enabled by default. Disable tracking includes Hide ads; Skip consent screens includes both.

[Control definitions for this prerelease](https://github.com/johnneerdael/dutch-applications-patches/blob/v1.20.0-dev.4/docs/site/en/reference/catalogue.md).

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 30 October 2026: [HLN technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/f55de86/docs/hln-audit.md). The original passes the retained-contract verifier and each effect was shown RED before implementation. All five individual selections and the combined selection passed Morphe FULL validation, signature checks and independent decoded effect/retained-behavior verification. This does not establish device behavior or network silence. [How to read the evidence](../reference/methodology.md).
