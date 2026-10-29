# Parool 7.53.1 patch audit

Target: `be.persgroep.android.news.mobilepa`, version **7.53.1 / 23136515**,
minSdk32, original Play split APKS. The shared original-input guard enforces
package/version/code/minSdk and either independently observed publisher signer:
`80d91716e88298892a4d34076ae3562ac9e2212e08048d09dbfeca2c26a6ed92` or
`34a28a4862a6204d7c70ebacc7105fae14ac880486c5d2d56a2b9c17907b27c4`.
Every mutating patch/dependency consumes that guard. Exact method descriptors
require singleton matches; resource inventories and the game edit have counted
structural guards. The source APKS SHA256 is
`ff31b90e16c611b429118b3d90c4cf7ae9723cd4fb44fce95f7b0731a286ee7d`.

On 2026-10-28, the user confirmed device validation and approved stable promotion.
The release workflow records the published bundle version in the generated README catalog.
The [research report](research/2026-10-28/parool.md) records original evidence;
its historical “implementation pending” statements describe that earlier phase.

## Controls and reuse boundary

Five named controls: Hide ads; Disable tracking; Skip consent screens; Hide
Premium banner; Read full articles. Tracking includes ads; consent includes both.
The approved ten app source packages are unchanged. Independent comparison
matched 77 shared Trouw candidate instruction bodies and 19 retained contracts.
Parool's original onboarding snapshot independently pins 270 retained methods,
including its two differing UI method digests. Reuse is scoped to this version.

Ads disable the four banner technologies, complete real Disabled callbacks,
return the supported nullable ad view and resume publisher IMA content. Typed
article/feed filters remove explicit advertising and reject whole advertorial
results while preserving surviving editorial object identity/order, ordinary
errors and coroutine suspension. Web rules use parsed exact/subdomain hosts;
allowed requests delegate to their actual superclass. Navigation, embeds,
resize/error/loading and account-removal bridges remain original.

Tracking stops the inventoried native/SDK event, queue/upload, identifier,
diagnostic and web instrumentation paths. Contentsquare readiness completes;
Piano callbacks retain EventRecord-to-EventStatus mapping; identifier fetch
returns the expected completed Job and Result<String>. Eleven callback-free
Comscore native sinks become implemented no-ops with the native flag removed.
The FIAM adapter is stopped when its four optional registrars are removed,
preserving the surrounding startup coroutine. Functional Firebase installation,
messaging and RemoteConfig components remain.

Consent completion records no acceptance/rejection. Native first-launch
completion reaches Home before creating the login/welcome/notification graph.
Missing push subscriptions already map to empty/false, so the skipped setup
does not preload/subscribe defaults or request notification permission. Existing
accounts/subscriptions and manual privacy/login/notification controls remain.
The verifier exercises fresh/saved completion, deferred scheduling and the real
audio-dismiss coroutine resume branch.

The marketing resolver returns its supported
`ResultOf.Success(MarketingTemplateResolveResult(false, emptyList()))`.
The boolean is **hasReducedContent**; it is not a subscription flag. The original
mapper turns empty templates into None, avoiding both blocking and inline
replacement of supplied article bodies. Premium labels and the single
subscriber-benefit row are separately removed. Account/purchase/consent state
is not fabricated; newspapers/PDF access retains genuine server results.

## Additional Parool coverage

- Both AmaliaInternalTracker track overloads stop optional audio interaction
  telemetry to `tracker.prd.dpge.be/track`. Real follow/save and playback remain.
  This is UI/player-event collection, not microphone recording.
- Audio/video/game monitoring adapters and the Timber Crashlytics forwarder
  stop exception/custom-key/log forwarding at callback-free void boundaries.
- AdvertisementIdProvider initialization/private fetch are stopped. Its ad-ID
  interceptor calls the real `chain.request()` and `chain.proceed(request)` and
  returns the actual response, omitting only its GAID header addition. Distinct
  credentialed-content `Build.ID` headers, OIDC/AppSet-ID account/privacy
  contracts, authentication, TLS, errors and cancellation remain functional.
- Actual Parool config names `phx.bmtrcs.com`, not `brandmetrics.com`.
  The web policy covers `bmtrcs.com` with exact/subdomain matching and spoof-host
  negatives, alongside native ad suppression.
- The independent game IMA constructor retains initialized StateFlow/listeners
  and replaces only its final requestAds call with original reportAdError.
  Original state consumers map Error to Generic, then preroll completion/Playing
  or **RewardRejected**, never a fabricated watched-ad/reward success. Five
  independent original consumer hashes pin this continuation, and the constructor
  hash is normalized only at the owned request replacement. IMA initialization
  can still occur before this boundary; complete absence of SDK network traffic
  requires a device capture.

## Tracking destinations and residual data

The [documented destination register](TRACKING_DESTINATIONS.md) records the destination evidence, and the [app guide](site/en/apps/parool.md) explains the
purpose/data and actual patch effect. Evidence includes the real Parool ad JSON,
configured Gemius endpoint, SDK environment providers, invoked sender methods,
Comscore native strings and scoped web policy. Source/configured endpoints are
not represented as a capture proving every host received a request.

Functional Catsure queue and heartbeat remain unchanged. They carry actual
device ID, ordered queue/media URNs, playback position and playing/paused/stopped
state. Their server effects have not been established as optional analytics;
response discard alone is insufficient reason to remove state coordination.
Article/account/paper APIs, real auth/consent, Firebase installation/configuration
and user-selected push still exchange service metadata and identifiers.
Unknown remote collectors and other-brand/nonproduction bundled endpoints are
not asserted to be live Parool traffic.

## Received premium body evidence

Anonymous read-only probes on 2026-10-28 used the shipped fallback privately,
with Parool `hp` and Android7.53.1 headers. No user account, subscription claim,
credential borrowing or raw article body is stored in Git.

| Short ID | Premium | Paragraphs | Final paragraph words | Final paragraph SHA256 |
| --- | --- | ---: | ---: | --- |
| ff285e8 | true | 10 | 66 | a8829301913ddfbd69586eb5633d314be0d119f8b8a3c2d7701e22ab09b23140 |
| cd1b534 | true | 5 plus Q&A | 22 | 7f3b8cac331cb7a1700388c215f4ad644f75d477b8bbccb53f7a457bfa8689e2 |

The verifier's `--probe-public` mode prints flags/counts/hashes only. These
samples establish received bodies, not universal or permanent backend access.

## Verification and phone acceptance

The original verifier passed with no controls and failed each selected control
before implementation. The extra game/Amalia assertions also failed on the
original and the earlier reused-cohort build before the additions. The complete
implementation passes the capped JDK21 offline buildAndroid build and 47 Python
tests. The complete five-individual-plus-combined matrix passed Desktop FULL,
patch/report checks, signing, apksigner and independent decoded verification.
The final combined check is `build/parool-private-fixed-all-final.log`; the five
fresh single-selection results are in
`build/parool-private-fix-remaining-validation.log` and per-selection logs under
`build/validation/parool/`. The unchanged original decode was reused for the
final five singles only after checking the exact base SHA256 and rerunning the
complete original-negative verifier.

Fresh review identified the private game error callback's required invoke-direct
and an AD README audio-coverage overstatement. The callback now has a private
instance guard and direct invocation; new access fixtures first failed two
rejections, then all four passed. The prior emitted artifact failed the corrected
expectation; the rebuilt output passes it. AD disclosure now explicitly records
its independent audio sender as uncovered, without changing approved AD code.
The verifier also compares real register slots (p0/v0 alias in a zero-local
method) and actual DEX boolean values1/0. These representation checks failed
against the actual output before correction and pass on the same artifact.

Generated metadata contains all prior entries unchanged plus exactly five
Parool controls (57 controls total on this dev baseline). All ten approved app
source packages and compiled class/extension payloads remain unchanged. The
metadata-only description adds Parool; current MPP payload hashes bind the
artifacts used for these checks. Generated catalog/manifests remain owned by
the existing release workflow.

APKS inputs are staged to the SSD-backed APFS work volume. Desktop extracts
beside its input; ExFAT otherwise creates AppleDouble `._*.apk` metadata that its
merger can mistake for APKs. Regression tests cover byte-identical staging,
known metadata exclusion and refusing to overwrite the original. The original
APKS remains unchanged. Retained decodes stay on the SSD for review.

The user's device validation and stable approval supersede the earlier pending
phone-acceptance status. The report does not enumerate every scenario, so it does
not independently establish clean and existing-account startup, every manual
privacy/login/notification choice, all article/error/offline and media/game
variations, actual background traffic, or genuine newspaper/PDF access or denial.
No additional device installation or reset was performed during this promotion.
