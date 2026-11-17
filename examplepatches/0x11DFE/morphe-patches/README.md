# 0x11DFE Morphe patches

Patches for use with [Morphe](https://morphe.software) by **0x11DFE**. The patch list
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
> **[v1.9.1](https://github.com/0x11DFE/morphe-patches/releases/tag/v1.9.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 Waypoint&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.greycastel.waypoint`

**🎯 Supported versions:**

| 1.10.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable PairIP license check](docs/waypoint/README.md#disable-pairip-license-check) | Empties com.pairip.licensecheck.LicenseClient.checkLicense so the re-signed patched APK is not killed by Google Play PairIP license enforcement. Generic: works on any PairIP-protected app with this class. |  |
| [Skip Waypoint onboarding paywall](docs/waypoint/README.md#skip-waypoint-onboarding-paywall) | The paywall screen shown after the Waypoint tutorial immediately invokes the app's own free-choice handler (completeOnboarding + navigate home) and renders nothing. Matches the PaywallScreen bytecode pattern and fails cleanly when the app is rebuilt. |  |
| [Unlock Waypoint Pro](docs/waypoint/README.md#unlock-waypoint-pro) | Resolves the RN bridge getCustomerInfo promise with a fabricated CustomerInfo carrying an active lifetime 'Waypoint Pro' entitlement (product waypoint_lifetime), and injects the same entitlement into the hybridcommon mapper. Works even when api.revenuecat.com is unreachable. |  |

</details>

<details open>
<summary>📦 Scene&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.omarea.vtools`

**🎯 Supported versions:**

| N1 2026.10 Alpha13 | N1 2026.11 PreRelease 1 | N1 2026.11 PreRelease 2 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Random device ID](docs/scene/README.md#random-device-id) | Replaces the device SN (serial_id/serial_no/cpu_id/gid read by the root scene-daemon) with a random one everywhere the app itself uses it: the user page display and the SN-keyed cloud sync / API calls to omarea. The SN is baked per patch run. The daemon's own server report during real code activation is native and not affected. |  |
| [Unlock Scene N1](docs/scene/README.md#unlock-scene-n1) | Unlocks Scene N1: the license state parser and the activation request are forced to a perpetual success (configurable expiry), the activation code type is reported as perpetual, and the APK signature MD5 the app reports to omarea's activation binding is spoofed to the original signing key so re-signed builds still match. | • License expiry date |

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
