# 👋🧩 Force Cronet SNI Patch for YouTube

Allows accessing YouTube on connections where the corresponding domains are blocked by i.e. corporate DPI by replacing the SNI with a different one (it has to be covered by the same certificate unless you have certificate pinning disabled).

&nbsp;
## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.2](https://github.com/loskutov/youtube-domain-fronting-patch/releases/tag/v1.0.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 YouTube Music&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;7.16.50 | 🧪&nbsp;7.15.52 | 🧪&nbsp;7.14.53 | 7.13.50 | 7.12.51 | 7.11.50 | 7.10.53 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Force Cronet SNI (YouTube Music arm64)](#force-cronet-sni-youtube-music-arm64) | Patches bundled arm64 libcronet so TLS SNI is forced to a configurable hostname in the SSLClientSocket path. URL and HTTP Host remain unchanged. | • Forced SNI hostname<br>• ytimg SNI hostname |

</details>

<details open>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;21.16.240 | 🧪&nbsp;21.15.282 | 🧪&nbsp;21.14.482 | 🧪&nbsp;21.05.265 | 20.47.62 | 20.45.36 | 20.31.42 | 20.21.37 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Force Cronet SNI (YouTube arm64)](#force-cronet-sni-youtube-arm64) | Patches bundled arm64 libcronet so TLS SNI is forced to a configurable hostname in the SSLClientSocket path. URL and HTTP Host remain unchanged. | • Forced SNI hostname<br>• ytimg SNI hostname |

</details>

<!-- PATCHES_END -->

#### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=loskutov/youtube-domain-fronting-patch

Or manually add this repository url as a patch source in Morphe: https://github.com/loskutov/youtube-domain-fronting-patch

## 📜 License

Those patches are licensed under the [GNU General Public License v3.0](LICENSE)
