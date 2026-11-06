# Dutch Pepper Patches

Patches for the Dutch Pepper Android app, for use with [Morphe](https://morphe.software).

## Add this source to Morphe

[Add daqot-The-real-one/morphe-patches to Morphe](https://morphe.software/add-source?github=daqot-The-real-one/morphe-patches)

This fork targets Pepper package IDs `com.tippingcanoe.peppernl` and
`com.tippingcanoe.pepper`.

## Patches

- **GmsCore support** — Sign in with Google using [MicroG-RE](https://github.com/MorpheApp/MicroG-RE/releases/latest) instead of Google Play services. Push notifications also use MicroG-RE.
- **Remove ads** — Removes ads between deals and on deal pages.
- **Sanitize deal links** — Opens deal store pages directly, without tracking redirects or affiliate links.
- **Sanitize sharing links** — Shares direct links to deals and discussions instead of tracking redirects.

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/daqot-The-real-one/morphe-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;8 patches total
<details open>
<summary>📦 Pepper&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 8.20.00 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [GmsCore support](#gmscore-support) | Allows signing in with Google by using MicroG-RE instead of Google Play services. |  |
| [Remove ads](#remove-ads) | Removes the ads shown between deals and on the deal pages. |  |
| [Sanitize deal links](#sanitize-deal-links) | Opens the store page of a deal directly, instead of through redirects that track the click and add affiliate links. |  |
| [Sanitize sharing links](#sanitize-sharing-links) | Shares the direct link to deals and discussions, instead of a link that redirects through a tracking service. |  |

</details>

<details open>
<summary>📦 Pepper (legacy)&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 8.20.00 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [GmsCore support](#gmscore-support) | Allows signing in with Google by using MicroG-RE instead of Google Play services. |  |
| [Remove ads](#remove-ads) | Removes the ads shown between deals and on the deal pages. |  |
| [Sanitize deal links](#sanitize-deal-links) | Opens the store page of a deal directly, instead of through redirects that track the click and add affiliate links. |  |
| [Sanitize sharing links](#sanitize-sharing-links) | Shares the direct link to deals and discussions, instead of a link that redirects through a tracking service. |  |

</details>

<!-- PATCHES_END -->

## Build locally

- Run `./gradlew buildAndroid`.
- The `.mpp` file is generated in `patches/build/libs/`.
- Apply it with [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop).

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## License

Licensed under the [GNU General Public License v3.0](LICENSE).
