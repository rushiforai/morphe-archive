# AGENTS.md

Agent guide for **Morphed** — a [Morphe](https://morphe.software) patch source for German
apps (currently only Rossmann, `de.rossmann.app.android`). Patches only: no app code, no
rebuilt APKs, no proprietary files.

## Layout

| Path | What it is |
|---|---|
| `patches/src/main/kotlin/app/gogamid/morphed/patches/<app>/` | Patch + `Fingerprint` sources, one package per app (`rossmann/`) |
| `patches/src/main/kotlin/app/gogamid/morphed/patches/shared/Constants.kt` | `Compatibility` / `AppTarget` version pins, package name, `ApkFileType` |
| `patches/src/main/kotlin/util/PatchListGenerator.kt` | `generatePatchesList` task: loads the built `.mpp` and writes `patches-list.json` |
| `extensions/extension/src/main/java/...` | Extension runtime (Java) compiled into `extensions/extension.mpe` (a DEX) |
| `extensions/extension/stubs/` | Compile-only stubs of app classes; compiled to `libs/rossmann-stub-<version>.jar` |
| `patches/build.gradle.kts` | `patches { about { … } }`, animalsniffer/`checkAndroidApi` |
| `.releaserc`, `.github/workflows/release.yml` | semantic-release pipeline (build, regenerate lists, publish) |
| `patches-bundle.json`, `patches-list.json`, `PATCHES.md`, `CHANGELOG.md`, `README` patch table | **Generated. Never hand-edit.** |

## Commands

```sh
./gradlew buildAndroid             # build patches/build/libs/patches-<version>.mpp (+ checkAndroidApi)
./gradlew generatePatchesList      # rewrite patches-list.json from the built .mpp
./gradlew :patches:buildAndroid clean --no-daemon   # what CI runs when no release is published
```

Validate a patch bundle the way Morphe Manager will, before asking anyone to test:

```sh
gh release download v2.3.0 --repo MorpheApp/morphe-cli --pattern "*.jar"
java -Xmx1600m -jar morphe-desktop-2.3.0-all.jar patch \
    -p patches/build/libs/patches-<version>.mpp --unsigned -o out.apk app.apkm
```

Local full Gradle builds do not work on Termux/aarch64 (no complete Android SDK); CI on
`ubuntu-latest` is the build authority. See `docs/learnings/build-and-release.md`.

## Release rules

Commits on `main` drive semantic-release; use [conventional commits](https://www.conventionalcommits.org/).

| Commit | Release |
|---|---|
| `feat:` | minor |
| `fix:`, `perf:`, `bump:` | patch |
| `build:` with scope `Needs bump` | patch |
| `breaking` (`!` / `BREAKING CHANGE:`) | major |
| `chore:`, `docs:`, anything else | none |

- Never edit generated files: `patches-bundle.json`, `patches-list.json`, `PATCHES.md`,
  `CHANGELOG.md`, the `README.md` section between `<!-- PATCHES_START -->` and
  `<!-- PATCHES_END -->`, or the `version` in `gradle.properties`. The pipeline rewrites them.
- Do not add a `repositories { }` block to a module `build.gradle.kts`; it breaks the
  `app.morphe.patches` plugin's repository injection (aapt2 resolution fails).
- Bump `AppTarget(version = …)` in `shared/Constants.kt` only after re-verifying every
  fingerprint against a new build, and rename the stub jar alongside it.

## Learnings

Hard-won, example-driven notes. Read the relevant one before touching that area.

The published v1.0.3 bundle applies to Rossmann 5.11.1 in the local Morphe CLI. Live
activation and notifications on a signed-in device are **not yet verified**. Only `.mpp`
bundles go to GitHub; keep input APK/APKM files and patched APKs local.

| Topic | Doc |
|---|---|
| Fingerprint matching rules, constructors, string filters, injection anchors, R8/Hilt/stdlib member renames | [docs/learnings/fingerprints.md](docs/learnings/fingerprints.md) |
| On-device APK/APKM recon: jadx, apktool, strings, javap; verifying obfuscated stdlib/Hilt names and stub constant folding | [docs/learnings/apk-analysis-workflow.md](docs/learnings/apk-analysis-workflow.md) |
| `.mpe` extension + compile-only stub jars, stock Kotlin singleton fields, suspend sync vs suspend completion, success-only notifications | [docs/learnings/extension-and-stubs.md](docs/learnings/extension-and-stubs.md) |
| Build failures, CLI validation, release pipeline, `validate/*` candidate artifacts, naming/licensing | [docs/learnings/build-and-release.md](docs/learnings/build-and-release.md) |
