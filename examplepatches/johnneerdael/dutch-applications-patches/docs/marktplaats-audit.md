# Marktplaats 16.17.0 implementation audit

Marktplaats is published in stable **v1.16.0**. On 29 October 2026, the user
confirmed that the patched app works. The stable release contains Hide ads,
Disable tracking and the opt-in Disable ThreatMetrix (expert) control. This
development branch adds startup consent removal, microG-Re Google sign-in and
the requested normal/default-on ThreatMetrix control; those follow-ups are not
in stable v1.16.0. [Domains, data and remaining services](privacy/marktplaats/README.md).

## Original input

- Package `nl.marktplaats.android`, version 16.17.0, code 633462, minimum API 32.
- Original Play APKS SHA-256: `367ff2e710f0fa0ee4a37067326c26633b72eb1dbcae4fa707959ac996a039d1`.
- Base APK SHA-256: `341cdd423d7ba8a11b5aed3f4627c33947e0588e554cad7d4feb5d2abe7e4794`.
- Publisher certificate SHA-256: `742dc275b25928621a8fbdb4362876825c8aec6a4afdbd04d0b8d72b9ca22052`.
  The independent Google source stamp is not the publisher certificate.

All public controls depend directly on the original-input guard. Exact method
selection checks descriptor, access flags, registers and instruction count before
editing. All seven original native libraries remain unchanged.

## Controls and implementation

Hide ads and Disable tracking default on; tracking includes Hide ads. Disable
ThreatMetrix defaults on and is independent.

**Hide ads** filters exact SRP_HEADER_NATIVE_AD, SRP_LIST_NATIVE_AD and
DISPLAY_BANNER types from search and VIP. Constructor storage and cached
getter/component/converter reads use the same filter. Genuine DEFAULT/ICAS and
promoted seller inventory, null/unknown rows, metadata, pagination and row identity
remain. Only typed ad branches of shared dispatchers change.

Google/OpenWrap startup and factory/cache/native fetch paths stop. VIP uses its
real failure callback exactly once; nullable/no-content results use existing empty
UI paths. Targeting and sponsored flows emit native ResourceStatus.ERROR/null and
finish. Coroutine result validation, cancellation, resumed errors, ad disposal and
functional category-cache/WebView work remain. Advertising viewability/timers,
observer admission, impression/click and banner measurement leaves stop.

**Disable tracking** stops the app event/screen/property hub and cache admission,
GAID lookup/jobs/cache, Datadog bootstrap/user observers, both independent UserZoom
entry paths and Adjust/Criteo activation. Only the actual advertising-ID
permissions are removed. Adjust's legacy referrer receiver and direct SDK
init/resume/event/referrer entry points stop even with a restored handler. Native
privacy code remains; no delivered vendor deletion request is claimed.

Facebook activation/event/timer/queue/flush and crash/error/ANR report admission,
file-write/read and upload paths stop. Merged dispatchers use their native false
branches; unrelated interfaces, CrashShield state and general Graph/auth remain.
Braze uses its native disableSdk state; persisted disabled/offline predicates and
later enable attempts stay disabled. Init/user/consent/content-card/lifecycle
admissions stop. Marketing push stops; independent first-party FCM remains. The exact app FCM
processor consumes recognized Braze messages using the shipped discriminator
without forwarding them. Other messages retain the original first-party dispatcher.
Direct Braze receiver re-entry returns after native Context/Intent validation,
before synchronous dispatch or background coroutine admission. Existing push
registrations therefore cannot bypass disabled SDK startup.

Firebase Analytics/Performance are permanently disabled. App crash observers and
breadcrumbs/nonfatal entries stop; Crashlytics runtime/persisted enable/settings,
Sessions local/fresh settings and FCM measurement export remain disabled after
later enable attempts. Shared Firebase init, Remote Config, Installations,
AppCheck and functional token/message APIs retain their original graphs.

CCT filters eight exact names after auto client metrics are appended:
FIREBASE_CRASHLYTICS_REPORT, FIREBASE_APPQUALITY_SESSION, FCM_CLIENT_EVENT_LOGGING,
GDT_CLIENT_METRICS, FIREPERF, FIREPERF_AUTOPUSH, FIREPERF_INTERNAL_LOW and
FIREPERF_INTERNAL_HIGH. Both incoming branches share the replaced filter anchor.
Unknown/case-variant/null source names, object order/context/extras and genuine
HTTP/retry/SQL accounting remain. Entirely filtered batches use native
FATAL_ERROR/-1 and real DELETE: intentional privacy discard, not fake send success.

Adyen uses its native INITIAL analytics level. Optional event admission, stored
ALL-state events, timers and event upload stop. The timer retains native job
cancellation and clears its field on both branches. **Initial checkout setup and
the genuine attempt-ID exchange remain** because payment code consumes that ID.
Success uses the SDK/service-provided ID; null/error retains native unavailable
state. No payment/setup response is fabricated.

**Disable ThreatMetrix** returns before TMX singleton initialization and
forces the wrapper's native empty-header predicate. Fresh/stale initialized states
and profile ages cannot start blocking, refresh or profiling work. Ordinary
tracking keeps the original security graph. URL/method/auth/body objects and null
validation remain; the server may reject requests missing these security headers.

Phone feedback on 29 October reported normal usage with ThreatMetrix disabled.
The user requested a normal control, enabled by default, which supersedes the
initial release's expert label and opt-in default. Google sign-in was reported to
fail; the development microG-Re routing implementation is described below. These reports do not
establish that all account, posting or payment flows have been tested.

**Skip consent screens** defaults on and includes Disable tracking/Hide ads.
Startup `onUIReady` requests Sourcepoint's genuine GDPR `rejectAll` before the app
can call `showView`, focus or accessibility setup. A private per-client guard
prevents duplicate requests. The original `onUIFinished` path removes the hidden
view and signals UI closure. This signal does not assert that the asynchronous
rejection was received: original SDK consent-ready persistence, suspension and
error handling remain. A manually opened privacy manager retains the original
display path. A restored decision that does not create a startup view follows the
original consent path; the tracking dependency still blocks optional integrations.

## Initial privacy-control verification

- Actual production patcher SDK: 32 original-input/selector assertions pass with
  real disjoint publisher certificates. Original accepted; wrong package,
  version/code/minSdk and missing/untrusted/mixed signer rejected without manifest
  mutation. Missing/ambiguous methods and wrong flags/register/count reject.
- 900 original method contracts plus manifest and seven native-library hashes;
  exact restoration outside owned edits. Native fixtures cover mixed/cached/null
  slots, all-ad/empty lists, callback identity/count, failures/cancellation,
  coroutine completion and native UI disposal, restored SDK state and repeated
  event admission, consent/login re-enable, CCT metrics on/off and real deletion,
  Adyen cancellation/setup/error and ThreatMetrix init/wait/refresh/header errors.
  Push regression executes the real FCM dispatcher/classifier, checks ordinary
  and unknown messages reach the unchanged functional handler, retains token
  registration and tests both direct/background Braze receiver admissions and null
  validation. Rendering/Android boundaries remain explicit.
- FULL original, Hide ads, Disable tracking, ThreatMetrix-only and combined modes pass
  apply reports, rebuild/signature checks and decoded native effects. SDK/network,
  clock, coroutine and storage boundaries are explicit; these fixtures do not
  execute a full Android UI or real payment/backend transaction.
- Python134, Node6, actual SDK32 and strict bilingual documentation/local-link
  checks pass (55 paired pages, 111 rendered HTML files). Release provenance is
  verified separately at delivery. Prior79 metadata/defaults
  and200 individual class/extension/native payloads are unchanged against downloaded
  v1.14.0-dev.1; the aggregate DEX is rebuilt with the new app classes.

For the initial development release, no device installation, account action, live
publisher probe, transaction or data deletion was performed. The later anonymous
search investigation is documented below. Native/encrypted behavior and signature-sensitive
services require phone testing. Source evidence does not prove captured transfers
or complete runtime absence of tracking.

## Paid-placement follow-up, 29 October 2026

The requested extension is a separate expert control, disabled by default. Its
acceptance criterion is to retain sellers' listings while removing their paid
placement advantage. Existing Hide ads behavior remains unchanged. This control
has **not been implemented or released**; restoring ordinary placement remains
unproven.

Static evidence identifies `LrpItemsRequest`, `LrpSearchRequest` and the shipped
POST route `https://app.marktplaats.nl/app/lrp/v2/items/fetch`. The app supports
DATE sorting and numbered pages. `AdMetaData` distinguishes `sortDateTime` from
`startDateTime`; the search UI reads the former, while the detail UI can read the
latter. DEFAULT is a separate sort mode and must not be described as strict
posting-date order.

Four anonymous read-only search requests returned HTTP 200: two pages of a
DATE/DESCENDING search, a request advertising support for only `defaultListing`,
and a query for one returned promoted listing's title. No account, session,
advertising ID, postcode, coordinates or user segments were supplied. These are
sampled backend responses, not captured phone traffic.

- The first page contained 30 `defaultListing` rows and five
  `icasTopBlockListing` rows. All 35 supplied `sortDateTime`; none supplied
  `startDateTime`. Their sort timestamps clustered around the response time, so
  these samples do not establish usable original posting dates.
- Requesting only `defaultListing` returned 35 rows. The same five promoted
  listings retained positions 0–4 and were relabeled `defaultListing`. Excluding
  a supported row type therefore did not remove its placement advantage in this
  sample.
- The title query returned the target listing only as an
  `icasTopBlockListing`, with no ordinary duplicate. Dropping promoted rows could
  therefore remove sale content from a result set.
- The sampled ordinary and promoted rows used different identifier forms
  (`m` and `a` respectively). This does not establish how every paid bump on an
  ordinary seller listing behaves. Source models also contain paid-feature flags
  on ordinary listings, so ICAS rows alone are an incomplete definition of bumps.

These observations rule out claiming success from changing row labels, filtering
promoted rows, or sorting a single page. A future expert patch needs evidence for
ordinary ordering across pagination and all affected paid-placement types. Raw
responses and seller/tracking fields remain outside the repository and release
bundle. No account, payment or listing mutation was performed.


## Google authentication follow-up (development)

The shipped Google sign-in coroutine uses AndroidX Credential Manager. Android34+
first selects the system provider. The app's Play Services provider then uses the
new identitycredentials service; changing the older q6j sign-in action would miss
this path. The shared Lnsk configuration has no package field: its Google package
literal is validation, while Lfdj builds the actual bind intent.

The new independent/default-on control recognizes exactly one Google ID or
sign-in option and constructs the shipped app provider only if an exported,
enabled microG-Re credential service resolves. A private instance flag limits
its availability override. Other factory requests/provider instances keep the
original behavior. The exact identitycredentials action binds to microG-Re
before Chimera lookup; all other actions retain their original body. Other
direct callers of the same credential service follow that service route too.

The manifest adds one package query and Morphe's three package-identity metadata
values, including original publisher SHA1 e650094b1bcb91997173c1261fd0136ab7592984.
Package name, OAuth options/client ID, native token parsing and result/error/
cancellation code remain. No Google credentials or backend success are invented.
The reference MicroG-RE revision is a5be29c8ea3ca993839abef051e37bf8d25a7456;
its IdentityCredentialApiService and chooser implement the matching API and
Google ID options. A release lacking that service falls through to original
behavior. This is source evidence and bounded execution, not device login.

FULL original APKS patch/rebuild/sign/decode passed for auth-only and all five
controls. Both, the untouched original, and the retained auth-unselected privacy
APK passed907 original method graphs/ABIs plus routing/availability behavior.
Checks cover API32/33/34/36 factory branches, exact single Google options,
unknown/mixed/empty options, missing/disabled/unexported services, disabled apps,
stale provider availability, and exact service-action boundaries. Token parsing
(108 instructions) and provider callbacks/cancellation (155 instructions) are
graph-pinned and unchanged. These checks execute bounded paths with explicit
Android/package/binder boundaries; they do not contact Google or authenticate.
Actual SDK original-input/dependency checks pass39 assertions. Full144 tests and
strict bilingual documentation/link checks pass. Fresh final review and dev
publication remain part of the broader TVgids delivery; phone acceptance is open.

## Full-control dev release candidate

The v1.17.0-dev.2 candidate includes all five controls, each enabled by default:
Hide ads, Disable tracking, Disable ThreatMetrix, Skip consent screens and
Google sign-in via microG-Re. The expert label and opt-in default are removed
from this development candidate, as requested after the user's normal-use report.

The complete original Play APKS set was freshly patched with all five controls.
The real FULL pipeline passed patching, rebuilding, signing and signature
verification. An independent decode passed 907 original-method/ABI contracts,
Google provider/service routing and fallback checks, and consent startup/manual/
duplicate/null/closure checks. The untouched original passed the corresponding
baseline. There were no failed patches. These build checks do not establish a
successful device Google login, payment or exhaustive account acceptance.


## Approved five-control release and Google protocol correction, 29 October 2026

Stable v1.18.0 promotes all five controls, enabled by default. ThreatMetrix is a
normal control as requested after the user reported normal use without profiling.
The paid-placement experiment described above remains unimplemented.

The first microG-Re route reached its service but used Google's unmodified ID
credential type. Installed microG-Re 7.2.1 expects the `app.revanced` Google ID
namespace. Its chooser returns legacy Bundle responses; on Android 16 the app's
AndroidX receiver expected framework Parcelables and rejected those replies.
The corrected route translates only marked-provider Google options and Google ID
Bundle keys, retains the original request and all values, and normalizes replies
back for the app parser. A string profile-photo URI becomes a Uri. Framework
Parcelable replies and unmarked providers retain their existing paths. Errors,
cancellation and malformed replies use real callbacks; no token or login is forged.
An explicit typed null fixes an ART verifier rejection in the private test build.

FULL patch/rebuild/sign/decode checks pass 912 original method/ABI contracts,
including real provider dispatch, receiver-to-Runnable-to-callback paths across
API 32/33/34/36. A user-authorized fresh installation allowed live tracing under
the app UID. Two user-triggered Google requests reached microG-Re with translated
types and keys; both returned RESULT_OK Bundles and selected the retained legacy
parser. The app displayed its account-protection phone-verification screen.
The observer did not capture the final callback interface directly, so that hook
is not claimed as evidence. No account, token, nonce, phone or OTP values were
recorded, selected or entered by the agent.

After tracing, only task-owned server/cache files and port forwards were removed.
The normal non-debuggable APK was installed with `-r`, preserving the fresh data.
The pulled-back APK matched the tested file; cold startup remained alive in the
home activity after 12 seconds with no AndroidRuntime/VerifyError. Its six DEX
files and seven native libraries match the diagnostic APK. The user approved
release. This verifies the protocol correction and normal startup; it does not
assert completion of every backend account challenge, payment or messaging flow.


Published [v1.18.0](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.18.0)
contains the tested code. Its downloaded bundle SHA-256 is
`9a89923c7136953466856602dd17f165da5b6fa7779519ce7ca29d51ff41c8b6`.
Every archive entry except the manifest build timestamp matches the local tested
bundle, including aggregate DEX, both extensions and MapLibre. The other 87
stable control records and 219 non-Marktplaats class payloads remain unchanged.
The publication workflow failed afterwards during the main-to-dev merge; that
merge was resolved separately. Its provenance-attestation step did not run.
