# Swift Backup Patches

Custom patches for **Swift Backup 5.1.0** (`org.swiftapps.swiftbackup`), compatible with [Morphe Manager](https://morphe.software).

Maintained by [nikhilbadyal](https://github.com/nikhilbadyal). AI was used in the development of these patches.

## Install

[Add this patch source to Morphe Manager](https://morphe.software/add-source?github=nikhilbadyal/nik-morphe-patches), or download the `.mpp` bundle from [Releases](https://github.com/nikhilbadyal/nik-morphe-patches/releases).

## Patches

<!-- PATCHES_START -->
> **[v1.0.0](https://github.com/nikhilbadyal/nik-morphe-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;9 patches total
<details>
<summary>📦 Swift Backup&nbsp;&nbsp;•&nbsp;&nbsp;9 patches</summary>
<br>

**🎯 Supported versions:**

| 5.1.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Swift Backup Blacklist Limit](#swift-backup-blacklist-limit) | Raises the shared blacklist limit from 100 to 1,000 apps. |  |
| [Swift Backup Cloud Apps Visibility](#swift-backup-cloud-apps-visibility) | Displays all backups present in the cloud tag without dropping blacklisted or system apps. |  |
| [Swift Backup Cloud Settings Backup](#swift-backup-cloud-settings-backup) | Adds opt-in automatic cloud backup and explicit restore for settings, favorites, and the blacklist. |  |
| [Swift Backup Cloud WiFi Backups](#swift-backup-cloud-wifi-backups) | Detects and restores existing WiFi backups from cloud storage when metadata is missing from the local database. |  |
| [Swift Backup Local Cloud Metadata](#swift-backup-local-cloud-metadata) | Makes cloud backups work by keeping their metadata on persistent local storage and syncing to the connected cloud. |  |
| [Swift Backup Premium Unlock](#swift-backup-premium-unlock) | Unlocks all Premium features. |  |
| [Swift Backup Settings Export and Import](#swift-backup-settings-export-and-import) | Shows Export settings and Import settings for signed-in users, including blacklist transfer. |  |
| [Swift Backup Tamper Protection](#swift-backup-tamper-protection) | Stops the app from closing itself on patched installs. |  |
| [Swift Backup Web Login](#swift-backup-web-login) | Makes Google sign-in work for connecting cloud accounts. |  |

</details>

<!-- PATCHES_END -->

## Build

Use JDK 21, an Android SDK, and a GitHub credential with access to the configured GitHub Packages registry. Configure `gpr.user` and `gpr.key` in your user-level Gradle properties, or use `GITHUB_ACTOR` and `GITHUB_TOKEN` environment variables. Keep credentials out of this repository.

```sh
# Build the patch bundle and regenerate the catalog from its compiled patches.
./gradlew :patches:buildAndroid generatePatchesList
```

The bundle is written to `patches/build/libs/patches-<version>.mpp`.

## Test

```sh
# Exercise recovery, cloud transport, and settings behavior without an Android device.
python3 extensions/swiftbackup/tests/run.py
```

See [the test documentation](extensions/swiftbackup/tests/README.md) for coverage and offline setup.

## Contribute

Keep changes focused on Swift Backup. Patch implementations live in `patches/src/main/kotlin/app/swiftbackup/`; Android helpers live in `extensions/swiftbackup/`.

Open pull requests against `dev`. Use Conventional Commits (`feat:`, `fix:`, or `bump:`) so the release workflow can choose the next version. Merging `dev` into `main` publishes a stable release and regenerates the changelog, catalog, and patch table.

## License

Distributed under [GPLv3](LICENSE). See [NOTICE](NOTICE) for the accompanying project-name restrictions. This project is provided for educational purposes.
