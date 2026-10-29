# Weerplaza

**Supported app:** 3.13.1 · **Build:** 734 · **Input:** APKS

`nl.weerplaza.app`

[Download the original APKS](https://buzzheavier.com/cr9f6qs8tfsh){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

Weerplaza contains Android components and web content in an embedded browser. This browser can load a new analytics script without a change to the installed APK. The research therefore treats collection inside the app separately from the known web requests covered by the patch.

## What did we find in the app? {#what-activity-is-recorded-in-the-inspected-paths}

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Google tags and photo measurement | Fetched web content contains a GTM/GA tag and a Plausible-style photo script using `analytics.infraloods.nl`. | The blocking rules cover known data-collection and script requests. This does not prove that an upload completed in every session. |
| Video, audience and error services | The audited blocking rules cover [Blue Billywig](../trackers/additional-services.md#media-telemetry), ScorecardResearch, Sentry/error reporting and PushAlert destinations. | Known requests from the embedded browser (WebView) and the identified collection and upload methods in the app stop. The exact data sent to external services remains unverified. |
| [Didomi](../trackers/didomi.md) and authentication diagnostics | Specific `/v1/events`, `/v1/sync` and authentication-log routes have measurement roles. | The patch blocks these specific routes; other authentication and privacy functions remain. |
| Advertising and identifiers | The audit identified ad loaders in the app, video ads, PPID and ad IDs, and web ad loaders. | The selected controls stop those advertising functions and remove the space reserved for them. |

## What remains and what is still unknown

Weather, radar, Maps, real purchases and functional push remain. The compatibility patch supplies the authorised community Maps key. Map requests still leave the app. The user confirmed that radar works; this was not a complete audit of decrypted network traffic. Use the original Android 8+ Play split set.

## Available controls

Disable tracking, Fix Google Maps, Hide Premium banner, Hide ads, Skip consent screens.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 28 October 2026 against main `6102fa9`: [technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/WEERPLAZA_TRACKING_AUDIT.md) and [source catalogue](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md). Code inspection shows how the inspected code handles events and data. Device tests establish the behaviour checked on those devices. This guide includes no additional captured network traffic. [How to read the evidence](../reference/methodology.md).
