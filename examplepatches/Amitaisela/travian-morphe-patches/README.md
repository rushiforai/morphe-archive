# 👋🧩 Morphe Patches template

Template repository for Morphe Patches.

## ❓ About

Patches for apps I like.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=Amitaisela/travian-morphe-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/Amitaisela/travian-morphe-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Travian: Legends&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.0.0 | 4.0.1 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Build/troop queue notifications](#build-troop-queue-notifications) | Notifies you when a building upgrade or troop training queue finishes, with the building/unit name, level, and village. The first time you open the app you'll be asked to log in once; your password is sent straight to Travian's own login endpoint and is never stored — only the resulting session is kept, encrypted on-device. |  |

</details>

<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Travian notifier manifest entry](#travian-notifier-manifest-entry) | Adds the NotifierService and LoginActivity declarations. |  |

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
