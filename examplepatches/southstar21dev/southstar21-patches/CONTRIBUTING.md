# Contributing

Thanks for helping out. Bug reports, ideas and code are all welcome. Following these few rules keeps issues quick to act on.

## Before you open an issue

- **Search first.** Check [open and closed issues](https://github.com/southstar21dev/southstar21-patches/issues?q=is%3Aissue). Duplicates get closed.
- **One thing per issue.** One bug, or one idea. Lists of ideas get closed; open one issue for each.
- **Use a supported version.** Only the app versions listed under [Patches](README.md#patches) in the README are supported. Update before reporting.
- **Only Instagram, YouTube Music and Spotify.** Requests for other apps are closed.

## Reporting a bug

Use the [bug report form](https://github.com/southstar21dev/southstar21-patches/issues/new?template=bug_report.yml). A good report has:

1. The app, its version, and the patches version from Morphe Manager.
2. Your phone and Android version. The glass looks different below Android 13.
3. What happened, what you expected, and the steps to make it happen again.
4. A screen recording for anything visual. Most glass bugs can't be fixed from a description alone.

<details>
<summary>Getting logs for a crash</summary>

With USB or wireless debugging on, run this right after the crash and attach `log.txt` to the issue:

```sh
adb logcat -d > log.txt
```

</details>

## Requesting a feature

Use the [feature request form](https://github.com/southstar21dev/southstar21-patches/issues/new?template=feature_request.yml): one idea, for one of the supported apps, with what it should do and why.

## Contributing code

```sh
GITHUB_ACTOR=<you> GITHUB_TOKEN=<token> ./gradlew :patches:buildAndroid
```

The Morphe Gradle plugin needs a GitHub token with `read:packages`, see the [Morphe setup docs](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md#-prepare-the-environment). The patch bundle lands in `patches/build/libs/patches-<version>.mpp`.

- Branch off `dev` and open your pull request against `dev`, never `main`.
- Use [conventional commits](https://www.conventionalcommits.org): `feat:`, `fix:` or `chore:`. A `feat:` or `fix:` pushed to `dev` publishes a pre-release; on `main`, a release.
- Run [ktlint](https://github.com/pinterest/ktlint) with the repo's baseline before pushing: `ktlint --baseline=.github/ktlint-baseline.xml`.
- Don't edit generated files: `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md` or the patch list in the README. Releases update them.

<details>
<summary>Repository layout</summary>

```
patches/src/main/kotlin/app/southstar21/patches/
  <app>/
    shared/              Compatibility (app versions) and fingerprints shared by the app's patches
    misc/extension/      sharedExtensionPatch: bundles extensions/<app>.mpe into the app
    layout/<patch>/      UI patches (one folder per patch: the patch and its Fingerprints.kt)
    misc/<patch>/        Everything else
extensions/<app>/        Java code injected into the app, one Gradle module per app
  src/main/java/app/southstar21/extension/<app>/<patch>/
```

</details>

<details>
<summary>Adding a patch</summary>

1. **New app?** Create `extensions/<app>/` (copy `extensions/instagram/build.gradle.kts` and change the name and namespace), plus `patches/.../<app>/shared/Constants.kt` with its `Compatibility` and `misc/extension/SharedExtensionPatch.kt`.
2. Add the patch under `patches/.../<app>/layout/<patch>/` or `misc/<patch>/`, with `compatibleWith(...)` and, if it runs extension code, `dependsOn(sharedExtensionPatch)`.
3. Put its extension code in `extensions/<app>/src/main/java/app/southstar21/extension/<app>/<patch>/`.
4. Commit with a conventional commit message.

</details>

<details>
<summary>Showing an Instagram patch in the settings menu</summary>

1. In its extension class, add `public static boolean isIncluded() { return false; }` and a `public static final PatchSettings SETTINGS = new PatchSettings("<key>", "<Title>", "<description>", <Class>::isIncluded, ...settings)`, using `BooleanSetting` / `IntSetting` from `app.southstar21.extension.instagram.settings`. Pass `SettingsGroup`s instead of plain settings to split the page into titled sections, and chain `.icon(Icons.Glyph.X, color)` to give it an icon. Read values with `.get()`; mark settings `requiresRestart` if they're only read at startup.
2. Add `<Class>.SETTINGS` to the list in `settings/Settings.java`.
3. If the patch needs the main activity, start it from `InstagramHooks.onMainActivityWindowFocusChanged` behind `if (<Class>.SETTINGS.isActive())`.
4. In the Kotlin patch, call `markPatchIncluded("L<extension class>;")` in `execute`. Patch options can feed setting defaults by having the patch overwrite a static method the setting's default calls (see `LiquidGlassNavBarPatch`).

</details>
