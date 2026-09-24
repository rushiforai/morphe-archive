# 🎧 Enigma Maloja patch

Adds [Maloja](https://github.com/krateng/maloja) as a scrobbling provider for YouTube Music, for use with Morphe —
as an add-on to the official [Morphe patches](https://github.com/MorpheApp/morphe-patches).

## ❓ About

The official Morphe `Scrobbling` patch supports Last.fm and ListenBrainz. This patch source adds
a `Maloja Scrobbling` patch that sends your listens to a self-hosted Maloja server through its
ListenBrainz compatible API. The Maloja settings appear inside the Morphe **Scrobbling** screen,
right after Last.fm.

This is not a fork: keep using the official source and add this one next to it.

### How to use

1. Add this source to Morphe: https://morphe.software/add-source?github=ImEnigma2x0/morphe-maloja-patch
2. Patch YouTube Music with **both** sources selected. Keep the official patches you normally use
   (at least `Settings`, which is applied automatically) and enable `Maloja Scrobbling` from this source.
3. In the patched app open **Settings → Morphe → Scrobbling → Maloja**, enable it, set the
   **Server URL** (for example `https://maloja.example.com`) and your Maloja **API key**, then tap
   **Verify connection**.

### Notes

- Only HTTPS servers are supported. `http://` URLs are upgraded to `https://`.
- Maloja ignores "now playing" updates, so there is no such option.
- Metadata cleanup (tag removal, custom regex, "Artist - Title" parsing) has its own options under Maloja,
  since the official ones are only available while Last.fm or ListenBrainz is enabled.
- Works with the official `Play album songs` patch: the album track title and length are used
  instead of the music video ones.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/ImEnigma2x0/morphe-maloja-patch/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 YouTube Music&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;9.36.50 | 🧪&nbsp;9.35.54 | 🧪&nbsp;9.34.52 | 9.15.51 |
| :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Maloja Scrobbling](#maloja-scrobbling) | Adds Maloja as a scrobbling provider. Requires the official Morphe patches to be applied as well, so the settings appear in the Scrobbling screen. |  |

</details>

<!-- PATCHES_END -->

## 🛠️ Building locally

Building needs a GitHub token with `read:packages` for the Morphe registry (`gpr.user` and
`gpr.key` in `~/.gradle/gradle.properties`) and an Android SDK.

- Run `./gradlew buildAndroid`
- The built patches `.mpp` file is found in `patches/build/libs/patches-*.mpp`
- Import it as a local source in Morphe Manager, or patch with
  [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) together with the official bundle.

Releases are created by `release.yml` with semantic release: `feat:` and `fix:` commits on `main`
create a release, and on `dev` a pre-release.

## 📜 License

Licensed under the [GNU General Public License v3.0](LICENSE). See [NOTICE](NOTICE).
