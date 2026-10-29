# Buienradar

Version-specific source/SDK/configuration evidence is not a packet capture showing that every listed host received data. [Evidence notes](../../TRACKING_DESTINATIONS.md) · [All app READMEs](../README.md).

Use the APKMirror APKM (base plus ABI and density splits, Android 9+). Hide ads and Hide Premium banner come from the former [buienradar-patches](https://github.com/johnneerdael/buienradar-patches) repository, with additions.

| Patch | Effect |
| --- | --- |
| Hide ads | Removes the feed ad slots and video pre-rolls, and does not start the Google Mobile Ads SDK. |
| Hide Premium banner | Hides the Premium promotion blocks on the Today and Info tabs and the Buienradar Plus trial notification. |
| Disable tracking | Disables Snowplow (RTL, DPG Media and the Kantar ping), Firebase Analytics, Crashlytics and Sessions, Smartocto and Bitmovin video analytics, Usabilla telemetry and campaigns, and advertising/attribution IDs. Weather alerts keep working. |
| Skip consent screens | Skips the first-run Pay-or-OK choice and the OneTrust cookie banner. Records no consent choice; Privacy settings on the Info tab remain available. Includes Disable tracking and Hide ads. |
| Disable Swrve and location upload | **Off by default.** Replaces Swrve with its built-in no-op and stops the background location upload. Buienradar delivers all weather alerts through Swrve, so this disables push alerts. Includes Disable tracking. |

<details>
<summary>Tracking destinations, collected data and patch effects</summary>

| Destination | Purpose and data in the inspected path | Patch effect / remaining exposure |
| --- | --- | --- |
| `nl-rtl-prod1.collector.snplow.net`, `c.dpgmedia.net` | **Traced:** screen/element/funnel, purchase, radar-location and login events, install-referrer and lifecycle tracking. | Snowplow creation and app dispatch stopped by Disable tracking. |
| `nmortlendpoint.2cnt.net` | **Traced:** Kantar/NMO audience ping includes `cs_fpid`, the Snowplow user ID, linking measurement to that identifier. | Stops with the Snowplow tracker. |
| `ingestion.smartocto.com`, `analytics-ingress-global.bitmovin.com` | **Traced:** video-play pings and player/source analytics. | Collectors disabled; Bitmovin licensing and content playback retained. |
| `sdk.out.usbla.net` | **Traced:** Usabilla telemetry and event-triggered campaigns. | Telemetry and automatic events stopped; manual feedback remains. |
| `userapi.buienradar.nl/2.0/userlocation` and Swrve (upload host not pinned) | **Traced, retained by default:** background latitude/longitude plus Swrve user ID; Swrve also receives device profiles, sessions and properties such as dark mode/subscription status. | Only the separate, default-off Disable Swrve and location upload control stops these paths; it also disables weather alerts. |
| `mobile-data.onetrust.io`, `geolocation.1trust.app` | **Retained:** OneTrust consent configuration/geolocation service requests. | Manual privacy depends on this setup. Firebase configuration/installation/push also remain; their IDs are not a claim of anonymity. |

</details>
