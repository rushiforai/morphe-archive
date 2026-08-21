# HH Patches

Custom patches compatible with [Morphe](https://morphe.software).

- **Punge** (`com.markatlarge.scrub`) 3.1.4

Supply the original APK yourself. This repository does not host or redistribute any app.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=hhawkinsau/hh-patches

Or add this repository URL as a patch source in Morphe:

`https://github.com/hhawkinsau/hh-patches`

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.1](https://github.com/hhawkinsau/hh-patches/releases/tag/v1.3.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 Punge&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 3.1.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable Play Store redirect for Punge](#disable-play-store-redirect-for-punge) | Stops Punge from opening the Play Store on launch when the app was sideloaded or patched instead of installed from Play. |  |
| [Disable remote config for Punge](#disable-remote-config-for-punge) | Stops Firebase Remote Config fetches and Play Measurement so feature flags cannot be changed after install. |  |
| [Hide ads for Punge](#hide-ads-for-punge) | Stops AdMob banners and interstitials from loading or showing. |  |
| [Unlock Punge premium](#unlock-punge-premium) | Unlocks Punge's paid feature gates by making RevenueCat report an active entitlement. |  |

</details>

<!-- PATCHES_END -->

### Building locally

Gradle needs a GitHub token with `read:packages` to resolve Morphe packages. Put it in `~/.gradle/gradle.properties`:

```properties
gpr.user = YOUR_GITHUB_USERNAME
gpr.key = YOUR_GITHUB_PAT
```

For GitHub Actions, add the same PAT as a `GPR_KEY` repository secret.

- Run `./gradlew buildAndroid`
- The built patches `.mpp` file is in `patches/build/libs/patches-*.mpp`
- Apply the bundle with [Morphe Manager](https://morphe.software) or [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop)

### `INSTALL_FAILED_NO_MATCHING_ABIS`

APKPure's Punge 3.1.4 package is 32-bit (`armeabi-v7a`) only. A 64-bit-only device will refuse to install it.

For Punge, install from Play Store (or export that install) so the package includes `arm64-v8a`, then patch that.

Leave **Optimize for device architecture** off unless the input already has `config.arm64_v8a`.

## License

HH Patches are licensed under the [GNU General Public License v3.0](LICENSE)
