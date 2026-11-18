# Good Coffee, Great Coffee - patch context

## Latest checkpoint - Coffee1.26.0 / update toast, 2026-10-28

The user's new request is implemented for1.26.0(1504) ARM64: update support and
an optional default-selected Non-blocking update notice patch. The original
1.26 input has no PairIP (0VM/holder references in all4DEX), so the profile now
explicitly sets protectedInitialization=false. Original SDK/native startup is
retained, while common Unity packs/Firebase support remains. The three Firebase
resources are byte-identical. New Games client/base/retry mappings were recovered
from actual DEX. Older profile resources remain unchanged.

Final build and clean-input FULL patch pass. Input APKM SHA256:
106e6dd9c21ce50e16c4a64945f8211feb542dc6bfab4eab50c82b0739cf4793.
Publisher certificate SHA256 remains
bab9079ab6c5f2e6d636cf2fe5d40526df4f7d47b64eda713f58a6b70b4d3989.
Final private APK SHA256:
3c5d7407c88f5860c0ae54f42065d4ae4a846c524a137cd6c4e012b83a6213aa.
Its signature and all16splits/44native libs/2519assets pass. Only libil2cpp is
changed, to SHA2563fdaad295351379630c1b264020d1bca84261d946bf63231123eee709763ea4b.
Native gate tests pass12 scenarios plus repeated iterator completion; original
ELF reproduces the blocking-dialog failure. Generator RED/GREEN2tests and all3
packaged profile selections plus mismatches pass. One Test Automation Engineer
review is closed; its async-toast exception finding was fixed and rebuilt.

Runtime on the fresh muted/windowless E: API35 Google APIs AVD passes normal
menu and Day1/Maisie. A memory-only forced-status0 test shows/hides the real
short toast in2.633s, reaches Start, then records Day1 start/Maisie in the same
PID6586 with no app fatal markers. A separate null-base ContextWrapper produces
a caught UI-thread NullPointerException without killing PID6000. An earlier
Frida framework-method exception probe caused a native SIGSEGV in PID5037; it
is not counted as pass and its root cause is unestablished. All failure evidence
is retained. Total12 local OCR frames and1 private age-slider image; no gallery.

Private evidence: E:/Codex-Morphe-Coffee-1260-20261028, including evidence.json,
runtime-verification.json, APKs, native sources/dumps and raw logs. AVD registration
is under its avds/; fresh device is Morphe_Coffee_1260_API35, port5562. Reuse this
prepared AVD and coffee-1260-disposable.p12 for future test updates. Prior C: AVD
directories/ignored Coffee artifacts were absent; no original user's save or key
was replaced. Mute launcher now follows ANDROID_AVD_HOME and the registration's
absolute path. The original publisher install's prelaunch data was backed up
before replacement in this fresh disposable AVD.

No real account credentials or charge were used. Same-key existing-user update,
Google/TapBlaze sign-in/cloud restoration, physical ARM64/API36 and checkout are
not established. JNI attach/detach/local-frame-error paths are not covered by
the instruction fixture. See coffee-1260-update.md for behavior and reproduction.
Published as [v1.38.0](https://github.com/dawidd612/dudeks-morphe-patches/releases/tag/v1.38.0)
through PR #39, merge e2e6fa259197977ef5d58ea366d00d34dd1713d9 and release
commit c8de250. All three PR workflows and release run 40757657181 passed.
Downloaded release MPP SHA256:
960881b7ab325b49685794cc51212f7a4f440350e968758b2a1efb602b7be60f.
SHA256SUMS, ZIP integrity and GitHub attestation verification passed. All 46
scoped Coffee/Android DEX entries match the tested bundle; six text resources
require CRLF/LF normalization, with no logical differences. Binary entries match
exactly. Published metadata enables the notice patch by default for
non-experimental 1.26.0 / 1504 ARM64. Detailed release notes preserve the runtime
limits and excluded failed instrumentation probe above. Verification is saved
as release-verification.json beside the private evidence. Retain prior unrelated
Pizza edits outside this feature.

Targets: `com.tapblaze.coffeebusiness` **1.24.0 (1397)** and **1.25.1 (1454)**,
complete APKM, ARM64. The 1.25.1 profile is officially non-experimental, promoted
at the user's request on 2026-10-16. This changes release classification only;
the runtime behavior and previously documented verification limits remain.
Status: gameplay and a requested rewarded action were exercised on
Android; Google sign-in, cloud restore and paid checkout are not verified.

## Implementation

Three selectable patches mirror the Pizza workflow while adapting to Coffee's
Unity 6000.3.10f1 / IL2CPP metadata39 architecture:

- **Coffee startup support** restores native initialization, 1447 protected
  string constants, five startup wrappers and four protected SDK receivers.
  SHA-256 guarded PZB2 reconstructions cover libunity and libil2cpp. Native imports
  are linker relocations rather than captured process addresses.
- Sideloaded Unity asset packs are exposed as actual files in Coffee's own
  `no_backup/morphe-coffee-1397` directory. The 2386-entry manifest verifies every
  extracted file before writing its completion marker. Unknown pack requests
  retain original behavior. Game saves and original assets are not rewritten.
- **Skip rewarded ads** delivers the game's displayed/rewarded/closed callbacks
  on Android's main thread after an explicit reward request. It guards readiness
  and duplicate show requests and permits reloading. It does not fabricate paid
  purchases, receipts, SDK impressions or SDK revenue events. The game's original
  analytics callbacks remain intact.
- **Google Play Games via MicroG-RE** redirects the two Games clients to
  `app.revanced.android.gms` and uses the original signing-certificate SHA-1.
  The real PendingIntent resolution, cancellation and authorization remain.
  Real account sign-in/cloud restoration still require verification.
- The original Firebase C++ SDK's embedded app DEX is included unchanged in the
  main class loader. This addresses Android 15's cross-class-loader ARM JNI
  registration problem (AOSP b/393035780), observed as a crash at
  `JniResultCallback_nativeOnResult` in the older Play Store emulator image.
  Native Firebase code is unchanged. Earlier System.loadLibrary preloading alone
  did not fix the issue and was removed.

## Evidence and scope - 2026-09-28

All private evidence is under ignored `artifacts/coffee-20260928/`.

- Gradle `:patches:buildAndroid` succeeds; all three patches apply to the clean
  merged input from the 15-split APKM. `firebase-dex-report.json` records successful
  patching, resource rebuild and signing. Final candidate: `coffee-firebase-dex.apk`.
- Full-SDK asset audit preserves all 2447 original assets and 46 native libraries,
  except the two exact reviewed reconstructions. Thirteen black-box verifier
  tests pass, including multiple libraries and mismatched/missing inputs.
- Emulator5556, Google APIs API35: completed Day1 with two espresso orders and
  the hot Americano tutorial. Reached level2. The end-of-day rewarded button
  increased cash **149.04 -> 159.04** without video and then disappeared.
  Screenshots: `before-reward.png`, `after-reward.png`. In-game ice purchase
  subsequently deducted20 to **139.04** and granted ice (`ice-purchase.png`).
- On-device callback contract test used an isolated listener, not the game's
  save: one loaded/displayed/rewarded/closed sequence, all callbacks on main
  thread, duplicate load/show suppressed, unavailable show ignored, reload ready.
  Evidence: `reward-contract.jsonl`. This complements the real in-game +10 test.
- Emulator5558, fresh disposable Google APIs API35 installation: reached gameplay
  without MicroG, force-stop/relaunch returned to menu. Reboot initially caused
  an Android System UI ANR and a black screen; after dismissing the system dialog
  and relaunching Coffee, menu loaded. Background/foreground also returned to
  menu. Do not describe the initial reboot as an uninterrupted pass.
- Emulator5554, older Google Play API35 with existing MicroG account: prior
  candidates repeatedly crashed in Firebase's native callback. Final DEX variant
  proceeds beyond that crash to loading; final observation recorded below.
  Pizza account and save data were not changed.
- Coffee5556 backups before update include private files/preferences and external
  profileCoffee.dat. Keep those and `artifacts/coffee-test.keystore`; do not reset
  user devices or replace signing material.

Unverified: actual Google/MicroG authentication, cloud-save restoration, long-term
stability on physical ARM64 devices, interrupted extraction recovery, and real
money billing. Coffee's paid offers have not received Pizza's native UI hiding
patch; checkout is not represented as repaired. Purchase verification and tokens
remain original. No real-money charge was attempted.

## Provenance and reproduction

Clean Downloads APKM SHA256:
`61a8e5d22782a4599f1c2fe46ed4e5bee328311e3173db16cff653b1ed305d37`.
Original signing-certificate SHA1:
`aa6e781863cdfb8d32b8f7b368534ace25a0ae7e`.

Native initialization and strings were compared across two original signed-app
runs. Six recovered startup DEX captures match. Fyber8.4.6 / AdQuality9.9.0 SDK
receiver references were checked against Coffee's DEX before reuse from Pizza.
The Firebase app_resources_lib.jar is byte-identical to4342 bytes embedded at
file offset3442128 in original libFirebaseCppApp-12_10_1.so; firebase-app.dex is
its unmodified classes.dex. Resource hashes are in the adjacent provenance file.

Build with Java21, Android SDK, GITHUB_ACTOR and an unprinted GITHUB_TOKEN:
`./gradlew.bat :patches:buildAndroid --no-daemon`.
Patch the clean APKM with Morphe Desktop1.17.0, FULL bytecode mode, the Coffee
signing key and exactly the three Coffee patches above. Never patch an already
patched APK. For the asset audit, pass `--native-delta` twice to
`scripts/verify_pizza_assets.py`, mapping `lib/arm64-v8a/libunity.so` and
`lib/arm64-v8a/libil2cpp.so` to their respective Coffee delta resources.

The SDK lives in `%LOCALAPPDATA%/Android/Sdk`. Test AVDs: Morphe_Pizza_Debug_API35
(5556), Morphe_Coffee_Control_API35 (5558), Morphe_Pizza_API35 (5554). Device
identifiers must be rediscovered next session. Keep raw APKs, logs, saves and keys
out of Git. Unrelated dirty Pizza documentation is intentionally excluded.

## Final commit checkpoint

Final APK SHA256: `5c4b181aef099ec8bf20941664aa8c57afb3819a3d1fb3c84c7b16c9a238e1ef`.
`final-assets-check.json` passes all15 splits,46 libraries,2447 assets for this
exact candidate. Same-key update on5556 preserved Day2 at the main menu
(`final-save-menu.png`). Final Firebase DEX candidate on5554 reached the age
prompt beyond the former native crash (`final-user.png`), with the same process
remaining alive. This is evidence of fixing the observed crash, not a completed
Google sign-in test. Final per-process logs are final-debug-log.txt and
final-play-log.txt. The user requested finishing and committing after actual
runtime success; authentication and billing limitations remain explicit.
Final observation: emulator5554 reached actual Day1 gameplay with Maisie in the
same process8455 (`firebase-main-final.png`), confirming that the observed
Firebase startup crash is resolved in this run. Emulator5556 reached the Day2
notification permission prompt after loading its preserved save.

## Input failures and release retest — 2026-09-30

User reports Manager 1.33.0 on Samsung SM-A546B / Android 16: first ENOSPC during
split merge with 883.60 MB free, then invalid DEFLATE stored-block lengths during
outer archive extraction with 5.40 GB free. Both precede patch execution. Phone
and exact failing/cached input are unavailable over ADB. Local APKM is unchanged
and passes every outer/inner CRC. See `coffee-input-troubleshooting.md`.

Default two-patch selection was reproduced successfully from both the full APKM
and clean premerged APK with the published 1.33.0 MPP. Both reports pass patch,
rebuild and signing; both asset audits pass 15 splits / 46 libraries / 2447 assets.
Startup support is already a dependency of both defaults; no dependency fix is
needed. A read-only archive diagnostic and corrupted-input regression cases are
in `scripts/verify_apkm.py` and `scripts/test_verify_apkm.py`.

Local evidence: ignored `artifacts/coffee-20260930/`. Clean input supplied locally
as `%USERPROFILE%/Downloads/Coffee-1.24.0-clean-merged.apk` (hash in recovery guide).
Final release-default APK was installed with the existing test key on 5556 after
backing up files/preferences to `pre-update-save.tar` (68 tar members). It reached
Day2 gameplay with cash139.04; news reward increased crystals0 ->1 without video.
Screens are in the older screenshot helper's `artifacts/coffee-20260928/` folder:
`final-reloaded.png`, `day2-play.png`, `reward-gem.png`. No save reset took place.

Initial 5% loading on old AVDs was slow, not established as a permanent hang:
both a previous pre-Firebase-DEX build and final release-default build eventually
loaded on5556. The final release-default build was restored after comparison.
The original app on a separate empty control-data.img reached a Play licensing
error, so that control cannot establish gameplay parity. Existing AVD data was
not overwritten. The configured API36.1 AVD has a missing system image; no
Android16 result is claimed. No authentication/cloud success is claimed.

## Singular network callback regression — 2026-09-30

The isolated `control-data.img` profile reached Day1 gameplay with published
1.33.0 after choosing adult test age26. Two subsequent launches crashed in
`BroadcastReceivers$NetworkChange.onReceive -> VMRunner.invoke`, with guest
`libpairipcore.so+0x32b58` and native-bridge abort `Cannot process signal 11`.
Evidence: `clean-relaunch-crash.log`, `clean-relaunch-system.log`,
`clean-retry-crash.log` under `artifacts/coffee-20260930/`. These are distinct from
Manager ZIP failures. Do not generalize the earlier successful child-profile
startup to all account-eligible profiles.

Restored the exact Singular12.6.1 SDK network callback, preserving its connection
check and original queued API worker. See `coffee-sdk-restoration.md` for source
hashes and regeneration. The original constructor/fields/worker remain in place;
all replacement references resolve against the clean Coffee DEX. Build, clean
premerged-input patching with the two defaults, rebuild, signing and the full
15-split/46-library/2447-asset audit passed. Candidate APK SHA256:
`0ff79d46fdbfaa1f4becc6f455eb63e9163637b4cdeaf7540bd239a74d9b76eb`.

On5558, same-key update loaded the main menu, survived network disconnect and
reconnect, then survived force-stop/relaunch and another disconnect/reconnect.
`network-success-process.log` records the actual connectivity callback followed
by successful SDK queue processing; `network-second-process.log` preserves the
second run. The TapBlaze ID email/verification-code form opened through the
normal Login button (`network-tapblaze.png` in the older screenshot directory).
No email/code was submitted and no real account/cloud restore is claimed.
After an Android reboot, the corrected app again reached the menu with Login
(`network-reboot-observe.png`); its process log records a connectivity callback
and no fatal/verification exception. Boot completion was awaited before launch.
On5556, background/foreground returned to the same Day2 session.

On5556, the update preserved Day2 and the previous reward crystal. The news reward
increased crystals1 ->2 without video (`network-news-end.png`, `network-reward.png`).
Actual Day2 gameplay retained cash139.04 and crystals2 (`network-day2-play.png`).
Raw logs, test profiles, APKs and keys remain private. Samsung remains unavailable;
the user cannot connect it now. The clean premerged input in Downloads is an
input-preparation workaround, not a repair of arbitrary corrupt phone archives.

### Published checkpoint

Fix commit `d540f54` was pushed to main and released as **v1.33.1**; GitHub run
`36763799828` passed. Published bundle SHA256:
`2c3d229501cad8d5fadab118ed0371ecdecf5a77d73cd2db1ac6d85cb3b683b3`.
The downloaded checksum matches. All20 Coffee entries match the tested local
candidate, apart from hash-manifest line endings (parsed JSON values match).
Code, extension and binary restoration resources are byte-identical.

A subsequent clean installation of the corrected APK on the disposable5558
profile reached actual Day1 gameplay after choosing test age25 and declining
personalized-ad consent (`network-clean-final.png`, `network-clean-process.log`).
Only this disposable profile was uninstalled for that test;5556's Day2 save and
all signing material remain preserved. The release notes explicitly distinguish
the fixed receiver crash, input-preparation workaround and unverified real
TapBlaze/cloud/Samsung Android16 behavior. v1.33.0 notes point to the correction.

## Original APKM follow-up — 2026-09-30

User wants the original APKMirror APKM supported directly, without a premerge.
The supplied URL identifies the same 1.24.0 / 1397 variant already in Downloads.
The APKMirror file-hash dialog was inspected: SHA256 and exact byte size match
our unchanged input (`61a8e5d...305d37`, 649647098 bytes). This is stronger than
a filename comparison, but does not establish the bytes downloaded on Samsung.

Cloned official Manager tag v1.33.0 (`2ba7bd57f24b3677b72b5487c9512cc0df77eed7`)
to ignored `tools/morphe-manager` and indexed it separately with auto-watch off.
Traced HomeViewModel import, SplitApkInspector, PatcherViewModel/PatcherWorker,
the runtime and SplitApkPreparer. The reported extraction happens before patches.
No demonstrated Manager defect has been found and no Manager code was changed.

Ignored `artifacts/coffee-20260930/ZipArchiveProbe.java` was compiled to DEX and
run using Android `app_process` on API35 and a newly created isolated API36 AOSP
ATD emulator. It uses ZipFile input streams, FileOutputStream and an 8192-byte
buffer, matching the reported inflater/copy path, plus CRC32 and length checks.
Both runs passed all 15 APK entries. Logs: `android-zip-probe.log` and
`android36-zip-probe.log`; API36 fingerprint in `android36-fingerprint.txt`.
API36 AVD is `Morphe_Coffee_Zip_API36`, serial5560, now shut down. It has no user
accounts or game saves. These are ZIP tests, not API36 game/authentication tests.

Official Manager v1.33.0 was installed on the disposable5558 profile. Imported
the published patches-1.33.1.mpp through its UI and selected the unchanged APKM
from Downloads. The Manager import copy had the same SHA256 as APKMirror.
Both default patches were selected; native libraries were preserved and the
actual runtime logged patcher1.15.0 and STRIP_FAST. Extraction, merge and patch
application succeeded. Manager temporary storage reached 4.4GiB; during the run
only our earlier ZIP-probe scratch copy/extracted modules were removed to free
1.3GiB. Do not cite this as a measured minimum-space threshold or an untouched
low-storage run. The selected input and Manager data were never removed.

Manager subsequently finished signing and showed **Patched**, 2 patches, source
1.33.1 (`manager-original-success.xml`). Pulled the completed signed result to
`manager-original-output.apk` (698415230 bytes), SHA256
`a74675db460278fb5d8a01eeacaaca15f2a6aeaeefaf4f3f03ba12ba3f38f694`.
`apksigner verify` passed; the preservation audit passed 15 splits, 46 libraries
and 2447 assets (`manager-original-assets.json`), with only the two reviewed
native deltas permitted. Full logs are `manager-original-logcat.txt`. This
Manager-signed output was not installed over the existing differently signed
test save. Earlier runtime evidence applies to the previously tested candidate.

The remaining diagnostic blocker is the exact failing Samsung source/cache:
the user cannot attach the phone now. Do not claim a ZIP fix from another patch
bundle release. Keep the original format available and the premerged APK merely
as a workaround. Real TapBlaze authentication still requires user credentials.

## Coffee 1.25.1 update — 2026-10-16

Input: user-supplied 1.25.1 /1454,439959161 bytes, SHA256
`7172bcfad15a35bef16f93f2da91f13675c1f22a790d969a3fbceaf1e6c081d3`.
See `coffee-1251-provenance.json` and `coffee-update-workflow.md`. Native libraries
changed despite unchanged Unity6000.3.10f1. Two independent publisher-signed
starts recovered1472 constants, six startup wrappers and both native
initializations with200 imports each and zero unresolved pointers. Ad Quality
9.10.0 replaces9.9.0; the old callback has missing references in the new game.
Five SDK receiver restorations pass reference validation against the actual new
DEX. Singular remains12.6.1. Embedded Firebase DEX is byte-identical to the old
resource. Both native reconstructions and all seven resources replay byte-for-byte.

Profiles own both version/code pairs, startup programs and Games R8 bindings.
1.24.0 is retained;1.25.1 stays experimental pending broader device testing.
Asset extraction now uses a manifest-content-addressed helper directory, so
updates cannot mix stale files from another pack version. No save is moved.

Private evidence: `artifacts/coffee-20261016/`. The candidate bundle was locally
versioned1.34.1 before discovering remote main had advanced; publication must
use the current upstream base/version. Game APK SHA256:
`a2185d4a3ae9275c11109d47de80b79ffa62315259540a6d53ba5e495c56c4ad`.
Both defaults, FULL rebuild and signing pass from the unchanged APKM.
`apksigner verify` passes; asset audit passes16 splits /46 libraries /2542 assets.
The new bundle also patches clean1.24.0 with both defaults successfully.

All game starts used hidden/windowless AVDs with `-no-audio`, audio input/output
disabled and media volume verified0. New disposable `Morphe_Coffee_Update_API35`
(5562) reached actual Day1 Maisie gameplay, then the menu after force-stop.
The isolated reward callback contract passed one loaded/displayed/rewarded/closed
sequence on main, duplicate suppression and reload. Network transitions and
Home/resume were exercised. Reboot loading was long, with black intermediate
screens; do not call these a clean reboot pass. MicroG7.1.1 was then installed
on5562 and a force-stop restart reached the menu. No real account was supplied.
A second full reboot is being observed with MicroG already installed.

The second full reboot with MicroG7.1.1 already installed reached the main menu
in the original post-boot process1676, without another force-stop. Evidence:
`second-reboot-later.png`, `second-reboot-process.log` (no fatal/verification/
missing-class exception). Loading remained slow.5556 Home/resume returned to the
same Day2 process3727 after the actual reward. No credentials were entered.

On existing test5556, private files/preferences were backed up to
`coffee-before1251.tar` (983552 bytes); external files to `pre1251-external/`.
A same-key1.24.0 ->1.25.1 update reached Day2 and preserved cash139.04/crystals2.
The actual CNS Watch button granted one requested reward without video:2 ->3.
`reward-settled.png` and `day2-balances.png` show crystals3 and actual Day2 Carl
gameplay with cash139.04. Loading/entering the day were slow but completed.
Signing keys and the user's other AVDs were preserved.

Preparation timing: cold3.006s, verified repeat0.891s (3.37x for this phase).
No measured3x whole-port claim. Cache recovery/incomplete-input tests pass,
as do six archive tests, thirteen asset-verifier tests and positive/negative
packaged profile checks. `um publish check` on the MPP/LICENSE/README distribution
passed3 files,0 failures,0 warnings. Real authentication/cloud restoration,
physical ARM64/API36 runtime, long-term stability and paid checkout remain
unverified. No charge was attempted.

### Final upstream build

The update was cherry-picked onto current remote main10d1c8f in managed worktree
`coffee-1251-release`; the original workspace's dirty Pizza documentation was
left intact. Final local bundle version1.35.3 builds successfully. All23 Coffee
resource/extension entries match the tested interim MPP byte-for-byte. A new
clean-input patch with this final bundle passes both defaults, FULL rebuild and
signing. Final APK SHA256:
`1e0162cdca5ce55747b91ce80c66b8c1a06cb80cab43e3dc0df9670a013deecb`.
All3793 non-signature APK entries match the runtime-tested candidate byte-for-byte,
including DEX, manifest, libraries and assets. Signature verification passes.
Packaged profile checks and all21 Python regression cases pass on this upstream
build. Broader device/authentication limitations above remain unchanged.

### Published 1.35.3

Code commit669b070 and verification8da53b7 were pushed on current main. Release
commit eff41f4 / tagv1.35.3 was generated successfully. Release run38885521029
and Coffee verification run38885521019 both passed. The downloaded public MPP's
SHA256 matches its checksum file:
`bb3c9372309fc04af620d1e639f684d6bd55a32893df4aee9fdf3e8c7bf7cb2c`.
All23 Coffee resources/extension entries match the tested local bundle (text
line endings normalized). The downloaded public bundle was then used to patch
the unchanged original APKM successfully. Its signed APK SHA256 is
`769eb8bafb86ab93cabe92027ca66ad0c528777acfca10bda525b6299e9844d6`;
all3793 non-signature entries match the runtime-tested candidate byte-for-byte.
The published APK's signature verifies. Public release notes were explicitly
updated and read back, including experimental status, measured preparation-only
speedup and unverified authentication/physical-device limitations.

### Official non-experimental 1.35.4 - 2026-10-16

At the user's explicit request, commit9e8e7a8 promotes Coffee1.25.1 by setting
the shared profile's experimental flag to false. Release commitc7a4b26 / tag
v1.35.4 is published as a non-draft, non-prerelease and latest GitHub release.
Release run38886769748 and Coffee verification run38886769701 both passed.
The downloaded public MPP passes archive CRC and its published checksum:
`1834cf8786b8a6eedb57f40e8421fe7bc033fcf63a79dd67b0a3358cf4c3a151`.
All three Coffee patches expose 1.25.1 with isExperimental=false in published
metadata. Compared with1.35.3, the only changed Coffee resource is that profile;
runtime resources and the extension remain unchanged. Local build and packaged
profile selection checks pass. Release notes were edited and read back.
This classification-only change did not rerun game tests or establish real
account authentication, cloud restore or physical-device verification. Those
limits remain explicit in the public notes. Private verification report:
`artifacts/coffee-20261016/official-1354-verification.json`.
