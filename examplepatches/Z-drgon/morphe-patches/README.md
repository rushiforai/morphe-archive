# 📡 Zdrgon's Morphe Patches

Custom Morphe patches for Android applications, featuring **Direct-to-Cell (DTC) Satellite Data Optimization** for T-Mobile and SpaceX satellite networks.

## ❓ About

This repository provides custom patches for **Morphe Manager** and **Morphe Desktop**.

### 🩹 Available Patches

- **Satellite Data Optimization (Universal)**: Automatically injects `<meta-data android:name="android.telephony.PROPERTY_SATELLITE_DATA_OPTIMIZED" android:value="PACKAGE_NAME" />` into `AndroidManifest.xml` for any selected application (WireGuard, Lichess, YouTube ReVanced, browsers, etc.), enabling data usage over T-Mobile / SpaceX Direct-To-Cell satellite connections per [Google's Android Satellite Connectivity Guidance](https://developer.android.com/develop/connectivity/satellite/constrained-networks).

---

## 📲 How to Use in Morphe Manager

1. Open **Morphe Manager** on your Android device.
2. Navigate to **Settings** > **Patch Sources**.
3. Add custom source:
   ```
   https://github.com/Z-drgon/morphe-patches
   ```
   Or click: [Add to Morphe](https://morphe.software/add-source?github=Z-drgon/morphe-patches)

---

## 🛠️ Building Locally

To build the patch bundle (`.mpp`) on your machine:

```powershell
.\gradlew.bat buildAndroid
```

The compiled patch package will be generated at:
`patches/build/libs/patches-*.mpp`

Load this `.mpp` file into [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) or Morphe Manager to patch your APKs.

---

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/Z-drgon/morphe-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 XYZ app&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.0.0 | 1.0.2 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Example Patch](#example-patch) | Example patch to start with. |  |

</details>

<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Satellite Data Optimization](#satellite-data-optimization) | Injects PROPERTY_SATELLITE_DATA_OPTIMIZED meta-data tag into AndroidManifest.xml to enable Direct-To-Cell (DTC) satellite data on T-Mobile / SpaceX network. |  |

</details>

<!-- PATCHES_END -->

## 📜 License

This project is licensed under the [GNU General Public License v3.0](LICENSE).
