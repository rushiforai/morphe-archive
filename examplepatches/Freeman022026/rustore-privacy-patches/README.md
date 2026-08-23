# RuStore patches for Morphe

![Official RuStore app icon](assets/rustore-icon.png)

[![Upstream audit](https://github.com/Freeman022026/rustore-privacy-patches/actions/workflows/check-rustore.yml/badge.svg)](https://github.com/Freeman022026/rustore-privacy-patches/actions/workflows/check-rustore.yml)
[![Release](https://github.com/Freeman022026/rustore-privacy-patches/actions/workflows/release.yml/badge.svg)](https://github.com/Freeman022026/rustore-privacy-patches/actions/workflows/release.yml)
[![Latest release](https://img.shields.io/github/v/release/Freeman022026/rustore-privacy-patches)](https://github.com/Freeman022026/rustore-privacy-patches/releases/latest)

This repository publishes selectable Morphe patches for the official RuStore Android app. The patches cover advertising, analytics, push services, verification hooks, unwanted background schedulers, Kaspersky scans, update filtering, secure-session compatibility, the gaming profile, and update authentication. The audited update worker chain remains available for automatic updates.

The repository contains patches only. It does not redistribute RuStore or any patched APK.

## Install the patch

Add this remote source in Morphe Manager:

```text
https://raw.githubusercontent.com/Freeman022026/rustore-privacy-patches/main/patches-bundle.json
```

The [one-click source link](https://morphe.software/add-source?github=Freeman022026/rustore-privacy-patches) is also available.

Download RuStore from [SoftDaily](https://softdaily.ru/rustore/), return to Morphe, select the features you want, and let Morphe patch and install it. The bundle accepts only the audited RuStore package, version, and official signing certificate.

For automatic updates, allow RuStore notifications and background operation when Android asks. The declarations must remain in the APK for compatibility. Users who want RuStore to remain dormant can instead apply the background restrictions documented below.

## Available patches

All twelve patches are enabled by default, but Morphe lets you switch them on or off separately. The bundle includes patches for invasive permissions, advertisements, analytics and trackers, push services, verification hooks, background hooks, periodic Kaspersky scans, update-request filtering, secure-session compatibility for re-signed APKs, the gaming profile, update authentication, and a strict update-only background worker policy.

The advertisements patch forces the "Agree to receive advertising materials" setting off. The checkbox is unchecked when displayed, and tapping it cannot opt the patched app back in.

The update filter excludes only apps whose Android installer-of-record is `com.android.vending`. Apps installed through another store, a browser, or ADB remain eligible for RuStore update checks. If RuStore later installs or updates the same correctly signed package, Android records RuStore as its installer and keeps the app's existing data; incompatible signatures cannot be updated in place.

The invasive-permissions patch neutralizes the privileged `INSTALL_PACKAGES` declaration. RuStore keeps `REQUEST_INSTALL_PACKAGES` and the other capabilities needed for package discovery and user-approved installs.

## Background operation and automatic updates

The recommended configuration no longer places an Android-level background restriction on RuStore. The `Restrict background work to updates` patch disables every reviewed background worker except those required for automatic updates. The only workers left active check for updates, download them, apply update patches, and install the resulting packages. Samsung installation support and the charging trigger also remain active. The retained worker chain is:

- `AutoUpdateAnyAppWorker`
- `AutoUpdateWorker`
- `DownloadWorker`
- `SessionInstallWorker`
- `SamsungInstallWorker`
- `ApplyPatchWorker`

The same patch disables:

- daily synchronization of the app-install identifier
- usage collection and queued analytics uploads
- review submission retries and subscription cancellation synchronization
- Mail.ru Omicron remote-configuration and multi-account synchronization
- publisher and referral tracking requests
- periodic server requests that can change RuStore's launcher icon, default opening screen, and store-tab order
- automatic download of the Xray runtime used by the optional RuStore Connect feature
- VK and RuStore push workers
- AppTracer disk, heap-dump, and sample uploads

WorkManager remains enabled only because the automatic-update chain uses it. Existing named jobs from the disabled features are cancelled, and any remaining disabled worker entry point returns without running its original task.

With all default patches selected, automatic updates can be enabled in RuStore under `Mine > Settings > Update and download settings`. Allow Android's background-operation prompt and notification permission. The live 1.108.0.2 test enabled Wi-Fi auto-update, retained the `AutoUpdateAnyAppWorker` schedule, loaded the update list, and completed cold starts without runtime errors.

Users who prefer the previous dormant configuration can re-enable the Android background block with these commands. This also disables automatic updates until the block is removed:

```shell
adb shell cmd appops set ru.vk.store RUN_IN_BACKGROUND ignore
adb shell cmd appops set ru.vk.store RUN_ANY_IN_BACKGROUND ignore
adb shell am force-stop ru.vk.store
```

Restore background operation with:

```shell
adb shell cmd appops set ru.vk.store RUN_IN_BACKGROUND allow
adb shell cmd appops set ru.vk.store RUN_ANY_IN_BACKGROUND allow
adb shell am set-inactive ru.vk.store false
```

## Samsung compatibility

Earlier Samsung testing found that removing `POST_NOTIFICATIONS` and `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` caused RuStore's installed-app list to remain empty. The patch therefore keeps both declarations, along with:

- `QUERY_ALL_PACKAGES`
- `com.android.permission.GET_INSTALLED_APPS`
- `REQUEST_INSTALL_PACKAGES`
- `UPDATE_PACKAGES_WITHOUT_USER_ACTION`
- `ENFORCE_UPDATE_OWNERSHIP`
- `REQUEST_DELETE_PACKAGES`

Keep the declarations. Allow notifications and background operation when using automatic updates; deny them only when intentionally running RuStore in dormant mode. If Samsung Auto Blocker rejects the patched APK, temporarily disable Auto Blocker for the installation and turn it back on afterward.

RuStore 1.108.0.2 and bundle 1.1.6 were installed in place and functionally checked on a Vivo V2454. Existing app data remained intact, the update badge and update list loaded, Wi-Fi auto-update could be enabled, and the expected update worker remained scheduled. The Samsung compatibility behavior is preserved from the earlier controlled Samsung test, but this release has not had a second physical Samsung test.

## Automatic re-patching

Morphe can automatically reapply a new patch-bundle release to the original APK it saved during patching. It does not fetch a newly released RuStore APK. When RuStore itself moves to a new version, provide that official APK to Morphe once. Future patch-only updates can then be reapplied automatically.

## Supported version and bundle

<!-- PATCHES_START EXPANDED -->
Current bundle: [v1.1.6](https://github.com/Freeman022026/rustore-privacy-patches/releases/tag/v1.1.6) on `main`.

### RuStore

Supported versions: `1.108.0.2`

| Patch | Description |
| --- | --- |
| Disable Kaspersky background scan | Disables periodic Kaspersky scheduling and reports disabled workers as successfully completed. |
| Disable advertisements | Removes ad providers, sanitizes ad identifiers, returns an empty ad list, and keeps advertising consent disabled. |
| Disable analytics and trackers | Disables audited analytics transports and replaces the stable request device identifier. |
| Disable background hooks | Disables audited boot, network-state, VPN, and Connect session hooks. |
| Disable invasive permissions | Removes privileged install, location, storage, billing, USB, and vendor data access while preserving user-driven installs. |
| Disable push services | Disables RuStore and VK push initialization, services, and audited push receivers. |
| Disable verification hooks | Disables audited SMS, call, phone-state, SID, and Mail.ru verification hooks. |
| Exclude Google Play apps from update checks | Excludes only apps whose recorded Android installer is Google Play from update requests. |
| Hide gaming profile | Removes the gaming profile permission, hides both gaming buttons, and blocks navigation to the gaming profile. |
| Restore secure-session compatibility | Adapts secure-session requests to RuStore 1.108 API changes for re-signed APKs. |
| Restrict background work to updates | Keeps only the background workers required for automatic update checks, downloads, patch application, and installation, including charging-triggered checks. |
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
