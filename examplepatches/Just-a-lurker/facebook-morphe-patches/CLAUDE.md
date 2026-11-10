# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is
Morphe patches for Facebook (`com.facebook.katana`), built on the Morphe patches template. The output is a `.mpp` patch bundle, applied with Morphe Manager or Morphe Desktop. The goal is narrow: remove ads, bring dark mode to tablets that Facebook leaves without it, and keep Facebook stable, including installing beside Meta's stock apps.

## Commands
- Build the bundle: `./gradlew buildAndroid` (`gradlew.bat buildAndroid` on Windows). Output: `patches/build/libs/patches-*.mpp`.
- Compile check (same as CI): `./gradlew :patches:buildAndroid clean --no-daemon`.
- Regenerate `patches-list.json`: `./gradlew generatePatchesList`. The release workflow runs this; never commit the result by hand.
- There are no unit tests or lint tasks. Validate by applying the `.mpp` to the full APKM with the Morphe Desktop CLI (`--validate` checks that each fingerprint matches exactly one method).
- Credentials: `settings.gradle.kts` reads `gpr.user` / `gpr.key` Gradle properties, falling back to `GITHUB_ACTOR` / `GITHUB_TOKEN`. Put them in the **Gradle user home** (`C:\Users\hoang\.gradle\gradle.properties` on this machine), not the project `gradle.properties`. The project file is tracked and holds only `version`. Use a classic PAT with `read:packages`; the `gh` CLI OAuth token does not work for the Morphe registry.

## Architecture
Two Gradle modules, wired by the `app.morphe.patches` settings plugin (`settings.gradle.kts`):

- `patches/`: Kotlin patch definitions (package `app.fbpatches.patches`).
  - `facebook/ads/<surface>/`: one user-visible `bytecodePatch(name=…, default=true)` per ad surface (`feed`, `profile`, `stories`, `reels`, `search`, `marketplace`, `games`, `affiliate`, `prefetch`, `telemetry`, `audiencenetwork`), each with its own fingerprints/anchors. Find targets by stable strings, kept class names (`GraphQLFeedUnitEdge`, `GraphQLStory`, ...), GraphQL field keys (`treeFieldKey`) or method shape, never by obfuscated names. Most patches fail with a `PatchException` when an anchor is missing; a few optional hooks only `patchLog.warning`.
  - `facebook/coexist/`: `SharedPermissions.kt` renames the two signature permissions Facebook shares with Messenger (`com.facebook.permission.prod.FB_APP_COMMUNICATION`, `com.facebook.receiver.permission.ACCESS`) to `app.justalurker.*` in `AndroidManifest.xml`, and routes the three code literals through the extension so Facebook's own guarded broadcasts still work. `InstallBesideMetaAppsPatch.kt` is the default-on patch (`resourcePatch` + `bytecodePatch`) that runs it.
  - `facebook/theme/`: `ForceDarkModePatch.kt` hooks every boolean return of Facebook's dark mode controller (`fb.e2e.enable_dark_mode`, reads `ThemePreferences$State`) through `DarkMode.answer(Z)Z`. On a tablet (smallest width ≥ 600dp) a light answer is turned dark; on phones Facebook's own answer is kept. Ported from Hushfacebook's `Force dark mode`; Hush's runtime switch is replaced by the tablet check so the patch needs no settings. It is the one **opt-in** patch (`default = false`), because selecting it overrides a tablet's light choice.
  - `facebook/shared/`: `Support.kt` (register helpers, `handleTargets`, `neuterOrReason`, `freeLocalsAt`), `StoryModels.kt` (GraphQL model accessors, the `fbpatchesIsSponsored` helper added to `GraphQLStory`), `ExtensionPatch.kt` (`extensionPatch`, which does `extendWith("extensions/extension.mpe")`; patches that call the extension `dependsOn` it).
  - `util/RegisterLiveness.kt`: control flow and register liveness, used to pick free registers mid-method.
  - `shared/Constants.kt`: `COMPATIBILITY_FACEBOOK` — package name, APK file type, target version. Target `585.0.0.47.54` is non-experimental as of v1.0.2.
  - `util/PatchListGenerator.kt`: template code that writes `patches-list.json` from the built `.mpp`.
- `extensions/extension/`: Java code (package `app.fbpatches.extension`) compiled into `extensions/extension.mpe` and merged into the patched app. Runtime logic is in `facebook/ads/*.java` and `facebook/coexist/SharedPermissions.java`. Injected smali calls its static methods, and the descriptor must match exactly, e.g. `Lapp/fbpatches/extension/facebook/ads/FeedAds;->shouldHide(Ljava/lang/Object;)Z` or `Lapp/fbpatches/extension/facebook/coexist/SharedPermissions;->name(Ljava/lang/String;)Ljava/lang/String;`. Every ad hook fails open: on any error, Facebook's own behavior.

Most ad patches are inspired by Hushfacebook's work (GPL-3.0, same Facebook version). Keep the "Forked from" headers and the NOTICE credits.

Typical flow: find an anchor, hook its method from a patch, then put the runtime logic in a static method in the extension.

## Current state (2026-11-08)
- 13 patches targeting Facebook **585.0.0.47.54**, APKM (Android 11+): 12 default-on ad/coexist patches plus the opt-in **Dark mode on tablets** patch.
- All 13 apply to the genuine arm64 480dpi APKM. The patched build was verified: `result.json` success, 13/13 applied, manifest 52 permission mentions renamed to `app.justalurker.*` with 0 stock mentions left, 6 dex loads routed through `SharedPermissions.name`, and 3 dark mode controller returns routed through `DarkMode.answer`.
- The user installed the patched build beside **stock Messenger** and confirmed it works. `Install beside Meta's apps` is what makes stock Messenger keep ownership of the shared permissions while the re-signed Facebook declares its own.
- Releases: **v1.0.2 is Latest and signed**; v1.0.1 is signed; v1.0.0 is unsigned. `morphe-signing.pub` is committed and `MORPHE_SIGNING_KEY` is set as a repo secret. Keep `morphe-signing.key` backed up and out of git.
- GitHub Actions is enabled and push-triggered releases work. A push to `dev` creates a prerelease; merging `dev` to `main` creates the stable release. "Allow GitHub Actions to create and approve pull requests" is enabled.
- Not done yet: submitting the repo to `morphe-patches.software` (see `handoff.md`).

## Validating without a device
- Use the full **Android 11+ `.apkm`** from `apks/`, not a single `base.apk`: the ad patches need the merged split dexes and fail on the 1dpi extraction.
- Download the CLI with `gh release download v2.1.1 -R MorpheApp/morphe-desktop`, then:
  `java -jar morphe-desktop-2.1.1-all.jar patch -p patches/build/libs/patches-<version>.mpp --unsigned --continue-on-error -r result.json -o patched.apk <apkm>`
- `result.json` lists applied/failed patches. Applying the bundle does not prove the hooks are right, so also check that each extension call site in the patched dex resolves and run d8 over the new dex. `--verify-with-sdk` crashes d8 on Facebook's own `classes2.dex`, a known false positive.
- Sign for installing with `zipalign -p -f 4` then `apksigner`; the CLI's built-in signer fails.

## Reverse-engineering workspace (untracked)
`apks/` holds the target APKs. `apks/com.facebook.katana_585.0.0.47.54-480dpi_arm64_v8a.apkm` is the Android 11+ one the patches apply to; `apks/new/` holds the same bundle extracted (base + splits + `info.json`). The repo root also has local copies of jadx (`jadx-1.5.6/`, `jadx-gui-1.5.6-with-jre-win/`) and apktool (`apktool.bat` / `apktool.jar`). `apks/`, `*.apk`, `*.apkm`, `handoff.md`, `extra.md` and `README__Hush.md` are git-ignored; don't commit them.

## Git / release rules
- Do all work on `dev`. Merge `dev` into `main` for a stable release with a plain merge (no squash).
- Commit messages are semantic and drive semantic-release (`.releaserc`): `feat:` makes a minor release, `fix:` / `perf:` / `bump:` make a patch release, `chore:` and `docs:` make none. Releases from `dev` are prereleases.
- Never hand-edit or commit generated files: `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md`, the README patches section between `PATCHES_START` / `PATCHES_END`, or the version in `gradle.properties`. `release.yml` updates them.
- Don't create releases by hand, don't force-push release commits, and don't write new release scripts. If release behavior has to change, edit the existing `release.yml` / `.releaserc`.
- Never commit `morphe-signing.key`. Back it up before deleting it.
