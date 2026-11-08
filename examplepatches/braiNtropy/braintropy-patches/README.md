# 👋🧩 braiNtropy Patches

Custom patches for apps I use, for use with Morphe.

## ❓ About

This repository contains patches maintained by [braiNtropy](https://github.com/braiNtropy).

## 🩹 Patches list

<!-- PATCHES_START -->
> **[v2.7.0](https://github.com/braiNtropy/braintropy-patches/releases/tag/v2.7.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total

| App | 💊&nbsp;Patch | Function | ✅&nbsp;Tested | 👤&nbsp;User-reported |
|-----|--------|----------|---------|----------------|
| 📦 Waking Up | Disable update prompt | Stops the forced "Update Required" dialog so older versions keep working. | 3.27.0 | 3.27.1 |
|  | Unlock Premium | Unlocks all premium content and removes subscription banners. | 3.27.0 | 3.27.1 |
| 📦 Hume | Unlock Premium | Unlocks Hume Plus. | 9.29.2 | — |
| 📦 RP Hypertrophy | Unlock Premium | Unlocks all subscription features. | 1.9.0 | — |

**🌐 Universal patches**

| 💊&nbsp;Patch | Function |
|--------|----------|
| Disable Expo OTA updates | Blocks over-the-air JavaScript updates in Expo apps. |
| Disable Pairip license check | Disables Google's Play Store license check. Works on degoogled devices; does not bypass Play Integrity. |
<!-- PATCHES_END -->

#### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=braiNtropy/braintropy-patches

Or manually add this repository URL as a patch source in Morphe: https://github.com/braiNtropy/braintropy-patches

### 🛠️ Building

After granting the GitHub CLI token `read:packages` access, build on Windows with:

```powershell
.\build-patches.ps1
```

The patch bundle is generated under `patches/build/libs/`. See the
[Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for the complete workflow.

## 📜 License

braiNtropy Patches are licensed under the [GNU General Public License v3.0](LICENSE).

The `Unlock Premium` patch for RP Hypertrophy is derived from
[hoo-dles/morphe-patches](https://github.com/hoo-dles/morphe-patches) (GPL-3.0),
with thanks to hoo-dles for the original endpoint analysis.
