# Voetbal International — inspected-build research, 2026-10-28

Research only: no implementation, rebuild, signing, install, emulator, device, login or purchase. **Seen** means evidence in the pinned artifact or the HTTP samples described below, not observed Android execution. **Inferred** means reasoning from that evidence; **unknown** identifies an unresolved limit. Private paths are relative to `/Volumes/MorpheResearch/research-2026-10-28/apps/voetbal-international/`. `D10/` abbreviates `decoded/smali_classes10/nl/vi/`; `D9/` abbreviates `decoded/smali_classes9/`; `D8/` abbreviates `decoded/smali_classes8/`. Line numbers refer to the full root-produced smali decode; DEX offsets are byte offsets in the original named DEX. Raw publisher source, keys, identifiers, authorization material and article/media bodies are excluded from Git.

## Artifact and coverage

**Seen:** application ID/namespace `nl.vi`, version `5.13.52`, code `910`, minSdk32, targetSdk36. Native Kotlin/Android/Compose with JWPlayer native/HTML/JavaScript bridge and Google NextGen Ads. Sources: private `badging.txt`, `signer.txt`, `manifest-tree.txt`, `analysis-phase2/base-entry-inventory.json`; corrected shared [inventory.json](inventory.json).

| Artifact | Size | SHA-256 |
|---|---:|---|
| `input/voetbal-international-original.apks` | 114,495,654 B | `d19dedb9d03ed7ed5824976be7b96bbba2f09a2af063067d20df0224da9b5f39` |
| `input/base.apk` | 113,605,940 B | `01d3bcbe0551da17e04c697ca0e7a6965cc07db4a55b510d334a730572d64974` |
| Archive `split_config.arm64_v8a.apk` | 37,102 B | `6657048728143976feb2ed988cdf395930de7ecc0a89d1d3fbdc6d04414c6c9c` |
| Archive `split_config.en.apk` | 118,994 B | `5bbd540fbe7d4d00012bf382b81b601cb802c391a761f2bf0d53865841f2ac64` |
| Archive `split_config.xxxhdpi.apk` | 733,138 B | `2785ec427fdf2ccd11290371940723b608d6192b742d1584345c4a752754ee85` |

**Seen:** ordinary signer SHA-256 `3d508fb86865e48353a506426baa57319215103dc9bcc5b8f34fa870ebe492be`, subject organization Voetbal International. Separate Google source stamp is not the app signer. Parent verified relocated originals at `/Volumes/EXT-SSD1/phone-apks` against working copies. Inputs were not modified.

**Seen inspected coverage:** base ZIP: 3,700 entries, 46 assets including 43 JWPlayer assets, 11 DEX. Every DEX string table and structural application method-reference/code-item index was inspected. Private no-JVM `analysis-phase2/dexrefs.py` produced `classes*.dex.apprefs.json.gz` for all `Lnl/vi/` code items: DEX1 4, DEX4 48, DEX5 12, DEX6 53, DEX9 47, DEX10 26,735, DEX11 18: **26,917 total**, zero instruction-boundary errors. App-owned invokes, including suspend/lambda wrappers, were searched across the complete index. Targeted generated NewsApi/PXR Supertokens indexes add DEX4 36, DEX8 91, DEX9 4,062, DEX11 415 code items (`classes*.dex.apirefs.json.gz`). Full 11 DEX smali was available; relevant application branches, actual callers and SDK callback paths were read.

**Seen:** all archive splits were inventoried for native files. Only native library: arm64 `libandroidx.graphics.path.so`,10,096 B,SHA-256 `41e9a793c43a0f4fddb19e33f346bace464f30f888ba7b9eaf96294ea115bfb6`. No native advertising/analytics library or Flutter/RN application bundle occurs in that inventory. Java SDK, platform, remote/WebView collection remains possible. All assets were inventoried; selected player/container assets and bounded portions of larger minified files were read. Not every dependency method was decompiled or exercised; static inspected-build coverage must not be described as runtime proof.

## Display advertisements and sponsored surfaces

**Seen common policy:** `Lnl/vi/ads/data/config/AdsDisplayConfig;->mustShowAds()Z`, `D10/ads/data/config/AdsDisplayConfig.smali:62`, returns true only if Authentication.hasInAppSubscription is false AND Authentication.isPro is false (calls70/80, false return91). `Authentication.isPro()Z` reads `proUser` (`D10/core/authentication/Authentication.smali:333`); `hasInAppSubscription()Z` delegates to NextAuth (`:287`). These auth values also select real content scope; changing them globally is not an ad-only change.

**Seen actual SDK:** application uses `com/google/android/libraries/ads/mobile/sdk/...` NextGen Ads. Patching only `com.google.android.gms.ads` would miss these requests. Application `NativeArticleAdsComponent` ultimately renders a banner inside a native article; no app-owned Google NativeAd/NativeAdView/AdLoader API invocation was found. No app-owned Rewarded/RewardedInterstitial/AppOpen API load/show invocation was found in the complete index either. Library presence, permissions and generic fullscreen callbacks do not establish those surfaces. Remote/reflected activation remains unknown.

| Surface / owner under D10 | Seen caller/renderer evidence |
|---|---|
| Common Compose | `ads/ui/PxrBannerAdViewKt.PxrBannerAdView(NextGenAdAdUnit,LayoutBoundsHolder,Modifier,Composer,II)V`, file line3320; exact descriptor below. Reads NextAuth session StateFlow3895–3917, Pro/policy3949–3967, private BannerAdView4002. Compose preview is a separate inspection-mode branch. |
| Native article | `feature/articleDetail/ui/components/ads/NativeArticleAdsComponentKt.NativeArticleAdsComponent(LayoutBoundsHolder,NewsAdsItem,Composer,I)V:36`; policy169, renderer209; DEX10 invoke `0x42ef54`. NewsAdsItem is an ad carrier, not entitlement data. |
| Match info / statistics | `core/matchDetail/ui/match_info/MatchInfoViewKt`, `core/matchDetail/ui/stats/MatchEventStatsViewKt`; renderer invokes `0x3c7ebe`, `0x3c952e`. |
| Competition list | `feature/main/ui/tabViews/competitions/ui/CompetitionsKt`, renderer `0x4f2538`; CompetitionListParserDelegate.getValue also consults policy before insertion. |
| Match list | `feature/main/ui/tabViews/matches/ui/matchesList/ui/MatchListViewKt` item lambda `...inlined$items$default$4`; renderer `0x504734`. |
| Main news grid | `feature/main/ui/tabViews/news/nextMainNews/ui/NextMainNewsKt` item lambda `...inlined$items$default$5`; renderer `0x53ebda`; NextMainNewsViewModel$loadNextMainNewsList$1 also gates insertion. |
| Next news / sticky-header list | `feature/next/news/ui/NextNewsViewKt`, `NextNewsViewWithStickyHeaderKt`; renderer `0x55ffba`, `0x56136c`. ArticleAdsExtensionKt.asArticlesWithAds inserts article-shaped ad carriers under policy. |
| Media list | `feature/media/ui/component/MediaListComponentKt`; renderer `0x550326`; common banner explicitly recognizes media audio/video preload ID at355. |
| Player passport | `feature/playerDetail/ui/playerPassport/ui/PlayerPassportViewKt`; renderer `0x576350`; PlayerPassportItemListDelegate.getValue gates insertion. |
| Article / curation data | `feature/articleDetail/data/NewsDetailResponse.getContent()List:1744`, `extensions/NewsDetailResponseExtensionsKt.asNewsDetailItemList(...)List:328`, CurationItem$Ads and NewsAdsItem. Response content accessor can transform/inject ads into _content; not a premium-body grant. |
| Legacy tablet | `feature/main/main_activity_tablet/news/custom_cell/ads/BannerAdViewKt.BannerAdView` has common policy. Only wrapper/self-lambda caller chain located; nonwrapper navigation reachability unknown. Retain as legacy audit anchor. |
| Partner branding | `core/brandingManager/data/BrandingManager.getBrandingData(BrandingViewType,String)BrandingPartner:449`, policy465; getCompetitionBranding/isBranded also consult it. Sponsored partner logos/links differ from Google banners. |

**Seen exact shared renderer descriptor:** `Lnl/vi/ads/ui/PxrBannerAdViewKt;->PxrBannerAdView(Lnl/vi/ads/domain/model/NextGenAdAdUnit;Landroidx/compose/ui/layout/LayoutBoundsHolder;Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;II)V`. Data insertion and render gates both matter to avoid empty sponsored rows/spacing.

**Seen preload chain:** `AdManagerImplementation.init(Context)V`, `D10/ads/data/manager/AdManagerImplementation.smali:814–850`, creates AppAdLoader with BannerAdProviderImp/InterstitialAdProviderImp and observes user data. `preLoadBannerAd(NextGenAdAdUnit,Continuation)Object:879` (DEX10 code `0x323214`) checks policy898, GoogleConsent.hasProvideConsent919 and deduplicates `loadedBannerAds:ConcurrentLinkedQueue` by preload ID, then awaits AdLoader.preloadBannerAd966. Rejected branches return null. `BannerAdProviderImp.preloadBannerAd(Context,NextGenAdAdUnit,Continuation)Object`, DEX10 code `0x323c84`, builds inline-adaptive BannerAdRequest with targeting/content URL and awaits `BannerAd.Companion.load` at `0x323e4a`.

**Seen direct-load fallback:** common `PxrBannerAdViewKt.LoadBannerAd(...)V:616` checks policy838 and collects UMP consent StateFlow892–920. `BannerAdView:96` chooses polling or direct load according to ad-unit types/preload IDs274–386. `LoadBannerAd$lambda$8$0$0(...)AdView:1998` registers cached banner2020/2066; otherwise builds another inline-adaptive request and invokes `AdView.loadAd(BannerAdRequest,AdLoadCallback)V:2236`. This is a second actual request path, not only a display wrapper. `core/ads/googleNextGenAds/banner/fetcher/extensions/BannerAdRequestBuilderExtensionsKt.addCustomTargetParams(BannerAdRequest.Builder)Builder`, DEX10 `0x356830`, incorporates betting display/age-gate selections, then per-unit custom targeting and content URL (`PxrBannerAdViewKt:2151–2222`). These are ad-targeting parameters; preserve genuine age-gate function elsewhere.

**Seen callbacks/cache lifecycle:** `PxrBannerAdViewKt$LoadBannerAd$5$1$1$1$reloadCallback$1.onAdFailedToLoad(LoadAdError)V:122` collapses height to zero135–147; `onAdLoaded(BannerAd)V:187` updates height to ad height+8dp, caches271, installs callbacks276/281, registers with Activity288 and updates state299. `ads/data/extensions/BannerAdExtensionsKt.addBannerAdRefreshCallback(BannerAd,NextGenAdAdUnit)V:31` installs refresh success/error logging; `addRequiredCallback(...):54` installs impression/click/fullscreen callbacks. Its `$addRequiredCallback$1.onAdClicked()V:64–77` removes cached banner. `AdManagerImplementation.removeCachedBannerAd(NextGenAdAdUnit)V:1039–1062` removes/destroys; prefix removal1204–1213 destroys; user observer `init$lambda$0(User)Unit:484–501` destroys all banner ads. Suppressing drawing/height alone would retain preload, refresh and requests.

**Seen legacy initialization:** `core/ads/MobileAdsManager`, BannerAdsManagerImplementation and InterstitialAdsDelegate also use NextGen SDK. MainActivity.onCreate calls initialMobileAds (DEX10 invoke `0x4e4232`); this older startup remains reachable even though no nonwrapper caller of its showInterstitialAd was found. **Inferred:** a zero-ad-network objective requires reviewing/gating explicit SDK initialization/legacy preload in addition to policy. Preserve initialized manager/cache objects that other callers require.

**Seen sponsored editorial categories:** generated `decoded/smali_classes11/org/openapitools/client/models/NewsCategoryFunctionality.smali` defines ADVERTORIAL/AFFILIATE/BETTING/PREMIUM; PREMIUM serializes `premium`160–162. App has Advertorial_viewKt. Categories/UI do not prove a particular feed contains them. **Inferred:** removing sponsored editorial cards needs explicit carrier/category filtering and stable item ordering, not indiscriminate betting/editorial/CDN blocking.

## Interstitial: preserve navigation completion

**Seen production descriptor:** `Lnl/vi/ads/data/manager/AdManagerImplementation;->showInterstitialAd(Landroid/app/Activity;ZLnl/vi/ads/domain/model/NextGenAdAdUnit;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;` (DEX10 wrapper `0x3232ac`). It receives Activity, Pro-article flag, ad unit, visible and dismissed callbacks, continuation. Production navigation caller `feature/main/domain/OnViEventClickExtensionsKt$handleNavigate$1.invokeSuspend(Object)Object:275` calls show376 (DEX10 `0x4cf69a`). Visible callback `invokeSuspend$lambda$0:130–140` sets UI true; dismissed `invokeSuspend$lambda$1:148–187` sets false and launches navigation on Main. A raw no-op show return can drop navigation.

**Seen bypass branches:** `ads/data/manager/AdManagerImplementation$showInterstitialAd$2.invokeSuspend(Object)Object:294` invokes dismissal on Pro/policy false625–627, Pro article385–387, account UserPlatform.subscriptionBooleans.allowAds=false445–447 and canShow=false487–489. It increments counter/polls cache; counter==2 and missing ad preloads and dismisses534–536. Available ad reaches loadInterstitialAdView584; missing ad dismisses606–609. Existing no-ad branches provide concrete safe completion anchors.

**Seen SDK path:** `InterstitialAdProviderImp.preLoadInterstitialAd(NextGenAdAdUnit)V`, DEX10 `0x324190`, builds AdRequest/PreloadConfiguration and `InterstitialAdPreloader.start` (`0x3241f2`), with poll/availability/destroy methods. Private `loadInterstitialAdView(Activity,InterstitialAd,Function0,Function0,Continuation)Object:515` switches to Main; `$loadInterstitialAdView$2` installs event callback then SDK.show(Activity) (`0x322a0e/0x322a14`). Its `$1$1.onAdDismissedFullScreenContent()V:132` invokes completion166–168; onAdShowedFullScreenContent262 invokes visible296–298. Dismiss wrapper `$showInterstitialAd$2.invokeSuspend$lambda$0$0` removes/destroys cache then invokes original dismissal.

**Seen existing risk:** `onAdFailedToShowFullScreenContent(FullScreenContentError)V:173–227` logs without dismissal. Forcing show failure is unsafe. **Inferred:** choose an existing no-ad branch and suppress preload; any direct replacement must preserve exactly-once dismissal, correct suspend return, Main dispatch and ordinary navigation/state transitions.

## Video ads: app decision through SDK content resumption

**Seen actual surfaces:** native article SinglePlayer and NativeArticleVideoFeed construct JWPlayerView, install delegates/lifecycle and setup PlayerConfig. `D10/feature/articleDetail/ui/components/singlePlayer/SinglePlayerKt.SinglePlayer$lambda$2$0$0(...)JWPlayerView` code `0x486d34`, JW setup `0x486dc0`; `.../videoFeed/NativeArticleVideoFeedKt.NativeArticleVideoFeedComponent_rAjV9yQ$lambda$4$0$0$0(...)JWPlayerView` code `0x48f638`, setup `0x48f6ca`. Lifecycle includes pauseAd; keep normal pause/resume/release/playlist behavior.

**Seen actual IMA config:** `Lnl/vi/common/ui/videoFeed/config/VideoFeedPlayerAdsConfigDelegate;->getValue(Ljava/lang/Object;Lkotlin/reflect/KProperty;)Lcom/jwplayer/pub/api/configuration/ads/AdvertisingConfig;`, D9 app class, code `0x4f2068`, builds Dutch ImaSdkSettings and ImaAdvertisingConfig.Builder.adClient(AdClient.IMA) (`0x4f20bc`). `VideoFeedPlayerConfigDelegate.getValue(...)PlayerConfig` attaches AdvertisingConfig (D9 same directory,line287,invoke `0x4f21e6`). Actual app uses client-side IMA. Complete app index has no application assignment of imaDaiSettings/StreamRequest/Media3 ImaAdsLoader, explicit ad-schedule/ad-break builder or DAI media source. DAI SDK capability is not app activation.

| Decision | Seen branch, exact owner and call |
|---|---|
| Feed before-play | `Lnl/vi/common/ui/videoFeed/delegates/JwPlayerActionHandlerDelegate;->onBeforePlay(Lcom/jwplayer/pub/api/events/BeforePlayEvent;)V`, D10 file523, code `0x347c04`. Skips Pro/IAP, repeated video ID629, blank vendor650, duration<30s661–672, blank tag724 and schedule false734; otherwise JWPlayer.playAd(String[])759 / DEX10 `0x347dd2`. |
| Single before-play | `JwSinglePlayerActionHandlerDelegate.onBeforePlay(BeforePlayEvent)V`, D10 file347, code `0x348378`; skips Pro/IAP and blank tag, calls playAd437 / `0x348430`. No feed duration/repeat/schedule gate. Patching only mustShowVideoAds misses this surface. |
| Remote schedule/tags | `common/ui/videoFeed/VideoFeedManager.loadVideoFeedsConfig$lambda$1(Function0,VideoFeedConfigResponse)Unit:363` replaces schedule list/queue via getAdSchedule377; getVastTags399, lowercased vendor keys473, completion476. `mustShowVideoAds()Z:607–654` refills empty queue from stored list then polls Boolean, null=false. Cadence is a repeating remote sequence, not a proven fixed one-in-N. |
| Tag construction | `Lnl/vi/common/ui/videoFeed/advertisement/VideoAdvertisementURLDelegate;->getValue(Ljava/lang/Object;Lkotlin/reflect/KProperty;)Ljava/lang/String;`, D10 file137, code `0x347618`. getIFA_ID103 reads **ifa_id**117; blank yields blank tag160–168. Vendor map lookup189–193 falls back to default205–211. Rewrites/inserts gdpr_consent/gdpr/encoded custom parameters227–392 using UMP TC/purpose strings. Different key from display fetcher's ad_id. Result URLs are logged; no raw tag/TC values reproduced. |

**Seen transport:** `D10/shared/module/api/module/next_day_media/NextDayMediaAdsModule.getBaseURL()String:163` uses `https://ads.nextday.media/`; createClient builds Retrofit (DEX10 `0x5a1528`). Actual tag URLs come from response configuration. **Unknown:** current active tag/wrapper/auction hosts, per-user config/cadence, creatives and whether particular tags are VMAP. No ad tag was fetched/executed; Google endpoints in IMA are not the complete publisher tag list.

**Seen schedule plugin:** `decoded/assets/jwplayer/ima-plugin-sdk.js`,7,136 B,SHA-256 `ffac7e9ad23ed6ad8bb5b506223c0f8d8a1f192af83aab5a5ff9daa17f627e10`. Reads playlist adschedule or player advertising.schedule, filters pre/post offsets, schedules other offsets as midrolls; VMAP calls native requestVmap. Bounded original byte offsets: playlist809,item1307,complete2494,beforePlay2580,time3011,midroll3394,postroll3959,seek4100,beforeComplete4967,blockContent5057,unblockContent5200,init5340,playAd5729,pause5782,discard5837,skip5904,requestAds5955,destroy6110,scheduleMidrolls6361. blockContent creates instream; unblockContent destroys it and clears pending state. App explicitly injects pre-play playAd; delivered scheduled mid/post/VMAP activation is unknown. Shared AdvertisingConfig attachment is a prevention point distinct from the two application calls.

**Seen native request/bridge:** `D9/com/jwplayer/c/k.smali` JS interface ImaNativePlugin name7/registration355, playAd(String[])1453, requestAds(String,Z)1479, requestVmap(String)1507, skipAd1588. `D9/com/jwplayer/c/g.smali` creates AdsRequest, setAdTagUrl679, content progress693, AdsLoader.requestAds805. onAdsManagerLoaded1125 installs error1149/event1156, initializes1159 and forwards cue points1167–1209. Application impression/viewable-impression listeners log metadata; removing app logs would not stop SDK VAST tracking.

**Seen end-to-end callback safety:** `g$2.onAdEvent(AdEvent)V:58` forwards through tracker j then handles lifecycle. g$3 maps STARTED1:37,LOADED2:53,CONTENT_PAUSE_REQUESTED3:69,CONTENT_RESUME_REQUESTED4:85,ALL_ADS_COMPLETED7:133. Pause handling g$2:440 calls JS blockContent450 then pauses normal provider464. Resume432 calls g.k(g); accessor g:988–996 invokes c()Z. With no pending breaks c():496–549 calls k.a()513; k:1326–1337 evaluates `playerInstance.plugins.imaPluginSdk.unblockContent();`1332. ALL_ADS_COMPLETED g$2:382 reaches g.o/g.p, whose accessors1028/1037 release h() and advance d(). g$1.onAdError46–72 records error then advances; k$1.onAdError46–82 forwards and explicitly unblocks79. Request timeout30,000ms (g:831–849); handler936–961 releases and tries next waterfall tag. j$2 maps completion/skip/start/resume to notifications. A stub after content blocking can strand playback; prevent app playAd/config attachment rather than swallowing callbacks.

**Seen DAI/VAST capability:** dai-plugin-sdk.js3,548 B,SHA-256 `e98cea52e38b6662ff483ee51bc6786fb741c13f4309c581408d459a7d23aee9` consumes imaDaiSettings, requests native stream and handles snapback/seek/ad breaks. vast.js112,485 B,SHA-256 `8b5a2d4cc173c123c721d026d2dfce810ef4b5d458f04296b17ee9c6cc3c4223` supports VAST/VPAID/OMID beyond proven application usage. **Unknown:** stitched media/backend SSAI, content authorization/DRM and remote playlists. No static basis to strip arbitrary HLS/DASH segments or block player licensing/content traffic.

**Seen separate media/remote entry points:** `D10/core/miniPlayerMediaManager/ui/MediaVideoPlayerKt.MediaVideoPlayer(...)V` builds Android YouTube iframe player and LiveStreamAnalytics. Its lambda$6$0 calls YouTubePlayerView.initialize(listener,boolean,IFramePlayerOptions)1864, release1877/1904. Article EmbeddedComponentKt IFrame/URL variants call WebView.loadUrl (DEX10 `0x4370c2`, `0x43719a`); podcast NextPodcastViewKt.OmnyWebView uses it `0x5547d4`; MyWorldCupTeamKt adds JS interface and loads URL `0x55780a/0x557810`, evaluates script on page start `0x557598`. **Unknown:** remote iframe/podcast/YouTube ads and collectors. JW IMA changes cannot promise universal removal from arbitrary remote documents; preserve functional media/bridges.

## Tracking, identifiers, consent and startup

**Seen startup:** `D10/application/App.onCreate()V:927`, DEX10 `0x32b0ac`: initializes NextAuth/lifecycle, enables Crashlytics, FacebookSdk.sdkInitialize, preferences/parser/local DB/migration, BlueConic (`0x32b160`), AdManager (`0x32b17c`), Firebase (`0x32b19a`), ViAnalytics (`0x32b1a8`), persisted ad_id→setIdfa (`0x32b1c4`), connectivity/push/team updates/JW license (`0x32b1fc`). Providers can execute before App; suppressing a single event wrapper does not cover startup.

| Collector | Seen app use and boundaries |
|---|---|
| Firebase Analytics | `shared/module/analytics/ViAnalytics.logScreen(LogScreen)V:925`, sendApiPerformanceEvent(HashMap)991, sendEvent(String)1072, sendEvent(String,String,ArrayList)1089, sendView(Activity,String,Article,GridBlockItem,String)1218. sendView sets user properties1368/1373 and deprecated current screen. Independent `feature/livestream/LiveStreamAnalytics.logStreamOneSecond:262`, start293, stop323 logEvent288/318/335. Seven app logEvent sites; no app setAnalyticsCollectionEnabled/setConsent call. |
| API performance | `shared/module/analytics/ApiPerformance.logPerformanceAnalytics:89` converts metrics to HashMap129 and sends through ViAnalytics133; public log151. This is publisher API measurement, not proof of Firebase Performance. No app Firebase Performance API invocation located. Preserve actual API execution/timing control flow while suppressing send. |
| Crashlytics / Sessions | `App.enableFirebaseCrashAnalytics()V:386` explicitly enables true395–397. Provider/discovery include Crashlytics/Sessions. AppLogger.createDirectoryAndFile code `0x5a6404` has Crashlytics.log; AppLogger$createLogFile$1.invokeSuspend code `0x5a58bc` has six more breadcrumbs. No app recordException/setUserId found; automatic crash/ANR/session paths remain. Local LoggerDB/file rows are not automatically proven uploaded, but these explicit breadcrumbs are a real separate sink. |
| comScore | `ViAnalytics.initialize()V:836` sets app context844, publisher config/labels, enableAutoUpdate(120,false)915–920. sendComView(Article,GridBlockItem):561 calls comScore.view(HashMap). Older Java com.comscore.analytics.comScore; no native comScore lib in split inventory. setIdfa(String):1388 MD5-hashes ad ID, uses first16 hex characters1408–1410, sends label1418. Derived identifier still associates measurement. Publisher secret omitted. |
| BlueConic CDP | Actual App init calls `core/blueConic/BlueConicManagerImp.init(Application)V:473`, code `0x3723dc`, host pxr.blueconic.net, override app ID and initialize callback `0x372444`. logScreenName(String,Map):528 checks initialization, destroys old plugins/checks profile-consent objectives, gets weak Activity and creates page-view `0x3724d6`. setGDPRPurposes():218 maps UMP contentProfiling/personalisedContent/measureContent/audienceInsights to consented/refused web_consent objective. reCreateProfile():619 deletes then callback-creates. UMP dismissal calls recreation (GoogleConsent601–617); startup-only removal misses this later path. |
| Facebook | FacebookInitProvider plus App.sdkInitialize. `decoded/smali_classes6/com/facebook/UserSettingsManager.smali:178–204` defaults auto-init, automatic app events, advertiser-ID collection true. Manifest has no disabling flags. Actual ShareDialog/ShareLinkContent calls are functional. Runtime/server/settings gates unknown; disable optional telemetry without destroying genuine share/identity functionality. No app flag setter found. |
| Display ID | `core/ads/config/AdsIDFetcher$fetchAdID$1.invokeSuspend:187` gets AdvertisingIdInfo247/ID252, logs it, saves ad_id274–276, calls ViAnalytics.setIdfa285 and reports success/failure through Main FetchIDResult callback310+. No LAT check in this fetch path. |
| Video/consent IFA | `GoogleConsent$getIFA_UUID$$inlined$TryCatchCoroutine$2.invokeSuspend:192` reads ID256, isLimitAdTrackingEnabled274 and stores that result directly in misleading field trackingEnabled278; completes on Main. GoogleConsent.updateIFA_ID():1312 invokes it; callback827 saves **ifa_id**841–843. isAdvertisingIDAvailable coroutine checks nonempty/nonzero-prefix ID and reports Boolean; not a complete consent decision. Preserve completion if suppressing fetch. |
| UMP | `ads/data/google_consent/GoogleConsent.requestForConsent(Activity)V:1285` requests consent update; loadForm454, form callback477/dismiss601 and _consentObtained StateFlow gate banners/UI/age flow. hasProvideConsent():1145 negates equality with exact purpose string000000000, not full per-vendor positive permission. TC/purpose bits also feed VAST and BlueConic. No app Firebase consent/collection setter; independent SDK TCF behavior unknown. |
| Survicate | SDK/SurveyActivity/workspace metadata present; both `shared/module/analytics/survicate/SurveyModule.executeTask(...)V:126–136` overloads literally return void. Screen wrappers call no-ops; no app SurveySDK initialize/track call found. Active app-dispatched survey tracking not established; auto-init/remote dependency behavior remains potential. |
| GTM / legacy GA | `assets/containers/GTM-MHTV4FD_v3_Android.json`4,920 B contains only variables (five e/md types), zero tags/triggers. No app TagManager/GoogleAnalytics calls found. Library/container presence is not an active collector claim; remote updates/reflection unknown. |

**Seen auto-init:** manifest FirebaseInitProvider order100, FacebookInitProvider, AndroidX InitializationProvider, PicassoProvider and functional FileProvider/FacebookContentProvider. AndroidX WorkManager/process lifecycle/emoji/profile installer are not all trackers. Firebase discovery lists Auth, Messaging, AnalyticsConnector, Crashlytics/KTX, Sessions, Installations, Database, common KTX and DataTransport. No application Database sender found; discovery alone is not actual data use. NextGen Ads is application-initialized, not a MobileAdsInitProvider. Manifest automatic screen reporting=false does not disable explicit analytics/auto-init. AD_ID/AdServices attribution/ad ID/topics/custom audience/referrer permissions demonstrate capability, not captured requests.

**Seen JW browser collector:** jwpsrv.js71,119 B,SHA-256 `a6dfc7836414f901ab0962f95432c6ef785952fd1a7778467b4a377461698257` contains playback/ad/session/device metadata and beacons prd.jwpltx.com/v1, ping-origin-prd.jwpltx.com/v1, ping-meta-prd.jwpltx.com/v1, placement-prd.jwpltx.com/v1 (around byte41415), navigator.sendBeacon56243. Actual SDK load evidence: `assets/jwplayer/manifest:7`; `D9/com/jwplayer/b/i.smali` enumerates jwpsrv196/818, builds script tags for matching manifest entries268–312/890–934, injects analyticsValues object380–404/1002–1026, then WebView.loadDataWithBaseURL419/later equivalent. jwplayer.js maps analytics config→jwpsrv54757–54814. **Inferred:** SDK browser analytics is independent of Java Firebase/comScore and IMA ad calls. No app PlayerConfig analytics-disable setting found. **Unknown:** licensed activation, exact live payloads/requests; do not equate module load with observed network emission.

**Seen player resource fingerprints:** jwplayer.js182,180 B,SHA `1f110fbbffb827e749b913866a85ef70972a1f64249aec24f0274d64ef1d8ca0`; jwplayer.core.js91,383 B,SHA `0f98758769792cc71c3692a6952995efe320652da01fbf99533bbda6aef8b1b1`; container HTML1,614 B / 46 lines,SHA `bbafc4944c00c1c92f8b53d539a7bc308de807fe31971447ff87f7f0f8d3bfca`. JS resource URLs indicate player8.49.3 modules; not a claim the entire native Android SDK has that version.

**Seen bounded negative searches:** complete app index has no direct Adjust/AppsFlyer/Branch/Amplitude/Mixpanel/Segment/Sentry/Bugsnag/Datadog/Firebase Performance/AppSet/Settings.Secure ID-fetch invocation. This is not a universal absence proof: dependency/reflection/platform/remote pages can collect independently. Only native library is graphics; WebView/YouTube/Omny are explicit remote-JS gaps.

**Inferred collection approach:** gate startup and all application sinks, including independent livestream sender; pair with provider-time defaults. Shipped `decoded/smali_classes7/com/google/firebase/analytics/FirebaseAnalytics.smali:398/413` supports collection/consent setters; measurement reads firebase_analytics_collection_deactivated (`.../measurement/internal/zzae.smali:1661`). App's explicit Crashlytics true needs guarding too; manifest false alone could be overridden. Facebook optional flags preserve sharing/login. BlueConic needs startup plus later profile recreation/page-view/objective paths covered. Avoid ID fetch/derived-label/tag/ID logging, while completing empty/failure callbacks normally. Do not falsify affirmative consent or break age-gate flows. Validate no resume, consent, login, purchase or config transition re-enables collectors.

## VI PRO, publisher content and genuine auth/billing

**Seen actual request construction:** `D10/core/nextApi/NextApis.getBasePath()String:83–90` is https://pb-api.vi.nl. `Lnl/vi/feature/articleDetail/data/articleDetailDataSource/ArticleDetailDataSourceImp;->getArticleDetail(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;` at71 checks Pro95 or NextAuth.hasInAppSubscription105: true Scope.PREMIUM120, false null114. Domain/context200 at129, generated request142. String/path overload149–226 has same branch. Pro/IAP are not merely UI badges.

**Seen generated contract:** `D8/org/openapitools/client/apis/NewsApi.smali` getByIDNewsByDomainID$suspendImpl1262 constructs GET /domain/{contextID}/news/{id} (DEX8 literal `0x47213e`) with optional scope/experimentGroup/hash/cache. getByPath...$suspendImpl2097 uses /domain/{contextID}/news/path plus path/scope; most-read$suspendImpl4098 uses /domain/{contextID}/news/most-read with isMedia/experimentGroup/functionality/newsCatID/tagID/cache. Public category filtering is distinct from privileged content scope.

**Seen UI:** `D10/extensions/NewsDetailResponseExtensionsKt.asNewsDetailItemList(NewsDetailResponse,Z,Map)List:328` dispatches delivered ContentItem type; compares against getPAYWALL_BLOCK1049–1059 and constructs PaywallBlockItem(ContentItem)1061–1065. NewsDetailResponse.content/_content and its ad-transforming getContent are distinct from the wall. Hiding the wall cannot reconstruct blocks the server never supplied.

**Seen tiny normal anonymous sampling:** four ordinary GETs on 2026-10-28 (one detail repeated for alternate-field shapes), after verifying route/filter construction. No cookies/login/user session/generated auth header/hash/premium scope/purchase/media request. Only shape/count/length/hash retained in `analysis-phase2/public-sample-summary.json`, `public-premium-shape-summary.json`, `public-premium-alternate-field-shape.json`; no body saved/reproduced.

| Ordinary public request, HTTP200 | Shape/hash |
|---|---|
| /domain/200/news/most-read | 5 items, 5,720 B,SHA `c5280892f7192e84a5eff5bed13964913091f354ef66fd398e60ffae097e3b76`. |
| /domain/200/news/most-read?functionality=premium | 5 premium-category metadata items, 5,653 B,SHA `120b07f3da334360a16cacfb25d0deb1fcd04cf23c844929611d09159e927a16`. |
| One returned premium article, default /domain/200/news/2151890 | 4,290 B,SHA `d8f1bb1deedb9702c781d894e83834b9dedcf59381ffdca2aebd16021f00744e`; content has richTextBlock432/247 characters plus paywallBlock with paywallType/type keys; newsText/newsBold empty; contentShort 408 characters / subtitle 15. Repeat same bytes/hash; no separate full-body field identified. |

**Initial inference (superseded by the follow-up below):** sampled response explicitly represents a restriction with short text blocks and paywall marker; removing that marker is no evidence of full article access. **Unknown:** entitled representation, other variants/cache/account rules, private stream token/DRM/media authorization/server validation. At this initial stage no premium-scope/app-header comparison had been attempted. No paid body/media access promise follows from a local flag.

**Seen genuine sessions:** `D9/com/pxr/pxropenapigenerator/ktorSupertokens/` token/datastore/session owners preserve real authentication. `extensions/HeadersBuilderExtensionsKt.appendAuthHeader(HeadersBuilder,String)V:43` excludes /auth/session/refresh59–67 and otherwise appends nonblank stored access pair73–119; appendAuthRefreshToken126 separately appends refresh pair. SessionManager.refreshSession(Context,Continuation) is a real suspend request path (DEX9 wrapper family `0x40cd70`), not cosmetic ACTIVE state. Shared cookies/token refresh are functional.

**Seen IAP authorization contract:** `D9/.../extensions/KtorHttpRequestBuilderExtensionsKt.executeCall(HttpRequestBuilder,Context,Sender,Continuation)Object` code `0x44df90` appends required headers339; only when genuine hasInAppSubscription(context)354 is true does it obtain subscription header370/generated auth value379 and append384; normal access auth400 follows. `common/inAppSubscription/InAppSubscription.getInAppSubscriptionHeaderKey()String:75–81` is x-app-article. Generation exists but was not invoked, reproduced or sent. Changing an IAP Boolean can alter real network authorization.

**Seen Play Billing:** Billing SDK 8.0.0 manifest; `D10/core/billing/domain/purchaser/ProductPurchaserDelegate.subscribe` launches real BillingClient.launchBillingFlow337. `GoogleBillingManager.onPurchasesUpdated(BillingResult,List)V:622` branches on real results and acknowledges650; acknowledgePurchasesIfNeeded(List):217 gets purchase token289 and SDK acknowledge315; predicate339 checks acknowledged347/purchase state353. Preserve success/pending/cancel/error/ack contracts. `InAppSubscriptionManager` tracks activeSubscriptionFlow/products/purchases/store/restore/clear. storePurchaseSubscription327 saves purchase pair under purchased_subscription350 and launches NextAuth subscribe; cached restore292/offline reconstruction exists, not proof a fabricated purchase is valid.

**Seen bridge:** `D9/.../common/nextAuth/NextAuthenticationManager.subscribeWithInAppSubscription(Context,Continuation)Object:796–820` delegates InAppSubscription.subscribe(Context)User. InAppSubscriptionImpl.subscribe452 stores in_app_subscription=true, constructs user475, sets ACTIVE486/cached bool489. No server receipt-verification call is visible in this specific method; genuine Play flow and generated auth header are separate contracts. **Unknown:** full server receipt validation, offline grace/expiration/enforcement. Do not forge local state or infer paid access from it.

## Article delivery follow-up: shipped app-header route

**Seen, 2026-10-28 22:19 UTC:** further source tracing found that `InAppSubscriptionImpl.generateInAppSubscriptionAuthValue()` (D9 file line278) produces an app-specific, time-dependent article header. The sender attaches it after required headers and before ordinary session authentication (`KtorHttpRequestBuilderExtensionsKt.executeCall`, lines350–400). The generator consumes the app's own bundled configuration; no user account, Play purchase, receipt or session token participates in that computation. Credential values and generated headers remain outside Git and output logs.

Four bounded publisher GETs compared the existing public route, the exact shipped premium-scope/app-header mechanism and a one-character invalid-signature control. No login, purchase, persistent account change, article text or media URL was stored or reproduced. The compact response-shape evidence is in [voetbal-international-article-delivery.json](voetbal-international-article-delivery.json).

| Sample | HTTP | Delivered shape |
| --- | --- | --- |
| Article2151890, public route | 200 | 3 blocks: 2 rich text, 1 paywall; 679 text characters. |
| Same article, shipped app-header/premium route | 200 | 45 blocks: 31 rich text, 9 quotes, 3 tables, 1 image, 1 related; 17012 text characters; no paywall block. |
| Article2151842, shipped app-header/premium route | 200 | 7 blocks: 1 rich text, 1 media, 5 images; no paywall block. The public variant previously had text plus a paywall. |
| Article2151890, invalid-signature control | 401 | No article blocks. |

**Inferred:** the earlier unauthenticated premium-scope401 result did not settle app delivery. This additional shipped mechanism supplies the substantial Pro body and gated media/image representation for the two samples. The user's fallback to remove inaccessible Pro feed entries is therefore not the first implementation choice. A targeted article request patch can preserve real account/subscription/billing state, reuse the native generator and leave functional auth and unrelated requests alone.

**Unknown:** rebuilt-app behavior, by-path transport integration, universal article coverage, remote changes and actual media playback/licensing. Returning a media block does not prove a playable media entitlement. Source also shows a wall-clock assumption: LocalDateTime.now is converted with the configured Europe/Amsterdam offset; implementation must verify behavior when the device timezone differs. The generator logs its generated value through EventLogger, which must be checked before reusing it. No VI controls are published yet.

## Host roles

All are **seen static roles** unless identified as a sampled publisher GET; actual emissions otherwise unknown. A hostname/config string alone is not contacted-host proof.

| Host/family | Role/evidence |
|---|---|
| ads.nextday.media | Actual remote ad config; NextDayMediaAdsModule and VideoFeedManager VAST/schedule consumers. Config differs from auction/media requests. |
| Remote VAST/VMAP/Google IMA/NextGen domains | App actually requests IMA/display ads; vendor/wrapper/creative endpoints depend on config. SDK strings not complete live list. |
| pxr.blueconic.net | Actual startup CDP host and later screen/profile paths. |
| b/udm/sb.scorecardresearch.com | Java comScore destinations/network allowances; actual initialization/view/auto-update proven; no runtime request capture. |
| prd.jwpltx.com; ping-origin-prd/ping-meta-prd/placement-prd.jwpltx.com | JW analytics module/beacons, container-loading chain above. |
| ssl.p.jwpcdn.com; entitlements.jwplayer.com | Player/plugin resource delivery and genuine JW license/feature entitlement; App.initializeJwPlayer503. Preserve license/content. |
| Firebase measurement/crash settings/sessions/transport | Optional analytics/crash evidence above; Firebase Auth/Installations/FCM may be functional and share infrastructure. |
| Facebook graph/events | SDK init/default telemetry capability; share/identity is functional; emitted requests unknown. |
| survey/respondent.survicate.com | Dependency endpoints; app SurveyModule is no-op. No active survey request claim. |
| pb-api.vi.nl | Actual publisher list/article/scope/auth contract, ordinary anonymous reads sampled. |
| sportdata.vi.nl; wss://socket-server.voetbalprimeur.nl | Functional sports/live scores. `D10/extensions/StringExtensionsKt.asWebSocketURL(String)String:2862`, host2873. WebSocketEndpoint$Companion paths /matches,/match/{match_id},/standing/{tournament_id}:71–165. LiveDataStreamRepository/App background close manage live feed. |
| vns.vi.nl; AWS SNS; FCM | Functional push registration/delivery. SnsClientHandler$createEndpoint$2$1.invokeSuspend code `0x4c2190` calls AmazonSNSClient.createPlatformEndpoint; App requests FCM token and messaging service handles new tokens/messages. Preserve registrations/acknowledgements. |
| vi.cdn.pxr.nl; files.vi.nl; image/webp endpoints | Functional publisher images/media; no basis to block entire CDN as tracking. |
| tracking.vi.nl | Functional email verification: `D9/com/pxr/.../core/myPxrActivity/data/RoutesKt.smali:41`, Screen$EmailVerification94 route /secure/verifieer-email?token={token}. Do not block by name or leak token. |
| privacy.pxr.nl; iframe/YouTube/Omny URLs | Privacy and external functional pages/media, potentially additional collectors. Need concrete runtime evidence for filtering. |

## Packaging, signing and integrity

**Seen:** allowBackup=false/extractNativeLibs=false, split ABI/language/density, networkSecurityConfig and startup providers. `decoded/res/xml/network_security_config.xml` system+user trust is under **debug-overrides**, not unconditional production trust. No pin-set there. Cleartext exceptions include ad/redirect/comScore and VI production/staging hosts; policy allowance is not traffic evidence or justification for global cleartext.

**Seen bounded integrity search:** full app invoke index found no application-owned signing-cert/checkSignatures/CertificatePinner/Play Integrity/SafetyNet/AppCheck/root-check API call. `D10/application/AppPackageInfo.getViPackageInfo:34–79` calls PackageManager.getPackageInfo flags0:54–56 then reads versionName/code, not signer. AppUtilities/AppIdentifier installed-app checks and generic MD5 helpers distinguished. **Unknown:** reflection/dependencies/platform/server certificate/integrity requirements.

**Inferred:** re-signed splits must all match; different cert prevents normal update over publisher install. Certificate-bound Firebase/Google/OAuth/reCAPTCHA/Facebook configuration, verified links, provider authorities, Play account behavior and saved sessions may fail despite no local self-check. JW license/content entitlement remains separate. Verify real flows; do not fake successful billing/auth/integrity/license responses. No build/sign/device validation occurred.

## Narrow patch anchors and regressions

These are **inferred candidates from seen branches**, not implemented or validated changes.

| Anchor | Scope and required regression |
|---|---|
| AdsDisplayConfig.mustShowAds()Z | Select existing no-ad result for local display/insertion/branding/new-manager preload and normal interstitial skip. Keep Authentication/NextAuth/account entitlements genuine. Audit legacy SDK initialization separately. |
| Banner renderer / fallback | Cover common renderer, LoadBannerAd direct AdView.loadAd2236 and BannerAd.Companion.load preload; clean caches/refresh, no blank rows/heights. Preserve Compose state/restart and ordinary news/match order. |
| Interstitial | Existing bypass must call onDismissed exactly once, clear loading and navigate on Main with normal suspend result. Check offline/no-cache/counter2, Pro article, rapid taps/screen destruction. Do not force show failure (existing callback omits dismissal). |
| JW ads | Prevent both feed and single onBeforePlay playAd; avoid shared AdvertisingConfig attachment for SDK schedules. Preserve setup/license/lifecycle/content listeners. Do not swallow requests/events after instream blocking. |
| Video matrix | First play/swipe/replay/<30s/blank vendor-IFA-tag/schedule refill; waterfall/no-fill/30s timeout; skip/completion/pre-mid-post/VMAP seek; pause/background/fullscreen/rotation; single+feed; content error/playlist advance/network loss; separate YouTube/podcast. Content starts promptly with progress/audio/controls intact. No SSAI promise without manifest evidence. |
| Analytics | Guard ViAnalytics init/all Firebase/comScore sends/id labels, independent LiveStreamAnalytics and ApiPerformance sender. Preserve functional requests/control flow. Verify no comScore120s updates or screen/user-property/ID sends after fresh start/resume/user change. |
| Provider/defaults | Set optional Analytics/Crash/Sessions/Facebook defaults before auto-init and guard App's Crashlytics true. Preserve Firebase Auth/FCM/Installations. Audit transport/work queues rather than delete shared Firebase wholesale. |
| BlueConic / UMP | Cover initialize/page-view/objectives/recreate paths; repeated consent dismiss/forceLoadForm must complete without collection restart. Preserve age gate, preferences and callbacks; never fake positive consent. |
| IDs / logs | Avoid display ad_id and video ifa_id fetch/storage/log/derived labels; complete failure/empty callbacks on expected dispatcher. Clear only collector-owned cached state, not auth/purchases. Respect actual LAT semantics despite field naming. |
| JW/browser collectors | Verify a JW disable seam before modifying jwpsrv module loading; keep setup/events/player modules/license. Check no jwpltx beacon while content works. Remote iframe/YouTube/Omny needs its own bounded traffic evidence. |
| Paywall cosmetics | Consider only where usable content demonstrably supplied. Sample is short blocks+wall; no full-body promise. Preserve scope/auth/generated IAP authorization/real purchase, restore, acknowledge and email verification. |

**Unknown/runtime gaps:** no Android traffic capture, SDK-task observation, paid session/purchase or private media manifest inspection. Remote VAST/VMAP/tags/cadence, stitched streams, JW licensed analytics, browser collectors, dependency/provider/reflection collection, server authorization and certificate-dependent behavior remain unresolved. Test fresh/retained data, UMP accept/reject/reopen, login/logout/restore and genuine pending/cancel/success purchases, foreground/background and every media surface. Direct-reference negatives are not universal absence guarantees.

**Research verification:** pinned inputs; all 11 DEX app items structurally indexed without instruction-boundary errors; relevant branch/caller/callback reads; all-split native/asset inventory; public shape/hash-only samples. No REA fallback/JVM needed by this researcher. One transient SSD read error on BlueConic synthetic class succeeded on exact retry (1,261 B,SHA `bcc07097985b91b98d667c2706e4a49a479bd17d4b5226f416463da1305f74ed`), not an outstanding decode gap. Parent owns JVM/decode/signature metadata. Completed Dumpert report unchanged.

## 29 October: implementation follow-up

Additional original-source checks locate `app-measurement.com` in the GMS
measurement `zzbh` endpoint configuration, and `firebase-settings.crashlytics.com`
in Firebase sessions `RemoteSettingsFetcher` and Crashlytics `SettingsController`.
These are SDK endpoint/configuration observations, not a decrypted traffic
capture. The implementation separately blocks the inspected GMS HTTP runnables,
known CCT telemetry, comScore connections and crash-report scheduling through
their native unavailable/failure paths. Functional authentication, push and
settings services are retained. See the [implementation audit](../../voetbal-international-audit.md)
and [privacy README](../../privacy/voetbal-international/README.md) for scope.

### Publisher home-feed promotions

On 29 October the user reported working Pro content and no other ads, but up to
three copies of a print-special promotion on home. A credential-free GET to
`https://pb-api.vi.nl/edition/200/curation?scope=public` returned HTTP200 with
57 news items, three matches and five `marketingBlock` entries. The reported
creative was among the marketing entries; no creative/article text is committed
in the [response-shape evidence](voetbal-international-marketing-shape.json).

The native mapper converts that server type to `CurationItem.Marketing`.
`CuratedNewsResponse.getItems()` feeds both the home grid's item count and its
existing empty-list branch. Hide ads now filters only that native type, without
mutating the stored list or removing Pro news. A separate pre-composition guard
stops the dedicated marketing renderer for cached/direct entries. Campaign
titles and destinations are not used as classifiers, so replacements in this
format receive the same treatment. This is separate from ad-network banners.
