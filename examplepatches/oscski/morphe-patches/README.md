# 👋🧩 Oscski Morphe Patches

Additional universal patches for Morphe.

## ❓ About

A collection of universal patches ported from ReVanced, for use with Morphe.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=oscski/morphe-patches

Or manually add this repository url as a patch source in Morphe: https://github.com/oscski/morphe-patches

> Built for Morphe Patcher 2.0.0. Use a Morphe Manager version that supports it.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/oscski/morphe-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Prevent screenshot detection](#prevent-screenshot-detection) | Removes the registration of all screen capture callbacks. This prevents the app from detecting screenshots. |  |
| [Remove screenshot restriction](#remove-screenshot-restriction) | Removes the restriction of taking screenshots in apps that normally wouldn't allow it. |  |
| [Spoof SIM provider](#spoof-sim-provider) | Spoofs information about the SIM card provider. | • Network ISO country code<br>• MCC+MNC network operator code<br>• Network operator name<br>• SIM ISO country code<br>• MCC+MNC SIM operator code<br>• SIM operator name |
| [Spoof Wi-Fi connection](#spoof-wi-fi-connection) | Spoofs an existing Wi-Fi connection. |  |

</details>

<!-- PATCHES_END -->

> Do not modify the patches list by hand. It is generated when `release.yml` creates a new release.

## 🧑‍💻 Dev usage

To develop and release these patches:

- **Make all changes to the `dev` branch.**
- For local development work build your patches using the gradle task `./gradlew buildAndroid` to generate the mpp file found in `patches/build/libs/patches-*.mpp`. Apply your patches locally using Morphe Desktop tool like any other patch bundle.
- Always use [Semantic commit](https://kapeli.com/cheat_sheets/Semantic_Commits.docset/Contents/Resources/Documents/index) messages for commits. To keep it simple use only 3 commit message types:
  - `feat: Added a new feature`
  - `fix: Some problem now fixed`
  - `chore: Random change you do not want in the user facing changelog`
- Commits of `fix:` and `feat:` will automatically generate new pre-releases and `chore:` will not create a new release.
- Users can apply your dev branch releases by enabling `pre-release` in Morphe Manager patch sources.
- When your dev branch is ready, and you want a stable release, merge dev branch to main (do not squash, and only merge).
- **Always use semantic release (release.yml)**. Do not manually upload or create releases by hand
  because many files must be updated and release.yml handles everything.

## 🤓 Tips

- See the [patcher documentation](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/1_patcher_intro.md) for more examples of creating patches and fingerprints.
- Do not use AI to create new release scripts. The `release.yml` here already handles everything.
  If you need something custom with your releases then modify the existing `release.yml`
  and `.releaserc` instead of writing everything new from scratch.
- Do not manually edit or manually commit any generated files such as: `patches-list.json`,
  `patches-bundle.json`, `CHANGELOG.md`. These files will be automatically updated by `release.yml`.
- Do not force push any semantic release commits as that will break all future releases.
  If you need to fix a broken release, it's always easiest to create a new release instead of
  fixing an existing release.

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

### 📙 Contributing

Thank you for considering contributing to Oscski Morphe Patches.
You can find the contribution guidelines [here](CONTRIBUTING.md).

## 🙏 Credits

- [ReVanced](https://gitlab.com/ReVanced/revanced-patches) - For their original code.

## 📜 License

Oscski Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
