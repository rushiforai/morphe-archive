# Agrokenga's Morphe Patches

<img src="patches-bundle.png" alt="Agrokenga's Morphe Patches icon" width="128" align="right">

A collection of Android app patches maintained by Agrokenga. This is a third-party project and is not affiliated with the Morphe project.

## ❓ About

Patch bundles are intended for compatible Android patching tools. Add app-specific patches under `patches/src/main/kotlin` and extensions under `extensions/` as needed.

### How to use these patches

Use the button below, or add `agrokenga/morphe-patches` as a patch source in Morphe Manager.

<a href="https://morphe.software/add-source?github=agrokenga/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 📚 Project notes

Architecture notes, review findings, probe results, and CI details are in
[docs/README.md](docs/README.md).

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0-dev.7](https://github.com/agrokenga/morphe-patches/releases/tag/v1.1.0-dev.7)**&nbsp;&nbsp;•&nbsp;&nbsp;`dev`&nbsp;&nbsp;•&nbsp;&nbsp;9 patches total
<details open>
<summary>📦 KoPP2&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**Package name:** `com.paradoxplaza.kopp2`

**🎯 Supported versions:**

| 2.21.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Cheats Screen Unlock](#cheats-screen-unlock) | Makes the in-game Cheats screen reachable by redirecting the Settings -> Credits button to SystemScreen.OpenCheats. Single-player UI only; it does not grant items, currency, or purchases. | • Open Cheats from Settings -> Credits |
| [IAP Bypass Patch](#iap-bypass-patch) | Mocks PlayFab Catalog API for IAP fulfillment without platform billing. |  |
| [IAP Free (All Items)](#iap-free-all-items) | Makes all in-game store purchases free by bypassing the PlayFab server and Play Store UI. Patches IAPService.PurchaseBundle to return immediately without calling IStoreController.InitiatePurchase, and patches StoreService.PurchaseItem for in-game store purchases. | • Make all store items free |
| [IAP Full Bypass](#iap-full-bypass) | Bypasses PlayFab validation and grants items locally, setting price to free. | • Enable IAP Full Bypass |
| [IAP Native Probe](#iap-native-probe) | Read-only diagnostics for libil2cpp.so: hashes the library and checks whether the KoPP2 2.21.4 PurchaseItem and IAP grant-function offsets are reachable in both ABIs. | • Test APK write-back |
| [Native Method Patch Demo](#native-method-patch-demo) | Replaces the harmless CheatsScreen.ShowCheatAlert method with an immediate return in both libil2cpp.so ABIs. Demonstrates static ELF RVA mapping and byte patching; it does not touch billing, purchases, entitlements, or networking. | • Patch ShowCheatAlert (demo) |
| [Native Visual Feedback](#native-visual-feedback) | Hooks every probed purchase and PlayFab method in libil2cpp.so and logs "CALLED: <method>" through NGUIDebug's on-screen overlay. Diagnostic only; it does not change any return value, response, entitlement, or purchase result. | • Show native call log overlay |
| [On-screen Game Log](#on-screen-game-log) | Adds a touch-through, auto-scrolling log panel over the lower 30% of the screen, with padding from the screen edges. It shows this process's logcat output (Unity Debug.Log, native and Java logs). Diagnostic only; no game state is changed. |  |

</details>

<details open>
<summary>📦 XYZ app&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.example.app`

**🎯 Supported versions:**

| 2.0.0 | 1.0.2 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Example Patch](#example-patch) | Example patch to start with. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Agrokenga's Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE), with additional conditions described in [NOTICE](NOTICE). Preserve required attribution and use distinct branding for derivative works.
