# Marktplaats (research only)

Version-specific source/SDK/configuration evidence is not a packet capture showing that every listed host received data. [Evidence notes](../../TRACKING_DESTINATIONS.md) · [All app READMEs](../README.md).

Version **16.17.0**. [Research evidence](../../research/2026-10-28/marktplaats.md). No controls published yet.

<details>
<summary>Tracking destinations, collected data and patch effects</summary>

| Destination | Purpose and data in the inspected path | Status / functional boundary |
| --- | --- | --- |
| `www.marktplaats.nl/metrics`, `/displays?platform=Android` | **Configured first-party measurements:** app metrics and advertising display measurement; ordinary listing/search/chat APIs share publisher hosts. | No control released yet. Seller listings are core content; they are not all third-party display ads. |
| `app.adjust.com` / `.io`, `gdpr.adjust.*`, `ssrv.adjust.*`; Facebook Graph hosts | **Traced attribution/event integration + SDK routes:** attribution, events and privacy/SDK transport; optional Facebook app events coexist with authentication. | No control released yet. Separate measurement from real login and privacy-request functionality. |
| `sdk.fra-02.braze.eu`; Datadog US1 (exact intake hostname not pinned) | **App-configured integrations:** marketing/profile/in-app and push engagement; RUM, traces and logs. Generic bundled EU/US endpoints are not proof of selected traffic. | No control released yet. Braze/Firebase push and marketplace account behavior need functional-consumer checks. |
| `ow.pubmatic.com/openrtb/2.5`, `ads.pubmatic.com`, `owsdk.pubmatic.com/crashanalytics`; `ib.adnxs.com/openrtb2/prebid` | **Traced OpenWrap / configured Prebid:** ad bids/config/rendering, device profiling and SDK crash/ANR reporting. Prebid demand execution is not established. | No control released yet. Google display/native creatives and remote verification can use additional hosts. |
| `s.userzoom.com`, `participant-eu.userzoom.com` and study/CDN/video hosts | **App-wired optional survey/study integration:** study/capture capabilities, not proof that a phone is continually recording. | No control released yet. Marketplace camera, chat and seller uploads must remain separate from optional study capture. |
| `app-measurement.com`; Firebase diagnostics; `cdn.privacy-mgmt.com` | **Traced measurement and SDK/CMP paths:** event ingestion, crash/performance/session data and consent configuration/decisions. Exact diagnostics upload hosts not pinned. | No control released yet; Sourcepoint completion and functional Firebase configuration/installation/push must be retained. |
| `faas.marktplaats.nl`, `app.marktplaats.nl/api3`, `/app`; payment/Maps/support services | **Security/functional/mixed roles:** ThreatMetrix profiling tied to session headers; listings, auth/chat/shipping/checkout and location services. | Security/server requirements remain unknown. These are not all advertising-only hosts, and blanket removal could break marketplace functions. |

</details>
