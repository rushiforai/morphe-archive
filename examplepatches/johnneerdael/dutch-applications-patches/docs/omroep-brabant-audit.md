# Omroep Brabant 11.1.0 implementation audit

The maintainer approved stable publication on 29 October 2026. The development
and pending-acceptance notes below describe the recorded implementation stages.
Publication adds no new device or network-capture evidence; the stated runtime
limits remain.

Target `nl.omroepbrabant.android`, **11.1.0 / 7331764**, minSdk32 (Android 12L),
original Play APKS. Original-input guards require the package, version, code,
SDK and publisher signer
`5b364bd01320e86c272a126b37b62be15753363565d930706c721d4909416a03`.
The separate Google source stamp is not the publisher signer.

Original APKS SHA256
`cf2dbf5a442f26005238cb5dd60727931e4c3f72f4a7e904ce19919eab12b1a0`;
base SHA256
`c0229a1054b91109eda4fb386ecce2eb8a4c5dc2436c843f3b1cd20f67f9a860`.
The [original research](research/2026-10-28/omroep-brabant.md) records shipped
source and three small anonymous public GET observations. Implementation-pending
statements there refer to the research phase. The
[README destination table](privacy/omroep-brabant/README.md) separates
traced senders, configured/SDK destinations and unknown receivers. No decrypted
app traffic capture or phone acceptance is claimed for this development build.

## Controls and ad completion

Three controls are listed separately: **Hide ads**, **Disable tracking**
(includes ads), **Skip consent screens** (includes both). Mutating dependencies
consume the original-input guard; each bytecode edit checks original binary
access/register/count and opcode/reference anchors.

Native feed/article ad models are omitted before placement and pagination.
Tablet/top insertion and the nested news card use their existing null-ad paths;
the placement-definition list still drains normally, while news IDs, metadata,
lead/child identities remain. Both nested Compose null branches omit the ad
renderer and its parent-owned spacer.
XML weather/traffic wrappers return with the whole wrapper GONE before requests.
Pinch's `OptOutAdView.e` retains its native state reset, then invokes the actual
failure callback once. Real consumers produce Boolean.FALSE, failed held-view
state and zero dimensions/label opacity; the SDK is never told it loaded an ad.
Cached Outbrain row rendering stops before widget creation, alongside article
model omission and the app-owned initializer. Only the StartApp provider's ad
initializer and its three ad-only background/boot jobs are disabled.

The native absent-vertical-config branch publishes the original video list and
selected index, with no inserted ad pager rows. Regular scheduling/services
getters return their original nullable absence. Separate SHORTS/renderer
controller allocation, renderer/outstream attachment and late string-key
`adServicesData` paths are fenced too. Native content preparation, clip/playlist
identity, player coordination, lifecycle and event bus remain. Remote overlays,
HTML, creatives and server-side inserted ads are not proven removed.

## Collection and optional identifiers

The app Firebase fan-out, three direct push analytics sends, Piano app gate and
SDK sender/queue leaves, ContentInsights activation/sender and independent
Outbrain diagnostics are suppressed. Piano's crash hook still delegates the
previous uncaught-exception handler. The Piano worker retains its native
seven-day expiry and 2,000 pending-row cleanup, then stops before connectivity
and upload. Initialized Firebase/Piano/ContentInsights
services retain their functional consumers.

The read-history coroutine performs its original Room write, including suspended
and resumed paths, before skipping Android-ID acquisition and the separate
`event/readarticle` upload. This shares the publisher host with news/config and
must not be blocked by hostname. The mixed ContentInsights entry preserves prior
cleanup/Piano sequencing; only its activation tail is skipped. `nt.l` cleanup is
retained. NMO registration returns the native `Result.Failure` object and cached
lookup returns nullable absence, avoiding registration/UUID creation and Piano
forwarding. Existing stored identifiers are not claimed deleted.

Google/Huawei optional advertising IDs, Pinch's advertising-ID updater,
measurement cached/fresh ID pairs and hashed-ID association, IMA's optional ID
object, PAL's advertising/App Set optionals, UMP's optional ad ID and the audited
StartApp App Set block use their real absence/empty-optional/Unit contracts.
Cached Huawei getters are covered independently of acquisition; the StartApp
request field and selected merged Outbrain GAID field are cleared. UMP Android-ID
debug-device callers are skipped narrowly, retaining manual request construction
with debug=false. Generic Settings, UUID, Firebase installations, Tasks,
authentication and secure device APIs are not globally replaced.

Pinch's independent OM session/script methods return native failures; the real
session consumer maps failure to a null session and releases its monitor.
Blue Billywig receives copied options with both `noStats_content` and
`noStats_commercial` true **after** its TCF logic, preventing an accepted/persisted
consent input from re-enabling statistics. An independent statistics network
fence retains the original player session/source/event bus and auxiliary map.
Shared BB content/playout/CDN hosts remain accessible.

## Restored measurement and native failure

Collection flags do not cover already-persisted work. Both original Google
measurement HTTP Runnables are stopped before connection creation and queue
exactly one original SDK completion Runnable with status0, IOException and null
body/headers. Existing callback paths retain retry-row restoration, busy flag
closure and the synchronous AtomicReference set/notifyAll release. This is a
failure result; no suppressed upload is marked delivered. Older pending Google
work retains its native failure/retry/expiry behavior. Unexpired Piano records
remain unsent, with the native local expiry/cap cleanup retained.

CCT's inlined uploader filters after optional client metrics are appended and
before grouping/sending. Its replaced anchor also covers the original no-extras
incoming branch. Only these four original-proven transport names are removed:

- `FIREBASE_CRASHLYTICS_REPORT`
- `FIREBASE_APPQUALITY_SESSION`
- `FCM_CLIENT_EVENT_LOGGING`
- `GDT_CLIENT_METRICS`

Unknown/null names are retained. Kept event objects, order, extras and original
persisted-row bookkeeping remain. A completely filtered outgoing batch takes
the native fatal3/wait=-1 path and original SQL deletion transaction, without a
success/delivered acknowledgement or success-only client-metrics reset. A mixed
batch follows the genuine backend result/retry/deletion paths; filtered rows can
remain pending with that original batch on transient failure but are never
forwarded by the filtered send list.

## Privacy and retained functionality

The automatic custom consent decision returns its native boxed false. Automatic
player consent presentation skips to the existing initialized-player `g`/return
path. Neither writes acceptance/rejection, replaces purpose/vendor choices nor
claims the SDK granted consent. The original increment retained manual settings; the follow-up below removes
the cookie entry/dialog. Generic user-selected
embed/puzzle privacy gates remain original. These are separate from app,
Piano and embedded UMP/TCF storage.

Ten collection flags and seven advertising/AdServices permissions change.
The complete remaining functional manifest graph and all twelve bundled assets
are hash-pinned. FULL APKS merging removes two split declarations and five Play
split/stamp packaging entries; only those known packaging differences are
normalized. Functional providers, push/notification delivery and tokens,
media/radio/Android Auto/cast, widgets, configuration, local history, news,
search, external navigation and real account/purchase flows remain original.
Facebook/Comscore/Adjust configuration names and the LiveRamp asset do not prove
an active app-owned collector. No native paywall or article-unlock control was
established here; backend/remote media availability is a separate question.

## Verification and device scope

Independent original APK DEX declarations and **2,298 method contracts** bind
retained native instructions, complete branch/switch routing, exception ranges,
array data, access flags and registers. Selected checks restore only declared
owned edits before hashing the rest. Introduced calls are checked against actual
output declarations and the Android SDK. New helpers have a strict selection,
header and call inventory.

The bounded instruction fixtures execute native callbacks, results, list/index
handling, history/resume, OM monitor completion, post-TCF option handoff,
player event-bus preservation, queued HTTP failure callbacks, measurement
failure/waiter closure, CCT local deletion/genuine retry and automatic player
readiness. Standard collections and Android/SQL/HTTP/worker/coordinator IO are
explicit modeled boundaries. This proves those bytecode paths under their
fixtures; it does not emulate Android scheduling/rendering or establish a
complete network-blocking guarantee.

The original and all four selections (each individual control plus all three)
pass FULL patch/report, APK signature and decoded verification. The current
whole Python regression suite has **114 tests**. Reproduce with a configured
SSD environment and the exact original input:

```sh
source build/env.sh
python3 -m unittest discover -s tests
python3 scripts/validate_targets.py brabant /path/to/omroep-brabant-original.apks --bundle /path/to/candidate.mpp
```

The fresh review identified the Piano local-cleanup and tablet/nested-slot gaps;
both have regression fixtures. Same-instance repeated Pinch/attach coverage
remains a deferred fixture gap; original attach/detach code is retained.

Phone acceptance remains pending. Check cold start/relaunch; article/feed,
weather/traffic and local history; ordinary/vertical/live video and radio;
controls/pause/resume/destroy/cast/Auto; manual notification settings and user-selected embeds;
real notification display/deep links and widgets. Runtime capture is needed to
measure residual SDK configuration, remote scripts/overlays, mixed endpoints,
SSAI and server-side behavior. No app installation, data reset or notification
permission grant was performed for this increment.


## Startup notification and cookie settings follow-up

Phone feedback showed Android's notification permission prompt at startup and
the manual Cookie instellingen dialog. The activity's SDK33+ branch scheduled
a `j50` coroutine with discriminator20; the manual notification menu branch is
separate and opens `android.settings.APP_NOTIFICATION_SETTINGS` for the actual
application package. Skip consent screens now takes the activity's native
continuation before that startup coroutine is scheduled. It does not alter
permission state, push registration/delivery or stored notification choices.

The cookie menu row is `privacy_policy` in `fragment_more.xml`. Its generated
view binding requires that ID, so the row stays in the resource with initial
visibility=gone and occupies no menu row from the first frame. Only that initial
visibility changes. Cookie click selector8 returns before logging or changing
modal state. Selector7 still builds the native Android notification Settings
intent and package extra. The shared `ut.u` cookie host returns before Compose
groups, state-flow collection, effects or its native Dialog call; it never opens
and then dismisses the screen. No acceptance, rejection or permission grant is
fabricated, and the original method bodies remain behind the owned edits.

Original and prior-build fixtures reproduce all four visible/startup effects.
New full-graph contracts pin the activity, click dispatcher, shared host,
binding/inflation and original notification helper/caller bodies. Emitted
fixtures exercise SDK32/33/36 startup and the real manual Settings route.
Phone acceptance for this follow-up remains pending. Earlier verification
sections describe the prior increments.

The new and retained independent modes and the combined FULL APK pass the
2306-contract verifier, patch reports, rebuilt signatures and decoded resource
checks. Fresh/retained cookie-state fixtures and manual OS Settings routing pass.
Python118/118, Node6/6 and strict bilingual documentation49page-pairs/99HTML pass.
The compiled candidate keeps173 previous code/extension/native payloads exact;
only the Brabant consent patch classes, their containing DEX and one new consent
resource patch class differ. No other approved app code changes.
