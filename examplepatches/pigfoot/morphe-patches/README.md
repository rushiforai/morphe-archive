# Pigfoot Patches

App-scoped patches built with the official Morphe Gradle template.

## Installation

Add `https://github.com/pigfoot/morphe-patches` as a source in Morphe Manager.
Select the clean RailsGo (台灣鐵道通) **1.25.2 (156), arm64-v8a APKS**.
Selecting the bus-update patch automatically includes sideload startup compatibility, **not package renaming**.
Sideload startup compatibility is required for supported standard and Shizuku installs.
Root mount is not qualified and these patches are unavailable in that mode.

**Change package name is optional and unselected by default.** Without it, the app keeps
`com.waccliu.taiwanrail` and its original providers, permissions and link scheme.
An ordinary re-signed build cannot update a differently signed Play installation or coexist
with it under the same package. Uninstalling the Play app removes its local data.

Select **Change package name** for parallel installation: its default is
`com.waccliu.taiwanrail.morphe`, or enter another valid package name. The patch updates
the package, providers, permissions and link scheme together; no separate parallel toggle is needed.
To update an existing `.morphe` installation, **explicitly select Change package name**,
keep its default value and use the same local signing key. Existing custom-package installs
likewise require selecting this patch and keeping the same custom value and signing key.
This opt-in behavior changes the default output identity from v0.0.1.
The original app display name is preserved. Phone startup and live bus updates still require device validation.

## Patches

<!-- PATCHES_START -->
> **[v0.1.0](https://github.com/pigfoot/morphe-patches/releases/tag/v0.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 台灣鐵道通&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 1.25.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Change package name](#change-package-name) | Optional parallel installation with a default or custom package name. Without this patch the original package is retained. The app name is unchanged; providers, permissions and links are isolated when selected. | • Package name |
| [RailsGo bus update without video](#railsgo-bus-update-without-video) | Complete the observed bus-update rewarded unit using its loaded reward metadata; retain the original fallback. Requires sideload startup compatibility, not package renaming. |  |
| [RailsGo sideload startup compatibility](#railsgo-sideload-startup-compatibility) | Required for supported re-signed standard or Shizuku installs, with or without package renaming. Bypasses the Java Play-license startup entry. Root mount is not qualified. |  |

</details>

<!-- PATCHES_END -->

## Repository layout

- `patches/src/main/kotlin/app/pigfoot/patches/railsgo/`: version-pinned app patches.
- `extensions/railsgo/src/main/java/`: injected runtime helper.
- `extensions/railsgo/stubs/`: compile-only app/SDK declarations, never bundled.
- `patches/src/test/`: fallback, reward metadata, deduplication and callback failure tests.
- `gradle/`: wrapper and version catalog.
- `.github/workflows/`: verification and semantic-release automation.

## Build

Requires Java 21, Android SDK 36, and a GitHub token with `read:packages` for Morphe dependencies.
Set `GITHUB_ACTOR` and `GITHUB_TOKEN`, or configure `gpr.user` and `gpr.key` in your **user-level** Gradle properties. Never commit credentials.

```sh
./gradlew :patches:test :patches:buildAndroid :patches:generatePatchesList
```

The bundle is written to `patches/build/libs/patches-<version>.mpp`.

## Versioning

The initial release is **v0.0.1**. Subsequent releases use semantic-release:

- `.releaserc` defines release branches and commit rules.
- `fix:` / `perf:` / `bump:` increments the patch version.
- `feat:` increments the minor version; a `BREAKING CHANGE:` footer increments the major version.
- `chore:` / `docs:` alone does not publish a release.
- `dev` publishes prereleases; merging `dev` into `main` publishes stable releases.
- Automation updates `gradle.properties`, changelog, Manager metadata and patch list together.

Do not manually edit generated metadata or rewrite release tags. The initial v0.0.1 is bootstrapped once; future releases follow the template workflow.

## License

[GNU General Public License v3.0](LICENSE). Build/release scaffolding and patch-list generation derive from the [Morphe template](https://github.com/MorpheApp/morphe-patches-template).
