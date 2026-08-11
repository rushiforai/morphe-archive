# NuvioTV Morphe Patches

Public Morphe patch source for the official NuvioTV Android application. The seven current patches target only `com.nuvio.tv` `0.8.3-beta`.

This repository distributes patch code and `.mpp` bundles. It never distributes original, patched, or modified NuvioTV APKs.

> [!WARNING]
> **All patches in this repository are prerelease work in progress.** They are not fully tested and may disrupt NuvioTV features or cause unexpected behavior. Use them only if you understand and accept this risk. Testers can share feedback and report bugs, regressions, or other malfunctions by [opening a GitHub issue](https://github.com/liongalahad/nuviotv-morphe-patches/issues/new/choose). Do not attach original, patched, or modified NuvioTV APKs to an issue.

The suite adds local-media playback, storage subtitle imports, SDH detection and cleanup, rating controls, random-episode playback, and a setting-free Library focus correction. Each optional patch owns its settings, state, runtime logic, tests, manifest registration, and documentation. Shared code is limited to generic infrastructure required by multiple patches.

The SDH cleanup patch provides `Off`, `Remove SDH, keep lyrics`, and `Full cleanup`. It applies explicitly documented text rules rather than an AI classifier. Read [exact SDH removal behavior and destructive limitations](docs/SDH_REMOVAL.md) before reporting a missed annotation.

## Install in Morphe Manager

1. Download and install [Morphe Manager](https://morphe.software/) on your phone or TV.
2. Add `liongalahad/nuviotv-morphe-patches` as a GitHub patch source. No GitHub PAT is required because the repository is public.
3. Enable prerelease patches while the bundle remains on `dev`.
4. Import the official NuvioTV `0.8.3-beta` APK for the target ABI, or the official universal APK.
5. Select the patch to test. Use the dedicated local test signing identity for repeatable test upgrades.
6. Sideload and install on your TV. The official app cannot be upgraded in place because the patched APK has a different signature.

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

`testing/patches/<patch-id>/` is the source of truth for each patch's target assets, fingerprints, inspection requirements, acceptance criteria, porting notes, and focused test plan. `patches-list.json` and the table below are regenerated from the built bundle.

## Available patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0-dev.18](https://github.com/liongalahad/nuviotv-morphe-patches/releases/tag/v1.0.0-dev.18)**&nbsp;&nbsp;•&nbsp;&nbsp;`dev`&nbsp;&nbsp;•&nbsp;&nbsp;7 patches total
<details open>
<summary>📦 NuvioTV&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

**🎯 Supported versions:**

| 0.8.3-beta |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Random Episode](testing/patches/random-episode/README.md) | Adds Morphe > Detail Page > Show Random Episode Button and random series playback.<br>Original idea and code by [**DeclanSC**](https://github.com/DeclanSC). |  |
| [Local Media](testing/patches/local-media/README.md) | Adds Library > Storage playback, folder selection, and same-basename sidecar subtitles for local video files. |  |
| [Rating Visibility](testing/patches/ratings-visibility/README.md) | Adds Settings > Morphe > Ratings with independent overall and episode rating controls. |  |
| [Remove SDH Annotations](testing/patches/sdh-annotations/README.md) | Adds Settings → Morphe → Subtitles and removes SDH annotations from Media3 subtitles when enabled. |  |
| [Mark SDH Subtitles](testing/patches/sdh-marking/README.md) | Marks explicitly labelled SDH tracks and detected English SDH subtitle files. |  |
| [Allow Importing Subs from Local Storage](testing/patches/local-storage-subtitles/README.md) | Imports device subtitle files into Nuvio's ExoPlayer subtitle menu without rebuilding active playback. |  |
| [Library Mode Focus Fix](testing/patches/library-mode-focus-fix/README.md) | Returns Library focus to the previously selected Saved or Cloud mode. |  |

</details>

<!-- PATCHES_END -->

## Branches

- `dev`: development and private prereleases.
- `main`: reviewed stable releases only. Merge `dev` without squashing so semantic-release sees the conventional commits.

License: GPL-3.0 with the template's `NOTICE` terms.
