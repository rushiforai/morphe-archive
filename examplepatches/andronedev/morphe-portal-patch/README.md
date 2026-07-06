# morphe-portal-patch

Custom [Morphe](https://morphe.software/) patches for Meta Portal apps. Builds a `.mpp` patch
bundle that a Morphe build pipeline applies **alongside** the official `MorpheApp/morphe-patches`
bundle. The patched + signed APKs are installed by
[OpenPortal](https://github.com/andronedev/openportal).

This repo is Portal-scoped: it only holds patches for apps that run on Meta Portal.

## Patches

| Patch | Apps | What it does |
|---|---|---|
| **Custom DPI** | YouTube, YouTube Music | Forces a higher display density for the app only (default 240 dpi, ~1.5x), so the UI scales up on Portal's low-dpi screen **without** changing the system density. Opt-in (`use = false`); enabled at build time with `-e "Custom DPI"` and tuned with `-O dpi=<value>`. |
| **Custom version name** | YouTube, YouTube Music | Overrides `android:versionName` with the full value passed via `-O versionName=<value>`, so a re-patched build of the same upstream version is recognised as a new version. Runs in `finalize` (an `execute`-phase manifest edit is overwritten when the patcher rebuilds the manifest). Opt-in. |
| **Disable experimental notice** | YouTube, YouTube Music | Neutralises the experimental-version warning dialog (it otherwise nags whenever the patched version differs from the recommended one) by emptying the merged extension method in `finalize`. Opt-in. |

### How "Custom DPI" works

Android density is read at runtime in many places, and forcing it on the `Application` alone does
not propagate to Activities (each Activity has its own `Resources` via `ResourcesManager`). So the
patch:

1. Bundles an **extension** (`extensions/youtube`, merged into the APK as `extensions/youtube.mpe`)
   whose `app.morphe.extension.dpi.DensityPatch` registers `ActivityLifecycleCallbacks` and forces
   the density per-Activity (in `onActivityPreCreated` on API 29+, or `onActivityCreated` on older),
   re-applying on configuration changes.
2. The bytecode patch (`patches/.../youtube/dpi`) hooks the application's `onCreate` — found by
   walking up the class hierarchy from the manifest's application class — and injects one
   `invoke-static` that calls `DensityPatch.init(application, dpi)`.

## Layout

```
settings.gradle.kts            plugin app.morphe.patches 1.2.0 (registry MorpheApp/registry) + modules
gradle/libs.versions.toml      morphe-patcher 1.3.3, smali, agp, ...
patches/                       the patch bundle (Kotlin)
  build.gradle.kts             patches { about { ... } } + tasks
  stub/                        Android API stubs (compileOnly)
  src/main/kotlin/app/morphe/
    util/                      reusable bytecode/resource helpers
    patches/youtube/dpi/       Custom DPI: CustomDpiPatch.kt, Constants.kt, Fingerprints.kt
extensions/youtube/            extension module -> extensions/youtube.mpe (DensityPatch.kt)
.github/workflows/release.yml  build -> publish the patches-<version>.mpp release
```

## Build

```bash
./gradlew build        # produces patches/build/libs/patches-<version>.mpp (bundling youtube.mpe)
```

The `app.morphe.patches` plugin and `morphe-patcher` resolve from the GitHub Packages registry
`MorpheApp/registry`, which needs read auth. CI passes `GITHUB_TOKEN` (with `GITHUB_ACTOR`). If that
token cannot read the cross-org registry, set repo secrets `GPR_USER` + `GPR_KEY` (a PAT with
`read:packages`); the release workflow forwards them as `-Pgpr.user`/`-Pgpr.key`.
