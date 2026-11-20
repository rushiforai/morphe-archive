# Meta Patches

[![Build](https://github.com/hemk651/meta-patches/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/hemk651/meta-patches/actions/workflows/build.yml)
[![Release](https://github.com/hemk651/meta-patches/actions/workflows/release.yml/badge.svg?branch=main)](https://github.com/hemk651/meta-patches/actions/workflows/release.yml)

An independent [Morphe](https://github.com/MorpheApp) patch source for Instagram and Instagram Instants.

> **Branch:** `main` · **Release channel:** stable · **Status:** official stable release line
>
> Meta Patches is an independent fork of [InstaFL](https://github.com/mamiiblt/instafel) by [mamiiblt](https://github.com/mamiiblt). The Instants and gallery-upload functionality includes ports from [Wagg13Patch_Morphe](https://github.com/WaggBR/Wagg13Patch_Morphe) by Wagg13. See [NOTICE](NOTICE) for attribution. This project is not affiliated with InstaFL, Wagg13, Meta, Instagram, or Morphe.

## Quick links

- [Add this source to Morphe](https://morphe.software/add-source?github=hemk651/meta-patches)
- [Stable releases](https://github.com/hemk651/meta-patches/releases)
- [Development branch](https://github.com/hemk651/meta-patches/tree/dev)
- [Feature status and verification matrix](docs/feature-status.md)
- [Supported apps](docs/supported-apps.md)
- [Implementation history and remaining work](docs/implementation-plan.md)
- [Version compatibility policy](docs/version-policy.md)

## Morphe patches

This section is generated from `patches-list.json` during the release workflow. Do not edit the generated section by hand.

<!-- PATCHES_START EXPANDED -->
> **[v1.1.1](https://github.com/hemk651/meta-patches/releases/tag/v1.1.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;8 patches total
<details open>
<summary>📦 Instagram&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

**Package name:** `com.instagram.android`

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED theme](#amoled-theme) | Forces Instagram dark theme surfaces to pure black (AMOLED). |  |
| [Add Mods menu](#add-mods-menu) | Adds the Mods menu (fork of the InstaFL menu): long press the home feed to open the quick menu, incl. developer options. |  |
| [Change channel name](#change-channel-name) | Replaces the release channel name (NONE, ALPHA, BETA, PROD) shown in the developer options UI. | • Channel name |
| [Remove ads](#remove-ads) | Removes ads in Instagram by stopping the ad pod flow. |  |
| [Remove snooze warning](#remove-snooze-warning) | Removes the "build expired" snooze warning dialog that alpha builds show. |  |
| [Unlock developer options](#unlock-developer-options) | Unlocks the developer options: writes the MobileConfig overrides file that reveals Developer options in the settings together with a dedicated Employee options entry, and forces the employee options gate to true (shake-gesture entry). The overrides file becomes active after an app restart. |  |
| [Upload instants from gallary](#upload-instants-from-gallary) | Adds a gallery button to the Instants camera to post photos and videos from your device's gallery. |  |

</details>

<details open>
<summary>📦 Instagram Instants&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.instagram.moonshot`

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Instants Mod](#instants-mod) | Adds a gallery button to post photos and videos, and allows saving friends' Instants to your device. |  |

</details>

<!-- PATCHES_END -->


## Supported apps and patch status

Status below reflects the current project-reported feature status; it is not a claim of fresh independent device testing.

| App | Patch | Available | Working well |
|---|---|:---:|:---:|
| Instagram | AMOLED theme | 🟢 ✓ | 🟢 ✓ |
| Instagram | Add Mods menu | 🟢 ✓ | 🟢 ✓ |
| Instagram | Change channel name | 🟢 ✓ | 🟢 ✓ |
| Instagram | Remove ads | 🟢 ✓ | 🟢 ✓ |
| Instagram | Remove snooze warning | 🟢 ✓ | 🟢 ✓ |
| Instagram | Unlock developer options | 🟢 ✓ | 🟢 ✓ |
| Instagram | Upload Instants from Gallery | 🟢 ✓ | 🟢 ✓ |
| Instagram Instants | Instants Mod | 🟢 ✓ | 🔴 ✗ |
| Threads | — | 🚧 Under development | — |

Edits is not currently included in this stable release line.

## Feature overview

### Instagram

- **Unlock developer options:** injects the canonical MobileConfig overrides into the app's private files directory and enables the employee-options gate. Changes take effect after an app restart.
- **Add Mods menu:** adds a home-feed long-press quick menu and companion activities for Meta tools, build information, crash reports, backup import, and other utilities.
- **AMOLED theme:** forces supported dark surfaces to pure black.
- **Remove ads:** ports the ad-pod suppression behavior and bundled override set. This is not a promise that every ad placement is removed.
- **Remove snooze warning:** removes the alpha-build expiry/snooze warning dialog.
- **Change channel name:** changes the channel label shown in the developer-options UI; the `channelName` option defaults to `Mods`.
- **Upload Instants from Gallery:** a separate selectable patch targeting the main Instagram package (`com.instagram.android`); adds gallery-based photo/video selection to Instagram's Instants camera flow. It is not an Instagram Instants (`com.instagram.moonshot`) patch.

### Instagram Instants

- **Instants Mod:** adds a gallery picker to the camera flow and a save-to-gallery action for friends' Instants. Saving uses MediaStore and requires Android 10 or later.

## Runtime configuration flow

The canonical file is [`config/mc_overrides.json`](config/mc_overrides.json).

1. The extension build embeds the compact, single-line JSON payload as a `BuildConfig` value.
2. The **Unlock developer options** patch injects the runtime installer call at the app-shell `Application.onCreate` startup point.
3. The writer installs the file atomically and idempotently at `<filesDir>/mobileconfig/mc_overrides.json`, the Instagram MobileConfig location identified during APK inspection.
4. The patch also changes the employee-options gate so the shake-gesture entry can be reached.
5. Restart Instagram for the newly installed MobileConfig values to be read.

The payload is written inside Instagram's app-private storage. The older proposal to write to an arbitrary removable-storage path was removed; it was not a viable approach for this dex-only extension architecture.

Validate the repository payload before building:

```bash
python3 scripts/validate_config.py
```

## Mods menu

When **Add Mods menu** is applied, long-press the Instagram home feed to open the quick sheet. The extension includes:

- Meta menu entry and developer-options navigation
- About and build information
- Applied patch information
- Miscellaneous tools and backup import
- Crash-report viewing
- App restart action

The menu has guarded actions and in-app error reporting. Failures are intended to produce a diagnostic toast and crash-report entry rather than take down the app. Menu pages also apply system-bar insets for modern Android edge-to-edge behavior.

### Backup import

Open **Mods menu → Misc → Backup → Import backup**. The importer accepts an InstaFL-style backup wrapper or a plain overrides JSON file:

- **Full replace** replaces the current overrides.
- **Merge** adds keys missing from the current file; existing current values win.
- **Restore bundled overrides** reinstalls the payload shipped with the patch.

Imported values are protected from automatic bundled-payload replacement across restarts. Backup export is not currently implemented.

## Build and validate

Requirements: JDK 21, Git, and network access to resolve Gradle/Morphe dependencies.

```bash
python3 scripts/validate_config.py
./gradlew :patches:buildAndroid --no-daemon
```

The repository also contains APK-oriented harness tests and helper checks. A successful repository build or harness run is not equivalent to verification on a physical device.

GitHub Actions builds pushes and pull requests. Semantic-release publishes stable releases from `main`; `dev` remains the separate prerelease development line.

## Verification status and limitations

The detailed matrix is maintained in [`docs/feature-status.md`](docs/feature-status.md). In summary:

- The runtime payload installation and developer-options unlock were documented as working on-device on Instagram 457.0.0.0.26 (development build v1.1.0-dev.5).
- The Mods menu opening and theme issue were documented as confirmed on-device by v1.1.0-dev.11.
- Several later menu fixes and backup-import changes are documented as build-harness verified but still awaiting device confirmation.
- The Instagram gallery-upload patch is a selectable patch for the main Instagram app. It adds gallery selection to the Instants camera flow; the documented APK harness work is not a substitute for device verification.
- Ad suppression does not currently claim complete coverage of Stories, Reels, or promotional placements.

Version-agnostic target declarations do not mean every app version is guaranteed to work. App internals and fingerprints can change. Review the [version policy](docs/version-policy.md) and test the exact APK before relying on a patch.

## Repository layout

| Path | Purpose |
|---|---|
| `patches/` | Morphe patch declarations and APK-oriented patch logic |
| `extensions/extension/` | Runtime Java extension, menu, helpers, and MobileConfig writer |
| `config/mc_overrides.json` | Canonical MobileConfig payload |
| `scripts/validate_config.py` | Payload validation |
| `docs/` | Supported targets, implementation history, and feature verification |
| `.github/workflows/` | Build and semantic-release automation |

## Credits, license, and disclaimer

The patch module declares GPLv3 in its Morphe metadata. See [NOTICE](NOTICE) for Morphe naming restrictions, retain upstream attribution when redistributing, and consult [CHANGELOG.md](CHANGELOG.md) for release history.

Meta Patches is an independent community project. It is not endorsed by Meta, Instagram, InstaFL, Wagg13, or Morphe. Modifying third-party apps may cause instability or account/service consequences. Use at your own discretion.
