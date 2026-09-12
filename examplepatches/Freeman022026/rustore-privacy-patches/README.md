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

All fourteen patches are enabled by default, but Morphe lets you switch them on or off separately. The bundle includes patches for invasive permissions, advertisements, analytics and trackers, the RuStore and VK SDK device identifiers, push services, verification hooks, background hooks, periodic Kaspersky scans, update-request filtering, secure-session compatibility for re-signed APKs, the gaming profile, update authentication, and a strict update-only background worker policy.

The advertisements patch forces the "Agree to receive advertising materials" setting off. The checkbox is unchecked when displayed, and tapping it cannot opt the patched app back in.

It also makes Google's shared advertising-ID lookup return the zero UUID with limited ad tracking enabled, before the SDK contacts Google Play services or starts its lookup telemetry. The existing identifier sanitization remains in place.

The update filter excludes only apps whose Android installer-of-record is `com.android.vending`. Apps installed through another store, a browser, or ADB remain eligible for RuStore update checks. If RuStore later installs or updates the same correctly signed package, Android records RuStore as its installer and keeps the app's existing data; incompatible signatures cannot be updated in place.

Update checks still send eligible installed-package information to RuStore: package names, version codes, installer/source, update owner where available, system-app flag, first-install time, and app status. The device-info interceptor also sends manufacturer/model, Android version and SDK level, language, and RuStore version; its User-Agent includes supported CPU architectures. The analytics patch replaces the stable `deviceId` value with the zero UUID, but leaves these compatibility fields intact. Disabling advertising and analytics does not make store browsing, downloads, or update checks anonymous.

Two additional identifiers have their own patches. The RuStore SDK computes a device identifier from hardware values and the Android ID and sends it as the `Device-Id` header on payment, session, and pay-auth requests; the RuStore SDK device identifier patch replaces it with the zero UUID. The VK SDK stores a fingerprint in `__vk_device_id__` that mixes hardware values with the Android ID, so it survives clearing app data; the VK SDK device identifier patch replaces the value returned to VK ID and VK Pay request paths with the zero UUID. Payment flows are covered by bytecode audits only, so disable the RuStore SDK device identifier patch if RuStore Pay misbehaves.

A short app-scoped capture on 2026-09-11 exposed paths missed by the earlier worker audit: direct metrics sending to `stats-dg.rustore.ru`, TNS/Mediascope session tracking, and InAppStory initialization. The analytics patch now stops metrics collection and sending, returns immediately from the Mediascope tracking use case, and leaves InAppStory uninitialized. Story content is therefore unavailable. These entry points run independently of WorkManager; blocking their workers or manifest components alone was insufficient.

Android also preserves explicit component-enabled overrides across APK updates. The background-work patch disables the VK `AuthService`, `PushService`, and `MasterSelectionService` at application startup, overriding enabled states left by earlier installations. The authentication service serves VK push token requests through IPC; its traffic must not be confused with RuStore's update API. APK audits check both the direct telemetry stubs and this startup cleanup. The follow-up phone capture after these fixes showed none of the four previously observed destinations during cold start, browsing, and installed-app checks. Short traffic tests cannot establish that every possible SDK path is inactive.

The invasive-permissions patch neutralizes the privileged `INSTALL_PACKAGES` declaration. RuStore keeps `REQUEST_INSTALL_PACKAGES` and the other capabilities needed for package discovery and user-approved installs.

## Background operation and automatic updates

The recommended configuration no longer places an Android-level background restriction on RuStore. The `Restrict background work to updates` patch disables every reviewed background worker except those required for automatic updates. The only workers left active check for updates, download them, apply update patches, and install the resulting packages. Update checks can complete while RuStore is foreground or background, avoiding the foreground retry loop that prevented the daily chain from advancing on some devices. Samsung installation support and the optional charging trigger also remain active, but neither charging nor a manual wake-up is required for the daily auto-update schedule. The retained worker chain is:

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

With all default patches selected, automatic updates can be enabled in RuStore under `Mine > Settings > Update and download settings`. Allow Android's background-operation prompt and notification permission. The live 1.108.0.2 test completed `AutoUpdateAnyAppWorker` while RuStore was foreground, scheduled the next check for 24 hours later, downloaded an available update, completed `SessionInstallWorker`, and reached Android's normal install confirmation without runtime errors.

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

RuStore 1.108.0.2 and bundle 1.1.7 were installed in place and functionally checked on a physical Android 16 device. Existing app data remained intact, the update badge and update list loaded, and the automatic-update chain completed update discovery, download, and installer handoff. The Samsung compatibility behavior is preserved from the earlier controlled Samsung test, but this release has not had a second physical Samsung test.

## Automatic re-patching

Morphe can automatically reapply a new patch-bundle release to the original APK it saved during patching. It does not fetch a newly released RuStore APK. When RuStore itself moves to a new version, provide that official APK to Morphe once. Future patch-only updates can then be reapplied automatically.

## Upstream review checks

Both upstream promotion and release builds compare the official APK with `upstream/inventory.json`. Added or removed native-library paths, changed hashes of `libbridge_helper.so` in any ABI, added or removed manifest components, and new dotted DEX packages stop the build for review. The report records SHA-256 hashes for every native library; changes to other library contents and removed DEX packages are reported without blocking. Native patch-site byte checks still run when applying the bundle.

The DEX package check excludes single-segment packages because obfuscated names change between builds. It is an early warning, not proof that existing packages contain no new tracking code. The full manifest-component check catches additions inside an existing namespace, including new push services.

Run `python3 scripts/test_rustore_upstream.py` to check the review gates. To inspect an APK, run `scripts/rustore_upstream.py audit-upstream` with `--apk`, `--aapt`, `--apkanalyzer`, `--baseline upstream/inventory.json`, and `--output build/upstream-inventory.json`. The candidate inventory is written even when differences stop the audit. Review those differences and the affected code before copying the candidate into the baseline. CI never updates that baseline automatically.

## Supported version and bundle

<!-- PATCHES_START EXPANDED -->
Current bundle: [v1.1.12](https://github.com/Freeman022026/rustore-privacy-patches/releases/tag/v1.1.12) on `main`.

### RuStore

Supported versions: `1.109.1.0`

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
| Replace RuStore SDK device identifier | Replaces the RuStore SDK device identifier sent with payment and session requests with the zero UUID. |
| Replace VK SDK device identifier | Replaces the VK SDK device fingerprint sent by VK ID and VK Pay request paths with the zero UUID. |
| Restore secure-session compatibility | Adapts secure-session requests to RuStore 1.108 API changes for re-signed APKs. |
| Restrict background work to updates | Keeps only the workers required for automatic updates and allows update checks to run while RuStore is foreground or background. |
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
