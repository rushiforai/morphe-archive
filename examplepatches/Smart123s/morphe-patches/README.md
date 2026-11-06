# Smart123s' patches

Patches for apps I like, maintained by [Smart123s](https://github.com/Smart123s).
Based on the [Morphe Patches template](https://github.com/MorpheApp/morphe-patches-template).
This is an independent project.

[Add these patches to Morphe](https://morphe.software/add-source?github=Smart123s/morphe-patches).

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/Smart123s/morphe-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 Ricardo nem lopot&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**🎯 Supported versions:**

| 2.077 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [ARM64 support](#arm64-support) | Adds ARM64 builds of the game's libGDX 1.1.0 libraries for 64-bit-only Android devices. |  |
| [Balance editor](#balance-editor) | Adds a coin button below Gameplay Challenge on the tuning screen to set and save the balance. |  |
| [Immersive fullscreen](#immersive-fullscreen) | Enables the engine's immersive mode to hide system bars during play, including after returning to the game. |  |
| [Landscape rotation](#landscape-rotation) | Allows both landscape directions when rotating the phone through 180 degrees. |  |
| [Unlock Bora Bora](#unlock-bora-bora) | Unlocks the second map, Bora Bora, by default without spending coins. |  |

</details>

<!-- PATCHES_END -->

## Development

Set up Java 21, the Android SDK and GitHub Packages read credentials as described
in the [Morphe development documentation](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/README.md).
Provide `gpr.user` and `gpr.key` in your user Gradle properties, or set
`GITHUB_ACTOR` and `GITHUB_TOKEN`. Keep credentials out of Git.

Run `./gradlew :patches:buildAndroid`. The bundle is generated at
`patches/build/libs/patches-*.mpp` and can be applied with
[Morphe Desktop](https://github.com/MorpheApp/morphe-desktop).

Native builds require Linux x86_64, Python 3 and Android NDK r27c
(`27.2.12479018`). Install it with `sdkmanager "ndk;27.2.12479018"` and set
`ANDROID_NDK_HOME` to that directory. Initialize source dependencies with
`git submodule update --init --recursive` before building.
Ricardo's build script and pinned engine sources are under `extensions/ricardo`.

Develop on feature branches targeting `dev`. Semantic commits such as `feat:`
and `fix:` produce prereleases on `dev`; merge `dev` into `main` without squashing
for stable releases. If `dev` does not exist yet, create it from `main`.
The existing release workflow manages releases and generated metadata; do not
manually edit `patches-list.json`, `patches-bundle.json` or `CHANGELOG.md`.

Enable **Allow GitHub Actions to create and approve pull requests** under
Settings > Actions > General for the existing `dev` to `main` workflow.

## License

Smart123s' patches are licensed under the [GNU General Public License v3.0](LICENSE).
See [NOTICE](NOTICE) for upstream attribution and naming conditions.
