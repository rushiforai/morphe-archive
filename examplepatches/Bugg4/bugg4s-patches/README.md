# Bugg4s Patches

Personal patches for use with [Morphe](https://morphe.software).

## About

This repository contains patches I develop for apps I use, compatible with the Morphe patcher.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=Bugg4/bugg4s-patches

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/Bugg4/bugg4s-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>OPL Monitor&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**Supported versions:**

| 1.0.3.65 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| [Change installer source](#change-installer-source) | Passes the startup license check by making the app appear installed from an app store. Only works on Android 10 and newer. On Android 9 and older use 'Remove license check' instead. | • Spoofed package installer name |
| [Remove ads](#remove-ads) | Removes banner, interstitial, rewarded and native ads by preventing the Google Mobile Ads SDK from loading them. |  |
| [Remove internet permission](#remove-internet-permission) | Removes the INTERNET permission, blocking all network access including update checks. Breaks DTC descriptions, VIN decoder gauges and function downloads. |  |
| [Remove license check](#remove-license-check) | Removes the startup license check (PairIP). Use this on Android 9 and older, where 'Change installer source' has no effect. Does not affect purchases or premium features. |  |
| [Spoof app version](#spoof-app-version) | Reports a high app version (default 9.9.9) to prevent the in-app update prompt. Also changes the version shown in the app's about screen. | • Spoofed version |

</details>

<!-- PATCHES_END -->

### Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## License

Bugg4s Patches are licensed under the [GNU General Public License v3.0](LICENSE)
