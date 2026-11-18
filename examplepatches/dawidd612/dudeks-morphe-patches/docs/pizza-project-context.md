# Pizza: persistent project context

## Sponsor extension removed at user request - 2026-10-29

The user explicitly withdrew only the 1000 PNN offers / 10 gems-per-reward patch.
Remove it from all supported Pizza targets, including 5.59.0 and 5.59.2. Do not
restore this feature during future version updates. The game now owns its normal
sponsor cap and reward quantities. Skip rewarded ads, MicroG, Hide paid offers
and Non-blocking update notice retain their existing behavior.

The sponsor patch class, profile settings, native payloads, generator and its
specific instruction test are removed. Notice variants that consumed PNN output
are removed too; the previously verified original/hidden notice variants remain
byte-identical. Existing saved balances are not edited. Already installed APKs
need repatching from clean input and a same-key update to remove the old code.
Historical release notes/evidence below describe older bundles.

Local verification passes: build (24s), four remaining default Pizza patches,
no sponsor class/payload/metadata entry, 36 unchanged scoped entries and exact
remaining native-transform parity with the previously verified variant. The
normal counter, payout, animation and allocation instruction ranges match the
original game. Only the removed profile property and related source-line debug
metadata change. Prior unchanged notice/runtime evidence is reused; no new
Android runtime test is claimed for this deletion-only change. Published [v1.39.1](https://github.com/dawidd612/dudeks-morphe-patches/releases/tag/v1.39.1)
through PR #41, merge40d7edf and release commit d3a92da. All three PR workflows
and release40936927885 pass. Downloaded MPP SHA256:
d373b369ce3541389317262e89948560d87d354b92fa9b65961dee8715de5882.
SHA256SUMS, ZIP integrity and GitHub attestation pass. All43 scoped entries
match the tested bundle (two text resources require CRLF/LF normalization).
Both desktop and Android code contain no sponsor patch/payload/settings, and
published metadata has only the four retained Pizza patches. Existing balances
were not edited; repatch clean input and install with the same key to remove
old code from an already installed game. Private evidence:
E:/Codex-Morphe-Pizza-Remove-PNN-20261029.

## Pizza 5.59.2 / automatic intake / short update toast - 2026-10-29

The latest verified live APKMirror release is 5.59.2 (2337), ARM64. The agent
obtained the complete original itself: browser download completed after closing
the actual Google vignette Close ad control and awaiting the final here-link
download event. No cookie export, CAPTCHA solving or manual user download was
required. Canonical procedure: [apkmirror-download.md](apkmirror-download.md),
helper scripts/apkmirror_download.py. BROWSER_REQUIRED is an agent browser
handoff, not a request for the user. This workflow also has a local project
memory pointer at .serena/memories/workflow/apkmirror-intake.md.

Original SHA256: ea0fd7c38af20c4f8e8c083f2991db4ee18c3d5cd8c2ec8f347d1fcca029ae39.
The TapBlaze signer is verified. A checked copy is in Downloads as
Good-Pizza-Great-Pizza-5.59.2-2337-original.apk. Originals/provenance remain private
under E:/Codex-Morphe-Pizza-20261029/intake. The intake helper verifies ZIP,
manifest identity, each publisher signature and declared APK inventory from
XAPK split_apks or APKM MANIFEST.MF. Ten tests cover missing asset splits,
incorrect signatures, HTML and other failures. Three real APK/APKM/XAPK inputs
pass. Container metadata consistency alone does not authenticate XAPK metadata;
version-specific game preservation checks remain necessary.

5.59.2 contains no PairIP classes, protected VM callers or uninitialized string
holders. The explicit unprotected profile retains original SDK/native startup
and exact native-hash guards. Older profiles retain their bootstrap resources.
All five default patches target 5.59.2, including 1000 PNN rewards with 10 gems
and the new optional short update notice. The notice changes only the UI branch
and invokes the existing continuation/cleanup; server status and account,
authentication, billing and purchase results remain intact.

Native tests pass all four notice variants (16 scenarios each, repeated), PNN
999-to-final-PNN2/10-gem behavior and both finalizer orders. Legacy 5.59.0 PNN
output is byte-identical. Final build and clean FULL patch pass after correcting
the copied Coffee single-return assumption to Pizza's accepted-Activity store.
Retain patch-failure-activity* evidence. Native output with all options:
454720c8fe82345d45fb689b6317d106b244036152e99e5d470ac408fb47032a.
All 6736 assets/32 libraries are preserved except that exact reviewed library.
DEX checks preserve 70 bridge, 3360 auth/SDK and 2137 executable billing methods,
plus 23 availability/result/activity methods. A real const-string/jumbo repool
false positive prompted width-independent branch/handler parity; its fixture
passes RED/GREEN and still rejects changed values/targets. One independent
review is closed, including narrow reviews of these reproduced corrections.

The retained disposable Debug key supports install-r from 5.59.0 without wiping
data. Before update, the copied account's 334-entry archive was verified and
retained. Original Account AVD5554 was not started or modified; its older missing
signing key was not replaced. API35 Debug5556 normal APK acceptance passes
startup, linked TapBlaze UI and actual day clock in54.9s, 11 memory-only OCR
frames, zero saved images and zero app fatal markers. This is reuse-running
AFTER separately observed Google/MicroG setup (cancelled with Back), a genuine
free New Update gift overlay (Claim), and Monster Mash (Back, no event entry).
The initial three setup-blocked attempts are preserved; do not claim54.9s as
total install/cold-start time or as uninterrupted fresh-process Google login.
Future agents should inspect known foreground/modal state once and close the
recognized setup overlays before starting the short acceptance, rather than
waiting out the same menu timeout repeatedly. No ad/purchase/order test was run.

The focused forced-update gate passes: real toast shown and hidden in2.558s,
then the same process7300 reaches the actual game menu, with zero app fatal
markers. The game caches last_update_check for720s. The successful private probe
bypasses only that cache branch and forces callback register3, without changing
stored status/account fields. APK-backed mappings require exact ELF-header
discovery. The first two probe observations (filename mapping and cached query)
are excluded from successful toast evidence. Normal installed APK bytes and
manifest remain unchanged; probes are not distributed. See runtime-verification.json
and notice/native-verification.json for actual evidence and reproduction.

Private evidence, keys, original/final APKs and logs: E:/Codex-Morphe-Pizza-20261029.
Local-only tools/morphe-local-env.ps1 sets the discovered JDK/SDK and, with
-ForBuild, obtains existing gh credentials only in the process environment.
No real Google sign-in/cloud restoration, phone ARM64/API36, ARM32 patch runtime
or paid checkout is established. Real-money checkout remains cancelled.
Published [v1.39.0](https://github.com/dawidd612/dudeks-morphe-patches/releases/tag/v1.39.0)
through PR #40, feature bdccc38, merge c9ef703 and release commit 7855ccc.
All three PR checks and release run 40932244602 passed. Downloaded MPP SHA256:
485c0b501dfd7bb2ba01710030144436e75eca25f874e5eebce2be6fc68d56b4.
SHA256SUMS, ZIP integrity and GitHub attestation verification pass. All 52 scoped
Pizza/Android DEX entries match the tested bundle; only two text resources need
CRLF/LF normalization. Every binary entry is identical. Published metadata has
five default, non-experimental 5.59.2 / 2337 ARM64 targets and latest-only notice
support. Release notes preserve the actual runtime scope and limits. The Debug
AVD and its temporary Frida server are stopped; original account5554 is untouched.
Detailed verification: release-verification.json beside the private evidence.
Earlier unrelated working edits and the existing named stash remain preserved.

Working agreement: see the root `AGENTS.md` (authoritative instructions).

## Restored PNN sponsor patch - 2026-10-25

The user requested restoration for the latest local supported Pizza,5.59.0
(2322) ARM64, then increased each completed sponsor reward to10 gems and
explicitly authorized immediate publication. The default-selected optional
1000 PNN sponsor rewards patch supports only that reviewed profile. It uses
999 PNN completions plus the original final PNN2 offer, per NewsLayer rather
than a persistent daily quota. Skipping, final close, saved daily statistics,
other placements and paid-checkout cancellation remain unchanged.

Source build and clean-XAPK patch pass with all four Pizza patches selected.
Both actual emitted native variants pass ARM64 instruction tests for the
999-to-PNN2 boundary, success-only counter,10-gem payout/animation and original
state/register preservation. The original native input fails the counter test.
The emitted APK preserves all8162 shared non-signature entries except the
reviewed native library; unsigned signature-stamp metadata is excluded. The
combined native output SHA256 is
9f62c45affc8c0757bbf5d66863907f5a5a139910ef2b0a43d6418e3cdfdaefe.
Review found an older-Android InputStream API issue; it was fixed using the
existing DataInputStream/readFully idiom and the final build passes.

The previous artifacts/pizza-test.keystore is missing from this machine's
searched project/user/E: locations. Do not replace it, uninstall account5554,
or claim a same-key update was tested. Original account5554 stays unchanged.
For runtime only, the separate E: Debug API35 AVD5556 was backed up, installed
with a new disposable-only signing key and restored from the retained verified
account app-data archive. The APK has its normal manifest, without instrumentation.
Initial startup was blocked by MicroG's add-account page, then a seasonal
Monster Mash banner; both were dismissed without credentials or event entry.
The prepared running process passes startup, linked TapBlaze UI and actual day
clock in60.9s,10 in-memory OCR frames,0 saved images and0 app fatal markers.
This is --reuse-running acceptance after those setup dialogs, not a fresh
same-key account update or proof of1000 real ads/reward persistence.

Private evidence, unsigned/disposable APKs, both emitted ELFs and backup/key
are under E:/Codex-Morphe-Pizza-1000-20261024; original clean5.59.0 input and
account backups stay under E:/Codex-Morphe-Pizza-5590-20261020. The smoke reports
retain both setup failures and the passing smoke-ready run. See
pizza-pnn-1000.md for installation, behavior, source and test limits.
Published v1.37.0: https://github.com/dawidd612/dudeks-morphe-patches/releases/tag/v1.37.0
PR38 merged as79563d1; release commit b17cced. All three PR checks pass on
e37be4e and release40139396465, including attestation, passes. Downloaded MPP
SHA256:615a7a06c226145bc39d8feb922ad2ad5b6479971b6942bee93ba236b0fbae6d.
SHA256SUMS, ZIP integrity and GitHub attestation verification pass. All38 scoped
Pizza/Android-dex entries match the tested local bundle. Published metadata
selects the sponsor patch by default for only5.59.0(2322) ARM64. Release notes
state the per-layer counter,10-gem behavior, billing and runtime-test limits.
The disposable Debug AVD5556 is stopped; original account5554 remains running.
The previous signing key is still missing, so a same-key update of5554 remains
untested; recover that key before attempting one. No APK or account data was
published. The user's unrelated earlier working edits and named stash remain.

## Pizza 5.59.0 official support - 2026-10-20

PR37 now contains the complete, validated ARM64 profile for5.59.0(2322),
marked non-experimental. All three default patches reuse the existing registry.
Full build/clean patch, native/DEX/all-split preservation, actual PNN reward,
checkout cancellation, pepperoni preparation/serving, repeat starts, reboot,
offline recreation and disposable clean Day1 setup/relaunch pass.

The copied user API35 environment passes two force-stop starts, Home/resume
and two full reboots with real Google Play Games sign-in and server-auth
presence/scopes confirmed. TapBlaze account UI shows the existing linked session
(Log Out). Chapter3/Day56/funds496.98/gems181 are stable and the user explicitly
confirmed this is the expected save. Fresh credential entry, wiped cloud restore,
physical ARM64 devices and ARM32 are not claimed. Paid checkout still cancels;
some cosmetic promotions remain visible. No fake purchase success is introduced.

Published v1.36.0: https://github.com/dawidd612/dudeks-morphe-patches/releases/tag/v1.36.0
PR37 merged as90efcb9; release commit ee6b8eb. All three PR code checks passed
on ffc81da; the following90ced26 commit only fixes documentation encoding.
Release39480495633 and its attestation step pass. Downloaded MPP SHA256:
b8a42988cfefef13505e6a28eed782bb8bc74f4dcb91a40facff990be534c247.
SHA256SUMS, ZIP integrity and GitHub attestation verification pass. All30 scoped
Pizza entries match the tested local bundle, including Android classes.dex,
extension and all profile resources. Published metadata has three normal5.59.0
ARM64 targets. The final normal APK has8162 identical non-signature entries
to the full-matrix candidate; its fresh installation/80s launch passes real
Google/server authorization and no error markers. Chapter3/Day56 and wallet
pixels match the matrix. Leave copied account AVD5554 running; debug5556 is closed.

Details: pizza-5590-update.md and pizza-5590-provenance.json. Full private
evidence is ignored artifacts/pizza-5590-20261020 and E:/Codex-Morphe-Pizza-5590-20261020.
Original C: AVDs, signing key and verified backups are retained. The old installed
v1.34.0/game5.58 control has a separate PairIP/Play Store failure. Diagnostic
manifest-only debuggable copies were used solely for private backup reads.
Original local context edits are preserved in a named stash and patch and are
restored locally after this publication record, outside the release commit.

## Published replacement v1.35.2 - 2026-10-16

The user's full withdrawal and normal-release request is complete. PR #36
merged as a25fc93. All three PR CI workflows and release38828516707 passed.
Published MPP SHA256:147a3d7a678a588f05c0292c858b140d7743a5093d507bca24339df7233a365d.
Downloaded release ZIP integrity and SHA256SUMS pass. The bundle has no
extended-sponsor classes/payload/patch entry. Its three original Pizza patches
are default-selected and non-experimental for5.57.3/5.58.0 ARM64. New update
UI guards are integrated into the existing MicroG patch. Full5.58.0 combined
patching, emitted guard execution, auth/billing/reward parity and all-split
asset/native checks passed on the final candidate. Scoped stock availability
checks preserve26 methods; retain the raw-packaging limitation documented below.
No independent Android device reproduction was available in this session.

The release workflow successfully deleted abandoned releases/tags v1.35.0 and
v1.35.1 and the unchanged feat/pizza-day-start-1000 branch. GitHub release and
branch listings confirm withdrawal. Existing Git commit/PR history is retained.
The one-time retirement workflow step is removed after successful execution.
Release: https://github.com/dawidd612/dudeks-morphe-patches/releases/tag/v1.35.2

## Current change - remove extended sponsors and stop stock GMS update prompts (2026-10-16)

The user withdrew the extended sponsor feature entirely and requested a normal
non-experimental release repairing recurring Google Play services update UI.
Its implementation, payload, documentation and tests are removed. The original
native sponsor sequence is restored by simply omitting that optional patch.
Current supported inputs remain 5.57.3 (2277) and 5.58.0 (2301), ARM64.
The 5.58.0 profile is marked non-experimental at the user's request, following
their prior confirmation that the existing game/auth/reward patches work.

The MicroG patch now scopes stock GoogleApiAvailability update UI handling to
SERVICE_VERSION_UPDATE_REQUIRED (2) and SERVICE_UPDATING (18): its notification
entry returns without creating a notification or delayed availability retry;
its two error-dialog entries invoke the real cancellation listener once and
return. Other errors, actual availability results, real PendingIntent sign-in
and account/server callbacks retain their original bodies. Stock mode, with
MicroG support disabled, retains all original availability UI.

No device/ADB is connected in this cloud session. The observed APK flow can be
verified from emitted DEX; no runtime reproduction or attribution from device
logs is claimed. Verification completed on the full clean5.58.0 XAPK: all three original
Pizza patches apply together; the extended-sponsor patch is absent. The
notification/dialog DEX guard interpreter passes errors-1..24, nullable
listeners,50 repeated update requests and original-body/exception parity.
Existing reward,3412 authentication/SDK-method and2165 billing-method checks
pass. All67 input splits,36 native libraries and6653 assets are preserved.
The native output hash equals the original funds-store output exactly, with
no extended-sponsor segment. All13 asset-verifier regression tests pass.
A stock-mode clean-XAPK run confirms all26 scoped availability/result/activity
methods are unchanged. Its full integration verifier encounters duplicate
unrelated Deku outline classes from raw-resource packaging; this run does not
establish full stock-mode APK validity. No packaging behavior was changed.
Full MicroG-mode integration (the user's default selection) passes. CI and
publication remain pending.
The user also requested full withdrawal: the release workflow retires only
v1.35.0/v1.35.1 and the unchanged abandoned feature branch after v1.35.2 is
published. Commit history is retained; no history rewrite is performed.

## Pizza 5.58.0 update — runtime verification, 2026-10-06

User requested 5.58.0 and easier future updates using origin/main 053d72f.
The actual previous target is 5.57.3 (2277). Work is on codex/pizza-version-adaptive.
Pre-existing economy-context notes below are unrelated and remain local.

Input: Downloads good-pizza-great-pizza-5-58-0.xapk, 5.58.0 (2301), SHA256
6f4c6f9faa13265d0533aa61c8b294938cbfbf439e971ba162fb5e51d3b8dc6b.
All 67 APK splits passed integrity checks. Publisher signing SHA1 is unchanged:
828d99f1d85e52eb473af06d690f84ee72904330. All gpdeku/DPI/language/assets retained.

All three patches now use one manifest/version-code/profile registry. Resources
for each target contain exact initialization, SDK and visibility deltas. Games
clients, reward request/readiness and Tapjoy worker are found by behavior rather
than obfuscated class names; Context and R8 Object/cast layouts are supported.
Both targets are ARM64. Unknown native builds still require reviewed capture and
an explicit profile, not a guessed universal delta. See pizza-update-workflow.md
for read-only archive comparison, exact SDK recovery and ELF-driven reconstruction.
Metadata generation explicitly uses the current MPP even when older bundles exist.

Two independent original-signed debug starts recovered identical 1449 strings,
50924 executable bytes, 3794 constant qwords and 200 imports. ELF reconstruction
reproduces the reviewed native hash and rejects unresolved IFUNC pointers. See
pizza-5580-provenance.json for hashes, SDK URLs and exact bindings. Ad Quality
changed 9.9.0 -> 9.10.0. Five exact upstream receiver bodies (Fyber, Ad Quality,
Tapjoy14.6.0) and one Google basement18.10.0 ProviderInstaller task are recovered.
The task invokes the real installer and preserves Void[]/Integer bridging, both
original error codes and untouched post-execute callbacks. Real installation
returns0; injected unavailable17 and repairable2 return those actual codes.
No authentication result or paid entitlement is substituted.

Failure history is preserved under ignored artifacts/pizza-5580-20261006.
The initial four-method candidate crashed in plain offline Activity recreation.
SDK5 fixed that isolated case but failed the second user reboot (PID2795,
uptime54s, libpairipcore.so+0x2f9b8). A two-PID query caused the matrix helper to
miss that failure; full logs and top activity are authoritative. Restoring the
exact provider task in SDK6 fixes the repeated reboot case. A trace helper that
hooked System.loadLibrary also caused a separate caller-sensitive load failure;
do not use that hook. Empty traces do not establish SDK correctness.

Runtime-tested SDK6 APK SHA256:
0e61ce808ad93b5b9c41a6a6fb7d9668e54b5a3021479dc7060c8fc35d75759a.
Final clean-input APK pizza-5580-verified.apk SHA256:
36d28d76f9d24ad4f714107736343d04055a630b4a3e1ca1ce37110056e0f281.
All 8352 non-signature entries are byte-identical between those APKs. Final build
and all three patches pass. DEX checks verify3412 unchanged authentication/SDK
methods,6 exact recovered SDK methods,2165 unchanged billing methods,79 unchanged
native bridges and5 interpreted reward placements. All67 splits,36 libraries
and6653 assets are preserved. Updated5.57.3 has all6691 DEX/native/assets entries
identical to verified v1.32.0 and passes the updated integration verifier.
A synthetic four-role rename fixture patches and passes reward scenarios; it is
never installed and does not imply arbitrary SDK/architectural changes work.

User AVD5554: verified snapshot pizza-before-5580-20261006 and old installed APK
preserved before same-key update. Signer SHA256 remains
209e0c57bb4ecb1707c78e8d1e0c2e47344eb9cab74870c740ea46bf4d83a710.
Two force-stop starts, background/resume and THREE full device reboots pass real
Google sign-in with80s observation after each start and no game errors. The
Chapter3/Day47/1.13K funds/1 gem regions are pixel-identical across starts,
reboots and network recovery. Service logs include a real nonempty serverAuthCode
and granted scopes; raw values stay local. Offline MicroG resolution can be
cancelled with Back; restoring network and relaunching recovers the same menu.
The user explicitly confirmed TapBlaze remains linked on5.58.0. This verifies
continued linked session and local progress, not a fresh download from cloud.
Only normal update/event dialogs were dismissed; no user gameplay/purchases.
Never clear or uninstall5554. Its save and signing key must remain recoverable.

Disposable5556: SDK6 repeats normal launches; actual PNN sponsor gives exactly
one gem, with one started/watched/ended/ready sequence on GLThread66 despite
repeated tap and Home/resume. Day2 cash121.98/gems4 persists after force-stop.
Three checkout requests yield three GLThread cancellations, zero Billing entry
and zero purchase-success callbacks. Some Premium products remain visible outside
the FUNDS section. Preserve normal exchanges/rewards and existing verified tokens,
acknowledgement and consumption; real-money checkout is not repaired.
Before clean uninstall/reinstall5556, full345-entry data backup was verified:
sdk6-reward-day2-save.tar SHA256
4a0017997f6cc196125d6c6184c01be28e26da5d85a9934ec40a190f79c2e301.
Fresh age setup and Day1 gameplay accept orders, prepare/bake/cut/box/sell pizzas.
Three customers accepted completed pizzas; Night1 records revenue32.00, tips1.86,
refunds0 and profit24.38. Free pepperoni unlock and transition to Day2 pass.
Force-stop and full reboot preserve Chapter1/Day2/funds64.38/gems10 with identical
menu regions and no fatal/receiver error markers in full logs.
MicroG is enabled, font scale1.0 and networking enabled outside isolated tests.
A transient System UI not-responding popup occurred during debug boot with two
AVDs active; game subsequently recovered. It is recorded separately from game
crashes. Repeated user reboot tests ran with the debug AVD closed.

SDK6 plain offline Activity recreation also passes: three Activity creations in
one process, no fatal/receiver errors. MicroG/font/network restored afterward.
Release checks pass on these emulators. Keep5.58 experimental for untested ARM64
physical devices/ARM32 and fresh cloud restoration. Do not infer cloud restore
from cached menu or ask for credentials outside the app. APKs, full logs, snapshots,
saves, official SDK downloads and signing keys remain ignored, outside Git.
Ready for the authorized commit and GitHub release.

## Latest scope: hide paid offers — 2026-09-28

The user accepted the alternative of hiding broken real-money offers and
cancelling checkout, preserving in-game rewards/exchanges and their save. This
supersedes the earlier request to implement genuine checkout; no paid goods are
granted. `HidePaidOffersPatch.kt` adds a default-selected, optional ARM64 5.57.3
patch. Native changes select the existing FUNDS storefront and hide the separate
starter promotion. The public Java purchase entry queues the game's original
cancellation Runnable on the GL thread. All assets, balances/ownership code and
the other 2165 executable billing methods remain unchanged.

Candidate `artifacts/hide-paid-20260928/pizza-hidden.apk` SHA-256:
`4baed6a374788afb3be919b74b08169eeb910440c7a76e842fe2ba4b82974da7`.
It was built from source and a clean APKM, then installed with the existing key.
See [validation and failures](pizza-hidden-offers-validation.md) and
[exact native edits](pizza-store-visibility.json). Build, emitted-DEX, native,
all-split integrity and 11 asset regressions pass. Runtime tests verify three
genuine cancellations (no success/Billing), ordinary gem-to-funds exchange,
exact sponsor reward, persistence and clean setup/tutorial.

User AVD 5554 remains logged in, Chapter 2 / Day 43, cash 361.24, gems 36;
same-key update and two force-stop launches preserve all three RGB menu regions
and genuine Games sign-in success. Diagnostic AVD 5556 is clean-installed Day 1,
now closed to reduce emulator load; its earlier Day 2 save is archived in ignored
`debug-day2-backup.tar`. MicroG remains enabled. Do not reset user AVD 5554.

A diagnostic early-boot test encountered System UI ANR and a black renderer after
MicroG cancellation; force-stop/relaunch recovered. Preserve this failure and do
not claim every reboot/environment passed. Account-AVD reboot tests run with the
other AVD closed and boot services settled. Both account-AVD reboots pass:
genuine Games sign-in, identical RGB save/currency regions and no new app crash.
User AVD is left running at the preserved main menu.

Published [v1.32.0](https://github.com/dawidd612/dudeks-morphe-patches/releases/tag/v1.32.0),
implementation `1bd0c2b`, release metadata `c519c17`. Workflow `36452104570`
succeeded. Downloaded MPP SHA-256:
`e3a1e311b2b5fa756f527e0c1af7e7766c43a292885a7bbdd280a2c418f39cca`.
Checksum and GitHub build attestation verified; all 12 Pizza patch-class/resource
entries match the locally runtime-tested bundle byte-for-byte. Published metadata
contains the default-on Hide paid offers patch and version 1.32.0. Release notes
include the diagnostic boot failure and ARM64/experimental limits. No APK, save,
account data, raw log or signing key was published. Worktree is ready for further
work; retain user AVD and diagnostic artifacts.

Original-context checkpoints below remain historical evidence.

## Latest user confirmation and billing investigation — 2026-09-28

Published [v1.31.1](https://github.com/dawidd612/dudeks-morphe-patches/releases/tag/v1.31.1):
implementation commit `de4d708`, automated release commit `bf05114`.
GitHub release workflow `36443560520` succeeded. Downloaded release bundle
SHA-256: `72880b7ee51630f47640730307ddf4174d389115d468ce15c1885b8923eee639`.
Checksum, GitHub build attestation, metadata version and all three bootstrap
resources were verified. The release explicitly documents the unresolved paid
billing limitation. This publication state supersedes the older no-commit/no-release
notes below. No game APK, account data, save or signing key was published.

The user explicitly confirmed working Google Play Games, TapBlaze, correct save
and gameplay. They requested normal paid purchases, a commit and a GitHub release.
The existing candidate and its prior runtime tests remain the application baseline.
See [billing investigation](pizza-billing.md) for the newly reproduced Play Store
refusal and the publisher signing/distribution requirement. Billing is unresolved;
do not claim that releasing a Morphe bundle enables normal paid checkout.

No application code changed during the billing investigation. The verifier now
also proves parity of 2166 executable billing methods. The current user save is
Chapter 2 / Day 43 / cash 361.24 / gems 36 (the user played after the older tests).
The account AVD now runs with `-gpu swiftshader` after host-GPU black store output;
the same APK opens the shop and the stock checkout with this renderer. User data
and accounts have not been cleared or reinstalled. Debug AVD was closed cleanly.
Current billing evidence is under ignored `artifacts/billing-20260928`.

## Validated application checkpoint — 2026-09-28, 14:46 UTC

The final candidate is `artifacts/session-20260928/pizza-accepted-activity.apk`
(SHA-256 `21c0e913150194d710152fc16db807893fed099fa062a11e2ff0eb99a1bf7b63`).
The bundle is `patches/build/libs/patches-1.31.0.mpp`
(SHA-256 `1f76dbc6ac67ddcdfaeb9da20e046d4377030d53d1f446fa7e05e4be279c38ec`).
Both emulators have this APK. The completed validation and its limits are in
[runtime validation](pizza-runtime-validation.md), which supersedes the older
chronological checkpoints below. Source changes remain local and uncommitted.

- Source build, clean APKM patch, emitted DEX, all split assets, native parity and
  eight asset regressions pass. The final Games initialization runs only after
  the existing root-Activity check accepts the window and before onResume.
- Real Google authorization/player retrieval passes update, two force-stops,
  two full user-AVD reboots and network recovery after renewed MicroG consent.
  User save remains Chapter2/Day43/cash356.24/gems21, with exact image-region
  matches. TapBlaze restore was explicitly confirmed by the user; Google cloud
  save restoration is a separate, unverified capability.
- Final clean uninstall/install on debug passes age setup, first real Games
  resolution/cancellation and a rewarded offer with repeated tap and Home/resume.
  Preceding receiver candidate completed a real gameplay day and three native
  reward offers. Final candidate reads that unchanged Day2 save, including after
  verified local backup/restore; see report for exact per-candidate coverage.
- Tapjoy offline Activity-recreation test passes again on final APK, same
  PID11915, two Activity creations, no receiver leak/fatal exception. Rejected
  Activity regression has old/new evidence and two additional passing repeats.
- One earlier black-renderer symptom was not deterministic. The reproduced
  rejected-window SDK initialization was fixed; final cancellation and orphan
  window retests did not reproduce black output. Preserve the original evidence
  and retain this scenario in future regressions; do not overstate causality.
- Debug MicroG is enabled, font_scale1.0, airplaneoff, always_finish absent.
  Debug Frida server stopped. User5554 has never been cleared/reset/uninstalled;
  final PID6008 authenticated after network recovery. Retain its AVD and signing
  key. Debug Day2 backup stays in ignored artifacts; no user-account backup was
  extracted for these tests.
- ARM32/physical-device compatibility, Google cloud restore and every seasonal
  reward remain unverified. Keep experimental metadata. No push, PR or release
  has been made. Do not restart old investigation steps merely because older
  checkpoints below describe them as pending.

## Objective

Stabilize the current Morphe patch for Good Pizza, Great Pizza with genuine Google / Google Play Games authentication and preserved user progress. Work iteratively through build, patch, ADB install, runtime diagnosis and full regression retests until results are repeatable.

## Environment discovered on 2026-09-28

- Repository: https://github.com/dawidd612/dudeks-morphe-patches, cloned into `C:\Users\Komputer\Documents\Morphe` from main at `08d1e62` (v1.31.0).
- Clean input: Pizza 5.57.3 (2277) APKM in the user's Downloads folder.
- Android SDK: `%LOCALAPPDATA%\Android\Sdk`; Android Studio and Java 21 are installed.
- ADB initially reported no connected devices. Existing `Medium_Phone_API_36.1` AVD uses a Google Play x86_64 image. Existing AVD data must be preserved.
- Current patch has shared PairIP/licensing startup changes and optional MicroG-RE Games routing. Upstream notes explicitly leave runtime authentication and save restoration unverified.

## Reproducible findings (2026-09-28)

- Local Gradle initially failed resolving `app.morphe.patches:1.3.3` with GitHub Packages HTTP 401. The user authorized `read:packages` through GitHub CLI on 2026-09-28. `:patches:buildAndroid --no-daemon` now passes (158 tasks, 1m26s; `build-authorized.log`). Never print or commit the token.
- CLI 1.17.0 and published bundle 1.31.0 were downloaded and their SHA-256 checksums verified. Both Pizza patches applied to the supplied APKM in FULL mode. This is a published-bundle baseline, **not a successful local Gradle build**.
- Installed SDK command-line tools and two API 35 images. Created disposable `Morphe_Pizza_API35` (Play image, ADB `emulator-5554`) and `Morphe_Pizza_Debug_API35` (Google APIs/debug image, `emulator-5556`). Both translate ARM64 through `libndk_translation.so`. Existing AVDs were not modified. Test-package uninstallations were confined to these new AVDs, before any real login or user progress.
- Baseline fails repeatedly with `NullPointerException` in `wc.e.b`, on `GoogleApiHandler`. Decompiled code dereferences `com.mbridge.msdk.config.component.common.network.connect.okhttp.Dv.jHNdC.HrEiSdORdADDM`, which remains null when startup is disabled.
- Original signed APK splits initialize correctly and reach the licensing/Play redirect instead. Its native startup thus executes on this emulator; the emulator alone does not explain every patched-app crash.
- There are 32 methodless string-holder classes with 1459 uninitialized static strings. Read-only instrumentation of the **original signed app** recovered all 1459 non-null values. Two independent starts produced identical dumps. The failing GMS field is exactly `com.google.android.gms`.
- A diagnostic APK restoring only the original `StartupLauncher` crashes natively (`SIGSEGV`, `libpairipcore.so + 0x37ca0`, native bridge free). Do not ship this as a fix.
- A second diagnostic APK initializes all 1459 fields from the original dump while retaining the current startup/licensing edits. This removes the first null failure and allows Firebase initialization, but it still crashes later in PairIP (`libpairipcore.so + 0x8f748`, native bridge malloc). This is **partial diagnosis, not a working candidate**. Investigate remaining VM state/callers; do not no-op value-returning SDK methods or fabricate authentication results.
- User completed Google account sign-in in MicroG on `Morphe_Pizza_API35` (`emulator-5554`). Physical keyboard input was enabled with `hw.keyboard=yes`, preserving AVD data. Do not reset this emulator, clear MicroG, or uninstall the user's application data. Actual Pizza/Play Games authentication, cloud-save restoration, gameplay and stability are still unverified.
- Native caller `HKU28jIt1punH16H` is invoked by the cocos library's `DT_INIT`, outside the 20 Java callers covered by the old verifier. Skipping it without restoring its effects crashes. Two original signed-app runs recovered identical 50864 changed executable bytes and 3794 data qwords; 200 import destinations were resolved to ordinary ELF relocations, including libc's `memmove` IFUNC. `reconstruct-native.py` recreates those effects and removes only the original native `DT_INIT`, preserving C++ `DT_INIT_ARRAY`. Diagnostic `pizza-native.apk` reaches the age configuration screen and stays alive for six minutes, then crashes on SDK initialization. This is not a stable application.
- Frida located the next crash in Fyber 8.4.6 `IAMraidKit.onReceive`, a protected VM method. The exact published Maven SDK was downloaded with checksum verification. Diagnostic `pizza-fyber.apk` restores three protected Fyber receiver methods from that SDK, preserving their behavior. A later native PairIP crash remains under investigation; `trace-protected.py` logs VM entry points with ART deoptimization. No reconstructed source fix is production-ready yet.

## Durable tooling changes

- `scripts/capture_pizza_runtime.py`: captures local ADB/logcat/crash buffer/dumpsys/UIAutomator evidence, including process state before and after capture. It does not claim functional success, clear data or take screenshots.
- `scripts/VerifyPizzaIntegrationDex.java`: permits removal only of the five known distribution/split metadata markers stripped by APKM merging; all game/auth metadata still must match. The original test falsely failed on `com.android.stamp.source`.
- `scripts/verify_pizza_assets.py`: compares native libraries/assets from **every input APKM split**, rather than only base.apk. The actual baseline preserves 34 libraries and 6653 assets from 35 APKs.
- Four black-box verifier regression cases pass (preservation, changed library, missing asset split, conflicting splits); included in Pizza CI.
- Baseline emitted-DEX verifiers pass five reward-placement scenarios and preserve 1205 authentication/SDK methods including 20 protected callers. These checks demonstrably do not establish runtime viability.

## Local artifacts and resume point

- `artifacts/session-20260928/`: build failures, patch report/log, input APK splits, manifests, verifier results, installation logs, process logs, diagnostic APKs and diagnostic Java/Python/Frida sources.
- `artifacts/pizza-runtime/`: timestamped snapshots for each observed runtime failure/control.
- `artifacts/pizza-test.keystore`: same signing key used for all patched emulator candidates. Do not replace it or use it to overwrite a user's differently signed installation.
- `original-string-values-first.json` and `original-string-values.json`: two matching original runtime snapshots; `string-values.tsv`: local machine-readable encoding. These remain ignored test evidence, not a published patch resource.
- `pizza-baseline.apk`: published patches; `pizza-restored.apk`: original startup restored; `pizza-strings.apk`: original string constants restored. All are currently unsuitable for production.
- `trace-vm.py` / `trace-vm-agent.js` instrument VM entry points in the diagnostic emulator; inspect associated logs before proceeding. Frida server runs only on the disposable debug AVD.
- codebase-memory `auto_watch=false` was set. MCP later returned `Transport closed` twice; CLI `list_projects` and `index_status` succeeded. Use the installed binary's `cli --json` interface for graph-first discovery in this session.

Next: diagnose the remaining crash after Fyber restoration, integrate the proven initialization repairs into source/resources, build the updated bundle, patch the clean input and repeat the complete runtime/account/data matrix. Keep user-account emulator 5554 intact and use 5556 for destructive diagnostics. Preserve failed variants and logs; do not promote an APK based on static checks or an idle configuration screen.

## Latest checkpoint: 2026-09-28, 12:35 UTC

- The fourth failing receiver was Ad Quality 9.9.0 (`ZuNg8qxznV9nd3Bb`). Restoring its exact upstream method alongside the three Fyber receivers reaches the menu and gameplay. Diagnostic `pizza-sdk.apk` contains a temporary `PizzaVM` trace; source-built `pizza-source.apk` has no such instrumentation.
- `BootstrapRestore.kt` and resources under `patches/src/main/resources/pizzabusiness/5.57.3/` now implement all 1459 constants, the native ARM64 reconstruction and four upstream SDK methods. `StartupSupport.kt` depends on this restoration. Native data uses a 1.43 MB compressed copy/literal delta with exact input and output hashes. ARM32 has not been repaired or tested; keep this experimental.
- Updated source build passes (`build-bootstrap-2.log`), clean APKM patch passes (`source-patch.log`), and `pizza-source.apk` is installed on BOTH emulators using the SAME test key and update installation.
- Emitted APK verification passes: all 1459 constants, 1201 unchanged authentication/SDK methods, four exact SDK restorations, five reward-placement scenarios, every asset and library across all 35 input splits (only the reviewed ARM64 library differs). Native reconstruction tests and eight asset verifier regressions pass. CI includes these tests.
- Debug emulator 5556: three force-stop/relaunch cycles, background/screen-lock/resume, airplane-mode off/on and device reboot have produced no new crash. A surviving foreground process is only one check; full gameplay/reward and clean-install retests remain incomplete. Debug root/Frida may need restarting after reboot.
- User explicitly confirmed successful TapBlaze login AND restoration of their previous save. Source-built update preserved Chapter 2 / Day 43, cash 356.24, 21 gems (observed at the main menu). Do not spend/change this progress for testing. Emulator snapshot `pizza-account-before-source` was saved successfully on 5554 after account setup, before installing the source-built APK; recovery only, never restore casually.
- First Google login was actually into stock Play Services (`com.google` account). User subsequently completed the correct MicroG login; AccountManager now has one `app.revanced` and one `com.google` account. No more credentials are currently needed.
- Play Games is NOT verified. Pressing the controller icon under the main-menu hamburger calls `loginGooglePlay`. MicroG receives sign-in type 0 but finds no configured default Games account, returns SIGN_IN_REQUIRED with a PendingIntent. The app's Task reports success and then `requestServerSideAccess` fails without showing account selection. Investigate client resolution handling. Do not treat `autoSelectLogin Accounts is Empty` as proof the MicroG account is missing: it can mean no default Games account for type 0.
- Relevant evidence: `source-games-3.log`, `account-types-after-microg.txt`, `account-menu-loaded.png`, source runtime captures. Raw account logs/screenshots stay local/ignored. Do not print account names or tokens.
- Exact official MicroG sources downloaded as diagnostic references (`GamesConnectService.kt`, `GamesConfigurationService.kt`, `GamesSignInActivity.kt`) and installed 7.1.1 decompilation `MicrogConnectImpl.java` confirm status 4 with a resolution. Game client `zzcv` delegates to `zzaw`; `zzay` is being inspected to find the concrete implementation. MicroG source repository has NOT been modified.

Next: resolve genuine Play Games account selection/authentication, verify user save after force-stop/reboot without changing it, complete clean-install and gameplay/reward tests on debug emulator, document resource provenance, and finish the patch. No commit, push, PR or release has been made.


## Checkpoint: 2026-09-28, 12:59 UTC

- Real MicroG Games authorization succeeded on account emulator 5554 after choosing the existing MicroG account: resolution successful, service authenticated, server-side access and current player retrieved, completeSignIn success. Evidence: games-account-selected runtime capture. Account IDs/tokens stay in ignored evidence. TapBlaze Chapter 2 / Day 43 remains intact.
- Two resolution issues: stock GMS/Play Store version gate is inappropriate for MicroG; SDK is initialized from the login button after Activity.onResume and misses the current Activity. Background/foreground allowed the resolution and proves the lifecycle issue.
- pizza-games.apk bypasses only the legacy version probe; lifecycle fix now moves the existing SDK initialize call into BaseAppActivity.onCreate, before lifecycle events, with authentication and cancellation paths retained. Build/clean patch of pizza-lifecycle.apk underway. Must verify first-attempt resolution, cancellation, repeated real login and save preservation after force-stop/reboot, clean install and gameplay/reward.
- Debug clean pizza-games install reaches Day 1 tutorial without crash; without MicroG, sign-in fails safely and gameplay remains available. Installing official MicroG 7.1.1 on disposable debug AVD to test account selection/cancellation without user account.


## Checkpoint: 2026-09-28, 13:12 UTC

- pizza-lifecycle.apk passes source build, clean APKM patch, 1198 unchanged auth/SDK methods, exact 4 SDK restorations, reward DEX scenarios, 35-split assets (34 libraries/6653 assets), native parity and 8 regression tests. Installed update on 5554 and clean on 5556.
- First-start account resolution now opens without background workaround on clean 5556; canceling the MicroG add-account flow returns to gameplay. 5554 real authentication (server access + current player) passes update and 2 consecutive force-stop relaunches.
- Full 5554 reboot exposed System UI ANR while booting and then a real app crash: IllegalArgumentException Receiver not registered, ck.f0.run, after IntentReceiverLeaked on AppActivity destruction. Evidence lifecycle-after-reboot, lifecycle-reboot-failure and receiver-failure-context.txt. Do NOT mark reboot PASS. A subsequent launch logged in successfully again (lifecycle-reboot-recovered).
- Narrow repair added to StartupSupport.kt: ck.f0 Tapjoy connection worker stores application context for its receiver registration/unregistration instead of Activity context. All SDK callbacks, retries, failures, other UI contexts retained. Build-receiver succeeds; pizza-receiver.apk clean patch in progress. Must fully retest this version, including Activity recreation with connection outstanding, offline/recovery, reboot, save preservation and gameplay/reward.
- Diagnostic 5556 clean tutorial reached sauce/cheese preparation, no completed day yet; pizza needs transfer to oven. User 5554 save must remain untouched except login/restarts.


## Checkpoint: 2026-09-28, 13:22 UTC

- pizza-receiver.apk is current source-built candidate, installed on both AVDs (clean 5556, update 5554). Build, clean patch, integration/reward/all-split verification pass. SHA-256 APK: 568f1f5d7a520cfbeefd8dddf4226473b9d8a73a97cecba343144bad94f882f4. Bundle hash in receiver-artifact-hashes.json.
- Real account login passes two further force-stop starts AND full 5554 reboot; full server authorization/current player succeed after boot services settle. New reboot did not reproduce previous receiver crash; PID 2027 remains alive. Main-menu cash remains 356.24, chapter/day needs final visual/local comparison. Repeating reboot again.
- Clean 5556 opens MicroG sign-in, cancellation returns to Day 1 tutorial, offline/online recovery keeps PID. Setting always_finish_activities alone did NOT destroy the Activity (dumpsys STOPPED), so do not count that as the receiver recreation regression. Setting restored to absent; font_scale restored to1.0, airplane mode disabled.
- Explicit regression helper artifacts/session-20260928/test-receiver-recreation.py waits for Tapjoy connection then changes font scale to force Activity recreation and restores it. First helper failed to observe Tapjoy because MicroG login was foreground; updated helper cancels only observed MicroG foreground activities, rerun pending. This is test setup failure, not app crash.
- Tutorial on prior lifecycle candidate got through oven; input is camera swipe and TAP pizza to transfer, not dragging it. No completed day/reward test yet; current receiver candidate tutorial must be completed.
- Debug MicroG first setup had its own CheckinService ForegroundServiceDidNotStartInTimeException at13:02; capture preserved in debug-before-receiver-crash-buffer.txt. No Pizza crash there. Monitor for recurrence, do not claim dependency crash never occurred.

- 13:25 UTC: second full reboot of receiver candidate 5554 also passed genuine server/player auth. OpenCV comparisons of progress/cash/gems regions to original confirmed all three are pixel-identical after BOTH reboots. Evidence receiver-reboot-2-authenticated and reboot-2-save-comparison.json.
- Debug recreation helper again timed out before Tapjoy because unauthenticated MicroG owned the foreground; no new Pizza crash. Temporarily disabled ONLY debug5556 MicroG with pm disable-user, to isolate SDK recreation/gameplay and service-unavailable recovery. MUST re-enable it at end. Font scale restored1.0, airplane disabled.

- 13:30 UTC: receiver regression now has a true before/after proof. With debug MicroG temporarily disabled to isolate SDK initialization, offline + font_scale1.1 during Tapjoy connection recreates Activity. Fixed APK keeps PID10918, logs onCreate twice, no leaked receiver/crash (fixed-recreation-*). Previous pizza-lifecycle APK reproduces IntentReceiverLeaked and the same fatal Receiver not registered in PID11971 (baseline-recreation-*). Restored pizza-receiver.apk afterward on debug5556; font_scale1.0, airplane off. MicroG remains disabled on debug only until gameplay tests finish.
- User5554 offline launch showed proper Server Connection Failed warning with saved state; restoring network and relaunch completed genuine authorization/player retrieval. Final current PID5258. Background/sleep/wake/resume also preserved process.
- Both latest full reboots preserved exact pixel regions for Chapter2 Day43/cash356.24/gems21. User account path now passes repeated genuine auth, updates, two force-stops, two full reboots, background/resume, offline/recovery. Remaining work: finish real tutorial/day/reward and persisted debug progress, restore debug MicroG, final evidence/report/source review.

- Tutorial control discovery: use ADB input draganddrop 1047 1025 1720 630 1500 (hold then drag paddle handle) to move prepared pizza into oven; simple taps add topping or pan the camera. Current debug final APK reached oven and opened Oven Booster by tapping550,900; next inspect and accept actual eligible video offer.

## Checkpoint: 2026-09-28, 14:25 UTC

- Receiver candidate completed real Day 1 gameplay on debug 5556 (prep/bake/cut/serve/delivery/night results), reached Day 2, cash66.98/gems11. Oven video offer enabled boost without spending7cash; tip offer gave30min; sponsor offer gave exactly1gem (10->11) across Home/resume. Evidence day1-summary, reward-real-after, reward-tip-after, day2-confirmed-header. Day2 save later survived force-stop and full reboot.
- MicroG5556 re-enabled; airplaneoff/font1.0/always_finish absent. User5554 remains untouched with Chapter2 Day43.
- A new edge case was seen: force-stop while notification permission was pending left a PermissionController task. Cocos rejected the next non-root Activity, but our early SDK hook nevertheless initialized Games. Later MicroG cancellation produced one black renderer, recovered via Home/resume. Full evidence receiver-debug-black-after-permission/debug-black-pid15122.log retained. Do NOT count that start as pass or conflate it with a fatal crash.
- Reproduced the concrete root-window violation with a controlled notification request (Frida on DEBUG ONLY), then force-stop/MAIN-LAUNCHER start: baseline-orphan-permission.log shows Cocos rejecting the window followed immediately by Games AutomaticGamesAuthenticator startWatching. Baseline repeated cancellation subsequently rendered normally; black symptom not yet reproducible deterministically. Three interrupted cold starts reached rendered loading; third confirmed main-menu cash afterward. Explicit menu sign-in cancellation also returned correctly.
- Source fix moves SDK initialization after the game's existing accepted-root Activity assignment, still before onResume. No new lifecycle fallback or authentication override. Current NEW candidate pizza-accepted-activity.apk SHA25621c0e913150194d710152fc16db807893fed099fa062a11e2ff0eb99a1bf7b63; MPP SHA2561f76dbc6ac67ddcdfaeb9da20e046d4377030d53d1f446fa7e05e4be279c38ec. Source build and clean patch PASS; 1459constants/1198auth-SDK/4receivers/5rewardplacements/35splits/34libraries/6653assets verification PASS.
- Installing NEW candidate on5556 now; 5554 still runs previous receiver candidate. Next: repeat orphan-permission scenario and confirm rejected window does not initialize Games; valid start and cancellation/save/reward work; update5554 same key and repeat genuine auth/force-stop/reboot/user-save matrix. New candidate needs runtime retest before delivery. No commit/push/PR/release.
- Launch cold starts using MAIN + LAUNCHER, wait for sys.boot_completed after reboot. Booting device can temporarily return activity-not-found before package manager is ready. A notification dialog surviving killed caller requires dismissal before the real game Activity can become root.
- Frida server /data/local/tmp/pizza-frida-server currently running only on rooted5556. Its -D call kept adb client open; client alone terminated, server remains. Request helper artifacts/session-20260928/request-notification.py invokes actual Activity.requestPermissions(POST_NOTIFICATIONS,990), after clearing user-set/user-fixed flags on5556. It attaches by adb PID. Do not run against5554.
