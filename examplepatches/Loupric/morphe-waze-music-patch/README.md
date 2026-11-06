# Loupric — Waze × Morphe Music patches

Morphe patches to make **Waze** work with **Morphe Music** (the Morphe fork of YouTube Music).

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.2](https://github.com/Loupric/morphe-waze-music-patch/releases/tag/v1.0.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 Waze&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Waze GmsCore support](#waze-gmscore-support) | Redirects GMS calls to MicroG (app.revanced.android.gms) and enables Google account sign-in. |  |
| [Waze Morphe Music bytecode](#waze-morphe-music-bytecode) | Injects Morphe Music into Waze audio SDK app list. |  |
| [Waze Morphe Music support](#waze-morphe-music-support) | Adds Morphe Music (app.morphe.android.apps.youtube.music) to Waze audio SDK. |  |

</details>

<details open>
<summary>📦 YouTube Music&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Waze compatibility (MicroG)](#waze-compatibility-microg) | Fixes crash when Waze tries to connect via MediaBrowserService on MicroG devices. |  |

</details>

<!-- PATCHES_END -->

## Installation

1. Open **Morphe Manager**
2. Go to **Settings → Sources** and add a custom source:
   ```
   https://github.com/Loupric/morphe-waze-music-patch
   ```
   Or click: [Add to Morphe](https://morphe.software/add-source?github=Loupric/morphe-waze-music-patch)
3. Patch **Waze** with the two Waze patches
4. If you use **MicroG**, also patch **YouTube Music** with the MicroG compatibility patch

## Why this exists

Waze has an audio SDK that lets it pause/resume a music app while giving navigation instructions. Out of the box, it only supports apps Google certified — which excludes Morphe Music. Additionally, when Waze tries to connect to YouTube Music via `MediaBrowserService` on a MicroG setup, the app crashes due to a `GoogleCertificates` check.

These patches fix both problems.

## Building locally

Requires a GitHub PAT with `read:packages` scope in `~/.gradle/gradle.properties`:

```properties
gpr.user=YOUR_GITHUB_USERNAME
gpr.key=YOUR_GITHUB_PAT
```

Then:

```bash
./gradlew :patches:buildAndroid
```

The `.mpp` file is generated in `patches/build/libs/`.

> **Important:** use `:patches:buildAndroid`, not `build` — the Android task generates the `classes.dex` required by Morphe Manager.

## License

Licensed under the [GNU General Public License v3.0](LICENSE).
