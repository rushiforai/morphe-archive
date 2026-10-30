# Patches for X (Twitter) app.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=serajr/x-twitter-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.55.0](https://github.com/serajr/x-twitter-patches/releases/tag/v1.55.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 X (Twitter)&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;12.33.0-alpha.02 | 🧪&nbsp;12.31.0-prod.01 | 12.29.1-prod.01 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Desativar Blur do X](#desativar-blur-do-x) | Desativa permanentemente os efeitos de desfoque da Haze no X 12.30+. |  |
| [Fix Navigation Bar Haze](#fix-navigation-bar-haze) | Phase C2.4-C m2 guard isolation: B5.1 baseline plus read-only GraphicsLayer inspection through the navigation extension. |  |
| [Keep Bottom Bar Visible](#keep-bottom-bar-visible) | Keeps the bottom navigation bar visible while scrolling the timeline. |  |
| [Manter Barra Inferior Visível](#manter-barra-inferior-vis-vel) | Mantém a barra inferior do X visível durante a rolagem da timeline. |  |
| [Preservar contraste da Barra de Navegação](#preservar-contraste-da-barra-de-navega-o) | Mantém permanentemente a proteção visual da barra de navegação sem alterar o edge-to-edge. |  |

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
