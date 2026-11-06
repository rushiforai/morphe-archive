# 🧩 Suchi Patches

Patches for use with [Morphe](https://morphe.software).

## ❓ About

A personal collection of Morphe patches. This project is not affiliated with the Morphe project.

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/MangoTornado/morphe-patches-suchi

<a href="https://morphe.software/add-source?github=MangoTornado/morphe-patches-suchi">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

### Research patches

These patches are experimental and disabled by default. Select them explicitly for the listed app version.

| App | Version | Local controls | MicroG |
| --- | --- | --- | --- |
| [renshuu](docs/renshuu-research.md) | 1.2.20260311 | Pro, Reading Buddy and Text Analyzer menus | Native routing |
| [Du Chinese](docs/du-chinese-research.md) | 3.6.1 | Subscription controls and next-lesson gate | Native routing |
| [TEUIDA](docs/teuida-research.md) | 1.23.0 | Premium getters | [Native and Credential Manager routing](docs/teuida-microg-research.md) |
| [Pimsleur](docs/pimsleur-research.md) | 8.1 | Two Hermes Premium selectors | Native routing |
| [Kanji Study](docs/kanji-study-research.md) | 7.8.3 | Protected-code investigation | Protected-code investigation |

Local overrides do not alter server account entitlements. MicroG routing targets `app.revanced.android.gms`; renshuu sign-in is user-verified, while other login paths and notification delivery remain pending. The reports describe each patch's scope and the remaining developer checks.

Du Chinese's optional **Show reading download errors** patch displays the Volley error class, available HTTP status, cause locations, and lesson and request URL presence in its reading download dialog. See the [diagnostic instructions](docs/du-chinese-research.md#reading-download-diagnostics).

TEUIDA and Pimsleur crash after re-signing in offline startup tests; protection support is pending. Kanji Study has no patch yet.

See the [protected-app research plan](docs/developer-test-builds.md) for the remaining artifact analysis and optional developer inputs.

See [validation results](docs/validation.md) for builds, APK application checks and offline startup results.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.3](https://github.com/MangoTornado/morphe-patches-suchi/releases/tag/v1.1.3)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;9 patches total
<details open>
<summary>📦 renshuu&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.renshuu.renshuu_org`

**🎯 Supported versions:**

| 🧪&nbsp;1.2.20260311 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable Pro menus](#enable-pro-menus) | Overrides local Pro, Reading Buddy and Text Analyzer menu flags for research. Does not alter server-side account entitlement. |  |
| [MicroG integration](#microg-integration) | Experimental native Google-service routing through app.revanced.android.gms. Requires MicroG; sign-in and notification delivery need device verification. |  |

</details>

<details open>
<summary>📦 Du Chinese&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `org.sinamon.duchinese`

**🎯 Supported versions:**

| 🧪&nbsp;3.6.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable local Premium controls](#enable-local-premium-controls) | Overrides Du Chinese's local subscription and next-lesson checks for research. Server entitlement and content availability remain unverified. |  |
| [MicroG integration](#microg-integration) | Experimental native Google-service routing through app.revanced.android.gms. Requires MicroG; sign-in and notification delivery need device verification. |  |
| [Show reading download errors](#show-reading-download-errors) | Adds the Volley error class, HTTP status, cause locations, lesson and request URL presence, and safe response metadata to Du Chinese's reading download dialog. Does not change requests or account entitlement. |  |

</details>

<details open>
<summary>📦 Pimsleur&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.simonandschuster.pimsleur.unified.android`

**🎯 Supported versions:**

| 🧪&nbsp;8.1 |
| :---: |
| Re-signed APKs crash during offline startup tests. Protection support is pending. |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable local Premium controls](#enable-local-premium-controls) | Overrides Pimsleur's local Premium selectors for research. Does not alter server-side account entitlement. |  |
| [MicroG integration](#microg-integration) | Experimental native Google-service routing through app.revanced.android.gms. Requires MicroG; sign-in and notification delivery need device verification. |  |

</details>

<details open>
<summary>📦 TEUIDA&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `net.teuida.teuida`

**🎯 Supported versions:**

| 🧪&nbsp;1.23.0 |
| :---: |
| Re-signed APKs crash during offline startup tests. Protection support is pending. |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable local Premium controls](#enable-local-premium-controls) | Overrides TEUIDA's local Premium getters for research. Does not alter server-side account entitlement. |  |
| [MicroG integration](#microg-integration) | Experimental native Google-service routing through app.revanced.android.gms. Requires MicroG; sign-in and notification delivery need device verification. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- Run `./gradlew :patches:test` for Pro-state, MicroG routing and download diagnostic checks.
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Suchi Patches are licensed under the [GNU General Public License v3.0](LICENSE)
