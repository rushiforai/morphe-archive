# 0x11DFE Morphe patches

Patches for use with [Morphe](https://morphe.software) by 0x11DFE. The patch list
below shows every supported app and version. Notes, download sources and update steps
for each app live in `docs/<app>/README.md`.

## Disclaimer

This repo is for learning and research into how Android apps enforce licenses. It has
no connection to the apps it patches, their authors, or the Morphe project. Bypassing
a paid license can break the app's terms and, in some places, the law. If an app is
useful to you, buy it. Everything here is provided as is, with no warranty. You alone
are responsible for what you do with it.

## Add to Morphe

<a href="https://morphe.software/add-source?github=0x11DFE/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

`https://github.com/0x11DFE/morphe-patches`

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.12.5](https://github.com/0x11DFE/morphe-patches/releases/tag/v1.12.5)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;10 patches total
<details open>
<summary>📦 Scene&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**Package name:** `com.omarea.vtools`

**🎯 Supported versions:**

| N1 2026.10 Alpha13 | N1 2026.11 PreRelease 1 | N1 2026.11 PreRelease 2 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Daemon gate bypass](docs/scene/README.md#daemon-gate-bypass) | Keeps the scene-daemon monitor gate open so live stats (dashboard cards, overlays) keep updating instead of freezing ~40s after connect. The daemon launcher script re-asserts the gate on every start and fails safe on unknown daemon layouts. Requires root. |  |
| [Random device ID](docs/scene/README.md#random-device-id) | Replaces the device SN with a random value everywhere the app uses it: user page, cloud sync and API calls to omarea. Baked per patch run. The daemon's own activation report is native and not affected. |  |
| [Unlock Scene N1](docs/scene/README.md#unlock-scene-n1) | Unlocks Scene N1 with a perpetual license and a configurable expiry date. The signature MD5 reported to omarea is spoofed to the original signing key, so re-signed builds still pass the activation binding. | • License expiry date |
| [Unlock optional features](docs/scene/README.md#unlock-optional-features) | Shows the gated Optional features entries: Refresh rate, FAS in games and CPU limiters. The gates are cloud-profile and display-API checks, not device limits, so the features work locally. Bypass power supply stays hidden without a supported charging node. |  |

</details>

<details open>
<summary>📦 Waypoint&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.greycastel.waypoint`

**🎯 Supported versions:**

| 1.10.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable PairIP license check](docs/waypoint/README.md#disable-pairip-license-check) | Empties com.pairip.licensecheck.LicenseClient.checkLicense so PairIP does not kill the re-signed APK. Works on any app that ships this class. |  |
| [Skip Waypoint onboarding paywall](docs/waypoint/README.md#skip-waypoint-onboarding-paywall) | Skips the paywall after the tutorial: it runs the app's own free-choice handler (completeOnboarding, then home) and renders nothing. Fails cleanly when the bundle changes. |  |
| [Unlock Waypoint Pro](docs/waypoint/README.md#unlock-waypoint-pro) | Unlocks Waypoint Pro. The getCustomerInfo bridge and the hybridcommon mapper report a fake active lifetime entitlement (waypoint_lifetime), so it works even when api.revenuecat.com is unreachable. |  |

</details>

<details open>
<summary>📦 MD PROXY VPN&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.vpnproxymd.mdproxyvpn`

**🎯 Supported versions:**

| v1.0.8.8 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove Ads](docs/md-proxy/README.md#remove-ads) | Empties the banner, interstitial, rewarded and app-open ad loaders and the rewarded load in the server-row boost button. No ad request leaves the device. Use with 'Unlock Speed Boost' to keep the boost button working. |  |
| [Unlimited Time](docs/md-proxy/README.md#unlimited-time) | The session clock always reports 100 years, so sessions never expire. The countdown display shows the infinity sign. |  |
| [Unlock Speed Boost](docs/md-proxy/README.md#unlock-speed-boost) | Grants the per-server boost on tap instead of after an interstitial. Same storage, rocket icon and toast as the ad flow. The 3-minute interstitial while connected is gone as well. Use together with 'Remove Ads'. |  |

</details>

<!-- PATCHES_END -->

## Versioning

Releases are versioned automatically from conventional commits:

| Commit type | Version bump |
|---|---|
| `feat:` | minor (new patch, app or option) |
| `fix:`, `bump:`, `perf:` | patch |
| `BREAKING CHANGE:` / `feat!:` / `fix!:` | major |

Anything else (`chore:`, `docs:`, ...) does not cut a release. The full rules live in
`.releaserc`.

## Update policy

Releases are automated by semantic-release: push conventional commits to main.
Version, CHANGELOG, patches-bundle.json, patches-list.json and the patch table above
are generated and committed automatically. Never edit them by hand.

Patches are version-pinned per app via `AppTarget` in `Constants.kt`, which is what
makes an app appear in Morphe's Applications catalog. When an app ships an update, add
the new version string to its `COMPATIBILITY_*` constant, follow the app's notes in
`docs/`, and push a `bump:` commit.

Always `git pull --rebase` before pushing: the release bot commits metadata to main.

## Build

Requires JDK 17, Android SDK, and a GitHub token with `read:packages` access to
`MorpheApp/registry` (Morphe's patcher Gradle plugin is distributed via GitHub Packages).

```bash
export ANDROID_HOME=$HOME/Android/Sdk
export GITHUB_ACTOR=<github user>
export GITHUB_TOKEN=<token with read:packages>
./gradlew :patches:buildAndroid          # -> patches/build/libs/patches-<version>.mpp
./gradlew :patches:generatePatchesList   # -> patches-list.json
```

## Publishing this repo as a Morphe patch source

Morphe Manager does not auto-discover repos: users add a source URL by hand. To ship
updates, CI builds the bundle and attaches it to a GitHub release.

1. Push this repo to GitHub (main branch).
2. No secrets required: the included workflow authenticates to the Morphe Gradle
   plugin registry (`maven.pkg.github.com/MorpheApp/registry`) with the default
   Actions `GITHUB_TOKEN`.
3. Tag a release: `git tag v1.0.0 && git push --tags`. The workflow builds
   `patches/build/libs/patches-<version>.mpp` plus `patches-list.json` and attaches
   them to the release.
4. In Morphe Manager, users add `https://github.com/<you>/<repo>` as a patch source.
