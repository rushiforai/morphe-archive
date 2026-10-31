# Omroep West patch alignment and implementation assessment

Omroep West 20.1 has a strong match to the **three Omroep Brabant controls**:
Hide ads, Disable tracking, and Skip consent screens. Port their behavior and
dependency structure, with West-specific targets. Adding West to Brabant's
compatibility list would fail its exact method contracts and miss West's
different presentation, measurement, and consent flows.

This is an implementation assessment, not a released patch or device acceptance.
**Seen** means present in the supplied original APK or current patch source.
**Inferred** means a proposed port based on those instructions. **Unknown** means
the inspected evidence does not establish the behavior.

## Input and evidence

- Input: `/Users/jneerdael/Scripts/apks/omroep-west.apks`, extracted from the phone.
- Seen: `nl.omroepwest.android`, version **20.1 / 10596**, minSdk **32**, targetSdk **36**.
- Seen: base APK, `arm64_v8a` split, and `xxxhdpi` split; all three pass
  `apksigner verify` with publisher SHA256
  `5b364bd01320e86c272a126b37b62be15753363565d930706c721d4909416a03`.
  This equals the signer pinned in Brabant's `Compatibility.kt`.
- APKS SHA256: `8d72f5494d2a6c224efb3322ce9967f4d80455be4fde4239abb542a127657798`.
- Base SHA256: `03763df28de7dbdf39e8b2018c4b4850788ab9865e6c55f48d3167bf8783c02f`.
- [Evidence inventory](2026-10-31/omroep-west-evidence.json): split hashes,
  original method headers, source locations, body hashes, and selected native
  instruction anchors. Source paths below are relative to an `apktool` decode
  of this base APK. The inventory identifies the inspected repository HEAD and
  hashes the Brabant target lists, including their current working-copy state.

Following `leanrea`, extraction used a copy under `$TMPDIR/re/omroep-west-20.1`.
The ZIP inventory preceded `apktool` disassembly. A locally installed JADX
library supplied selected Java views; its restructuring warnings make native
smali authoritative. The base-only resource decode reports unresolved image
references supplied by the density split; it is not a rebuilt or install-tested
combined APK.

## Existing patches that align

| Existing source | Alignment with West | Reuse boundary |
| --- | --- | --- |
| `patches/brabant/AdsPatch.kt`, `AdsTargets.kt`, `AdsResources.kt` | Seen: Pinch, Outbrain, Start.io, native placements and Blue Billywig. | Primary ad-port reference. Retarget West model builders, player paths and callbacks. |
| `patches/brabant/TrackingPatch.kt`, `TrackingTargets.kt`, `TrackingHelpers.kt`, `TrackingResources.kt` | Seen: Piano, Google measurement, optional advertising IDs, NMO/Piano identity, Blue Billywig statistics and CCT measurement transports. | Primary tracking-port reference. Retain initialization and native completion; establish West's own contracts. |
| `patches/brabant/ConsentScreensPatch.kt`, `ConsentTargets.kt`, `ConsentResources.kt` | Seen: automatic cookie presentation, manual cookie settings and notification permission requests. | Same product behavior, different activities, settings views and callbacks. |
| `patches/rtl/TrackingPatch.kt` and its helpers | Similar separation of SDK gates, optional identifiers, persisted measurement and request completion. | Secondary implementation pattern; RTL owners and engagement targets are not West targets. |
| `patches/weerplaza/AdsPatch.kt` | Existing tracking request policy includes `stats.bluebillywig.com`, also seen in West's native player. | Useful comparison if a West WebView sender is traced. Its WebView interception does not cover West's native statistics sender. |

Seen: Brabant defines 16 owned ad methods, 46 tracking methods, and 5 consent
methods in those target lists. West contains the same owner and signature for
only **3 / 16**, **1 / 46**, and **0 / 5**, respectively. This measures declaration
overlap, not successful patch application; helper targets are outside those counts.

The three ad overlaps are unusually useful: StartAppInitProvider's `attachInfo`
retains its three-instruction body and `xh.c(Context)` initializer; the two
`EmbedObject` ad getters retain their two-instruction nullable-field bodies.
They match the corresponding Brabant edit shapes. The tracking overlap,
Start.io `e2.a(Context, AdPreferences)`, has **63 instructions / 5 registers**
in West versus Brabant's expected **60 / 4**. Its familiar App Set anchor alone
is insufficient to reuse the old edit.

## Hide ads parity

| Brabant behavior | Seen in West | Proposed port and preservation requirement |
| --- | --- | --- |
| Omit native feed/article placements and their gaps | `BaseController.buildComponent(Lh01;Let5;)Z` at line 890 builds `OptOutAdvertisementModel_`; `y43.T` / `W` at lines 95 / 303 build nested placements; `vb3.L` at line 191 inserts horizontal-scroll ads. | Omit only ad models using each existing no-ad branch. Preserve component return contracts, news order, tablet layout, disabled-ad IDs and parent spacing. A global early return from the mixed controller would also remove content. |
| Complete Pinch load through failure | `nl/pinch/optoutadvertising/sdk/ui/OptOutAdView.e(Lz7;)V`, line 510, resets its state and delegates loading. | Preserve the reset, then call the actual `Lz7;` failure contract once. Rebind width, height, label and held-view cleanup fixtures to West's consumers. Brabant's `Lk9;` callback type is wrong here. |
| Omit Outbrain rows and stop cached rendering | `ot9.e(Lqm5;Let5;Lxp5;)Z`, line 1155, creates `OutbrainModel_`; `OutbrainModel.bind`, line 148, initializes its widget. | Cover construction and cached binding. `ix0.d0(String)` contains a separate widget-error reporting URL; row omission alone does not prove that diagnostics are stopped. |
| Disable ad-only Start.io initialization and jobs | Manifest declares `StartAppInitProvider`, `BackgroundService`, `SchedulerService`, and `BootCompleteListener`. | Reuse the narrow provider edit and guarded component disabling. Preserve ContentProvider attachment and unrelated workers, push, media and cast components. |
| Remove ordinary and alternate Blue Billywig ad paths | `EmbedObject.getAdSchedulingData` / `getAdServicesData`, lines 2778 / 2786; `v70.i` contains ordinary scheduling and `SHORTS`; `v70.H` consumes string-key `adServicesData`. | Port nullable scheduling/services getters plus renderer/controller and late-map fences. Nulling two getters alone does not cover all paths. Preserve clip identity, content preparation and lifecycle/event-bus sequencing. |
| Remove vertical pager ad rows and preserve selection | `VerticalVideoActivity.onCreate` inserts synthetic asset `5990173` relative to `start_index`; `gp2.<clinit>` initializes its ad flag `b` to true. `D(I)I`, page selection and player preparation read that flag too. | Use consistent native no-ad routes across insertion, index translation, `we8.onPageSelected`, and player preparation. Preserve the original list and selection. Changing insertion alone risks index and playback disagreement. |

Source paths for obfuscated symbols are `smali_classes3/<symbol>.smali`, except
`ot9`, `v70`, and the Blue Billywig models, which are under `smali/`.

Unknown: remote HTML overlays, server-side inserted ads and actual playback
after patching. The exact West counterpart of Brabant's separate weather/traffic
wrapper edits still needs tracing; shared page-component rendering is a candidate,
not proof of coverage.

## Disable tracking parity

Seen: West's app-owned tracking implementation is `p08`, implementing `ii3`.
Its constructor initializes Piano and registers lifecycle callbacks. Its methods
build article, click, search, notification/settings and audiovisual events.
Its `e()` metadata includes user type and profile information. Suppress event
creation and sender leaves while retaining the initialized objects required by
functional consumers.

| Brabant behavior | West evidence and implementation consequence |
| --- | --- |
| App analytics and consent-resistant suppression | `nb1.f(Z)`, line 892, can enable Firebase from vendor choices. It also updates functional personalization, puzzle and social-content preferences. Fence collection specifically; do not replace this mixed method wholesale or rely solely on the manifest's existing `firebase_analytics_collection_enabled=false`. |
| Piano sender and restored queue cleanup | `sz6.run`, line 74, deletes expired/excess pending rows before connectivity and POST creation. Port the stop after cleanup and before network activity. Retain previous uncaught-exception-handler delegation when disabling the SDK crash contribution; West's initialized Piano runtime installs such a handler. |
| NMO and optional measurement identity | `cc5.a()`, line 31, loads or generates a 90-day `nmo_piano_uuid`; `b(String,g25)`, line 151, submits `vendor=piano` and `c12`. Callers include `w95.s`, `k82.u`, and `g25.A`. This differs from Brabant's failure-result/nullable lookup API. Suppress generation and forwarding at valid consumer boundaries; a copied null return is not established as safe. |
| Blue Billywig statistics | `v70.l(String,Map)`, line 18004, interprets TCF consent and `noStats_content` / `noStats_commercial`; `re0.k(EmbedObject,Map)`, line 4672, consumes these flags, and its constructor configures `https://stats.bluebillywig.com`. Port post-TCF option enforcement and the independent sender fence, preserving player coordination. |
| Persisted Google HTTP work | `im9.run`, line 120, contains the merged HTTP upload paths, connection setup, exception handling and callbacks. Reconstruct each discriminator's native failure completion before fencing requests. A plain return could strand pending work or waiters. Brabant's named `zzln` / `zzgy` targets are not these declarations. |
| CCT telemetry batches | Producers contain all four names used by Brabant's filter: `FIREBASE_CRASHLYTICS_REPORT`, `FIREBASE_APPQUALITY_SESSION`, `FCM_CLIENT_EVENT_LOGGING`, `GDT_CLIENT_METRICS`. `o50.f(Lg60;I)V`, line 777, appends client metrics. Rebind filtering, mixed-batch bookkeeping and empty-batch native failure/deletion behavior to this uploader. Preserve unknown transport names and real backend completion. |
| Optional identifiers and OM | Seen: Google/Huawei advertising-ID acquisition, Start.io App Set handling, IMA/PAL, UMP, and Pinch's `d03.s` loading `omsdk-v1.js`. Re-audit cached/fresh getters, consumer absence contracts and OM monitor/session completion before porting the corresponding Brabant edits. SDK presence is not a verified complete fence. |
| Resource collection switches | West declares the same seven advertising/AdServices permissions removed by Brabant, and BigQuery delivery export defaults to true. Port the ten collection switches and seven permission removals with West input guards. Retain Firebase initialization, installations/tokens, notification delivery and generic device APIs. |

Seen: `nb1.f` also contains a conditional Facebook activation branch, but West's
bundled `facebook_app_id` is empty. This does not establish an active Facebook
collector. Smartocto appears in cookie explanatory copy; an executable native
ContentInsights/Smartocto sender was not established. Brabant's separate
Room-history plus `event/readarticle` path also has no confirmed equivalent in
this inspection. Treat these as follow-up tracing items, not missing features
to invent or global host blocks. Preserve local reading/history behavior.

## Skip consent screens parity

Seen: West uses `nl.groei.consent.activities.GcwChoiceListActivity` and
`GcwSettingsActivity`. `nb1.b(Lzv0;ZLty2;)V`, line 146, launches them **after
registering an asynchronous completion observer**. A blind `return-void` at
this entry would omit both the dialog and its completion path.

Automatic callers are visible in `HomeFragment.M`, `f95.b` for articles, and
onboarding's `va3.onClick`. Manual settings call the same presenter from both
`t57.c` (Compose settings, selector 8) and `b67.onClick` (XML settings).
`fc5.L` constructs the user-selected embed/puzzle consent gate, whose `ec5.c`
action also invokes this presenter and then requests a model rebuild.

Inferred port: bypass automatic presentations with their real continuation,
hide the cookie entry in **both** settings implementations before display, and
fence only its click branches. Preserve user-selected social/puzzle gates and
stored vendor choices. Do not mark consent accepted or rejected. West also has
a `fragment_more.xml`, but it contains an Epoxy recycler rather than Brabant's
`privacy_policy` TextView. The cookie row builders and dialog owners differ, so
Brabant's resource edit cannot simply be copied.

Seen: `n90.y(Lty2;)V`, line 616, requests `POST_NOTIFICATIONS` on API 33+,
otherwise may show an enable-notifications dialog, and invokes the supplied
callback on its native no-prompt route. Its callers include onboarding,
`ei5`, and the mixed `ze3` dispatcher. Classify those callers before changing
them. Suppress automatic requests while preserving continuation and the manual
notification/settings flow; leave real permission state, token registration,
delivery and existing subscriptions intact.

## Implementation shape and acceptance

Inferred: add a separately guarded `patches.west` implementation for exactly
20.1 / 10596 / minSdk32 / the verified publisher signer. Keep the same three
default-on public controls and dependency chain as Brabant:

`Skip consent screens -> Disable tracking -> Hide ads`.

Use West-specific ads, tracking and consent target lists/resources. Reuse the
shared original-input guard and proven edit machinery where appropriate; do
not weaken Brabant's contracts or move all SDK handling into a generic framework.
Keep exact input headers, registers, instructions, references, branch targets,
callback signatures and functional manifest graph pinned before each mutation.

The work needed to establish full feature parity is:

1. Finish the bounded gaps identified above: all standalone/nested ad renderers
   and wrappers, identifier/OM consumers, local history, actual native/web
   measurement senders, both settings row builders, and automatic/manual
   notification callers. Inspect the asynchronous cookie completion observer.
2. Implement all three controls, including cached/restored work and alternate
   video paths, against those original West contracts. Retain real failure or
   optional-absence contracts rather than inventing successful completion.
3. Adapt the independent Brabant verifier approach to West: retained method
   graphs and manifest/assets; Pinch failure/dimensions; phone/tablet/nested
   layouts; original vertical list/index; persisted Google/CCT callbacks and
   deletion; Piano cleanup; post-TCF options; fresh/retained consent; manual
   embeds and notifications. Cover original, ads-only, tracking selection,
   consent selection, and combined selection.
4. Build and patch the complete split input; verify reports, merged resources,
   introduced references, output signing and package metadata. Then check cold
   start, navigation, articles/history, all video modes/radio, cast/Auto,
   widgets, notifications/deep links and user-selected embeds on Android.
   Capture traffic to bound residual native/web collectors and SSAI.
5. Update the app catalogue, bilingual four-section app pages, validation routing
   and substantive component counts when support actually exists. Leave release
   versions and release changelog entries to automation.

No premium/article-unlock parity is implied: Brabant exposes no such control.
The existing evidence supports a substantial three-control port, with only a
small directly reusable bytecode subset. Its functionality and network results
remain unproven until implementation and the relevant acceptance checks exist.
