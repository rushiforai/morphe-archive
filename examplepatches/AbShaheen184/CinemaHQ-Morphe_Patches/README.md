# 👋🧩 Morphe Patches template

Template repository for Morphe Patches.

## ❓ About

Patches for apps I like.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/AbShaheen184/CinemaHQ-Morphe_Patches

<a href="https://morphe.software/add-source?github=AbShaheen184/CinemaHQ-Morphe_Patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/AbShaheen184/CinemaHQ-Morphe_Patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 CinemaHQ&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.app.mlounge`

**🎯 Supported versions:**

| 8.9 | 8.7 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable background service relaunch receivers](#disable-background-service-relaunch-receivers) | The app's BootReceiver, Appsalt's BootReceiver and Hopmn's NetworkStateReceiver no longer relaunch the background services on boot or on connectivity change. |  |
| [Neutralize Appsalt reward service](#neutralize-appsalt-reward-service) | Stops the Appsalt rewards/loyalty service from running. It stays declared, but it terminates itself on start and does no work. |  |
| [Neutralize Hopmn bandwidth sharing](#neutralize-hopmn-bandwidth-sharing) | Stops the Hopmn SDK from selling your upload bandwidth. The service stays declared so the app does not crash, but it acquires no wake lock, registers nothing and stops itself immediately. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

UserXYZ Patches are licensed under the [GNU General Public License v3.0](LICENSE)
