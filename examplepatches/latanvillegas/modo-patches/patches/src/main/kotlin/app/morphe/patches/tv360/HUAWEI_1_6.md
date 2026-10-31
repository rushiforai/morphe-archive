# TV360 Bitel 1.6 (Huawei) — porting status

## Verified APK metadata (local Termux analysis, 2026-10-25)

- Input: `TV360 Bitel 1.6.apk` (single APK, 36,124,868 bytes).
- Package: `com.bitel.tv360`; versionName `1.6`; versionCode `161`.
- minSdk: 21; targetSdk: 33; compileSdk: 34.
- Four DEX files; twelve `lib/arm64-v8a/*.so` entries.
- `libpairipcore.so` **not present** among ARM64 libraries.
- `libdrmpacker.so`, `libnative_security.so`, `libtoolChecker.so` present.
- Original APK signature certificate SHA-256: `f88bc52e5a446827feca56b46c3b34fdfd8c4874ecfc428afd50ebd49769dc79`.
- This matches the original TV360 Bitel 3.5 signing certificate, **not** Morphe's re-signing certificate.

## Current isolated implementation

- `Huawei16PrivacyPatch.kt` contains two **opt-in, manifest-only** patches:
  - TV360 Bitel 1.6 - Optional Analytics Privacy.
  - TV360 Bitel 1.6 - Optional Crash Reports Privacy.
- Both target `com.bitel.tv360` version `1.6`. The original 3.5 patch sources remain preserved on the dedicated 3.5 branch.
- Kotlin/Morphe builds have succeeded, and manifest application to the user's APK has been confirmed. Playback remains unverified without the defective pinch patch. These metadata preferences do not guarantee all third-party/first-party collection will be disabled.

## Not yet ported

Rotation and standard zoom have partial 1.6 hook inventories. The status bar, pinch-to-zoom redesign, advertising display/overlay/in-stream/welcome, and telemetry still require new exact 1.6 method/callsite verification. A build result alone is not a runtime test.

Do **not** add `1.6` to the existing 3.5 compatibility metadata without exact independent verification. Do not alter native protections, DRM, subscriptions, licenses, signing or package identity.

## Device test constraints

An APK patched/re-signed by Morphe has a different signing certificate; installing over a differently signed version will fail. TV360 1.6 (versionCode 161) is also a downgrade compared with 3.5 (338). Do not uninstall the user's existing installation or discard data for the sake of testing. Preserve the original `TV360 Bitel 1.6.apk`.

The original APK is audited in read-only mode on the user's own device using Termux; the APK is not uploaded. Confirm exact class/method signatures and instruction layouts before adding any new hooks.

## Read-only device DEX audit results

Source: user-executed `audit_huawei16_apk.py` on the original unmodified Huawei APK,
SHA-256 `0ba200d9e60d4808d4131cf612118ed5c449728c082600426816a94ab8057fbd`.

- `classes.dex`: 8,611 defined classes.
- `classes2.dex`: 9,727 defined classes.
- `classes3.dex`: 7,647 defined classes.
- `classes4.dex`: 4,291 defined classes.
- `HomeBoxActivity.onCreate(Bundle)` is defined in `classes4.dex`;
  `setScreenOriention(Z)` and `getDataFields()` 3.5 methods are absent.
- `HomeBoxActivity` sets `screenOrientation=1` (Android `portrait`, **not**
  `landscape`). `Huawei16RotationPatch.kt` was later updated to handle Morphe's resource XML DOM, which may omit this attribute, and changes only `HomeBoxActivity` to `fullSensor`.
- `SplashActivity` exists but `initWelcome(WiinInfo)` does not.
- `ContentItemClickListener`, `media/alticast/U`, `SportAdapter`,
  `AlticastPlayerVideoShortFragment`, and Wiinvent ad manager classes from
  3.5 do not exist in the 1.6 DEX inventory.
- `AlticastTopPlayerFragmentBase.onPlayerStateChanged` exists with signature
  `(AnalyticsListener.EventTime, boolean, int)`, not `(boolean, int)`.
- `AspectRatioFrameLayout.setResizeMode(I)V` exists in `classes2.dex`;
  the actual caller was subsequently located as `Ln2/y.a(Z)` and confirmed with a targeted code-unit window audit.
- `audit_huawei16_calls.py` is the next read-only scanner for candidate
  instructions invoking `setResizeMode`, `setRequestedOrientation` and
  `setOnApplyWindowInsetsListener`. Candidate hits require instruction-level
  verification before any bytecode patch.

## Build result

GitHub Actions run `40243346841` succeeded on commit
`c52c0c69ce56fb1763a87caf93a17f6e544687f3`, containing the manifest
rotation patch and two optional manifest privacy patches. This is a **compile
result**, not evidence of runtime compatibility. Do not deploy over the
existing differently signed 3.5 install or confuse a build success with a
verified launch.

## Focused invoke-candidate inventory (user's second local audit)

From `audit_huawei16_calls.py` on the same original SHA-256 APK:

- Video resize: two `invoke-virtual` candidates in
  `Ln2/y;->a(Z)V` (`classes.dex`, code-unit offsets 67 and 108)
  invoking `AspectRatioFrameLayout.setResizeMode(I)V`.
  Four further hits are inside ExoPlayer's own `PlayerView` and
  `StyledPlayerView` and must **not** be patched globally.
- Home runtime rotation: two candidates in
  `HomeBoxActivity.v2(Z)V` (`classes4.dex`, offsets 3 and 8);
  one candidate in `HomeBoxActivity.onCreate(Bundle)V`
  (offset 257). Other activities' orientation requests are out of scope.
- The previously used 3.5 home-activity insets listener callsite is
  absent. All ten direct `ViewCompat.setOnApplyWindowInsetsListener`
  candidates in this 1.6 audit occur in third-party/library code.
- `Huawei16RuntimeRotationPatch.kt` uses these exact 1.6 names and
  validates the expected call count and invoke argument formats before
  changing bytecode; depends on `Huawei16RotationPatch.kt`.
- The zoom patch must not be enabled yet: the two 1.6 resize callsites'
  argument-producing instructions and FIT/ZOOM values need independent
  inspection. `audit_huawei16_windows.py` dumps local code-unit windows
  without decoding APK resources or changing the APK.

These are code-reference matches, not proof that the modified runtime
works or that every candidate is an instruction boundary.

## User-supplied instruction windows: exact 1.6 call-site formats

`audit_huawei16_windows.py` on the original APK shows:

- `Ln2/y;->a(Z)V` (`classes.dex`): five registers, two input
  registers, 119 code units. At code-unit offset 67 there is a
  `invoke-virtual` to `AspectRatioFrameLayout.setResizeMode(I)V` with
  receiver `v4`, value `v0`; immediately preceding at offset 66 is
  `const/4 v0, 4` (zoom). At offset 108 there is a second invoke with
  receiver `v4`, value `v2`, whose reaching definition has **not yet
  been identified** from the windows. We do not claim `v2` is always FIT.
- `HomeBoxActivity.v2(Z)V` (`classes4.dex`): two orientation invokes
  using `{v0, v1}`, preceded by `const/4 v1, 1` and
  `const/4 v1, -1`, respectively. `v0` corresponds to `p0`
  (the activity), as `registers=2`, `ins_size=2`.
- `HomeBoxActivity.onCreate(Bundle)V` (`classes4.dex`): single
  orientation invoke using `{v13, v0}`, with `registers=15` and
  `ins_size=2`, so `v13` is `p0`.

`Huawei16ZoomPatch.kt` targets the second of the two resize invokes
and substitutes an equal-width `invoke-static` calling a helper which
sets `setResizeMode(4)` on the original layout object. It does not
overwrite or interpret `v2`, so its unknown origin does not affect
the zoom helper's behavior. The method fingerprint verifies the
first `const/4 4`, the exact call count, and the distinct argument
register arrangement. This **intentionally forces zoom on the second
branch**, and does not prove what the previous mode was. It is opt-in,
may crop edges, and is not pinch zoom.

Compilation and runtime testing must be reported separately. Do not
install an APK re-signed by Morphe over an APK signed differently.

## Version 1.6 implemented patch inventory (opt-in; runtime partially tested)

- `Huawei16PrivacyPatch.kt`: optional analytics/privacy and Crashlytics metadata patches.
- `Huawei16RotationPatch.kt`: change the HomeBoxActivity manifest orientation from `portrait` to `fullSensor`.
- `Huawei16RuntimeRotationPatch.kt`: match the two `HomeBoxActivity.v2(Z)` and one `HomeBoxActivity.onCreate(Bundle)` orientation invokes; replace calls with static fullSensor helper.
- `Huawei16ZoomPatch.kt`: target `Ln2/y.a(Z)` and force crop-to-fill in the second `AspectRatioFrameLayout.setResizeMode` branch using an equal-width static helper; leaves the unknown source value in `v2` untouched. Zoom compile passed in GitHub Actions run `40244648918` at `cc71c1f2ebb89f30f8a82ef9ad08a411c147d03d`.
- **Removed** `Huawei16PinchZoomPatch.kt`: a device runtime test produced `java.lang.LinkageError: n2.y.onTouch(View, MotionEvent) overrides final method in n2.n1` at `n2.d.<init>(AlticastPlayerController.java:192)`. The inherited `final` method prohibits the implementation strategy. No pinch feature is currently present in the 1.6 bundle.

All default to `false`. A passing compilation only checks Kotlin/Morphe build mechanics, not successful matching or execution against the user's original 1.6 APK. The APK remains on the user's device. No protected native libraries are patched.


## Confirmed device playback failure in the previous six-patch bundle

The user successfully applied the 1.6 patches. Playback creation failed
in the patched APK on Android 15, Lenovo TB361FU:

```
10-25 19:05:04.331 E AndroidRuntime: FATAL EXCEPTION: main
java.lang.LinkageError: Method boolean n2.y.onTouch(
  android.view.View, android.view.MotionEvent
) overrides final method in class n2.n1
  at n2.d.<init>(AlticastPlayerController.java:192)
  at com.viettel.tv360.ui.miniplay.AlticastTopPlayerFragmentBase.t1(
    AlticastTopPlayerFragmentBase.java:74)
```

This identifies the *experimental pinch zoom patch* as the definitive
source of this particular crash: it added `onTouch` to `n2.y`
despite an inherited `final` method in `n2.n1`. The subsequent
`System.exit(2)` resulted from the uncaught fatal exception.

Corrective action: delete the pinch source from the Huawei 1.6 branch.
The new 1.6 patch bundle now contains **five**, not six, optional patches.

A fixed MPP alone cannot repair an APK already generated with the
broken pinch patch. Regenerate from the untouched original APK and
select only the manifest rotation patch for initial playback testing.
Keep native libraries intact. Never erase user data to resolve a
signing conflict. If playback works, retest remaining patches separately.

The screenshot/Logcat also revealed a device registration token and
session cookie; redact credentials before sharing future full logs.

## Status bar patch (2026-10-25)

- Added `Huawei16StatusBarPatch.kt` as the **sixth optional Huawei 1.6 patch**:
  `TV360 Bitel 1.6 - Hide Status Bar`.
- Only changes `HomeBoxActivity.onCreate(Bundle)`, a method verified to exist
  in the original `classes4.dex`. Inserts an invoke at each normal return
  that calls a uniquely named private static helper, setting
  `Window.addFlags(0x400)` (`FLAG_FULLSCREEN`).
- Does **not** affect `LoginActivity`, Google Sign-In, navigation bar, player
  class `Ln2/y;`, DRM, licensing, or native libraries. It never overrides
  existing or inherited virtual methods (unlike the removed pinch experiment).
- The precise number of onCreate return instructions has not been externally
  audited; accepts 1..16 ordinary returns and otherwise fails closed.
  No claim is made about device-visible insets or whether player fragments
  later adjust the window flags.
- The user reports **normal video playback**, successful login with telephone
  credentials, and working sensor rotation on Lenovo TB361FU Android 15,
  after removing the defective pinch patch. This does not yet constitute
  runtime verification of the new status-bar patch.
- Test this patch independently. Confirm the top system bar disappears in
  home/player, the bottom system navigation remains usable, and playback,
  dialogs, notifications and rotation still work. Do not uninstall a
  differently signed installation just to test a patch.

## New opt-in options: status area, FIT/FILL, PiP (2026-10-25)

**Current Huawei 1.6 bundle contains eight named patches**, all
`default=false`. The user's installed version was already confirmed to
play video normally and rotate automatically **before these new patches**.
Do not treat Kotlin compilation as device verification.

### 1. Status-bar layout reservation

- `Huawei16StatusBarSpacePatch.kt` depends on `Huawei16StatusBarPatch.kt`.
- The Hide Status Bar helper first calls
  `Window.addFlags(0x400)` (`FLAG_FULLSCREEN`).
- The companion patch adds `View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN` and
  `LAYOUT_STABLE` (bitwise OR 0x500), preserving existing decor flags.
- Deliberately does not clear navigation insets, invoke
  `Window.setDecorFitsSystemWindows(false)`, zero arbitrary margins,
  or change the login/player view hierarchy.
- **Only the system-reserved top band is addressed.** Any blank area created
  by the app's own spacer, layout padding, or insets listener still requires
  verified 1.6-specific resource/method evidence.

### 2. Player Fit/Fill selection

- `Huawei16ZoomPatch.kt` offers a Morphe `stringOption`: FIT (mode 0,
  no cropping) or FILL/ZOOM (mode 4, crop edges).
- It changes only the two verified `Ln2/y.a(Z)V` invoke-virtual callsites.
  FIT replaces both; FILL replaces only the second because the first is
  already `const/4 ... 4` in the original APK.
- Same-width invoke-static calls pass the original layout receiver and
  integer register to a private static helper. No touch listeners,
  existing gestures, media assets, or protected native code are changed.
- **This is a patch-time selector, NOT an on-screen toggle while watching.**
  A verified UI anchor is still needed for a safe runtime menu.

### 3. Android 12+ playback-state-gated PiP experiment

- `Huawei16PipPatch.kt` adds PiP metadata only to the existing
  `HomeBoxActivity` manifest entry, preserving original `configChanges`
  and merging `screenSize|smallestScreenSize|screenLayout|orientation`.
- The bytecode hook is the already-audited
  `AlticastTopPlayerFragmentBase.onPlayerStateChanged(`
  `AnalyticsListener.EventTime, boolean, int)`.
- The injected static helper receives all four contiguous method inputs
  (including the receiver and EventTime) using equal-safe `invoke-static/range`.
  It attempts Android 12+ auto-PiP only while `playWhenReady=true` and
  ExoPlayer state is `READY=3`, on the host `HomeBoxActivity`, and only if
  the platform reports `android.software.picture_in_picture`.
- The patch does NOT add an `onDestroyView` override, does NOT override
  inherited `final` methods, and does NOT modify player pause/playback
  methods, DRM, login or native libraries.
- Read-only local audit:
  `python audit_huawei16_pip.py "/storage/emulated/0/Download/TV360 Bitel 1.6.apk"`.
  It verifies method definition/descriptor on the original user-owned APK.
- **Unverified on device:** actual PiP entry, whether player audio/video
  continues in PiP, and the effect of returning to the app. Auto-PiP may not
  activate or may immediately pause. Test separately with an untouched APK.
- This version does not implement PiP for Android 11 or older.

The prior 1.6 pinch-to-zoom override of inherited final `onTouch` remains
removed. Gesture-based brightness and volume controls already exist in the
user's app and are out of scope.
