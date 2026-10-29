# RTL Nieuws 12.7.1 implementation audit

The maintainer approved stable publication on 28 October 2026 after v1.10.0-dev.4.
The pending-acceptance notes in the development sections below describe those
earlier increments. The recorded runtime and network limits still apply.

Target `nl.rtl.rtlnieuws`, **12.7.1 / 1558**, minSdk32 (Android 12L), Play APKS.
Original-input checks bind package, version, code, SDK and publisher signers
`80d91716e88298892a4d34076ae3562ac9e2212e08048d09dbfeca2c26a6ed92` and
`862a0a19d90fe0c678bde313d7a8606e3a97a0c209ab0b56626eb8eaf18571f9`.
APKS SHA256 `36e10532e3c20ae12d87f4e58d8aefa9e92bf3a7456feffe78187e4f7a33aa08`;
base SHA256 `85aacb2b5785c338a9801a57fe71f57f41d47bae1ada56ef19fee9b8520299e4`.

The [research report](research/2026-10-28/rtl-nieuws.md) records original source
findings. Historical implementation-pending statements refer to that phase.
The [README destination table](privacy/rtl-nieuws/README.md) distinguishes
traced/configured/SDK destinations from captured traffic. No decrypted runtime
capture or phone acceptance is claimed for this increment.

## Controls and native behavior

Three controls: Hide ads, Disable tracking (includes ads), Skip consent screens
(includes both). Every mutating dependency consumes the original-input guard.
Exact method/header/register/count and opcode anchors guard version-specific
changes. Genuine JWT/account, ad-free entitlement, billing acknowledgement,
consent and purchase state retain their original implementations.

The common DPG placement renderer completes its actual callback with the native
supported ad-free failure. Its original consumers publish height zero and
completion, remove template children, hide the view and compose zero space.
The independent AdItemModel and branded GAM composables stop before remembered
250-height/loading state or Compose groups are created.

Regular video uses the original AdFree branch and empty AdvertisingConfig.
Content token/play/metadata, native suspended/resumed result publication and
DRM remain functional. Vertical loading was already ad-free. Legacy VMAP uses
the original nullable return; TFK's two no-ad consumers receive a null ad tag.
The shipped legacy TFK bytecode references an absent two-argument Source
overload. Its runtime reachability is unresolved; no legacy playback guarantee
is inferred from the patch applying. Server-side ad insertion and remote embeds
are not proven removed.

## Collection and identity

App fan-out and startup/re-enable boundaries cover the inspected publisher,
Snowplow/DPG/NMO, SmartOcto, Firebase analytics/crash/performance/session and
automatic Usabilla paths. NMO/FocalMeter has a separate direct sender, which is
gated independently. Actual SDK Unit, empty map/String, boxed Boolean and
completed nullable Task values preserve the callers' types. Collection setters
are forced false before their retained SDK bodies run.

All three VideoAnalyticsConfig getters return their real Disabled singleton.
The native factory consequently builds an empty MultiSessionTrackerFactory and
SessionTrackerCollection. Separate SmartOcto senders are gated. Bitmovin's
player/source analytics hooks return the identical genuine Player/Source;
there is no invented AnalyticsSourceConfig.Disabled class. Optional analytics
label loading returns the native empty-map fallback; content metadata/token
and playback services remain separate.

Advertising/App Set/profile device IDs and external identity association are
suppressed. Advertising-ID acquisition takes the original null-emission branch,
including suspension/resumption. DMOI completes its real callback exactly once
with Lwka(Result.Failure/Throwable), preserving native failure unboxing.
Authentication and SDK/config initialization stay intact.

## Persisted telemetry and completion

CCT sending is inlined in `gcd.a`. Filtering occurs after optional client metrics
are appended, before grouping/sending. It removes exactly:

- FIREBASE_CRASHLYTICS_REPORT
- FIREBASE_APPQUALITY_SESSION
- FCM_CLIENT_EVENT_LOGGING
- GDT_CLIENT_METRICS
- FIREPERF
- FIREPERF_AUTOPUSH
- FIREPERF_INTERNAL_LOW
- FIREPERF_INTERNAL_HIGH

These four Performance names cover the inspected SDK whitelist (461, 462, 675,
676). An unchecked historic cached name can differ; unknown names are retained.
Mixed batches retain other event objects, order and extras. An entirely
filtered outgoing batch restores native FATAL_ERROR=3/wait=-1 and reaches the
original persisted-batch deletion transaction. It neither returns early with
records stuck in storage nor fabricates a delivered-success response. Retained
events keep the native HTTP/retry/status paths.

Swrve is mixed push/configuration and engagement infrastructure. Optional event,
click and impression producers stop. Its persisted queue parses each serialized
event and discards only exact `event` and `session_start` types by real storage ID
and user ID. Other, unknown and malformed records retain payload identity and
ordering. Kept records use the original batching, response, retry, disabled-user
and accepted-response deletion behavior. A native storage failure goes through
the SDK's existing log/count error handler with initialized count registers.

Google measurement's merged request Runnable handles only discriminators 1/2.
It schedules the original P9h/Lft4 completion using status zero, IOException,
null body and headers. Other cases retain their original code and switch routes.
Snowplow's actual callable returns its native failure -1. Native Future/error,
timeout/interruption handling creates failed RequestResults with original event
IDs; requests are not marked delivered or left awaiting a missing callback.

## Privacy, retained services and limits

Only automatic privacy refresh is skipped. It publishes the original busy=false
and ready=true states without recording acceptance/rejection or replacing the
purpose/vendor map. Explicit manual preferences launch the original coroutine
with the genuine activity and manual flag. Actual manual SDK/UI behavior still
requires device testing.

Ten manifest collection flags and five optional advertising permissions are
changed. All 67 initialized manifest components and 50 non-Dexopt bundled assets
are independently hash-pinned. SDK initialization is retained where mixed
functional consumers depend on it. Assets include player/ad/OMID code and Adobe
configuration; retaining a bundled file does not establish its execution.
The inspected measurement code reflectively probes TagManagerService; an active
service or container was not established. Remote WebView/iframe behavior remains
a separate boundary.

Push registration, Swrve user/device/config properties, manual feedback,
Firebase installation/configuration, auth, genuine payment sync, licensing/DRM
and initialized SDK configuration can still transmit service identifiers and
IP information. Cast/Billing diagnostics, unknown transport names and remote
scripts are outside a complete suppression claim. The patches do not make RTL
anonymous or promise zero network traffic.

## Verification

The independent verifier binds the actual APK and checks 351 original/retained
method contracts, complete merged-switch routing, call kinds/access, registers,
all owned changes, manifest flags/components and asset hashes. Bounded execution
uses actual emitted instructions and native constructors/callback graphs;
Android rendering, scheduling, JSON/collections and external storage/network
boundaries use explicit fixtures. It is not an Android runtime emulator.

The suite has 96 regression tests, including observed RED→GREEN reference,
switch, typed exception, monitor, wide-value and edit-ownership cases. Original
and selected private builds pass these checks. Original plus all four individual/combined selections pass fresh FULL,
signature and decoded checks. Independent review found no runtime defect; a
misleading README research-only grouping was corrected. The final About-only
rebuild preserves all 158 tested code/extension payloads byte-for-byte. Actual
release/attestation and downloaded asset verification are recorded at
publication. Phone acceptance remains pending until the user tests the released
patch bundle.


## Startup follow-up after phone feedback

The user confirmed the main app behavior but still saw the PrivacyGate cookie
screen and notification onboarding. The first release covered `kc2.d(false)`;
startup instead calls `PrivacyGateSdk.refreshConsent$default` directly in
`qq1.invokeSuspend`, discriminator 5. The follow-up redirects only fresh entry
779 to its native readiness closure 815, after the native result check. Busy
becomes false and ready true; no SDK modal, consent map or marketing preference
write occurs. Real resumed/error paths and the other 28 switch cases remain.
Manual privacy entry still calls `kc2.d(true)`.

The separate `fm7.invokeSuspend` startup navigation effect redirects instruction
3 to native Unit completion 39, also after its native result check. This covers
both initial setup and later automatic reminders. It never creates the modal,
requests notification permission or updates channel preferences. Existing manual
notification settings and genuine upgrade choices are preserved. The original
NEWS and BOULEVARD preference getters default to false when keys are absent;
there is no synthetic completion flag or forced opt-out setter.

Before implementation, bounded execution of the previous released bytecode
reproduced both automatic UI requests. Independent whole-graph contracts and
emitted-code execution cover fresh/repeated/returning startup and initial and
resumed privacy failures. Android UI and actual network behavior still need
phone confirmation for this follow-up. See `tests/rtl_startup_contracts.py` and
`tests/verify_rtl_startup.py`; earlier verification counts above describe the
initial release, not this increment.

The follow-up adds 34 whole-graph contracts (385 contracts across 381 methods in total). The actual native
preference mapper is executed for all nine missing/false/true combinations;
missing preferences remain off and existing opt-ins remain true. Default and
manual paths are pinned through exact channel keys, datastore setters, startup
synchronization and permission callbacks. Swrve's configured automatic
`notification_permission_request` event uses the existing suppressed event
entry points. Functional push registration and synchronization still run;
skipping onboarding is not a claim that no push-related network request occurs.


## Campaign and expert Swrve follow-up

Phone feedback matched bundled B&B campaign resources exactly. `ym7` constructs
its Boulevard `Ll98` model from those IDs and the campaign ID
`show_bbvolliefde_push_overlay`; its eligibility method returned true. `xm7`
selected that model, separately from the already-disabled onboarding. Hide ads
now rejects native campaign eligibility and stops the shared `n55.f` presenter
before Compose collection/render/effects. The native queue retains its genuine
None result, delay/suspend/error semantics and original preference logic.

Shared Swrve selectors return native no-message/empty-collection results; direct
presentation, message-center show, SDK campaign deeplink/embedded display and
SDK permission-CTA launchers are stopped before Activity creation. Suppressed
campaigns are never recorded as shown/handled. Existing native manual permission
and channel settings remain. SDK class/resource deletion is unnecessary: these
common gates prevent current and newly configured campaigns using the supported
12.7.1 implementation. A new APK version still requires fresh compatibility
and source checks.

The separately requested **Disable Swrve (expert)** control is default-off and
includes the standard controls. Its factory selects the shipped SwrveEmpty path
while preserving validation, monitor cleanup and global publication. A helper
owned by SwrveBaseEmpty installs the actual supplied SwrveConfig into its private
non-final configuration field, preserving SDK.getConfig type/identity. This
helper is public/static so it can reuse the existing audited helper builder;
private-field access stays inside its declaring class.

Native no-op registration/user-update/lifecycle calls produce no real SDK work.
The original empty-resource callbacks and silent identity/refresh no-ops remain;
no current app callback wait for the latter was found in the original source.
Three independently executable persisted SDK workers return native WorkManager
Failure before SDK/network work; the independent legacy push handler reports
not handled. Nine app/Swrve/fallback Firebase push components are disabled. FCM
AutoInit.isEnabled is false even for stored true choices, alongside its metadata
default. Shared Firebase Auth/Installations/configuration and generic WorkManager
are retained. Push notifications and Swrve channel synchronization are deliberately
unavailable with this expert option; local user preferences are not overwritten.

Earlier verification sections describe previous increments. This follow-up has
independent original campaign/expert graph contracts and emitted native fixtures
in `rtl_campaign_contracts.py`, `verify_rtl_campaigns.py`,
`rtl_expert_contracts.py` and `verify_rtl_expert.py`. Phone acceptance for this
follow-up remains pending until its dev build is tested.

All five individual/combined FULL APK selections rebuilt, signed and decoded
successfully. Emitted verification passes 458 method contracts, including the
normal and expert resource/configuration invariants. The Python suite passes
118 tests, the Node suite passes six, and strict bilingual documentation checks
pass for 49 page pairs. All 170 unrelated previously published code, extension
and native payloads are byte-identical; only RTL campaign/expert payloads change.
