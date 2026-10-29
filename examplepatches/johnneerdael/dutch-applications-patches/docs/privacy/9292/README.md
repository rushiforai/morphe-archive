# 9292 (research only)

Version-specific source/SDK/configuration evidence is not a packet capture showing that every listed host received data. [Evidence notes](../../TRACKING_DESTINATIONS.md) · [All app READMEs](../README.md).

Version **2.48.1**. [Research evidence](../../research/2026-10-28/9292.md). No controls published yet.

<details>
<summary>Tracking destinations, collected data and patch effects</summary>

| Destination | Purpose and data in the inspected path | Status / functional boundary |
| --- | --- | --- |
| `app-measurement.com`; Crashlytics report transport (exact upload host not pinned) | **Traced Firebase integration:** screens, planner datetime/options/first-last-mile choices, location/API-result events and user properties; app UUID also links diagnostics. Build/locale/accessibility/TalkBack and other environment flags are added. | No control released yet. The same UUID supplies functional `x-user-id`; stop analytics linkage rather than destroy required API identity. |
| `ow.pubmatic.com/openrtb/2.5`, `ads.pubmatic.com`, `owsdk.pubmatic.com/crashanalytics` | **Traced OpenWrap integration / SDK destinations:** bids/configuration and SDK crash/ANR data. The functional location routine separately passes latitude/longitude rounded to two decimals into OpenWrap advertising location. | No control released yet. Preserve the separate precise location result needed for planning/maps; isolate its ad-location side effect. |
| Google DoubleClick/Googlesyndication/IMA/mediation hosts; Usercentrics regional services | **App-wired advertising / SDK consent transports:** ad rendering/measurement, consent configuration/decisions and separate session/statistics routes. Exact region and dynamic creatives unknown. | No control released yet. Consent-service data and functional notification/configuration traffic require narrower treatment than a global host block. |
| `benefits-api.sovendus.com/mobile-sdk/`, `logging-api.sovendus.com` | **Traced post-payment promotion / SDK reporting:** voucher-offer content and SDK errors. | Promotional candidate, separate from payment completion and purchased tickets. |
| `checkoutanalytics-live.adyen.com` / regional/test alternatives | **SDK payment telemetry:** setup/track measurement, including an awaited setup-ID contract. | Not automatically interchangeable with `checkoutshopper-*.adyen.com` payment/3DS/action APIs. No control released yet. |
| `wrapper.9292.nl`, `stables.donkey.bike`, `app.linkalock.com` | **Functional/mixed services:** journeys, tickets/wallet/reservations, rental authentication and lock/end-rental operations with optional GPS. | Planning, signed headers, real payments and lock commands must remain functional. Re-signing/PairIP startup compatibility is still a development risk. |

</details>
