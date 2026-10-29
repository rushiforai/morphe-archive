# Dumpert 5.8.0 development audit

Target: `nl.dumpert`, **5.8.0 / 22001778**, minSdk32, original Play APKS.
The original-input guard checks package/version/code/minSdk and publisher signer
`0370088e565d42bd3cfca2bad7c7293cfb6090de2f7fa45c2bc5a087140a2db5`.
Every mutating dependency consumes that guard. Exact descriptors require one
match. The two internal ad decisions also check original instruction counts,
register layouts and opcode/field/literal anchors.

Original APKS SHA256:
`7e1e485c2f26e4ad8271047b8c5f97ceee424b8870cf6059d71f7edfdb23caf6`.
Base APK SHA256:
`7fd642aa24ea1915f2d10e692e8f563464688b1e46edf0b1f5c1c4289b922316`.
The [research report](research/2026-10-28/dumpert.md) describes original findings;
its historical implementation-pending statements refer to that earlier phase.

## Controls and functional boundaries

Three controls: **Hide ads**, **Disable tracking** (includes ads), and
**Skip consent screens** (includes both). No Deluxe, account, consent,
purchase/acknowledgement, reward or token-refresh result is fabricated.

Feed injection takes the original interval<=0 branch and calls the actual
`createItemSlot` for every editorial item. Empty input stays empty; 21 input
objects become 21 typed slots in their original order and identity. The common
ad composable exits before starting a Compose group or creating its ad VM.
Detail and Shorts return supported nullable ad attachments; Shorts keeps page
navigation/coordinator calls, ordinary URI preparation and repeat mode. Genuine
ad-error cleanup still clears its latch/loading/player state, cancels its
watchdog, restores looping and records the actual shown/failed result.

Tracking suppresses central analytics, the separate first-party PostRec sender,
optional PPID/Advertising ID/App Set acquisition, Piano targeting/segments/ID
association and the audited Firebase/Facebook/Comscore paths. Runtime setters
cannot re-enable Firebase collection after consent or startup changes. Optional
diagnostic sends, session-settings fetch and push statistics are separately
gated; genuine push, authentication, installation, remote player configuration
and Facebook login retain their initialized services.

Piano's original eager StateFlow and singleton remain. Segment fetches return
typed empty lists. Pageview completion uses the original local UUID String
fallback and stores the identical String in `lastRndValue`; returning Unit
would break its Compose consumer. PPID resolution returns native null;
advertising/DMP getters return nonnull empty Strings. Identifier prefetch
completes Unit before its mutex. LAT=true is an explicit privacy choice.

All four Piano queued send leaves invoke the original private two-argument
callback converter with actual EventRecords and no exception. Its real
customId/isSent values reach EventStatus and the actual callback. Records are
not marked delivered; old unsent records may remain until native expiry.
Schedulers and ordinary executor completion remain intact.

Comscore retains `Setup.setUp`, its nonnull Java helpers, logger and completion
state. Only private native-acquisition `Setup.b()Z` returns false, taking the
supported native-load-failure path; inspected configuration/native consumers
already catch UnsatisfiedLinkError. Native declarations are not rewritten.

Consent skipping changes only automatic `setupConsentUI`. Didomi initialization,
readiness callbacks, real vendor/purpose state/listeners and explicit manual
preferences retain their original bodies. No acceptance/rejection is written.

## Account/promotion follow-up

The user reports the original development controls work, but showed a remaining
subscription banner in settings/profile and the subscription pane, plus Free
and advertising copy. The banner's apparent “Subscription enabled” line is
static original promotional copy, not evidence of a purchase.

Hide ads now stops the shared `premium.ui.settings.PurchaseAdFreeBanner` before
any Compose group opens. Guest More, signed-in More and the subscription pane
all call it. The existing free card retains its native themed layout, uses
localized `purchase_screen_title` (Dumpert Deluxe) and `premium_account` (ad-free)
resources, and displays an empty price instead of Free. The signed-in header
uses the same native ad-free subtitle while keeping the real username.

These are local presentation edits. Premium state flows, real account/JWT,
IapProduct metadata and paid-branch selection remain original. Real subscribers
keep the original ActiveSubscriptionCard and management action. Free users
receive no fabricated product or management row. The null-product loading
branch and all caller-owned Compose/restart/default handling stay intact.
Sixty-two additional original binary/canonical contracts pin the changed UI,
its callers and genuine account/product/billing consumers (387 total). Checks
restore only six display instructions before hashing the original graph; the
shared banner adds one pre-Compose return. Native paid-product fallback and
both subtitle branches are also executed by the decoded verifier.

All four individual/combined selections pass Desktop FULL, report, signature
and decoded verification with all 387 contracts. The regression suite passes
72 tests. Fresh independent review found no code issues; a verifier-only
R-field final-flag assumption was corrected with RED→GREEN evidence. The tested
bundle adds one Dumpert class and changes AdsPatchKt plus the combined DEX;
143 previous code payloads are unchanged. The catalog retains all 64 controls
and compatibility entries, with only the Dumpert description updated. No RTL
class or DEX definition is included.

The user's report is partial device acceptance of v1.9.0-dev.1. Visual spacing
and this UI follow-up still require a phone check. No device install/reset
was performed. Existing tracking destination disclosures continue to apply.

## Privacy transparency and remaining exposure

The [README destination table](../README.md#dumpert) names the
domains, purposes/data, suppression and retained exposure. These are traced
source/SDK/native findings, not a capture proving each domain received traffic.

IMA/player initialization remains: detail creation unconditionally dereferences
its initialized AdsLoader, so replacing that dependency with null would break
ordinary playback. The patch suppresses native ad requests/attachments, not
every SDK initialization request. Local fallback UUIDs, functional Firebase/
Facebook configuration, publisher services and CMP configuration/preferences
can still exchange necessary metadata/identifiers. Optional CMP metrics were
not independently isolated, so total CMP telemetry suppression is not claimed.
Remote social-player scripts and HLS/SSAI or server-stitched advertising remain
unverified. Executable embed/consent assets are preserved; this is not a general
WebView or network-domain blocker.

## Independent verification

Before the corresponding production edits, 325 core/SDK method hashes and exact declarations
were pinned from original smali and cross-checked against actual binary DEX.
The verifier checks owned prefixes/edits, retained instruction graphs, actual
DEX class/interface/static/private-direct contracts, register aliases and real
return types. The binary index avoids opening every decoded file solely for
declarations; without an APK binding a strict smali fallback remains available.
The index does not replace behavior checks or FULL validation.

Retained pins include real account/JWT/Deluxe/Billing, kudo/favourite mutations,
playback/Cast/watchdog/looping, privacy readiness, native-load failure consumers,
53 functional manifest components and ten executable embed/consent assets.
Manifest hashes normalize indentation and attribute order while preserving
semantic attributes and children. Actual emitted instruction execution checks
the no-ad mapping, nullable player branches/cleanup, typed synchronous returns,
real queued EventStatus conversion and later consent/startup re-enable attempts.

Validation status: all four individual/combined selections passed Desktop
FULL, patch-report, signing/signature and independent decoded checks. The whole
Python regression suite has 68 passing tests. Independent review is complete;
its material persisted-queue finding was fixed and revalidated. The catalog
contains 64 entries: 61 existing entries unchanged plus three Dumpert controls.
All 137 existing compiled class/extension payloads match the published baseline.
After integrating the release-only v1.8.0 backmerge, all 145 code/DEX/extension
payloads exactly match the corrected four-selection-tested candidate. Publication is verified below. Phone acceptance is
pending and is not inferred from static checks.

Phone testing should cover fresh/relaunch privacy UI, Home/search/comments/
Shorts mapping, ordinary/detail/Shorts looping and Cast, real guest/login/logout,
kudos/favourites/comments/uploads, actual purchase cancel/pending/restore,
manual privacy/push preferences, background/foreground and remote embeds.
Re-signed account/Billing acceptance remains a device-test boundary; preserving
code does not establish server acceptance of the changed signer.
On-device traffic capture is still required to measure residual transmissions.

## Final review and persisted telemetry correction

The independent review found that stopping collection did not cover older
DataTransport batches restored by WorkInitializer. The corrected CCT boundary
filters exactly `FIREBASE_CRASHLYTICS_REPORT`, `FIREBASE_APPQUALITY_SESSION`,
`FCM_CLIENT_EVENT_LOGGING` and `GDT_CLIENT_METRICS`. Remaining EventInternal
objects retain their identity/order and the exact original request extras.
One-shot iterables are materialized once into the forwarded request. All-filtered
batches return the original `BackendResponse.fatalError()`: the unchanged Uploader
then invokes SQLiteEventStore's native DELETE path, retaining the fatal status.
No delivered success, purchase result or acknowledgement is invented.

Twenty-two additional original contracts pin the send/response/builders,
persisted-context scheduling, Uploader response processing and SQLite deletion.
Emitted checks cover mixed/all-filtered/retained-only/one-shot inputs, actual
HTTP success/fatal/transient/invalid response mapping, original response identity,
restart scheduling, native deletion and genuine retry behavior.

Re-read `CCTDestination.<clinit>` and its StringMerger operands independently
identify `firebaselogging.googleapis.com/v0cc/log/batch` and
`firebaselogging-pa.googleapis.com/v1/firelog/legacy/batchlog` as SDK endpoint
alternatives. This is source evidence, not captured per-phone transfer.

Known `CAST_SENDER_SDK` and `PLAY_BILLING_LIBRARY` diagnostic transports remain
pending their complete callback/lifecycle audit. Their payload fields have not
been fully inventoried. This residual is disclosed in README; it is distinct
from preserving genuine Cast/playback and purchase outcomes.

Deferred minor: the bounded test interpreter compares some reference values as
Python values and can conflate empty references with null. No current production
regression was established. Queue fixtures exercise explicit zero/null versus
nonnull BackendRequest objects and separately assert event identity; this is
not presented as a general Dalvik emulator.

The corrected candidate passed all four individual/combined FULL/report/signature/
decoded selections with all 325 contracts and queue/restart/response/deletion
checks. The regression suite passed 68 tests. Published-asset verification is complete below.

## Published development delivery

Published [v1.9.0-dev.1](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.9.0-dev.1)
through [Release run 40720478728](https://github.com/johnneerdael/dutch-applications-patches/actions/runs/40720478728).
Python checks, release build and attestation completed successfully. The
6,088,275-byte MPP has SHA256
`0d9b418103603c30e9185c5dbe35b009cf25750c61ea759283962f7a9d12e59e`.
All 145 published class/DEX/extension payload hashes exactly match the fully
validated corrected candidate. The 64-entry catalog and versioned feed/README
links are verified. Existing entries and compiled app payloads are preserved.
Phone acceptance remains pending; this increment was published to dev only.


## Published account/promotion follow-up

Published [v1.9.0-dev.2](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.9.0-dev.2)
through [Release run 40730384734](https://github.com/johnneerdael/dutch-applications-patches/actions/runs/40730384734).
Regression tests, build and attestation completed successfully. The
6,093,314-byte MPP has SHA256
`f2f24543ea2426126d1eeb6c0869e480ce39c2013de7c3ae60763b6328ab8000`.
All 146 published class/DEX/extension payloads exactly match the tested UI
candidate. The 64-entry catalog, versioned feed and unchanged main boundary
are verified. Independent DEX inspection confirms no RTL implementation was
included. This follow-up remains dev-only; settings/profile/subscription card
spacing and accessibility await the user's phone check.


## Device approval and stable-promotion PR

On 2026-10-28, after delivery of v1.9.0-dev.2, the user approved Dumpert and
requested a PR to main. This supersedes the earlier pending device-acceptance
status for the delivered increment. The approval includes the local ad-free
account presentation and removal of subscription promotions. It does not
establish testing on every device, every billing scenario or a complete
runtime packet capture; the retained-service disclosures still apply.

The dev-to-main PR promotes these approved Dumpert controls with the existing
approved application set. Further RTL implementation stays on its feature
branch and is outside this promotion.
