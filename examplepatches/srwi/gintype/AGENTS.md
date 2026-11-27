# AGENTS.md — Autonomous Building, Patching, and Device Deployment

This document provides portable instructions for developers, CI pipelines, and AI agents to build, test, patch, and deploy `GinType` on any Android device via USB ADB, Wireless Debugging, or on-device Termux.

---

## 1. Project Overview & Architecture

`GinType` is a standalone Morphe/ReVanced patch repository providing Gboard patches:

1. **Thicc Top Bar** (`thicc_top_bar`): Improved suggestion bar with vertical wheel scrolling and sentence history.
2. **MultiGlide** (`multiglide`): Two-finger chorded swipe and tap+swipe gesture typing powered by the Kinetica algorithm and Gboard dictionary.
3. **Package Rename** (`package_rename`): Renames the patched package to `dev.srwi.com.google.android.inputmethod.latin` with a customizable launcher/IME display name (`GinType` by default) so non-rooted devices can install it side-by-side alongside official Play Store or system-signed Gboard.

### Target & Non-Interference Guarantee
- **Target Application Package**: `com.google.android.inputmethod.latin` (pinned target: `18.5.4.993608717-release-arm64-v8a`)
- **Renamed Side-by-Side Package**: `dev.srwi.com.google.android.inputmethod.latin`
- **Isolated Extension Namespace**: `dev.srwi.gintype`
- **Independent Settings Entry Key**: `gintype_entry` ("GinType")
- **Independent ContentProvider Authority**: `${applicationId}.gintype`
- **Coexistence**: Can be applied alone or combined with other Morphe/ReVanced patch bundles without settings collisions or provider crashes (enable `Package Rename` in at most one bundle).
- **Language**: English only (all code, resource strings, tests, commit messages, and documentation).
- **Module Guides**: See [`patches/AGENTS.md`](patches/AGENTS.md) for patch registry, target bindings compiler, and Runtime ABI contracts, and [`extensions/AGENTS.md`](extensions/AGENTS.md) for MultiGlide/Kinetica runtime hooks, Thicc Top Bar reflection, and settings codegen.
- **Behavioral Specifications**: [`docs/multiglide-integration.md`](docs/multiglide-integration.md) is the authoritative behavioral specification for how MultiGlide integrates into Gboard (`MG-01`–`MG-21`). All code and tests for MultiGlide integration MUST conform to this document.

---

## 2. Environment Prerequisites

- **Java**: JDK 21+ (`JAVA_HOME` pointing to JDK 21)
- **Android SDK**: Build-Tools & API Platform 36 (`ANDROID_HOME` or `ANDROID_USER_HOME`, or `sdk.dir` in `local.properties`)
- **ADB**: Android `platform-tools` (`adb`) on Linux/macOS/Windows or `android-tools` inside Termux
- **Morphe CLI**: `morphe-cli.jar` or a native/script `morphe-cli` executable on `PATH`

```bash
export JAVA_HOME=/path/to/jdk-21
export ANDROID_HOME=/path/to/android-sdk
export PATH="$ANDROID_HOME/platform-tools:$PATH"
```

---

## 3. Building & Running Tests

### Build MPP Bundle & Extension DEX
```bash
./gradlew :extensions:extension:compileReleaseJavaWithJavac :patches:buildAndroid
```
Output artifact: `patches/build/libs/patches-1.0.0.mpp`

### Run Tests
```bash
# Patches contract, manifest/settings/package-rename transform, and wiring tests
./gradlew :patches:test

# Extension core logic unit tests (Thicc Top Bar helpers and MultiGlide gesture decoder/geometry/accent folding)
./gradlew :extensions:extension:testDebugUnitTest \
  --tests "dev.srwi.gintype.extension.thicctopbar.*" \
  --tests "dev.srwi.gintype.extension.multiglide.*"
```
> Note: Other Robolectric-based Android tests in `:extensions:extension` require Robolectric Android runtime JARs (not available offline or on ARM64 Termux hosts). The filtered Thicc Top Bar + MultiGlide unit suites above run cleanly in all environments.

### Refresh `patches-list.json`
Run whenever patch names, descriptions, defaults, or options change:
```bash
./gradlew :patches:generatePatchesList
```

---

## 4. Patching Gboard

`patch-gboard.sh` accepts `.apk`, `.apks`, `.apkm`, or `.xapk` inputs (Morphe CLI merges split APK archives into a standalone output APK automatically).

### Option A: Side-by-Side Install (`Package Rename`, Recommended for Non-Rooted Phones)
Use `--rename` (`-r`) so the patched APK installs alongside stock Gboard with no signature conflict:
```bash
./patch-gboard.sh \
  --rename \
  --app-name "GinType" \
  -i /path/to/gboard-18.5.4.xapk \
  -o ./gintype-patched.apk \
  -m /path/to/morphe-cli.jar
```

### Option B: In-Place Replacement (Original Package ID)
Omit `--rename` to keep `com.google.android.inputmethod.latin` (requires root/mount, uninstalled updates/systemless override, or a matching signing key):
```bash
./patch-gboard.sh \
  -i /path/to/gboard-18.5.4.xapk \
  -o ./gintype-patched.apk \
  -m /path/to/morphe-cli.jar
```

Useful `patch-gboard.sh` flags:
- `--skip-build`: Skip rebuilding `.mpp` if one already exists in `patches/build/libs/`.
- `-b, --build`: Force rebuild of extension and `.mpp`.
- `-f, --force`: Bypass Morphe CLI's target version check (useful when experimenting on newer Gboard builds; fingerprint compatibility is only guaranteed on `18.5.4.993608717-release-arm64-v8a`).

### Direct Morphe CLI Invocation
Note that in Morphe CLI, `-O<key>=<value>` applies to the preceding `-e "<Patch Name>"`:
```bash
java -jar morphe-cli.jar patch \
  --patches=patches/build/libs/patches-1.0.0.mpp \
  --exclusive \
  -e "Thicc Top Bar" \
  -e "MultiGlide" \
  -e "Package Rename" \
  -Oapp_display_name="GinType" \
  -o ./gintype-patched.apk \
  /path/to/gboard-18.5.4.xapk
```

### Combining with Other Patch Bundles
```bash
java -jar morphe-cli.jar patch \
  --patches=patches/build/libs/patches-1.0.0.mpp \
  --patches=/path/to/other-gboard-patches.mpp \
  -e "Thicc Top Bar" \
  -e "MultiGlide" \
  -e "Package Rename" \
  -e "<Other Patch Name>" \
  -o ./gboard-all-patches.apk \
  /path/to/gboard-18.5.4.xapk
```

---

## 5. Portable Device Deployment (USB ADB or Wireless Debugging)

These steps work from any workstation over USB or Wi-Fi, or directly on the target Android phone inside Termux.

### Step 1: Connect ADB
- **Check existing connections first**: Always run `adb devices` before asking the user for an IP address, wireless debugging port, or pairing code. If a device is already listed in the `device` state (e.g. an active Wireless Debugging session in the running ADB daemon), reuse it directly with `adb install` / `adb shell` / `adb logcat` without re-connecting.
- **USB debugging**: Plug in the device, accept the RSA prompt, and confirm with `adb devices`.
- **Wireless debugging** (**Settings > Developer options > Wireless debugging**):
  1. First-time pairing (**Pair device with pairing code**):
     ```bash
     adb pair <device_ip_or_127.0.0.1>:<pairing_port> <pairing_code>
     ```
  2. Connect using the port shown on the Wireless debugging main screen:
     ```bash
     adb connect <device_ip_or_127.0.0.1>:<debug_port>
     adb devices
     ```
  *(Use `127.0.0.1` when running ADB in Termux on the phone itself; use the phone's LAN IP from a PC. If multiple devices are attached, export `ANDROID_SERIAL=<serial>`.)*

### Step 2: Obtain a Clean Base Gboard APK or Split Bundle
If you do not already have a downloaded `gboard-18.5.4*.xapk` / `.apk`, you can extract the installed Gboard package from the connected device. Modern Play Store installs use **Split APKs** (`base.apk` + `split_config.*.apk` + feature splits) — pull **all** splits rather than only `base.apk`, and archive them with `jar c0Mf` (from JDK 21) so Morphe CLI merges every density/feature split cleanly:

```bash
rm -rf ./gboard-splits && mkdir -p ./gboard-splits
for apk_path in $(adb shell pm path com.google.android.inputmethod.latin | sed 's/^package://;s/\r//'); do
  adb pull "$apk_path" ./gboard-splits/
done

SPLIT_COUNT=$(find ./gboard-splits -maxdepth 1 -name '*.apk' | wc -l)
if [ "$SPLIT_COUNT" -eq 1 ]; then
  mv ./gboard-splits/*.apk ./gboard-base.apk
else
  jar c0Mf ./gboard-base.apks -C ./gboard-splits .
fi
```
> Check the extracted version (`adb shell dumpsys package com.google.android.inputmethod.latin | grep versionName`). If the device has a newer Play Store release than `18.5.4.993608717-release-arm64-v8a`, either provide the pinned `18.5.4` `.xapk`/`.apk` or pass `--force` (`-f`) to test against the newer build.

### Step 3: Patch the Extracted APK/APKS
```bash
# Side-by-side (non-root compatible, package: dev.srwi.com.google.android.inputmethod.latin)
./patch-gboard.sh --rename -i ./gboard-base.apks -o ./gintype-patched.apk -m /path/to/morphe-cli.jar
```

### Step 4: Install and Enable Keyboard
```bash
# -r replaces an existing patched build; -d allows downgrade if needed
adb install -r -d ./gintype-patched.apk
```
- **If `Package Rename` was enabled (side-by-side)**: enable and optionally select the renamed IME (`dev.srwi.com.google.android.inputmethod.latin`):
  ```bash
  adb shell ime enable dev.srwi.com.google.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME
  adb shell ime set dev.srwi.com.google.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME
  ```
- **If `Package Rename` was omitted (in-place)**: replacing stock Play Store Gboard on a non-rooted device fails with `INSTALL_FAILED_UPDATE_INCOMPATIBLE` because the APK is signed with Morphe's keystore rather than Google's key. Re-run with `--rename` unless you are using a rooted/mounted install or have uninstalled Gboard updates with a matching signature setup.

### Step 5: Restart & Verify Runtime
Force-stop the target package (`TARGET_PKG=dev.srwi.com.google.android.inputmethod.latin` for `--rename`, or `com.google.android.inputmethod.latin` for in-place), open the keyboard in any text field, then check runtime logs:

```bash
TARGET_PKG=dev.srwi.com.google.android.inputmethod.latin
adb shell am force-stop "$TARGET_PKG"
adb shell pidof "$TARGET_PKG"

adb logcat -d -s \
  GboardPatches \
  GboardThiccTopBar \
  GboardMultiGlide \
  GboardMultiGlideDict \
  GboardMultiGlideTrace \
  ThiccTopBarGboardReflector | tail -n 50
```
Open Gboard Settings -> **GinType** to configure MultiGlide swipe timing, autospace, Thicc Top Bar, and log export.

---

## 6. Coding Standards for Autonomous Agents

- **Language**: English exclusively across commit messages, code, comments, resource strings, tests, and documentation.
- **Commit Cadence**: Commit after each logical, verified step using conventional commits (`feat`, `refactor`, `fix`, `docs`).
- **Scope**: Maintain only `Thicc Top Bar`, `MultiGlide`, and `Package Rename` unless explicitly asked otherwise.
- **Specification Governance (`docs/multiglide-integration.md`)**: [`docs/multiglide-integration.md`](docs/multiglide-integration.md) defines the authoritative behavior for MultiGlide's Gboard integration. Before implementing any code change that would alter, add, remove, or contradict an `MG-*` rule in that specification, you MUST inform the user which rule(s) are impacted and obtain **explicit user confirmation** to change the specification. Update the specification, implementation, and corresponding unit tests together.
- **Namespace Integrity**: Always use `dev.srwi.gintype` for extension/patch code and `dev.srwi.com.google.android.inputmethod.latin` for renamed Gboard manifests.
