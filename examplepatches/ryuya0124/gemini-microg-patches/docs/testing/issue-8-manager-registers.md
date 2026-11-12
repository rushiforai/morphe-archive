# Issue #8: Android Manager startup VerifyError — v0.3.3

## Reproduction and cause

The [new report](https://github.com/ryuya0124/gemini-microg-patches/issues/8#issuecomment-6820682638) says Google now installs but crashes with `VerifyError`, `ekjg.b()` and `register index out of range (1 >= 1)`.

On 2026-11-12, both the public v0.3.2 MPP and candidate v0.3.3 MPP were imported through **Android Morphe Manager 2.5.0's actual GUI** on the dedicated Android12/API31 Google APIs AVD. Each patched the same original Google API30 nodpi APK using the default compatible selection (10 patches). No Expert mode, official Clone app or manual clone options were used. Manager exported both APKs with its own test signing key.

Manager 2.5.0 uses Patcher 2.3.0. Its [MutableMethod implementation](https://github.com/MorpheApp/morphe-patcher/blob/v2.3.0/src/main/kotlin/app/morphe/patcher/util/proxy/mutableTypes/MutableMethod.kt) wraps `MutableMethodImplementation` in a private subclass. The old `impl.javaClass.getDeclaredField("registerCount")` searches only that subclass; the field is declared in its superclass. The exception was swallowed, leaving the provider with **one declared register** while injecting instructions that use **v1/v2**. The Desktop/Patcher1.12 generation path used in earlier regression runs did not expose this failure.

The Manager-generated v0.3.2 APK installed successfully, then produced the same `ekjg.b(): register index out of range (1 >= 1)` VerifyError in `:googleapp` on the emulator. Loading its real provider through ProcessNameProbe also failed with that VerifyError. The strengthened static verifier rejected the same APK for its out-of-bounds register.

## Change and verified result

- Create `morpheNormalizeProcessName(String): String` on the provider class as a private static synthetic method with **three declared registers**, using v2 for its parameter and v0/v1 as scratch registers.
- Keep the original provider's register allocation unchanged. Replace each labelled return with a call to the helper, then move/return the result in the original register. First, cached and seeded-cache paths all enter normalization.
- Remove the same reflective allocation pattern from GMS bypasses, which only need an existing v0; validate that allocation instead. Historical account fallback remains disabled/rejected and does not regain register reflection.
- Validate register operands, helper signature/layout/instructions, every return and branch target in `VerifyProcessName.kt`.

| Check | Result before publication |
| --- | --- |
| Actual Android Manager2.5 generation, v0.3.2 | Installs; exact reported VerifyError reproduced |
| Actual Android Manager2.5 generation, v0.3.3 | Provider/helper register checks pass; first/cached/seeded calls normalize |
| Manager outputs on API31 | All 16 recorded assertions pass, including test-clone removal/setup/cleanup, old failure and fixed widget/Google startup without a clone runtime crash |
| Desktop default builds on API31 and API36 | 26/26 regression assertions pass on each, including the separate v0.3.0 permission/cache/widget baseline |
| Release-MPP option regression | 11/11 assertions pass; unsupported historical experiments remain rejected |
| MPP packaging | All 26 JVM classes present in Android DEX; Desktop reads the MPP |

The Manager runtime test uses normal shell UID2000, no root command and no physical device. It refuses any AVD other than `GeminiPatch_Issue8_API31`, checks SDK31, and removes only the clone's disposable test data. The original Google package remains installed. An initial launch assertion used a package-only MAIN/LAUNCHER intent that failed to resolve; the same APK launched via its declared SearchActivity entry. The runner now uses that explicit entry and was rerun in full.

No Google account or microG was added to the emulators. These checks cover generated DEX, installation, provider behavior and startup, not login/chat, complete widget functionality or the reporter's OnePlus8. The prior physical Secure Folder chat confirmation remains a v0.3.2 Desktop-build result; v0.3.3 was not deployed to that device for this regression.

## Repeat the check

Use the original API30 Google input and hashes in [the Android12 report](issue-8-android12.md). Download Manager2.5.0 from its [official release](https://github.com/MorpheApp/morphe-manager/releases/tag/v2.5.0). The tested Manager APK SHA256 was `681a1c179b9e8698c857a092df0ca9a91e294a103743107f4fe96da20cb42ddc`.

1. Build the candidate with `scripts/build-mpp.sh`; retain a separate copy of the public v0.3.2 MPP.
2. In Manager Sources → Add → Select patch source files, import v0.3.2. Select the original Google APK, retain defaults and save the generated APK.
3. Import the candidate as a source update, patch the **same original APK** and save a separate output. Do not repatch the modified APK.
4. Run `VerifyProcessNameKt` against both exports. Require an out-of-range rejection for v0.3.2 and a pass for the candidate.
5. Build `scripts/emulator/build-contract-probe.sh`, then run:

```sh
python3 scripts/emulator/test-issue8-manager.py \
  --adb "$ANDROID_HOME/platform-tools/adb" --serial emulator-5582 \
  --baseline-apk local/issue8/register-fix/manager-v0.3.2-google.apk \
  --fixed-apk local/issue8/register-fix/manager-v0.3.3-google.apk \
  --probe build/contract-probe/probe.apk \
  --report-dir local/issue8/register-fix/manager-api31-results
```

The runner uninstalls the AVD's Google clone before testing and removes the Manager-signed clone afterward, so subsequent Desktop-signed fixture tests can run. The assertion count includes optional removal of a previously installed test clone (16 in the recorded run; 15 on a clean AVD).

For future Patcher upgrades, repeat actual Android Manager generation; running only Desktop-generated APKs on Android does not test the Android patching backend. Keep both exported APKs as local evidence and add register-bound checks when introducing scratch registers.

Ignored local evidence: `local/issue8/register-fix/manager-ui/` (GUI XML), both exported APKs, `manager-api31-results/results.json`, `desktop-api31-results/`, `desktop-api36-results/`, `desktop-api31-build.log`, `desktop-api32-build.log`, and `local/issue8/auto-clone/options/results.json`. Original APKs, output APKs, signing keys and raw device logs are not published.

Exported APK SHA256 for this local Manager signing key:

| Output | SHA256 |
| --- | --- |
| v0.3.2 | `9d4400389b1bd4ce806e9fe4aaa078158cda8f33268f443272213a2d32d5c96d` |
| v0.3.3 | `ff1d047f86f314efc1d6b43bceb71e2ccbc9de71fb9d372be322ed93200e9ef8` |
