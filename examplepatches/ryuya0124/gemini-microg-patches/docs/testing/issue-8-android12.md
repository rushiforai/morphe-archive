# Issue #8 — Android 12 / API 31 verification

This records the original v0.3.1 run. The subsequent [v0.3.2 default-selection verification](default-clone.md) repeated the API31/API36 tests with automatic clone setup. The current fixture builder uses that default selection for its fixed APKs.

Verified on 2026-11-12, after v0.3.1 publication. The original pre-release run used API36; this is an additional API31 run, not a rewritten release history.

## Original input variants

| Input | Version / code | Original minSdk | SHA256 |
| --- | --- | --- | --- |
| [Google, monolithic nodpi](https://www.apkmirror.com/apk/google-inc/google-search/google-app-17-72-17-release/google-app-17-72-17-ve-arm64-android-apk-download/) | 17.72.17.ve.arm64 / 301831138 | 30 | `a269697a169ce4420b3873d89c9bd0f6c400d793b5cb9c2e2603a476a6a316ac` |
| [Gemini, arm64/arm Android 10+](https://www.apkmirror.com/apk/google-inc/google-gemini/google-gemini-1-0-995038376-release/google-gemini-1-0-995038376-3-android-apk-download/) | 1.0.995038376 / 345 | 29 | `793fdf8cdaf56729b9f63b1a3895b4a2c0284c38adbb2f638bf727ef491ff9be` |

The original Gemini APKM SHA256 is `71a5f817eb9bfddeae788011e8b6cbf2353e60cb459fe4617195766a1505fc49`; its extracted base MD5 is `05d309c43261a8a8faed020c99a1ba35`. Google and the APKM matched the distributor's SHA256 records. Both were acquired through the Mac's normal browser and kept locally. Neither original Manifest nor minimum SDK was modified before patching, and the patched minSdk values remain 30/29.

All **14 Google DEX files** and **3 Gemini DEX files** are byte-identical to the corresponding DEX files in the default API32 inputs. Existing version-specific hooks and the v0.3.1 implementation apply unchanged; no new hook names or SDK override patch were needed. The monolithic Google APK contains its resources and is installed without the API32 xxhdpi split.

Before selecting these variants, API31 correctly rejected the default API32 Google/Gemini files with `INSTALL_FAILED_OLDER_SDK`. That was an input-variant mismatch, not evidence of a patch-wide API31 limitation. Local experiments that edited minSdk were not installed or used for this verification.

## Emulator and results

- Dedicated AVD `GeminiPatch_Issue8_API31`, Google APIs arm64 image revision 11, Android release `12`, SDK `31`, serial `emulator-5582`.
- Original Google system package at `/product/priv-app/Velvet/Velvet.apk`.
- Normal `uid=2000(shell)`, no `adb root` or `su`. No Google account or microG was added to this emulator.
- Final run: **26/26 assertions passed**, with original Google restored afterward.

| Check | Baseline / incorrect configuration | Fixed v0.3.1 |
| --- | --- | --- |
| Duplicate permission | Reproduced with original Google present, and after `pm uninstall --user 0` | Correct clone installs beside original |
| Lens service authorization | Client has clone permission, service still requires original; denied | Service requires clone permission; granted |
| Process-name cache | First call normalized, cached/seeded values unnormalized | First/cached/seeded paths normalized |
| Widget receiver entry | v0.3.0 `ClassCastException` reproduced | No clone fatal crash after the same benign broadcast and launch monitoring |
| Gemini launcher with original Google disabled | Not asserted against old launcher | Cloned Google MainActivity becomes resumed activity |

The first duplicate reported by the API31 package manager was `com.google.android.googlequicksearchbox.permission.C2D_MESSAGE`, owned by the original Google package. This matches the issue's failure type and owner; it is not an exact replay of the reporter's unavailable APK or its first `LENS_SERVICE` collision.

The final screen displayed **“Sign in to use Gemini”** and **“Sign in to your account to access Gemini (10)”**, without a missing-Google or crash dialog. This is an installation/permission/process/startup regression check. Account login, token acquisition, chat, actual Lens processing and the reporter's physical OnePlus8 remain untested here.

The first API31 run exposed a test-harness difference: Android12 dumps the foreground activity as `mResumedActivity:` rather than `topResumedActivity=`. The app had reached MainActivity, but the API36-only parser rejected the result. The runner now recognizes both actual resumed-activity formats; the complete 26-assertion run was repeated successfully. Device identity, SDK, normal-shell and dedicated-AVD guards remain enforced.

## Reproduction

Provide the exact original Google APK and extracted Gemini base above. The fixture builder checks their hashes and writes only under `local/issue8/api31/build`; the default `inputs/` and `dist/` are retained. It also rebuilds v0.3.0 from its Git tag and creates an intentionally invalid clone for the before/after tests. Do not distribute these copyrighted APKs or local signing keys.

```sh
sdkmanager 'system-images;android-31;google_apis;arm64-v8a'
mkdir -p local/issue8/api31/registry
printf 'no\n' | ANDROID_AVD_HOME="$PWD/local/issue8/api31/registry" \
  "$ANDROID_HOME/cmdline-tools/latest/bin/avdmanager" create avd \
  -n GeminiPatch_Issue8_API31 -k 'system-images;android-31;google_apis;arm64-v8a' \
  -p "$PWD/local/issue8/api31/avd" --device pixel_5
ANDROID_AVD_HOME="$PWD/local/issue8/api31/registry" \
  "$ANDROID_HOME/emulator/emulator" -avd GeminiPatch_Issue8_API31 -port 5582 \
  -no-window -no-audio -no-snapshot -gpu swiftshader -memory 4096
```

After boot, from another terminal with the repository's local signing environment:

```sh
scripts/setup-tools.sh
scripts/emulator/build-android12-fixtures.sh /path/to/google-api30.apk /path/to/gemini-api29-base.apk
scripts/emulator/build-contract-probe.sh
python3 scripts/emulator/test-issue8.py \
  --adb "$ANDROID_HOME/platform-tools/adb" --serial emulator-5582 \
  --avd GeminiPatch_Issue8_API31 --monolithic-google \
  --bad-apk local/issue8/api31/build/dist/bad.apk \
  --baseline-apk local/issue8/api31/build/dist/baseline.apk \
  --dist local/issue8/api31/build/dist --probe build/contract-probe/probe.apk \
  --report-dir local/issue8/api31/emulator-verified
```

Manifest/DEX clone-contract checks, work-profile/compliance/trampoline branch checks, process-cache control-flow verification, signature verification and Gemini package visibility all passed before emulator execution. Local evidence: `local/issue8/api31/build.log`, `emulator-verified/results.json`, individual assertion logs and `fixed-screen.png`. These files are ignored by Git. No new patch release or signing key was required.
