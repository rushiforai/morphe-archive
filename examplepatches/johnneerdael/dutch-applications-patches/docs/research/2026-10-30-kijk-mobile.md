# KIJK native phone/tablet 9.8.0

Target: `nl.sbs.kijk`, version code `2026101500`, min SDK 26, target SDK 36.
Publisher SHA-256 certificate: `71fc30d57f7440ddb3c91de0594323e017b4b52de817fb0714d7842aec701afe`.
Input SHA-256: `695ec882393b98385046423da5b8d8ca8126e4a5c175e7731cb209ef43452d63`.
This is the native AppX/JWPlayer application, separate from `com.talpa.kijk` TV.

## Evidence and policies

REA package inventory: `ev_d3e3d3ccb4fb4c8dfa256a80577e410be19b746f54f6b3c76d940e50f0e1a598`.
REA class inventory: `ev_e700e49f7abd7b0631a8713e6cd13e8d1b23d331b9330e690173042db3ca0f9e`.
REA method signatures are display types; exact DEX identities, register counts and
instruction counts in `tests/kijk_mobile_contracts.json` were corroborated with
Apktool 3.0.2 full smali decoding of the pinned original.

- Full-screen `view.videoplayer.a0.g0` creates `VmapAdvertisingConfig` (REA
  `ev_903b95a9d6b48c22ef01fc8fdb519972740e4ee7d44823ecf1a5188b570e3a55`).
  Its caller checks for null before attaching advertising to `PlayerConfig`.
  Return null to take this existing no-ad branch.
- Inline `view.inline.T` separately builds VMAP from `view.inline.Y.j` (REA
  `ev_68e9ed3f37ece4701a6fe29e60dd24580a475578c48f3958b7ef41de40b06984`).
  Return null from that nullable tag getter; its existing null check skips ads.
- `tracking.e.Q` sends Firebase event bundles (REA
  `ev_0aa036c24e9bd92e579126c846879ebb4cc2f86b27ce301019c665cf599da0fb`).
  `tracking.e.x` gathers ad ID and installs Salesforce/IDFV dimensions (REA
  `ev_e3537fc797b54f1a8d5e0f1bc650b9f0d535af2827a124af4c3cd413852713c7`).
  Stop both, redact advertising-ID results, and force Firebase collection setters
  false after later consent changes. Add manifest collection-deactivation flags.
- Stop Comscore initialization and event/enable methods. Retain Salesforce push initialization and account registration, while gating its
  optional analytics subsystem, marketing producer and attribution identifiers.
- Keep typed Conviva analytics instances: app player listeners require their
  initialized fields. Suppress HTTPTask network execution, completing its original
  callback with an empty successful response (REA
  `ev_d285086e629f1ae8d89007522c2a517b89a72dfd2970f97e9ff69c1aa1fd0cf9`).
- Stop Tealium current/bulk collectors, tag-WebView dispatch and publish loading.
  Preserve the Tealium instance required by app configuration.
- Stop DataTransport alarm/job entry points and acknowledge its CCT backend with
  the SDK's typed successful response, preventing persisted upload retries (REA
  `ev_95da6014e21c4e6db98fa1e34357588db7fe80abd42d412c6d8171953b8ecc6b`).
- Replace measurement HTTP runnable execution with the original scheduler callback
  at status 204, acknowledging queued measurement without opening a connection.

Most edits prepend exact instruction contracts and retain the original method
body. Two exact optional identifier calls in Salesforce registration become NOPs;
all other registration instructions remain unchanged. Production code contains no diagnostic instrumentation or global native
callback bypass. Selection-specific full-bytecode comparison rejects any edit
outside the declared prefixes, including account, DRM, cast, and media methods.

## Validation boundary

The implementation compiles and both controls can be applied independently or
together with Morphe FULL bytecode validation. `tests/verify_kijk.py` compares all
original and emitted method graphs, including protected ranges and branch targets.
Run against separately decoded publisher and output APKs:

```sh
python3 tests/verify_kijk.py --original ORIGINAL_DIRECTORY --patched OUTPUT_DIRECTORY --ads --tracking
```

Check manifest policy with `tests/kijk_mobile_manifest.py --original ORIGINAL_XML
--patched PATCHED_XML`; decode XML with Apktool `-s --only-manifest`.
The initial combined candidate passed the full bytecode comparison (28 edits), publisher
component preservation and privacy-manifest verification. All three selection
APKs passed FULL patch validation and APK signature verification.

The baseline comparison with the original as output fails on the missing VMAP
policy, establishing the initial regression before production changes.

Runtime emulator validation is performed by the coordinating workflow. Static
observations do not establish successful content playback, DRM acquisition,
Chromecast operation, absence of every tracking request, or restoration of
persisted SDK queues. Existing SDK background tasks and push registration on a previously
initialized install require runtime observation. Conviva may internally interpret
the empty successful response as missing optional configuration; its network task
remains intercepted. No `libpairip` archive member was observed, which does not
establish runtime absence of protection. Preserve these bounds until emulator
and Frida evidence is recorded.

## Independent review: native settings and producer queues

Review identified paths that terminal network interception alone did not cover:

- Tealium initialization creates `com.tealium.library.g`, whose constructor calls
  `i(false)` when publish-settings source is absent. `i(Z)` schedules native GET,
  and `c()` schedules native HEAD on subsequent refresh. Both now return before
  changing the atomic in-flight guard or scheduling work. The initialized settings
  object and registered listeners remain available. Evidence:
  `ev_a10ea9883e8b09c25878c0b8ed95c4578fa38fc8e548b970eec8a5ba2f34faa2`,
  `ev_e7f7e43de4f4c37396a482e159cd508c2ef0abca29c3da941640185648052022`,
  `ev_c2e2798acea7e38831ee6d8574df80c58cb47755749bb8d8e650155442245ba8`.
- Public Tealium view/event routes bypass `track(Map)` and enter `e(Dispatch)`
  directly. Stop this common ingress before metadata enrichment and offline or
  consent-held queue creation. Evidence:
  `ev_2f25afd5de44b9936f4a42ce427a5b9136bafc1f834db5e0b6a900d325361a5e`.
- Salesforce helper `tracking.h.d` produces marketing events when remote flag
  `G()` is true. Stop the app's marketing producer before generic SDK
  `requestSdk` can queue these payloads across deferred initialization. Retain
  typed SDK initialization and generic push callbacks. Evidence:
  `ev_76129b53c8d7c9cdbc4f6463f5b31f1b28086c783318a5a61efc30babe7353a0`,
  `ev_44494c5e69462ec309cf586a2e7516d5206a44001b9998cb73099426ec941b38`.

All four missing policy prefixes were observed in the previous emitted APK
before the fixes; exact original register/instruction contracts were independently
corroborated against full smali. Root runtime probes must include repeated marketing
and Tealium events with configuration enabled, checking pending SDK handler and
offline/unknown-consent queue growth rather than only absence of requests.

## Runtime-discovered Adjust attribution

Stock emulator Frida observation by the coordinating workflow identified
`app.eu.adjust.com/event` at guest playback entry. This closes an earlier static
coverage gap: attribution is app-owned, rather than a JWPlayer entitlement call.
`businesslogic.manager.e.d` initializes Adjust, selects `eu.adjust.com` and
registers activity lifecycle callbacks; `g(Z)` later enables it, and `h(String)`
forwards the push token. `tracking.e.P` builds AdjustEvent and is the app's only
Adjust.trackEvent callsite. Stop initializer, re-enable, identifier and event
ingress. Preserve `manager.e.i(Uri)` direct application-link handling.

Stop `PackageHandler.addPackage` and `SdkClickHandler.sendSdkClick` before their
executor submissions to prevent attribution queue growth. Stop
`PackageHandler.sendFirstI` and `SdkClickHandler.sendNextSdkClickI` before sending
or retry/in-flight changes, covering persisted ordinary and SDK-click queues.
No network-host block or generic callback override is used.

REA evidence: `ev_3a8b555beff252e3d3793cf92c347bdcf1d411de101cfc939bf9c56bdeda83ca`
(app initialization), `ev_86053b941abfd7c75a304a5b1fab5ddeb4156c33ea7fddddeb13f702d6f8ba64`
(ordinary queue sender), `ev_a2b22f7662e15a0c95bdf6b47fc0d901db57fb192194ba846155b54747a021f1`
(SDK-click queue sender). Expanded exact contracts failed against emitted v3
before production edits, specifically at the missing Adjust initializer policy.
Root runtime acceptance must repeat guest playback and confirm attribution
initialization/event traffic and pending uploads remain suppressed.

## Preserve the functional Salesforce push module

The original `businesslogic.manager.D.o` configures a real PushModuleConfig with
notification and URL handlers; `FCMMessagingService` uses this SDK for received
messages and refreshed FCM tokens. Inbox and geofencing are already disabled in
the original. Retain `D.o` and account refresh `D.w` unchanged. Gate only
`analytics.h` initialization, control-channel restart, enablement, behavior and
PI identifier entry points; report both analytics APIs disabled, ignoring old
persisted enablement preferences. Force Analytics/PiAnalytics builder flags false.
This prevents optional analytics components/listeners/alarms from starting while
the typed SDK and push module initialize normally.

`D.k` retains profile/contact-key and PushModuleReadyListener registration. Replace
only its optional `profile_idfv` attribute setter and advertising-ID acquisition
callback invocation with NOPs, independently checking each exact original call.
Direct account identity and push registration remain in the full-method comparison.
REA: `ev_6fa54cddef603cfcced57525ce103cd0ae046f0ea38df32335250323de61cbef`
(mixed functional initializer),
`ev_7cb398c39cae1facdfd241471b1c7cb773f1f78c7c30e1806d66c4d5db6e0a6d`
(registration identifiers),
`ev_21863be1e539fb23df8720041114f61e71df2af19f347b7ad784fd5143d577c1`
(optional analytics startup).

The previous emitted candidate failed the preservation regression because D.o
returned immediately. The corrected verifier tests selective call removal and
rejects any change to the following functional push registration invocation.
Actual notification delivery still requires runtime validation; preserved source
and typed initialization alone do not prove delivery.

Final combined candidate v5 passed FULL patch validation, APK signature checking,
and complete graph comparison of all 51 modified methods. This comparison also
proves mixed push initialization/account refresh match the original and only the
two declared optional identifier calls changed inside registration. AndroidManifest
and resources are byte-identical to the earlier independently verified privacy
manifest output. Runtime acceptance remains owned by the coordinating workflow.

## Skip consent screens and default notifications off

The separate default-on `Skip consent screens` control depends on `Disable
tracking`; ad removal remains independently selectable. The original OneTrust
success callback schedules `consent.h.L()`, the sole automatic banner entry point.
The SDK's own Reject All button calls `saveConsent("Banner - Reject All")`, which
runs `saveRejectAll`, updates real optional purpose/vendor consent, and persists
its interaction. Invoke that genuine action in the ready path, then call the
original `h.r()` completion. Do not replace the success/failure callbacks or
fabricate accepted purposes.

Apply genuine rejection on the first patched ready callback, including installs
with previously accepted choices, and record `reject_optional_v1` in the app's
`dutch_kijk_privacy` preferences. Later ready callbacks retain manual privacy
choices unless OneTrust's `shouldShowBanner` indicates renewed consent is needed.
Manual `h.J/K` preference-center entry points remain byte-for-byte unchanged.

`utils.B.a(Activity)` is called only by MainActivity startup and automatically
requests POST_NOTIFICATIONS through `d(Activity)`. Skip only that automatic entry;
retain the manual request API, manifest permission and manual settings. On a fresh
Android 33+ installation the permission therefore remains denied. Do not revoke
an existing OS permission grant.

`manager.H.s()` originally defaults `push_notification_enabled` to true.
On the first patched read, migrate the app preference to false and record
`dutch_kijk_push_choice_v1`. Return the persisted preference with false as its
fallback. The original manual setter `H.F(Z)` records an explicit choice before
its original write, so manual opt-in/out remains usable even before the first
read and across later model creation. `FCMMessagingService.v()` already checks
this app preference before rendering notifications, including Android 26-32.
Preserve the typed push SDK, account refresh and registration methods.

Evidence: `ev_09f7f50302cb6aa73ff46a9d82f13a1e19bdb4c4de8c6b46bc67d19120344f4b`
(automatic consent branch),
`ev_507991bcbccd108a9210064f7b21a2b2840486219e7c0c63b581a6f22dfb6564`
(automatic notification request),
`ev_d266f90a42619bec5585d2e4723a1d0c6b27effd7dde482f33eaad8a23dcf34a`
(original enabled-by-default app preference),
`ev_4cd27cdd879c83d909c6534ec73c9518b0c9d89a4ab00713129464bac642931b`
(genuine SDK reject implementation).

Four new contracts failed against the previous emitted APK before production
edits. v6 passed FULL patch/signature checks and complete method comparisons:
55 edits for all three controls, 53 for standalone Skip consent screens including
tracking. Use `tests/verify_kijk_consent.py` with `--consent` (or the three published
`-e` selection names) for the complete graph comparison.

## Accepted publication evidence, 31 October 2026

The final three-control candidate SHA-256 is
`dd2791e0b34b73490b49b60ec02b4e270bbffe5821d7ccef421bf36a1488813c`.
The user accepted this APK after a clean physical-phone installation and explicitly
approved publication to main. The user also confirmed the earlier ad-free playback
on the phone. The coordinating workflow observed guest VOD playback, real media
requests and nullable ad configuration, and checked genuine OneTrust purpose and
vendor refusal bits. Seventeen actual-APK ART fixture groups passed on Android 16
after preparing the fixture main Looper; the retained `tests/run_kijk_mobile.py`
checks typed callbacks, real SDK task/monitor paths and queue gates. These are
isolated fixtures, not additional playback or notification-delivery tests.

No further device or emulator checks were performed after the user's explicit
stop instruction. The experimental standalone onboarding harness is not part of
this publication and no ten-case onboarding ART success is claimed. Manual
notification delivery, all Cast/live cases, Android 26 runtime behavior, every ABI
and complete network silence remain unverified. The canonical catalogue label is
`KIJK Android`, with MOBILE form factor and `nl.sbs.kijk`; existing Android TV
`com.talpa.kijk` policies and compatibility remain unchanged.


The isolated main-publication build contains the same four functional KIJK policy
classes as the approved bundle, byte for byte; only the Compatibility class has
the intentional catalogue name `KIJK Android`. Reapplying that bundle in FULL mode
produced all eight DEX files, AndroidManifest.xml and resources.arsc byte-identical
to the phone-approved v6 APK. The publisher's packaged resource, asset and native
library payloads also pass the original-input comparison. This is host verification
of the delivered code, without repeating stopped device checks.
