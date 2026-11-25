# Marktplaats

Version **16.19.0**, build **633464**, package `nl.marktplaats.android`.
Only the inspected Android 8, 9, 10 and 12L minimum-SDK variants are supported.
The five controls include consent, microG-Re and independent ThreatMetrix
blocking. Older versions are rejected. The checks below describe source and
rebuilt-artifact evidence; account and payment flows still need device acceptance.
[All app READMEs](../README.md).

## Evidence and controls

The Google-auth control routes the exact identitycredentials
service to an installed, enabled microG-Re service and selects that provider for
single Google ID options, including on Android34+. It adds the original publisher
package/certificate metadata used by Morphe. Other GMS service actions retain
their binding code. Google account authentication is deliberate functional
traffic; it is not blocked by this option. No successful device authentication or
complete authentication-domain inventory is claimed.

The destinations below come from app-wired calls, SDK routes or app configuration.
**No decrypted traffic capture was made.** A configured destination does not prove
that it received data on a particular phone. Unknown destinations and payloads
remain unknown.

**Hide ads** and **Disable tracking** default on; Disable tracking includes Hide
ads. **Disable ThreatMetrix** is independent and defaults on. These
controls target this exact original version and publisher certificate.

## Destinations, data and effects

| Destination / evidence | Purpose and data in the inspected path | Patch effect and remaining exposure |
| --- | --- | --- |
| `www.marktplaats.nl/metrics`, `/displays?platform=Android` — configured first-party advertising measurements | Requested/bid/loaded/rendered/failed/viewable counters, latency and native impression/click/view-duration events. Advertising targeting includes listing URN, position, postcode, seller/category/search attributes; Google request construction adds advertising/session identifiers and consent fields. | Hide ads stops the identified ad fetch/target/event/metrics paths and their timers. Ordinary listing/search/chat requests sharing publisher infrastructure remain. |
| Google AdManager/DoubleClick/Googlesyndication — app-wired display/custom native ads | Ad requests, creative rendering, impressions and clicks; dynamic creative/verification receivers are not exhaustively known. | Hide ads stops ad auto-initialization, loaders and explicit search/VIP/home ad slots. Maps, authentication and messaging use separate functional paths. |
| `ow.pubmatic.com/openrtb/2.5`, `ads.pubmatic.com`, `owsdk.pubmatic.com/crashanalytics` — traced OpenWrap routes | Bid/configuration/rendering and SDK crash/ANR reporting; requests can carry device and ad-targeting information. | Hide ads stops the app-owned OpenWrap initializer and advertising load paths. Libraries remain bundled; endpoint presence is not proof of a captured transfer. |
| `ib.adnxs.com/openrtb2/prebid` — app-configured Prebid host | Configured advertising demand destination. Actual demand execution and its payload were not established. | Identified advertising consumers are stopped. No claim that every bundled bidder was active or every possible remote creative host was enumerated. |
| `app.adjust.com` / `.io`, `gdpr.adjust.*`, `ssrv.adjust.*` — attribution/events/privacy SDK routes | Attribution/referrer/device information. The app's Adjust wrapper carries Criteo product IDs, transaction IDs, quantities, prices, product lists and deep links. A separate Criteo SDK/upload route was not established. | Disable tracking selects the existing denied wrapper and stops SDK init/resume/event/referrer admissions, including the install-referrer receiver. Native privacy-request code remains; this does not establish that a vendor deletion request was delivered. |
| Facebook Graph hosts — app-wired events plus authentication | Optional app events, identifiers/properties and SDK crash/error/ANR reports coexist with login APIs. | Disable tracking stops event admission, queues/flushes and identified diagnostic file/upload paths. Facebook base SDK and real authentication remain. Existing local/vendor history is not claimed erased. |
| `sdk.fra-02.braze.eu` — app-configured Braze endpoint | Marketing profiles/user linkage, in-app content and push engagement. | Disable tracking applies the SDK's real disabled state and stops initialization, user/consent observers, content-card and lifecycle admissions. **Braze marketing/in-app/push messages are disabled.** Independent first-party FCM chat/order/security/saved-search paths remain. |
| Datadog `US1` site — app configuration; exact intake hostname not pinned | RUM/actions/vitals, network resources/tracing, logs and user linkage. A bundled EU URL is not evidence that the app selects that site. | Disable tracking stops its provider/bootstrap and user observers through the native disabled predicate. Functional network calls remain. No captured destination or complete runtime traffic audit is claimed. |
| `app-measurement.com`; Firebase crash/performance/session and FCM measurement transports — traced measurement routes; exact diagnostic upload hosts not pinned | App events/screens/properties, diagnostic/performance/session records and messaging delivery export. | Disable tracking stops the app event hub and GAID lookup/cache, permanently disables Analytics/Performance, prevents diagnostic re-enable/settings refresh, and forces delivery export off. Previously queued known measurement transports are filtered and deliberately discarded through native deletion/error handling. Unknown transport types retain real send/retry outcomes. |
| `s.userzoom.com`, `participant-eu.userzoom.com` and study/CDN/video hosts — optional app-wired study SDK | Survey/study participation and SDK screen/video capture capabilities. Actual study capture was not observed; this build does not declare `RECORD_AUDIO`. | Disable tracking stops both the independent lifecycle initialization and synchronous study trigger. Marketplace camera/chat/seller uploads remain. There is no evidence here of continuous recording or microphone capture. |
| `cdn.privacy-mgmt.com` and Sourcepoint service configuration — functional consent paths | Consent configuration, decisions, stored preferences and completion/error callbacks. | Skip consent screens prevents startup display and requests the SDK's genuine GDPR reject-all choice. Configuration and rejection connections remain. Closing the hidden UI does not claim the server received the rejection; real consent-ready/error handling and manual privacy settings remain. Consent grants cannot re-enable removed optional integrations. No grant or consent response is fabricated. |
| Adyen checkout/checkout-analytics SDK routes; `onlinepaymentplatform.com` — payment/service contracts | Checkout/3DS/payment setup and SDK setup metadata. The native initializer obtains a genuine checkout-attempt ID. Exact selected runtime host and full setup payload were not captured. | Disable tracking stops optional Adyen event admission, timers and event upload. **Initial SDK setup metadata and the real attempt-ID exchange remain.** Payment APIs, redirects and real outcomes remain; no transaction was tested. |
| `faas.marktplaats.nl` — app-configured ThreatMetrix security profiling | Device/security profiling linked to session headers on protected requests. Complete native payload and backend requirements are unknown. | Ordinary tracking control retains it. The independent control stops initialization/profile waits and uses native empty headers. **Login, checkout or other protected actions may fail.** It does not bypass backend checks or forge a profile/session. |
| `app.marktplaats.nl/api3`, `/app`, publisher media, Maps/Places, support and shipping services — functional/mixed paths | Listings/search, location, session/Bearer authentication, chat, saved searches, seller media, shipping/payment and support data. The shared request builder retains native session/device/version/locale fields. | Functional requests and native errors remain. Promoted seller inventory and server-backed business subscriptions remain genuine products. Functional services still receive supplied data and ordinary network information such as IP address. |

## Boundaries and remaining checks

The patches remove explicit third-party display/native slots while preserving
ordinary and promoted seller listings, pagination, legal notices and functional
services. Native no-content/failure callbacks finish the affected ad UI; no
listing, payment, subscription, consent or security success is invented.

Stopped optional senders do not admit new events through the checked paths.
Known queued Firebase measurements use an intentional privacy discard, without a
successful-send acknowledgement. Some old SDK files and vendor-side history may
remain. The original native libraries in each supported variant are retained unchanged.

Evidence includes original/rebuilt APK checks, exact method restoration and
bounded execution of retained instructions. It does not establish every Android
runtime outcome. Re-signed startup, search/listing/chat, account/push, Maps,
Google sign-in and checkout/security behavior need device acceptance for this
build. No transaction or data deletion was performed during this verification.


## Notifications module repair (2026-10-31)

The original 16.17.0 APKS export contains only base, arm64 and density APKs.
The Notifications action requests `alertscentercompose`; its activity code is
absent from that export. Read-only inspection of the connected phone confirmed
16.17.0/633462 and `DynamicModuleInstallActivity` in the paused activity stack.
No original installed-split inventory could be recovered, so whether the split
was omitted during export or had not yet been downloaded remains unknown.

The complete Android 12L+ 16.19.0 APKM contains `split_alertscentercompose.apk`.
All twelve APK signatures match the pinned publisher certificate; the six base
DEX payloads are byte-identical to the previously supported API26 distribution.
The feature contains 113 classes and 404 method declarations. Morphe's merger
preserves those declarations and adds the native fused-module registration,
allowing the original navigation to use the bundled feature. No download,
installation or consent success is fabricated.

API32 inputs now require the fused Notifications-module metadata in the read-only
preflight. Incomplete API32 archives fail before resource edits with an instruction
to select the complete archive. Existing API26/28/29 inputs retain their prior guards;
those archives can omit optional features. The public download points to the
complete API32 distribution. The feature's class/method ABI, native libraries
and registration are checked in rebuilt artifacts. The user subsequently confirmed that Notifications was solved after the
complete-package repair. Device navigation and installation were performed
by the user; the agent only read package metadata, APK files and logs.

The documented original download is the complete ZIP-based APKS repackaging at
https://buzzheavier.com/xdwu08cpm8pm. It contains all twelve original APK payloads,
including the Notifications feature, byte-for-byte unchanged from the verified
publisher APKM; only the outer archive format changes.
