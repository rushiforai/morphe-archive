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
  - `facebook/theme/`: `ForceDarkModePatch.kt` hooks every boolean return of Facebook's dark mode controller (`fb.e2e.enable_dark_mode`, reads `ThemePreferences$State`) through `DarkMode.answer(I)Z`, using `filterBooleanReturns` from `ads/affiliate/AffiliateSupport.kt`, which keeps each return's branch labels on the hook. On a tablet (smallest width ≥ 600dp) a light answer is turned dark; on phones Facebook's own answer is kept. Its one patch-time option, `followSystemTheme` ("Follow the system theme", off by default), fills the extension's `DarkMode.followsSystem()` stub so a tablet is dark only while the system's night mode is on (read from `Resources.getSystem()`, not Facebook's own configuration). There is no runtime setting. It is the one **opt-in** patch (`default = false`), because selecting it overrides a tablet's light choice.
  - `facebook/shared/`: `Support.kt` (register helpers, `handleTargets`, `neuterOrReason`, `freeLocalsAt`), `StoryModels.kt` (GraphQL model accessors, the `fbpatchesIsSponsored` helper added to `GraphQLStory`), `ExtensionPatch.kt` (`extensionPatch`, which does `extendWith("extensions/extension.mpe")`; patches that call the extension `dependsOn` it).
  - `util/RegisterLiveness.kt`: control flow and register liveness, used to pick free registers mid-method.
  - `shared/Constants.kt`: `COMPATIBILITY_FACEBOOK` — package name, APK file type, target version. Target `585.0.0.47.54` is non-experimental as of v1.0.2.
  - `util/PatchListGenerator.kt`: template code that writes `patches-list.json` from the built `.mpp`.
- `extensions/extension/`: Java code (package `app.fbpatches.extension`) compiled into `extensions/extension.mpe` and merged into the patched app. Runtime logic is in `facebook/ads/*.java` and `facebook/coexist/SharedPermissions.java`. Injected smali calls its static methods, and the descriptor must match exactly, e.g. `Lapp/fbpatches/extension/facebook/ads/FeedAds;->shouldHide(Ljava/lang/Object;)Z` or `Lapp/fbpatches/extension/facebook/coexist/SharedPermissions;->name(Ljava/lang/String;)Ljava/lang/String;`. Every ad hook fails open: on any error, Facebook's own behavior.

Typical flow: find an anchor, hook its method from a patch, then put the runtime logic in a static method in the extension.

## Independence from Hushfacebook
This project has branched off from Hushfacebook completely. The only remaining tie is the acknowledgment that its work inspired the patches: the per-file source headers ("Forked from" / "Adapted from"), the NOTICE credits and the README's one-line credit. GPL-3.0 requires those, so keep them as they are and don't add new ones.

Don't consult, compare against, port from or track Hushfacebook: not its repository, commits, issues, releases or patches, and not as a source of bugs, anchors or ideas. Find bugs and anchors in the Facebook APK itself (`apks/`, jadx, smali dumps of the patched build).

## Current state (2026-11-21)
- 13 patches targeting Facebook **585.0.0.47.54**, APKM (Android 11+): 12 default-on ad/coexist patches plus the opt-in **Dark mode on tablets** patch.
- Releases: **v1.2.1 is Latest and signed**. It guards the feed's two client-side replace runnables, replace-and-displace (`LX/0XKi;`, by its kept `$newEdge` field) and replace-and-truncate (`LX/0XKl;`), which put a new edge in without the funnel or the edge swap guard. It also empties the search top-position ad state (`LX/0D1S;`, the `(ImmutableList, Z)` state the render holding `STREAM_TOP_POSITION_AD_MODULE_FIRST_AD` checks), which `SearchTopPositionAdsQuery` fills apart from the page's modules. v1.2.0 adds the dark mode patch's `followSystemTheme` option and moves its hook to `filterBooleanReturns` with `DarkMode.answer(I)Z`. v1.1.1 filters the Reels tab loader's static page appends (`LX/05dK;->A03`/`A0A`) and its edge swap's static placer (`A05`), which bypassed every Reels item filter on 585. Every release from v1.0.1 on is signed. `morphe-signing.pub` is committed and `MORPHE_SIGNING_KEY` is set as a repo secret. Keep `morphe-signing.key` out of git.
- Verified without a device on the genuine arm64 480dpi APKM (2026-11-21): 13/13 apply with `--validate` and no warnings, with the dark mode option off and on. Every extension call site was listed from the patched dex and matches the expected hooks, and d8 accepts the patched dex files. Blocked requests were checked for retry or refill loops (ad-break fetches, pool vends, Marketplace's held queries) and none was found.
- Known gaps: ads are still downloaded where only their display is blocked (feed ads channel and async ads, Stories ads pagination, Reels pools and chaining, search top-position); search AI mode (`SearchAIModeAdsQuery`, server-gated) inserts ads of its own and isn't covered. Earlier checks: manifest 52 permission mentions renamed to `app.justalurker.*` with 0 stock mentions left, and 6 dex loads routed through `SharedPermissions.name`.
- The user installed a patched build beside **stock Messenger** and confirmed it works. `Install beside Meta's apps` is what makes stock Messenger keep ownership of the shared permissions while the re-signed Facebook declares its own.
- GitHub Actions is enabled and push-triggered releases work. A push to `dev` creates a prerelease and opens a `dev` → `main` PR. Merging that PR (plain merge) creates the stable release, which back-merges `main` into `dev`. Wait for each workflow before the next push or merge. "Allow GitHub Actions to create and approve pull requests" is enabled.

## Validating without a device
- Use the full **Android 11+ `.apkm`** from `apks/`, not a single `base.apk`: the ad patches need the merged split dexes and fail on the 1dpi extraction.
- Download the CLI with `gh release download v2.1.1 -R MorpheApp/morphe-desktop`, then:
  `java -jar morphe-desktop-2.1.1-all.jar patch -p patches/build/libs/patches-<version>.mpp --validate --unsigned --continue-on-error -r result.json -o patched.apk <apkm>`
  Add `-e "Dark mode on tablets"` to include the opt-in patch, and `-O followSystemTheme=true` after it to set its option.
- `result.json` lists applied/failed patches. Applying the bundle does not prove the hooks are right, so also check that each extension call site in the patched dex resolves and run d8 over the new dex. `--verify-with-sdk` crashes d8 on Facebook's own `classes2.dex`, a known false positive.
- Sign for installing with `zipalign -p -f 4` then `apksigner`; the CLI's built-in signer fails.

## Reverse-engineering workspace (untracked)
`apks/` holds the target APKs. `apks/com.facebook.katana_585.0.0.47.54-480dpi_arm64_v8a.apkm` is the Android 11+ one the patches apply to; `apks/new/` holds the same bundle extracted (base + splits + `info.json`). The repo root also has local copies of jadx (`jadx-1.5.6/`, `jadx-gui-1.5.6-with-jre-win/`) and apktool (`apktool.bat` / `apktool.jar`). `apks/`, `*.apk`, `*.apkm`, `handoff.md` and `extra.md` are git-ignored; don't commit them.

## Git / release rules
- Do all work on `dev`. Merge `dev` into `main` for a stable release with a plain merge (no squash).
- Commit messages are semantic and drive semantic-release (`.releaserc`): `feat:` makes a minor release, `fix:` / `perf:` / `bump:` make a patch release, `chore:` and `docs:` make none. Releases from `dev` are prereleases.
- Never hand-edit or commit generated files: `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md`, the README patches section between `PATCHES_START` / `PATCHES_END`, or the version in `gradle.properties`. `release.yml` updates them.
- Don't create releases by hand, don't force-push release commits, and don't write new release scripts. If release behavior has to change, edit the existing `release.yml` / `.releaserc`.
- Never commit `morphe-signing.key`. Back it up before deleting it.
