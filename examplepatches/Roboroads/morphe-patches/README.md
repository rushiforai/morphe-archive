# Roboroads Morphe Patches

My collection of [Morphe](https://github.com/MorpheApp) patches.

## 📲 Add this patch source to Morphe

Tap the button on your device, or add this URL as a patch source in Morphe Manager:
`https://github.com/Roboroads/morphe-patches`

<a href="https://morphe.software/add-source?github=Roboroads/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

Where to get the APK: [Discovery Plus (Fire TV) 22.0.0.67 on APKMirror](https://www.apkmirror.com/apk/discovery-communications/discovery-stream-tv-shows-originals-and-more-fire-tv/discovery-stream-tv-shows-originals-and-more-fire-tv-android-tv-22-0-0-67-release/)

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/Roboroads/morphe-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📺 Discovery Plus (Android TV)&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.discovery.discoveryplus.firetv`

**🎯 Supported versions:**

| 22.0.0.67 |
| :---: |
| APKMirror: https://www.apkmirror.com/apk/discovery-communications/discovery-stream-tv-shows-originals-and-more-fire-tv/discovery-stream-tv-shows-originals-and-more-fire-tv-android-tv-22-0-0-67-release/ |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Auto-skip ads](#auto-skip-ads) | Automatically skips all ads, including pre-roll and mid-roll breaks, and hides ad overlays and pause ads. Ads are stitched into the stream, so a fraction of a second of a pre-roll may still show. |  |

</details>

<!-- PATCHES_END -->

## 🛠️ Development

- Work on the `dev` branch, merge to `main` for a stable release.
- Build locally with `./gradlew buildAndroid`; the bundle lands in `patches/build/libs/patches-*.mpp`.
- Apply it with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) like any other patch bundle.
- Use semantic commits (`feat:`, `fix:`, `chore:`); `release.yml` builds and publishes releases.
- Do not edit generated files by hand: `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md`.

The build pulls the Morphe Gradle plugin from GitHub Packages, so it needs a GitHub token with
`read:packages` (`gpr.user`/`gpr.key` in `~/.gradle/gradle.properties`, or `GITHUB_ACTOR`/`GITHUB_TOKEN`).

## 📜 License

Roboroads Patches are licensed under the [GNU General Public License v3.0](LICENSE).
