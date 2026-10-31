# Mihon retention acceptance

The patch supports the exact official GitHub Mihon 0.21.3 ARM64 APK documented in
[MIHON.md](../../docs/MIHON.md). It is optional and off by default. The `0L` source
correction belongs to Marc Went / Dunky13 in Mihon PR #4182; the Penguin source-test
branch supplements it without opening a duplicate fix PR.

## Release gate

Java 21 and Python 3 are sufficient. The gate verifies SHA-256 for the original APK
and official Morphe Desktop 1.19.1, applies the selectable patch, checks all 19,958
classes and original resources/native libraries, and verifies that reapplication
fails without an exported APK. The release pipeline runs it before publication.

```sh
python3 -B tests/mihon/validate_bundle.py \
  --bundle /absolute/path/patches.mpp --original-apk /absolute/path/mihon.apk \
  --desktop /absolute/path/morphe-desktop-1.19.1-all.jar \
  --report /absolute/path/mihon-release-verification.json
```

## Installed APK / Manager acceptance

Use an exclusively owned, rootable API35 ARM64 AVD, explicit emulator serial and
AVD name. Keep substantial host and guest disk space free before loading the
357 MiB bundle. The original and Manager APKs must share the disposable test key.
Do not uninstall an existing user installation or clear its data to make a test pass.

`build-native.sh` needs `ANDROID_HOME`, Android 35/build-tools on `PATH`, Java 21,
and `TEST_KEYSTORE` (disposable alias `test`, public password `android`). It builds
only instrumentation; Kotlin signatures under `compile/` never enter its DEX.
Install the original re-signed APK and test APK on the empty owned AVD, then run:

```sh
adb -s emulator-5582 shell am instrument --user 0 -w -r -e disposable true \
  -e mode baseline io.github.pengusto.patches.mihon.acceptance/io.github.pengusto.patches.mihon.tests.MihonRetention
python3 -B tests/mihon/seed_fixture.py --serial emulator-5582 --avd mihon-isolated
# Repeat instrumentation with mode ui-before and launch Mihon to capture the empty downloaded-only view.
python3 -B tests/mihon/android.py --serial emulator-5582 --avd mihon-isolated capture before
```

Seeding checks ownership and absence of other manga, stops the app, validates and
edits only its synthetic database, then restores it with its original Android UID.
Never open the database with platform SQLite while Mihon's bundled SQLite has it
open: the two engines do not provide a valid in-process fixture transaction.

Use `android.py --package app.morphe.manager` for observed Manager UI, and
`--package com.android.documentsui` for the picker. Import the candidate bundle,
load the original APK, confirm the patch begins disabled, enable it, apply and
export. A first run can present background-patching protection and onboarding prompts;
resolve visible first-run prompts (background patching, notification permission)
before waiting for the corresponding result. Allow the owned Manager test
installation as an APK source when Android requests it; record the actual
Package Installer update rather than treating the exported file as an install.
The installer can return directly to Manager after UPDATE; verify the installed
APK hash and Manager’s System installer state instead of assuming a DONE dialog. Wait for a positive stable export size and verify its APK signature before
pulling/installing. Preserve raw UI PNG/XML and ART runtime logs.

Install the actual Manager export using `adb install -r`. Run instrumentation with
`mode manager-art` (all six cases must pass), then `mode ui-after` and capture the
same filtered library. Use `snapshot.py --serial ... --avd ... LABEL` immediately
before/after same-key update/removal/reapplication; compare full manga/chapter
rows and persistent-file hashes. Retained download bytes must be identical.

[Fresh complete acceptance](evidence/2026-10-30/README.md) includes real
selection/application/export/install and state retention. A Desktop run or source
test is not a substitute for Manager acceptance.

## Final publication boundary

The Gradle semantic-release plugin rebuilds during its `publish` hook, after
`prepareCmd` validation. Validate again in `@semantic-release/exec.publishCmd`,
ordered after Gradle and before `@semantic-release/github`, so the upload uses the
actually checked final artifact. `test_release_order.py` protects this ordering.
The v1.5.0 published bundle was also downloaded and independently validated;
its Manager source cache SHA matches the public release asset exactly.
