# Actual Android Morphe Manager acceptance

This records the historical 1.1.0 three-patch suite. For the five-patch 1.2.0
suite and released remote-source checks, see [the next-fixes acceptance](README-next-fixes.md).

This checks the Android app's real UI and exported APKs. It does not invoke the
Desktop CLI, a Manager patcher API, or modify Manager's settings database.
The tested profile is official Manager **2.2.0**, Penguin **1.1.0**, official
Finamp **1.0.1 universal**, Android **15 / API 35 ARM64** on the disposable
`emulator-5580` / `penguin` AVD. Physical devices are a separate scope.

Manager APK SHA-256:
`5a175a77f671088c97ebaa6fdd65b1d4ed9f07dda44d59a37d3d11a712da2c44`.
Its signer is `0b6c9515afb195fac59601696ba0a7907a0b217ccf720b43148427ccf64343e7`.
The downloaded Penguin bundle must match
`8002e1497b68db7b3eeade93b19503ac72d3e6ef8540a342f3326b9933b5f307`.

## Setup and normal UI path

Reuse the SDK/AVD documented by the native fixture; never wipe it or target a
physical phone. Install the verified Manager APK. Add the remote source through
**Sources → Add → Remote**, using `https://github.com/pengusto/penguin-patches`.
Confirm Penguin 1.1.0 and independently hash Manager's cached `patches.jar` under
its `app_patch_bundles` directory. This proves the normal source download, even
if a local MPP was copied to shared storage for inspection. A freshly published
manifest can still be served from the raw CDN/HTTP cache: the 1.2.0 run observed
`max-age=300` and succeeded after normal expiry. Wait and refresh through the UI;
verify the cached MPP hash before reporting the released version as tested.

Put the original APK in `/sdcard/Download/finamp-manager-test/`. Files copied by
ADB may need `MEDIA_SCANNER_SCAN_FILE` and a provider refresh before Downloads
lists them. Select **Finamp → No, I already have an APK**, then the original file
through Android's file picker. Do not choose an already patched installed APK.

The three Penguin rows are initially off. Toggle each by name and retain
**0/5** on the unrelated Morphe 1.48.0 universal-patch tab in this recorded setup.
The suite uses masks 1 (title), 2 (artists), 4 (loading), 7 (all). Source selection
is saved after patching; leaving the selector before patching may discard it.

For update acceptance, import the existing **disposable** fixture key through
Settings → Signing key. The fixture certificate is
`5bcbdaac2aebee68090aa00926622ccb5439ad0bec86d3d219ad0b74036d3628`.
It is PKCS12 despite its `.jks` extension. Synthetic credentials are alias
`test`, password `android`; no real user key is used or committed. Masked password
controls expose bullets, so use `manager_ui.py type --masked` for that field.

Default **Use embedded VM** is on. Test the four masks there, then turn it off
for Android ART and test mask 7 again. Capture the setting and require a new
Manager runtime log for every run; a filename alone does not establish runtime.

## Repeatable guarded UI controls

`manager_ui.py` reuses the existing fresh-hierarchy, emulator and viewport
guards. It limits package targets to Manager and the observed system picker,
installer and settings apps. Use `inspect`, `capture`, `tap`, `type`, `wait`,
`hide-ime`, `back` and `scroll`; every action resolves the current hierarchy.
The default output stays under `.scratch/finamp/manager-2.2.0/`.

```sh
python3 -B tests/finamp/manager_ui.py --adb "$ADB" inspect
python3 -B tests/finamp/manager_ui.py --adb "$ADB" capture selected-patches
```

After loading the original APK and choosing Penguin, one actual apply/export:

```sh
python3 -B tests/finamp/manager_case.py --adb "$ADB" --mask 1 --runtime jvm \
  --original-apk "$FINAMP_APK" --native-report "$NATIVE_REPORT"
```

It toggles only the three named UI rows, patches, waits for the Patched result,
checks the actual new runtime log, uses **Save → Android file picker**, pulls the
export and verifies its native hash/retained entries. `--runtime` verifies the
setting; it does not set it. Add `--from-result` for the next mask: the observed
**Home → Finamp → Patch** path reuses the cached original. The native input guard
and exact output comparison reject accidental reuse of a patched input.

Expected exported names are `manager-mask-1-jvm.apk`, `-2-jvm.apk`, `-4-jvm.apk`,
`-7-jvm.apk` and `-7-art.apk`. Existing host/device outputs are rejected rather
than silently reused. Do not invoke another UI controller while a case runs.

## Independent exported-APK verification

`NATIVE_REPORT` comes from `validate_bundle.py` against the released MPP and
official original. Verification is read-only and requires existing build tools:

```sh
python3 -B tests/finamp/verify_manager_outputs.py \
  --apk-dir .scratch/finamp/manager-2.2.0/apks --original-apk "$FINAMP_APK" \
  --native-report "$NATIVE_REPORT" --build-tools "$BUILD_TOOLS" \
  --java-home "$JAVA_HOME" --signer-sha256 "$TEST_CERT_SHA256" \
  --report .scratch/finamp/manager-2.2.0/output-verification.json
```

All five expected exports must pass native output hashes, retained-entry
comparison, ARM64-only checks, APK signature verification, uncompressed native
entries required by this manifest and 16 KiB ZIP loading alignment. `--expect` permits an exploratory subset but marks it as an incomplete
suite. No APK, keystore or private fixture state belongs in Git.

## Installation, persistence and rejection

Use Manager's Install/Reinstall and Android's UPDATE action with the same
fixture signer, then hash the installed `base.apk` against the exported APK.
The installer may return to its Settings trampoline or directly to Manager.
Inspect the actual foreground package and installed APK hash instead of waiting
for a fixed installer success screen. First-use notification/tour prompts must be handled before resuming the intended action.

Open Finamp from Manager. Use the existing local synthetic Jellyfin fixture and
require preserved login. Read the actual **Dark** and **Metadata order** values
after bringing their dropdowns into view; seeing only the row caption is not a
value check. The Finamp fixture stays under its default
`.scratch/finamp/android/fixture-live` ownership root.

For fail-closed acceptance, the recorded run uses **controlled cache fault
injection**, separate from APK-picker acceptance. Create a separately signed
fixture APK with only its ARM64 engine altered and place it at
`/sdcard/Download/finamp-manager-test/Finamp-invalid-engine.apk`. Never install it.
From Manager Home with ART selected, run:

```sh
python3 -B tests/finamp/manager_fault.py --adb "$ADB" \
  --mutant-apk "$ENGINE_MUTANT" --original-apk "$FINAMP_APK"
```

The helper requires the cached original's exact official hash and refuses an
existing backup. It backs up only that disposable input APK, temporarily copies
in the mutant, and starts the selected patches through the normal UI. It requires
a new ART run, an explicit failure attributed to a selected patch, the native
engine guard message and no success/export action. It restores the original
bytes, UID/GID and mode in `finally`. It never edits the Manager database or key.
The recorded run then rebuilds the restored original in ART with
`manager_case.py --from-result --recovery`, proving rejection does not poison
later invocations. Close any visible diagnostics dialog before using Home.


Keep raw APKs and private setup files ignored. Publish only reviewed synthetic
screenshots, runtime/error excerpts and the normalized report, retaining exact
artifact/source provenance and the physical-device limitation.
