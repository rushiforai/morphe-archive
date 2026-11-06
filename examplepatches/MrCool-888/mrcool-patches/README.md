# MrCool Patches

Morphe patches based on [Morphe's patches template](https://github.com/MorpheApp/morphe-patches-template).

## Downloads

Get the Morphe patch bundle from the [latest stable release](https://github.com/MrCool-888/mrcool-patches/releases/latest). Release notes identify the app builds supported by each bundle and any supplied patched APKs. The watch app is also available from [OpenBubbles Wear releases](https://github.com/MrCool-888/OB-wearos/releases/latest).

Add `https://github.com/MrCool-888/mrcool-patches` as a patch source in Morphe Manager, then select the patches you want for your app.

<!-- PATCHES_START -->
> **[v1.3.1](https://github.com/MrCool-888/mrcool-patches/releases/tag/v1.3.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 Smart Launcher&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `ginlemon.flowerfree`

**🎯 Supported versions:**

| 6.6 build 024 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable Pro](#enable-pro) | Enables app features locked behind the subscription paywall. |  |
| [Fix Galaxy Buds3 Pro widget](#fix-galaxy-buds3-pro-widget) | Fixes widget configuration returning cancelled on Samsung One UI 8.5 and later. |  |

</details>

<details open>
<summary>📦 OpenBubbles&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.openbubbles.messaging`

**🎯 Supported versions:**

| 2.0.0 build 20002293 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Ready for messages notification control](#ready-for-messages-notification-control) | Adds a setting to hide or show the background connection notification independently of the Wear bridge. |  |
| [Wear companion bridge](#wear-companion-bridge) | Embeds the Wear companion in OpenBubbles and includes a background notification control; no separate phone app is needed. |  |

</details>

<details open>
<summary>📦 Icon Pack Studio&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `ginlemon.iconpackstudio`

**🎯 Supported versions:**

| 2.5 build 003 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Pro](#unlock-pro) | Unlocks Pro features that normally require a purchase. |  |

</details>

<!-- PATCHES_END -->

The watch app is developed separately in [OB-wearos](https://github.com/MrCool-888/OB-wearos).
The OpenBubbles bridge is embedded in the patched phone app; no standalone phone companion is built.
The Ready for messages notification control can be selected without the Wear bridge. Open OpenBubbles
Settings → Morphe patches → Hide ready-to-receive notification to open Android's Background connection
channel settings, then turn that channel off or on. This does not turn off incoming message notifications.
The Wear bridge patch also includes this control for compatibility with existing patched installations.

### OpenBubbles compatibility

The current OpenBubbles patches require the native ARM64 build **2.0.0, version code 20002293**. The version name alone is insufficient: build 20002289 is an earlier, unsupported target for the current source. Older patch releases retain their original build requirements.

The supplied single phone APK updates our existing patched universal installation in place using the same signing key. Do not uninstall or clear app data. A stock Play Store installation has a different signature and cannot receive this APK as an in-place update. See [build 2293 validation](docs/VALIDATION-OPENBUBBLES-2293.md).

The Wear companion bridge sends watch notifications while the phone is locked and synchronizes dismissal of matching phone and watch notifications. To check the connection, select the Wear companion bridge in Morphe and tap **Send test notification** at the bottom of OpenBubbles Settings → Morphe patches. The test does not send a real message.

The Icon Pack Studio patch unlocks Pro on **2.5 build 003** (version code 250030). It forces the
app's paid-state check without touching stored purchase data or Play Billing, so a real
subscription is neither required nor simulated. Apply it to the base APK from the official
XAPK (or a merged APK) and sign the result with a consistent key.


## Build

Use JDK 21, Python 3, and Android SDK 35. Follow Morphe's development setup for GitHub Packages
credentials (`gpr.user` / `gpr.key`, or `GITHUB_ACTOR` / `GITHUB_TOKEN` with read:packages).
GitHub Actions uses the template's repository-scoped token. Keep personal credentials out of this repository.

```sh
./gradlew :patches:test :extensions:smartlauncher:widgetTest :patches:buildAndroid
```

The bundle is `patches/build/libs/patches-<version>.mpp`. Apply it with Morphe Desktop/Manager.
Add this repository as a patch source in Morphe Manager to receive updates.
The release includes the combined `.mpp`, patched Smart Launcher and OpenBubbles phone APKs,
the matching watch APK, and SHA-256 checksums.
Smart Launcher release APKs keep the signing key used by the supplied build 024 APK.
OpenBubbles phone/watch APKs keep their separate, existing shared key.
The public certificate pins are in `apk-signing-certificates.json`; private keys stay local.
The `.mpp` contains patch code, not an APK signing key. When patching manually, select the
key matching that app's installed APK. Using the supplied APKs preserves our per-app signing policy.
The older Manager-signed/MAX-version-code launcher requires its original key/version-code policy.
OpenBubbles and the watch must use the same application ID and signing certificate for Wear Data Layer.
Preserve the existing phone installation's signing key and APK format; do not uninstall or clear data.

## Rebuilding the OpenBubbles extension

The checked-in `openbubbles-wear.mpe` contains the bridge and its added dependencies; the payload audit
excludes stock app classes. A source digest and artifact checksum reject stale or modified binaries.
The original APK, derived host class fixture, signing material, and device data are not stored here.
Changing the bridge requires a local rebuild with JDK 17 and the compile-only stock-derived fixture at
`integrations/openbubbles/work/openbubbles-classes-v52.jar` (SHA-256
`188711da1d45c04cb5fb9d15b58f8cdcb8ca60a38cca299e3e92caa66a17511a`).
The fixture targets native OpenBubbles 2.0.0 / 20002293 ARM64, base APK SHA-256
`340e8a7ecc6e8bfe07e3c563c4212e9dc481f1dad9e8ad5188e24066bb128253`.
It is a developer input and must remain local. See the integration README for extraction and checks.

```sh
cd integrations/openbubbles
./gradlew :protocol:test :bridge:testDebugUnitTest :extension:test :extension:buildExtension
python -m unittest discover -s scripts
python verify-extension.py --refresh
```

Commit the regenerated MPE and `extension-lock.json` together with the source changes.

## Development and releases

Work on `dev`; `feat:` and `fix:` commits use the template's semantic release workflow.
Merge `dev` into `main` without squashing for stable releases. Release metadata and the patch list are generated.
Before uploading APK assets, verify their package names and pinned signing certificates:

```sh
python scripts/verify-apk-signatures.py /path/to/release --java /path/to/java --build-tools /path/to/android-sdk/build-tools/35.0.0
```

Retain the existing Smart Launcher release key for future builds; stop if it is unavailable.
Changing a patch does not require changing an app's signing key. Keep OB's existing key for both phone and watch.
The ordinary bundle build requires no stock app files or other repository checkout.
The isolated `integrations/openbubbles` build keeps the tested bridge dependency/linkage audit.
Its `protocol` source is the same v4 wire contract as OB-wearos; synchronize both copies when changing it.

## Attribution and license

GPL-3.0; see LICENSE and NOTICE. Template: MorpheApp/morphe-patches-template.
The Smart Launcher Pro and signature compatibility patches are adapted from hoo-dles/morphe-patches
(copyright 2026 Hoo-dles), revision `1f9d0da03804edd5a2e8642de6fc964814de9dd4`.
The Icon Pack Studio Unlock Pro patch is adapted from RookieEnough/De-Vanced (GPL-3.0), revision
`724aa1e62eb957b8bd9b1fd8a62101db80990bdb`, which forked ReVanced Patches.
The Buds3 widget fix was developed for this project. The launcher features can be selected independently.
The watch application source belongs in OB-wearos, not this patch bundle.
