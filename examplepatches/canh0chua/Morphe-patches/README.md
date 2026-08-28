# 👋🧩 canh0chua Morphe Patches

Personal patches for Viber and other apps.

This repository contains **experimental/WIP** patches for Viber. They are not guaranteed to work and may crash the app. Use at your own risk.

## ⚠️ Warning: Work in Progress

**These patches are currently unstable and may cause crashes or unexpected behavior.**
- The Remove Ads, Remove ChatGPT, and Remove AI News patches have not been fully tested
- Only the "Secondary Viber Device" patch is verified working
- Use with caution and only if you know how to restore your app if something goes wrong

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=canh0chua/morphe-patches

## 🩹 Patches list

| App | Name | Description |
|---|---|---|
| Viber | Secondary Viber Device | Forces Viber to detect the device as a tablet, enabling the "Link as secondary device" flow. |
| Viber | Remove Ads | Disables ads in Viber. |
| Viber | Remove ChatGPT | Disables the ChatGPT feature in Viber. |
| Viber | Remove AI News | Disables the AI News feature in Viber. |

<!-- PATCHES_START EXPANDED -->
> **[v1.3.1](https://github.com/canh0chua/Morphe-patches/releases/tag/v1.3.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 Viber&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove AI News](#remove-ai-news) | Disables the AI News feature in Viber. |  |
| [Remove Ads](#remove-ads) | Disables ads in Viber. |  |
| [Remove ChatGPT](#remove-chatgpt) | Disables the ChatGPT feature in Viber. |  |
| [Secondary Viber Device](#secondary-viber-device) | Forces Viber to detect the device as a tablet, enabling the 'Link as secondary device' flow. |  |

</details>

<!-- PATCHES_END -->

## 🧑‍💻 Development

- **All changes go to the `dev` branch.** Merge `dev` → `main` (no squash) for stable releases.
- Build locally: `./gradlew :patches:buildAndroid` → output at `patches/build/libs/patches-*.mpp`
- Test with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop)
- Use [semantic commits](https://kapeli.com/cheat_sheets/Semantic_Commits.docset/Contents/Resources/Documents/index):
  - `feat:` — new patch or feature → minor version bump → pre-release
  - `fix:` — bug fix → patch version bump → pre-release
  - `chore:` — maintenance → no release
- Pre-releases are tagged automatically on `dev`; stable releases on `main`
- **Never manually edit generated files** (`CHANGELOG.md`, `patches-list.json`, `patches-bundle.json`) — `release.yml` handles everything
- **Never force-push** semantic release commits; create a new `fix:`/`feat:` commit instead

## 🤓 Tips

- See the [patcher documentation](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/1_patcher_intro.md) for more examples of creating patches and fingerprints
- The `release.yml` and `.releaserc` already handle the full release pipeline; modify those instead of writing new scripts
- To verify: `./gradlew :patches:buildAndroid`, then patch a Viber APK with Morphe Desktop and confirm the desired behavior

## 📜 License

canh0chua Patches are licensed under the [GNU General Public License v3.0](LICENSE)