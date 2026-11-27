# Build and release

How this repo builds, how to validate a bundle before shipping it, and what the release
pipeline does. Read this before touching any Gradle file or commit message.

## Never declare `repositories { }` in a module

The `app.morphe.patches` Gradle plugin (declared once in `settings.gradle.kts`, version
`2.1.2`) injects the repositories a patches module needs — `google()` and `mavenCentral()`.
Adding your own block **replaces** them, and the build then cannot resolve AGP's aapt2:

```
Could not find com.android.tools.build:aapt2:9.1.0-…
```

This is precisely what broke the first release run. The fix was deleting the
`repositories { }` block from the module `build.gradle.kts`; commit
`fix(build): let the build plugin supply the extension repositories`. The only repository
configuration in the project belongs in `settings.gradle.kts` (`pluginManagement`).

Credentials for the plugin come from Gradle properties `gpr.user` / `gpr.key` (e.g.
`~/.gradle/gradle.properties`) or `GITHUB_ACTOR` / `GITHUB_TOKEN`.

## Local Gradle builds: what works and what does not

- `./gradlew buildAndroid` is the documented build, but a **full** build fails on
  Termux/aarch64: AGP wants a complete Android SDK, and the build dies with `BUILD FAILED`
  after roughly 5.5 minutes. Do not chase this.
- **CI is the build authority**: `ubuntu-latest`, preinstalled Android SDK, Temurin 21.
- Locally, validate the artifact instead of the build (next section).
- `buildAndroid` also runs `checkAndroidApi` (animalsniffer against
  `com.toasttab.android:gummy-bears-api-26` after D8 desugaring at min API 26). It catches
  JDK APIs that do not exist on Android — if it fails, change the patch code, not the check.

## Validate locally with the morphe-desktop CLI

The fat jar (GUI + CLI, ReVanced-CLI lineage) reproduces Morphe Manager's failures exactly,
so always run it on a new `.mpp` before asking a human to test:

```sh
gh release download v2.3.0 --repo MorpheApp/morphe-cli --pattern "*.jar"

java -Xmx1600m -jar morphe-desktop-2.3.0-all.jar patch \
    -p patches/build/libs/patches-<version>.mpp \
    --unsigned -o out.apk \
    app.apkm
```

`-Xmx1600m` is not optional on this device. Decoding dominates; patching itself takes ~2.3 s.
A `Failed to match the fingerprint: …` line here is the same failure users see in the
Manager — fix the fingerprint, do not ship.

## Release pipeline

`.github/workflows/release.yml` runs semantic-release on every push:

1. `gradle-semantic-release-plugin` builds the `.mpp` (`./gradlew buildAndroid`-equivalent).
2. `.releaserc` `prepareCmd` runs `./gradlew generatePatchesList`, stamps the version into
   `patches-list.json` with `jq`, and runs
   `python3 .github/scripts/generate_patches_readme.py … README.md` (which also writes
   `PATCHES.md`).
3. `@MorpheApp/changelog` rewrites `patches-bundle.json` with the release notes and the
   `download_url` for the `.mpp`.
4. `@semantic-release/git` commits `CHANGELOG.md`, `gradle.properties`, `patches-bundle.json`,
   `patches-list.json`, `README.md`, `PATCHES.md` to `main` as
   `chore: Release v<version> [skip ci]`.
5. `@semantic-release/github` publishes the release with the `.mpp` asset; the workflow then
   attests build provenance.
6. `@cleyrop-org/semantic-release-backmerge` backmerges `main` → `dev`.

If semantic-release publishes nothing (chore/docs commit, non-main/dev branch), the workflow
still verifies compilation with `./gradlew clean :patches:buildAndroid --no-daemon` — `clean`
first, so it cannot delete the `.mpp` that the next step uploads.

### Candidate bundles from `validate/*` branches

On a non-release run from a branch whose name starts with `validate/`, the workflow uploads
`patches/build/libs/patches-*.mpp` as the `candidate-patches` artifact. To test a patch
without publishing a release:

1. push the candidate to a `validate/…` branch;
2. wait for the compile job, then download `candidate-patches`;
3. patch the stock `.apkm` locally with that `.mpp` (CLI recipe above) and install it locally.

A candidate artifact is **not** a release: `patches-bundle.json` does not point at it, and no
user gets it from Morphe Manager. CI builds and verifies compilation; do not upload stock
APK/APKM files or patched APKs as artifacts, release assets, or cache inputs. Both the v1.0.3
candidate and the published bundle applied to the exact APKM locally. Live notifications,
already-in-wallet coupons, preview coupons and the Coupons tab still need a signed-in device check.

**Never hand-edit the generated files** — the pipeline overwrites them and manual edits break
third-party consumers: `patches-bundle.json`, `patches-list.json`, `PATCHES.md`,
`CHANGELOG.md`, the README section between `<!-- PATCHES_START -->` / `<!-- PATCHES_END -->`,
and the `version` in `gradle.properties`.

## Commit types

| Commit | Release |
|---|---|
| `feat:` | minor |
| `fix:`, `perf:`, `bump:` | patch |
| `build:` with scope `Needs bump` | patch |
| `breaking` | major |
| `chore:`, `docs:` | none |

`dev` is a prerelease branch; `.github/workflows/open_pull_request.yml` opens the `dev` → `main`
PR automatically.

## The dev backmerge quirk

The repository started from the upstream template, whose `dev` branch had unrelated root
history (`Initialize dev`). The backmerge plugin does a plain `git push HEAD:dev`, which can
never fast-forward across unrelated histories, so every release run turned **red after the
release had already been published**. Fix once:

```sh
git push origin origin/main:dev --force
```

After that, `main` → `dev` backmerges fast-forward normally.

## `patches-bundle.json` is the Manager's entry point

Morphe Manager reads `patches-bundle.json` at the repo root and follows its `download_url` to
the newest release's `.mpp`. While the file is empty or a placeholder, the source shows
"Unnamed" with no apps; it populates with the first release.

`Constants.kt` must keep `apkFileType` in sync with the file APKMirror actually serves
(`ApkFileType.APKM` for Rossmann), otherwise Manager links users to the wrong download.

## Naming and licensing

GPLv3 section 7 of the upstream Morphe patches (`NOTICE`, "Project Name Restriction") forbids
using "Morphe" — or confusingly similar branding — as the name of a derivative work. This
project is **Morphed**, described as "patches for use with Morphe", which is allowed:
descriptive compatibility references only, never as the product name.

## Version pins

```kotlin
val COMPATIBILITY_ROSSMANN = Compatibility(
    name = "Rossmann",
    packageName = "de.rossmann.app.android",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0xD0082C, // Rossmann red
    targets = listOf(AppTarget(version = "5.11.1")),
)
```

Bump `AppTarget(version = …)` only after re-verifying every fingerprint and every renamed
member (`ActivateCoupon.c`, `CouponDisplayModelFactory.b`, `q`, `l`, `R`, `NotPreview.a`,
Hilt's `C0` / `n`, and the stock Kotlin `EmptyCoroutineContext.a` / `Unit.a`) in smali,
renaming `extensions/extension/libs/rossmann-stub-<version>.jar` to match, and updating the
`compileOnly` line in `extensions/extension/build.gradle.kts`. The generated Hilt names and
the stdlib fields are the easiest to miss: they are not app domain API, but the injected
smali and the extension reference them directly. See
[extension-and-stubs.md](extension-and-stubs.md).
