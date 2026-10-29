# Buienradar

**Supported app:** 7.4.8 · **Build:** 7897 · **Input:** APKM

`com.supportware.Buienradar`

[Download the original APKM](https://buzzheavier.com/v4m79608e677){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

Buienradar uses separate services to measure activity such as radar lookups, video playback and returns to a screen. Weather alerts share infrastructure with the Swrve software for contacting users. Disabling Swrve and location uploads also disables weather push alerts.

## What did we find in the app? {#what-activity-is-recorded-in-the-inspected-paths}

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| [Snowplow](../trackers/snowplow.md) | The code records screen, element, purchase, radar-location and login events, along with install-referrer and lifecycle tracking. Two collectors are configured for RTL and DPG. | Disable tracking prevents creation of both trackers and stops the app from sending these events. |
| [Kantar/NMO](../trackers/kantar-nmo.md) | The audience plugin sets `cs_fpid` to the Snowplow user ID in a ping to `nmortlendpoint.2cnt.net`. | This stops with Snowplow. The code review traced this identifier link, but does not give a complete record of pings actually sent. |
| [Bitmovin](../trackers/bitmovin.md) and [Smartocto](../trackers/additional-services.md#editorial-analytics) | The player uses video analytics; a separate [Smartocto](../trackers/additional-services.md#editorial-analytics) listener issues video-play pings. | The components that collect video measurements and send playback-start pings stop. Content playback and Bitmovin licensing remain. |
| [Usabilla](../trackers/usabilla.md) | Usabilla collects measurement data and starts campaigns in response to events. You can also open a feedback form yourself. | Automatic recording and events stop; feedback you submit yourself remains. |
| [Swrve](../trackers/swrve.md) and location | The code review traced device and session properties, and background uploads of latitude, longitude and the Swrve user ID. | These remain by default. A separate control, disabled by default, removes them and disables all weather push alerts. |
| [OneTrust](../trackers/onetrust.md) and [Firebase](../trackers/firebase.md) | Consent configuration, geolocation and operational requests for installation, push and configuration remain. | Automatic prompts can be skipped; privacy settings you open yourself and alert infrastructure remain. |

## What remains and what is still unknown

Disable tracking preserves Swrve and background location uploads. The separate Disable Swrve and location upload control is disabled by default. Enabling it also disables push alerts for rain, air quality, barbecue weather and daily forecasts.

Weather, radar, videos, login and genuine billing remain. The original Android 9+ APKM includes base, ABI and density splits. The research does not establish that all network traffic has stopped.

## Available controls

Disable Swrve and location upload, Disable tracking, Hide Premium banner, Hide ads, Skip consent screens.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 28 October 2026 against main `6102fa9`: [technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/docs/BUIENRADAR_TRACKING_AUDIT.md) and [source catalogue](https://github.com/johnneerdael/dutch-applications-patches/blob/6102fa9/README.md). Code inspection shows how the inspected code handles events and data. Device tests establish the behaviour checked on those devices. This guide includes no additional captured network traffic. [How to read the evidence](../reference/methodology.md).
