# Issue #8 emulator regression — 2026-11-12

The original pre-release verification below used API 36. A subsequent [Android 12 / API 31 run](issue-8-android12.md) also passed all 26 assertions using the original lower-minSdk variants of the same app versions. The default API 32 APKs do not imply a patch-wide Android 12 limitation.

## Environment and scope

- Dedicated disposable AVD: `GeminiPatch_Issue8_API36`, Google APIs arm64, Android 16 / API 36, emulator serial `emulator-5580`.
- Original Google is preinstalled at `/product/priv-app/Velvet/Velvet.apk` and owns the original Google custom permissions.
- Tests ran as `uid=2000(shell)`, without `adb root` or `su`.
- Local inputs: Google `17.72.17.ve.arm64` and Gemini `1.0.995038376` (both minSdk 32).
- No Google account was added. These tests verify installation, permission isolation/authorization and launcher routing; they do not verify chat, token acquisition, actual Lens Binder functionality, or operation on the reporter's physical OnePlus 8 / Android 12.

## Reproduction and fix

| Test | Before | After |
| --- | --- | --- |
| Wrong clone with unchanged permission declarations | `INSTALL_FAILED_DUPLICATE_PERMISSION`, original Google owns the permission | Correct build installs alongside original Google |
| `pm uninstall --user 0` on the original system Google | Same duplicate-permission failure; system ownership persists | No need to remove original; restored it for positive tests |
| Client requests cloned Lens permission only | Clone permission is granted, but LensService still requires original permission; authorization denied | LensService requires cloned permission; authorization granted |
| Gemini with original Google disabled | Not tested against the old launcher | Patched Gemini starts the cloned Google's MainActivity; original state restored afterward |

The bad fixture uses the supported Google input, `com.quicksearch.bond`, and `updatePermissions=false`. In this APK the first reported collision was `com.google.android.apps.search.omnient.permission.LAUNCH_FROM_EXTERNAL_APP`, rather than the reporter's `LENS_SERVICE`. The failure class and original owning package match. The reporter did not supply their exact APK versions/artifact, so this is an equivalent misconfiguration reproduction, not a byte-for-byte replay of their APK.

For the Lens reference regression, the baseline is the repository's **v0.3.0** build, signed with the same local test key. Both baseline and fixed builds install with their xxhdpi split. The probe is an ordinary separately installed test app that requests only `com.google.android.googlequicksearchbox.morphe.permission.LENS_SERVICE`.

Baseline probe:

```text
client_has_clone_permission=true
lens_permission=com.google.android.googlequicksearchbox.permission.LENS_SERVICE
client_authorized_for_service=false
```

Fixed probe:

```text
client_has_clone_permission=true
lens_permission=com.google.android.googlequicksearchbox.morphe.permission.LENS_SERVICE
client_authorized_for_service=true
```

This checks Android's actual permission grant against the service's required permission. It is not a Lens request or a claim that all Lens features were exercised.

The final resumed component with the original Google disabled was:

```text
com.google.android.googlequicksearchbox.morphe/com.google.android.apps.search.assistant.surfaces.voice.robin.main.MainActivity
```

The original system package was restored/enabled after the tests. Full logs, screenshot and JSON results are local-only under `local/issue8/emulator-verified/` and `local/issue8/`.

## Incorrect configuration tests

`scripts/emulator/test-issue8-options.py` built real Gemini fixtures and checked:

- Unsupported `com.quicksearch.bond`: rejected by package-name validation.
- `updatePermissions=false`: rejected by custom-permission declaration validation.
- `updateProviders=false`: rejected by provider authority collision validation.
- Each of the three historical account experiments: patching stopped with an actionable error before replacing the existing APK output.

All nine fixture-build/rejection assertions passed. These configuration tests run on the host; the duplicate install, permission probe and launcher tests above run in the emulator.

## Re-running

Use a disposable AVD with the **exact** name `GeminiPatch_Issue8_API36` for this default-input run. Do not reuse a personal emulator. The runner permits only the explicitly selected dedicated API31/API36 AVD and matching SDK, and refuses physical devices or root shell. It temporarily removes/disables the original Google for user 0 and restores it in `finally` blocks.

```sh
# With the SDK's Google APIs arm64 image installed:
mkdir -p local/issue8/emulator/registry
printf 'no\n' | ANDROID_AVD_HOME="$PWD/local/issue8/emulator/registry" \
  "$ANDROID_HOME/cmdline-tools/latest/bin/avdmanager" create avd \
  -n GeminiPatch_Issue8_API36 -k 'system-images;android-36;google_apis;arm64-v8a' \
  -p "$PWD/local/issue8/emulator/avd" --device pixel_7
ANDROID_AVD_HOME="$PWD/local/issue8/emulator/registry" \
  "$ANDROID_HOME/emulator/emulator" -avd GeminiPatch_Issue8_API36 -port 5580 \
  -no-window -no-audio -no-snapshot -gpu swiftshader -memory 4096
```

After booting, run from another terminal:

```sh
scripts/build-all.sh
scripts/sign-apks.sh
scripts/emulator/build-contract-probe.sh
scripts/emulator/build-issue8-fixtures.sh
python3 scripts/emulator/test-issue8-options.py
python3 scripts/emulator/test-issue8.py \
  --adb "$ANDROID_HOME/platform-tools/adb" --serial emulator-5580 \
  --bad-apk local/issue8/fixtures/bad-signed.apk \
  --baseline-apk local/issue8/fixtures/baseline-signed.apk \
  --dist dist --probe build/contract-probe/probe.apk \
  --report-dir local/issue8/emulator-run
```

The fixture builder rebuilds the v0.3.0 baseline from its Git tag with the same original input. No Google APKs, test key, emulator images or personal logs are committed or distributed.

## Additional cached-process regression caught before release

A route-only check initially passed, but visual review showed a delayed “Google (Morphe) keeps stopping” dialog. Crash logs identified `GoogleSearchWidgetProvider` in `:googleapp` with `ClassCastException` during Dagger entry-point lookup. Release remained blocked until this was resolved.

The old `ekjg.b()` provider inserted normalization *before* a labelled RETURN_OBJECT. Its cached-value IF_NEZ still targeted the original return, skipping the inserted instructions. First call normalized correctly; later calls returned the unmodified `.morphe` process name, causing the compiled component selection to fall back to the wrong root.

The fix replaces the labelled return with the first normalization instruction and appends the remaining sequence plus return. Existing labels now enter normalization. `VerifyProcessName.kt` rejects any branch that jumps into/after this sequence.

`ProcessNameProbe` loads the actual installed APK code into the test process and checks first-call, cached-call and explicitly seeded cache paths. It never reads private app data. Baseline and fixed results:

| Provider path | v0.3.0 baseline | Fixed |
| --- | --- | --- |
| First call in probe process | `app.geminipatch.contractprobe` | same normalized name |
| Cached call | `app.geminipatch.contractprobe.morphe` (incorrect) | `app.geminipatch.contractprobe` |
| Seeded Google app cache | `com.google.android.googlequicksearchbox.morphe:googleapp` (incorrect) | `com.google.android.googlequicksearchbox:googleapp` |

The runner also enters the exported widget receiver with the benign explicit action `app.geminipatch.CONTRACT_PROBE`. This exercises its DI entry point without attempting to spoof Android's protected APPWIDGET_UPDATE broadcast. The baseline ClassCastException was reproduced; after the fix the same receiver entry and launcher test produced no clone fatal crash during the subsequent monitoring window. This is not a full widget rendering test.

Final recorded run: **26 emulator assertions passed**, plus **9 host fixture/configuration assertions passed**. The baseline/positive tests, probes, expected failure modes and crash monitoring all completed before the release tag. Logs and JSON are under `local/issue8/emulator-verified/` and `local/issue8/options/`. The signed APKs use the existing key, not a new test key.
