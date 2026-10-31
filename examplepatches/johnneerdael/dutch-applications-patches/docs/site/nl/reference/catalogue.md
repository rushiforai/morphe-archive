# Patchcatalogus

**Patchbundel: 1.31.0**

Controleer per patch welke app-versies worden ondersteund en of de patch standaard aanstaat. Patches voor dezelfde app kunnen verschillende versies ondersteunen.

De Engelse beschrijvingen komen ongewijzigd uit het gepubliceerde `patches-list.json`. Op [de app-pagina’s](../apps/index.md) lees je in het Nederlands wat elke patch verandert en welke gegevens de app nog kan versturen.

## 9292

`nl.negentwee`


### Disable tracking

**Standaard: Aan**

Disables optional app analytics, diagnostic collection, queued Firebase measurements, Usercentrics session pixels and Adyen analytics. Includes Hide ads. Preserves the functional API identity, travel location, consent choices, notifications and genuine checkout outcomes.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 2.48.1 | `ARM64_V8A`: 32189, `ARMEABI_V7A`: 32189, `X86`: 32189, `X86_64`: 32189 | 32 | Ondersteund |

### Fix PairIP startup

**Standaard: Aan**

Stops 9292's local Play licensing entry point from redirecting re-signed builds to Play and scheduling shutdown. Preserves native application initialization, journeys, tickets and payment checks.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 2.48.1 | `ARM64_V8A`: 32189, `ARMEABI_V7A`: 32189, `X86`: 32189, `X86_64`: 32189 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Uses 9292's native no-ad paths for Google/PubMatic, station ads and post-payment voucher promotions. Stops ad auto-initialization and advertising location publication while preserving journeys, precise location, tickets and payment outcomes.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 2.48.1 | `ARM64_V8A`: 32189, `ARMEABI_V7A`: 32189, `X86`: 32189, `X86_64`: 32189 | 32 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Rejects advertising and analytics consent before startup onboarding is selected. Allows local trips, favourites and tickets through 9292's separate functional-data service. Includes ad and tracking controls and preserves native completion handling.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 2.48.1 | `ARM64_V8A`: 32189, `ARMEABI_V7A`: 32189, `X86`: 32189, `X86_64`: 32189 | 32 | Ondersteund |

## AD

`be.persgroep.android.news.mobilead`


### Disable tracking

**Standaard: Aan**

Disables audited native event collectors, queued uploads, analytics re-enable paths, advertising identifiers and FIAM while preserving push, real login, manual feedback and player session synchronization.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 9.22.0 | `ARM64_V8A`: 9220000, `ARMEABI_V7A`: 9220000, `X86`: 9220000, `X86_64`: 9220000 | 32 | Ondersteund |

### Hide Premium banner

**Standaard: Aan**

Suppresses automatic marketing templates and Premium markers while retaining LIVE labels, editorial promotions and manual account navigation.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 9.22.0 | `ARM64_V8A`: 9220000, `ARMEABI_V7A`: 9220000, `X86`: 9220000, `X86_64`: 9220000 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Filters commercial feed/article rows and disables banner technologies, video advertising and game prerolls using existing no-ad feature paths while preserving editorial media.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 9.22.0 | `ARM64_V8A`: 9220000, `ARMEABI_V7A`: 9220000, `X86`: 9220000, `X86_64`: 9220000 | 32 | Ondersteund |

### Read full articles

**Standaard: Aan**

Requests complete article components through the shipped article API and completes both marketing resolvers with their supported empty results, preserving account and purchase state.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 9.22.0 | `ARM64_V8A`: 9220000, `ARMEABI_V7A`: 9220000, `X86`: 9220000, `X86_64`: 9220000 | 32 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Skips automatic consent, startup login and topic-notification prompts. Defaults to guest reading and manual notification opt-in while retaining city selection, saved choices and manual login/privacy controls.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 9.22.0 | `ARM64_V8A`: 9220000, `ARMEABI_V7A`: 9220000, `X86`: 9220000, `X86_64`: 9220000 | 32 | Ondersteund |

## Buienalarm

`org.yoki.android.buienalarm`


### Disable tracking

**Standaard: Aan**

Disables app analytics, advertising IDs, partner targeting, crash/session reporting and marketing SDK startup while retaining weather and configuration services.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 4.32.0 | `ARM64_V8A`: 3723, `ARMEABI_V7A`: 3723, `X86`: 3723, `X86_64`: 3723 | 26 | Ondersteund |

### Fix Google services

**Standaard: Aan**

Preserves the original app certificate for Firebase and supplies the authorized community key for Google Maps.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 4.32.0 | `ARM64_V8A`: 3723, `ARMEABI_V7A`: 3723, `X86`: 3723, `X86_64`: 3723 | 26 | Ondersteund |

### Hide Premium banner

**Standaard: Aan**

Hides the Buienalarm Premium promotion card in Settings.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 4.32.0 | `ARM64_V8A`: 3723, `ARMEABI_V7A`: 3723, `X86`: 3723, `X86_64`: 3723 | 26 | Ondersteund |

### Hide ads

**Standaard: Aan**

Disables banners and full-screen video/interstitial requests, and removes reserved banner space.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 4.32.0 | `ARM64_V8A`: 3723, `ARMEABI_V7A`: 3723, `X86`: 3723, `X86_64`: 3723 | 26 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Skips the cookie onboarding and automatic ad/Premium choice screens after disabling tracking. Does not accept or reject consent; manual Privacy settings remain available.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 4.32.0 | `ARM64_V8A`: 3723, `ARMEABI_V7A`: 3723, `X86`: 3723, `X86_64`: 3723 | 26 | Ondersteund |

## Buienradar

`com.supportware.Buienradar`


### Disable Swrve and location upload

**Standaard: Uit**

Replaces the Swrve engagement SDK (device profile, sessions, user properties, marketing messages) with its built-in no-op and stops uploading the background location with the Swrve ID. Weather alerts are delivered through Swrve, so this also disables all push alerts.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.4.8 | `ARM64_V8A`: 7897, `ARMEABI_V7A`: 7897, `X86`: 7897, `X86_64`: 7897 | 28 | Ondersteund |

### Disable tracking

**Standaard: Aan**

Disables Snowplow (RTL, DPG Media and Kantar), Firebase Analytics, Crashlytics and Sessions, Smartocto and Bitmovin video analytics, Usabilla telemetry and campaigns, and advertising/attribution IDs. Weather alerts keep working.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.4.8 | `ARM64_V8A`: 7897, `ARMEABI_V7A`: 7897, `X86`: 7897, `X86_64`: 7897 | 28 | Ondersteund |

### Hide Premium banner

**Standaard: Aan**

Hides the 'Discover Buienradar Premium' promotion blocks on the Today and Info tabs and the Plus trial notification.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.4.8 | `ARM64_V8A`: 7897, `ARMEABI_V7A`: 7897, `X86`: 7897, `X86_64`: 7897 | 28 | Ondersteund |

### Hide ads

**Standaard: Aan**

Removes the banner/native ads between the weather cards and the pre-roll ads in weather videos, and does not start the Google Mobile Ads SDK.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.4.8 | `ARM64_V8A`: 7897, `ARMEABI_V7A`: 7897, `X86`: 7897, `X86_64`: 7897 | 28 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Skips the first-run Pay-or-OK choice and the OneTrust cookie banner after disabling tracking and ads. Records no consent choice; Privacy settings on the Info tab remain available.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.4.8 | `ARM64_V8A`: 7897, `ARMEABI_V7A`: 7897, `X86`: 7897, `X86_64`: 7897 | 28 | Ondersteund |

## De Morgen

`be.persgroep.android.news.mobiledm`


### Disable tracking

**Standaard: Aan**

Suppresses native analytics collectors and queued uploads, advertising identifiers, ContentSquare/Heap WebView instrumentation and known web collector requests while preserving content, account and push.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

### Hide Premium banner

**Standaard: Aan**

Suppresses marketing templates, premium labels and the automatic subscriber-benefit row, retaining manual account navigation.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Suppresses native ad requests, header bidding, video prerolls, body ad DTOs; filters known web advertising resources.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

### Read full articles

**Standaard: Aan**

Renders all editorial body components received from the article API using the normal successful empty marketing-template result, without changing account or purchase entitlements.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Completes automatic consent refresh without opening the advertising choice screen or writing acceptance; automatically finishes first-launch login, welcome and notification setup with fresh subscriptions off; manual privacy, account and notification settings remain available.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

## De Tijd

`mobi.inthepocket.mediafin.detijd`


### Disable tracking

**Standaard: Aan**

Stops inventoried Gemius, Snowplow, Firebase, Admantx and Mux measurement while preserving account and push initialization.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 5.6.1 | `ARM64_V8A`: 5060100, `ARMEABI_V7A`: 5060100, `X86`: 5060100, `X86_64`: 5060100 | 26 | Ondersteund |

### Hide Mijn Tijd (expert)

**Standaard: Uit**

Removes Mijn Tijd from the bottom bar. De essentie, other navigation and manual sign-in remain available.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 5.6.1 | `ARM64_V8A`: 5060100, `ARMEABI_V7A`: 5060100, `X86`: 5060100, `X86_64`: 5060100 | 26 | Ondersteund |

### Hide Premium banner

**Standaard: Aan**

Hides the service banner and automatic in-app promotions while preserving push notifications and account access.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 5.6.1 | `ARM64_V8A`: 5060100, `ARMEABI_V7A`: 5060100, `X86`: 5060100, `X86_64`: 5060100 | 26 | Ondersteund |

### Hide ads

**Standaard: Aan**

Suppresses the inventoried native, banner and outstream ad hosts and client ad insertion.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 5.6.1 | `ARM64_V8A`: 5060100, `ARMEABI_V7A`: 5060100, `X86`: 5060100, `X86_64`: 5060100 | 26 | Ondersteund |

### Read full articles

**Standaard: Aan**

Displays delivered article paragraphs and the De essentie feed without changing account state or normal access requests.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 5.6.1 | `ARM64_V8A`: 5060100, `ARMEABI_V7A`: 5060100, `X86`: 5060100, `X86_64`: 5060100 | 26 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Skips automatic consent UI and the tracking explainer without granting consent or changing saved choices.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 5.6.1 | `ARM64_V8A`: 5060100, `ARMEABI_V7A`: 5060100, `X86`: 5060100, `X86_64`: 5060100 | 26 | Ondersteund |

### Skip onboarding

**Standaard: Aan**

Opens the app navigator directly, preserving anonymous account and subscription state.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 5.6.1 | `ARM64_V8A`: 5060100, `ARMEABI_V7A`: 5060100, `X86`: 5060100, `X86_64`: 5060100 | 26 | Ondersteund |

## DS Nieuws

`com.twipemobile.dsmobile`


### Disable tracking

**Standaard: Aan**

Stops inventoried native and embedded-reader measurement, remote logging and advertising identifiers while preserving push and account functions.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 22.0.0 | `ARM64_V8A`: 2012316104, `ARMEABI_V7A`: 2012316104, `X86`: 2012316104, `X86_64`: 2012316104 | 32 | Ondersteund |

### Hide Premium banner

**Standaard: Aan**

Hides publisher paywall cards and subscription buttons without changing server article access, account entitlements or billing.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 22.0.0 | `ARM64_V8A`: 2012316104, `ARMEABI_V7A`: 2012316104, `X86`: 2012316104, `X86_64`: 2012316104 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Suppresses Kaching advertising, sponsored publisher groups and identified Shop and NYT promotion cards.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 22.0.0 | `ARM64_V8A`: 2012316104, `ARMEABI_V7A`: 2012316104, `X86`: 2012316104, `X86_64`: 2012316104 | 32 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Skips automatic consent and PayOrOk screens and persists normal onboarding completion without recording consent.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 22.0.0 | `ARM64_V8A`: 2012316104, `ARMEABI_V7A`: 2012316104, `X86`: 2012316104, `X86_64`: 2012316104 | 32 | Ondersteund |

## Dumpert

`nl.dumpert`


### Disable tracking

**Standaard: Aan**

Suppresses audited native analytics, queued Piano/Facebook sends, optional diagnostics and advertising identifiers. Preserves content, accounts, purchases, push and initialized privacy services.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 5.8.0 | `ARM64_V8A`: 22001778, `ARMEABI_V7A`: 22001778, `X86`: 22001778, `X86_64`: 22001778 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Removes native ads, prerolls and subscription promotions; uses the local ad-free account presentation while preserving real accounts and Deluxe purchases.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 5.8.0 | `ARM64_V8A`: 22001778, `ARMEABI_V7A`: 22001778, `X86`: 22001778, `X86_64`: 22001778 | 32 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Skips automatic Didomi advertising-choice UI without granting consent. Includes ad and tracking controls; manual privacy settings and readiness callbacks remain available.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 5.8.0 | `ARM64_V8A`: 22001778, `ARMEABI_V7A`: 22001778, `X86`: 22001778, `X86_64`: 22001778 | 32 | Ondersteund |

## Flitsmeister

`nl.flitsmeister`


### Disable partner services

**Standaard: Aan**

Hides Parking, Toll and Carwash service entries, removes Parking and Carwash from Settings, and disables Parking customer fetches.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 14.17 | `ARM64_V8A`: 1287, `ARMEABI_V7A`: 1287, `X86`: 1287, `X86_64`: 1287 | 29 | Ondersteund |

### Disable tracking

**Standaard: Aan**

Disables automatic usage/location telemetry, Firebase analytics/crash/performance/session collection, Insider marketing and advertising identifier access while retaining account, navigation and explicit reports.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 14.17 | `ARM64_V8A`: 1287, `ARMEABI_V7A`: 1287, `X86`: 1287, `X86_64`: 1287 | 29 | Ondersteund |

### Fix PairIP startup

**Standaard: Aan**

Restores captured startup data, lifecycle helpers and functional car, audio, connectivity, location and background-work callbacks while avoiding damaged PairIP execution.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 14.17 | `ARM64_V8A`: 1287, `ARMEABI_V7A`: 1287, `X86`: 1287, `X86_64`: 1287 | 29 | Ondersteund |

### Hide Pro notices

**Standaard: Aan**

Hides automatic Pro promotions, Pro/Plus badges and Android Auto upsells while retaining settings, avatar data and genuine account/readiness states.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 14.17 | `ARM64_V8A`: 1287, `ARMEABI_V7A`: 1287, `X86`: 1287, `X86_64`: 1287 | 29 | Ondersteund |

### Hide ads

**Standaard: Aan**

Blocks commercial LBA records, image requests, cached images, notifications and dialogs; hides the Ads setting and preserves informative and monitoring traffic items.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 14.17 | `ARM64_V8A`: 1287, `ARMEABI_V7A`: 1287, `X86`: 1287, `X86_64`: 1287 | 29 | Ondersteund |

### Unlock Pro

**Standaard: Aan**

Enables local Pro feature eligibility while preserving saved preferences, permissions, genuine account tiers and backend activation requirements.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 14.17 | `ARM64_V8A`: 1287, `ARMEABI_V7A`: 1287, `X86`: 1287, `X86_64`: 1287 | 29 | Ondersteund |

## FTM

`nl.ftm.ftmpulse`


### Disable tracking

**Standaard: Aan**

Blocks identified web collectors and notification analytics exports; cleans five Eventor keys after page load while preserving account, history and push.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 2.6.8 | `ARM64_V8A`: 58, `ARMEABI_V7A`: 58, `X86`: 58, `X86_64`: 58 | 32 | Ondersteund |

### Hide Premium banner

**Standaard: Aan**

Suppresses article decision modals and evidenced automatic trial promotions and stickybar while preserving manual membership links and editorial content.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 2.6.8 | `ARM64_V8A`: 58, `ARMEABI_V7A`: 58, `X86`: 58, `X86_64`: 58 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Closes evidenced automatic shop-product announcements while preserving service notices, manual forms and editorial content.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 2.6.8 | `ARM64_V8A`: 58, `ARMEABI_V7A`: 58, `X86`: 58, `X86_64`: 58 | 32 | Ondersteund |

### Read full articles

**Standaard: Aan**

Uses the supported empty HTML article decision to retain already received article bodies; cannot provide text absent from the server response.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 2.6.8 | `ARM64_V8A`: 58, `ARMEABI_V7A`: 58, `X86`: 58, `X86_64`: 58 | 32 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Skips the post-edition account offer as a guest and hides the cookie notice while blocking known collectors; keeps edition selection, manual login and existing consent values.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 2.6.8 | `ARM64_V8A`: 58, `ARMEABI_V7A`: 58, `X86`: 58, `X86_64`: 58 | 32 | Ondersteund |

## HBVL

`be.concentra.hbvl.MediaApp`


### Disable tracking

**Standaard: Aan**

Stops inventoried native and embedded-reader measurement, remote logging and advertising identifiers while preserving push and account functions.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 22.0.0 | `ARM64_V8A`: 2012316104, `ARMEABI_V7A`: 2012316104, `X86`: 2012316104, `X86_64`: 2012316104 | 32 | Ondersteund |

### Hide Premium banner

**Standaard: Aan**

Hides publisher paywall cards and subscription buttons without changing server article access, account entitlements or billing.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 22.0.0 | `ARM64_V8A`: 2012316104, `ARMEABI_V7A`: 2012316104, `X86`: 2012316104, `X86_64`: 2012316104 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Suppresses Kaching advertising, sponsored publisher groups and identified Shop and NYT promotion cards.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 22.0.0 | `ARM64_V8A`: 2012316104, `ARMEABI_V7A`: 2012316104, `X86`: 2012316104, `X86_64`: 2012316104 | 32 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Skips automatic consent and PayOrOk screens and persists normal onboarding completion without recording consent.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 22.0.0 | `ARM64_V8A`: 2012316104, `ARMEABI_V7A`: 2012316104, `X86`: 2012316104, `X86_64`: 2012316104 | 32 | Ondersteund |

## HLN

`be.persgroep.android.news.mobilehln`


### Disable tracking

**Standaard: Aan**

Disables audited native event collectors, queued uploads, analytics re-enable paths, advertising identifiers and FIAM while preserving push, real login, manual feedback and player session synchronization.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 9.22.0 | `ARM64_V8A`: 2009220000, `ARMEABI_V7A`: 2009220000, `X86`: 2009220000, `X86_64`: 2009220000 | 32 | Ondersteund |

### Hide Premium banner

**Standaard: Aan**

Suppresses automatic marketing templates and Premium markers while retaining LIVE labels, editorial promotions and manual account navigation.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 9.22.0 | `ARM64_V8A`: 2009220000, `ARMEABI_V7A`: 2009220000, `X86`: 2009220000, `X86_64`: 2009220000 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Filters commercial feed/article rows and disables banner technologies, video advertising and game prerolls using existing no-ad feature paths while preserving editorial media.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 9.22.0 | `ARM64_V8A`: 2009220000, `ARMEABI_V7A`: 2009220000, `X86`: 2009220000, `X86_64`: 2009220000 | 32 | Ondersteund |

### Read full articles

**Standaard: Aan**

Requests complete article components through the shipped article API and completes both marketing resolvers with their supported empty results, preserving account and purchase state.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 9.22.0 | `ARM64_V8A`: 2009220000, `ARMEABI_V7A`: 2009220000, `X86`: 2009220000, `X86_64`: 2009220000 | 32 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Skips automatic consent, startup login and topic-notification prompts. Defaults to guest reading and manual notification opt-in while retaining city selection, saved choices and manual login/privacy controls.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 9.22.0 | `ARM64_V8A`: 2009220000, `ARMEABI_V7A`: 2009220000, `X86`: 2009220000, `X86_64`: 2009220000 | 32 | Ondersteund |

## Humo

`be.humo.tvgids`


### Disable tracking

**Standaard: Aan**

Suppresses native analytics collectors and queued uploads, advertising identifiers, ContentSquare/Heap WebView instrumentation and known web collector requests while preserving content, account and push.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

### Hide Premium banner

**Standaard: Aan**

Suppresses marketing templates, premium labels and the automatic subscriber-benefit row, retaining manual account navigation.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Suppresses native ad requests, header bidding, video prerolls, body ad DTOs; filters known web advertising resources.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

### Read full articles

**Standaard: Aan**

Renders all editorial body components received from the article API using the normal successful empty marketing-template result, without changing account or purchase entitlements.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Completes automatic consent refresh without opening the advertising choice screen or writing acceptance; automatically finishes first-launch login, welcome and notification setup with fresh subscriptions off; manual privacy, account and notification settings remain available.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

## KIJK Android

`nl.sbs.kijk`


### Disable tracking

**Standaard: Aan**

Disables optional analytics, marketing identifiers and queued telemetry uploads while preserving content and account services.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 9.8.0 | `ARM64_V8A`: 2026101500, `ARMEABI_V7A`: 2026101500, `X86`: 2026101500, `X86_64`: 2026101500 | 26 | Ondersteund |

### Hide ads

**Standaard: Aan**

Removes the native player VMAP advertising configuration while preserving content, DRM and player lifecycle.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 9.8.0 | `ARM64_V8A`: 2026101500, `ARMEABI_V7A`: 2026101500, `X86`: 2026101500, `X86_64`: 2026101500 | 26 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Rejects optional OneTrust purposes through its genuine ready-state save path, skips automatic cookie and notification prompts, and defaults notifications off while retaining manual privacy and notification choices.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 9.8.0 | `ARM64_V8A`: 2026101500, `ARMEABI_V7A`: 2026101500, `X86`: 2026101500, `X86_64`: 2026101500 | 26 | Ondersteund |

## KIJK Android TV

`com.talpa.kijk`


### Disable tracking

**Standaard: Aan**

Limits the native advertising-ID bridge, disables hosted ID5/Conviva/GA/Sentry configuration and omits identified Tealium and measurement requests. Retains real consent, account and media services.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.2.7 | `ARM64_V8A`: 10003, `ARMEABI_V7A`: 10003, `X86`: 10003, `X86_64`: 10003 | 27 | Ondersteund |

### Enable WebView debugging

**Standaard: Uit**

Diagnostic only: permits local inspection of KIJK's hosted frontend. Disabled by default; use for test builds.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.2.7 | `ARM64_V8A`: 10003, `ARMEABI_V7A`: 10003, `X86`: 10003, `X86_64`: 10003 | 27 | Ondersteund |

### Hide ads

**Standaard: Aan**

Disables KIJK TV's client VAST/VMAP schedules, FreeWheel decisions and pause-ad display. Preserves content playback; broadcast or server-stitched ads require separate evidence.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.2.7 | `ARM64_V8A`: 10003, `ARMEABI_V7A`: 10003, `X86`: 10003, `X86_64`: 10003 | 27 | Ondersteund |

## Marktplaats

`nl.marktplaats.android`


### Disable ThreatMetrix

**Standaard: Aan**

Stops ThreatMetrix initialization, device/security profiling and its session headers. Independent and enabled by default.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 16.17.0 | `ARM64_V8A`: 633462, `ARMEABI_V7A`: 633462, `X86`: 633462, `X86_64`: 633462 | 32 | Ondersteund |

### Disable tracking

**Standaard: Aan**

Disables optional measurement while preserving normal marketplace services.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 16.17.0 | `ARM64_V8A`: 633462, `ARMEABI_V7A`: 633462, `X86`: 633462, `X86_64`: 633462 | 32 | Ondersteund |

### Google sign-in via microG-Re

**Standaard: Aan**

Routes Google sign-in through an installed microG-Re with Credential Manager support. Preserves the original route when that service is unavailable; device sign-in testing is required.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 16.17.0 | `ARM64_V8A`: 633462, `ARMEABI_V7A`: 633462, `X86`: 633462, `X86_64`: 633462 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Removes explicit display/native advertising slots and advertising startup while preserving genuine seller listings, promoted seller inventory, search metadata and functional services.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 16.17.0 | `ARM64_V8A`: 633462, `ARMEABI_V7A`: 633462, `X86`: 633462, `X86_64`: 633462 | 32 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Prevents the startup cookie popup from being displayed and requests the SDK's reject-all choice. Manual privacy settings remain available.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 16.17.0 | `ARM64_V8A`: 633462, `ARMEABI_V7A`: 633462, `X86`: 633462, `X86_64`: 633462 | 32 | Ondersteund |

## Nieuwsblad

`com.twipemobile.nbmobile`


### Disable tracking

**Standaard: Aan**

Stops inventoried native and embedded-reader measurement, remote logging and advertising identifiers while preserving push and account functions.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 22.0.0 | `ARM64_V8A`: 2012316104, `ARMEABI_V7A`: 2012316104, `X86`: 2012316104, `X86_64`: 2012316104 | 32 | Ondersteund |

### Hide Premium banner

**Standaard: Aan**

Hides publisher paywall cards and subscription buttons without changing server article access, account entitlements or billing.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 22.0.0 | `ARM64_V8A`: 2012316104, `ARMEABI_V7A`: 2012316104, `X86`: 2012316104, `X86_64`: 2012316104 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Suppresses Kaching advertising, sponsored publisher groups and identified Shop and NYT promotion cards.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 22.0.0 | `ARM64_V8A`: 2012316104, `ARMEABI_V7A`: 2012316104, `X86`: 2012316104, `X86_64`: 2012316104 | 32 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Skips automatic consent and PayOrOk screens and persists normal onboarding completion without recording consent.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 22.0.0 | `ARM64_V8A`: 2012316104, `ARMEABI_V7A`: 2012316104, `X86`: 2012316104, `X86_64`: 2012316104 | 32 | Ondersteund |

## NOS Teletekst

`com.eoffice.android`


### Disable tracking

**Standaard: Aan**

Prevents NOS/NPO analytics initialization, audience events, queued measurement uploads and tracking identifier creation. Uses the app's native empty tracker while preserving content, favourites, sharing and refresh.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 2.8.10 | `ARM64_V8A`: 62, `ARMEABI_V7A`: 62, `X86`: 62, `X86_64`: 62 | 23 | Ondersteund |

### Hide promotions

**Standaard: Aan**

Stops the recurring NOS-app promotion on the scoreboard page. Preserves Teletekst pages, favourites, sharing and refresh.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 2.8.10 | `ARM64_V8A`: 62, `ARMEABI_V7A`: 62, `X86`: 62, `X86_64`: 62 | 23 | Ondersteund |

## NPO Start

`nl.uitzendinggemist`


### Disable tracking

**Standaard: Aan**

Stops NPO Tag/Topspin/DAM, STER targeting, Bitmovin/Sentry collection, Cast diagnostics and Google telemetry collection/uploads, including queued batches. Preserves playback, authentication and functional Cast controls.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 1.48.2-2405 | `ARM64_V8A`: 240497937, `ARMEABI_V7A`: 240497937, `X86`: 240497937, `X86_64`: 240497937 | 32 | Ondersteund |

### Fix PairIP startup

**Standaard: Aan**

Restores build-specific startup data, lifecycle helpers, authentication and media/network callbacks. Preserves genuine token and entitlement checks and retains other protected native callbacks.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 1.48.2-2405 | `ARM64_V8A`: 240497937, `ARMEABI_V7A`: 240497937, `X86`: 240497937, `X86_64`: 240497937 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Suppresses nullable preroll inputs and the optional IMA ad loader. Uses the player's existing content-only path while retaining real content, DRM, subtitles and player state.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 1.48.2-2405 | `ARM64_V8A`: 240497937, `ARMEABI_V7A`: 240497937, `X86`: 240497937, `X86_64`: 240497937 | 32 | Ondersteund |

## NPO Start Android TV

`nl.uitzendinggemist`


### Disable tracking

**Standaard: Aan**

Stops NPO Tag/Topspin/DAM, STER targeting, Bitmovin/Sentry collection, Cast diagnostics and Google telemetry collection/uploads, including queued batches. Preserves playback, authentication and functional Cast controls.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 1.48.2-2405 | `ARM64_V8A`: 245497937, `ARMEABI_V7A`: 245497937, `X86`: 245497937, `X86_64`: 245497937 | 24 | Ondersteund |

### Fix PairIP startup

**Standaard: Aan**

Restores build-specific startup data, lifecycle helpers, authentication and media/network callbacks. Preserves genuine token and entitlement checks and retains other protected native callbacks.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 1.48.2-2405 | `ARM64_V8A`: 245497937, `ARMEABI_V7A`: 245497937, `X86`: 245497937, `X86_64`: 245497937 | 24 | Ondersteund |

### Hide ads

**Standaard: Aan**

Suppresses nullable preroll inputs and the optional IMA ad loader. Uses the player's existing content-only path while retaining real content, DRM, subtitles and player state.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 1.48.2-2405 | `ARM64_V8A`: 245497937, `ARMEABI_V7A`: 245497937, `X86`: 245497937, `X86_64`: 245497937 | 24 | Ondersteund |

## NRC

`com.twipemobile.nrc`


### Disable tracking

**Standaard: Aan**

Disables inventoried native/web collectors, analytics-only partner/heartbeat/profile launchers, queued Firebase exports and advertising IDs while retaining session refresh, account, media and notification state.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 5.12.24 | `ARM64_V8A`: 626, `ARMEABI_V7A`: 626, `X86`: 626, `X86_64`: 626 | 23 | Ondersteund |

### Hide Premium banner

**Standaard: Aan**

Hides evidenced appview subscription top banners and sticky promotion roots while preserving account forms and billing.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 5.12.24 | `ARM64_V8A`: 626, `ARMEABI_V7A`: 626, `X86`: 626, `X86_64`: 626 | 23 | Ondersteund |

### Hide ads

**Standaard: Aan**

Hides evidenced web ad slots and their reserved space, and removes wholly advertising replica pages while preserving mixed editorial pages and media.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 5.12.24 | `ARM64_V8A`: 626, `ARMEABI_V7A`: 626, `X86`: 626, `X86_64`: 626 | 23 | Ondersteund |

### Hide newspaper tab

**Standaard: Aan**

Removes the Krant tab, routes newspaper destinations to Nieuws and safely rebuilds legacy newspaper navigation state. Does not change account or newspaper access rights.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 5.12.24 | `ARM64_V8A`: 626, `ARMEABI_V7A`: 626, `X86`: 626, `X86_64`: 626 | 23 | Ondersteund |

### Read full articles

**Standaard: Aan**

Rejects the article-only web wall decision before destructive clipping and hides wall UI while retaining complete received article bodies; cannot supply text absent from the response.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 5.12.24 | `ARM64_V8A`: 626, `ARMEABI_V7A`: 626, `X86`: 626, `X86_64`: 626 | 23 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Skips automatic Didomi UI and the first guest login welcome through its original Skip completion; preserves existing consent, accounts and manual privacy/login choices.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 5.12.24 | `ARM64_V8A`: 626, `ARMEABI_V7A`: 626, `X86`: 626, `X86_64`: 626 | 23 | Ondersteund |

## NU.nl

`nl.sanomamedia.android.nu`


### Disable tracking

**Standaard: Aan**

Disables inventoried native/media collectors, persistent UDS and user-profile identifiers, queued push statistics and known WebView collectors; retains BFF local state, content, login and notification forwarding.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 26.9.0 | `ARM64_V8A`: 210156, `ARMEABI_V7A`: 210156, `X86`: 210156, `X86_64`: 210156 | 32 | Ondersteund |

### Hide Premium banner

**Standaard: Aan**

Removes the observed contentBlocker registration/premium notice while retaining ordinary WebAppBlock embeds and NU+ article links. Does not retrieve article bodies omitted by the server.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 26.9.0 | `ARM64_V8A`: 210156, `ARMEABI_V7A`: 210156, `X86`: 210156, `X86_64`: 210156 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Removes DPG banner loading/space, VACS/IMA video ads and explicit sponsored/NUshop content while retaining editorial links and video playlists.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 26.9.0 | `ARM64_V8A`: 210156, `ARMEABI_V7A`: 210156, `X86`: 210156, `X86_64`: 210156 | 32 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Skips automatic privacy and notification/account offers as a guest while keeping topic selection, manual settings and consent choices.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 26.9.0 | `ARM64_V8A`: 210156, `ARMEABI_V7A`: 210156, `X86`: 210156, `X86_64`: 210156 | 32 | Ondersteund |

## Omroep Brabant

`nl.omroepbrabant.android`


### Disable tracking

**Standaard: Aan**

Suppresses audited app/SDK analytics, optional IDs, video statistics and restored measurement uploads while retaining news, local history, push, media and native failure completion.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 11.1.0 | `ARM64_V8A`: 7331764, `ARMEABI_V7A`: 7331764, `X86`: 7331764, `X86_64`: 7331764 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Removes native placements, Outbrain/Start.io promotions and audited Blue Billywig video-ad paths while preserving news, playback and native completion.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 11.1.0 | `ARM64_V8A`: 7331764, `ARMEABI_V7A`: 7331764, `X86`: 7331764, `X86_64`: 7331764 | 32 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Includes ad and tracking controls. Prevents startup notification permission requests and cookie dialog creation; removes Cookie instellingen from the menu before display. Preserves stored choices, player completion, manual notification settings and push services.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 11.1.0 | `ARM64_V8A`: 7331764, `ARMEABI_V7A`: 7331764, `X86`: 7331764, `X86_64`: 7331764 | 32 | Ondersteund |

## Omroep West

`nl.omroepwest.android`


### Disable tracking

**Standaard: Aan**

Includes ad removal. Stops audited app, audience and video measurements, optional identifiers and queued telemetry while retaining news, local state, push, playback and native failure completion.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 20.1 | `ARM64_V8A`: 10596, `ARMEABI_V7A`: 10596, `X86`: 10596, `X86_64`: 10596 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Removes native and nested ad placements, Outbrain/Start.io promotions, Blue Billywig video-ad inputs and vertical-video ad rows while retaining content, indices and native failure completion.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 20.1 | `ARM64_V8A`: 10596, `ARMEABI_V7A`: 10596, `X86`: 10596, `X86_64`: 10596 | 32 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Includes ad and tracking controls. Skips automatic cookie and player consent and notification permission prompts; hides cookie settings in both menus. Preserves real choices, native continuation, manual notification settings, push and user-selected embed privacy gates.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 20.1 | `ARM64_V8A`: 10596, `ARMEABI_V7A`: 10596, `X86`: 10596, `X86_64`: 10596 | 32 | Ondersteund |

## Parool

`be.persgroep.android.news.mobilepa`


### Disable tracking

**Standaard: Aan**

Suppresses native analytics collectors and queued uploads, advertising identifiers, ContentSquare/Heap WebView instrumentation and known web collector requests while preserving content, account and push.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

### Hide Premium banner

**Standaard: Aan**

Suppresses marketing templates, premium labels and the automatic subscriber-benefit row, retaining manual account navigation.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Suppresses native ad requests, header bidding, video prerolls, body ad DTOs; filters known web advertising resources.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

### Read full articles

**Standaard: Aan**

Renders all editorial body components received from the article API using the normal successful empty marketing-template result, without changing account or purchase entitlements.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Completes automatic consent refresh without opening the advertising choice screen or writing acceptance; automatically finishes first-launch login, welcome and notification setup with fresh subscriptions off; manual privacy, account and notification settings remain available.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

## RTL Nieuws

`nl.rtl.rtlnieuws`


### Disable Swrve (expert)

**Standaard: Uit**

Reduces data sharing by stopping the remaining Swrve user and device updates and background push activity. Includes the standard ad, tracking and consent controls. Push notifications and Swrve channel synchronization stop working; shared Firebase authentication and configuration remain available.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 12.7.1 | `ARM64_V8A`: 1558, `ARMEABI_V7A`: 1558, `X86`: 1558, `X86_64`: 1558 | 32 | Ondersteund |

### Disable tracking

**Standaard: Aan**

Includes ad removal; disables audited analytics, optional tracking identifiers and diagnostics while preserving account, push and playback services.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 12.7.1 | `ARM64_V8A`: 1558, `ARMEABI_V7A`: 1558, `X86`: 1558, `X86_64`: 1558 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Suppresses native placements, client-side video ads and built-in/Swrve in-app campaigns before display; preserves media, accounts, purchases and manual notification/push services.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 12.7.1 | `ARM64_V8A`: 1558, `ARMEABI_V7A`: 1558, `X86`: 1558, `X86_64`: 1558 | 32 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Includes ad and tracking controls; skips automatic privacy and notification setup while preserving readiness, real choices and manual settings. Notifications remain off until manually enabled.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 12.7.1 | `ARM64_V8A`: 1558, `ARMEABI_V7A`: 1558, `X86`: 1558, `X86_64`: 1558 | 32 | Ondersteund |

## Trouw

`be.persgroep.android.news.mobiletr`


### Disable tracking

**Standaard: Aan**

Suppresses native analytics collectors and queued uploads, advertising identifiers, ContentSquare/Heap WebView instrumentation and known web collector requests while preserving content, account and push.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

### Hide Premium banner

**Standaard: Aan**

Suppresses marketing templates, premium labels and the automatic subscriber-benefit row, retaining manual account navigation.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Suppresses native ad requests, header bidding, video prerolls, body ad DTOs; filters known web advertising resources.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

### Read full articles

**Standaard: Aan**

Renders all editorial body components received from the article API using the normal successful empty marketing-template result, without changing account or purchase entitlements.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Completes automatic consent refresh without opening the advertising choice screen or writing acceptance; automatically finishes first-launch login, welcome and notification setup with fresh subscriptions off; manual privacy, account and notification settings remain available.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

## Tubantia

`com.mecom.tctubantia.nl`


### Disable tracking

**Standaard: Aan**

Disables audited native event collectors, queued uploads, analytics re-enable paths, advertising identifiers and FIAM while preserving push, real login, manual feedback and player session synchronization.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 9.23.2 | `ARM64_V8A`: 9230200, `ARMEABI_V7A`: 9230200, `X86`: 9230200, `X86_64`: 9230200 | 32 | Ondersteund |

### Hide Premium banner

**Standaard: Aan**

Suppresses automatic marketing templates and Premium markers while retaining LIVE labels, editorial promotions and manual account navigation.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 9.23.2 | `ARM64_V8A`: 9230200, `ARMEABI_V7A`: 9230200, `X86`: 9230200, `X86_64`: 9230200 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Filters commercial feed/article rows and disables banner technologies, video advertising and game prerolls using existing no-ad feature paths while preserving editorial media.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 9.23.2 | `ARM64_V8A`: 9230200, `ARMEABI_V7A`: 9230200, `X86`: 9230200, `X86_64`: 9230200 | 32 | Ondersteund |

### Read full articles

**Standaard: Aan**

Requests complete article components through the shipped article API and completes both marketing resolvers with their supported empty results, preserving account and purchase state.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 9.23.2 | `ARM64_V8A`: 9230200, `ARMEABI_V7A`: 9230200, `X86`: 9230200, `X86_64`: 9230200 | 32 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Skips automatic consent, startup login and topic-notification prompts. Defaults to guest reading and manual notification opt-in while retaining city selection, saved choices and manual login/privacy controls.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 9.23.2 | `ARM64_V8A`: 9230200, `ARMEABI_V7A`: 9230200, `X86`: 9230200, `X86_64`: 9230200 | 32 | Ondersteund |

## TVgids.nl

`nl.tvgids`


### Disable tracking

**Standaard: Aan**

Disables OSB, Comscore, Sentry and optional Facebook/Firebase measurement, tracking identifiers and queued telemetry. Includes Hide ads. Keeps manual privacy choices and functional account, guide and messaging paths.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.0.16 | `ARM64_V8A`: 106691, `ARMEABI_V7A`: 106691, `X86`: 106691, `X86_64`: 106691 | 26 | Ondersteund |

### Hide ads

**Standaard: Aan**

Removes ad placements, their reserved space and explicitly branded promotions. Stops ad-only configuration requests and native ad startup/loading while preserving guide and editorial content.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.0.16 | `ARM64_V8A`: 106691, `ARMEABI_V7A`: 106691, `X86`: 106691, `X86_64`: 106691 | 26 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Skips automatic privacy-consent screens after disabling ads and tracking. Records no consent choice and preserves manual cookie settings and existing choices.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.0.16 | `ARM64_V8A`: 106691, `ARMEABI_V7A`: 106691, `X86`: 106691, `X86_64`: 106691 | 26 | Ondersteund |

## Videoland Android

`nl.rtl.videoland.v2`


### Disable tracking

**Standaard: Aan**

Disables inspected Tealium, Snowplow, NPAW, advertising ID, New Relic, Salesforce analytics and automatic Google/Facebook measurement, including queued CCT uploads. Preserves functional account, media and notification services.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 1.116.4 | `ARM64_V8A`: 1627, `ARMEABI_V7A`: 1627, `X86`: 1627, `X86_64`: 1627 | 24 | Ondersteund |

### Hide ads

**Standaard: Aan**

Suppresses inspected video, banner and pause-ad requests and uses a supplied live fallback when available. Ad-supported playback and stitched streams require runtime feedback.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 1.116.4 | `ARM64_V8A`: 1627, `ARMEABI_V7A`: 1627, `X86`: 1627, `X86_64`: 1627 | 24 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Includes tracking controls. Saves OneTrust's real Reject All choice after SDK readiness and skips automatic notification setup. Notifications default off; manual privacy and notification settings remain available.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 1.116.4 | `ARM64_V8A`: 1627, `ARMEABI_V7A`: 1627, `X86`: 1627, `X86_64`: 1627 | 24 | Ondersteund |

## Videoland Android TV

`nl.rtl.videoland.v2`


### Disable tracking

**Standaard: Aan**

Disables inspected Tealium, Snowplow, NPAW, advertising-ID, New Relic and automatic Google/Facebook measurement paths, including queued CCT uploads. Functional services remain; full traffic acceptance is pending.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 1.117.0 | `ARM64_V8A`: 1622, `ARMEABI_V7A`: 1622, `X86`: 1622, `X86_64`: 1622 | 24 | Ondersteund |

### Hide ads

**Standaard: Aan**

Suppresses client video, banner and pause-ad requests. Uses the supplied live fallback when Yospace resource creation is omitted. Ad-supported playback and server-side coverage need feedback.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 1.117.0 | `ARM64_V8A`: 1622, `ARMEABI_V7A`: 1622, `X86`: 1622, `X86_64`: 1622 | 24 | Ondersteund |

### Hide unavailable content

**Standaard: Aan**

Hides subscription-required catalogue entries and action buttons, and removes empty seasons. Preserves content available to the current account and other access checks.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 1.117.0 | `ARM64_V8A`: 1622, `ARMEABI_V7A`: 1622, `X86`: 1622, `X86_64`: 1622 | 24 | Ondersteund |

## Voetbal International

`nl.vi`


### Disable tracking

**Standaard: Aan**

Disables audited analytics, profiling, advertising identifiers and known stored telemetry uploads. Preserves account authentication, push infrastructure and native media playback.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 5.13.52 | `ARM64_V8A`: 910, `ARMEABI_V7A`: 910, `X86`: 910, `X86_64`: 910 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Hides native ad placements and publisher marketing cards, and blocks display/video ad activation while preserving articles, content playback and navigation.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 5.13.52 | `ARM64_V8A`: 910, `ARMEABI_V7A`: 910, `X86`: 910, `X86_64`: 910 | 32 | Ondersteund |

### Read full articles

**Standaard: Aan**

Requests complete article bodies through the shipped app API and removes locked Pro overlays. Preserves actual account and subscription state; media availability remains controlled by the publisher.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 5.13.52 | `ARM64_V8A`: 910, `ARMEABI_V7A`: 910, `X86`: 910, `X86_64`: 910 | 32 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Stops startup and manually reopened advertising-consent forms before display, without inventing a consent choice. Preserves the app's age check for betting features.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 5.13.52 | `ARM64_V8A`: 910, `ARMEABI_V7A`: 910, `X86`: 910, `X86_64`: 910 | 32 | Ondersteund |

## Volkskrant

`be.persgroep.android.news.mobilevk`


### Disable tracking

**Standaard: Aan**

Suppresses native analytics collectors and queued uploads, advertising identifiers, ContentSquare/Heap WebView instrumentation and known web collector requests while preserving content, account and push.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

### Hide Premium banner

**Standaard: Aan**

Suppresses marketing templates, sticky purchase prompts and premium label presentation, retaining manual account navigation.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

### Hide ads

**Standaard: Aan**

Suppresses native ad requests, header bidding, video prerolls, body ad DTOs and exact article newsletter promotions; filters known web advertising resources.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

### Read full articles

**Standaard: Aan**

Renders all editorial body components received from the article API using the normal successful empty marketing-template result, without changing account or purchase entitlements.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Completes automatic consent refresh without opening the advertising choice screen or writing acceptance; automatically finishes first-launch login, welcome and notification setup with fresh subscriptions off; manual privacy, account and notification settings remain available.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 7.53.1 | `ARM64_V8A`: 23136515, `ARMEABI_V7A`: 23136515, `X86`: 23136515, `X86_64`: 23136515 | 32 | Ondersteund |

## Weeronline

`com.xs2theworld.weeronline`


### Disable tracking

**Standaard: Aan**

Disables Firebase Analytics, Crashlytics, Performance, Sessions and In-App Messaging, the Facebook SDK and app events, Audience Network, the cross-app PPID, advertising IDs, Blue Billywig video statistics, Tag Manager, Didomi metrics and optional RevenueCat telemetry, while retaining weather, consent and subscription services.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 3.61.0 | `ARM64_V8A`: 2030006811, `ARMEABI_V7A`: 2030006811, `X86`: 2030006811, `X86_64`: 2030006811 | 26 | Ondersteund |

### Hide Premium banner

**Standaard: Aan**

Hides the Weeronline Plus menu entry, the startup Plus screen, the app-launch promotion paywall, the Plus screen opened after declining consent, and the Plus footer in tile settings. Tapping a locked feature still explains Plus.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 3.61.0 | `ARM64_V8A`: 2030006811, `ARMEABI_V7A`: 2030006811, `X86`: 2030006811, `X86_64`: 2030006811 | 26 | Ondersteund |

### Hide ads

**Standaard: Aan**

Removes banner, sticky, feed, news, interstitial and sponsored ads and video pre-, mid- and post-rolls, and does not start Google Mobile Ads or Audience Network. Plus features stay locked.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 3.61.0 | `ARM64_V8A`: 2030006811, `ARMEABI_V7A`: 2030006811, `X86`: 2030006811, `X86_64`: 2030006811 | 26 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Skips the cookie onboarding page, the automatic Didomi consent notice and the consent-or-pay wall after disabling tracking and ads. Records no consent choice; Privacy settings in the menu remain available.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 3.61.0 | `ARM64_V8A`: 2030006811, `ARMEABI_V7A`: 2030006811, `X86`: 2030006811, `X86_64`: 2030006811 | 26 | Ondersteund |

### Unlock Plus

**Standaard: Aan**

Unlocks locally enforced Weeronline Plus features, including paid dashboard tiles, tile visibility and reordering, rain notifications for saved locations, and ad-free presentation. Does not create a Play Store purchase or guarantee server-side notification delivery.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 3.61.0 | `ARM64_V8A`: 2030006811, `ARMEABI_V7A`: 2030006811, `X86`: 2030006811, `X86_64`: 2030006811 | 26 | Ondersteund |

## Weerplaza

`nl.weerplaza.app`


### Disable tracking

**Standaard: Aan**

Disables app/Firebase analytics, Crashlytics, Performance, Sessions, PPID, advertising identifiers, video statistics, Didomi metrics/API events, optional RevenueCat telemetry and known WebView trackers, retaining weather, purchases and push.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 3.13.1 | `ARM64_V8A`: 734, `ARMEABI_V7A`: 734, `X86`: 734, `X86_64`: 734 | 26 | Ondersteund |

### Fix Google Maps

**Standaard: Aan**

Supplies the authorized community Google Maps key after re-signing, leaving Firebase configuration unchanged.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 3.13.1 | `ARM64_V8A`: 734, `ARMEABI_V7A`: 734, `X86`: 734, `X86_64`: 734 | 26 | Ondersteund |

### Hide Premium banner

**Standaard: Aan**

Hides subscription menus, settings promotions, automatic paywalls, declined-consent upsells and locked-hourly subscription notices. Paid hourly data remains unchanged for subscribers.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 3.13.1 | `ARM64_V8A`: 734, `ARMEABI_V7A`: 734, `X86`: 734, `X86_64`: 734 | 26 | Ondersteund |

### Hide ads

**Standaard: Aan**

Disables native, Compose, WebView and bottom-navigation banners, Google/OpenWrap loading, ad targeting and video ads while preserving weather completion and paid feature state.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 3.13.1 | `ARM64_V8A`: 734, `ARMEABI_V7A`: 734, `X86`: 734, `X86_64`: 734 | 26 | Ondersteund |

### Skip consent screens

**Standaard: Aan**

Skips automatic consent through the existing ConsentNotRequired completion after disabling ads and tracking. Records no consent choice and retains manual privacy settings.

| App-versie | Build per architectuur | Min. SDK | Status |
| --- | --- | --- | --- |
| 3.13.1 | `ARM64_V8A`: 734, `ARMEABI_V7A`: 734, `X86`: 734, `X86_64`: 734 | 26 | Ondersteund |

[Metadata](https://github.com/johnneerdael/dutch-applications-patches/blob/main/patches-list.json) · [Releases](https://github.com/johnneerdael/dutch-applications-patches/releases)
