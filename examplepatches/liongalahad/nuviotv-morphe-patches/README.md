# NuvioTV Morphe Patches

Public Morphe patch source for the official NuvioTV Android application. The current patches target only `com.nuvio.tv` `0.8.2-beta`; subtitle cleanup supports the Media3/ExoPlayer path.

This repository distributes patch code and `.mpp` bundles. It never distributes original, patched, or modified NuvioTV APKs.

> [!WARNING]
> **All patches in this repository are prerelease work in progress.** They are not fully tested and may disrupt NuvioTV features or cause unexpected behavior. Use them only if you understand and accept this risk. Testers can share feedback and report bugs, regressions, or other malfunctions by [opening a GitHub issue](https://github.com/liongalahad/nuviotv-morphe-patches/issues/new/choose). Do not attach original, patched, or modified NuvioTV APKs to an issue.

The patch provides `Off`, `Remove SDH, keep lyrics`, and `Full cleanup`. It applies explicitly documented text rules rather than an AI classifier. Read [exact SDH removal behavior and destructive limitations](docs/SDH_REMOVAL.md) before reporting a missed annotation.

## Install in Morphe Manager

1. Add `liongalahad/nuviotv-morphe-patches` as a GitHub patch source. No GitHub PAT is required because the repository is public.
2. Enable prerelease patches while the bundle remains on `dev`.
3. Import the official NuvioTV `0.8.2-beta` APK for the target ABI, or the official universal APK.
4. Select the patch to test. Use the dedicated local test signing identity for repeatable test upgrades.
5. Install on the dedicated TV test profile. The official app cannot be upgraded in place because the patched APK has a different signature.

Deep link: `https://morphe.software/add-source?github=liongalahad/nuviotv-morphe-patches`

## Local workflow

```powershell
.\scripts\bootstrap.ps1 -InstallMissing
.\scripts\build.ps1 -Patch sdh-annotations
.\scripts\patch.ps1 -Patch sdh-annotations
.\scripts\test.ps1 -Patch sdh-annotations -Device tv
.\scripts\verify-all.ps1
```

Every run is isolated under `local/patches/<patch-id>/<timestamp>/`. See [Windows setup](docs/SETUP_WINDOWS.md), [architecture](docs/ARCHITECTURE.md), [exact SDH rules](docs/SDH_REMOVAL.md), [testing](docs/TESTING.md), and [release rules](docs/RELEASING.md).

## Available patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0-dev.13](https://github.com/liongalahad/nuviotv-morphe-patches/releases/tag/v1.0.0-dev.13)**&nbsp;&nbsp;•&nbsp;&nbsp;`dev`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 NuvioTV&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 0.8.2-beta |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Rating Visibility](#rating-visibility) | Adds Settings > Morphe > Ratings with independent overall and episode rating controls. |  |
| [Remove SDH Annotations](#remove-sdh-annotations) | Adds Settings → Morphe → Subtitles and removes SDH annotations from Media3 subtitles when enabled. |  |

</details>

<!-- PATCHES_END -->

## Branches

- `dev`: development and private prereleases.
- `main`: reviewed stable releases only. Merge `dev` without squashing so semantic-release sees the conventional commits.

License: GPL-3.0 with the template's `NOTICE` terms.
