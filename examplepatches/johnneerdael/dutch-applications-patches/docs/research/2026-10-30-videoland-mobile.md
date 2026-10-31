# Videoland Android mobile controls — 2026-10-30

## Target and boundaries

Target the collected phone/tablet `nl.rtl.videoland.v2` 1.116.4, version code
1627, minSDK24/targetSDK36. The input APKS contains `base.apk`,
`split_config.arm64_v8a.apk`, and `split_config.xxxhdpi.apk`. Original base SHA256:
`c990c0339ac1b8c79031aabccba0046f63ca005266031a18c35051c8b7a73810`.
Publisher certificate SHA256:
`6c7782ca5cabbaaf0546c31b63b7a5ed112ef6a00a5422fa263c2516dee2c141`.

The mobile compatibility entry is separate from TV 1.117.0/1622 and declares
`FormFactor.MOBILE` / APKS. Both public controls use the original-input signer,
package, version, code and minSDK guard; every patched method also pins its exact
DEX descriptor, register count and instruction count. The independent verifier
pins the base bytes and each original method graph SHA256. No account rights,
subscription decisions, catalogue filtering or free-tier replay changes belong
to this scope.

## Static evidence and implementation decisions

REA/JADX observations describe shipped code, not runtime execution. Provider
display types were checked against separately decoded DEX descriptors before
implementation. JADX reports 29,621 parsed class names; independent baksmali
finds 37,941 DEX class declarations and 161,557 methods, including synthetic/R8
classes omitted from that display inventory.

| Boundary | Observed contract and chosen effect | REA evidence |
|---|---|---|
| `PlayerConfigImpl.e()` | Reads `playerAdsLoaderEnabled`; return false. Mobile `d()` reads Picture-in-Picture and remains intact. | `ev_918652e750ccb27e800c06139914cdded3a97212ad3f9ebf113f9044e4227d38`, `ev_2c85863a9af71106bcad209da18f61ec26651e6f09ff31fc8d32668ed0cce88e` |
| `AdEngineAdRequester.a(wy.c)` / `b(long,Ye.n)` | Delegate cuepoint and video-item requests to the real repository. Complete synchronously with the real `ry.K.d` empty list, avoiding a suspended continuation or a fabricated item. | `ev_92043b159e5ead963d9c752d6e99b1aeae988ad3db1f658f6c96d8a95afa2537`, `ev_b0909abebb45a34b10ba1f0b9fb78d07901bf0b338cb21ce9f65e8a029c2646e` |
| `LBannerAdRequester.a` / `b` | Cuepoints return an empty list; banner-item lookup returns null. These result types differ. | `ev_4c22349be0e2ee81c7e2b3201f97b53aa24d56fe05caf02086a67c5cabcc0f22`, `ev_0509a4694ec11eaa17a97b0487a6c97029412c50762351521317184dca2272a8` |
| `AdEngineConfigImpl.a()` / pause-item use case | Pause config is optional; mobile `GetFirstPlayablePauseAdItemUseCaseImpl.a` returns nullable `pausead.d.b`, unlike the newer TV Empty singleton. Return null synchronously at both boundaries. | `ev_1c9191c98404f5caf87e6ae33a6f8ebd5b87ab5f93f81bf877e5d18358213ff3`, `ev_1b2063774a51d247711d8a94d312d5c03fb3c6250202d26de376d1d6c6af0360` |
| `MobileReplayControl.g0()` | Only schedules legacy/new pause ads after checking replay state. Return immediately. Keep actual pause/resume and all other control methods. | `ev_c53bdc43d6c0efed7cd71c0870e0f4e228530a5d5170aa467d587f08139f09ad` |
| `YospaceDaiResourceCreator.a(Of.a)` / `LiveQueueItem.v()` | Resource creator can return null; live queue then selects the supplied `df.b` fallback and reads its original URI/DRM. Return null only from the creator; retain the DAI predicate, queue and DRM code. | `ev_c54b23e95d8cad7297354d546b4d19e1b28ac043e49247509b38893142ebe215`, `ev_13ec75aa4682626c64e3925dee6820238196c220b769235d09f5413830960c64`, `ev_f40fea7dc5cdd1fb5d8b7a7bcf2410ac75e6b6cfc47b01d8ea2b95591b693b61` |
| `ConfigImpl.h(String)` | Filter only `activateTealium`, `playerNPAWv7Enabled`, `playerSnowplowMediaTrackingEnabled` at consumption. Unknown/null keys retain the original graph. | `ev_81e34221b605e7724e30b800cf6f30ec5bc4da012e53899ea8414c1f4fa528a7` |
| NPAW adapter creation | Both creation and `fireOfflineEvents()` are inside the NPAW flag branch. False prevents the SDK instance and queued-event replay. | `ev_b81824edd85465b20c86bc35386967ab26e26538abf695d0e071a92875f1a763` |
| Tealium `C0(String,Map)` / `D0(Map)` | Central event/view dispatchers build coroutine payloads. Return void before constructing or sending them. | `ev_949759f71f1204d2b96d249cfd2040f512d3c0b350ce209d298d223e492c3869`, `ev_7ed98deb60a90d3b82d187b7495950d5b0f02cd9a3d9140ea2e043011ade4a23` |
| Snowplow constructor | Eagerly creates emitter/plugins and emits `InitEvent` before the media-session flag. Preserve Object initialization and three stored dependencies; return immediately after the entity-mapper field assignment. Tracker/session fields stay null and the original constructor tail remains present. | `ev_07f871dbd83d51667e0df8edc9b5cbfcad1436220e5adfd5841e1b8da532aab2` |
| Google advertising ID | `GoogleAdvertisingIdSource.a()` already returns `y6.b.a` for limited/unavailable identifiers. Return that real result without requesting an ID. | `ev_6b19a8a062eff091f13923f7f52709edcfe96f708ad29cdb55f12a57e61b978f` |
| CCT `i3.u.c(B2.c)` | Performs the Google DataTransport POST, returning `is.b(status,redirect,delay)`. Return typed local 403/null/0; the original uploader treats it as fatal and clears the batch. Other media/task methods on this R8-merged class remain unchanged. | `ev_ee1c3e5ee166fdb9b299e9e577779cb3095b22e9ae36e36ba24ba3bd62235364` |
| Salesforce analytics `h.init` / `controlChannelInit` | Initialize ET, statistics and predictive-intelligence collectors/alarms, including cached data processing. Return void before collector creation/registration. Keep the initialized SDK, push/inbox, registration and functional account code. | `ev_269e71eef9a3b8321d3a8bcd43e2a10c55406cb5b6dd4a22bb9a0258459bda56`, `ev_e0acc3958e7236a1bc4a2e6a405e128e9d606019fc167012e91623e556872c8b`, `ev_dd37b881b641a047e9f54ef12402e65cde8af179517ff0a124c42fa3630a5cb3` |
| Salesforce runtime switches | `enableAnalytics` / `enablePiAnalytics` can override configuration and create new collectors. Disable both; return false from `areAnalyticsEnabled` / `arePiAnalyticsEnabled`, including stored opt-in overrides. | `ev_d92e4264ce6d7416b873e7507f4101b115e8f97dc090aaec3bf967a586d6d497`, `ev_a35d931c1a99f833e6eaab09d0ca82cf16f5c087332f978d0cd9592fceff46f6`, `ev_9e0fca876bf7a13c5444d5f0f0ba2d37d8abddca89143f3af47ee26260eb6595`, `ev_38fc0bb9d7b2435741f1ebeae46ffd9c70e59984db3c7f54a97c1ced81c17a95` |
| Facebook automatic events / advertising ID | `j.a()` allows remote overrides; `j.k()` restores saved preferences. Force the actual `j.c()` auto-event and `j.b()` identifier consumption gates false, independently of those defaults. Preserve SDK/login methods. | `ev_118103abcb837fed10c8f2630250e8e13ed49a72943e6ba9d05357abf9eaa0cb`, `ev_7844919f5c9b381acfa8d389dee8cbbf8cbe28ec874214fbdc75cf28ffca8774`, `ev_5863ba449d29eff92693196be5c744e3f83ecaa495959fa0abf4e2d4c3062e59`, `ev_4a716b9064eff1da5f4015e82d00710668753f5a3fa034dc49118afbd4fe7746` |
| Crashlytics collection arbiter | Saved/API opt-ins supersede manifest defaults; `DataCollectionArbiter.a()` decides whether automatic permission resolves. Force false there as well as blocking CCT uploads. | `ev_92756851dd29159dcd591771d7647e03310cf384c3b25e1df29f3b1a0ddd300c` |

Tracking resource edits remove the five advertising/AdServices permissions and
the eager New Relic content provider, and set the inspected Firebase Analytics,
Crashlytics, Performance, Sessions, FCM delivery-metrics and Facebook automatic
measurement/advertising-ID metadata flags. `NewRelic.start(Context)` returns
before starting its agent. Functional Firebase installation/remote config/push,
Google sign-in, Gigya login, billing, media/cast/session and license paths remain
in the original full DEX inventory.

The app contains Bedrock `GetAppsflyerConfigUseCase` attribute mapping, but the
bounded `com.appsflyer` class-name search found no AppsFlyer SDK classes
(`ev_b80201c910238a44582cc9a986860954207e96a7a235ffc8a38cb478bed09eca`).
This does not prove absence of all possible attribution traffic. PairIP and
VMRunner class-name searches returned no matches
(`ev_2852176e7d97c89ca8e713fd257f7e2d36e8f2517088bed9012b437eb2d04af8`,
`ev_41f095f5d7a33912d03d96a7fd211b78f7e14e291a3f804263d95aab4cd98f1b`).
The supplied native split contains only `libandroidx.graphics.path.so`.
No protected-callback bypass or Frida Gadget is added.

Incoming-reference evidence for Facebook's identifier gate names three callers,
including `AttributionIdentifiers.a`; the automatic-event gate has 18 callers,
including login-event handlers. Its remote-override reader `j.a()` has only the
central `j.c()` caller (`ev_1b067a95b8470d4aa8dfa79ea8a96610096afecd5efa4929cea042e09a06c835`,
`ev_7b5bda212b4e755da2a66fbe2d358c34c58b2658a26ef4399732466b80d191ec`,
`ev_5b894c00d315fef7cf7b2558d6b7c506c40260f4149795679607f285005c30df`).
The direct incoming-reference query for `AdEngineAdRequester.a` returns zero
(`ev_be9847a66d8ec6ec63c92664b821bb50bfa0ba66a45e8bb1abbd5ddda018d4b1`);
that does not establish absence of interface dispatch, reflection or dynamic
calls. The preserved interface and repository implementation remain the basis
for runtime request probes.

## Verification and runtime handoff

Before production edits, pin original and expected effects in
`tests/videoland_mobile_contracts.json`; run the verifier against stock with ads
and tracking selected and observe the expected missing-effect failure at
`MobileReplayControl.g0()`. Additional Facebook and Crashlytics consumption-gate contracts first failed against the unchanged emitted/stock bytecode before those fixes. The host regression tests reject empty/missing
inventories, unrelated DRM changes and incorrect branch/catch rebasing, and
exercise null/unknown privacy configuration keys.

Build via `:patches:build`, then apply each individual control and both controls
to the complete original APKS using Desktop 1.19.1 `--bytecode-mode FULL
--validate`. Select mobile patch indices from the actual built bundle; indices
are not stable across bundles. All three generated APKs pass `apksigner verify`.
Check independent decoded DEX with:

```bash
python3 tests/verify_videoland.py ORIGINAL_DECODED PATCHED_DECODED --ads --tracking --original-apks ORIGINAL.apks --patched-apk PATCHED.apk
```

The verifier permits exactly the selected 35 method insertions, preserves every
original method tail/control-flow edge and unselected method, checks every class
declaration, and checks the complete merge/privacy manifest. It verifies 2,230
resource/asset/native blobs from all three input APKs byte-for-byte after the
merger's qualifier normalization for APIs already implied by minSDK24. The
distribution-only `res/xml/splits0.xml` is removed with its split metadata.

The dedicated emulator owner must execute:

```bash
python3 tests/run_videoland_mobile.py --serial TASK_EMULATOR --apk PATCHED.apk --ads --tracking
```

This performs 13 ad and 28 tracking cases in isolated ART, including real typed
empty/null results, Snowplow initialization, Salesforce gates, CCT fatal result,
and four live-fallback source/DRM identity cases. It does not install/start the
app, establish network suppression or validate playback. Actual stock/patched
cold/warm starts, consent changes, remote refresh, queued uploads, login,
catalogue, replay/live playback, seek/pause/resume/return, PiP, casting, DRM and
lower-SDK support belong to the separate emulator integration acceptance.
Use Frida within that declared emulator if lifecycle/callback behavior fails.

Client ad boundaries cannot remove ads already stitched into a server media
stream with no supplied clean fallback. Ad-supported subscription playback and
complete outgoing-traffic acceptance remain runtime questions; this static
implementation does not claim those outcomes.


## Runtime-led privacy follow-up — 2026-10-31

The stock API36 Frida capture at `build/mobile-streaming/videoland-stock-frida.jsonl`
contains automatic `sdk.out.usbla.net/v1/featurebilla/config.json` and `/campaigns`
requests, alongside expected stock New Relic traffic. The `api.stories.studio`
peer is JOIN Stories, not Storyly: the binary constructs separate Retrofit
interfaces for root `/meas/` analytics and `/v3/` editorial content. A peer name
alone cannot establish which path ran.

Usabilla's repository lifecycle callback stores an Activity weak reference and
then subscribes to SDK initialization on resume. Preserve that reference and
return immediately before the automatic subscription. Disable central
`UsabillaTaggingPlan.c(String,Map)` and SDK `sendEvent(Context,String)` dispatch,
so consent, profile and playback changes cannot implicitly initialize the SDK
or trigger campaigns. Preserve explicit `initialize`, `loadFeedbackForm` and
`updateFragmentManager`: the original explicit-init completion (`Ab.b.run`
case4) uses the retained weak Activity to install its FragmentManager.
Evidence: `ev_2ef1b6f77728f6c2361ce57f7a06a24c4e23d78f4a6c29cc384ef9ece2db5a4f`,
`ev_7349eefff552d3989f38652aa2ec3b05f0bd03d451da43ae10db580853002438`,
`ev_713c570b52bf3561b344f9ea88842c4c873e0a7600a080fec1011c113af35808`,
`ev_181f960075158439ace43b7237b687b65c89051f1e79ab65c3e75602c0271b20`.

Return void at `UbTelemetryRecorder.d()` and `Ex.i.a(Iw.a,List)` before telemetry
submission or queued-batch coroutine creation. Complete `Ex.d.invokeSuspend`
with the actual Kotlin Unit singleton; that coroutine exclusively reads the
`VariableName.TELEMETRY` calibration setting from Featurebilla. Return a genuine
`az.F` wrapping a one-emission empty-list Flow from `ix.M.b(String)`. Retain the
original catch action, which remains unused for this successful Flow. This
avoids campaign fetch and error-driven cached fallback while the original
initializer still receives a list and completes its typed callback normally.
No campaign URL rewrite or universal host block is involved.
Evidence: `ev_cf7ae198cec1a0af79fa8ffbc1ba75841f2923d161b9fc4919d9b243b45d7daa`,
`ev_bcca732cdca7d38eda3a46e4ce4cc447e2a6855f0d0756d76ceedf8d027f63f6`,
`ev_0ce623894504b13f62a511e3b76bf64f89664c2969012088b6b36c51ef7e9ba4`,
`ev_4c8fd1528e5223441343c37852ff37b4f013003e4d0736af4d484a0fb1a79c74`,
`ev_2f7c892c3f3303ed563ad1530cb4270733ce27c773472f7645b786fcf9dda4a6`,
`ev_696a9d5f499be60f9e35a8a76c566f056d3f396c20f321c920cd684a4b421c4a`.

For JOIN, `iv.a` has only POST `meas/`, `meas/stories/` and `meas/widgets/`.
Complete its concrete `hv.h.c/d/g` wrappers synchronously with real Unit. Keep
all four editorial `hv.h.a/b/e/f` methods, `iv.b` endpoints and the SDK's content
repository unchanged, including container delivery, poll retrieval and explicit
form responses. No editorial URL, API key, team/alias, language or rendering
configuration changes are made. Independent emitted tests reject changes to
those seven editorial/explicit-feedback methods.
Evidence: `ev_347076263420535845e6ce022bf65915a084c1000c9a2cbe2cf6c1c0cd13da07`,
`ev_8af55b107767bc6a156908d218c1bc478094567be19d00d5ad3e65d609993109`,
`ev_76dae158072c1bc001fe55326525d7dfc384cc8ece9d1f3a0ea2b146ac4651b8`,
`ev_23d66c493bb658cf05d301ff923fdf5adb1ef35c2711c25be90a658666fa2833`,
`ev_dd6ef12ea84a4fa37df07124f24e58a72a49cc4364a21455025123bee6a78950`,
`ev_998355ff32f32009a3a21c406e2a51bbdaba7c06708c0ff79745191c02fd93a1`,
`ev_aa720cd0405d71abcca1ed675b70bbebe996398af79ab9ace7b8aa31f5e1be9c`.

The follow-up's ten independently pinned original/emitted effects first fail
against the prior candidate at the automatic Usabilla resume subscription.
The isolated ART probe now also checks preserved weak Activity state, actual
empty-list campaign Flow emission/completion and JOIN Unit results (41 combined
cases). Live cold-start, consent/refresh, queued-event and editorial/feedback
UI/network reconciliation remains the integration owner's acceptance step.


The integration owner executed all **41 actual APK ART cases** successfully on
API36 `emulator-5600` against combined candidate SHA256
`c1192968d305b008b069dc8e9f4ac88ac2ca0ac0b33477a33bed1b6945497dd7`.
The retained integration evidence is
`build/mobile-streaming/videoland-41-art.log`. Campaign Flow collection uses a
real `uy.d` continuation with `uy.j.d` EmptyCoroutineContext; it emits exactly
one empty list and returns Unit immediately without suspending. An earlier
null-continuation fixture was invalid for Kotlin SafeCollector and was corrected
before this passing run; that fixture failure was not a production failure.
Both follow-up selection gates preserve all 161,557 original methods and 37,941
classes, the complete merge/privacy manifest and all 2,230 packaged payloads.
Ten artifact-aware tests pass, including explicit editorial/feedback method
preservation. These results establish emitted behavior in isolated ART; they do
not establish account-dependent playback, manual-feedback UI success or full
live traffic acceptance.


## Stable acceptance and retained customizer traffic

The user tested the final three-control phone APK (SHA256
`4712ef966ce222e1ac04a25963dc66d5055b687b9ea4bef8a75f8b96234496ad`), confirmed
Videoland is fixed and approved release to main. Existing account data and
working ad-free playback were retained. No further emulator checks were run.

The packaged AppLaunch map binds `customizerBaseUrl` to the UGA customizer
backend (`/v1/get_user_custom_configs`). `Cd.b` constructs `P6.a`, whose GET
`platforms/{platformCode}/users/{uid}/apps/{code}/versions/{version}` returns
configuration overrides and `x-customizer-variants`. User/profile/device IDs can
select these configurations and experiment assignments. Retain this functional
retrieval; it is not established event analytics, authentication or geolocation,
and does not justify a claim of zero network traffic or zero server-side
tracking. Evidence: `ev_e91671d5aaae58760cd5677fb28fff6656ffeaf08ec192b584fb0cf5913be6fe`,
`ev_bdd2ed645f09c0fd88585cf94c92bb67f7431a9eb4fd33bbe94f80eafad9300b`,
`ev_b837dac0401406c916af49d2ee6c501853c708955d5ef63b0f95c5a51c2c68`.
