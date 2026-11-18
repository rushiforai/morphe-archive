# Buienalarm

Version-specific source/SDK/configuration evidence is not a packet capture showing that every listed host received data. [All app READMEs](../README.md).

Prefer the original Play Store APK set; its current ARM64 variant requires Android 12L, while the older standalone input requires Android 8.

| Patch | Effect |
| --- | --- |
| Hide ads | Disables banner and full-screen video/interstitial loading and display, and hides reserved banner space. |
| Hide Premium banner | Hides the Buienalarm Premium promotion card in Settings. |
| Fix Google services | Preserves the original app certificate for Firebase and supplies the authorized community key for Google Maps. Included as a dependency of the other patches. |
| Disable tracking | Disables the identified analytics, advertising-ID/PPID, partner-targeting, crash/session, marketing and optional RevenueCat telemetry paths. |
| Skip consent screens | Skips the cookie onboarding and automatic ad/Premium choice screen. Includes Disable tracking and writes neither acceptance nor rejection. |

The patches remain separately listed; required dependencies are included automatically. Skip consent screens includes Disable tracking, Hide ads and Fix Google services. They do not grant a subscription. Compatibility does not change the installed APK's actual signer or provide Play Integrity attestation.

<details>
<summary>Tracking destinations, collected data and patch effects</summary>

| Destination | Purpose and data in the inspected path | Patch effect / remaining exposure |
| --- | --- | --- |
| `api.meteoplaza.com/v2/ads/targetting` | **Traced:** advertising targeting; app code supplies PPID, selected city/country and ad context. PPID can connect activity across sibling Infoplaza apps. | Targeting call and PPID source stopped by Disable tracking; weather on the same host stays available. |
| Google/Firebase and Facebook — exact upload hosts not established | **Traced SDK paths:** analytics events/properties, user-ID linkage, app/purchase events, advertising identifiers and diagnostic logs. | Inventoried collection, startup, identifier and queued-upload paths disabled. An SDK name alone is not evidence of a particular network destination. |
| RevenueCat — exact upload host not pinned in the audit | **Traced:** optional ad/device identifiers, Firebase instance-ID linkage, subscriber attributes, paywall/ad events and diagnostics. | Optional paths stopped; genuine customer identity, receipts, entitlements and transaction callbacks retained. |
| Didomi — exact metrics host not pinned in the audit | **Traced:** performance/API metrics; separate consent configuration and manual preferences. | Optional metrics stopped; manual privacy and stored choices retained. |
| NotifyHub / weather services — exact host not pinned in the audit | **Retained:** notification identity and requested locations for weather alerts, weather and Maps. | Functional service interactions remain; Disable tracking does not promise zero location or device information leaving the phone. |

</details>
