# NOS Teletekst — inspected-build research (2026-10-28)

Research only: no implementation, build, commit/push, device, emulator, account or purchase actions. **Seen** means static evidence in this exact artifact (or the explicitly identified anonymous sample); **inferred** means an implication; **unknown** means unobserved behavior. The leanrea ordinary-CLI path was sufficient; no JVM or REA fallback was started.

Private root: `/Volumes/MorpheResearch/research-2026-10-28/apps/nos-teletekst/`. Existing copied inputs/decoded/inventory were read only. New private outputs are exclusively `analysis-phase2/`; shell temporary data uses `/Volumes/MorpheResearch/tmp`. No raw source, body capture or credential is committed. Evidence aliases below: **A**=`decoded/smali_classes3/nl/nos/teletekst/`, **S**=`decoded/smali_classes3/nl/nos/sdk/analytics/`, **N**=`decoded/smali_classes3/nl/npo/tag/sdk/`.

## Build and coverage

**Seen:** package **com.eoffice.android**, version **2.8.10**, code **62**, minimum API **23**, target/compile **36** (`badging.txt`, root corrected research inventory). APKS SHA-256 `0012a0717d8f4e1d28b27d4400c2431fcf88b87ae3dc78da7e9db4a19b9cfa9b`. Publisher certificate SHA-256 `09c20f5d028a5065fbeb4a94ea4d4ba4a8fd2fa5c2dff161e32456608989ee14`, DN CN=mobile,OU=mobile,O=e-office,L=Houten,ST=Utrecht,C=NL (`signer.txt`). Google distribution source stamp is a separate certificate. Signer output also contains unprotected META-INF notice/version-entry warnings; they do not establish a runtime defect.

| APK | SHA-256 |
| --- | --- |
| base.apk | `767b8abf5e85a6a55c5712dd66c73200ab0c3613f63a8ba2302afaf007cb5c2d` |
| split_config.arm64_v8a.apk | `bb8012f51aaeb16ec5eec95f8807447aacb00e0689bcf65c8d3ee02fd1542dff` |
| split_config.en.apk | `799093f25818cbe8a5c7534ee82c8a4c1a246a2fc82a6c27a74d861db6886b1f` |
| split_config.nl.apk | `546e1afebf5e352ec4a66038f9c3a70745ffddb87a0195b4e1d7cb64a36096fb` |
| split_config.xxxhdpi.apk | `f9a2c5aee4d27d390e20fd2f62ed7e0c44d746fcec204f7898179bf7664fd7bd` |

**Seen:** all five split ZIP inventories and manifest/resources reviewed. Base DEX class counts are 7,427 / 15 / 4,899. All DEX were extracted by the parent and searched for application/SDK callers; app-owned source, NPO factory/plugin/queue/ID/lifecycle paths and content callbacks were traced. The only native library is arm64 `libdatastore_shared_counter.so`; assets are fonts and baseline profiles. Native Java/Kotlin Android views, Hilt, Retrofit/OkHttp, NOS analytics and NPO Tag/Govolte are wired. Piano/ATInternet classes are bundled but differ from the installed plugin path. `analysis-phase2/coverage-searches.json` preserves exact whole-DEX search patterns/results; it is an index, not proof of executed behavior.

## Advertising and promotional UI

**Seen:** no Ster domain or ad loader, GAM/AdMob/Xandr/Prebid/IMA request, ad-view constructor, WebView instance, video-player/ad lifecycle or Billing implementation was found in the all-DEX search. The single WebView API hit was AndroidX `WebView.findAddress`, not a renderer. No ad SDK provider/activity/service is manifest-wired. **Inferred:** there is no justified Ster/banner-ad suppression anchor in this inspected build. An SDK/publisher association or a resource containing the word banner is insufficient evidence of paid ads. **Unknown:** future builds, server text that itself contains promotions, or dynamically changed content.

| Requested format | Inspected-build result |
| --- | --- |
| Ster display/banner/feed/native | No application-wired ad request/renderer established. |
| Interstitial/app-open/rewarded | No request/show/reward callback established. |
| Video preroll/midroll/postroll, IMA/VAST/VMAP/DAI/SSAI | No video/ad player established; Teletekst content is native character rendering. NPO SDK stream-event models are analytics capability, not proof of media playback. |
| In-house NOS-app promotion | Actual app-owned modal described below; separate from Ster advertising. |
| Web/HTML/remote-JS ads | App extracts a `<pre>` region from returned page text and renders characters; it does not execute the HTML as a webpage. One ordinary anonymous response contained no script/iframe/image/video element. |

**Seen:** `Main.getPage(String,Z,AnimationDirection,ZZ)V` calls `VoetbalscoresDialogController.handleDialog(page, isNosAppLaunchIntentAvailable)` only when page changes and device is not TV (`A/activities/Main.smali:2384-2417`). Controller checks page **818**, skips if NOS app can launch, counts qualifying visits and shows exactly at the third (`A/voetbalscores/VoetbalscoresDialogController.smali:37-92`). Same-page refresh goes around this branch. The modal opens Play Store for `nl.nos.app` with promotion referrer parameters; display/download/cancel emit app analytics events (`VoetbalscoresDialogController:95-119`; `VoetbalscoresDialog.smali:117-162`). It has normal dialog buttons, with no network ad-load/no-fill/reward contract.

**Inferred optional candidate:** if in-house promotion suppression is included in scope, make only `dialogShouldBeShown(String,Z)Z` false, or suppress only `handleDialog`/`showDialog`. Keep Main.getPage unchanged. No fabricated ad completion is required because this gate is synchronous and content loading proceeds independently. Removing the whole getPage/onResponse method would break pages, retries, history and refresh.

## Tracking initialization, events and IDs

**Seen:** singleton `AnalyticsModule.provideTracker(Context)` constructs `SdkTracker(context,isTelevision)`; the all-DEX constructor search found this one app-owned constructor site (`A/modules/AnalyticsModule.smali:47-76`). SdkTracker builds NOS AnalyticsConfiguration with production brand ID **631,002** (hex **0x9a0da**), broadcaster `nos`, program `teletekst`, platform app/tv and version2.8.10, then calls createAnalytics (`A/analytics/trackers/sdk/SdkTracker.smali:85-171`). The hex value is authoritative; no secret/key is reproduced.

**Seen:** NOS factory builds NPO Tag using the supplied brand/platform and a plugin factory containing **only GovoltePlugin** with base `https://topspin.npo.nl` (`S/npotag/util/CreateNpoTagInstanceKt.smali:48-137,172-192`). NpoTagFactoryImpl invokes that supplied factory and does not add an ATInternet plugin (`N/builder/npotag/NpoTagFactoryImpl.smali:565-617`). NpoTagImpl constructor immediately calls each plugin.start (`N/internal/domain/NpoTagImpl.smali:291`), so Govolte's persistent queue starts during dependency construction, before a later event-sink no-op could stop an old queue flush.

**Seen:** app `SdkTracker.track(TrackingEvent)V` maps the event and calls Analytics.invoke (`A/analytics/trackers/sdk/SdkTracker.smali:356-376`). The app mappers cover all of these groups (`analysis-phase2/app-event-map.json` records mapper filenames/lines):

- Page views: Teletekst page/subpage, settings, favorites, add-favorite screen, and NOS-app scorebord banner display.
- Click/navigation: menu open; page open from display/control/fast-link/numpad/favorites; add/remove favorite; share page; promotion cancel and download.
- Fields: page name, navigation origin, action, `teletekst`, favorites/settings labels, `nos-app`, `banner`, `scorebord`, display/cancel/download. `EmptyEvent` maps to no analytics data. These are defined app mappings; not every possible interaction was executed.

**Seen:** successful content callback calls `Main.createPageTracker`, which emits ViewPageEvent and invokes `PageLifecycleObserver.onShow` (`A/activities/Main$11.smali:432-474`; `Main.smali:758-783`). Page tracker dispatches PAGE_VIEW/click/scroll/error/recommendation/stream-capable model events; its visibility heartbeat interval is **10 seconds** (`N/internal/domain/tracker/PageTrackerImpl.smali:137-159,324-346,617-648`). Current app explicitly uses page/click events; media handlers in the shared NOS SDK do not prove this app plays video. `Main.onPause` calls analytics observer.onPause and separately removes the **content** refresh runnable (`A/activities/Main.smali:4036-4052`). These timers must not be confused.

**Seen:** Govolte submit goes through throttler → EventQueue.add → Room-backed pending events → coroutine worker → EventDispatcher.dispatch → POST **`mob-event`**, with User-Agent header, query `p` and GovolteEvent body (`N/govolteplugin/GovoltePlugin.smali:947-959,1124-1158`; `internal/queue/EventQueue.smali:663-745`; `internal/EventDispatcher.smali:69-175`; `internal/network/GovolteApi.smali:36-67`). HandleEvent has network-wait, connection/timeout retry and error handling (`GovoltePlugin.smali:428-1061`). This is analytics transport, not Teletekst content refresh.

**Seen:** NMO DAM is separately enabled by default: BuilderContext synthetic constructor defaults isNmoDamEnabled true (`N/builder/npotag/BuilderContext.smali:201`); app builder does not call withDisabledNmoDam. Factory creates DamIdManager/Service (`N/builder/npotag/NpoTagFactoryImpl.smali:453-532`), and NpoTagImpl dispatch coroutine calls trySubmitDamId (`N/internal/domain/NpoTagImpl$dispatch$1.smali:379`). Endpoint **`https://nmonpoendpoint.2cnt.net/`** receives GET parameters `cs_fpid` and vendor default `at` (`N/builder/npotag/NpoTagFactoryImpl.smali:63,99`; `internal/data/network/NmoDamApi.smali:39-64`, `$DefaultImpls.smali:38`). Minimum submit interval **24 hours** (`N/internal/data/DamIdService.smali:70-94`). Blocking only Govolte transport misses this independent identifier call.

**Seen:** generated random/time-derived event, party, session and DAM IDs are persisted with DataStore keys `nl.npo.tag.sdk.internal.data.{partyId,sessionId,damId,damIdSubmitTime}` (`N/internal/data/id/IdRepositoryImpl.smali:160-199`). Session inactivity expiry is **30 minutes** (`N/internal/domain/id/SessionIdManager.smali:79-103`). InferredContext carries damId/eventId/partyId/sessionId/newness/timestamp. PlatformContext includes screen pixels/density/orientation, SDK2.1.2 and User-Agent containing app package/version, device manufacturer/model, Android release/API (`N/internal/domain/model/InferredContext.smali:64-76`, `PlatformContext.smali:65-75`; `PlatformContextProviderImpl.smali:162-282`). These are actual generated tracking IDs; there is no need to label them advertising IDs.

**Seen (dormant/library evidence):** ATInternetPlugin can instantiate Piano; Piano VisitorIDStep contains advertising-ID/ANDROID_ID fallback logic (`decoded/smali/io/piano/analytics/VisitorIDStep.smali:664-691`). No ATInternetPlugin constructor caller was found and the installed factory returns only Govolte. Legacy `ga_trackingId`/autoActivityTracking resources remain, without a GoogleAnalytics/newTracker caller established. AD_ID/legacy FCM permissions and three generic Firebase exception classes likewise are not proof of collection. No Firebase initialization/messaging/crash/performance components, Crashlytics/Sentry reporter, app-owned identifier API caller, or current push-service registration was established. App Log routes to Android logcat; the SDK includes its own error events/queue, separately described above.

## Privacy, premium and functional traffic

**Seen:** Main.onResume shows a first-run **informational privacy dialog** when `had_seen_privacy_dialog` is missing; positive and cancel callbacks both persist that preference (`A/activities/Main.smali:1448-1488,4168-4246`). This is not an opt-in/opt-out flag controlling AnalyticsModule. Tracker construction does not consume this preference; no CMP/TCF/re-enable integration was found. Do not change this flag to claim analytics disabled.

**Seen:** no app authentication, billing client, purchase permission, entitlement check or local paywall gate was established. NPO Tag login/logout methods are shared analytics-identity functionality; they are not a NOS subscription flow. The app page API uses a default OkHttp client and GET `/page/{page}` with no auth/session interceptor (`A/modules/NetworkModule.smali:48-110`; `A/network/TeletekstApiService.smali:32-52`). **Inferred:** no premium unlock patch is warranted by this artifact. **Unknown:** every server page's future availability; no account/payment state was created or asserted.

**Seen anonymous sample:** ordinary credential-free GET `https://teletekst-data.nos.nl/page/101` returned HTTP200, text/plain ISO-8859-1, **1,073 bytes**, SHA-256 `82a27105556670462758c706cd87c3d01bd1bbf9446d4c49bbf67622f60ef432`; one `<pre>`, zero script/iframe/img/video/a elements or remote domains. Body/headers/metadata remain `analysis-phase2/page-101-anonymous.*`. Curl used normal certificate verification; Python's local trust store first rejected its chain, which is an environment observation, not proof of an app/server TLS defect. No TLS verification was disabled. This proves only that sampled page was publicly delivered, not universal content availability.

**Seen:** Main handles raw response navigation markers `pn=p_`, `pn=ps`, `pn=ns`, `pn=n_`, fast links `ftl=`, and extracts only `<pre>...</pre>` characters for TeletekstView (`A/activities/Main.smali:867-1158`). Native SurfaceView/Canvas/typeface rendering and clickable page-number logic live in TeletekstView; there is no JS bridge or remote-JS execution path in this build. Changing fetched page text to strip arbitrary words such as Ster would risk corrupting real Teletekst content/navigation.

| Host/path | Proven role | Preserve/separate |
| --- | --- | --- |
| teletekst-data.nos.nl/page/{page} | Functional page text/navigation | Preserve all content, callback/error/retry flow. |
| topspin.npo.nl/mob-event | Govolte analytics event POST/queued retries | Independent analytics transport. |
| nmonpoendpoint.2cnt.net/ | NMO DAM identifier GET | Separate from Govolte and content. |
| over.nos.nl + privacy/contact links | User-invoked external informational navigation | Preserve intentional browser launch. |
| play.google.com NOS app link | User-invoked NOS promotion with campaign referrer | Optional promo suppression; not a banner auction. |

**Seen:** content auto-refresh honors preference `auto_refresh`; TV uses **60 seconds**. Main$1 Runnable reloads current page; onPause removes callbacks, response success restarts scheduling (`A/activities/Main.smali:693-755,4036-4052`; `Main$1.smali:38-81`; `Main$11.smali:505`). OnFailure clears isDownloadingPage, handles cancellation, restores loading UI and reports retry/unavailable (`Main$11.smali:68-166`). OnResponse handles 404/error, history, ISO-8859-1 body read, native rendering, page analytics, bookmark-star state, refresh restart and currentCall clearing (`:169-512`). **Inferred:** preserve these callbacks entirely; the tracking call shares a callback with essential state updates.

**Seen:** application installs the Google Play Services security provider, handles missing/repairable provider with logging/error notification, and configures Hilt WorkManager (`A/NOSApplication.smali:40-137`). Do not classify that security notification as news push or bypass ProviderInstaller. App content client uses default TLS, with no custom CertificatePinner/TrustManager configured in its builder. No app-owned Play Integrity/SafetyNet/Maps/Firebase App Check call was established. **Unknown:** re-signed artifact behavior and future backend restrictions; a consistently signed unmodified split baseline is still required before blaming a patch for startup problems.

## Narrow candidates, result contracts and regression requirements

**Inferred preferred tracking candidate:** change only `AnalyticsModule.provideTracker(Context):Tracker` to return existing **MultiTracker with an empty non-null Tracker array**. Its constructor stores the array and its void track method naturally returns without iteration (`decoded/smali_classes3/nl/nos/analytics/trackers/MultiTracker.smali:14-51`). This avoids constructing SdkTracker/NpoTag/Govolte queue and DAM services, while retaining the non-null interface used by every app screen. `PageLifecycleObserver.onShow` already checks a nullable current tracker; onPause clears it (`S/PageLifecycleObserver.smali:72-100`). This contract is better supported statically than returning null, breaking a factory, or no-oping only a network call.

**Inferred secondary anchors:** SdkTracker.track is a safe void event-sink candidate for new app events but alone leaves dependency-constructor queue startup/old events; Govolte start/submit and typed NpoTag dispatch/trySubmitDamId can be separately guarded if retaining the SDK. A suppressed suspend Unit method must return real Kotlin Unit and terminate without leaving continuation/queue retry outstanding; a Retrofit response/model method cannot return arbitrary null/success. Govolte.getSerializedSessionInfo(callback) must still invoke its callback if modified; it is not a fire-and-forget event. Returning an empty plugin set merely logs a factory error and does not prevent DAM setup, so it is not equivalent to skipping analytics construction.

**Inferred optional promotion candidate:** controller dialogShouldBeShown=false is independent of telemetry suppression. No ad error/no-fill/close completion must be manufactured. There is no supported basis here for adding Ster, video-ad, mediation or premium-unlock patches. DPG/Buienradar/RTL contracts do not match this app; reuse only research/verifier structure, not their bytecode targets.

Exact method hashes below cover UTF-8 decoded block from `.method` through `.end method` without final newline, including decoder metadata; they are exact-build anchors, not cross-version semantic hashes. The full descriptor, path, line and digest are also in private `analysis-phase2/anchor-method-hashes.json`.

| Method | Private-relative source start | SHA-256 |
| --- | --- | --- |
| `public final provideTracker(Landroid/content/Context;)Lnl/nos/analytics/Tracker;` | `decoded/smali_classes3/nl/nos/teletekst/modules/AnalyticsModule.smali:47` | `acc6ed93dcc6f4405c9c476add23bbc4435926e9da75765cb70bae3074226e33` |
| `public track(Lnl/nos/analytics/TrackingEvent;)V` | `decoded/smali_classes3/nl/nos/teletekst/analytics/trackers/sdk/SdkTracker.smali:356` | `9e06b02a221dd6571525688158c86e6a56a4b3b1c0d10fa629e111ee77e15815` |
| `public varargs constructor <init>([Lnl/nos/analytics/Tracker;)V` | `decoded/smali_classes3/nl/nos/analytics/trackers/MultiTracker.smali:14` | `45fb170c650fff49574ab436d54db8b76e7e6dec8f450b200907be5ef2cdbb59` |
| `private dialogShouldBeShown(Ljava/lang/String;Z)Z` | `decoded/smali_classes3/nl/nos/teletekst/voetbalscores/VoetbalscoresDialogController.smali:37` | `ad9c498386b62015baf5549d8ad453c662be935d4db9e977094750669902cf30` |
| `getPage(Ljava/lang/String;ZLnl/nos/teletekst/view/TeletekstView$AnimationDirection;ZZ)V` | `decoded/smali_classes3/nl/nos/teletekst/activities/Main.smali:2337` | `8d3828eb4963d9bd55f5b356eeda5d16c486c61c505455872cd82745f4181747` |
| `public onResponse(Lretrofit2/Call;Lretrofit2/Response;)V` | `decoded/smali_classes3/nl/nos/teletekst/activities/Main$11.smali:169` | `16e6e0a54e11e55abd103c4ff424a3c192c805be597c5dfbf978cb04a812a424` |
| `public dispatch(Lnl/npo/tag/sdk/model/EventType;Lnl/npo/tag/sdk/model/PageEvent;)V` | `decoded/smali_classes3/nl/npo/tag/sdk/internal/domain/NpoTagImpl.smali:586` | `d1a845f87f9c2c82ea42727a4aeed07cbbe7515c335c115d343a6a384bb7299b` |
| `public start()V` | `decoded/smali_classes3/nl/npo/tag/sdk/govolteplugin/GovoltePlugin.smali:1124` | `ccd6cb5bc3f87f2962dbff43a74f66423a04ee1d0e84188728a693191954ae69` |
| `public final trySubmitDamId(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;` | `decoded/smali_classes3/nl/npo/tag/sdk/internal/data/DamIdService.smali:294` | `c2341e678792cc3fc8f51318c275708b1f4e102f03aa66143660a2532b609c45` |

Required future regression evidence, **not executed here**:

- Original + consistently re-signed unmodified splits, then tracking-only/promotion-only/all changes. Assert package/version/descriptor/method/branch count matches; preserve essential content/render methods and compare original hashes.
- Cold launch before first-run privacy dialog; dismiss/accept/privacy links; restart/offline/network recovery, queued-event upgrade and old database state. Check Govolte, DAM and any unexpected analytics requests separately; verify absence across initialization and delayed heartbeats, not just one app click.
- Pages/subpages/fast links/numpad/swipe/back history/bookmarks/favorite ordering/start page, share screenshot/text, fonts/size/orientation, accessible labels/readability, error404/unavailable/retry/cancel, activity destruction and state restoration.
- Auto-refresh off/custom intervals, TV60-second timer and remote navigation, pause/resume and same-page refresh. Keep no duplicate requests/spinner hang; pageCall must clear in original completion paths.
- Promotion: first/second/third page818 visit, same-page refresh, NOS app installed/uninstalled, TV, close/Play Store path. Tracking-disabled promo must remain functional if promo patch is not selected; promo-disabled content must still load.
- No client paywall, video or push claim should be promoted into a test result without a corresponding observed path. Retain security-provider behavior and intentional external navigation.

**Unknown residuals:** all live Teletekst pages, future remote text, platform-specific callback timing, runtime network traces, re-signing/startup/TLS differences, and dead-code/reflection reachability. This is thorough inspected-build static coverage plus one tiny public response, not an executed claim of universal ad/tracking removal.
