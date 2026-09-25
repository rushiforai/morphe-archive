# Santodan Patches

Independent patches for the [Morphe](https://morphe.software/) patcher.

[Add Santodan Patches to Morphe](https://morphe.software/add-source?github=Santodan/santodan-patches), or add this source manually:

```text
https://github.com/Santodan/santodan-patches
```

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v0.3.2](https://github.com/Santodan/santodan-patches/releases/tag/v0.3.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;7 patches total
<details open>
<summary>📦 NuvioTV&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 1.1.0-beta.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [NuvioTV - Remaining episodes in Continue Watching](#nuviotv-remaining-episodes-in-continue-watching) | Adds a disabled-by-default Continue Watching setting that displays aired, unwatched episode counts for every tracking integration. |  |
| [NuvioTV - Side-by-side installation](#nuviotv-side-by-side-installation) | Installs the patched app as NuvioTV Patched beside the official NuvioTV app. |  |

</details>

<details open>
<summary>📦 Peafowl Theme Maker for EMUI&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| GMS_27.5.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Peafowl - Unlock Theme Ownership (Experimental)](#peafowl-unlock-theme-ownership-experimental) | Use Peafowl's local free-theme path without the billing preflight. Experimental; server downloads are not guaranteed. |  |

</details>

<details open>
<summary>📦 Pillo&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 0.6.19 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Pillo - Hybrid Lock-Screen Notifications](#pillo-hybrid-lock-screen-notifications) | Use fullscreen alarms while the phone is locked and banner notifications while it is unlocked. Select Pillo's Banner/Light notification mode. |  |

</details>

<details open>
<summary>📦 Reddit&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 2026.37.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Reddit - Content filters (Experimental)](#reddit-content-filters-experimental) | Adds keyword and per-community flair filters under Morphe > Filters. Home-feed flair filtering requires Show flairs in home feed, which is installed automatically. |  |
| [Reddit - Show flairs in home feed (Experimental)](#reddit-show-flairs-in-home-feed-experimental) | Shows native post flair badges below titles in the home feed, including cached and joined-community posts. Controlled by Morphe > Layout. |  |
| [Reddit - Start as guest](#reddit-start-as-guest) | Skips the forced startup login screen using Reddit's native browse-logged-out action. Login remains available from the account menu. Already included upstream in Morphe Patches PR #3109: https://github.com/MorpheApp/morphe-patches/pull/3109 |  |

</details>

<!-- PATCHES_END -->

## Building

This repository uses the official Morphe Gradle plugin and release layout. GitHub credentials with package-read access must be available as `GITHUB_ACTOR` and `GITHUB_TOKEN` for local builds.

For local Windows builds, copy `.env.example` to the ignored `.env` file, insert a GitHub token with `read:packages` access, and run:

```powershell
.\build-local.ps1
```

On Windows, if you use the `.env` file, run the wrapper through `build-local.ps1` so the GitHub package credentials are loaded:

```powershell
.\build-local.ps1 :patches:buildAndroid
.\build-local.ps1 :patches:generatePatchesList
```

You can run `gradlew.bat` directly only when `GITHUB_ACTOR` and `GITHUB_TOKEN` (or the equivalent Gradle properties) are already set in that terminal.

On Linux or macOS:

```bash
./gradlew :patches:buildAndroid
./gradlew :patches:generatePatchesList
```

The generated bundle is written to `patches/build/libs/patches-<version>.mpp`. `patches-list.json`, `patches-bundle.json`, and the generated section of this README are release-owned files and should not be edited manually.

## Patch targets

| App | Package | Supported version | Patch |
| --- | --- | --- | --- |
| NuvioTV | `com.nuvio.tv` | `1.1.0-beta.1` | Remaining episodes in Continue Watching; Side-by-side installation |
| Reddit | `com.reddit.frontpage` | `2026.37.0` | Content filters (Experimental); Show flairs in home feed (Experimental); Start as guest |
| Peafowl Theme Maker for EMUI | `h7.hamzio.emuithemeotg` | `GMS_27.5.1` | Unlock Theme Ownership (Experimental) |
| Pillo | `xyz.rtrvr.pillo` | `0.6.19` | Hybrid Lock-Screen Notifications |

See [AI_Guide.md](AI_Guide.md) for implementation details and device-testing notes.
