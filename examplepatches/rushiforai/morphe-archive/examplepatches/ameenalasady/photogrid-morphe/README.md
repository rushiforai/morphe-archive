# 🛑 This repository has moved!

**PhotoGrid Morphe Patches are now part of a unified repository.**

Please visit [**ameen-morphe**](https://github.com/ameenalasady/ameen-morphe) for the latest updates, releases, and support.

---

# 👋🧩 PhotoGrid Morphe Patches (ARCHIVED)

Morphe patches for PhotoGrid.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/ameenalasady/photogrid-morphe/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 PhotoGrid&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 8.81 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Unlocks all PhotoGrid premium features by making IabUtils always report the user as premium. |  |

</details>

<!-- PATCHES_END -->

&nbsp;
## ❓ About

This repository contains custom Morphe patches for the PhotoGrid application.

These patches are based off the prior work of ReVanced and Morphe.
All modifications made by Morphe, along with their dates, can be found in the Git history.


🎉 You are now ready to start creating patches!

## 🧑‍💻 Usage

To develop and release Morphe Patches using this template, some things need to be considered:

- Development starts in feature branches. Once a feature branch is ready, it is squashed and merged into the `dev` branch
- The `dev` branch is merged into the `main` branch once it is ready for release
- Semantic versioning is used to version Morphe Patches.
- [Semantic commit](https://kapeli.com/cheat_sheets/Semantic_Commits.docset/Contents/Resources/Documents/index) messages are used for commits
- Commits on the `dev` branch and `main` branch are automatically released
via the [release.yml](.github/workflows/release.yml) workflow, which is also responsible for generating the changelog
and updating the version of Morphe Patches. It is triggered by pushing to the `dev` or `main` branch.
The workflow uses the `publish` task to publish the release of Morphe Patches.
- The `buildAndroid` task is used to build Morphe Patches so that it can be used on Android.


## 🤓 Tips
- See the [patcher documentation](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/1_patcher_intro.md)
  for more examples of creating patches and fingerprints.
- Do not manually edit any generated files such as: `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md`.
  These files will be automatically updated in the release action.
- Do not force push any semantic release commits or you will break the release. To 'redo' the last release then:
  - Git drop the last dev/main semantic release commit you want to redo.
  - Delete the release from the release area of this repo and delete the tag   
  - Make any other changes you wish to do
  - Force push dev/main branch
  - A new replacement release will be created by `release.yml`


## 📚 Everything else

Optionally you can include a button/link in this readme that users can click to add your 
patches to Morphe (update the links below after creating your new patches repo):

#### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=ameenalasady/photogrid-morphe

Or manually add this repository url as a patch source in Morphe: https://github.com/ameenalasady/photogrid-morphe

### 📙 Contributing

Thank you for considering contributing to PhotoGrid Morphe Patches.  
You can find the contribution guidelines [here](CONTRIBUTING.md).

### 🛠️ Building

To build PhotoGrid Morphe Patches,
you can follow the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

## 📜 License

PhotoGrid Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
