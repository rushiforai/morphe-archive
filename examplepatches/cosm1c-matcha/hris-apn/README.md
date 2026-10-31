# HRIS APN patches

A [Morphe](https://morphe.software) patch bundle for **AgriConnect** (`com.git.agriconnect`).

These patches are experimental and target the exact app version listed below.

## ❓ About

AgriConnect is a Capacitor/Angular HRIS app. Its check-in/out page blocks attendance
submission when Android reports the location as coming from a mock provider. This bundle
contains patches that neutralise that client-side guard.

| Patch | Type | Default | What it does |
|---|---|---|---|
| Disable mock GPS detection | Bytecode | ✅ | Forces the background-geolocation plugin's `simulated` flag to `false` |
| Disable mock GPS detection (JS fallback) | Resource | ❌ | Rewrites `this.isMockLocation = s.simulated` to `this.isMockLocation = !1` in the check-in/out chunk |

The bytecode patch is preferred: it is resilient to the content-hashed web asset names and
does not depend on minified JavaScript.

## 🎯 Target

| | |
|---|---|
| Package | `com.git.agriconnect` |
| App name | AgriConnect |
| Version name | `1.0.2` |
| Version code | `6` |
| APK SHA-256 (analyzed) | `fdc99ee7181814e588fbc7cedfd350a001de19c2753253ab0313f5324bedae02` |

Only `1.0.2` (version code 6) is declared compatible. If the app updates, the fingerprints
will either keep matching or fail loudly instead of silently mis-patching.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/cosm1c-matcha/hris-apn/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 AgriConnect&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 1.0.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable mock GPS detection](#disable-mock-gps-detection) | Forces the background-geolocation 'simulated' flag to false so the check-in/out mock-location guard never blocks submission. |  |
| [Disable mock GPS detection (JS fallback)](#disable-mock-gps-detection-js-fallback) | Neutralises the isMockLocation assignment in the check-in/out web bundle. |  |

</details>

<!-- PATCHES_END -->

## 🔍 How the detection works

See [docs/mock-location-flow.md](docs/mock-location-flow.md) for the full traced flow.

Short version:

1. On check-in/out submit, the Angular page calls
   `BackgroundGeolocation.addWatcher({ requestPermissions: true, stale: true }, cb)`.
2. The native plugin (`com.equimaps.capacitor_background_geolocation`) receives Fused
   Location Provider fixes and builds the JS object in `formatLocation(...)`.
3. That object contains `simulated = Location.isFromMockProvider()`.
4. The callback does `this.isMockLocation = location.simulated`; 100 ms later the page
   removes the watcher and, if the flag is `true`, shows **"GPS Palsu terdeteksi!"** and
   navigates back without submitting.
5. Nothing is sent to the backend, so the decision is entirely client-side.

The patches only change step 3/4; coordinates and all other checks are untouched.

## 🚀 Building

Requirements: JDK 17+ (JDK 21 works), Android SDK for the extensions module (not required
by these patches), and Gradle wrapper (included).

```bash
./gradlew :patches:build
```

The patch bundle is produced at `patches/build/libs/patches-<version>.mpp`.

To generate `patches-list.json` locally:

```bash
./gradlew generatePatchesList
```

> Morphe's Gradle plugin (`app.morphe.patches`) is hosted on GitHub Packages, so a
> GitHub authentication token is required to resolve it.
> Create a **classic** PAT with the `read:packages` scope and set it in
> `~/.gradle/gradle.properties`:

```properties
gpr.user=YOUR_GITHUB_USERNAME
gpr.key=ghp_xxxxxxxxxxxxxxxxxxxx
```

> The same values can be supplied through `GITHUB_ACTOR` / `GITHUB_TOKEN`.

## 📦 Installing

1. Download the `.mpp` from
   [Releases](https://github.com/cosm1c-matcha/hris-apn/releases)
   (or build it locally).
2. In Morphe Manager: **Settings → Expert settings → enable Expert mode**, then add this
   repository as a patch source or import the `.mpp` as a local patch bundle.
3. Select AgriConnect `1.0.2`, enable **Disable mock GPS detection**, patch and install.

The patched APK is re-signed, so uninstall the Play Store build first.

## 🔁 CI/CD

`.github/workflows/release.yml` builds and publishes the bundle with semantic-release.
Add these repository secrets (Settings → Secrets and variables → Actions), both masked:

| Secret | Value |
|---|---|
| `GPR_USER` | GitHub username that owns the PAT |
| `GPR_KEY` | classic GitHub PAT with `read:packages` |

They are only used to download the Morphe Gradle plugin; the workflow writes them to a
temporary `~/.gradle/gradle.properties` and they are never committed.

Release flow:

```bash
# Bump the version if needed, then push a conventional commit to main.
git commit -m "fix: ..."
git push origin main
```

Semantic-release reads the conventional commits, bumps `gradle.properties`, publishes a
GitHub Release and attaches `patches-<version>.mpp`.

### Notes

- This app ships with Google Play **PairIP** (`com.pairip.application.Application`) and a
  license-check activity. If a re-signed build refuses to start or shows a licensing error,
  that is a separate protection unrelated to these patches.
- The patches are for interoperability/testing on your own device. They do not change any
  server-side validation, because none exists for this flag.

## 🧑‍💻 Repository layout

```
patches/src/main/kotlin/app/hrisapn/patches/agriconnect/
├── shared/Constants.kt                       # package + version compatibility
└── mocklocation/
    ├── Fingerprints.kt                       # formatLocation fingerprint
    ├── DisableMockLocationDetectionPatch.kt  # smali patch
    └── DisableMockLocationDetectionJsPatch.kt# asset patch
```

## 📄 License

GNU General Public License v3.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE).

This project is not affiliated with or endorsed by the Morphe project or by the authors of
AgriConnect.
