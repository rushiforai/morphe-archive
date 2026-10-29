# Volkskrant 7.53.1 patch audit

Supported input: `be.persgroep.android.news.mobilevk`, version 7.53.1,
version code 23136515, minimum SDK 32. Compatibility accepts only the two
verified app-signing certificates (including its signing lineage), not the
Google source stamp. Source is the complete device split set under
`../phone-apks/volkskrant`.

This document distinguishes decoded code evidence from device observations.
Static suppression does not establish that all future remote scripts or
server-side media advertisements have been removed.

## Controls and dependencies

| Control | Included controls | Effect |
| --- | --- | --- |
| Hide ads | None | Suppresses app/SDK banner loaders, SDK initialization coroutine and performance events, provider startup, Xandr/Prebid/DFP/OptOut gates, VideoSDK prerolls and legacy IMA; filters native body and overview ad DTOs, exact article newsletter iframes, and evidenced web advertising origins. |
| Disable tracking | Hide ads | Stops app collector ingress and queued senders, native SDK startup/upload sinks, advertising IDs, video/audio telemetry and known WebView collector requests. |
| Skip consent screens | Disable tracking, Hide ads | Returns the app's existing completed Unit equivalent of automatic popup suppression without writing consent acceptance. Manual privacy resurfacing remains intact. |
| Hide Premium banner | Private empty marketing result | Suppresses premium label presentation and all router-supplied marketing templates, including menu/sticky prompts; scoped publisher-document CSS hides evidenced marketing asides/premium labels. |
| Read full articles | Private empty marketing result | Preserves the received article body while resolving marketing to the app's normal successful empty-template result. No entitlement or purchase state is fabricated. |

The last two controls share an unnamed dependency because both use
`MarketingTemplatesRouter.resolveTemplate`. Its result is
`ResultOf.Success(MarketingTemplateResolveResult(false, emptyList()))`.
This is a completed suspend result, not a suspended coroutine or a continuation
left waiting. Empty templates map to the existing None state. This prevents
both `BlockedContent` and the separate inline-template branch that can replace
the entire body. Read full articles alone does not hide premium-label badges
or inject web-document CSS. Premium suppression necessarily also removes the
same local marketing article restriction.

## Collector coverage

| Surface | Exact control and retained behavior |
| --- | --- |
| App analytics | `AnalyticsDispatcherImpl.track`, pending-event send, direct send and consent re-enable paths stop; FirebaseTracker event and consent entry points stop. Local account/history/navigation code is preserved. |
| DPG/Snowplow | TrackingStartupTask and TrackingSDK ingress stop; SnowplowManager's two actual track overloads stop. No TrackingSDK configuration warmup is launched. |
| ContentSquare | Startup calls the existing `onCSQStartupCompleted` listener without configure/start. Event/screen senders, consent opt-in, pending tracks and identity setters stop. AndroidX CSQ initializer is removed. The three-argument WebView attachment method stops; the one-argument detach method is retained. |
| Heap | Both startup providers are disabled. HeapApiImpl uploader start, committed events, recording start, identity/properties and event ingress stop. Only callback-free `HeapJsWebViewIntegration.register(WebView, Set)` is no-oped; callback-bearing cookie/update methods remain unchanged. |
| Firebase | Analytics/performance hard-deactivation flags; Crashlytics collection arbiter false, exception sink and app startup stop. In-app messaging, AnalyticsConnector and Sessions registrars removed. Messaging Scion/BQ predicates and telemetry entry points stop. The callback-free app FIAM suppression adapter also stops because its optional component is absent; the complete MainViewModel startup/onboarding coroutine is retained apart from the separately audited first-launch completion hook below. FirebaseInitProvider, Installations, Messaging, RemoteConfig and functional HTTP wrappers remain. |
| Facebook/GTM | Auto-init/auto-event/ad-ID metadata false, Facebook startup provider disabled, AppEventsLoggerImpl central event/flush methods stop. Native GTM container deleted and service/preview disabled. |
| CIM/Gemius | Dependency factory supplies existing CimTrackerNoop; actual CIM initialization/send/consent methods also stop. |
| Comscore | App transmitter/public view event stop. Setup startup and callback-free native start/lifecycle/event/queued-cache-flush ingress are replaced with inert bytecode. Native library capability remains packaged in the device ABI split. |
| Piano/Cxense | AndroidX initializer removed, app page-view entry stops. Four queued sender methods call the existing two-argument completion mapper with no exception before returning; EventRecord is converted to EventStatus by original code, not passed as the wrong callback element type. |
| Advertising identity | User-profile config initialization/external IDs/app synchronization stop; cached/unchecked ID maps return empty. Automatic fetch returns an actually completed Job. Suspend fetch returns successful empty String (its actual contract is Result<String>, not Result<Unit>). AdvertisingIdClient returns an all-zero opt-out Info. |
| VideoSDK | Telemetry and CIM configuration gates false; independent telemetry dispatcher returns completed Result.success(Unit); analytics/CIM reducer dispatchers stop. Playback state methods remain. |
| Amalia/Catsure audio | Heartbeat sender stops. Queue-sync upload stops after tracing it: it uploads device ID/upcoming media IDs in a fire-and-forget coroutine and discards the response. Local queue construction, persistence, playback, pause/stop and media-service logic are unchanged. |
| ACRA | Sender services and attachment provider disabled. This is defensive suppression of packaged capability; active ACRA application initialization was not established. |
| Account/privacy SDK metrics | Pipo telemetry register and PrivacyGate error-metric sink stop; authentication, manual privacy choice and account-removal bridges are unchanged. |

Advertising permissions (AD_ID, install-referrer binding and AdServices) are
removed. Optional startup entries require the exact observed manifest
inventory; missing or duplicate entries fail patching. The GTM container and
five executable advertising assets are deleted with existence checks.

## WebViews and native content

The app-owned `DefaultWebViewClient` and
`EmbedWebViewViewModel$EmbedWebViewClient` gain both request interception
overloads. Known advertising/collector hosts and their real subdomains return
an empty successful WebResourceResponse. Host comparisons parse the URI and
compare complete host boundaries, ignoring unrelated paths/query strings.
Allowed requests retain each client's superclass behavior. Existing clients
are extended, so their loading/title/error/navigation callbacks remain.

Coverage includes the evidenced DPG advertising CDN/module, Prebid,
DoubleClick/Google syndication, Xandr, Microsoft/Bing ad SDK, OptOut,
ContentSquare, Heap, native DPG collector, Catsure, first-party c/c2/vx
collectors, GTM/GA, Comscore, Gemius, Cxense, VWO and Brandmetrics origins.
No entire Volkskrant domain, generic iframe, JavaScript, chart/media origin,
consent preference or identity host is blocked. The exact newsletter endpoint
is filtered only when delivered as an article iframe; deliberate signup
navigation elsewhere is preserved.

Native body filtering removes `AdvertisementBlockDto` and only iframe HTML
using `https://ims.volkskrant.nl/optiext/optiextension.dll`. It preserves object
identity and order for all other DTOs. Overview's explicit Advertisement
components are removed before mapping to avoid reserved space. Datawrapper,
KijkVerder, podcasts, paragraphs, lists, images, quotes and social-consent
mapping remain. `app.notifyHeightUpdated()` is unchanged.

Premium web CSS is restricted to `volkskrant.nl`/`vk.nl` and their `www`
hosts, and only the five evidenced `aside[data-temptation-position]` values
and `[data-test-id="premium-label"]`. It is idempotent and applies to late DOM
nodes through CSS. Account subdomains/external pages are not modified.
Default page-finished behavior (including empty-page handling) is preserved.

Hide ads also checks the complete article result for concrete
`ArticleStyle.Advertorial` or a body `AdvertorialHeader`, before article UI
rendering. It returns the app's existing
`ResultOf.Error(GeneralDomainError.Other)` for that whole story. The user sees
the existing generic native error/retry state rather than sponsored text with
its disclosure removed. Ordinary/classic fallback and separate moment/deep-link
coroutines are guarded after their suspended/resumed merge; their sentinel,
existing errors and editorial objects remain unchanged. This does not classify
feed cards that carry only a short ID.

The reused R8 names HeapJsCookieManager$$ExternalSyntheticLambda0 and
CsWebViewTagInjector$$ExternalSyntheticLambda0 are **not** treated as evidence
of tracking: their selected branches handle ordinary page/font callbacks.
The actual CSQ attachment and callback-free Heap registration methods are
separately controlled.

## Full-body evidence

Anonymous requests use only the fallback shipped in public app resources.
Credentials are read programmatically, never printed or persisted in tracked
files. `tests/verify_volkskrant.py DECODED --probe-public` prints only counts,
flags and hashes; TLS certificate validation remains enabled. On this machine,
Python requires its certificate bundle configured with `SSL_CERT_FILE`.

| Short ID | Historical premium flag | Reproduction premium flag | Paragraphs | Final substantive paragraph |
| --- | --- | --- | --- | --- |
| 424b597 | true | true | 14 | 80 words, SHA-256 `efb89c387a70a152f25be8ce086cd0af91af109e599f593ce01b62aa417af0e0` |
| 98f3dc53 | true | false | 9 | 53 words, SHA-256 `5fe77d181e40a33d2592c6221161b1ab71888f8aff0e84ce0bcdf066d4b0ac6e` |

The second response's live premium flag changed. Its final substantive
paragraph is followed by a ten-word author note; the verifier checks the
substantive hash rather than mistaking the final PARAGRAPH node for the final
editorial paragraph. Investigator evidence matched those substantive
paragraphs to the publisher's public pages. This proves body delivery for the
samples, not successful rendering on a patched phone or all future formats.

## Verification and remaining gaps

Before implementation the original no-flags verifier passed and every named
positive selection failed. The independent verifier checks exact emitted
instructions, manifest/assets, normal callback completion, retained method
instruction digests and behavior of the emitted filters/request dispatcher.
It checks class/interface dispatch, static/instance call contracts and helper
return opcodes against actual decoded DEX declarations; a permissive object
interpreter alone is insufficient for Android runtime verification.

The final bundle and all five individual selections plus the combined selection
passed Desktop FULL validation, signing and independent decoded verification.
The repository Python suite passed 15/15 tests.

Build/selection evidence and current runtime status are recorded in
`.superpowers/sdd/2026-10-27-news-weerplaza/task-3-report.md`. Do not infer
physical readiness from a successful Desktop patch report.

Unresolved requirements:

- Concrete article ADVERTORIAL/header markers exist, but the current overview
  DTO model has only DEFAULT/LIVE_BLOG and no proven upstream sponsored marker
  or real advertorial feed sample. Sponsored-feed-card removal remains unresolved.
  Whole-story protection handles both explicit article markers before rendering;
  Branded/syndicated editorial is retained. A positive feed-card marker remains
  unproven, so upstream feed-card removal is not claimed complete.
- Audio server-side ad insertion, advertising within remote media payloads,
  additional dynamic web origins and background/previously queued traffic need
  physical network observation. Browser/custom-tab destinations are outside
  these app-owned WebView interception points.
- Complete premium article rendering (including final paragraphs), manual
  privacy/login/account removal, feed/navigation/history, push, video/audio
  and chart resizing still require specific USB-phone verification. The cold
  startup check below does not establish these separate behaviors. No emulator
  was created; this worker performed no phone operations.


Runtime fix round 1: the first installed combined build crashed because
`SuppressFirebaseInAppMessagingUseCase.invoke` unconditionally dereferenced
`FirebaseApp.get(FirebaseInAppMessaging.class)` after FIAM registrars were
removed. This was an overlooked app-to-optional-SDK dependency. Disable tracking
now completes that callback-free void adapter without requesting the absent
component. The regression executes the failed emitted consumer with a null SDK,
then checks all popup/suppression combinations, original SDK-present behavior,
registrar availability and the unchanged complete startup coroutine. No FIAM
registrar, data collection or marketing behavior is re-enabled.


Physical retest after `157e1c1`: root installed the exact combined APK SHA-256
`27199908fc298b0e1216c8f236f6f6ca4f257a8e072a503dcc9ed76bb6f4bd0f`
with a same-key `install-r` update, preserving the new app data. Installation
succeeded, the cold MainActivity launch reported Status ok, and the welcome UI
was present. The target-UID log scoped since the update contains no new FATAL
entry. Evidence is in `build/validation/volkskrant/phone-hotfix-start.xml` and
`phone-hotfix-startup.log`. The user subsequently reported “volkskrant works
perfect ;)”. These observations support recovery from the reported startup
crash. The user then confirmed that everything opened, including columns and
podcasts, was fully readable, and confirmed the supplied test article worked.
Root independently rechecked that article `424b597` still has `isPremium=true`,
14 editorial paragraphs and the expected final substantive paragraph hash.
This records user reading acceptance plus API evidence; it is not an independent
paragraph-by-paragraph UI capture or a collector traffic audit.

The first-run welcome screen still contains a subscriber-benefit row (“Log in
als abonnee…”). This automatic promotional surface remains an item to assess
under premium-notice coverage. No source behavior changed during this
documentation follow-up. The scoped runtime re-review approved the startup fix
without new defects. The user requested publication of all functional patches
to `main` under the renamed `dutch-applications-patches` repository; the
coverage limits above remain documented.


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


## 2026-10-28: automatic first-launch setup

The user requested login promotion and notification setup to be skipped, plus
Volkskrant's extra welcome slide. The existing default **Skip consent screens**
control now completes this setup before its Compose graph is created. This is a
new behavior increment; earlier phone acceptance of the core controls does not
establish acceptance of this increment.

**Seen in each independently decoded 7.53.1 original:**
`LaunchStateResolverImpl.resolve(Activity, Continuation)` reads native
`PREF_ONBOARDING_SHOWN`. Missing/false completion reaches the one final
`MainViewState$Onboarding.INSTANCE` assignment at instruction 96 of
`MainViewModel$validateState$1.invokeSuspend(Object)Object` (nine locals).
Both original `:cond_9` and `:goto_2` labels identify that assignment; the real
label 3 audio-dismiss resume path jumps to it. The original startup graph
includes login, brand-dependent welcome and notification destinations.

The replacement keeps that original node as the first instruction: read
`this$0` into v4, invoke the original public instance
`MainViewModel.onOnboardingComplete()Job`, then assign `MainViewState.Home` to
v4. The original assignment killed v4; no other live register is borrowed.
Keeping the first instruction at the original node ensures resumed paths
execute completion instead of jumping past it. Its native job saves true via
`SetOnboardingShownUseCase` and the original preferences wrapper, then emits
Home. The enclosing coroutine publishes Home too, so deferred job scheduling
cannot briefly create the setup graph. Completed-user and Google Play error
branches, intent/deep-link handling, coroutine suspension and native Unit/job
contracts remain intact.

**Seen notification defaults:** this app uses Room/BFF subscriptions, rather
than AD's USER_CHANNELS preference. Its legacy `PushSectionLocalStorage`
wrapper already gives missing `pushSections` an empty list. Its current
`PushSectionsDtoMapper` maps a missing nullable subscribed value to false,
while preserving explicit true/false choices and category metadata.
`withOnBoardingSubscriptions` separately promotes enabledDuringOnboarding
categories inside the skipped onboarding ViewModel. Skipping before that
ViewModel is created avoids its preload, preselection, subscription update and
permission-dialog lifecycle. No fake topic key is seeded, no Room rows or
saved account/notification choices are cleared, and no subscription endpoint
is called to establish the default. Existing server choices remain preserved;
this change does not claim to rewrite backend state.

**Verification:** the independent original behavior verifier passed baseline
characterization for each app, then failed the requested fresh-Home behavior
because the actual coroutine emitted Onboarding. The generated-injection
resume regression also failed before the branch-anchor correction. APK-free
CI executes the actual production injection strings with original-node label
identity. Emitted verification executes native startup, completion and
preference methods for missing/false/true completion, account presence,
Android permission granted/denied, immediate/deferred scheduling and the real
audio-dismiss suspension/resume. It executes the original missing-empty
storage wrapper, nullable subscription mapper and manual category on/off and
Android permission request paths. Independent original hashes cover 270
unchanged methods per app; only the owned three-instruction assignment is
normalized in the startup coroutine. The added call resolves to its original
public instance method and uses invoke-virtual; no additional Android/Java
API is introduced. The user approved these onboarding changes from v1.7.0-dev.1 for stable publication on 2026-10-28. This records user acceptance; exhaustive independent device/network coverage is not claimed.


The corrected sources passed the root's capped `buildAndroid` build after the
v1.6.0 release merge. The complete 40-test Python suite passed. For this app,
the original, **Skip consent screens** alone (with its normal dependencies),
and all five controls combined passed the root's serialized Desktop FULL,
signature and independent redecoding/semantic verification matrix. The
first-launch verifier ran in each selection, including its real label 3 resume
case. The remaining four controls retain their previously validated product
code; the new setup hook is absent unless Skip consent screens is selected.
