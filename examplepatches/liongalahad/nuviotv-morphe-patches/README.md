# NuvioTV Morphe Patches

Public Morphe patch source for the official NuvioTV Android application. The nine current source patches target only `com.nuvio.tv` `0.8.7-beta`.

This repository distributes patch code and `.mpp` bundles. It never distributes original, patched, or modified NuvioTV APKs.

> [!WARNING]
> **All patches in this repository are prerelease work in progress.** They are not fully tested and may disrupt NuvioTV features or cause unexpected behavior. Use them only if you understand and accept this risk. Testers can share feedback and report bugs, regressions, or other malfunctions by [opening a GitHub issue](https://github.com/liongalahad/nuviotv-morphe-patches/issues/new/choose). Do not attach original, patched, or modified NuvioTV APKs to an issue.

The suite adds a default-selected side-by-side install identity, local-media playback, direct local downloads, storage subtitle imports, SDH detection and cleanup, random-episode playback, source-picker selection restoration, and a setting-free Library focus correction. Each optional patch owns its settings, state, runtime logic, tests, manifest registration, and documentation. Shared code is limited to generic infrastructure required by multiple patches.

`Restore Source Selection` adds **Settings > Morphe > Playback > Restore source selection**. It defaults On for a fresh preference. When enabled, returning from Nuvio's internal player restores the source that launched playback and its list position instead of resetting to the first source. It stores only the Boolean preference; source URLs, headers, provider data, and content identifiers are not persisted. Nuvio's external-player restoration remains unchanged.

`Local Downloads` resolves Nuvio's subtitle-fetch worker structurally for each supported APK architecture. This allows completed movie and episode downloads to locate Nuvio's current subtitle repository and save addon subtitles matching the configured primary and secondary languages, without relying on one architecture-specific obfuscated class name.

The SDH cleanup patch provides `Off`, `Normalize music symbols only`, `Remove SDH, keep lyrics`, and `Full cleanup`. It removes complete multiline bracketed blocks and infers repeated unknown lyric-boundary tokens within a cue using explicitly documented text rules rather than an AI classifier. Read [exact SDH removal behavior and destructive limitations](docs/SDH_REMOVAL.md) before reporting a missed annotation.

## Install in Morphe Manager

1. Download and install [Morphe Manager](https://morphe.software/) on your phone or TV.
2. Add `github.com/liongalahad/nuviotv-morphe-patches` as a GitHub patch source. No GitHub PAT is required because the repository is public.
3. Enable prerelease patches while the bundle remains on `dev`.
4. Import the official [NuvioTV 0.8.7-beta APK](https://github.com/NuvioMedia/NuvioTV/releases/tag/0.8.7-beta) for the target ABI, or the official universal APK.
5. Select the patches to apply. `Side-by-side installation` is selected by default and produces package `com.nuvio.morphe` with label `Nuvio Morphe`; deselect it only when replacement-install behavior is intended.
6. Save the patched APK locally, then sideload and install it on your TV. The default side-by-side output installs beside the official app. A replacement output cannot upgrade the official app in place because the patched APK has a different signature.

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

## NuvioTV 0.8.7 compatibility

All nine patch compartments target the official `0.8.7-beta` universal and ABI-specific APKs. The port updates the version-pinned settings resources and native Compose bridges, adapts Local Downloads to Nuvio's new episode action list, and keeps the remaining patch fingerprints structural.

Automated validation covers extension and patcher tests, isolated application across all four declared official APK variants, and a combined x86_64 alignment/signature check. The combined side-by-side build also installs on the Android TV emulator and exercises Morphe Settings, Library D-pad focus, Storage discovery, local H.264 playback, local sidecar selection, and native/Morphe SDH arbitration. Live download services, removable physical storage, source restoration with a real addon stream, and physical Android TV acceptance remain separate manual gates. Generated APKs and evidence remain under ignored `local/` paths and are never committed.

## Available patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0-dev.28](https://github.com/liongalahad/nuviotv-morphe-patches/releases/tag/v1.0.0-dev.28)**&nbsp;&nbsp;•&nbsp;&nbsp;`dev`&nbsp;&nbsp;•&nbsp;&nbsp;9 patches total
<details open>
<summary>📦 NuvioTV&nbsp;&nbsp;•&nbsp;&nbsp;9 patches</summary>
<br>

**🎯 Supported versions:**

| 0.8.7-beta |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Side-by-side installation](testing/patches/side-by-side-installation/README.md) | Installs the patched app separately as Nuvio Morphe instead of replacing NuvioTV. |  |
| [Random Episode](testing/patches/random-episode/README.md) | Adds Morphe > Detail Page > Show Random Episode Button and random series playback.<br>Original idea and code by [**DeclanSC**](https://github.com/DeclanSC). |  |
| [Local Media](testing/patches/local-media/README.md) | Adds Library > Storage playback, folder selection, and same-basename sidecar subtitles for local video files. |  |
| [Local Downloads](testing/patches/local-downloads/README.md) | Downloads selected direct movie and episode sources to local storage for exact local playback. |  |
| [Remove SDH Annotations](testing/patches/sdh-annotations/README.md) | Adds Settings → Morphe → Subtitles to normalize music symbols and remove SDH annotations from Media3 subtitles. |  |
| [Mark SDH Subtitles](testing/patches/sdh-marking/README.md) | Marks explicitly labelled SDH tracks and detected English SDH subtitle files. |  |
| [Allow Importing Subs from Local Storage](testing/patches/local-storage-subtitles/README.md) | Imports device subtitle files into Nuvio's ExoPlayer subtitle menu without rebuilding active playback. |  |
| [Library Mode Focus Fix](testing/patches/library-mode-focus-fix/README.md) | Returns Library focus to the previously selected Saved or Cloud mode. |  |
| [Restore Source Selection](testing/patches/source-selection-restore/README.md) | Returns the source picker to the source played before leaving the player. |  |

</details>

<!-- PATCHES_END -->

## Branches

- `dev`: development and private prereleases.
- `main`: reviewed stable releases only. Merge `dev` without squashing so semantic-release sees the conventional commits.

License: GPL-3.0 with the template's `NOTICE` terms.
