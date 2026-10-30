# TVgids.nl 7.0.16 implementation audit

**Stable v1.19.0:** the user approved release, including consent-screen removal.
[Destinations, data and remaining services](privacy/tvgids-nl/README.md).

## Input and ownership

- Package `nl.tvgids`, version **7.0.16**, code **106691**, minimum SDK **26**.
- Original standalone APK SHA-256: `10a2672434fca0b4143e23606e83a8a5cefd6828be8808d63b1777eca7510ac7`.
- Publisher certificate SHA-256: `3d945a319ab73ffdcae24f3b9bf031891f4e362160c83bc8e5369a1a4ceb638f`.
- Required native ABIs: arm64-v8a, armeabi-v7a and x86_64. All three original
  images are validated before a native write. ELF architecture, executable
  PT_LOAD mapping, bounds/alignment, function hashes and preimages are checked.
- Ad and tracking edits have separate ownership. Together, 63 fixed-size regions
  restore the exact original images. The other 21 native libraries stay unchanged.

Android edits use exact descriptors, flags, total registers and instruction
counts. Independent checks pin 270 original method graphs/register ABIs and
restore only declared edits. Manifest restoration checks advertising metadata,
permissions and disabled providers against the original document.

## Public controls

Both **Hide ads** and **Disable tracking** default on. Disable tracking depends on
Hide ads. Hidden policies have no separate user-facing catalogue entries.

Hide ads removes six root box builders, the sliver delegate's four reserved
extent/padding fields and the ad-only configuration fetch through its genuine
initialized asynchronous null-return path. The home factory changes only its
existing branded and adslot branches, before promotional/fixed-height wrappers
are allocated. Other editorial/unknown branches keep their original instructions.
The NLZIET promotional bar is removed; deliberate provider links remain.

Native ad guards stop SDK startup, constructor scheduling/video surface, later
load scheduling and the late ad Runnable. Cancellation, valid views, one native
channel reply and disposal/unregistration remain. Google Ads auto-initialization
is disabled. No loaded/impression event or backend response is fabricated.

## Tracking boundaries

| Surface | Implemented behavior and completion |
| --- | --- |
| Native OSB | Stop session randomness, advertising-ID lookup, events/context/IDs, permission-dependent location and resume/upload work. Guard only the OSB discriminator in the merged Runnable. Discard old in-memory queue records and guard the final void HTTP sink; no send acknowledgement is invented. |
| CMP and manual privacy | Keep configuration, lifecycle registration/pause cleanup, storage and validity handling. The manual URL uses an empty `cduid` without reading a cached ID, GAID or Android-ID fallback. Its existing success/error branch completes once instead of falling through to a second reply. Remote CMP acceptance is untested. |
| Dart background handler | Gate before device-ID lookup, User-Agent/payload construction and the independent `received_background` POST. Shared Firebase setup, validation and image-cache cleanup remain unchanged. Use a shipped null/ReturnAsync tail on the initialized frame/Future. |
| Comscore | Stop Dart start/init/page/FPID publication and native Analytics/configuration admissions. Queries return typed disabled values; other operations report `tracking_disabled`. The identifier stream ends through an atomic one-time protocol operation with active-sink identity checks. Late callbacks/cancel do not activate Analytics. |
| Sentry | The real empty-DSN decision closes into NoOpHub. Native-support capability and integration activation are blocked while the application runner executes once and Futures complete. Central native init/pre-init and both inspected startup providers are guarded. The original manifest has no enabled NDK-preload key; no original NDK-loading observation is claimed. The configured DSN object value and native libraries remain. |
| Facebook | Clamp auto-event/advertiser-ID settings, anonymous event GUID, event processing, timers, flush/read/send and install/on-device attribution jobs. Skip the two attribution scheduling regions in the otherwise retained settings runner. Keep core auto-init, provider, settings and signed-in/out logger token/app context for authentication. |
| Firebase/FCM | Stop export/analytics eligibility, receive/open event collection and export re-enablement. Clamp only the export preference write in the merged runner; preserve apply, proxy-retention update and real Task success/error. Auto-init true/false, topics and message cases remain. No Analytics registrar exists in this input; optional delivery export is conditional/restored-state evidence. |
| Persisted CCT | Filter exact `FCM_CLIENT_EVENT_LOGGING` and `GDT_CLIENT_METRICS` names after the uploader appends client metrics. Preserve retained object identity/order and transport context/extras. An empty filtered batch takes native fatal3/-1 discard/deletion. Mixed batches keep real success/transient/fatal outcome handling, retries and original success cleanup. Unknown transport names remain deliverable. |

Facebook resources add two false policy flags and remove five advertising-ID/
AdServices permissions. Firebase adds false delivery-export metadata. Functional
Firebase providers, installations, tokens, topics, notification routes and local
reminders remain. Advertising dependencies are blocked by Hide ads.

## Genuine consent-state checks

The actual IAB writer, bit iterator, Google-consent converter, staged preference
editor and raw readback execute in the fixture. Both manual setter channel routes
complete once. Grant-to-reject updates consent bits and clears old restrictions;
unrelated preferences remain. Invalid input removes consent fields, retains the
original gdprApplies jurisdiction value and raw input, and fails validity checks.
The original API's storage acknowledgement is not a validity or delivery claim.

The original converter always stores local `ANALYTICS_STORAGE=GRANTED`.
Tracking admissions remain blocked after grant and rejection. That cached label
alone cannot establish an active collector or upload. The TCF decoder is an
explicit SDK boundary supplied with fixture inputs/decoded fields; the fixture
does not manufacture a real accepted consent string.

## Verification and limits

The implementation passed original and selected FULL apply/rebuild/sign/decode
checks, including the real named tracking-only dependency closure and combined
selection. The retained ads-only and unselected FULL APKs pass their respective
original tracking baselines. Actual SDK/native guards pass 73 native-policy and
66 input/selector assertions, including rejected inputs remaining unchanged.

The bounded CPU checks cover 408 ad assertions, 21 background completion
assertions, 63 Comscore assertions and 57 Sentry assertions across all three ABIs.
The Android fixtures cover ad lifecycle/replies, OSB/location/queues, native
Comscore/Sentry, Facebook, FCM, persisted batch outcomes and manual consent storage.
Original desired-policy failures and targeted negative mutations were witnessed.

VM allocation/async scheduling, Android storage/thread/registry interfaces, TCF
parsing, wire encoding, HTTP and selected SDK boundaries are explicit models.
Unchanged shared initialization prefixes are pinned where the fixture resumes a
later continuation; they are not a complete Android/Flutter event-loop execution.
These checks establish the stated method/control-flow boundaries, not phone
rendering, real push delivery, authentication/backend acceptance or traffic silence.

Guide/account APIs, editorial assets, remote embeds, manual privacy and functional
messaging still exchange data. Unknown banners/transport names remain. Cached
local history and provider-held records are not globally erased. No subscription,
purchase, consent grant, authentication token or successful send is synthesized.

## Source evidence

The [research report](research/2026-10-28/tvgids-nl.md) records the input,
architecture mapping and original call paths. The privacy README distinguishes
app-wired, configured and SDK evidence from captured transfers.

Additional exact-build destination anchors: Facebook `pm1` initializes the
`facebook.com` domain and `e82` builds Graph URL templates; optional event/install
paths are `ys`, `ns`, `om1` and `xn1`. CCT `f80` decodes its two configured URLs
through the shipped interleaving helper; `vc0` selects the default URL. FCM `qs.c0`
constructs delivery fields and selects the transport. Functional Installations
`pq1` and FCM registration `vg4` contain their HTTPS endpoint templates. Tink's
`type.googleapis.com` protobuf identifiers are type names, not network destinations.

Implementation: `patches/src/main/kotlin/patches/tvgids/`.
Independent fixtures: `tests/tvgids_*` and `tests/verify_tvgids*.py`.

## Local verification before the v1.16.0 integration

The unpublished local **1.15.0-dev.2** snapshot contained 92 controls across 22 app targets, including the
approved Android TV apps from main at `39ce47a`. Main and dev history through
`ea7c2a9` were retained. All 83 metadata records and all 210 class payloads from
stable v1.14.0 remained unchanged. Against published 1.15.0-dev.1, 87 metadata
records and 230 of 231 class payloads remain unchanged; the sole changed existing
class is the user-requested normal/default-on Marktplaats ThreatMetrix control.
The two new Marktplaats controls and TVgids payloads account for the additions.
There are no removed archive entries. Existing TV/signature extensions and the
MapLibre native image remain byte-identical.

That local snapshot passed the normal TVgids release validator for original,
Hide ads, Disable tracking with its dependency closure, and both controls. Each
selected output is FULL rebuilt, signed, independently decoded and checked.
Input/native SDK guards pass 73+66 assertions. The whole Python suite passes 156
tests; the six release-branding Node tests and strict bilingual documentation
checks passed. The site checker covered 58 paired pages and 117 HTML files.
These are build/source checks; TVgids phone acceptance remains outstanding.

Local tested bundle SHA-256: `ccd6576a721fb24fa8c836a1bac2001dc690b049f5a9e19ff2ae73a8be6c8c35`.

## Candidate after stable v1.16.0 and dev v1.17.0-dev.1

The **v1.17.0-dev.2** candidate contains 92 controls across 22 app targets. It
retains main `ea40f6b` and dev `5dcafaf`, including the dev-only status of 9292.
All five Marktplaats controls are enabled by default.

The downloaded stable v1.16.0 and dev v1.17.0-dev.1 bundles were checked against
their published asset digests. Against stable, 85 of 86 metadata records and
224 of 225 class payloads remain identical. Against dev, 87 of 88 records and
230 of 231 classes remain identical. The single changed existing control/class
is the requested normal/default-on Marktplaats ThreatMetrix control. New
payloads contain TVgids and the two Marktplaats follow-ups; 9292 is retained
from dev. No archive entry is removed. Existing TV/signature extensions and
MapLibre remain byte-identical.

All 255 class payloads **and the aggregate DEX** match the earlier fully tested
local snapshot byte for byte. Its original/Hide ads/Disable tracking/combined
FULL rebuild, signature, decoded-method and all-ABI CPU evidence therefore
applies to the same executable code; these unaffected cases were reused. The
new candidate build passes, and its SDK input/native guards pass 73+66 assertions.
The Python suite passes 156 tests, Node passes six tests, and strict bilingual
documentation and local-link checks cover 58 page pairs and 117 HTML files.
These checks do not establish TVgids phone acceptance or successful Google login.

Local candidate SHA-256: `1b39727ed3eea987df53256097123ea7c484e5b43725dadbf45d0201b5191c80`.

Pinned implementation and independent fixtures: [patch source](https://github.com/johnneerdael/dutch-applications-patches/tree/72560c069deb7010fc56e25ac9a37839d3da2b16/patches/src/main/kotlin/patches/tvgids) · [verification entry point](https://github.com/johnneerdael/dutch-applications-patches/blob/72560c069deb7010fc56e25ac9a37839d3da2b16/tests/verify_tvgids.py).

## Published development release

[v1.17.0-dev.2](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.17.0-dev.2) was published on 29 October 2026. The downloaded bundle’s SHA-256 is
`623df812a1f0801d2d368a4eb75b751bf473488f614fdc20e63767bababe6269`.
Every DEX, class, extension and native payload matches the tested candidate
byte for byte. The only archive-content difference is its manifest build
timestamp. Release metadata, all five Marktplaats defaults, the dev feed and
GitHub’s signed build provenance were verified. Provenance identifies the
release workflow on `dev` at source `9802237af8b3c165b8fa87c2cf9e065b9ae31ae8`.


## Automatic consent-screen removal

The new default-on Skip consent screens control depends on Disable tracking and
Hide ads. It gates the actual Dart automatic consent-navigation closure after
`InitAsync`. For `forceCmp=false`, it takes the original typed-null `ReturnAsync`
tail before CMP URL creation or navigation. For a manually requested consent
screen (`forceCmp=true`), it restores the displaced parent load and resumes the
original path. Local preferences are still read; no accepted or rejected consent
response is invented. Optional collectors remain blocked by the dependency.

All three packaged ABIs are guarded against original bytes before mutation.
The trampoline uses the automatic-only block without shifting native calls or
safepoints. FULL build/sign/decode checks cover the combined selection, each
independent control and dependency closure. Native execution passes 54 consent
cases across the three ABIs, including the retained manual route; nine deliberate
mutants are rejected. The original automatic route fails the new no-navigation
expectation on all three ABIs. Earlier ad/tracking-only native outputs remain
byte-identical. The broader SDK checks cover 95 native and 74 original-input
assertions. Independent review found no remaining issues. Final consent-screen
acceptance on the phone remains open; the user reported the other behavior works.


The consent fix is published in
[v1.19.0-dev.1](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.19.0-dev.1).
Its downloaded bundle SHA-256 is
`ae53c40e5d0439bbe8d322f41fc32e1acc2bf6d66f7c63932bff65d2790182ff`.
Every archive entry except the manifest build timestamp matches the local tested
bundle. A fresh combined FULL rebuild of that candidate passed all three ABIs,
including 18 native consent cases per architecture and the retained manual path.
The integrated Python suite passes 177 tests; release-branding checks pass six.


## Stable approval

The user approved TVgids.nl for main after the development consent correction.
Stable v1.19.0 contains all three default-on controls. Its 25 TVgids class
payloads match the approved v1.19.0-dev.1 bundle; all 92 previous stable control
records and 236 previous class payloads remain unchanged. A fresh stable FULL
rebuild/sign/decode passes the original baseline and the combined controls on
all three ABIs, including 54 native consent cases. The Python suite passes 169
checks. Source/SDK domain evidence above remains distinct from captured traffic.
