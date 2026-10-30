# De Morgen 7.53.1 patch audit

Target: `be.persgroep.android.news.mobiledm`, **7.53.1 / 23136515**, minSdk **32**, original Play split APKS. Base APK SHA-256: `5efd606854374f2f5cbfd56352ebedbca3bf141b4d8f4d7d3ee2020b9c8bb8e8`. The original-input guard requires the exact package, version, versionCode, SDK and observed publisher certificate set: `34a28a4862a6204d7c70ebacc7105fae14ac880486c5d2d56a2b9c17907b27c4`. The Google source stamp is excluded from publisher identity. Humo's rotated v3/v3.1 lineage has separate SDK 24–32 and 33+ certificates.

Evidence labels: **Seen** means observed in the original or emitted artifact; **Inferred** means reasoned from those observations; **Unknown** means no adequate evidence. Static analysis does not establish device or network behavior.

## Scope and controls

Five controls: **Hide ads**, **Disable tracking**, **Skip consent screens**, **Hide Premium banner**, **Read full articles**. Tracking includes ads; consent includes both. All additions are isolated in `patches/demorgen`. Published sibling implementations remain unchanged.

Ads stop DFP, Xandr, OptOut and Prebid flags, banner initialization and slot requests, video IMA and VideoProduction advertising. Banner listeners receive the SDK's real `Failure.Disabled`; IMA content resumes through the original callback. Typed article/feed filters remove explicit ad components and whole advertorial results while preserving ordinary content object identity/order and errors. The game constructor preserves state/listeners and replaces only its final ad request with the real error callback; prerolls continue, and rewarded requests remain **RewardRejected**.

Both independent video and game `AdSettingsProvider.init()V` methods stop `/video/settings/` prefetch. Their constructors still initialize the original defaults; playback/UI readers retain non-null values. Prebid is configured in De Morgen's bundled ad JSON but absent from Humo's bundled JSON. The shared provider flag is stopped in both, including future remote enablement.

Tracking covers publisher/Snowplow events, Firebase/GTM, Contentsquare/Heap, Gemius CIM, Comscore including eleven JNI transport sinks, Usabilla, Piano/Cxense, automatic diagnostic forwarding, independent Amalia audio events and video analytics/telemetry. Contentsquare readiness, Piano completion callbacks, completed identifier jobs and typed results remain intact. Functional Firebase Installations, Messaging and RemoteConfig remain. Advertising IDs become opt-out/empty values; the ad-ID HTTP interceptor still calls the real request chain without adding its advertising header.

The Belgian video provider selects `VideoSdkTrackingNoOpt` with the original dispatcher instead of `VideoSdkTrackingImpl`. Its inherited `init(Context)` performs no CIM creation. This prevents the real Gemius video initialization independently of the already stopped player reducers. Inherited general event dispatch remains routed to the stopped AnalyticsDispatcher. Exact signatures and unchanged original tails are independently pinned.

Web policy parses URLs and matches exact/subdomains, including `bmtrcs.com`, Gemius and known ad/collector families. Both owned WebView clients delegate allowed URLs to their original superclass. No unresearched publisher DOM selectors or newsletter rules are added.

Consent suppression returns the real completed Unit without changing acceptance, rejection or signed consent. First launch invokes the original `onOnboardingComplete()` job before showing Home. It does not compose the login/welcome/notification setup graph or request notification permission. Missing subscriptions retain the original empty/false values; saved choices, manual privacy/login/notification settings, authentication and account state remain.

The marketing resolver yields `ResultOf.Success(MarketingTemplateResolveResult(false, emptyList()))`. Its boolean is `hasReducedContent`, not a subscription entitlement. The normal mapper produces None and renders editorial body components already received. Premium labels and the subscriber-benefit row are separately hidden. No token, entitlement, purchase, consent or rewarded success is fabricated.

## Original-artifact verification

Fresh APKTool decodes on **2026-10-30** reproduce **112/112** sibling target descriptors in each app, **110/112** equal bodies between the apps and **19/19** retained-body pins. The two Contentsquare differences are R8 switch indices in methods that are stopped. All **70/70** structural checks pass per app. Additional Amalia/game/identifier pins match **13/13**, and real game continuation consumers match **5/5**.

Each app independently pins **270** retained manual/account/navigation/notification methods and the complete startup coroutine. De Morgen matches the Parool onboarding cohort; Humo has independently recorded OnboardingScreen and onboardingGraph lambda hashes. Its verifier does not select Parool's brand contracts. Five new Belgian boundary/constructor methods are separately pinned per app.

The no-control verifiers pass the fresh originals. All five selected controls fail on the expected missing patch effects before implementation; separate Belgian video/ad-settings assertions also fail. Logs: `build/research-20261030/edition-evidence/*-red-*.log`, `red-results.json`, `contracts.json`, `structure-*.txt`, `independent-originals.json`, `belgian-targets.json` (ignored local evidence).

## Catsure privacy boundary

The fresh full-tree call inventory finds one `syncQueue(CurrentQueue)V` caller: `AudioQueueHolder.commit`, which publishes `queueFlowMutable` before the detached upload and persists manual queue items afterward. The response is discarded by its coroutine. `sendHeartbeat(AmaliaAudioPlayerState,String)V` has three callers (playing, paused and stopped), builds the device/media/position/state payload and launches a detached coroutine; its response is also discarded. No heartbeat or queue response fields are consumed outside their models/serializers. Genuine audio authorization consults the separate marketing resolver, not Catsure, and the Catsure client adds an existing JWT rather than creating audio authorization.

Both two-sink assertions were RED separately on both originals before this change. `tests/belgian_catsure.py` executes the actual emitted no-ops and native queue commit, including a current item, no current item and duplicate queue. `tests/belgian_catsure_originals.json` independently pins 386 unchanged local queue/persistence/device/radio/auth methods per app plus both original tails behind their scoped prefixes. Global device identity remains because radio stream URL enrichment separately reads it. Only these two detached uploads are stopped; no fabricated success or authorization is returned. This deliberately disables outbound remote queue/playback synchronization.

## Build and emitted-output validation

The initial implementation built successfully and passed the complete original + five-individual-controls + combined Desktop FULL validation matrix, with successful patch reports, signatures and independently decoded effects. Both apps passed their actual original-input guard, including Humo’s two-signer lineage. Archived terminal results: `build/research-20261030/initial-edition-matrix/demorgen-validation.log` and corresponding per-selection reports.

The later Catsure two-sink change rebuilt successfully. Disable tracking passed patch/report/signature checks and the independent emitted verifier, including actual local queue commits and 386 retained queue/persistence/device/radio/auth methods. A stale unconditional entry-body hash assertion was corrected while preserving separate original-tail checks; the RED failure and corrected GREEN outputs remain in `build/research-20261030/edition-evidence/`. Final Skip consent screens and combined selections also passed patch reports, signatures and independent emitted verification on 30 October 2026 (both validator processes exited 0). The final candidate bundle SHA-256 is `ad7e61ce542f4752fac97c14ef5fb43ed7280675a9304e9fa525653f8e9f629d`; final logs are `build/research-20261030/demorgen-catsure-final.log`. Earlier Hide ads, Hide Premium banner and Read full articles results are preserved because their emitted behavior is unchanged. No runtime/device success is inferred from either matrix.

## Remaining runtime questions

Whether De Morgen's server supplies full premium article bodies anonymously is **Unknown**. Sibling anonymous samples are not evidence for this brand. Newspaper/pdf downloads retain actual server authorization. No backend probe, device install, app-data deletion or traffic capture was performed for this work.

Catsure queue and heartbeat uploads now stop at the two callback-free void repository methods. Remote cross-device queue/playback state is no longer updated from this app. The complete local queue/persistence classes, genuine audio authorization, global device-ID provider and radio URL enrichment remain independently pinned; static emitted execution confirms local queue publication and persistence still run. Server-side coordination effects and real audio playback after suppression still require runtime evidence. Content, login, push, configuration, edition/PDF and genuine consent services also retain necessary requests and identifiers. Game IMA initialization precedes the request boundary and is not a proven network-silence guarantee. Untraced remote HTML, server-stitched audio ads, remote configuration and re-signed runtime acceptance remain **Unknown**.

See the [research record](research/2026-10-30/demorgen.md), [privacy notes](privacy/demorgen/README.md), [destination register](TRACKING_DESTINATIONS.md) and [user guide](site/en/apps/demorgen.md).

Published candidate: [v1.20.0-dev.4](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.20.0-dev.4). The downloaded CI bundle has SHA-256 `3b8552f366231151645f219b4599eb31d060b3ed973d5bac49e433c5dc15c27a`; all 45 new-app/shared class payloads and the release catalogue match the validated source. Reapplying all controls with the downloaded published bundle also passed the patch report, output-signature and independent decoded-output checks for this app (`published-demorgen-validation.log`). Runtime and live-network acceptance remain unverified.
