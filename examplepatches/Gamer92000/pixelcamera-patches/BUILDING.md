# Building and maintaining the patches

For working on the patches. If you only want to install them, see
[README.md](README.md).

---

## Prerequisites

| | |
|---|---|
| JDK | 21+ (upstream CI uses Temurin 21; **verified building on 25**) |
| Gradle | supplied by the committed wrapper (9.6.1) — no local install needed |
| Android SDK | `platforms;android-36`, `build-tools;36.0.0` |
| Morphe Patcher | 1.7.0, pinned in `gradle/libs.versions.toml` |
| Morphe patches plugin | 1.3.3, pinned in `settings.gradle.kts` |

### GitHub Packages credentials — required

`app.morphe:*` is published only to GitHub Packages, which demands
authentication **even for public packages**. It is not on Maven Central (404)
and not on JitPack (404). Without credentials the build dies at dependency
resolution with `401 Unauthorized`.

Create a classic personal access token with the **`read:packages`** scope and
nothing else, then put it in `~/.gradle/gradle.properties`:

```properties
gpr.user=<your github username>
gpr.key=<the token>
```

or in the environment as `GITHUB_ACTOR` / `GITHUB_TOKEN`.

It is a *download* credential. It needs no repository and no write scope, and
the build contacts GitHub only during dependency resolution.

### Android SDK

The extension is an AGP application module that R8 processes, so the SDK is
required. Command-line tools are enough — no Android Studio:

```bash
# unzip commandlinetools-win-<build>_latest.zip from
# https://developer.android.com/studio#command-tools into
#   %LOCALAPPDATA%\Android\Sdk\cmdline-tools\latest
sdkmanager --sdk_root=%LOCALAPPDATA%\Android\Sdk "platforms;android-36" "build-tools;36.0.0"
```

Then point the build at it in `local.properties` (git-ignored):

```properties
sdk.dir=C:\\Users\\<you>\\AppData\\Local\\Android\\Sdk
```

Without it the build fails at `:extensions:pixelcamera:minifyReleaseWithR8` with
*"SDK location not found."*

---

## Build

```bash
./gradlew build                  # compile patches + extension, run tests
./gradlew :patches:buildAndroid  # add classes.dex to the bundle - REQUIRED
./gradlew test                   # tests only
```

**`buildAndroid` is not optional.** Plain `build` produces a bundle containing
JVM `.class` files only. Morphe Manager runs on Android and loads patches
through a dex class loader, so it rejects such a bundle at load time:

```
java.lang.IllegalStateException: Patch bundle is missing dex entries
    at PatchBundle$Loader.validateDexEntries
```

Morphe Desktop does not care, which is why a bundle can look fine on a PC and
fail on the phone. Check before publishing:

```bash
unzip -l patches/build/libs/patches-*.mpp | grep classes.dex
```

The bundle lands in `patches/build/libs/patches-<version>.mpp`.

Check what it contains:

```bash
java -jar morphe-desktop-all.jar list-patches \
    --patches=patches/build/libs/patches-1.0.0.mpp \
    --with-packages --with-versions
```

---

## Publishing, so the Morphe app can use it

Morphe Manager and Morphe Desktop read a patch bundle from a repository's
**GitHub Releases**. Pushing the source tree publishes nothing they can consume
— there has to be a release with the `.mpp` attached. Upstream ships exactly one
asset per release (`patches-1.37.0.mpp`), and this repository matches that.

`.github/workflows/release.yml` does it on tag push:

```bash
git tag v1.0.0
git push origin v1.0.0
```

That builds the bundle and attaches `patches-<version>.mpp` to a release named
after the tag. The version comes from `version` in `gradle.properties`, so bump
that before tagging.

Then add `https://github.com/<you>/<repo>` as a source in Morphe Manager.

Two things to be realistic about before relying on the Manager:

- **The rename patch lives in a different bundle.** Pixel Camera cannot be
  installed over the stock copy, so "Change package name" from the official
  `MorpheApp/morphe-patches` source must be enabled *as well*, with
  `updatePermissions` and `updateProviders` both on. That means adding both
  sources in the Manager and selecting patches across them.
- **On-device patching of a 1.2 GB split app is untested here.** Everything in
  [COMPATIBILITY.md](COMPATIBILITY.md) was verified with Morphe Desktop on a PC.
  The phone has to merge ~20 split APKs, patch, re-sign and install, which needs
  several GB of free space and a lot of patience. It may work; it has not been
  demonstrated.

## Layout

```
patches/src/main/kotlin/app/morphe/patches/pixelcamera/
├── shared/Constants.kt                       compatibility metadata
├── gallery/
│   ├── Extension.kt                          shared smali descriptors
│   ├── Fingerprints.kt                       detection
│   ├── UseThirdPartyGalleryPatch.kt          base patch
│   └── UseThirdPartyGalleryOnLockScreenPatch.kt
└── addme/
    ├── Fingerprints.kt
    └── RunAddMeWithoutEdgeTpuPatch.kt

extensions/pixelcamera/                       -> extensions/pixelcamera.mpe
└── src/main/java/app/morphe/extension/pixelcamera/gallery/GalleryRedirect.java

tools/
├── dexscan.py                dependency-free APK / AXML / DEX analyser
├── apksigcert.py             signing-certificate fingerprint
├── verify_fingerprints.py    check fingerprints against a real APK
├── Pull-PixelCamera.ps1      pull the APK set from a device
├── Install-Patched.ps1       multi-APK install with error triage
└── Watch-GalleryLaunch.ps1   filtered logcat
```

Detection is deliberately kept separate from mutation. A fingerprint that stops
matching aborts the patch with a message naming the structure it expected,
instead of half-patching.

---

## How the patches work

### Use third-party gallery

Pixel Camera funnels all three camera-roll launch paths through one method that
already calls `Intent.resolveActivity`, already wraps `startActivityForResult` in
a `try`/`catch`, and already sets `FLAG_GRANT_READ_URI_PERMISSION`. The patch
reuses all of it — four mutations, two fingerprints, no subsystem replaced.

1. **Redirect the launch.** One `invoke-static` inserted at instruction 0 of the
   launcher, ahead of the app's own `resolveActivity` check, calling
   `GalleryRedirect.prepareGalleryIntent`. That rewrites the intent in place:
   action to `ACTION_VIEW`; package, component and selector cleared; MIME type
   filled in from the existing type, else `ContentResolver.getType`, else the
   file extension, else `image/*` / `video/*`.

2. **Neutralise the Google Photos gate.** Three probes — the `getPackageInfo`
   wrapper, `getApplicationEnabledSetting` and `isPackageSuspended` — are each
   replaced with an extension static of identical shape, same registers, same
   return type.

Two details that are easy to get wrong:

- **The action must change.** `android.provider.action.REVIEW` and Google's
  `…mars.api.ACTION_REVIEW` resolve to nothing on a normal device.
- **A MIME type must be set.** Pixel Camera calls `setData()` alone on the
  common path, and an untyped implicit `VIEW` does not match a gallery's
  `scheme="content" mimeType="image/*"` filter. A fully wildcarded `*/*` does not
  match it either — hence the `image/*` / `video/*` fallbacks.

### Use third-party gallery on lock screen

Touches no Pixel Camera bytecode. The base patch always emits the same call, and
the helper consults `GalleryRedirect.redirectSecureReview()`, which ships
returning false; this patch rewrites that one extension method to return true.
So the two patches never depend on each other's instruction offsets.

### Run Add Me without the EdgeTPU

Add Me is internally *Cottage*. Pixel Camera ships two complete model sets for
it, TPU-compiled and plain, and one boolean read from `camera.cottage_use_tpu`
picks between them *and* decides whether the processor requests an EdgeTPU
delegate. The patch forces every read of that boolean in the asset loader to
false. Full trace in [FINDINGS.md](FINDINGS.md) §6.

---

## Maintaining across Pixel Camera updates

```powershell
.\tools\Pull-PixelCamera.ps1 -OutputDirectory .\work\stock-new
```
```bash
python tools/verify_fingerprints.py work/stock-new/base.apk
```

* **`RESULT: PASS`** — add the version to `Constants.kt` and
  [COMPATIBILITY.md](COMPATIBILITY.md). Nothing else to do.
* **`0 match(es)`** — the structure moved. Re-run the sweep:

  ```bash
  python tools/dexscan.py hunt work/stock-new/base.apk --out findings.json
  python tools/dexscan.py xref work/stock-new/base.apk \
      --string "com.google.android.apps.photos" --context 8
  python tools/dexscan.py dump work/stock-new/base.apk --class '^L<class>;$'
  ```

  Then adjust the filters in `Fingerprints.kt`. **Never** add a defining class or
  method name — Pixel Camera is R8-obfuscated and those change every release.
* **`2+ match(es)`** — ambiguous. Tighten with another structural filter before
  trusting it.

`verify_fingerprints.py` re-implements both gallery fingerprints against the DEX
directly, so an update can be checked in seconds without a Gradle build, a
Morphe toolchain, or a GitHub token.

---

## Analysis tooling

`tools/dexscan.py` is a pure-standard-library parser for APK containers (including
`.apkm`/`.apks`/`.xapk`), binary `AndroidManifest.xml`, and DEX — string pool,
type/proto/field/method pools, class data, and the full Dalvik instruction
stream with a correct opcode width table.

```bash
python tools/dexscan.py info    base.apk
python tools/dexscan.py strings base.apk --regex "apps\.photos"
python tools/dexscan.py xref    base.apk --string "com.google.android.apps.photos" --context 8
python tools/dexscan.py xref    base.apk --method "Landroid/content/Intent;->setPackage"
python tools/dexscan.py dump    base.apk --class '^Liho;$' --method-name '^e$'
python tools/dexscan.py hunt    base.apk --out findings.json
```

No Android SDK, apktool, baksmali or jadx required.
