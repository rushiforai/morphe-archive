# Omroep West 20.1 implementation audit

Target `nl.omroepwest.android`, **20.1 / 10596**, minSdk **32**, original Play APKS.
The input guard checks package, version, code, SDK and publisher signer SHA256
`5b364bd01320e86c272a126b37b62be15753363565d930706c721d4909416a03`.
The Google source stamp is separate from this publisher certificate.

Original APKS SHA256
`8d72f5494d2a6c224efb3322ce9967f4d80455be4fde4239abb542a127657798`;
base SHA256
`03763df28de7dbdf39e8b2018c4b4850788ab9865e6c55f48d3167bf8783c02f`.
The [assessment](research/2026-10-31-omroep-west.md) and its
[evidence inventory](research/2026-10-31/omroep-west-evidence.json) describe the
original shipped code. Implementation below resolves the native port questions
raised there; device and network acceptance remain separate.

## Controls and original contracts

Three default-on controls are exposed: **Hide ads**, **Disable tracking**
(includes ads), **Skip consent screens** (includes both). A hidden preflight
validates all original method headers and edit anchors before a dependency
mutates a shared method. Edits retain original bodies, branch targets and native
completion. The independent verifier restores only the declared selected edits
before checking **1,029 original method graphs**, access flags and registers.

## Ads and retained content

The mixed page controller omits only its advertisement arm, using the native
false result. Nested eligibility prevents parent-owned empty space; separate
builder fences cover cached/direct paths. The horizontal lane uses its nullable
ad configuration while preserving content cards and their order. Weather and
traffic route through the same page controller rather than Brabant's wrappers.

Pinch resets its real load state, then calls the real failure interface exactly
once. Current and stale model callbacks retain their native action and divider
handling. No callback reports an ad as loaded. Outbrain's model construction
stops before app-owned initialization, and cached binding hides its root before
widget initialization. The provider attachment remains while Start.io's ad
initializer and three ad-only jobs/receiver are disabled. Pinch's initialized
functional service graph remains available to its consumers.

Blue Billywig nullable scheduling/services getters, ordinary renderer mode,
three alternate/outstream controller allocations and the late `adServicesData`
map path are fenced independently. The copied request map receives
`canRequestAds=false`. Content identity, coordination, lifecycle and playback
event-bus paths remain. The vertical pager's shared ad flag alone becomes false;
its unrelated flag remains true. All five native flag consumers therefore agree
on list construction, index translation, preparation and selection callbacks.
The original video list and requested index are retained without synthetic ads.

## Collection and persisted work

App event leaves and Piano's event enqueue stop separately. The mixed consent
update keeps actual personalization/puzzle/social choices, while the Firebase
and conditional Facebook collection booleans are forced off. Ten manifest
collection switches and seven advertising/AdServices permission removals provide
additional controls. Firebase initialization, installations and push/token
services remain.

Piano's persisted worker retains its real expiry and pending-row cap deletions,
then returns before connectivity and upload. Its crash contribution is removed
while the previous uncaught-exception handler is still invoked. Unexpired stored
records and existing identifiers are not claimed erased.

NMO/Piano ID lookup returns an empty non-null string before cache access or
generation. Its separate submission throws through the caller's existing
`Exception` handler; both fresh and resumed coroutine failure paths log and
return native Unit. No success acknowledgement is fabricated.

Both R8-merged Google HTTP workers queue their actual native completion Runnable
on their original scheduler with status zero, IOException, and null body/headers.
Their retained consumers require a genuine successful response before delivery
acknowledgement. Original queue/retry and in-flight completion bodies are pinned.

The inlined CCT uploader filters after client metrics are appended and before
grouping, including the no-extras route. Only these four names are removed:

- `FIREBASE_CRASHLYTICS_REPORT`
- `FIREBASE_APPQUALITY_SESSION`
- `FCM_CLIENT_EVENT_LOGGING`
- `GDT_CLIENT_METRICS`

Unknown/null names, kept object identity/order and original persisted-batch
identity remain. An empty filtered list enters native fatal status 3 / wait -1
and SQL deletion without a delivered acknowledgement or success-only metrics
reset. Mixed batches retain genuine backend response, deletion and transient
retry/expiry/scheduling paths.

Google/Huawei cached and fresh ad identifiers, measurement cached/fresh pairs
and hashed association, Pinch, IMA/PAL, UMP debug callers, Start.io App Set and
Outbrain cached request fields use their inspected optional/empty contracts.
Generic device settings, UUID generation, authentication and Tasks are retained.
Pinch OM failures reach the native consumer's null-session result and balanced
monitor. Post-TCF player options enforce both `noStats_content` and
`noStats_commercial`; a separate statistics sender fence retains the native
auxiliary event-bus completion. Shared media/CDN/content hosts remain accessible.

## Consent and notification flows

Automatic home/article cookie presentation is bypassed at caller decisions.
Onboarding omits its separate Consent page and directly invokes the original
completion callback; language, interests and useful notification preferences
remain. Automatic notification requests invoke the native no-prompt continuation.
The shared notification presenter still implements manual API32/33/36 behavior.

Both settings renderers omit Cookie instellingen before display: XML retains its
required binding IDs with GONE visibility; Compose skips the whole owned row and
divider. Only the cookie click selectors are fenced. The shared cookie presenter
and its asynchronous completion observer remain for user-selected embeds and
puzzles. Automatic player CMP skips to the existing player-ready path. No patch
writes acceptance/rejection, grants a permission or replaces vendor choices.

## Verification and limits

Original plus ads-only, tracking, consent and combined selections pass the
independent verifier. Each selected output passes FULL patch reporting, APK
signature verification and decoded code/resource checks. Assets and the three
native split libraries retain their original hashes. The functional manifest
retains its original graph outside declared collection/job/packaging edits.
Two icon references require narrow normalization: the original and output binary
manifests both refer to `0x7f080321`, supplied as `drawable/ic_notification` by
the density split; base-only apktool prints `@null`. Other icon or service changes
fail the normalization regression tests.

Native fixtures execute Pinch reset/current/stale failure handling, copied player
options, consistent vertical list/index paths, real Google callback constructors
and Runnables, NMO coroutine failures, both Piano deletions, Pinch OM monitor
completion, post-TCF handoff, and CCT filtering/empty deletion/mixed retry. They
also execute fresh/retained automatic consent decisions, native onboarding
completion, both settings rows, manual notification requests and manual privacy
presentation. Android rendering, network/backend IO, scheduler admission and SQL
execution are bounded fixture interfaces. Intervening retained TCF decoding and
some downstream callback consumers are source/graph checked rather than fully
executed. No physical-device or decrypted-traffic acceptance is claimed.

West candidate validation before the upstream stable sync on 31 October 2026: **292 Python tests** (16 environment-specific
skips), **26 release integration tests**, **66 app-page template checks**, strict
bilingual documentation build and **69 matched page pairs / 139 HTML files**.
The compiled candidate retains **364 prior class/extension/native payloads**
byte-for-byte from `v1.29.0-dev.1`; new executable payloads belong to West, with
the containing DEX/module metadata rebuilt. The subsequent stable v1.29.0 sync
also carries the already-published KIJK Android implementation; all 15 West
class payloads remain exact.

Reproduce with JDK21, the Android SDK and the exact complete original input:

```sh
python3 -m unittest discover -s tests
python3 scripts/validate_targets.py west /path/to/omroep-west.apks --bundle /path/to/candidate.mpp
```

Test cold start/relaunch, feeds and articles/history, phone/tablet layouts,
ordinary/vertical/live video and radio, pause/resume/destroy/cast/Auto, real
notifications/deep links, widgets and user-selected embeds. Remote HTML/scripts,
overlays, SSAI and undiscovered collectors require runtime investigation. No
subscription, premium access or server-withheld article delivery is created.

## Published development artifact

[v1.30.0-dev.2](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.30.0-dev.2)
publishes the three default-on controls for 20.1/10596. Downloaded bundle SHA256:
`0eb1f0b95b6819f699e27df273dffec7ec3255c659b569275af0252ec84871b4`.
All 15 West class payloads match the locally verified candidate byte-for-byte.
Applying that downloaded bundle to the complete original APKS with all three
controls passes the patch report, output signature and 1,029 native method graphs
and semantic/resource fixtures. Release workflow 41153568749 completed successfully.

After the stable sync, 298 Python regressions pass (17 environment skips);
the final bilingual guides pass 68 app-page checks and 73 matched page pairs /
147 rendered HTML files. These checks add no physical-device or traffic claims.

## Region-only startup and inline newsletter followup

Device feedback showed the welcome and notification-preference pages were still
unnecessary. Skip consent screens now leaves only the native region/interests
page in fresh and upgrade startup. When no regions are available, an external
label bound to the original pager continuation selects native completion before
an empty adapter is attached. Existing manual notification settings remain.

Region selection was originally persisted while leaving the notification page.
A consent-only helper now reads the selected region IDs from the native state
and calls the original region preference writer before native completion. Its
real sorting, CSV preference write/removal and cached value behavior are retained.
It preserves choices when no region list is available and supports deselecting
all available regions. It does not invoke the mixed notification updater,
subscription coroutine or notification flag setters. Native notification
preferences retain their default false values on fresh installs and existing
saved values on upgrades.

Hide ads omits the entire native newsletter component through the controller's
false/absent-component return, preventing its owned feed spacing. The direct
newsletter builder returns before creating either its heading or signup form.
The separate manual newsletter settings screens retain their original code.

The regressions reproduce the previous release's extra startup pages and inline
newsletter rendering. Emitted fixtures cover both last-region completion routes,
actual region preference edit/apply/cache/removal, notification keys unchanged,
empty-region completion and the newsletter's false result without builder calls.
Android rendering and final device acceptance remain the user's test boundary.

Followup validation: original plus all four FULL selections pass reports, output signatures and 1,037 native method graphs. The independent reviewer reproduced the emitted region-persistence and continuation behavior. The 298 Python regressions pass (17 environment skips). Non-West class/extension/native payloads remain byte-identical to v1.30.0-dev.2.
