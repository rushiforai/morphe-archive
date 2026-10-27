# Pigfoot Patches

App-scoped Android patches for **RailsGo (台灣鐵道通), CamScanner and Fing**, built
with the official Morphe Gradle template. Each app has independent patch policies
and strict clean-input compatibility guards.

## Supported apps

| App | Qualified clean input | Main policies |
| --- | --- | --- |
| [RailsGo / 台灣鐵道通](#railsgo--台灣鐵道通) | **1.25.2 (156)**, arm64-v8a APKS | Sideload startup compatibility, bus refresh without video, optional package rename |
| [CamScanner](#camscanner) | **7.26.5.2609160000 (72651)** or **7.27.0.2609220000 (72701)**, full APKM | Re-signing compatibility, local premium, privacy; optional ads/offline policies |
| [Fing](#fing) | **12.13.5 (121305003)**, full APKM, ARM64/ARMv7, Android 9+ | Local premium features and reduced telemetry, independently selectable |

Only these qualified versions/builds are supported. Use pristine originals, not
previously patched APKs or third-party mods. Standard and Shizuku installation
are supported as described below; **root mount is not qualified for any of these apps**.

## Installation and updates

1. Add `https://github.com/pigfoot/morphe-patches` as a source in Morphe Manager.
2. Select the matching clean input listed above, including the original splits.
3. Review the app-specific patch choices below, then patch and install.
4. For updates, keep the **same package name and local Morphe signing key**.
   Do not clear data or uninstall an existing patched app merely to update it.

An ordinary re-signed build cannot update a differently signed Play installation
under the same package name. Uninstalling that app removes its local data.
Only RailsGo offers optional package renaming for parallel installation; CamScanner
and Fing preserve their original package and display identity.

Local premium policies do not create a purchase, subscription, server entitlement,
cloud quota or credit grant. Reduced telemetry is scoped suppression, not a
zero-traffic guarantee. Build/static checks do not replace device validation.

## RailsGo / 台灣鐵道通

Use clean **1.25.2 (156), arm64-v8a APKS**.

- **RailsGo sideload startup compatibility** is required for standard/Shizuku
  installs, whether or not the package is renamed.
- **RailsGo bus update without video** includes startup compatibility automatically,
  but **does not select package renaming**. It uses the observed rewarded unit's
  loaded metadata and retains the original fallback.
- **Change package name** is optional and **unselected by default**. Without it,
  retain `com.waccliu.taiwanrail` and the original providers, permissions and links.
  Select it for parallel installation: default `com.waccliu.taiwanrail.morphe`,
  or another valid custom package. Providers, permissions and links are isolated
  together; the original display name is preserved.

To update an existing `.morphe` or custom-package installation, explicitly select
**Change package name**, retain the installed package value and use the same key.
This opt-in default differs from the initial v0.0.1 behavior. Phone startup and
live bus-refresh behavior require device validation.

### RailsGo patch options

Startup compatibility is required and bus update is enabled by default for
standard/Shizuku installs. Neither has user-configurable parameters.
Only **Change package name** exposes an option:

| Parameter (Manager label) | Default | Accepted values and effect |
| --- | --- | --- |
| `packageName` (Package name) | `com.waccliu.taiwanrail.morphe` | Used only when the rename patch is selected. A required package string of at most 200 characters, with at least two dot-separated segments. Each segment starts with an ASCII letter and continues with ASCII letters, digits or `_`. The original `com.waccliu.taiwanrail` and reserved `com.waccliu.taiwanrail.diagnostic` are rejected. |

Changing this value changes the installed app identity, not just its label.
For example, `com.example.taiwanrail` installs separately; it cannot update an
existing `.morphe` install. Renaming also isolates provider authorities, app-owned
permissions and the deep-link scheme. The default scheme is `taiwanrail-morphe`;
custom names receive a deterministic isolated scheme.

## CamScanner

Use pristine full APKM **7.26.5.2609160000 (72651)** or
**7.27.0.2609220000 (72701)**. Both targets appear in the ordinary Manager source
picker without experimental-version mode. Original modules, OCR assets and
identity are preserved.

| Patch | Default and scope |
| --- | --- |
| Restore trust on re-signed builds | Selected; required for standard/Shizuku. Narrow request-sign compatibility and API Center cache recovery, not global certificate or authentication-result spoofing. |
| Local premium features | Selected; local feature status only. Folder limit stays original unless explicitly changed. |
| Reduce telemetry and app logging | Selected; qualified Firebase/app/local logging suppression. Unrelated Firebase services remain. |
| Disable ads | Unselected. Rewarded videos default to `block`; explicit `skip-lottery` is experimental, online and **72701-only**. Server grants remain outside the patch's control. |
| Offline mode | Unselected. Includes ad suppression and removes all app INTERNET declarations, while preserving real platform connectivity. Incompatible with lottery skipping; does not make external apps/services offline. |

For online ad support, keep the default compatibility/premium/privacy set and
leave ads/offline off. Premium and privacy can be deselected independently.
No scanner initialization patch, diagnostic overlay or cloud Word fix is shipped.
The retired `inspect-lottery` option is not supported; use `block` or
`skip-lottery`. Desktop CLI may warn and fall back to `block` rather than abort.
The skip profile includes the phone-accepted dispatch-label correction and silent,
scoped initialization protection; a reward receipt does not guarantee server grants.

### CamScanner patch options

Patch selection and its parameter values are separate choices: an option takes
effect only when its owning patch is selected (directly or as a dependency).

| Patch / parameter (Manager label) | Default | Accepted values and effect |
| --- | --- | --- |
| Local premium / `folderLimit` (Folder limit) | `0` — Keep original limit | `0` leaves the original folder limit untouched; `5000` changes the qualified local folder-cap predicate to 5,000. Other values are rejected. This does not change cloud storage, credits or server quotas. |
| Disable ads / `rewardedVideos` (Rewarded videos) | `block` | `block` suppresses videos without entering the reward flow. `skip-lottery` forwards the original lottery task/code callback without playing the video; requires online **7.27.0.2609220000 (72701)** and preserves actual server responses. Other values are rejected. |

**Restore trust**, **reduce telemetry and app logging**, and **offline mode** have
no user-configurable parameters. Every optional CamScanner policy depends on the
required trust compatibility patch; offline also selects disable ads and requires
`rewardedVideos=block`. Offline does not automatically select premium or privacy.

Details: [implementation contract](docs/camscanner-implementation.md),
[lottery contract](docs/camscanner-reward-video-experiment.md),
[version-porting workflow](docs/camscanner-version-porting.md).

## Fing

Use pristine full APKM **12.13.5 (121305003)**, with original ARM64/ARMv7 splits
and minimum SDK **28 (Android 9)**.

| Patch | Default and scope |
| --- | --- |
| Local premium features | Selected; qualified local tier, feature-entry and purchase-status gates. No fabricated account, purchase or server authorization. |
| Reduce telemetry | Selected; qualified Analytics/automatic Crashlytics suppression, metadata opt-outs and reviewed analytics/ad-ID cleanup. Privacy settings shows **Crash reporting off and non-interactive**, even if the stored preference was on. Without this patch, the original UI is unchanged. |

Both policies can be deselected independently. Keep original identity, minimum SDK,
Maps configuration, assets/native libraries, Billing, push and network discovery.
No donor helper, offline mode, global Google Play services bypass or resource
reoptimization is included. Static qualification does not establish device or
certificate-restricted service behavior. See the [Fing contract](docs/fing-implementation.md).

### Fing patch options

Neither Fing patch has user-configurable parameters: each is a selected/unselected
policy. Both default to selected, neither selects the other, and their only shared
dependency is the hidden clean-input guard. The Crash reporting switch being off
is an effect of **Fing reduce telemetry**, not a separate Manager option. This
policy preserves the stored app preference rather than erasing it.

## Patch catalog

The following catalog is generated by release automation; do not edit it manually.

<!-- PATCHES_START -->
> **[v0.3.0](https://github.com/pigfoot/morphe-patches/releases/tag/v0.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;10 patches total
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

<details open>
<summary>📦 Fing&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 12.13.5 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Fing local premium features](#fing-local-premium-features) | Change qualified local tier, feature-entry and purchase-status gates while preserving service readiness. Does not create purchases, account entitlements, cloud grants or server authorization. Device functionality still requires verification. |  |
| [Fing reduce telemetry](#fing-reduce-telemetry) | Disable qualified Google Analytics and automatic Crashlytics collection, opt out of ad identifiers/app-event collection and remove reviewed analytics components. Preserve push, login, Billing and network discovery. Show Crash reporting off and disable its switch while selected. Not a zero-telemetry guarantee. |  |

</details>

<!-- PATCHES_END -->

## Development

### Repository layout

- `patches/src/main/kotlin/app/pigfoot/patches/{railsgo,camscanner,fing}/`: app-scoped patches and compatibility policies.
- `extensions/railsgo/`: bus-update helper and compile-only app/SDK stubs.
- `extensions/camscanner/`: scoped API Center cache compatibility helper.
- `patches/src/test/`: app policy, rejection, helper and bundle-contract tests.
- `docs/`: implementation contracts, qualification and CI guidance.
- `gradle/`: wrapper and version catalog.
- `.github/workflows/`: verification and semantic-release automation.

### Build

Requires Java 21, Android SDK 36 and a GitHub token with `read:packages` for
Morphe dependencies. Set `GITHUB_ACTOR` and `GITHUB_TOKEN`, or configure `gpr.user`
and `gpr.key` in **user-level** Gradle properties. Never commit credentials.

```sh
npm ci --include=dev
npm test
./gradlew :patches:test :patches:buildAndroid :patches:generatePatchesList --no-daemon
```

The bundle is written to `patches/build/libs/patches-<version>.mpp`.
Before pushing or declaring merge readiness, follow the
[CI preflight and exact-head completion gate](docs/ci-preflight.md).

### Versioning

After the initial v0.0.1 bootstrap, semantic-release owns versions:

- `.releaserc` defines release branches and commit rules.
- `fix:` / `perf:` / `bump:` increments the patch version.
- `feat:` increments the minor version; `BREAKING CHANGE:` increments the major version.
- `chore:` / `docs:` alone does not publish a release.
- `main` publishes stable releases; `dev` publishes prereleases.
- Automation updates version properties, changelog, Manager metadata and catalog together.

Do not manually bump generated metadata, edit the catalog above or rewrite release tags.

## License

[GNU General Public License v3.0](LICENSE). Build/release scaffolding and catalog
generation derive from the [Morphe template](https://github.com/MorpheApp/morphe-patches-template).
