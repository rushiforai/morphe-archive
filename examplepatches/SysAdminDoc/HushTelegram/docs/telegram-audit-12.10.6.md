# Telegram 12.10.6 app audit for patch work

This audit maps sponsored content, tracking and common friction in the official Telegram Android web APK used by HushTelegram. It connects those app paths to the patches already in this repository and records where another patch could help.

Audit date: 2026-10-09. The binary is Telegram 12.10.6, version code 71129, package `org.telegram.messenger.web`. Its SHA-256 is `7827ea506d297644b1d350266bdfbd8d5d38a7869fa3fc1a0fbcb1ebc81f45ad`. The local fixture is `fixtures/telegram-web-12.10.6-71129.apk`.

## What the evidence establishes

This report keeps the following kinds of evidence separate:

| Evidence | What it establishes | What it cannot establish |
|---|---|---|
| The pinned APK and targeted DEX inspection | Which request types and telemetry builders are present, the methods that reach them, the nearby UI paths, and the bytecode shapes available for fingerprints | Whether Telegram's servers return a sponsored item for a particular account or region, or whether every conditional path runs |
| HushTelegram source and fixture tests | Which paths the current patches target, their on/off behavior, and the coverage the repo currently proves | That a new Telegram build has the same bytecode shape |
| Telegram's current privacy policy and API documentation | What Telegram says it does and how clients are expected to implement the documented API | That every policy-described placement is implemented in build 12.10.6 |
| First-run screenshots in the factory reference | The welcome and phone-entry flow before sign-in | Account-only screens, signed-in settings, live ads, and server-returned recommendations |
| [Signed-in S22 runtime audit](telegram-runtime-audit-12.10.7.md) | Official beta 12.10.7 UI, a live sponsored search row, native request names, app-filtered packet observations and bounded background measurements | Exact encrypted RPC payloads, overnight battery life or patched behavior |

The DEX pass inspected 21,640 classes and followed the ad request constructors and the app-log event builders. It was a targeted static inspection, without a full source decompile or third-party SDK inventory. Subsequent runtime work captured signed-out 12.10.6 traffic on an Android 13 emulator, followed by signed-in 12.10.7 traffic on a physical S22. The [runtime report](telegram-runtime-audit-12.10.7.md) records those observations separately, including a live search ad and native send-path logs for sponsored fetches, an impression report and read metrics. The captures don't decode Telegram RPC payloads or establish every analytics destination. The factory welcome, phone-verification and permission flow is recorded in the [Telegram factory APK reference](telegram-app-reference.md).

## How sponsored content reaches the app

Telegram sends a client request for sponsored content, then the app places the returned payload in a particular part of the UI. In this build, the three verified fetch paths are channel or bot conversations, full-screen channel videos, and global search.

| Placement | Exact-build request path | Where it appears and what triggers it |
|---|---|---|
| Channel and bot conversations | `MessagesController.getSponsoredMessages(long)` builds `TLRPC$TL_messages_getSponsoredMessages` and sends it through `ConnectionsManager.sendRequest` when the cache has no answer. The request includes the peer. | A channel sponsored message appears after the last post when the user scrolls past it. A bot ad appears in the action bar above the bot chat. Telegram's API says to cache the result for five minutes. |
| Full-screen channel video | `VideoAds.load()` builds the same request type with the channel peer and the video message ID in `msg_id`. | Ads appear in a small player box while the video plays. Server data controls start delay, spacing and minimum and maximum display time. The timers pause with the video. |
| Global search | An R8-renamed search method builds `TLRPC$TL_contacts_getSponsoredPeers`, puts the search string in `q`, then sends it through `ConnectionsManager.sendRequest`. | The exact build enters this path when a non-empty query reaches four characters and Telegram's Premium and server flags allow it. Sponsored peers are inserted after the user's own results and before the other server results. Telegram receives the typed public-search query as part of that request. |
| Stories | Telegram's current privacy policy lists Stories as an ad placement. | A separate Stories ad fetch or insertion path has not been confirmed in the 12.10.6 binary. Check the next APK before treating it as a confirmed HushTelegram gap. |

Campaign text is carried in the server response for each request. A sponsored-message record includes a random ID, title and text, plus optional media, photo, button, destination URL, color and sponsor details. Sponsored-peer results carry a peer, random ID and optional sponsor details. Those fields explain why a request-level patch can stop a row before Telegram renders it.

Telegram's current policy says ads can appear in public channels with at least 1,000 subscribers, bots, Stories and public search. Its ad platform lets advertisers choose public channels, set a cost per thousand views and set a total budget. The platform's getting-started page says an ad's destination is a Telegram channel or bot. See [Telegram Ads](https://ads.telegram.org/getting-started) and the [sponsored-message API](https://core.telegram.org/api/sponsored-messages).

The current privacy policy says ad selection can use the topic of a public channel or public search term. Its August 21, 2026 update also describes content language, an approximate country or city based on phone country and area codes or IP address, and broad categories inferred from following enough large public channels. Telegram says it doesn't use private chat contents or contact lists for ad targeting, doesn't give the targeting data to advertisers, and excludes Premium accounts from the Ad Platform. These are current service-policy statements. They don't prove that every targeting signal or placement was active in the 12.10.6 client. See [Telegram's privacy policy, sections 5.6 and 5.6.1](https://telegram.org/privacy?setln=en).

### Ad impressions and clicks

Ad delivery has its own reporting requests. The API expects `messages.viewSponsoredMessage` with the ad's opaque `random_id` when its full text is visible. For search ads, the API says to report the view when the sponsored peer scrolls into view. A tap invokes `messages.clickSponsoredMessage`. Its `media` and `fullscreen` flags distinguish media actions. Reports use the same `random_id` returned with the ad. The API also defines a separate report action.

The exact APK contains kept request classes for both view and click reports. Channel message UI has a view-report path and a click handler. Search result taps also build a click report. The video reporting methods are present, but their network sends sit behind `BuildVars.DEBUG_PRIVATE_VERSION` in this fixture. The production value of that flag was not evaluated here.

`Hide ads` returns before the channel method can return its normal cache result or send a fresh request. It also short-circuits `VideoAds.load()` and sends global search down Telegram's existing branch around the sponsored-peer request. That prevents new sponsored payloads from reaching the normal display path. The patch doesn't directly rewrite the kept view and click request senders, or remove an ad that was already rendered before a live switch change. A good regression check should cover both conditions and the report methods themselves. A separate ad-reporting switch would need a concrete case that the fetch hooks don't already cover.

## Tracking and other data flows

### Message exposure metrics

Telegram has two related but different kinds of message reporting.

* Standard read state, media-read state and channel view counters support message delivery and the counts users see in Telegram. HushTelegram treats them separately from product analytics. `Disable analytics` doesn't block normal read receipts or channel view counters.
* `messages.reportReadMetrics` is a separate usage metric. It can report a message ID, a random exposure ID, total time in the viewport, active time, and how much of the message and viewport were visible. The API documentation describes a 300 millisecond exposure threshold and a five-second batch flush. It pauses time accumulation when the app or chat isn't active. See [Telegram's view and read-metrics API](https://core.telegram.org/api/views).

The 12.10.6 app contains a channel viewport tracker that constructs this request and batches rows before sending. HushTelegram's `Disable analytics` patch locates the sender by the kept request class and skips the send while clearing the batch, so the same data isn't retried later. It reports when the target couldn't be found. The patch's existing fixture test is [`DisableAnalyticsFixtureTest.kt`](../patches/src/test/kotlin/app/morphe/patches/telegram/misc/analytics/DisableAnalyticsFixtureTest.kt).

The API also defines `messages.reportMusicListen`, which can report listening duration for music documents. Its presence in the API schema does not prove that this exact APK sends it. Check the next fixture for call sites before calling it a current telemetry gap.

### Account and safety metadata

Telegram's current policy says it may collect IP addresses, information about devices and Telegram apps you've used, and username-change history to detect spam, abuse and security problems. If collected, this metadata can be kept for up to 12 months. Telegram also says automated systems may analyze cloud-chat messages to stop spam and phishing. The policy distinguishes this service processing from ad targeting. It describes cloud chats as stored encrypted in Telegram's cloud and Secret Chats as end-to-end encrypted. A client patch can reduce optional app events and feature-triggered data. It can't control all service-side processing. See [Telegram's privacy policy, sections 3.3 and 5.2](https://telegram.org/privacy?setln=en).

### App-log events

Telegram uses `help.saveAppLog` to submit named app events as `TL_inputAppEvent` objects. The method is part of Telegram's API and supports an unauthenticated connection. In this APK, static DEX inspection found these relevant event families:

| Event or request | Data or purpose visible in the APK | HushTelegram coverage |
|---|---|---|
| `android_sdcard_exists` | A device-stat event derived from whether the selected storage root contains `/storage/emulated/`. Telegram gates it with its `collectDeviceStats` and already-logged flags. | `Disable analytics` hooks `MessagesController.logDeviceStats()` and honors those original gates. |
| `premium.promo_screen_show`, `premium.promo_screen_tap`, `premium.promo_screen_accept`, `premium.promo_screen_fail` | Whether the Premium promotion screen appeared, which item was tapped, an accepted action, or a failed purchase callback. | `Disable analytics` guards these four sends without skipping the surrounding screen or billing callback. |
| `android_dual_camera` | A device event that includes `Build.MANUFACTURER + Build.MODEL`. A separate R8-renamed method sends it when device-stat collection is enabled. | Not covered by the current `Disable analytics` targets. The event literal and request shape are better anchors than its obfuscated method name. |
| `fcm_token_request`, `fcm_token_response`, `hcm_token_request`, `hcm_token_response` | Push-registration request and response events. Event data is null. Request or response timing and peer are carried separately. | `Disable analytics` doesn't cover these. They look operational, so don't suppress them as ordinary usage metrics without checking how Telegram uses them. |

This is why blocking every `help.saveAppLog` call would be a poor privacy patch. A blanket block would catch the push-registration events along with usage events and could make notification delivery harder to diagnose. An event-specific allow or deny decision is safer.

### Call diagnostics

Call diagnostics use another path. Telegram can ask the client to prepare a call problem report, upload a log file and submit the report. HushTelegram's separate `Disable call debug upload` patch hooks the request, file upload and report send paths. Keep it separate from app usage analytics. It targets `TL_phone.saveCallDebug` and `TL_phone.saveCallLog`, not normal call signaling or call media. Its fixture test is [`DisableCallDebugFixtureTest.kt`](../patches/src/test/kotlin/app/morphe/patches/telegram/misc/calldebug/DisableCallDebugFixtureTest.kt).

### Contacts, suggestions and outside services

Telegram asks before syncing local contacts. Its current policy says it stores synced contact names and phone numbers so it can show names and notify the user when a contact joins. Users can stop syncing or delete server-side contacts under Settings, Privacy & Security, Data Settings. HushTelegram's `Hide contacts on Telegram` removes a suggested-contacts block from the chat list. `Quiet contacts nag` hides a repeated permission prompt after the user says no. Neither patch stops an already allowed sync or deletes contacts already on Telegram.

Telegram also describes aggregated usage signals for frequent-contact and inline-bot suggestions. Users can disable “Suggest Frequent Contacts” in Data Settings. This is a distinct feature from sponsored search results. A bot can receive public profile data and information the user sends or exposes by interacting with it. Opening a bot-controlled link can expose the user's IP address to that website. If the user asks Telegram to translate messages, Telegram says it may send the selected text to Google or Microsoft. Voice transcription may send the selected audio to Google. Using those features creates data flows to their providers. `Disable analytics` doesn't control those flows.

For opened or shared web links, `Strip link tracking` cleans a limited set of known query tags. It starts off. Links with other extra components can remain unchanged, and the patch doesn't rewrite Telegram's own network requests or control tracking performed after a link reaches its destination. `Open links externally` changes where ordinary web links open, but keeps Telegram links, sign-in pages and payment pages in Telegram.

## Current HushTelegram controls

These are runtime switch defaults and settings locations from the current patch descriptions. Morphe Manager's selection default is a separate choice made while building an APK.

| Patch | What it changes | Runtime default and settings location |
|---|---|---|
| [Hide ads](../patches/src/main/kotlin/app/morphe/patches/telegram/ads/HideAdsPatch.kt) | Channel and bot sponsored messages, sponsored search peers, and channel-video ads | On, HushTelegram settings > Chats |
| [Hide sponsored proxy channel](../patches/src/main/kotlin/app/morphe/patches/telegram/ads/proxy/HideSponsoredProxyPatch.kt) | Hides the proxy-added sponsored peer in the chat list and folders | On, HushTelegram settings > Chats |
| [Hide recommendations](../patches/src/main/kotlin/app/morphe/patches/telegram/misc/recommendations/HideRecommendationsPatch.kt) | Similar-channel and bot recommendations, including search's cached section | On, HushTelegram settings > Chats |
| [Hide promotional banners](../patches/src/main/kotlin/app/morphe/patches/telegram/misc/suggestions/HideSuggestionsPatch.kt) | Premium, birthday and low-Stars-balance banners above the chat list | On, HushTelegram settings > Chats |
| [Hide Premium, gifts and Stars](../patches/src/main/kotlin/app/morphe/patches/telegram/misc/commerce/HideCommercePatch.kt) | Related Settings rows, profile gift tabs and the channel gift button | On, HushTelegram settings > Chats |
| [Disable analytics](../patches/src/main/kotlin/app/morphe/patches/telegram/misc/analytics/DisableAnalyticsPatch.kt) | Selected device, channel-read and Premium interaction events | On, HushTelegram settings > Privacy |
| [Disable call debug upload](../patches/src/main/kotlin/app/morphe/patches/telegram/misc/calldebug/DisableCallDebugPatch.kt) | Server-requested call debug reports and log-file uploads | On, HushTelegram settings > Privacy |
| [Hide contacts on Telegram](../patches/src/main/kotlin/app/morphe/patches/telegram/misc/contactsblock/HideContactsBlockPatch.kt) | The suggested-contacts block below a short chat list | Off, HushTelegram settings > Chats |
| [Quiet contacts nag](../patches/src/main/kotlin/app/morphe/patches/telegram/misc/contacts/QuietContactsNagPatch.kt) | Repeated contact permission prompts after the user declines | On, HushTelegram settings > Chats |
| [Strip link tracking](../patches/src/main/kotlin/app/morphe/patches/telegram/misc/links/StripLinkTrackingPatch.kt) | Recognized tracking query tags on opened and shared links | Off, HushTelegram settings > More settings > Links |
| [Turn off haptic feedback](../patches/src/main/kotlin/app/morphe/patches/telegram/misc/haptics/NoHapticsPatch.kt) | Tap, long-press, swipe and wrong-entry vibration | Off, HushTelegram settings > Chats |

The titles in this table are Morphe Manager patch names. A few HushTelegram settings rows use different wording. `Strip link tracking` appears as `Remove link tracking tags`, and `Turn off haptic feedback` appears as `Stop vibrations on taps`. Build reports use the Manager names so a patch can be matched to the catalog entry. The settings row keeps its own title.

## Friction users may notice

| Surface | Why it can be annoying | Existing HushTelegram coverage |
|---|---|---|
| Sponsored channel messages | They appear after the last post, so scrolling to the end of a channel can reveal an ad. | `Hide ads` blocks the fetch path. |
| Sponsored search peers | A sponsored peer can sit between the user's own results and other matches. | `Hide ads` skips the sponsored-peer request. |
| Video ads | Timed labels can cover part of a video player while a user watches a channel post. | `Hide ads` skips `VideoAds.load()`. |
| Similar channel and bot suggestions | They can add extra rows after opening a channel or bot, and can reappear in search. | `Hide recommendations` blocks new requests and returns an empty cached result to search. |
| Proxy-sponsored channel | A proxy can put a promotional peer into the chat list and folders. | `Hide sponsored proxy channel` hides its local presentation. It doesn't change the proxy or stop Telegram's broader promo-data request. |
| Premium, Stars and gifts | Promotion can appear in Settings, profile gift areas, channel buttons and chat-list banners. | `Hide Premium, gifts and Stars` and `Hide promotional banners` handle different UI areas. Security notices remain visible. |
| Contact prompts and suggested contacts | Contact access can be requested again, and a suggested list can occupy space in the chat list. | `Quiet contacts nag` and `Hide contacts on Telegram` affect those UI elements only. |
| Sponsored impressions and clicks | The API records ad views and actions for the campaign, while Telegram says it doesn't target ads from private chat contents. | `Hide ads` prevents normal fetches. Direct report paths aren't independently hooked. |
| Haptic feedback | Tap and gesture vibrations can be distracting in quiet settings. | `Turn off haptic feedback` disables taps, long presses, swipes and wrong-entry haptics. Calls and notifications still vibrate. It starts off. |
| Long settings pages | The Hush settings page has many independent switches. | The page split and polish work are already in `ROADMAP.md`. |

The first-run flow has its own friction. Telegram explains call-based verification, requests phone-related permission, then moves to phone entry if permission is denied. The precise dialog varies by Android version and permission history. The factory reference records the observed Android 13 flow.

## Patch opportunities

These findings reinforce some existing [roadmap](../ROADMAP.md) items and add a few privacy and regression-check tasks.

### Verify Stories ad handling on the next Telegram build

The current policy names Stories, but the 12.10.6 scan did not establish a Stories request path. Telegram 13.0.0 is already tracked as the next app update in the roadmap. Search its DEX for sponsored constructors and calls from story playback before deciding whether a new hook is needed. If it has a distinct fetch path, give it its own capability and fixture check. Don't claim Stories coverage through `VideoAds.load()` without proof.

### Make analytics coverage event-specific and complete

Add a focused hook for `android_dual_camera` if the product intent is to stop device-attribute reporting when `Disable analytics` is on. Find it from the event string and `TL_help_saveAppLog` payload, then verify the hook on both the web and beta APKs. Decide separately whether to keep push-registration events. A blanket `help.saveAppLog` block could interfere with push diagnostics.

The next telemetry survey should search the new fixture for calls to `messages.reportMusicListen` and other behavior metrics, then record each event's payload and current patch coverage. Keep standard message delivery and read-state calls outside that list.

### Prove the ad-reporting boundary

Extend the ad fixture checks around three requests: channel or bot sponsored messages, video ads and sponsored search peers. Add negative checks for view and click reports when `Hide ads` is on, including cached results and an ad already visible when the switch changes. If an independent report path can still fire, either close that gap in `Hide ads` or add a clearly named tracking switch. Keep event reporting intact when a user turns ad hiding off.

Treat `MessagesController.getSponsoredMessages(long)`, `VideoAds.load()` and the kept `TL_messages_getSponsoredMessages` and `TL_contacts_getSponsoredPeers` types as stable anchors. The search class and method are renamed by R8. Find them by request type, `ConnectionsManager.sendRequest`, query assignment and branch shape. The view and click request classes stay readable, but their UI callers can be obfuscated.

### Respect the native contact-sync control

The current contact patches change prompts and presentation. The signed-in stock app already exposes **Sync Contacts**, **Suggest Frequent Contacts** and **Delete Synced Contacts** under Privacy and Security. Use those controls before adding another switch. Hiding a prompt or a suggested list must never be described as disabling upload or deleting cloud contacts.

The S22 inspection found Sync Contacts enabled while Android contact read/write permissions were denied. Account contacts could still appear in the UI. A regression check should therefore vary native sync, OS permission and existing cloud-contact state independently. A future patch would need a clear reason to enforce behavior beyond those native controls. Deleting previously uploaded contacts is a separate, explicit account action.

### Continue the customization work already tracked

The current roadmap has useful opportunities beyond ads and tracking:

* Local keyword and regular-expression filters for group and channel messages.
* Original media quality and filenames, sticker size, and Premium sticker or emoji tabs.
* Controls for bottom navigation, channel buttons, send-as and folder tabs.
* A HushTelegram icon and label, after verifying resource-table decode and signing behavior.
* An AMOLED-aware launch splash, requested alongside other appearance changes. Inspect the startup animation and theme transition before planning a resource edit.
* Whole-chat translation through an outside provider, with a clear notice that message text leaves the phone and careful key redaction.
* The remaining “Ask before sending” paths for sticker suggestions and recording dialogs.

Keep these as separate settings where users may want one behavior without another. Don't merge paid sponsored messages, recommendations, proxy-added promotions and Telegram's own Premium banners into one vague “ads” switch.

One open request asks to keep view-once and disappearing media. That would undo the sender's expiry choice and conflict with HushTelegram's stated policy against bypassing controls other people set. Don't treat it as a patch opportunity. Another open report asks for Plus Messenger support. This project targets the official Telegram web and beta APKs, so that request is a separate app-support question. The related chat-sorting idea already appears in the roadmap as custom chat groups.

## Patching notes for future updates

* Verify the package, version name, version code, signer and APK hash before relying on any result here. Web and beta builds need separate checks.
* Prefer kept request classes, public component names, resource names and verified control-flow shape. The search UI names are R8 output and aren't reliable across builds.
* Patch status fields report build coverage, while runtime switches report user preference. Neither proves that the server returned an ad or that the switch is currently enabled.
* Preserve stock operations around a blocked telemetry send. The Premium analytics hooks skip only the telemetry request, while the call-debug hooks check the call's original response and cleanup paths.
* Don't block `MessagesController.checkPromoInfoInternal(Z)` merely to hide the proxy-sponsored channel. It requests `help.getPromoData`, whose response also carries PSA and other promotion data. Filter the proxy peer at the presentation layer unless a request-level change is separately proven safe.
* Run fixture checks for every supported web and beta APK after a target changes. Add one positive control with each negative case so a test proves both the patch and the stock path.
* If a runtime request trace is used, keep it local. Scrub query text, peer IDs and payloads before sharing a diagnostic.

## Source links

* [Telegram Privacy Policy](https://telegram.org/privacy?setln=en), especially sections 3.4, 5.2, 5.5, 5.6, 5.6.1, 6.3, 8.4 and 8.5.
* [Sponsored-message API](https://core.telegram.org/api/sponsored-messages), including channel, video, search, view and click behavior.
* [View and read-metrics API](https://core.telegram.org/api/views), including message view counters, read metrics and music listening reports.
* [help.saveAppLog method](https://core.telegram.org/method/help.saveAppLog).
* [Telegram Ads getting started](https://ads.telegram.org/getting-started).
* [Telegram Android reproducible-build instructions](https://core.telegram.org/reproducible-builds).
* [Factory app reference](telegram-app-reference.md).
* [Hide ads source](../patches/src/main/kotlin/app/morphe/patches/telegram/ads/HideAdsPatch.kt), [analytics source](../patches/src/main/kotlin/app/morphe/patches/telegram/misc/analytics/DisableAnalyticsPatch.kt), and [call-debug source](../patches/src/main/kotlin/app/morphe/patches/telegram/misc/calldebug/DisableCallDebugPatch.kt).
