# 9292

**Dev only; startup and consent corrected on the USB phone.** These patches
remain excluded from stable releases pending wider acceptance.

Version-specific source/SDK/configuration evidence is not a packet capture showing that every listed host received data. [All app READMEs](../README.md).

Version **2.48.1**. Four default-on controls: **Fix PairIP startup**, **Hide ads**, **Disable tracking** and **Skip consent screens**. Ads includes startup; tracking includes ads; consent includes tracking.

<details>
<summary>Tracking destinations, collected data and patch effects</summary>

| Destination | Purpose and data in the inspected path | Status / functional boundary |
| --- | --- | --- |
| `app-measurement.com`; Crashlytics report transport (exact upload host not pinned) | **Traced Firebase integration:** screens, planner datetime/options/first-last-mile choices, location/API-result events and user properties; app UUID also links diagnostics. Build/locale/accessibility/TalkBack and other environment flags are added. | Disable tracking stops app events/properties and UUID publication, permanently deactivates Analytics, disables diagnostic/session collection despite restored/later opt-in, and stops diagnostic settings HTTP. The same UUID still supplies functional `x-user-id`. Local diagnostic files may remain. |
| `ow.pubmatic.com/openrtb/2.5`, `ads.pubmatic.com`, `owsdk.pubmatic.com/crashanalytics` | **Traced OpenWrap integration / SDK destinations:** bids/configuration and SDK crash/ANR data. The functional location routine separately passes latitude/longitude rounded to two decimals into OpenWrap advertising location. | Hide ads suppresses native Google/PubMatic and station-ad paths, disables Google ad auto-init and omits only the advertising location handoff. Precise travel location remains. |
| `googleads.g.doubleclick.net`, `pubads.g.doubleclick.net`, `pagead2.googlesyndication.com`, `mediation.goog`, `imasdk.googleapis.com`; Usercentrics regional services | **App-wired advertising / SDK destinations and consent transports:** ad rendering/measurement, consent configuration/decisions and separate session/statistics routes. The Google domains are bundled SDK destinations; their dynamic selected requests were not captured. | Hide ads suppresses native ad paths. Disable tracking stops the separate EU/global session pixel and its timestamp write. Genuine consent configuration, decision storage, completion, explicit user-data deletion and widget refresh remain; regional consent services can still connect. |
| `benefits-api.sovendus.com/mobile-sdk/`, `logging-api.sovendus.com` | **Traced post-payment promotion / SDK reporting:** voucher-offer content and SDK errors. | Hide ads disables the native voucher promotion flag, preserving payment outcomes and purchased-ticket details. |
| `checkoutanalytics-live.adyen.com` / regional/test alternatives | **SDK payment telemetry:** setup/track measurement, including an awaited setup-ID contract. | Disable tracking stops the optional event flush, completing its real consumer with native Unit. Setup telemetry and its genuine `checkoutAttemptId` remain, along with `checkoutshopper-*.adyen.com` payment/3DS/action APIs. No setup or payment success is fabricated. |
| `wrapper.9292.nl`, `stables.donkey.bike`, `app.linkalock.com` | **Functional/mixed services:** journeys, tickets/wallet/reservations, rental authentication and lock/end-rental operations with optional GPS. | Retained: planning, signed headers, real payment/3DS, notifications, rental/lock operations and any operational location/events. These services still receive functional data and ordinary network information such as IP address. Re-signed Play licensing, Maps, API/payment/lock acceptance need phone testing. |
| `app.usercentrics.eu/session/1px.png`, `app.eu.usercentrics.eu/session/1px.png` | **Traced independent pixel:** app ID, settings ID and a local session timestamp. | Disable tracking prevents both the request and timestamp write. Consent services remain as described above. |
| Firebase CCT / DataTransport | Already stored Crashlytics reports, app-quality sessions, optional FCM delivery metrics and transport-client metrics can outlive a preference change. | Four exact measurement types are filtered before HTTP. Entirely filtered batches are deliberately deleted through the existing fatal-error path, without a successful-send result. Unknown types retain objects/order and genuine transport/retry outcomes. |

</details>

Skip consent screens persists native denial of advertising/analytics before startup onboarding can render, then enables only the separate functional-data service for local trips, favourites and tickets. A fresh-state phone check confirmed functional/required services allowed and both optional tracking services denied, without a consent or delete-data prompt. This setting allows local data; it does not grant advertising or analytics consent. Explicit user-data deletion and notification settings remain.

First-party home banners without a paid-ad discriminator remain so travel/service notices are preserved. Functional Firebase initialization, Remote Config, Installations, FCM and Maps remain. Adyen setup telemetry and operational Donkey/Linka events remain. These controls do not promise complete network silence.

The startup fix stops the local licensing entry point that previously redirected the re-signed app to Play and scheduled shutdown. Original native libraries remain. Cold startup is phone-verified; live route planning, Maps and genuine payment/lock acceptance still need testing. Domain observations above remain source/SDK evidence, not a new decrypted traffic capture.
