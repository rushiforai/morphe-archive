# FTM

**Supported app:** 2.6.8 · **Build:** 58 · **Input:** APKS

`nl.ftm.ftmpulse`

[Download the original APKS](https://buzzheavier.com/2cv2n5bgc3tn){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

FTM displays its live website inside the app. The privacy review therefore follows both the Android app and the website’s scripts and storage. One of the inspected measurements records which article’s comments became visible.

## What did we find in the app? {#what-activity-is-recorded-in-the-inspected-paths}

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| [Matomo](../trackers/additional-services.md#publisher-measurement) at `insight.ftm.nl` | The inspected code sends measurements about pages, errors and events. | The patch blocks the host receiving these measurements and its subdomains inside the app’s embedded browser (WebView). |
| [Eventor](../trackers/additional-services.md#publisher-measurement) at `eventor.ftm.nl` | The inspected code uses five local-storage keys for event uploads and identifier updates. | The patch stops requests and deletes the five keys once the page has loaded. The keys can still be created temporarily before the patch deletes them. |
| Sentry/GlitchTip diagnostics | The inspected code sends errors and diagnostic data to `glitchtip.ftm.nl`. | The patch blocks this host and its subdomains in the WebView. |
| [ActiveCampaign](../trackers/additional-services.md#publisher-measurement) and comments visibility | The audit identified a loader and the exact numeric-ID `/activecampaign/event/create/view_comments/{id}` route. | The patch blocks the identified loader, data-collection endpoint and exact route; comments and forms you fill in yourself remain. |

## What remains and what is still unknown

Articles, audio, accounts, history and functional push remain. The website can change without an APK update.

Read full articles preserves text already supplied by the website. Guest access to articles and podcasts was tested, but this does not guarantee the same access in every future server response. The blocking rules apply only to the app’s embedded browser, not external browsers. Use the original Android 12L+ Play split set.

## Available controls

Disable tracking, Hide Premium banner, Hide ads, Read full articles, Skip consent screens.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 28 October 2026 against main `6102fa9`: [technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/FTM_TRACKING_AUDIT.md) and [source catalogue](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md). Code inspection shows how the inspected code handles events and data. Device tests establish the behaviour checked on those devices. This guide includes no additional captured network traffic. [How to read the evidence](../reference/methodology.md).
