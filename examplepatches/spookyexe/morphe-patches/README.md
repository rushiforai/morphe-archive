# 👋🧩 Spooky's Morphe Patches

## ❓ About

This repo contains some patches I made for myself. Feel free to use them and suggest improvements/ file a bug report.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.1](https://github.com/spookyexe/morphe-patches/releases/tag/v1.1.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 Beeline&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `co.beeline`

**🎯 Supported versions:**

| 4.2.8014 | 4.2.8704 | 4.2.9196 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable Beeline telemetry](#disable-beeline-telemetry) | Stops Beeline from sending usage and crash telemetry to remote servers.<br><br>Disables:<br>- Segment Analytics (track / screen / identify events)<br>- Firebase Analytics (logEvent)<br>- Firebase Crashlytics (log messages, recorded exceptions)<br>- Mapbox map telemetry (events collection switched off at the SDK level)<br><br>Does not affect app functionality — only telemetry collection is<br>suppressed. Navigation, routing, maps and Plus features all keep working. |  |
| [Unlock Beeline Plus features](#unlock-beeline-plus-features) | Unlocks Beeline plus features such as round-trip generation, live traffic and premium map types. |  |

</details>

<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Fix Firebase after re-signing](#fix-firebase-after-re-signing) | Fixes Firebase services (push notifications, Remote Config, Firebase Auth) that break after Morphe re-signs the app with a different certificate.<br><br>Apply with Original app certificate patch — no other config needed. |  |
| [Provide Original app certificate](#provide-original-app-certificate) | Automatically reads the signing certificate from the APK you are patching — no original app installed or file provided needed. Only fill the options below if you are patching an APK that was already re-signed (e.g. a previously patched build): in that case point to the original APK file, or enter the certificate manually. | • Path to original APK (if uninstalled)<br>• Certificate SHA-1 (manual)<br>• Certificate SHA-256 (manual)<br>• Certificate Base64 DER (manual) |
| [Spoof app signature](#spoof-app-signature) | Makes the app think its signing certificate is unchanged after Morphe re-signs it.<br><br>Useful when an app crashes or shows a tamper warning because it checks its own certificate.<br><br>Does not bypass Play Integrity / SafetyNet hardware attestation.<br><br>Apply with Original app certificate patch. | • Package name override (optional) |
| [Spoof install source](#spoof-install-source) | Makes the app think it was installed from a specific store (default: Google Play).<br><br>Useful when an app blocks features or shows errors because it detects it was not installed from the Play Store.<br><br>Only affects what the app itself sees - does not change the real system install record. | • Store to impersonate |

</details>

<!-- PATCHES_END -->

#### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=spookyexe/morphe-patches

Or manually add this repository url as a patch source in Morphe: https://github.com/spookyexe/morphe-patches

### 🛠️ Building

To build Spooky Patches,
you can follow the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

## 📜 License

Spooky Patches are licensed under the [GNU General Public License v3.0](LICENSE)
