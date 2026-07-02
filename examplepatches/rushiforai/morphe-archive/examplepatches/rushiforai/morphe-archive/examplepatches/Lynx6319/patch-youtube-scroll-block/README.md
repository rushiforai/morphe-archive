# 🚫📜 patch-youtube-scroll-block

Blocks vertical swipe navigation between YouTube Shorts while still letting you open and watch individual Shorts normally.

&nbsp;
## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.8](https://github.com/Lynx6319/patch-youtube-scroll-block/releases/tag/v1.0.8)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 19.16.39 | 19.25.37 | 20.47.62 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable Shorts scroll](#disable-shorts-scroll) | Disables swiping up/down between Shorts while still allowing a single Short to be opened and watched normally. | • Disable Shorts scroll |

</details>

<!-- PATCHES_END -->

&nbsp;
## ❓ About

**patch-youtube-scroll-block** provides a single patch — **Disable Shorts scroll** — that prevents swiping up or down to navigate to the next or previous Short.
A single Short can still be opened and watched from any entry point; only the swipe-to-advance gesture is suppressed.

This project is built on [Morphe Patches](https://github.com/MorpheApp/morphe-patches-template), which is based on the prior work of [ReVanced](https://github.com/ReVanced/revanced-patches-template).

## 🚀 How to use these patches

Add this repository as a patch source in [Morphe Manager](https://morphe.software):

```
https://github.com/Lynx6319/patch-youtube-scroll-block
```

Or click the link below to add it directly:

👉 https://morphe.software/add-source?github=Lynx6319/patch-youtube-scroll-block

### 📙 Contributing

Contributions are welcome! Please read the [contribution guidelines](CONTRIBUTING.md) before submitting a pull request.

### 🛠️ Building

To build locally:

```bash
./gradlew :patches:buildAndroid
```

## 📜 License

patch-youtube-scroll-block is licensed under the [GNU General Public License v3.0](LICENSE)
