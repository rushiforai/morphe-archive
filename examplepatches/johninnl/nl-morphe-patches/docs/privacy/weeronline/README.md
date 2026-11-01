# Weeronline

Version-specific source/SDK/configuration evidence is not a packet capture showing that every listed host received data. [All app READMEs](../README.md).

Use the Play Store split APK set (base plus ABI, language and density splits, Android 8+).

| Patch | Effect |
| --- | --- |
| Hide ads | Removes banner, sticky, feed, news, interstitial and sponsored ads, reserved banner space and video ads, and does not start Google Mobile Ads, Audience Network or the PubMatic app setup. |
| Hide Premium banner | Hides the Plus menu entry, the startup Plus screen, the app-launch promotion paywall, the Plus screen opened after declining consent, and the Plus footer in tile settings. |
| Disable tracking | Disables Firebase Analytics, Crashlytics, Performance, Sessions and In-App Messaging, the Facebook SDK and app events, Audience Network, the cross-app PPID, advertising IDs, Blue Billywig statistics, Tag Manager, Didomi metrics and optional RevenueCat telemetry. |
| Skip consent screens | Skips the cookie onboarding page, the automatic Didomi consent notice and the consent-or-pay wall. Records no consent choice; Privacy settings in the menu remain available. Includes Disable tracking and Hide ads. |
| Unlock Plus | Unlocks locally enforced Plus features, including paid dashboard tiles, tile visibility and reordering, rain notifications for saved locations, and ad-free presentation. Does not create a Play Store purchase or guarantee server-side notification delivery. |

The Buienalarm and Buienradar patches do not unlock paid Plus or Premium features.

<details>
<summary>Tracking destinations, collected data and patch effects</summary>

| Destination | Purpose and data in the inspected path | Patch effect / remaining exposure |
| --- | --- | --- |
| `app-measurement.com`, `www.google-analytics.com`, `ssl.google-analytics.com` | **SDK endpoints with traced app integration:** analytics events, screens/user properties and advertising/identifier linkage; GTM supplies analytics tags. | App and SDK collection disabled; bundled GTM container removed. |
| `graph.facebook.com` (SDK also constructs regional Graph hosts) | **Traced app integration; shipped SDK destination:** app and purchase events, anonymous/advertiser IDs and consent-driven collection re-enablement. This host also serves functional Instagram content; a whole-host DNS block would be broader than this patch. | Facebook startup, event and purchase paths disabled. Audience Network payloads removed. |
| `ads.pubmatic.com`, `ow.pubmatic.com`, `owsdk.pubmatic.com` | **Shipped ad-SDK destinations:** ad requests/auctions, device profiling and ad measurement. The app provides a cross-app PPID/ad ID to advertising paths; the exact payload sent to each host is not captured. | Hide ads gates PubMatic setup; Disable tracking suppresses PPID/ad-ID acquisition. These findings do not establish every auction partner was contacted. |
| `stats.bluebillywig.com` | **Traced sender:** video statistics, separate from the video stream. | Statistics sender stopped; playback retained. |
| `api-diagnostics.revenuecat.com`, `api.revenuecat.com`, `api-paywalls.revenuecat.com` | **SDK endpoints:** diagnostics, subscription/paywall services; app also supplies a Firebase instance-ID attribute. | Diagnostics and optional Firebase attribute stopped. Real purchases, customer identity and paywall events on retained purchase services remain. |
| `sdk.privacy-center.org`, `mobile-2470.api.privacy-center.org` | **SDK configuration/API destinations:** consent setup and interactions; Didomi has separate performance/usage metrics. | Optional metrics disabled. Functional consent API traffic remains; not every request to these hosts is tracking. |
| `firebase-settings.crashlytics.com` | **SDK configuration host, not the crash-upload endpoint:** Crashlytics configuration. Traced app paths also forward diagnostic logs and force-enable collection. | Diagnostic collection disabled. The exact diagnostics upload destination is not pinned here; Firebase installation/configuration/push remain. |
| `notifyhub.infoplaza.io`, `fcmregistrations.googleapis.com`, `*.weeronline.cloud`, `*.meteoplaza.com`, `imn-rust-lb.infoplaza.io` | **Retained services:** notification registration, requested weather/location data and configuration. The first-party advice API receives a Firebase installation ID. | Functional weather/push retained; patches do not remove every service identifier or all first-party data exchange. |

</details>
