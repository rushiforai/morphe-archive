# Marktplaats

**Supported app:** 16.17.0 · **Build:** 633462 · **Input:** APKS

`nl.marktplaats.android`

[Download the original APKS](https://buzzheavier.com/cq3amiskfsdy){ .md-button .md-button--primary }

Select this file in Morphe Manager to apply the patches.

Browsing listings and searching can feed advertising measurement and targeting with the listing, its position, your postcode and seller, category and search attributes. The app also contains SDKs for attribution, marketing messages, diagnostics and optional studies, and a ThreatMetrix security profile that is attached to protected requests. Stable v1.18.0 publishes all five controls, including the corrected Google sign-in route.

## What did we find in the app?

| Activity / service | What our evidence shows | What changes |
| --- | --- | --- |
| Advertising measurement and Google Ad Manager | Requested, bid, loaded, rendered, failed and viewable counters, latency, and native impression, click and view duration events. Targeting includes the listing URN, position, postcode and seller, category and search attributes. Google requests add advertising and session identifiers and consent fields. | Hide ads removes the explicit display and native ad slots in search, listing pages and home, and stops ad startup, loading, targeting and measurement. Genuine seller listings, including promoted seller inventory, pagination and legal notices, remain. |
| PubMatic OpenWrap and Prebid | OpenWrap routes for bids, configuration, rendering and SDK crash reports, which can carry device and targeting information. A Prebid host is configured, but its use was not established. | Hide ads stops the app's OpenWrap initializer and ad loads. The libraries remain bundled. |
| Adjust and Criteo | Attribution, referrer and device information. The app's Adjust wrapper carries Criteo product IDs, transaction IDs, quantities, prices, product lists and deep links. | Disable tracking stops SDK startup, events and referrer handling, including the install referrer receiver. The privacy request code remains; we do not claim a vendor deletion request was delivered. |
| [Meta/Facebook](../trackers/meta.md) | Optional app events, identifiers, properties and SDK crash, error and ANR reports, next to Facebook login. | Disable tracking stops event admission, queues, flushes and the diagnostic uploads. Facebook login keeps working. |
| Braze | Marketing profiles, user linkage, in-app content and push engagement. | Disable tracking puts the SDK in its own disabled state. Braze marketing, in-app and push messages are disabled. The app's own FCM notifications for chat, orders, security and saved searches remain. |
| Datadog and UserZoom | Datadog collects RUM, actions, vitals, network resources and tracing, logs and user linkage. UserZoom runs optional studies with screen and video capture abilities; no capture was observed and this build does not declare `RECORD_AUDIO`. | Disable tracking stops Datadog startup and its user observers, and both UserZoom entry points. Camera, chat and seller uploads remain. |
| [Firebase](../trackers/firebase.md) | App events, screens and properties, diagnostic, performance and session records, and export of messaging delivery data. | Disable tracking stops the app event hub and advertising ID lookup, permanently disables Analytics and Performance, keeps diagnostics off and turns delivery export off. Known queued measurements are discarded through the app's own error and deletion handling. Unknown transport types keep their real send and retry outcomes. |
| Adyen checkout analytics | Checkout, 3DS and payment setup, SDK setup metadata and a genuine checkout attempt ID. | Disable tracking stops optional event admission, timers and uploads. The initial setup metadata and the attempt ID exchange remain because payment code uses that ID. |
| ThreatMetrix security profiling | Device and security profiling linked to session headers on protected requests. The full native payload and backend requirements are unknown. | Disable tracking alone leaves it running. Disable ThreatMetrix stops initialization and profiling and sends the app's empty headers. Login, checkout or other protected requests may fail. The patch does not forge a profile or session. |

## What remains and what is still unknown

Listings, search, chat, login, Maps, shipping, payments, Sourcepoint consent decisions and the app's own FCM notifications keep working. The shared API request builder still adds session, device, version and locale fields. Old SDK files and history held by vendors may remain. Functional services still receive the data you supply and ordinary network information such as your IP address.

The destination table in the privacy notes separates calls the app makes, configured destinations and activity that is still unresolved. A configured destination does not prove that it received data on a particular phone.

Account, chat and push, Maps and payment and security behaviour have not been tested exhaustively. Final account verification after Google sign-in remains something you do yourself. Seven native libraries remain unchanged. Use the complete original Android 12L+ (API 32) Play split set of this exact version.

## Available controls

Disable ThreatMetrix, Disable tracking, Google sign-in via microG-Re, Hide ads, Skip consent screens.

All five are on by default. Disable tracking includes Hide ads, and Skip consent screens includes Disable tracking. Disable ThreatMetrix and Google sign-in via microG-Re are independent of the others.

Skip consent screens keeps the startup cookie popup from appearing and requests Sourcepoint's reject-all choice. Manual privacy settings stay available. Disable ThreatMetrix can make login, checkout or other protected requests fail, because the backend requirements are unknown; turn it off if that happens.

Google sign-in via microG-Re uses microG-Re for Google Credential Manager sign-in when its credential service is installed and enabled. It keeps the original publisher identity, leaves other Google service bindings in place and falls back to the original route when that service is missing. The request and response bridge handles microG-Re's Google ID namespace and its Bundle replies on Android 14 (API 34) and newer.

[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.

## Evidence

Reviewed 29 October 2026 against release `v1.18.0`: [technical audit](https://github.com/johnneerdael/dutch-applications-patches/blob/v1.18.0/docs/marktplaats-audit.md), [destinations, data and remaining services](https://github.com/johnneerdael/dutch-applications-patches/blob/v1.18.0/docs/privacy/marktplaats/README.md) and [patch source](https://github.com/johnneerdael/dutch-applications-patches/tree/v1.18.0/patches/src/main/kotlin/patches/marktplaats). Checks of the original and rebuilt APKs verify 912 original method and ABI contracts, plus the retained callbacks, cancellations and error paths. A live USB and Frida test on Android 16 saw Google requests translated correctly and successful credential replies, after which the app reached its own account-protection verification screen. With the diagnostic tools removed, the normal patched APK started without Android runtime errors, and the user approved the release. No decrypted traffic capture or full Android runtime audit was made. The build and source checks performed no account action or transaction. [How to read the evidence](../reference/methodology.md).
