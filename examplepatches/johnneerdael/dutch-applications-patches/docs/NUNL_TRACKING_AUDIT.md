# NU.nl 26.9.0 collector and content audit

Supported package: `nl.sanomamedia.android.nu`, version code 210156, minimum SDK32.
Compatibility accepts the two verified application signing certificates, including
rotation: `80d91716e88298892a4d34076ae3562ac9e2212e08048d09dbfeca2c26a6ed92`
and `a78f41c09876d3cccbd87b5ef0d537ce7e2577f45e2749aff8fc5f8d21f8e986`.
The source set is the complete base/ARM64/English/xxxhdpi split set under
`phone-apks/nu.nl`; source hashes are recorded in the sibling manifest.

This is a version-specific implementation based on independently decoded smali,
shipped assets and public anonymous backend responses on 2026-10-27. The original
findings and superseding follow-up evidence remain in temporary investigation
storage (`re/nunl`). Public publisher article payloads are not committed.

## Selectable controls

| Patch | Dependencies and behavior |
| --- | --- |
| Hide ads | Stops DPG banner startup and nullable banner views, VACS URL requests and IMA advertising configuration. Removes explicit commercial blocks and children and known remote advertising requests. |
| Disable tracking | Includes Hide ads. Stops the native/media sinks below, removes persistent UDS and optional profile IDs, hard-disables Firebase collection and blocks known remote collectors. |
| Hide Premium banner | Independent. Removes the observed `WebAppBlock` whose ID starts `contentBlocker-`; ordinary WebAppBlock embeds and NU+ article links remain. |
| Skip consent screens | Includes Disable tracking and Hide ads. Returns Kotlin Unit from automatic PrivacyGate refresh without recording consent; preserves manual resurface. Automatically continues the notification/account offers as guest after original completion, keeping interactive topic selection and manual settings. |

The manual Settings `Privacy-instellingen` link maps `ConsentTarget` to
`OpenConsent`, then EventProcessor → ContentFragment.resurfaceContent →
ResurfaceConsentUseCase → PrivacyGateService.resurfacePrivacyGate. That entire
manual route remains unchanged. Only ContentActivity startup refresh is skipped.

The NU+ example is a registration notice (`LOGIN-APP`), not evidence of a purchased
subscription requirement. Its response omitted the restricted remainder. Notice
suppression does not retrieve that absent text. Full restricted article recovery
is a separate requirement of the Volkskrant implementation.

## Native and media sinks

| Family and observed execution boundary | Control |
| --- | --- |
| DPG advertising / Google Ads / Xandr / Prebid / Pinch OptOut / IAB OMID | `AdvertisementInitializer.onApplicationCreate`, nullable `DpgBannerBlockViewHolder.getAdvertisementToDisplay` and `MobileAdvertisingManager.loadAd` return before initialization/loading. DpgBannerBlock is also removed from the screen list, eliminating insets. MobileAdsInitProvider is disabled. |
| VACS / IMA / VAST video advertising | `VacsVideoEventTracker.requestVacsUrl` and `ImaAdvertisingFactory.createVmapImaAdvertisingConfig` return null. Player builders preserve their original playlist and accept null advertising configuration. `VideoData.isAdsDisabled` is not used as proof of player suppression. |
| Firebase Analytics / SAC Snowplow / GTM | `FirebaseTracker.trackEvent`, `SacSnowplowTracker.send`, FirebaseAnalytics event/screen/user/default-parameter sinks stop. GTM container removed, TagManager and measurement components disabled, analytics connector registrar removed. |
| DPG Tracking SDK / Snowplow | Both `TrackingSDKInitializer` startup/configuration and `TrackingSDK.track` stop. Prevents the observed install/session/screen/geo/deeplink contexts and collector dispatch. |
| Legacy Sanoma SKIT | `Engine.dispatch`, both `send` and both `sendEventToBackend` overloads stop. App reachability was uncertain; this covers the bundled legacy queue/dispatch without assuming it is absent. |
| DPG UserProfile / advertising ID / app-set ID / DMOI / RDMOI | Constructor-triggered `InitConfigHandler.initialize` stops, app parallel initializer completes with Unit, `UserProfileIdProvider.getAllIds` returns an empty map before SDK construction. Existing DMOI/app-set header modifiers then produce empty values. |
| Persistent NU.nl UDS | Both `UDSTokenHeaderModifier.getValue` and `UserDataStoreTokenProvider.getUdsToken` return an empty string. The unchanged HeaderModifierInterceptor omits empty headers. Generation/persistence is unreachable through this provider path. |
| Comscore / Nobo | `NoboSdkInitializer.initNoboSDK`, current `NoboTracker.track` and legacy `NoboLogger.send` stop. Native libcomScore remains bundled but intended initialization and both observed app dispatchers are blocked. |
| Usabilla | Startup `init`, lazy queue `sendEvent` and leaf `performSendEvent$tracking` stop. Explicit feedback/surveys may be unavailable. |
| BFF events | `HttpTracker.track` stops. `TrackingEngineImpl.trackBFFEvent` admits only the three evidenced canonical `wncCardShownEvent` onboarding acknowledgements and rejects all other BFF mutations. Its original coroutine/cookie/completion path is retained for those functional requests. |
| BrandMetrics | `BrandMetricsService.call` returns null, its existing optional failure path. The enhancer explicitly accepts null. Ad loading is independently suppressed. |
| JWPlayer telemetry | The unique `function Oe(e,a)` Image-pixel sender returns immediately. Script registration, plugin APIs, player assets and media XMLHttpRequest remain. Known remote `jwpltx.com` requests are also blocked. |
| DPNS delivery statistics | Enqueue, lifecycle scheduling and queued delivery (`sendDeliveryStatistics`, `scheduleDelivery`, `sendPendingDeliveryStatistics`) stop. Only private `TrackingEventBroadcastReceiver.trackEvents` stops; its actual intent forwarding remains. |
| PIP OIDC telemetry | `TelemetryClient.init` completes Unit and `register` stops before queueing an await. Login/authentication paths remain. |
| PrivacyGate metrics | Native error metric sender stops; remote `pg.dpgmedia.net/api/metrics` is intercepted specifically. |
| Firebase Crashlytics | Automatic collection getter returns false even with persisted opt-in. App logging tree, exception/log/user/custom-key sinks and manual `sendUnsentReports` stop. Registrar stays available for existing app SDK calls. |
| Firebase Performance | Hard deactivation flags, `ConfigResolver.isPerformanceMonitoringEnabled=false` and `TransportManager.dispatchLog` stop collection and dispatch while HTTP wrapper APIs remain. |
| Firebase Sessions | `SessionsSettings.getSessionsEnabled=false`, RemoteSettings update completes Unit. Manifest flags reinforce this; functional Firebase registrars remain. |
| Firebase push analytics | MessagingAnalytics Scion/Firelog/user-property sinks stop and BigQuery delivery export getter returns false. Actual Firebase Messaging/Installations and DPNS registration remain. |

Advertising permissions are removed: Google AD_ID, Android AD services
attribution/ad ID/topics/config, and Play install-referrer binding. Internet and
notification permissions remain. Firebase Analytics, Crashlytics, Performance,
Sessions, advertising-storage/user-data/personalization collection are disabled
in manifest metadata as well as the native boundaries above. Existing app
collection consent cannot reactivate the patched hard gates/sinks.

Onboarding acknowledgements are required first-party application state. Public
anonymous native bootstrap responses include `wncCardShownEvent` when each of
`breakingNews`, `promoteLogin` and `followTopics` is shown. Buttons dismiss their
pages; the show mutation records completion. A fresh synthetic session with
normal functional cookies and **no UDS header** reproduced all three pages.
Acknowledging breakingNews returned `handled=true` and the next fetch retained
only two cards. Acknowledging the other two removed the onboarding modal, and a
repeat fetch still returned the ordinary frontpage. This demonstrates a server
side effect even though the app discards the response body; blanket BFF-event
suppression caused the physical onboarding loop.

The guard admits exactly `wncCardShownEvent` with one of the three observed
canonical Base64-encoded JSON strings. Wrong event types, unknown cards,
malformed/null/noncanonical data and extra object fields are rejected. It sends
no added analytics fields, uses the original functional request/cookie path and
keeps Firebase/Comscore/Snowplow/HTTP and other collector sinks disabled. UDS
generation and its header remain suppressed. Future onboarding card types need
new evidence before being admitted. The regression executes this narrow policy
from emitted code and preserves the original dispatcher/coroutine by digest.

## Commercial BFF content and safe model boundaries

`ScreenTransformerImpl.transformBlockData(List)` is the shared current-screen
boundary for initial loading, pagination, refresh, action replacement and local
read-state updates. The patch supplies a filtered nonnull List before the
existing validator/modifier run. `BlockMapper.map` remains unchanged, because
its callers require nonnull BlockData.

Individual commercial links are identified by an actual `teaser_click` tracker
field `teaser_type=advertorial`, SmallArticleLinkFlavor `isPartner=true`,
`shop.nu.nl` targets, or exact `nu.nl`/`www.nu.nl` path `/nushop` and its children.
The metadata is only read for classification; external event sinks are stopped.
Normal external editorial links (including Tweakers), article/player teaser
markers and adjacent games/puzzles remain.

The filter decodes Base64 JSON IDs, accepts only the observed structural
`*-section-<number>-<CMS number>-<ordinal>` identity and removes only the terminal
ordinal. Container ID scopes the section key. Sections corroborated by a
commercial link/target or explicit SponsoredByTextFlavor lose their associated
headers/dividers/disclosures as well as cards. A standalone DPG banner does not
mark its editorial section as commercial. Plaintext/malformed/other IDs fail
open under an explicit exception handler. No numeric section IDs or publisher
news text is hardcoded and no section-prefix cache survives between screens.

Carousel/paired child links use `BlockMapper.adaptToLinkDataOrNull`, where the
original callers already skip null children. This keeps normal siblings and
avoids inserting null whole blocks. The existing validator handles resulting
empty containers.

## Remote WebView collectors and preserved functionality

Both request interception overloads cover InlineWebView, full-screen web content,
PIP OIDC login and DPNS inbox clients. The PrivacyGate SDK factory originally
installed only a WebChromeClient; an app-local generated DEX extension adds a
plain WebViewClient and attaches it at the existing factory configuration point.
Its two request overloads delegate to the same policy, so manual privacy metrics
are covered while its original consent/shown/login/close JS bridges remain. JWPlayer's existing modern interceptor is
prefixed with the policy; allowed requests continue through its original
WebViewAssetLoader, JW helper and superclass fallback. The deprecated JW overload
receives the same policy. Existing navigation and page lifecycle callbacks are
unchanged.

The classifier parses Android URI host, lowercases using Locale.ROOT and matches
an exact hostname or an explicit dot-separated subdomain suffix. It never
searches an arbitrary URL for a hostname substring. Ads covers the observed DPG
advertising API/CDN, DoubleClick, Google advertising hosts, Xandr and the Prebid
server. Tracking adds EBX (`applets.ebxcdn.com`), Sentry, GTM/Google Analytics,
VWO's `dev.visualwebsiteoptimizer.com`, JW metrics, Comscore and BrandMetrics.
Only the exact `/api/metrics` path is blocked on `pg.dpgmedia.net`; consent and
other privacy API paths remain.

Public `/blocks` HTML includes EBX and its module initializes Sentry. The same
bundle contains GTM/VWO/privacy/ad code, but not every integration was observed
executing on native SingleBlockPage. The native `temptationDataLayerHandler`
feeds the patched Firebase sink. Its sibling action branch and `f1bridge`
READY/SET_BLOCKS/theme/HEIGHT_CHANGE/layout handlers are preserved. JavaScript
and DOM storage remain enabled. Cookies, account authentication, BFF
SetArrayVariableEvent, local ReadStateEvent and notification intent forwarding
remain byte-for-byte in the checked functional methods.

Preserved traffic includes graph.nu.nl content/pagination, NU.nl images/assets,
JW playlists/media, auth redirects and account cookies, Firebase remote config,
Firebase database where needed for functional content, Firebase
Messaging/Installations and DPNS registration. A blanket firebaseio.com block
would risk comments/live content and was not applied.

## Verification and limits

`tests/verify_nunl.py` has the same decoded-directory / repeatable `-e` CLI as the
other app verifiers. No flags verifies the original. Before production code,
all requested positive selections failed against the unpatched extraction;
aggregate RED evidence is recorded in the task's local work report. Checks
include exact method prefixes, manifest/components, retained functional method
instruction hashes, node syntax and direct execution of the JW pixel function,
and interpretation of the emitted policy/filter smali using synthetic models.
A physical API36 startup run exposed an IncompatibleClassChangeError that the
original synthetic fixtures did not model: BlockData is an interface, while
Block, Target and Link are concrete classes. All three injected BlockData getter
calls now use invoke-interface. The verifier independently resolves every method
owner in generated helpers and inserted call paths against decoded APK ClassDef
flags or the installed Android SDK ClassFile flags; it rejects virtual/interface
mismatches, including /range forms. The synthetic executor uses the same check
before dispatching a fixture call. Platform reference checks require an SDK
platform android.jar (`ANDROID_HOME`, `ANDROID_SDK_ROOT` or `ANDROID_JAR`).

Model fixtures cover section chrome, normal adjacent sections, commercial child
predicates, partner flavor, deceptive host/path strings, malformed IDs and the
specific contentBlocker notice versus ordinary embeds.

Build and real patcher matrix results are recorded in the task report and
`build/validation/nunl`. Each successful selection must have Desktop validation,
FULL bytecode mode, clean patch report, output signature verification and an
independent apktool decode passing the selected effect assertions. This document
does not equate static patch success with runtime collector silence.

Anonymous public backend evidence supports blank UDS for frontpage, net-binnen,
free articles, video details/playlist blocks, menus, registration-wall metadata
and eight-page pagination. Synthetic-UDS and no-UDS responses had identical45
frontpage and156 net-binnen URLs. No private account session was used. Followed
subject/account personalization across sessions remains unverified.

Root's physical API36 test of the corrected combined APK completed all three
onboarding pages once and reached the rendered news/photo feed. Two independent
force-stop/cold starts then retained Voorpagina navigation with no onboarding
headings or fatal Java exception. The user explicitly confirmed "fixed".
Remaining runtime gaps include article detail/video, push opening, login/manual
privacy, F1 embeds and network collector silence. The
manual PrivacyGate request client explicitly preserves clientless navigation:
main-frame user links and redirects use sanitized external browsing intents;
non-Activity contexts, malformed URLs and unavailable/permission-denied handlers
fall back without crashing. Context wrappers are unwrapped for the Activity
check. Gesture-less non-redirect navigation is denied, framework-internal
about/chrome/Android asset/resource URLs remain internal, and subframes remain
in the WebView. The original app-initiated loadUrl is unchanged and no resource
or page lifecycle callback dispatches an external activity. The existing Chrome
client's `_blank` handling and native login/close/consent bridges are unchanged.
This policy follows current Chromium's
[AwContentsClient.sendBrowsingIntent](https://chromium.googlesource.com/chromium/src/+/main/android_webview/java/src/org/chromium/android_webview/AwContentsClient.java)
and Android's
[shouldOverrideUrlLoading contract](https://developer.android.com/reference/android/webkit/WebViewClient#shouldOverrideUrlLoading(android.webkit.WebView,%20android.webkit.WebResourceRequest)).
Device confirmation of terms/account navigation remains with root-owned runtime
checks. The user subsequently authorized NU.nl replacement/data clearing for
physical testing; this worker performed no device operations.
A finite endpoint denylist cannot prove removal of future remote JS collectors,
first-party same-origin metrics, inline storage/fingerprinting, WebSockets or
service-worker traffic. Unobserved server templates/CMS markers can change;
unknown blocks are retained. Split commercial sections whose corroborating
item arrives in another page may leave section chrome until a complete sibling
list is available. These are explicit limits, not claims of complete runtime
coverage.


## Execute-time original input preflight (2026-10-27)

Every named patch and every mutating dependency now depends directly on a
read-only input preflight. It checks the declared exact package, version name,
version code and manifest minimum SDK before a patch can alter resources,
bytecode or extensions. Signing metadata must contain at least one certificate,
and every distinct observed certificate SHA-256 must belong to the existing
allowed signer set. Missing, untrusted and mixed signer sets fail; verified
allowed signer declarations remain unchanged. These checks run even if a client
ignores compatibility metadata or forces selection.

`python3 tests/verify_original_input.py` runs the production validator and actual
resource patch using the real SDK, original APK metadata and controlled invalid
fixtures. It also checks that every dependency is guarded, rejection does not
write the manifest, and the production strict fingerprint resolver rejects
missing or multiple matches. The full descriptor helpers continue to distinguish
legal overloads.

## Optional onboarding follow-up (2026-10-28)

The user requested guest continuation past notification setup and the account offer, while **retaining topic selection**. This extends existing default `Skip consent screens` without another control or dependency change. NU26.9.0/210156/minSDK32/APKS and both original signer hashes remain unchanged. New sites use explicit singleton descriptor matching; the existing broader NU fingerprint helper is not refactored.

Seen in the retained genuine onboarding response: the OnboardingSheet IDs are `breaking-news-modal`, `promote-login-modal` and `onboarding-follow-topics`. The notification screen's three toggles are false. Positive subscription/NOTIFICATION permission belongs to the explicit toggle RemoteTargets. Notification Verder and Doorgaan zonder account are direct DismissTarget buttons, with null success/failure chains and Firebase-only activation events. There is no automatic on-show subscription/account action or variable write in these cards. `tests/nunl_onboarding_source.py` checks the private original payload digest and a tracked sanitized summary; signed remote actions, cookies, publisher prose and raw response stay outside Git. Local required mode is `NUNL_REQUIRE_ONBOARDING_SOURCE=1`, with optional `NUNL_ONBOARDING_SOURCE` path.

The patch retains ShowScreenUseCase's original presentation, local-action processing, required show acknowledgements and shown-count update. Only after successful completion does it queue the original DismissScreen action for the exact two optional IDs, matched to the captured actual ScreenEntity/current presenter ID. The immediate increment wrapper preserves the original continuation and suspension result; a resumed label7 enters the completion prelude before its original first instruction. Failures still propagate. No original live scratch register or coroutine branch target is borrowed.

A review found that a source check before queueing alone was insufficient: the native event may arrive after a manual skip. The final policy tags both the automatic action and the actual optional-card direct button actions **before presentation**, then validates their source against the real remaining ById queue head at the sole native ModalSheetNavigator dismiss dispatch. A per-ViewModel monitor and catchall enclose source validation, the once claim and the original pop/close. Stale tagged actions return handled through the unchanged original Boolean callback. Both queue orderings therefore retain Topics. The once claim also prevents duplicate final-card close/next-intent launches, because the original final-item close does not remove that last item. Untagged topic/manual actions retain original behavior.

The native ViewModel's original remaining-list removal, `KEY_REMAINING_SCREENS` SavedStateHandle persistence, next-screen load and next-Activity intent remain unchanged. The original ContentViewModel buffers events in ScreenPresentationModel/StateFlow until native UI consumption; it does not save that event buffer in this ViewModel across process death. Rebuilt card models are tagged again before display. The direct optional dismiss route retains action identity and does not traverse remote response/copyWithActions chains. Original login, permission/subscription positives, topic selection, actual account/session and server-restricted NU+ content remain unchanged.

Independent regressions execute the actual original/emitted show coroutine, native navigator/type switch, modal list/persistence and callback instructions. They cover every await separately and together, immediate/resumed completion, original show acknowledgements before forward, failed completion, duplicate/stale pending actions, both manual/automatic orders, final-card close, null/unknown/empty state and interactive topic completion. Original method remainders/hashes and actual class/interface/static/private visibility are checked. The DEX monitor catchall is exercised with a synthetic queue-access failure. Initial original-artifact fresh-flow and queued-dismiss race regressions were RED; the original baseline passes. Parent consent-only patch/FULL/sign/redecode passed; independent required-source verification passed at `build/validation/nunl/decoded-skip-consent-screens-vo4a07qj` (23 generated helpers, 212 dispatch references, zero invalid). All-controls patch/FULL/sign/redecode validation also passed with required private-source metadata. Implementation and CLI verification were performed off-device. The user approved these onboarding changes from v1.7.0-dev.1 for stable publication on 2026-10-28. This records user acceptance; exhaustive independent device/network coverage is not claimed.
