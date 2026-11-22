# 🦝 Graff patches

Morphe patches that turn **Telegraph Plus by p2021** (`ir.p2021.telegraph`, a Telegram fork based on Graph Messenger)
into **Graff**: no ads SDK start-up, no analytics, no Graph servers, no forced-update and "JOIN US" dialogs,
plus optional Graff branding (name, icon, raccoon intro) and a separate package name so it installs next to the original.

Tested with Telegraph Plus **13.0.2.0** (versionCode 71751, arm64-v8a, original p2021 "Stable" APK).
Other p2021 releases are marked experimental: the fingerprints avoid obfuscated names, but are not verified.

## How to use

Add this repository as a patch source in Morphe Manager:

<a href="https://morphe.software/add-source?github=Finn013/graff-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

or manually: `https://github.com/Finn013/graff-patches`

Then pick the original Telegraph Plus APK from storage (it is not on APKMirror) and patch it.

### Patches

| Patch | Default | What it does |
|---|---|---|
| Disable signature check | on (required) | Disables p2021's self signature check and hidden package check, so the re-signed app starts. Also repairs a decoy activity entry in the manifest. |
| Disable analytics | on | AppMetrica stops sending data after `activate`, Firebase Analytics collection off, AppMetrica preload provider removed. |
| Remove ads | on | Ad SDK (AppLovin MAX / InMobi / AdMob mediation) init skipped, ad auto-start providers and AD_ID / Ad Services permissions removed. |
| Block Graph servers | on | `graphmessenger.com` remote config and AI API point to 127.0.0.1. |
| Remove forced update | on | No "this version is no longer supported" dialog. |
| Remove P2021 dialogs | on | No "P2021_MODS / JOIN US" channel dialogs (start-up and mod settings). |
| Graff branding | on | App name (option, default `Graff`) and launcher icon (option: raccoon-tail plane, classic Graff, or original). |
| Raccoon intro | on | Welcome-screen logo with the raccoon "by Nott". |
| Change package name | on | Package `ir.finni.graff` (option), so Graff is a separate app next to Telegraph Plus. |

Turn off **Change package name** if you want to keep the original package (then it replaces/conflicts with an
installed p2021 build signed with a different key, and you have to uninstall that first).

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/Finn013/graff-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;9 patches total
<details open>
<summary>📦 Telegraph Plus&nbsp;&nbsp;•&nbsp;&nbsp;9 patches</summary>
<br>

**Package name:** `ir.p2021.telegraph`

**🎯 Supported versions:**

| 13.0.2.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block Graph servers](#block-graph-servers) | Points the Graph Messenger remote config (ads ids, forced update version, update nag, recommended chats) and the Graph AI API to 127.0.0.1, so the app never contacts graphmessenger.com. |  |
| [Change package name](#change-package-name) | Changes the package to ir.finni.graff (configurable) so Graff installs next to the original Telegraph Plus. Rewrites the manifest (providers, permissions) and package strings in code. A renamed app is a separate app: it has its own login and data. | • Package name |
| [Disable analytics](#disable-analytics) | Stops AppMetrica (Yandex) from sending data right after it is activated, turns off Firebase Analytics collection and removes the AppMetrica preload provider. |  |
| [Disable signature check](#disable-signature-check) | Required. Disables p2021's self signature check ("Your Telegraph Messenger is modified") and the hidden package name check that closes the app, so the re-signed app starts. |  |
| [Graff branding](#graff-branding) | Renames the app (default "Graff") and replaces the default launcher icon with the Graff adaptive icon. | • App name<br>• Launcher icon |
| [Raccoon intro](#raccoon-intro) | Replaces the welcome screen logo textures: a raccoon peeks over the Telegram sphere, signed "by Nott". |  |
| [Remove P2021 dialogs](#remove-p2021-dialogs) | Removes the "P2021_MODS - Subscribe / JOIN US" channel dialogs (on app start and in the mod settings). |  |
| [Remove ads](#remove-ads) | Stops the ad SDKs (AppLovin MAX, InMobi, AdMob mediation) from initialising, removes their auto-start providers and the advertising ID / Ad Services permissions. |  |
| [Remove forced update](#remove-forced-update) | Removes the "this version is no longer supported" dialog that blocks the app when the remote config marks the version as outdated. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid` (needs a GitHub token with `read:packages` in `gpr.user` / `gpr.key`).
- The built patches file is `patches/build/libs/patches-*.mpp`.
- Test with Morphe Desktop/CLI: `java -jar morphe-desktop-*-all.jar patch -p patches-*.mpp Telegraph.apk`.

## 📜 License

Graff patches are licensed under the [GNU General Public License v3.0](LICENSE).
Not affiliated with Morphe, Telegram, Graph Messenger or p2021.
