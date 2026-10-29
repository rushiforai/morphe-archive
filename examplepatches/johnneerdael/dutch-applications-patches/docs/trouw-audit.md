# Trouw 7.53.1 audit

Target: `be.persgroep.android.news.mobiletr`, version 7.53.1 / 23136515,
minSDK 32, APKS. Only the two observed publisher signing certificates are
accepted. Every mutating patch directly depends on the shared original-input
guard. Singleton method fingerprints use strict cardinality.

The user confirmed the app is fully functional on the USB-connected phone and
approved a stable release through a pull request on 2026-10-27. This is user
acceptance of the tested build; the technical follow-ups below remain recorded.

## Controls and static evidence

The five controls are `Hide ads`, `Disable tracking`, `Skip consent screens`,
`Hide Premium banner` and `Read full articles`. Trouw has eight different DEX
files from the released Volkskrant input. Reuse is based on independent matching
of 79 target method instruction bodies, 14 retained method digests, both article
result coroutines and the resource inventory. The released Volkskrant package
and verifier remain unchanged.

- Ads complete the SDK listener with `Failure.Disabled` once, return a null ad
  view, and resume IMA content. Exact advertisement body DTOs and overview
  components are removed. Exact advertorial style/header markers reject the
  entire sponsored article result through the app's existing domain error.
  Both ordinary completed branches and the moment result are guarded; editorial,
  suspended and existing error objects retain identity.
- Tracking suppresses inventoried app/SDK telemetry ingress, analytics uploads,
  identifiers and web instrumentation. The real Catsure queue-state and
  heartbeat requests and their coroutines remain unchanged. They upload actual
  device, queue and playback state; functional server effects are unclassified,
  so complete tracking suppression is not claimed. The heartbeat response models
  active-client/device and playback state, which requires further contract
  comparison. This finding does not establish an observed playback regression.
  Contentsquare readiness still completes; ID fetch returns a
  completed Job and `Result<String>`; Piano's original callback converts
  EventRecord to EventStatus. Eleven Comscore native sinks become implemented
  methods with the native flag removed. Eight optional startup entries and seven
  advertising/referrer/AdServices permissions are removed. The callback-free
  FIAM suppression adapter becomes a no-op when its four registrars are removed;
  the startup coroutine is preserved except for the separately audited first-launch completion hook below.
- Automatic consent returns completed Unit. Manual privacy resurfacing remains
  unchanged; consent skipping depends on tracking suppression.
- Full article rendering uses the actual successful empty marketing-template
  result with `isBlocker=false`. Empty templates prevent both blocked-content
  and inline whole-body replacement. Premium labels return their existing None
  singleton. No account, purchase or receipt state is forged.
- The onboarding login mapper separately constructs four benefit rows. Its
  final `unlimitedarticles` / `ic_benefits_unlimited_articles` row is promotional.
  Premium suppression changes only the single typed array from registers
  `{v0,v1,v2,v3}` to `{v0,v1,v2}`. Resource/constructor tracing verifies the three
  functional rows remain ordered, and normalized whole-method plus login/skip
  method digests verify the rest of the mapper is preserved. The startup
  coroutine, login navigation, buttons and acknowledgements remain intact.
- Existing WebView clients gain both request overloads for evidenced shared
  advertising/collector hosts. Matching uses URI hosts and exact/subdomain
  boundaries. Allowed requests delegate to the real superclass. Navigation,
  loading/errors, the account-removal bridge and embed resizing retain original
  digests. No Trouw website selectors or newsletter rules are invented; the
  Volkskrant-specific first-party collector hosts and DOM cleanup are omitted.

## Live API evidence

On 2026-10-27, read-only requests to the shipped `mobile2.trouw.nl` API used
only the app's anonymous Basic fallback, read privately from shipped resources.
TLS verification used the system CA store (`SSL_CERT_FILE=/etc/ssl/cert.pem`);
the default local Python CA installation initially failed certificate discovery.
Neither account credentials nor raw article text are stored here.

| Short ID | Live premium | Paragraphs | Final paragraph words | Final paragraph SHA-256 |
| --- | --- | --- | --- | --- |
| `5f40769` | true | 12 | 54 | `f39434a2b140163d8ba292bec2f8ee980803417e50e04c628be708e80d86a7e6` |
| `16dbb92` | true | 22 | 57 | `08505c94a8d5126e2b9950eec02bed3d22dc9e602facd7a6257fc4c227df915c` |

`tests/verify_trouw.py --probe-public` reproduces live premium flags, counts and
final-paragraph hashes without printing authorization or article contents.
The received premium bodies are substantial and include their final paragraphs.
The user subsequently confirmed functional phone rendering and approved release.
Public-website text parity remains a separate research item.

## Verification and remaining acceptance

Before production edits, the app-specific verifier passed the original with no
selections and failed each of the five selected controls on the original. The
subscriber-row change had its own failing assertion before implementation.
Python syntax checks, the 16-test Python suite and the capped offline Kotlin
`buildAndroid` build pass. Each named control and all controls combined passed
Desktop FULL application, signing, independent signature checks and decoded
verification. After review preserved Catsure state coordination, the three affected selections
(`Disable tracking`, `Skip consent screens`, and all controls) were rebuilt and
revalidated with original queue and heartbeat method/coroutine digests required. Reports
are under `build/validation/trouw/`. The verifier audits emitted call kinds
against actual DEX class flags and the Android SDK, not a simulated hierarchy.

The user reported functional phone acceptance on 2026-10-27. That report does
not enumerate every scenario. Further scenario coverage includes clean/existing
cold startup, first-run onboarding,
manual login/privacy, account removal, push, ordinary/classic/moment/liveblog
articles through their final paragraphs, ad space, video/audio and queue
continuity, charts/social consent, and background-network behavior. Catsure
queue sync and heartbeat retain device ID, ordered up-next media state, clip URN,
playback position and playing/paused/stopped state uploads pending evidence about
functional server-side feature semantics. Their original method and coroutine
digests are asserted for every selection. Further privacy classification and a
controlled functional/server contract comparison remain open; local response
discard does not establish absence of server-state coordination. Unknown website
newsletter/marketing selectors, first-party collector hosts, sponsored feed-card
markers and server-inserted media ads remain discovery follow-ups. This increment
does not establish that every promotional surface is gone or every premium
publication is available.


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
