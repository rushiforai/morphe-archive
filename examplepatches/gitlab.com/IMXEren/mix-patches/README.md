# 👋🧩 Mix Patches

## ❓ About

Custom patches using Morphe. 'Mix' originates from Morphe + IMXEren (also, mixed patches).

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.5.0](https://gitlab.com/IMXEren/mix-patches/-/releases/v1.5.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 RailOne&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 2.1.62 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass developer options](#bypass-developer-options) | Bypasses app usb debugging, wireless debugging and developer options checks. |  |
| [Bypass signature check](#bypass-signature-check) | Bypasses app anti-tampering protection so to work when signed by a different signature. |  |

</details>

<details open>
<summary>📦 Sync for Reddit&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| v23.06.30-13:39 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Fix Other discussions](#fix-other-discussions) | Fixes the 'Other discussions' tab showing '403 error loading page' by updating the API endpoint. |  |

</details>

<details open>
<summary>📦 Trakt&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 3.13.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock pro](#unlock-pro) | Remove ads, add VIP badge and allow to view 'Your Month in Review'. |  |

</details>

<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Spoof Firebase certificate hash](#spoof-firebase-certificate-hash) | Spoofs the app's package certificate hash used by Firebase Installations so that push notifications, remote config, and other Firebase services continue to work as expected. | • Certificate hash |
| [Spoof signature verification](#spoof-signature-verification) | Spoofs the signature verification when the app starts up. It is recommended to use the unmodified app to work properly. | • Package name<br>• Base64-encoded signature |

</details>

<!-- PATCHES_END -->

#### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?gitlab=IMXEren/mix-patches

Or manually add this repository url as a patch source in Morphe: https://gitlab.com/IMXEren/mix-patches

### 📙 Contributing

Thank you for considering contributing to Mix Patches.

### 🛠️ Building

To build Mix Patches,
you can follow the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

## 📜 License

Mix Patches are licensed under the [GNU General Public License v3.0](LICENSE)
