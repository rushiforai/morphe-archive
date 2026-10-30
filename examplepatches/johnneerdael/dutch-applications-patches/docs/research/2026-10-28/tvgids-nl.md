# TVgids.nl research — 2026-10-28

Current implementation and verification: [TVgids.nl audit](../../tvgids-nl-audit.md). The findings below describe the original input and research chronology.

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

## Implementation follow-up — 29 October 2026

The current original was independently checked at its SSD location; its APK hash
still matches the artifact above. All three packaged `libapp.so` hashes are now
pinned for implementation preflight:

| ABI | `libapp.so` SHA-256 | Snapshot features |
| --- | --- | --- |
| `arm64-v8a` | `5b9e587b8b5a23d20ae8178fe0eb8918eccf8b016a8ac12fbf518e80003ad402` | arm64, compressed pointers |
| `x86_64` | `606abe26e33bfcf6febdcbf2854945165eb7697ab2ed6d701b675b60e93060b6` | x64, compressed pointers |
| `armeabi-v7a` | `3b50a69edb9aad8053c71ea98ee70a5d0f51c14fe431dd1add05b2064dc205ce` | arm, uncompressed pointers |

**Seen:** the existing Blutter frontend is ARM64-specific even when code analysis
is disabled. Its matching Dart runtime could nevertheless be built for x64. An
isolated metadata indexer using that runtime and the loader recovered **23,134
Code-owned function records**, including **1,933 app records**, from the shipped
x64 snapshot without calling application code. Code ownership/deduplication means
this count is not a claim that every Function alias was enumerated. The indexer
records library/class/function, payload/entry addresses and size; selected ranges
were independently mapped through ELF PT_LOAD segments and hashed. No publisher
source, object pool, credentials or native library is included in this report.

These are x64 **identity and location anchors**, not implemented edits or proof of
semantic equivalence with ARM64. Closure wrappers can share a visible name with
their body and must not be selected by name alone. Actual native instructions,
callers, return/completion contracts and branch behavior still need checking.

| x64 app method | Payload address / size | Range SHA-256 |
| --- | --- | --- |
| `OSB.setConsent` | `0x709544 / 0x138` | `defe30a4cf720b4a49c34a7135f6d978b6299770dcd294e728e057bee397b175` |
| `OSB.sendEventWithData` | `0x70a750 / 0x3cc` | `e45ee7db84fac066924f5052f87218f1905444148e9f7270ed170b3967558a9e` |
| `ComscoreService.comscorePageView` | `0x70b630 / 0x1b4` | `fda5ed57d56bfd595c258c5667a003707ca879634b48788709044048d33bda9a` |
| `OSB.sendPageView` | `0x70bf24 / 0x1ec` | `f3755054306dc2676df2540fac7c0c835ba91d854fb6696112eabb397e6f9fc0` |
| `::.handleFirebaseBackgroundMessage` | `0x711d30 / 0x30` | `980d9c96de41b081eab333c9c52e9936071394903aa7448f75db09e4d592ca49` |
| `::.handleFirebaseBackgroundMessage` | `0x711d60 / 0xa28` | `a36969a2d5ff8405fb3f8c649990e08eddfec704b728bdb9c4c01442b074ba56` |
| `OSB.sendViewableImpression` | `0x739ed0 / 0x1a0` | `430b5c5634944368e8b117ccdd5bde09b1f82c278e028c0b5ac117bf0dd9dc54` |
| `NLZietAdBar.build` | `0x7476d8 / 0x3b0` | `9c72a629c67f326c830524b878368ec72b037ad81bf8870c1a173b6f4538cf0f` |
| `OSB.setPageWithData` | `0x775bc8 / 0xfc` | `3c4e30f35f550b67f67c06bfb3fb68fbaedc564fd99b37608de87d2c340a5a6d` |
| `ComscoreService.start` | `0x790560 / 0xa8` | `c31fb81133f1080650ce07b5f149411ee44658a73dcea53eb0576477233c716c` |
| `ComscoreService.init` | `0x790820 / 0x120` | `ffe08e41e11964565fd5d441abb1ae7d2d9c1ce3174012e8b331e916724b76f8` |
| `ComscoreService.getFPID` | `0x790eb0 / 0x180` | `41b06d75cffc2e0244dc05d0786a67c77bedadadb29c12115093c8589afa4948` |
| `_AdvertisementSlotState.build` | `0x82f5fc / 0x6c` | `37b8b8a51dba7e0c2e3d9b5efa58d07c7dd73abf02dabd9844578bed9a6b789b` |
| `AdsProvider.fetch` | `0x82fffc / 0x6e4` | `13033f6bc224bd6cd5858dd0e973ed81734f084e0cbf9b86ac240de43dd043cb` |
| `::.main` | `0xaab8fc / 0x2d8` | `0cbaa71a3a98c7b92929fd965aca26dc26124c1450f67f329f5604e626f34e5a` |
| `OSB.config` | `0xab1538 / 0x188` | `ad27c715f9ebfb5c0a3755d0ed8b09eba83ddea81662d1cddf4916a5d948077b` |
| `::.main` | `0xab2398 / 0x24` | `5335adaf8c470d1f060dc70b1c97d49b7c696eaa1d11f4572fe22f93f2df00fe` |

ARM32 metadata was subsequently recovered as described below; semantic control-flow
coverage for the new ABI maps remains an implementation gate. Upstream documents
[ARM32 as unsupported](https://github.com/worawit/blutter/issues/31) and
[x86/x64 frontend limitations](https://github.com/worawit/blutter/issues/49).
The local x64 metadata extraction above is a separate, bounded workaround.
Native-only advertising changes would leave Dart placement/fallback behavior and
the independent background tracker, so they are not a complete TVgids patch.
No TVgids control, patched APK or dev release has been produced by this follow-up.

### Native ARM32 metadata reconstruction

**Seen:** a native 32-bit metadata reader built against the matching Dart3.12.1
runtime recovered **23,176 Code-owned function records**, including **1,939 app
records**. The reader used the existing Android toolchain, a compiler-atomic
compatibility layer and a separately built, checksum-verified ICU75.1 dependency.
The normal ICU/Unicode configuration was retained. A host64/simARM loader attempt
had failed and was not used as evidence.

The small atomic-operation self-test passed on native ARM32 before the snapshot
reader ran. The reader and copied original library were hash-checked in temporary
Android scratch storage, the output was retrieved, and the scratch directory was
removed. **TVgids was neither installed nor launched**; no account, permission or
publisher API action was performed. This establishes bounded artifact metadata
reading, not app startup, UI, network absence or patch acceptance.

| ARM32 app method | Payload address / size | Range SHA-256 |
| --- | --- | --- |
| `OSB.setConsent` | `0x7df300 / 0x110` | `ece33535ee38aafd3e99da30a0cabf160e92eb95db4bd0b82b7fe44a3eb29f91` |
| `OSB.sendEventWithData` | `0x7e0394 / 0x30c` | `33989eb66341c8f2b6c2327a70283e9cc5e7cdf6047d6d12a7154ac0a1e2c15a` |
| `ComscoreService.comscorePageView` | `0x7e1130 / 0x194` | `84a4c158a3baaf789656a8c0c94938aaf8b9118fbe33ab95d644b43089371c45` |
| `OSB.sendPageView` | `0x7e1a08 / 0x1a0` | `9dc7a5abde2b4e0324b483c925fce79f115207470a68ffa494dc76f74ec59eae` |
| `::.handleFirebaseBackgroundMessage` | `0x7e7194 / 0x2c` | `6434350e4f4807f0c42e2c6c5e2748f36c85bc9feb806a7affcd23861d1ae21e` |
| `::.handleFirebaseBackgroundMessage` | `0x7e71c0 / 0x8c4` | `00309bf87e50c9a539b696c2f8bdc3070aaecc0e1c34dbb0934dce97d5acb71c` |
| `OSB.sendViewableImpression` | `0x80ff50 / 0x154` | `8d169ed0bc9bf9e212492425a646e70e547adee55c0a36b6df0275197b38dbcd` |
| `NLZietAdBar.build` | `0x81d6a4 / 0x3b4` | `fa94c80aa9ceaf5fcc2e52dc889976e6daa1db312ce9fe22501e528421c45275` |
| `OSB.setPageWithData` | `0x84ecf8 / 0xdc` | `0ef240980b88b98ee1aab1fe6763816eec0d938eee69033cb33e76f4821f1779` |
| `ComscoreService.start` | `0x868210 / 0x8c` | `5b61a0dc5833680fdcbd70c58813143feff90c7b7c23b0d2640921da5e3946c8` |
| `ComscoreService.init` | `0x86848c / 0x114` | `13a537282a1f147a8503da445845b7c89c8a085e75447bc9e8cc6f4fbf2515b5` |
| `ComscoreService.getFPID` | `0x868a84 / 0x19c` | `19d6ef761c5db656f5eace9448d4496eda4a7b53ee52fba45c8ec59d8a9b3f63` |
| `_AdvertisementSlotState.build` | `0x904088 / 0x74` | `a0539e37cc9b5c0ac870830fdc5972d480da633f916b89903e3cd03d1673cd15` |
| `AdsProvider.fetch` | `0x904a2c / 0x680` | `4a0a1ea67b91c1f966e136cc5fa70b1aca726c755348ae8ac92d8f5edf69fa47` |
| `::.main` | `0xb8c2b4 / 0x27c` | `03929ba17064c71aa14b7e94abfacbe8516cf05a1ddfb0ddc630fd56e9bc9ec9` |
| `OSB.config` | `0xb91dbc / 0x174` | `c4244f4f5e6de94a2b68035545f37e424cea7babb88817ae5502329e6857b20c` |
| `::.main` | `0xb92a94 / 0x20` | `bf230aa89429bac084676f97456b435d12da1eb425ff3a2ed4af13a7b3e8d262` |

These seventeen ARM32 ranges were mapped through the original ELF load segments
and hashed independently of the reader. Counts can differ between architectures
and do not enumerate every aliased Function. All three packaged architectures now
have a function-location mapping route; instruction-level policy/completion
validation and patch implementation remain outstanding. No TVgids dev release is
claimed by this research follow-up.
