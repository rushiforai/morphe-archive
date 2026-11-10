# Dutch Pepper Patches

Patches for the Dutch Pepper Android app, for use with [Morphe](https://morphe.software).

## Add this source to Morphe

[Add daqot-The-real-one/morphe-patches to Morphe](https://morphe.software/add-source?github=daqot-The-real-one/morphe-patches)

If you already added the Karamelsabbelaar fork, remove it and add this source
instead to get updates from daqot-The-real-one.

This fork targets the current Pepper package ID `com.tippingcanoe.peppernl`.
Patches are not restricted to a specific Pepper version; they still require matching fingerprints.

## Patches

- **GmsCore support** — Sign in with Google using [MicroG-RE](https://github.com/MorpheApp/MicroG-RE/releases/latest) instead of Google Play services. Push notifications also use MicroG-RE.
- **Remove ads** — Removes ads between deals and on deal pages.
- **Sanitize deal links** — Opens deal store pages directly, without tracking redirects or affiliate links.
- **Sanitize sharing links** — Shares direct links to deals and discussions instead of tracking redirects.

<!-- PATCHES_START EXPANDED -->
> **[v1.1.3](https://github.com/daqot-The-real-one/morphe-patches/releases/tag/v1.1.3)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 Pepper&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [GmsCore support](#gmscore-support) | Allows signing in with Google by using MicroG-RE instead of Google Play services. |  |
| [Remove ads](#remove-ads) | Removes the ads shown between deals and on the deal pages. |  |
| [Sanitize deal links](#sanitize-deal-links) | Opens the store page of a deal directly, instead of through redirects that track the click and add affiliate links. |  |
| [Sanitize sharing links](#sanitize-sharing-links) | Shares the direct link to deals and discussions, instead of a link that redirects through a tracking service. |  |

</details>

<!-- PATCHES_END -->

## Build locally

- Morphe's Gradle plugin is hosted on GitHub Packages. To build locally, create a free
  GitHub personal access token (classic) with the `read:packages` scope, then add these
  lines to your user-level Gradle properties file (`%USERPROFILE%\.gradle\gradle.properties`
  on Windows or `~/.gradle/gradle.properties` on macOS/Linux):

  ```properties
  gpr.user = YOUR_GITHUB_USERNAME
  gpr.key = YOUR_GITHUB_TOKEN
  ```

  Keep this token private; do not put it in this repository. GitHub Packages access is free.
- Run `./gradlew buildAndroid`.
- The `.mpp` file is generated in `patches/build/libs/`.
- Apply it with [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop).

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## License

Licensed under the [GNU General Public License v3.0](LICENSE).
