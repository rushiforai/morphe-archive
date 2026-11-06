# Patches for X (Twitter) app.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=serajr/x-twitter-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.75.0](https://github.com/serajr/x-twitter-patches/releases/tag/v1.75.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;10 patches total
<details open>
<summary>📦 X (Twitter)&nbsp;&nbsp;•&nbsp;&nbsp;10 patches</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;12.33.0-alpha.02 | 🧪&nbsp;12.31.0-prod.01 | 12.29.1-prod.01 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Desativar Blur do X](#desativar-blur-do-x) | Desativa permanentemente os efeitos de desfoque da Haze no X 12.30+. |  |
| [Disable Navigation Bar Contrast](#disable-navigation-bar-contrast) | Disables system navigation bar contrast while preserving X's native Haze effect (Blur/Scrim). |  |
| [Fix Navigation Bar Haze](#fix-navigation-bar-haze) | Phase C2.4-C m2 guard isolation: B5.1 baseline plus read-only GraphicsLayer inspection through the navigation extension. |  |
| [Hide Post Reply Bar (Keep Haze)](#hide-post-reply-bar-keep-haze) | Hides the post reply bar while preserving the native navigation bar Haze effect (Blur/Scrim). |  |
| [Keep Bottom Bar Visible](#keep-bottom-bar-visible) | Keeps the bottom navigation bar visible while scrolling the timeline. |  |
| [Manter Barra Inferior Visível](#manter-barra-inferior-vis-vel) | Mantém a barra inferior do X visível durante a rolagem da timeline. |  |
| [Preservar contraste da Barra de Navegação](#preservar-contraste-da-barra-de-navega-o) | Mantém permanentemente a proteção visual da barra de navegação sem alterar o edge-to-edge. |  |
| [Remove Post Reply Container (Experimental)](#remove-post-reply-container-experimental) | Removes the post reply content and tests a 64.dp minimum Haze container height. |  |
| [Remove Post Reply Content (Keep Layout) - Experimental](#remove-post-reply-content-keep-layout-experimental) | Removes the inner post reply composer while preserving its parent Compose layout and native Haze configuration. |  |
| [Shorten Bottom Haze Gradient - Experimental](#shorten-bottom-haze-gradient-experimental) | Shortens the native bottom Haze mask gradient while preserving the original blur rendering and Compose layout. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

This repo is licensed under the [GNU General Public License v3.0](LICENSE)
