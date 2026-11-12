# Expert RAW patches (Morphe)

Morphe patches for Samsung Expert RAW **6.0.02.8**.
**Status: tested.** `patches-2.1.0.mpp` applied with morphe-desktop 2.1.1 CLI; on a Galaxy S23 the patched APK captures one frame (`dsCondition 0xAA0001`), saves DNG + JPEG immediately and refreshes the thumbnail.

## Patches

| Patch | Default | What it does |
|---|---|---|
| Disable post-processing | on | Settings → Pictures → "Disable post-processing": single-frame capture, saved immediately, no "Refining image" notification, working thumbnail. Depends on the patch below. |
| Samsung signature compatibility | on | Lets a re-signed Expert RAW run on a stock Galaxy (safe wrappers for signature-permission calls, `/data/sec` → app storage, secmedia emulated via MediaStore, GPPM disabled). Voice shutter and volume-key shutter stop working. |

## Files

```
patches/src/main/kotlin/app/morphe/patches/expertraw/
  shared/Constants.kt                       compatibility (package, Samsung cert SHA-256, 6.0.02.8)
  misc/extension/SharedExtensionPatch.kt    merges extensions/expertraw.mpe (+ shared)
  misc/compat/SignatureCompatibilityPatch.kt
  postprocessing/Fingerprints.kt
  postprocessing/DisablePostProcessingPatch.kt
extensions/expertraw/
  src/main/java/app/morphe/extension/expertraw/   PpBypass, PpBypassPreference, PpImmediate, PpRefresh,
                                                  SafeCR, SafeSys, SecMediaShim
  stub/                                           compile-only stubs (Samsung framework + app classes)
```

## Build without a GitHub token

Morphe's plugin and libraries are published only on GitHub Packages, but all three are public source.
Clone [morphe-patcher](https://github.com/MorpheApp/morphe-patcher), [morphe-patches-library](https://github.com/MorpheApp/morphe-patches-library) and
[morphe-patches-gradle-plugin](https://github.com/MorpheApp/morphe-patches-gradle-plugin) next to this repo; they are resolved locally.
The plugin signs its publication with `gpg`; for a local publish, wrap its `signing { }` block in
`if (!providers.gradleProperty("skipSigning").isPresent) { … }` and pass `-PskipSigning`:

```bash
cd ../morphe-patches-gradle-plugin && ./gradlew publishToMavenLocal -PskipSigning # app.morphe.patches 2.1.0
cd ../morphe-patches && GITHUB_ACTOR=local GITHUB_TOKEN=unused ./gradlew :patches:buildAndroid   # uses ../morphe-patcher and
                                                                        # ../morphe-patches-library as composite builds
```

The bundle (`.mpp`) is written under `patches/build/libs/`. JDK 17 is required; Gradle's foojay
resolver provisions it if missing. `ANDROID_HOME` must point to an SDK with platform 36.

Alternatively, add `gpr.user` / `gpr.key` (a classic PAT with `read:packages`) to `~/.gradle/gradle.properties`.

Notes:
- `GITHUB_ACTOR` / `GITHUB_TOKEN` are dummies: the plugin's settings code crashes (`IllegalArgumentException`)
  when they're unset, even though GitHub Packages isn't used.
- If the Gradle wrapper can't download Gradle, point `distributionUrl` in
  `gradle/wrapper/gradle-wrapper.properties` at a local `gradle-9.8.2-bin.zip` (`file:///path/to/zip`).

## Trimmed repo

YouTube, YouTube Music and Reddit were removed (extensions, patches, tests, `shared/misc/spans`,
`shared/misc/textcomponent`, the YouTube/Jam tasks in `patches/build.gradle.kts`). Restore with `git checkout -- .`.
Left: `extensions/{shared,all,expertraw}` and `patches/.../{all,shared,util,expertraw}`.

## Apply

With Morphe CLI or Morphe Manager, select the `.mpp`, input `Expert RAW 6.0.02.8` APK, and enable
the two patches above. Then install (the Store version must be uninstalled first, since the signatures differ):

```bash
adb uninstall com.samsung.android.app.galaxyraw
adb install -r --user 0 patched.apk
```

On first launch, grant runtime permissions and toggle ON the **"All files access"** prompt to allow saving photos to `DCIM/Expert RAW/` (no ADB command required). In Settings, toggling **Disable post-processing** prompts to restart the app immediately.
