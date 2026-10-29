# AD Guest-First Onboarding Implementation Plan

> **For agentic workers:** Use the existing native execution and independent review workflow. Track the steps below with their actual verification evidence.

**Goal:** Default to guest reading and manual notification opt-in while retaining city onboarding.

**Architecture:** Extend the existing AD Skip consent screens patch with targeted router, topic lifecycle and region-state edits; preserve original account, permission and completion services.

**Tech Stack:** Morphe2.0.1/Kotlin, smali, Python instruction execution, Desktop FULL/sign/redecode.

**Spec:** `docs/superpowers/specs/2026-10-28-ad-onboarding-design.md`

## Global Constraints

- Only original AD `be.persgroep.android.news.mobilead`9.22.0/9220000, minSDK32 and its existing two publisher signers.
- Default-enabled Skip consent screens retains its originalInput/Hide ads/Disable tracking dependencies; every mutation remains guarded.
- Preserve real accounts, explicit notification choices, OS permissions, region selection and pending deep-link data. No emulator or data reset.
- One heavy JVM at a time with1GiB maximum heap. Raw publisher source/data remain private. `dev` publication is authorized; stable acceptance remains separate.

## Review Focus

- Fresh guest, authenticated and restored login stages all reach city without opening login or creating the topic fragment.
- Completed users retain their original MainActivity route and incoming intent data/extras.
- Missing encrypted topic settings become empty; existing nonempty/empty sets are untouched and initialization sends no subscription request.
- OS permission granted/denied never preselects city notifications; explicit choices survive resume and can still request permission.
- Actual packed-switch targets and generic returns remain correct; super/Hilt initialization precedes activity completion.

## Task1: Startup and persistence regressions

**Files:** `tests/ad_onboarding.py`, `tests/ad_onboarding_contracts.py`, `tests/test_ad_onboarding.py`; integrate into `tests/verify_ad.py`.
**Interfaces:** `verify_onboarding(root: Path, enabled: bool) -> None`; execute the actual emitted methods and independently pin original graph/remainders. CI tests exercise our generated helper instructions without publisher inputs.

- [x] Pin original router, topic lifecycle, regional-state and retained manual/account methods before product changes.
- [x] Observe fresh startup/city-default regressions fail on the original or previously patched decoded artifact.
- [x] Exercise absent/existing preferences, all onboarding progress stages, completed deep links, both OS permission states and explicit toggle/Continue behavior. Validate real switch payload targets.

## Task2: Targeted onboarding implementation

**Files:** Create `patches/src/main/kotlin/patches/ad/OnboardingPatch.kt`; modify `ConsentScreensPatch.kt` only for integration/description.
**Interfaces:** `skipOnboardingPrompts()` executes inside the AD BytecodePatchContext. Add guarded static helpers `Lq9j;->morpheSeedTopicChoices()V` and `morpheContinueGuest(Context)V`.

- [x] At `q9j.b(Context,o9j,Intent)V`, seed missing topic settings only for the PUSH_NOTIFICATION_SCREEN transition using an ExternalLabel for original fallthrough. Replace its two onboarding-only `kx8.w` calls with the guest helper and its one LoginSeductionActivity class literal with the silent topic activity.
- [x] In topic `onCreate(Bundle)V`, neutralize the early feature-flag `k()` call and replace the topic-layout entry with `k(); return`. Keep original super/Hilt initialization and completed-user intent/extras fast-path.
- [x] At the one `as6.invokeSuspend(Object)Object` synthetic `yr6(Region,ZZ,String,I)` construction, force only notification/newsletter arguments false and use the real ordinary `yr6(Region,ZZ,String,Z)` constructor. Retain surrounding asynchronous work.
- [x] At FollowablePushActivity.onResume's single yr6.a copy call, change only mask0x19 to0x1d to preserve the manually chosen notification checkbox.
- [x] Run the new behavior checks GREEN plus the complete existing Python suite.

## Task3: Emitted validation, review and dev release

**Files:** Existing AD verifier, README, AD audit, generated catalogs through the release generator only.

- [x] Build Android MPP with the existing intended Maps key and existing authenticated package-registry environment.
- [x] Validate actual individual selections and all controls with FULL bytecode verification, signing, independent decoded effects and genuine premium fixtures. Run actual-SDK input guards.
- [x] Review the final change independently, fix concrete findings with regressions, and record exact static/device limits.
- [x] Update documentation, commit/push `dev`, verify the automatic prerelease and generated compatibility metadata, and sync its release commit.

## Published verification

Released [v1.6.0-dev.3](https://github.com/johnneerdael/dutch-applications-patches/releases/tag/v1.6.0-dev.3) from source commit `33fc1f4`; release workflow `40626775036` succeeded and generated commit `2b03ae4` was synced. The published MPP SHA256 is `73b8132bdc061f21fb5b6cea0d5337dcb5b1a6c7d021bc0ec6fba50ca476f858`. Its actual input-guard regression passed 351 assertions. Generated metadata contains 52 named controls: AD's five and NRC's six, including default-enabled startup skips and Hide newspaper tab. Required local individual/combined FULL/sign/redecode/browser/private-fixture checks and 38 Python tests passed. Phone acceptance remains pending.
