# RuStore patches for Morphe

![Official RuStore app icon](assets/rustore-icon.png)

[![Upstream audit](https://github.com/Freeman022026/rustore-privacy-patches/actions/workflows/check-rustore.yml/badge.svg)](https://github.com/Freeman022026/rustore-privacy-patches/actions/workflows/check-rustore.yml)
[![Release](https://github.com/Freeman022026/rustore-privacy-patches/actions/workflows/release.yml/badge.svg)](https://github.com/Freeman022026/rustore-privacy-patches/actions/workflows/release.yml)
[![Latest release](https://img.shields.io/github/v/release/Freeman022026/rustore-privacy-patches)](https://github.com/Freeman022026/rustore-privacy-patches/releases/latest)

This repository publishes selectable Morphe patches for the official RuStore Android app. The patches cover advertising, analytics, push services, verification hooks, background activity, Kaspersky scans, the gaming profile, and update authentication.

The repository contains patches only. It does not redistribute RuStore or any patched APK.

## Install the patch

Add this remote source in Morphe Manager:

```text
https://raw.githubusercontent.com/Freeman022026/rustore-privacy-patches/main/patches-bundle.json
```

The [one-click source link](https://morphe.software/add-source?github=Freeman022026/rustore-privacy-patches) is also available.

Download RuStore from [SoftDaily](https://softdaily.ru/rustore/), return to Morphe, select the features you want, and let Morphe patch and install it. The bundle accepts only the audited RuStore package, version, and official signing certificate.

When RuStore asks for notification access or exclusion from battery optimization, deny both requests. The declarations must remain in the APK for compatibility, but the permissions do not need to be granted.

## Available patches

All nine patches are enabled by default, but Morphe lets you switch them on or off separately. The bundle includes patches for invasive permissions, advertisements, analytics and trackers, push services, verification hooks, background hooks, periodic Kaspersky scans, the gaming profile, and update authentication.

The advertisements patch forces the "Agree to receive advertising materials" setting off. The checkbox is unchecked when displayed, and tapping it cannot opt the patched app back in.

The invasive-permissions patch neutralizes the privileged `INSTALL_PACKAGES` declaration. RuStore keeps `REQUEST_INSTALL_PACKAGES` and the other capabilities needed for package discovery and user-approved installs.

## Samsung compatibility

Earlier Samsung testing found that removing `POST_NOTIFICATIONS` and `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` caused RuStore's installed-app list to remain empty. The patch therefore keeps both declarations, along with:

- `QUERY_ALL_PACKAGES`
- `com.android.permission.GET_INSTALLED_APPS`
- `REQUEST_INSTALL_PACKAGES`
- `UPDATE_PACKAGES_WITHOUT_USER_ACTION`
- `ENFORCE_UPDATE_OWNERSHIP`
- `REQUEST_DELETE_PACKAGES`

Keep the declarations, but deny the notification and battery-exemption prompts. If Samsung Auto Blocker rejects the patched APK, temporarily disable Auto Blocker for the installation and turn it back on afterward.

The current RuStore 1.107.0.3 build was installed and functionally checked on a Motorola Edge 50. Its installed-app list remained populated after the notification, battery, and background restrictions were applied. The Samsung compatibility behavior is preserved from the earlier controlled Samsung test, but this release has not had a second physical Samsung test.

## Automatic re-patching

Morphe can automatically reapply a new patch-bundle release to the original APK it saved during patching. It does not fetch a newly released RuStore APK. When RuStore itself moves to a new version, provide that official APK to Morphe once. Future patch-only updates can then be reapplied automatically.

## Supported version and bundle

<!-- PATCHES_START EXPANDED -->
Current bundle: [v1.1.3](https://github.com/Freeman022026/rustore-privacy-patches/releases/tag/v1.1.3) on `main`.

### RuStore

Supported versions: `1.107.0.3`

| Patch | Description |
| --- | --- |
| Disable Kaspersky background scan | Disables periodic Kaspersky scheduling and reports disabled workers as successfully completed. |
| Disable advertisements | Removes ad providers and ad identifiers, returns an empty ad list, and keeps advertising consent disabled. |
| Disable analytics and trackers | Disables AppMetrica, MyTracker, AltCraft, Radar, install referrer, metrics, and audited logging transports. |
| Disable background hooks | Disables audited boot, network-state, VPN, and Connect session hooks. |
| Disable invasive permissions | Removes privileged install, location, storage, billing, USB, and vendor data access while preserving user-driven installs. |
| Disable push services | Disables RuStore and VK push initialization, services, and audited push receivers. |
| Disable verification hooks | Disables audited SMS, call, phone-state, SID, and Mail.ru verification hooks. |
| Hide gaming profile | Removes the gaming profile permission, hides both gaming buttons, and blocks navigation to the gaming profile. |
| Skip update authentication | Skips the update authentication suggestion and returns a valid completed result. |

<!-- PATCHES_END -->

## Build locally

Local builds require Java 21 and GitHub CLI access to the Morphe package registry:

```shell
gh auth refresh -s read:packages
java -cp gradle/wrapper/gradle-wrapper.jar scripts/SecureGradle.java clean :patches:buildAndroid --no-daemon
```

`SecureGradle` obtains the GitHub token through `gh auth token`, passes it only in Gradle process memory, and does not write it to the repository. The resulting `.mpp` file is placed in `patches/build/libs`.

## License and project status

The patch code is licensed under the [GNU General Public License v3.0](LICENSE). RuStore and Morphe are independent projects. This repository is not affiliated with or endorsed by either project.
