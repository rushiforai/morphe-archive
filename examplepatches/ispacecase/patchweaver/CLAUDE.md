# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Patchweaver is a personal **collection** of [Morphe](https://morphe.software) patches — not a repo for one single patch. It's laid out per the official [morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template). F-Droid's install-backend patch is the first entry; more app patches are expected to be added here over time as separate patches within the same `patches/` module, not new repos. Keep that in mind when naming things, writing docs, or deciding where new patch code belongs — everything here should read as "one of several," not as if F-Droid is the whole point of the project.

## Build commands

Requires a `GITHUB_TOKEN`/`GITHUB_ACTOR` with the `read:packages` scope authorized (`gh auth refresh -s read:packages`, then `export GITHUB_TOKEN="$(gh auth token)"; export GITHUB_ACTOR="$(gh api user --jq .login)"`) — `app.morphe.patches` (the Gradle plugin) and `app.morphe:morphe-patcher` resolve from GitHub Packages, which requires an authenticated request even for public packages. `.envrc`/`flake.nix` export these automatically for `direnv`/`nix develop` users.

```bash
./gradlew buildAndroid              # builds the patches bundle -> patches/build/libs/patches-*.mpp
./gradlew :patches:generatePatchesList   # regenerates patches-list.json locally (CI does this on release — don't hand-edit the committed placeholder)
./gradlew :apply-tool:installDist   # builds the standalone apply/sign tool (see below)
```

Apply a built `.mpp` to a target APK without Morphe Manager/Desktop:
```bash
./apply-tool/build/install/apply-tool/bin/apply-tool \
  <input.apk> patches/build/libs/patches-*.mpp <output.apk> \
  <keystore> <ks-pass> <key-alias> <key-pass>
```
Installing the result over an existing install of the target app requires uninstalling any copy signed with a different key first (normal Android behavior) — check `adb shell pm list packages -a <pkg>` across all users (`adb shell pm list users`) since a leftover copy in a Work Profile/Private Space blocks the install too even after "uninstalling" from the main profile.

No Morphe CLI is checked out in this workspace — `apply-tool` exists because Morphe Patcher's `Patcher.get()` only returns raw pieces (dex files, resources.apk, otherResources); assembling and signing a final APK from those isn't provided by the library itself.

## Architecture

**Never hand-edit `patches-list.json`, `patches-bundle.json`, or `CHANGELOG.md`** — `release.yml` (semantic-release, triggered by conventional commits: `feat:`/`fix:` cut a release, `chore:` doesn't) regenerates all three, including the "Patches list" section of `README.md` between the `PATCHES_START`/`PATCHES_END` markers. Work on `dev`, merge to `main` (no squash) for a stable release.

Each patch follows the same three-part shape (see `patches/src/main/kotlin/app/fdroidbackends/InstallBackendsPatch.kt` for the concrete example):

1. **`patches/src/main/kotlin/<package>/`** — the actual `bytecodePatch`/`resourcePatch` definitions (fingerprints, manifest/resource XML edits via `document(...)`, `extendWith("extensions/<module>.mpe")` to pull in compiled extension classes). `patches/build.gradle.kts` needs `compileOnly(libs.gson)` in addition to the `patchListGeneratorClasspath` config, or `util/PatchListGenerator.kt` fails to compile ("Unresolved reference 'google'/'GsonBuilder'") — it needs gson on the *main* compile classpath, not just the generator task's runtime classpath.
2. **`stub/`** — compile-time-only Java classes replicating the target app's field/method signatures (never bundled into any output). Needed whenever an extension class must subclass a target-app class whose constructor/abstract methods are package-private/protected (e.g. F-Droid's `Installer` base class) — the subclass has to live in the *exact same Java package* as the real class to link at all, and stub classes let that compile without a real copy of the target app's code. A stub module needs its own `compileOnly("com.google.android:android:4.1.1.4")` since a plain `java-library` project has no Android classpath by default.
3. **`extensions/<name>/`** — the real runtime classes, compiled to a `.mpe` DEX and merged into the patched app at patch time. `ExtensionPlugin` auto-applies `com.android.application` with `compileSdk=36`/`minSdk=23`/Java 17 — override `defaultConfig.minSdk` per-module if a dependency needs higher (e.g. `dev.rikka.shizuku:api` needs 24). **The `extendWith(...)` string in the patch must match the actual bundled path** (`extensions/<module-dir-name>.mpe`, always including the `extensions/` prefix) — verify with `unzip -l patches/build/libs/*.mpp | grep mpe` after building; a wrong path is a silent Gradle-build-time success but a `PatchException: Extension "..." not found` at patch-apply time.

Any extra Gradle module beyond what the template ships (a `stub`, `apply-tool`, etc.) needs its own explicit `repositories {}` block repeating `mavenLocal()`/GitHubPackages-with-credentials/`jitpack.io` — a subproject's own `repositories {}` does **not** inherit the root `dependencyResolutionManagement.repositories` (Gradle's default `PREFER_PROJECT` mode).

AGP requires an explicit `local.properties` with `sdk.dir=...` (or `ANDROID_HOME`) for `:extensions:*` tasks even though the Morphe Gradle plugin's own D8/desugar SDK lookup has a `~/Android/Sdk` fallback that doesn't need it.

Ground-truth verification for fingerprints/resource paths/hook points should come from decompiling the actual target APK with `apktool` (`apktool d <apk>`) — don't trust prior notes about obfuscation, instruction offsets, or resource paths without re-checking against the real APK first.
