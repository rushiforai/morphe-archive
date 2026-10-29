# TVgids.nl research — 2026-10-28

Status: static research complete; runtime, server and re-signing validation outstanding. No application patch, signing, device action, login or purchase has been performed. **Seen** means inspected artifact evidence, **inferred** means a candidate or deduction, and **unknown** means behavior not established by that evidence.

Private paths below resolve under `/Volumes/MorpheResearch/research-2026-10-28/apps/tvgids-nl/`. Inputs are pinned copies of `/Volumes/EXT-SSD1/phone-apks/tvgids.nl-original.apk`. Raw code, credentials, object pools and generated instrumentation remain private on the SSD.

## Artifact and analysis boundary

**Seen:** package `nl.tvgids`, version **7.0.16 / 106691**, minimum SDK26, compile SDK36. Standalone APK SHA-256 `10a2672434fca0b4143e23606e83a8a5cefd6828be8808d63b1777eca7510ac7`; publisher certificate SHA-256 `3d945a319ab73ffdcae24f3b9bf031891f4e362160c83bc8e5369a1a4ceb638f`. Both DEX files were decoded, alongside assets and native libraries for arm64-v8a, armeabi-v7a and x86_64 (`inventory.json`, `badging.txt`, `signer.txt`, `decoded/`).

**Seen:** application logic is Flutter AOT, with native Android platform-view and analytics bridges. Java-only inspection does not cover its UI or all analytics. The ARM64 engine identifies Dart **3.12.1**, snapshot `ace654289f5abc240509fc941453ebc5`, product/compressed-pointers. `libapp.so` SHA-256 is `5b9e587b8b5a23d20ae8178fe0eb8918eccf8b016a8ac12fbf518e80003ad402`.

Leanrea CLI analysis was extended with SSD-local Blutter revision `4a60ac648bf448c5a7596437243bcd0b9376fdf0`, built against the matching Dart runtime. A local SDK/linker mismatch was resolved by selecting the installed macOS26.5 SDK for this isolated tool; a local Capstone library alias resolved its load path. The APK was unchanged. Extraction completed successfully (`blutter-aot.log`), producing symbolized ARM64 assembly and object pools in `recon/aot/`. The **196 app Dart libraries / 1,935 recovered functions** are indexed in `recon/app-dart-function-index.json`. These are reconstructed assembly annotations, not recovered original Dart source. Generated Frida scripts were not run.

**Unknown:** other-ABI semantic parity, unresolved Dart dynamic dispatch, remote creatives/scripts, observed traffic, and re-signing behavior. Other ABIs were inventoried, not given equivalent AOT control-flow reconstruction. REA capability inspection was used for the native-analysis tooling gap; no REA decompilation or Hopper installation is claimed.

## Display advertising and layout contracts

**Seen:** `MainActivity.c(Lrt1;)V` constructs the native advertising SDK (`qj2`) with production configuration, creates the `channel.osb` handler through `yn8`, and registers platform-view type **`tvgids/ad`** through `xa` (`decoded/smali_classes2/nl/tvgids/MainActivity.smali:29`, `decoded/smali/yn8.smali`, `decoded/smali_classes2/xa.smali`). These are actual application entry points, not SDK presence alone.

**Seen:** Dart `AdsProvider.get` (`0x77cd30`) fetches/cache-selects placement configuration. Its asynchronous `fetch` (`0x77ce94`) requests the app's `https://json.tvgids.nl/v7/ads/...` / `.../v7/ad...` routes through the shared functional `NetworkHelper.getData`, caches the result and notifies listeners. The same host supplies account, guide and editorial data. Do not block the host or replace the shared network helper.

**Seen:** `AdvertisementSlot` uses that configuration to construct `Advertisement` and placement padding (`ui/components/advertisement/advertisement_slot.dart`, closure `0x77c52c`). Sticky and growable wrappers independently manage height, scroll anchoring, visibility and failure state. Dart `_onPlatformViewCreated` (`0x77afd8`) creates its controller, invokes `_loadAd`, and notifies the growable wrapper. `AdvertisementViewController.loadAd` (`0x77b284`) calls the native method channel. Its callback (`0x77b40c`) dispatches `onAdEvent` and `onAdFailure`; `onAdFailure` (`0x7445d8`) updates the wrapper's failure state. `dispose` (`0x871370`) sends `disposeAd`, unregisters its channel handler and cancels its controller timer.

**Seen:** `MainActivity.n(String,String,Map,h9):LinearLayout` builds `f6` configuration and calls `p7.p2(...)` (`MainActivity.smali:240`; `decoded/smali/p7.smali:677`). Invalid configuration and invalid Activity context have real callback/error branches and return hidden native containers. Its broad exception handler instead creates a visible **Ad Failure** TextView. Throwing exceptions is therefore not an ad-removal strategy.

**Seen:** missing/failed configuration can render `AdFailedPlaceholder`, which can fetch a house/fallback image from `tvgidsassets.nl/upload/` and otherwise renders a constrained fallback (`ad_failure_placeholder.dart`, build `0x77972c`). A null result or a failed network request is not established to remove the occupied space or promotion. Upstream placement/layout suppression and native request/initializer suppression must be considered together.

**Inferred:** a future Dart-level candidate would omit only advertising widgets and their extra padding, while a native bridge candidate must retain valid platform-view objects and resolve load/event callbacks. Bytecode-only patches do not automatically reach the Dart widgets. Native AOT modifications would require exact ELF/ABI guards and an implementation strategy distinct from copying the existing native-Android news patches.

The shipped **TVgids** advertising configuration is `decoded/assets/tvgids/default.json`: DFP, Prebid, Xandr, performance, tracking, products/templates and BrandMetrics are configurable. Numerous other-brand JSON files are bundled; they are not proof that those brands or configurations are active here.

## Additional promotions, video and remote content

**Seen:** advertising extends beyond the native slot bridge:

- `NLZietAdBar.build` (`0x937268`) checks its display condition; its click closure (`0x9377bc`) emits an OSB `promo_links/nlziet` event and opens a URL with affiliate campaign parameters. A related article-detail promotion also exists. Suppress the specifically identified promotion rather than all intentional where-to-watch links.
- `ChannelBannerWidget` (`channel_banner_widget.dart`) renders API-provided banner text/colors, records visibility, and handles taps through `NotificationHelper.handleUrl`, with `channel_id` and `campaign_id` analytics (`0x78bd64`). Some banner content may be service information; remote content classification remains necessary before deleting every channel banner.
- Branded carousel UI and its visibility/click tracking are implemented in `home_list/branded_carousel_item.dart` (`checkVisibility 0x78285c`, `notifyOsb 0x7829cc`), using `isBrandedCarousel`/campaign metadata. Article and collection models also carry campaign fields. A campaign ID alone is not a safe global editorial-content deletion predicate.

**Seen:** editorial trailers use YouTube iframe controllers, including `yt_full_screen_player.dart` init `0x7f3eec` and dispose `0x8717fc`; resizable article WebViews have separate YouTube/embed handling. Instagram and arbitrary remote HTML are additional surfaces. Native slot suppression does not establish that third-party embedded-player advertising or tracking is eliminated.

**Seen SDK integration:** the attached native ad system contains an IMA loader and native-video creative rendering. This needs separate classification from editorial YouTube playback. Native-bridge follow-up records the exact creative activation and request/error paths; no executed VAST/VMAP, playlist or server-side inserted-media capture has been made. Bundled Google rewarded/app-open/interstitial adapters and Xandr mediation are capability evidence, not proof that the app requests each format independently.

## Tracking, identifiers and initialization

**Seen:** Dart `main` (`0xa7339c`) configures OSB before Firebase initialization, installs the background-messaging handler, initializes local notifications and then calls `SentryFlutter.init`. The Sentry options closure (`0xa7999c`) sets its DSN from the app environment; the app-runner closure (`0xa78e28`) actually invokes `runApp`. **Do not no-op SentryFlutter.init without preserving execution of the app runner.**

**Seen:** central OSB methods send page views, events with account ID and visibility impressions over the native channel:

| Dart method | ARM64 address | Role |
|---|---|---|
| `OSB.sendEventWithData` | `0x694514` | Adds account context and invokes native `sendEventWithData`. |
| `OSB.sendPageView` | `0x6c7b6c` | Page tracking and account context. |
| `OSB.sendViewableImpression` | `0x6ff1f8` | Impression tracking and account context. |
| `OSB.setPageWithData` | `0x7669d0` | Page/context update; classify separately from uploads. |
| `OSB.setConsent` | `0x7752bc` | Native consent update; retain manual privacy and completion semantics. |
| `OSB.config` | `0xa78c74` | Initializes tracker configuration with `voorkeuren.tvgids.nl`. |

The globals wrappers feed these methods from many screens. `canSendAnalytics` (`0x694800`) checks an application lifecycle state; that check is **not a consent decision**. Visibility tracking (`0x6fecec`) includes page/item/campaign information, with seen-item state. Suppressing one visible page event misses startup, impressions and background collection.

**Seen:** native `jz3.g(int,Map)` assembles events and starts upload work; `h(String,String,Map)` updates context and calls that event sink; `i(int,Map)` stores context for a later event. `j(String)` processes/persists IAB consent and is not a generic analytics sink. `jz3.d()` requests the Google advertising ID. The CMP URL builder selects cached `osb-cduid`, then advertising ID, then Android ID (`decoded/smali/da.smali:6140–6265`), so merely returning no advertising ID can fall through to a different identifier.

**Seen:** OSB initialization calls `jz3.k()`; that method creates a location tracker and may request/read network/GPS location when Android permissions allow (`jz3.smali:3162–3520`). Its lifecycle methods stop/restart location and upload work. The manifest declares coarse location. These are app-wired collection entry points; whether a particular device grants permission or uploads a location was not observed.

**Seen:** `ComscoreService` starts from its constructor (`0x69cbb4`); `start` (`0x69d0a4`) initializes publisher configuration and invokes both `Analytics.start` and foreground notification. `init` (`0x69d338`) supplies `cs_fpid` and site context; `getFPID` (`0x69de8c`) constructs a time/random-based value. `comscorePageView` (`0x6c7320`) sends NMO content/category fields. This passes through the registered native `ComscoreAnalyticsFlutterPlugin` and native Comscore library; blocking only OSB does not cover it. These are app-use/media-measurement events, not evidence that this path records a microphone.

**Seen:** background push has an independent tracker: `handleFirebaseBackgroundMessage` (`0x6ef3c8`) obtains `device_unique_id`, builds device/app User-Agent and notification/campaign/push fields, then POSTs an OSB hit to **`https://voorkeuren.tvgids.nl/v1/_`**. The emitted action is `received_background`. This does not pass through the foreground OSB event methods. Preserve Firebase initialization, notification delivery/routing and local reminders while suppressing the optional tracking POST.

**Seen:** startup providers include Google Mobile Ads, Facebook, Firebase, Sentry performance and Sentry NDK preload. The manifest has no Facebook auto-init/auto-event/advertising-ID opt-out metadata. Provider presence alone does not establish a network request: Sentry performance startup measurement/NDK preload and Firebase push initialization differ from analytics upload. The app's actual Dart Sentry initialization is separate evidence. Facebook login, Google login, secure storage, notification and sharing plugins are registered; preserve their user-invoked functionality.

## Consent, authentication and content boundary

**Seen:** OSB consent is stored in `osb_consent_string`, parsed/validated through a native method, and surfaced through a WebView. `_handleConsentMessage` (`0x775098`) calls `setOSBConsent`, with explicit WebView navigation/close paths. Native SDK consent and ad consent are separate state paths. Changes must retain one valid channel reply and manual privacy behavior, and must not create a fake accepted consent value to obtain content.

**Seen:** OAuth password, identity-token and refresh grants, secure token storage, bearer interception, social sign-in and account operations are real functional flows. `BearerOAuth1Interceptor.onRequest` (`0xa1fe0c`) fetches/refreshes tokens; `onError` (`0xa1ecf4`) handles refresh. Saved items and notification preferences use account endpoints. Shipped app credentials are read-only research evidence and are not reproduced or exercised here.

**Bounded result:** no premium/subscription/purchase/billing-named app Dart library was recovered among the 196 app libraries, and no reader-premium gate was established in the inspected app-owned paths. This is not proof that every backend resource is anonymous. Third-party streaming services linked by TVgids have their own accounts/subscriptions; no bypass claim is made. No publisher body/media fetch was required to establish the identified ad/tracking contracts.

## Host roles and candidate implementation scope

| Host/surface | Established role | Boundary |
|---|---|---|
| `json.tvgids.nl/v7/` | Guide/editorial/account/overlay and ad configuration | Preserve normal transport/auth; ad paths can be considered individually. |
| `voorkeuren.tvgids.nl` | OSB configuration, CMP and event collection, including independent background-push POST | Shared role: isolate uploads and identifiers while retaining manual privacy completion. |
| `sentry02.isource.nl` | Configured Sentry destination | Suppress telemetry without suppressing the app runner. |
| Native Comscore collectors | Audience measurement | Independent native SDK start/event sinks; runtime collector traffic remains unobserved. |
| `tvgidsassets.nl` | Editorial images and ad-failure/house creative assets | Whole-host blocking would damage content. |
| YouTube/Instagram/remote WebViews | User-facing embedded content with external scripts | Separate policy and runtime capture needed; preserve resizing/navigation/video lifecycle. |
| NLZiet affiliate link | Explicit promotion/external navigation | Specific promotional widget can be separated from ordinary provider links. |

**Inferred implementation order:** (1) establish a consistently re-signed unmodified baseline; (2) separately suppress native ad requests and Dart ad placement/padding/fallbacks; (3) cover explicit affiliate/branded placements with proven classifiers; (4) suppress foreground OSB, native startup/queued work and the independent background-push tracker; (5) suppress Comscore and Sentry while preserving typed results, initialization contracts and app runner; (6) address remote embed resources only from additional evidence.

Required future validation includes fresh/existing consent and cached IDs, manual privacy, all ad slot layouts and rotation/scroll anchoring, load/dispose races, offline/retry/no-fill/house fallbacks, guide/search/editorial navigation, login/token refresh/saved items, local reminders and push, background isolate startup, embedded trailers and audio/video lifecycle. Network capture must cover cold startup, foreground use, background notification delivery and restart with previously queued events. No claim of complete ad/tracking removal or runtime acceptance is made by this report.

## Exact-build evidence anchors

`recon/java-anchor-hashes.json` records six complete decoded method blocks, SHA-256 from `.method` through `.end method` without final newline. `recon/arm64-dart-anchor-hashes.json` maps twelve recovered function ranges through ELF PT_LOAD segments and hashes the actual native bytes. These identify this build; they are not an implemented patch or proof of equivalent control flow in another ABI.

## Native follow-up: completion, collection and video contracts

**Seen:** platform-view factory `xa.create` constructs `wa`, which implements the Flutter view, `h9` ad-event callback and method handler (`decoded/smali/wa.smali`). Each view has channel `tvgids/ad_<viewId>`. Constructor and `loadAd` can schedule request Runnable `ua` discriminator0 after **50ms**. `loadAd` immediately acknowledges `success(null)`; later native events are a separate channel. The Runnable invokes `MainActivity.n` only when no retained ad view exists, then attaches the layout. A gate placed only on a later Dart request misses constructor scheduling.

**Seen:** `wa.a(g9)` (`:586`) sends subscribed events as `onAdEvent` with message/code/**dateTime**, plus widthDp/heightDp for the size event. Failure subclasses produce `onAdFailure` with message/code. Its `dispose` (`:998`) unregisters the method handler, removes views and clears the ad reference, but no cancellation of the pending Handler Runnable was found there. This is a static race risk, not an observed failure. A future suppression path must cancel pending work and retain exactly one reply to each recognized channel call; it must not manufacture loaded/impression events. Root-level Dart slot/fallback suppression remains necessary to avoid house ads or occupied space.

**Seen:** OSB has a precise final upload seam: `xs8.i()` drains collector-owned queued records and calls **`xs8.k(String,String):void`** (`decoded/smali/xs8.smali:2366–2743`). That method alone performs the synchronous JSON POST and takes no Flutter result, continuation or completion callback. A method-scoped no-op there is a defensible final transport guard. It must be paired with upstream `jz3.g` suppression before event threads/identifier assembly and `jz3.k` GPS suppression. `onResume` restarts GPS and queue draining even when debug logging is false; debug is not an opt-out. No repeating heartbeat timer was established in these native methods; event cadence elsewhere remains a runtime question.

**Seen:** native config sets real initialized state and lifecycle/queue objects, then acknowledges its channel result. Consent persistence/validation and CMP URL construction are functional privacy contracts. The inspected CMP URL branch appears to send success/error and then fall through to `notImplemented` on the same result (`da.smali:6315–6346`); this is an apparent existing double-reply risk without runtime reproduction. Any rewrite must use exactly one valid completion. Returning null for every OSB method would break URL, validity and consent results.

**Seen:** native video-ad activation is specifically `NativeAdModel$Video` in `iu3.v(...)` (`decoded/smali/iu3.smali:3239–3343`) → `pb6` → `vf2` FrameLayout (`pb6.smali:341–365`). `vf2` builds IMA settings, initializes the SDK unless in preview, and uses `h7` discriminator **20 / 0x14** for the loader. Do not infer an IMA loader from another use of this merged class. `vf2.f()` (`:728–828`) requests only once and outside preview, supplies already-delivered XML through **setAdsResponse**, an empty ad-tag URL, and autoplay/muted flags. Actual remote XML/format activation was not fetched.

**Seen:** IMA loaded/error handlers install listeners, initialize the manager, update error state and forward typed failure/event notifications to `h9` and Flutter. Native player lifecycle methods destroy/pause/resume and clean up listeners. Prefer preventing the ad view/request before it starts. This is video inside a native advertisement creative, not evidence of an editorial YouTube preroll, DAI or stitched stream. The complete focused note is private `recon/native-followup.md`.

## Anchor verification tables

The following ARM64 hashes cover real ELF byte ranges, mapped through PT_LOAD segments. The corresponding symbolized assembly is under `recon/aot/asm/`.


| App function | Address / size | Native SHA-256 |
|---|---|---|
| `main.dart static Future<void> main() async` | `0xa7339c / 0x268` | `3b3444b1fe7d78e754fb0380bf91b0732ee7f2ce000a5fec17216a9ba0ed57bc` |
| `core/provider/ads_provider.dart _ fetch() async` | `0x77ce94 / 0x66c` | `d3769e4b9a634172d1f4eaa1caf348f87ea728690ad4b0f6da3058c266723ffd` |
| `core/services/osb_functionality.dart _ sendEventWithData() async` | `0x694514 / 0x2ec` | `c8eef459d0b8cba8b48e67dd0dc9c2fa3e1e4cfa66a0b0a5b349bd7f98cbf8d8` |
| `core/services/osb_functionality.dart _ sendPageView() async` | `0x6c7b6c / 0x17c` | `83cf271dcd456ff1ebb125e4660fc1685870b3c74bad7afe36c04d87fe3b8313` |
| `core/services/osb_functionality.dart _ sendViewableImpression() async` | `0x6ff1f8 / 0x144` | `f69af6280fe05cd0f44701b1973fd736e0d3f0d8c862d341535b8ec2cae270b2` |
| `core/services/osb_functionality.dart _ config() async` | `0xa78c74 / 0x150` | `46437df96b556c27345dd5145c95a0a084b9db654afef2602973415d958cc8a6` |
| `core/services/comscore_nmo.dart _ start() async` | `0x69d0a4 / 0x88` | `b1f84d434925f66ff2336ef5e6190ad1c72e28675e0603ee906a49a986d25d77` |
| `core/services/comscore_nmo.dart _ comscorePageView()` | `0x6c7320 / 0x1a8` | `a7c28f08132dd4d17131caa16974bfadb65b7255be2dfe9264ce80f6098379c9` |
| `core/services/firebase_background_handler.dart static Future<void> handleFirebaseBackgroundMessage(RemoteMessage) async` | `0x6ef3c8 / 0x7e8` | `4c12695de0e4ba3d0c755d4a0def96bb178c488488c89450398137a9a8c13803` |
| `ui/components/advertisement/advertisement.dart _ _loadAd() async` | `0x77b104 / 0x180` | `ad40d79c5045c47cf321d974791fd83919f2affbcb85204dfb40ff0ae38c7df8` |
| `ui/components/advertisement/advertisement.dart _ dispose()` | `0x871370 / 0x8c` | `4181e1956a1edd421ad4533cfd448cb540349724745cf83b69650ac215800f1f` |
| `ui/components/nlziet_ad_bar.dart _ build()` | `0x937268 / 0x38c` | `70732f63d7c3418fd0c1cb507e11ea67533f38b4e2305855b2e33ad0b1cfebb3` |

The complete native Android bridge method blocks were independently hashed separately:

| Source / method | SHA-256 |
|---|---|
| `decoded/smali_classes2/nl/tvgids/MainActivity.smali:27` — `c(Lrt1;)V` | `7db9f31665491068bf288673caa03f890ec35a8549c4b7738d84e79b83997eb3` |
| `decoded/smali_classes2/nl/tvgids/MainActivity.smali:240` — `n(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lh9;)Landroid/widget/LinearLayout;` | `7205cf02bc14ef75681e27cc8a53f4a25cccfeb7f9120f9d396946d088ba6a37` |
| `decoded/smali/da.smali:3186` — `onMethodCall(Lin3;Lln3;)V` | `cfd9e8da8f4df54979b913bc8c4ce6d9f8c859777ccc919d50584b8439207e9d` |
| `decoded/smali_classes2/jz3.smali:2363` — `g(ILjava/util/Map;)V` | `69765b7f0194655fcfc762d4ca23af3b7d4095f607ab79765f6a31b6ac13209a` |
| `decoded/smali_classes2/jz3.smali:2017` — `d()Ljava/lang/String;` | `8e3040fbeb559454a9a189d48b56a77c6e3e7f53c0575425e33c53ab3703203b` |
| `decoded/smali_classes2/jz3.smali:2898` — `j(Ljava/lang/String;)V` | `1c86517f047b2e0f445fe7f67fb75ae7f63c9185db1dabbee93790b529c5d17a` |
