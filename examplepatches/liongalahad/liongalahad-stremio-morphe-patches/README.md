# Stremio Morphe Patches

Public Morphe patch source for the official Stremio Android TV application. The three current source patches target only `com.stremio.one` `1.10.4`.

This repository distributes patch code and `.mpp` bundles. It never distributes original, decoded, rebuilt, signed, patched, or otherwise modified Stremio APKs.

> [!WARNING]
> **All patches in this repository are prerelease work in progress.** They are not fully tested and may disrupt Stremio features, account state, or addon configuration. Use them only if you understand and accept this risk. Testers can report bugs, regressions, or other malfunctions by [opening a GitHub issue](https://github.com/liongalahad/stremio-androidTV-morphe-patches/issues/new). Do not attach original, patched, or modified Stremio APKs, decoded files, signing material, screenshots, or device captures to an issue.

The suite adds a default-selected side-by-side identity, a local multi-account chooser, and remote-friendly installed-addon reordering. Each patch owns its runtime logic, fingerprints, transforms, documentation, and test evidence inside its own directory. Shared code is limited to generic infrastructure required by multiple patches.

`Multi-account` provides a D-pad-friendly chooser for up to five isolated local accounts. Each account retains its own login, library, addons, watch state, preferences, caches, databases, and related app-private data. Account names, colors, four-digit PINs, removal, and switching are managed locally on the device.

`Addon reordering` adds hold-OK and D-pad ordering to Stremio's installed-addon list. Changes remain provisional until confirmed, and failed validation or server writes restore the original order. The authenticated server-write acceptance check remains outstanding.

## Install in Morphe Manager

1. Download and install [Morphe Manager](https://morphe.software/) on your phone or TV.
2. Add `github.com/liongalahad/stremio-androidTV-morphe-patches` as a GitHub patch source. No GitHub PAT is required because the repository is public.
3. Enable prerelease patches while the bundle remains on `dev`.
4. Import the official Stremio Android TV 1.10.4 APK for the target ABI.
5. Select the patches to apply. All three are enabled by default. `Side-by-side installation` produces package `com.stremio.morphe` with label `Stremio Morphe`; deselect it only when replacement-install behavior is intended.
6. Save the patched APK locally, then sideload and install it on your TV. The default side-by-side output installs beside official Stremio. A replacement output cannot upgrade the official app in place because the patched APK has a different signature.

Deep link: `https://morphe.software/add-source?github=liongalahad/stremio-androidTV-morphe-patches`

## Local workflow

The local build requires Windows PowerShell, a JDK, and the Android SDK. Build the native Morphe patch bundle against checked-out Morphe tooling:

```powershell
.\scripts\build-morphe.ps1 `
  -MorpheGradlePluginSource "C:\path\to\morphe-patches-gradle-plugin" `
  -MorphePatcherSource "C:\path\to\morphe-patcher"
```

The script prints the generated `.mpp` path and SHA-256. Build output remains under ignored `patches/build/` paths and is never committed.

The source paths can instead be supplied through `MORPHE_GRADLE_PLUGIN_SRC` and `MORPHE_PATCHER_SRC`. To resolve published Morphe dependencies, set `MORPHE_PACKAGES_TOKEN` to a GitHub token with `read:packages` scope and either set `GITHUB_ACTOR` to that token's account or authenticate GitHub CLI as that account.

## Stremio 1.10.4 compatibility

The source definitions cover the official `armeabi-v7a`, `arm64-v8a`, `x86`, and `x86_64` Stremio Android TV 1.10.4 APKs. Compatibility requires the official Stremio signing certificate and the declared ABI-specific version code. A new Stremio version remains unsupported until patch application, assembly, installation, launch, and relevant device acceptance checks pass.

Current validation includes composed and signed `x86_64` and `arm64-v8a` builds. The `x86_64` build was installed and exercised on an Android TV API 36 emulator. Multi-account, navigation, isolation, and side-by-side launch checks passed within the documented scope. Addon reordering passed its local interaction and rollback checks; the final authenticated server-write boundary remains outstanding. Real Google TV Streamer acceptance also remains manual.

The 2024 Google TV Streamer exposes 32-bit ARM app support, so use Stremio's `armeabi-v7a` APK for that device. A 64-bit ARM CPU does not imply an `arm64-v8a` Android userspace.

## Available patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0-dev.2](https://github.com/liongalahad/stremio-androidTV-morphe-patches/releases/tag/v1.0.0-dev.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`dev`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Stremio Android TV&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 1.10.4 |
| :---: |
| Official Stremio Android TV 1.10.4 APK |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Side-by-side installation](patches/side-by-side-installation/README.md) | Installs the patched app separately as Stremio Morphe instead of replacing official Stremio. |  |
| [Multi-account](patches/multi-account/README.md) | Adds an Android TV account chooser with isolated login, library, addons, watch state, names, colors, and PINs. |  |
| [Addon reordering](patches/addon-reordering/README.md) | Adds remote-friendly hold-OK reordering to Stremio's installed-addon list. |  |

</details>
<!-- PATCHES_END -->

## Branches

- `dev`: ongoing development and prereleases.
- `main`: patches promoted only after relevant compatibility and device acceptance checks pass.

License: [GPL-3.0](LICENSE).
