# NuvioTV Morphe Patches

Public Morphe patch source for the official NuvioTV Android application. The seven current source patches target only `com.nuvio.tv` `0.9.0-beta`.

The first beta is [1.0.0-beta.1](https://github.com/liongalahad/liongalahad-nuviotv-morphe-patches/releases/tag/v1.0.0-beta.1), published from `main`. Enable prereleases for this source in Morphe Manager. The bundle version and supported NuvioTV version are separate: use this bundle with NuvioTV **0.9.0-beta** only.

This repository distributes patch code and `.mpp` bundles. It never distributes original, patched, or modified NuvioTV APKs.

> [!WARNING]
> **All patches in this repository are prerelease work in progress.** They are not fully tested and may disrupt NuvioTV features or cause unexpected behavior. Use them only if you understand and accept this risk. Testers can share feedback and report bugs, regressions, or other malfunctions by [opening a GitHub issue](https://github.com/liongalahad/liongalahad-nuviotv-morphe-patches/issues/new/choose). Do not attach original, patched, or modified NuvioTV APKs to an issue.

The suite adds a default-selected side-by-side install identity, local-media playback, direct local downloads, storage subtitle imports, SDH detection and cleanup, and random-episode playback. Each optional patch owns its settings, state, runtime logic, tests, manifest registration, and documentation. Shared code is limited to generic infrastructure required by multiple patches.

Since 0.8.10, NuvioTV provides source-selection restoration and Library mode focus restoration natively, so the former `Restore Source Selection` and `Library Mode Focus Fix` patches were removed rather than duplicating upstream behavior.

`Local Downloads` resolves Nuvio's subtitle-fetch worker structurally for each supported APK architecture. This allows completed movie and episode downloads to locate Nuvio's current subtitle repository and save addon subtitles matching the configured primary and secondary languages, without relying on one architecture-specific obfuscated class name.

The Morphe settings title remains **Morphe** in every locale. Settings labels and descriptions support English, Spanish, Italian, German, French, Portuguese (including Brazilian locale selection), Japanese, Korean, Simplified Chinese and Traditional Chinese. Each optional patch owns its translation catalog; unlisted languages fall back to English. This covers the Morphe settings surfaces, not every diagnostic message or the upstream app.

The SDH cleanup patch provides `Off`, `Normalize music symbols only`, `Remove SDH, keep lyrics`, and `Full cleanup`. It removes complete multiline bracketed blocks and infers repeated unknown lyric-boundary tokens within a cue using explicitly documented text rules rather than an AI classifier. Read [exact SDH removal behavior and destructive limitations](docs/SDH_REMOVAL.md) before reporting a missed annotation.

## Install in Morphe Manager

1. Download and install [Morphe Manager](https://morphe.software/) on your phone or TV.
2. Add `github.com/liongalahad/liongalahad-nuviotv-morphe-patches` as a GitHub patch source. No GitHub PAT is required because the repository is public.
3. Enable prerelease patches to receive beta bundles.
4. Import the official [NuvioTV 0.9.0-beta APK](https://github.com/NuvioMedia/NuvioTV/releases/tag/0.9.0-beta) for the target ABI, or the official universal APK.
5. To choose optional patches in Manager 1.27.0, enable Settings > Advanced > Expert mode, then select the NuvioTV bundle and the desired patches. Basic mode applies the recommended selection only. `Side-by-side installation` is selected by default and produces package `com.nuvio.morphe` with label `Nuvio Morphe`; deselect it only when replacement-install behavior is intended.
6. Save the patched APK locally, then sideload and install it on your TV. The default side-by-side output installs beside the official app. A replacement output cannot upgrade the official app in place because the patched APK has a different signature.

Applying any public patch also disables NuvioTV's in-app updater. Automatic update checks and the manual About-page update action are bypassed, their About-page controls are removed, and the patched manifest no longer requests package-install permission. To update a patched installation, patch a newly supported official APK and install the resulting signed build instead.

Deep link: `https://morphe.software/add-source?github=liongalahad/liongalahad-nuviotv-morphe-patches`

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

## NuvioTV 0.9.0-beta compatibility

All seven patch compartments target the official `0.9.0-beta` universal and ABI-specific APKs. The port updates version-pinned settings resources and native Compose bridges, prevents the Morphe settings page from crashing when its sections are opened, and adapts Local Downloads to the current episode, hero, Continue Watching, and stream-screen contracts.

Local Media and Local Downloads now share generic storage discovery that handles existing and newly added files, refreshes the Library > Storage view, and supports writable removable storage. Completed episodes receive a downloaded badge whose size and outer inset mirror Nuvio's native watched badge on the opposite corner. FAT32-sized downloads can be stored as validated segments and played as one local item.

Validation passed 295 extension tests and 9 patch tests, isolated application across four official APK variants, and combined signature/alignment checks. All seven installed TV emulator profiles were exercised, followed by 30 final-build cold launches. Downloads, local playback, subtitle imports and random continuation received functional checks. See the [0.9.0-beta validation report](testing/VALIDATION_0.9.0-beta.md) for exact coverage, build stages and remaining physical-TV acceptance. Generated APKs and raw evidence remain ignored under `local/`. The [public beta bundle passed Android Manager validation](validation/1.0.0-beta.1-manager.md), including GitHub-source discovery, seven-patch enumeration and all-seven patch application.

## Available patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0-beta.1](https://github.com/liongalahad/liongalahad-nuviotv-morphe-patches/releases/tag/v1.0.0-beta.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;7 patches total
<details open>
<summary>📦 NuvioTV&nbsp;&nbsp;•&nbsp;&nbsp;7 patches</summary>
<br>

**🎯 Supported versions:**

| 0.9.0-beta |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Side-by-side installation](testing/patches/side-by-side-installation/README.md) | Installs the patched app separately as Nuvio Morphe instead of replacing NuvioTV. |  |
| [Random Episode](testing/patches/random-episode/README.md) | Adds persistent per-show random playback with All or Unwatched episode pools.<br>Original idea and code by [**DeclanSC**](https://github.com/DeclanSC). |  |
| [Local Media](testing/patches/local-media/README.md) | Adds Library > Storage playback, folder selection, and same-basename sidecar subtitles for local video files. |  |
| [Local Downloads](testing/patches/local-downloads/README.md) | Downloads selected direct movie and episode sources to local storage for exact local playback. |  |
| [Remove SDH Annotations](testing/patches/sdh-annotations/README.md) | Adds Settings → Morphe → Subtitles to normalize music symbols and remove SDH annotations from Media3 subtitles. |  |
| [Mark SDH Subtitles](testing/patches/sdh-marking/README.md) | Marks explicitly labelled SDH tracks and detected English SDH subtitle files. |  |
| [Allow Importing Subs from Local Storage](testing/patches/local-storage-subtitles/README.md) | Imports device subtitle files into Nuvio's ExoPlayer subtitle menu without rebuilding active playback. |  |

</details>

<!-- PATCHES_END -->

## Branches

- `dev`: ongoing development.
- `main`: reviewed beta and stable release source. Merge `dev` without squashing. Beta publication is explicit; stable publication still requires physical-TV acceptance.

License: GPL-3.0 with the template's `NOTICE` terms.
