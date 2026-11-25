# Voetbal International

Version-specific source/SDK/configuration evidence is not a packet capture showing that every listed host received data. [All app READMEs](../README.md).

Version **5.13.52**. The four controls and publisher-marketing follow-up are in the verified v1.12.0-dev.2 build. The user approved Voetbal International for publication on main on 29 October 2026.

<details>
<summary>Tracking destinations, collected data and patch effects</summary>

| Destination | Purpose and data in the inspected path | Status / functional boundary |
| --- | --- | --- |
| `pxr.blueconic.net` | **Traced startup CDP and screen/profile paths:** audience/profile/identity processing. Exact transmitted payloads are not captured. | The development implementation blocks the inspected initialization, screen/profile and objective entries. Genuine account and purchase state remains. |
| `b.scorecardresearch.com`, `udm.scorecardresearch.com`, `sb.scorecardresearch.com` | **Traced Comscore integration / SDK destinations:** audience initialization, views and automatic updates. | The development implementation blocks app measurement entries and the independent comScore connection method, including retained measurement attempts. |
| `app-measurement.com`, `firebase-settings.crashlytics.com` | **SDK endpoint and traced measurement/settings code:** app/event measurement, session/crash infrastructure and SDK settings. Exact transmitted values were not captured. | The development implementation blocks the inspected measurement HTTP paths, collection overrides and known stored telemetry. Settings/configuration and functional Firebase authentication/push services can still connect; this is not a blanket Firebase network block. |
| `prd.jwpltx.com`, `ping-origin-prd.jwpltx.com`, `ping-meta-prd.jwpltx.com`, `placement-prd.jwpltx.com` | **Traced JW analytics integration / beacons:** viewing/player measurement and plugin/container setup. | The development implementation blocks automatic and explicit analytics plugin activation and its fallback selection. `ssl.p.jwpcdn.com` and `entitlements.jwplayer.com` still provide functional player resources/licensing. |
| `ads.nextday.media`; config-selected Google IMA/NextGen ad hosts | **Actual remote ad configuration and traced ad consumers:** display/interstitial/feed/single-video advertising and associated ad context. Creative/wrapper hosts vary. | The development implementation blocks the inspected display/video ad activation. Native interstitial dismissal and cancellation still navigate normally. Creative hosts vary; server-inserted media ads remain unverified. A bundled Survicate endpoint is not an active survey path because the app module is a no-op. |
| `pb-api.vi.nl/edition/200/curation` | **Anonymous response observed on 29 October:** the functional home-feed response included five `marketingBlock` records, including the reported print-special promotion. Campaign text, images and purchase destinations are configured per record. This response observation does not establish tracking uploads to those creative destinations. | Hide ads filters the native Marketing type before the grid and stops the dedicated renderer before image/button setup. The shared news API remains available; blocking its entire host would also break content.  |
| `pb-api.vi.nl`, `sportdata.vi.nl`, `socket-server.voetbalprimeur.nl`, `vns.vi.nl` | **Functional services:** list/article/auth/scope, live scores and push. The public PRO route returned a teaser/paywall. The shipped app-header route subsequently supplied a substantial body and gated media/images for two sampled articles. | The development implementation delivers full bodies through the shipped PXR request path and removes the inspected locked overlays. Media playback remains unverified. Actual account, purchase and authentication state is preserved. `tracking.vi.nl` serves email verification and must not be blocked merely because of its name. |

</details>

The tracking-only APK passed source and emitted-code checks for provider defaults,
advertising identifiers, native error callbacks and known stored telemetry.
Unknown transport names, functional Google/push services and remote web content
remain outside a claim of complete suppression. Phone acceptance is pending.

Skip consent screens stops startup and manual advertising-consent forms before
display. It preserves the native age check and does not save acceptance,
rejection or an age choice. All four controls are enabled by default.
