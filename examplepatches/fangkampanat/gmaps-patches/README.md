# Google Maps MicroG for ReVanced GmsCore

An unofficial `.mpp` patch source for using supported Google Maps APKs with [ReVanced GmsCore](https://github.com/ReVanced/GmsCore) (`app.revanced.android.gms`) through [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop).

This repository does not distribute original or patched Google Maps APKs, signing keys, or user data.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.4](https://github.com/fangkampanat/gmaps-patches/releases/tag/v1.0.4)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patch total
<details open>
<summary>📦 Google Maps&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 26.26.04.935742811 | 26.27.05.941319029 | 26.28.03.942936911 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Google Maps MicroG](#google-maps-microg) | Routes supported Google Maps builds through ReVanced GmsCore using the patched Maps package and known Google Maps certificate spoof metadata. |  |

</details>

<!-- PATCHES_END -->

## Requirements

- A computer with Java 21 or newer
- The latest [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop/releases/latest)
- A clean Google Maps APK from the supported versions below
- ReVanced GmsCore installed on the target device

## Add the patch source

The source must be added manually in Morphe Desktop:

1. Open **Settings** and enable **Expert mode**.
2. Click the **N Sources** button at the top center of the window.
3. Click **Add Source** and select **Remote**.
4. Enter:

   | Field | Value |
   |---|---|
   | Name | `Google Maps MicroG` |
   | Repository URL | `https://github.com/fangkampanat/gmaps-patches` |

5. Click **Add**, then confirm the source is enabled and set to **Follow Stable**.

Use **Follow Dev** only when testing a prerelease candidate.

## Patch Google Maps

1. Select a clean, supported Google Maps APK in Morphe Desktop.
2. Review the compatible patches and make sure **Google Maps MicroG** is enabled.
3. Do not use **Continue Anyway** for an unsupported APK.
4. Start patching, then install the resulting APK on the target device.
5. Keep `morphe-data/morphe.keystore` backed up. The same key is required for update-over-install.

Google Maps is large, so patch it on a computer rather than a phone or tablet.

## Supported versions

| Google Maps version | Status |
|---|---|
| `26.28.03.942936911` | BYD validated |
| `26.27.05.941319029` | Previous BYD-validated target |
| `26.26.04.935742811` | Legacy target |

New Google Maps versions must be inspected before support is added. A successful patch alone does not prove runtime compatibility.

## Notes

- A `.mpp` file is a patch bundle, not an installable APK.
- The patched app uses package name `app.morphe.android.apps.maps`.
- The project is unofficial and is not supported or endorsed by Google, BYD, ReVanced, or Morphe.
- Source code is licensed under [GPL-3.0](LICENSE). Preserve [NOTICE](NOTICE) in source and derivative distributions.
