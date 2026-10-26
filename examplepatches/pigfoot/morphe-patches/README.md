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
> **[v0.2.1](https://github.com/pigfoot/morphe-patches/releases/tag/v0.2.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;8 patches total
<details open>
<summary>📦 CamScanner&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**🎯 Supported versions:**

| 7.26.5.2609160000 | 7.27.0.2609220000 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [CamScanner disable ads](#camscanner-disable-ads) | Suppress qualified ad entry points with reviewed manifest cleanup. Rewarded videos are blocked by default; an explicit 7.27.0-only lottery skip experiment can forward the original task/code flow without video. Server grants are not guaranteed or overridden. | • Rewarded videos |
| [CamScanner local premium features](#camscanner-local-premium-features) | Experimental local account-status features. Does not unlock server credits or cloud quotas. | • Folder limit |
| [CamScanner offline mode](#camscanner-offline-mode) | Revoke all app INTERNET declarations. Includes ad suppression; preserves real platform connectivity. External apps/services and offline error flows require device testing. |  |
| [CamScanner reduce telemetry and app logging](#camscanner-reduce-telemetry-and-app-logging) | Suppress qualified Firebase Analytics/Crashlytics/Performance/Sessions and app network/cache/local logging. Preserve unrelated Firebase services. Not a guarantee of zero telemetry. |  |
| [CamScanner restore trust on re-signed builds](#camscanner-restore-trust-on-re-signed-builds) | Required compatibility for supported re-signed standard/Shizuku installs: preserve original request signing and recover exact obsolete/error-only API Center caches. No diagnostic overlays. No forced host, global signature spoofing, authentication-result changes or INTERNET grant. Root mount is not qualified. |  |

</details>

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

## CamScanner support

Supports pristine full APKM **7.26.5.2609160000 (72651)** and
**7.27.0.2609220000 (72701)**. Preserve original modules, OCR assets and identity;
update with the same local signing key without clearing data.
The two qualified app targets are non-experimental in Manager and do not require
source experimental-version mode. This does not broaden supported versions; the
optional lottery skip experiment remains independently restricted to online 72701.

| Patch | Default / scope |
| --- | --- |
| CamScanner restore trust on re-signed builds | Required for standard/Shizuku; mount unavailable. Narrow native signing compatibility and API Center cache recovery, not certificate/auth-result spoofing. |
| CamScanner local premium features | Recommended; local feature status only, not a server subscription or credit grant. Folder limit remains original by default. |
| CamScanner reduce telemetry and app logging | Recommended; qualified Firebase/app/local logging suppression, not a zero-telemetry guarantee. |
| CamScanner disable ads | Optional. Rewarded videos are blocked by default; explicit online 72701-only lottery video skipping is independently guarded. |
| CamScanner offline mode | Optional. Includes ads/core and removes all app INTERNET declarations; incompatible with lottery skipping. |

For online ad support, select the recommendation set and leave ads/offline off.
Premium and privacy remain independently deselectable. No scanner initialization
patch, diagnostic option, overlay, native observer or cloud Word fix is shipped.
The retired `inspect-lottery` value fails option validation; use `block` or
`skip-lottery`. Desktop CLI may warn and continue with default `block`, rather
than aborting the command.
The ordinary skip profile includes the phone-accepted dispatch-label correction
and silent scoped initialization protection. An observed reward receipt is not a
promise that every account/request will receive a server grant.

See the [implementation contract](docs/camscanner-implementation.md),
[lottery skip contract and regression](docs/camscanner-reward-video-experiment.md),
and [independent version-porting workflow](docs/camscanner-version-porting.md).
