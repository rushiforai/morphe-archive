qq# 🍳 Chefkoch Patches

Unofficial third-party [Morphe](https://github.com/MorpheApp) patches for the Chefkoch Android app.

This project aims to improve the Chefkoch Android app by removing unwanted advertisements and providing other optional improvements.

This project is independently maintained and is not affiliated with or endorsed by Chefkoch or Morphe.

## ❓ How to use

Add this repository as a patch source in Morphe Manager:

**Repository URL:**
https://github.com/drtgrf/chefkoch-android-patches

You can also use the button below:

<a href="https://morphe.software/add-source?github=drtgrf/chefkoch-android-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Available patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/drtgrf/chefkoch-android-patches/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Chefkoch&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `de.pixelhouse`

**🎯 Supported versions:**

| 🧪&nbsp;8.6.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove Banner Ads](#remove-banner-ads) | Removes banner advertisements from the Chefkoch app. |  |
| [Remove Sponsored Recommendations](#remove-sponsored-recommendations) | Removes the Taboola recommendation widget from recipe detail pages. |  |

</details>

<!-- PATCHES_END -->

## 🛠️ Building locally

To build the patch bundle locally, run:

```powershell
.\gradlew.bat buildAndroid
```

The resulting `.mpp` file can be found in:

`patches/build/libs/`

Apply the generated bundle using [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop).

## 🤝 Contributing

Contributions, suggestions and bug reports are welcome.

Please use the GitHub Issues section to report problems or suggest improvements.

## 📜 License

This project is licensed under the [GNU General Public License v3.0](LICENSE).
