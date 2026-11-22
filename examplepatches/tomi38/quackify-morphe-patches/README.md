# Quackify Morphe Patches

Community [Morphe](https://github.com/MorpheApp) patches for [Quackify](https://github.com/23fpsz/Quackify), the open-source native Android Spotify client.

## Usage

In Morphe Manager, add this repository as a patch source:

```
https://github.com/tomi38/quackify-morphe-patches
```

Or download the latest `patches-*.mpp` from [Releases](https://github.com/tomi38/quackify-morphe-patches/releases) and load it manually.

Supported packages (all three [Quackify release](https://github.com/23fpsz/Quackify/releases) flavors):

| Flavor | Package |
|--------|---------|
| standard | `com.quackify.app` |
| spotify | `com.spotify.music` |
| apple | `com.apple.android.music` |

The `spotify` and `apple` flavors reuse those apps' package names, so Morphe Manager also lists this patch for the official apps. The patch checks that the APK really is Quackify and fails otherwise.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/tomi38/quackify-morphe-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Quackify&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Spotify branding](#spotify-branding) | Renames Quackify to Spotify and replaces the launcher (both icon choices, plus the Android 13+ themed icon), splash, widget and notification icons with the Spotify mark. |  |

</details>

<details open>
<summary>📦 Quackify (Spotify package)&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Spotify branding](#spotify-branding) | Renames Quackify to Spotify and replaces the launcher (both icon choices, plus the Android 13+ themed icon), splash, widget and notification icons with the Spotify mark. |  |

</details>

<details open>
<summary>📦 Quackify (Apple Music package)&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Spotify branding](#spotify-branding) | Renames Quackify to Spotify and replaces the launcher (both icon choices, plus the Android 13+ themed icon), splash, widget and notification icons with the Spotify mark. |  |

</details>

<!-- PATCHES_END -->

## Building

The Morphe Gradle plugin is hosted on GitHub Packages, so a token with `read:packages` is required:

```sh
GITHUB_ACTOR=<user> GITHUB_TOKEN=<token> ./gradlew :patches:buildAndroid
```

Quackify's launcher icons are WebP bitmaps, so the patch bundles pre-rendered PNGs in `patches/src/main/resources/quackify/branding/`. Regenerate them with:

```sh
java scripts/RenderIcons.java patches/src/main/resources/quackify/branding
```

Releases are created automatically by semantic-release from Conventional Commits on `main` (`feat:` → minor, `fix:` → patch).

## License

GPLv3. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
