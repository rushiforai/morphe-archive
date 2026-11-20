# Feature and verification status — main branch

**Branch:** `main` · **Release channel:** stable (promoted from development snapshot `v1.1.0-dev.14`)

This page separates implemented code from the verification evidence recorded in the repository. Status statements reflect the checked-in project notes; they are not a fresh physical-device test.

## Patch inventory

| Patch | Target | Default | Available | Working well | Purpose |
|---|---|---:|---|
| AMOLED theme | Instagram | On | 🟢 ✓ | 🟢 ✓ | Forces supported dark surfaces to pure black |
| Add Mods menu | Instagram | Off | 🟢 ✓ | 🟢 ✓ | Adds the home-feed long-press menu and companion activities |
| Change channel name | Instagram | Off | 🟢 ✓ | 🟢 ✓ | Replaces the release-channel label; option `channelName` defaults to `Mods` |
| Remove ads | Instagram | On | 🟢 ✓ | 🟢 ✓ | Suppresses the ad-pod flow and includes the bundled override set |
| Remove snooze warning | Instagram | On | 🟢 ✓ | 🟢 ✓ | Removes the alpha-build expiry/snooze warning dialog |
| Unlock developer options | Instagram | On | 🟢 ✓ | 🟢 ✓ | Installs MobileConfig overrides and enables the employee-options gate |
| Upload Instants from Gallery | Instagram | Off | 🟢 ✓ | 🟢 ✓ | Adds gallery-based photo/video selection to the Instants camera |
| Instants Mod | Instagram Instants | Off | 🟢 ✓ | 🔴 ✗ | Adds camera gallery selection and save-to-gallery action |
| — | Threads | — | 🚧 Under development | — | Not included in the stable release |

Defaults and names above are taken from the promoted generated `patches-list.json`. The gallery-upload patch name is shown with corrected spelling in documentation. The published patch identifier remains unchanged in v1.1.0 for compatibility.

## Runtime MobileConfig installation

The canonical source is `config/mc_overrides.json`. The extension embeds it as a compact `BuildConfig` string at build time. The Unlock developer options patch injects the runtime installer after the Instagram app-shell `Application.onCreate` super call.

The writer installs the file atomically and idempotently at:

```text
<filesDir>/mobileconfig/mc_overrides.json
```

The same patch forces the employee-options gate used by the shake-gesture entry. The newly installed overrides are read after an app restart. The repository validator checks the JSON shape and required employee-options candidate flag; it does not prove that an app build will load the file.

The old SAF/removable-storage design was removed. The extension is merged as DEX into the target APK, so an asset stored in the Morphe host app is not available as a target-app asset. The runtime writer avoids that broken host-asset assumption.

## Mods menu and extension

The optional Add Mods menu patch adds a long-press home-feed entry point. The extension includes:

- Meta menu and developer-options navigation
- About and build information pages
- Applied package-patches information
- Miscellaneous tools and backup import
- Crash-report viewer and guarded menu actions
- App restart action
- System-bar inset handling for menu pages

Menu actions report handled failures through a toast and in-app crash log rather than intentionally propagating an exception into the host app. The crash log path documented by the implementation is under the target app's external files directory:

```text
<external-files-dir>/mp_update_files/mp_crashlogs.json
```

### Backup import behavior

The file picker accepts plain overrides JSON and an InstaFL-style backup wrapper. The import modes are:

- **Full replace:** replace the current overrides file.
- **Merge:** add keys that are absent from the current file; current values take precedence.
- **Restore bundled overrides:** reinstall the payload bundled with the patch.

A marker prevents the bundled installer from overwriting imported values on subsequent starts. Backup export is not implemented.

## Evidence and verification matrix

| Feature / area | Evidence recorded in project notes | Remaining qualification |
|---|---|---|
| MobileConfig writer + developer-options unlock | Confirmed on-device on Instagram 457.0.0.0.26, v1.1.0-dev.5 | Evidence is tied to that recorded app build |
| Mods menu opening | Confirmed on-device by v1.1.0-dev.11 | Later menu additions need separate device confirmation |
| Menu register-layout fix | APK harness / DEX inspection | Does not replace device testing |
| Menu activity theme fix | Output APK manifest inspected; menu opening confirmed on-device | Device coverage is limited to recorded test |
| Developer-options navigation from menu | Harness-verified fix documented in v1.1.0-dev.12 | Awaiting device confirmation in project notes |
| Applied-patches JSON, version display, insets | Harness-verified in project notes | Awaiting device confirmation in project notes |
| Backup import | Harness-verified implementation documented | Awaiting device confirmation in project notes |
| Remove ads | Ad-pod patch and 1,370-parameter override set documented | Stories, Reels, and promotional placements are not claimed as fully covered |
| Instants Mod | Port and harness work documented against 455.0.0.55.95 | Device confirmation pending |
| Instagram gallery upload | Dedicated selectable patch targets `com.instagram.android`; harness build documented against Instagram 457.0.0.0.26 | Device confirmation pending; do not infer universal APK compatibility |

## Validation and build commands

Requirements: JDK 21, Git, and network access to resolve Gradle/Morphe dependencies.

```bash
python3 scripts/validate_config.py
./gradlew :patches:buildAndroid --no-daemon
```

The repository also includes APK-oriented test/harness sources under `patches/src/test`. Use the exact task and APK inputs defined by the current Gradle build; a successful compile or harness run is not the same as device confirmation.

## Compatibility policy

Morphe target declarations may omit a fixed app version, but that only removes a version allowlist. It does not make obfuscated bytecode fingerprints universal. App updates can change classes, methods, Compose traces, lifecycle behavior, or configuration loaders.

Record the exact app version and APK used for every test. Treat **declared**, **harness verified**, and **device confirmed** as separate evidence levels. Do not claim future-version compatibility without testing.
