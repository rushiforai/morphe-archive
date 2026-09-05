# AGENTS.md

Morphe patches project for **Anime Witcher** (`com.anime.witcher`, target version **1.4.8**).
Generates a patch bundle (`.mpp`) that the Morphe patcher applies to the stock APK.

## Layout

- `patches/src/main/kotlin/com/anime/witcher/patches/` — patch definitions (Kotlin).
  - `xxxPatch.kt` — one `val xxxPatch = bytecodePatch(...)` / `resourcePatch(...)` per feature.
  - `Fingerprints.kt` — `Fingerprint` objects used to locate methods (`definingClass`, `name`,
    `returnType`, `parameters`, `string(...)`/`methodCall(...)` filters).
  - `Constants.kt` — `COMPATIBILITY_ANIME_WITCHER` (package, target version).
- `extensions/extension/src/main/java/` — runtime Java classes compiled into the
  `extensions/extension.mpe` DEX and merged by the patcher. Wire into a patch with
  `extendWith("extensions/extension.mpe")`.
  - `com/anime/witcher/TvFocusHelper.java`, `com/anime/witcher/TvWindowCallback.java` —
    TV D-pad runtime support used by `tvDpadNavigationPatch`.

## Build commands (PowerShell / Windows)

`gradlew.bat` must be invoked from the repo root. Environment first:

```powershell
$env:JAVA_HOME = "C:\Program Files\Android\Android Studio\jbr"
$env:ANDROID_HOME = "$env:LOCALAPPDATA\Android\Sdk"
$env:ANDROID_SDK_ROOT = "$env:LOCALAPPDATA\Android\Sdk"
$env:GITHUB_TOKEN = "<PAT with read:packages>"
$env:GITHUB_ACTOR = "<github username>"
```

- `.\gradlew.bat :patches:compileKotlin` — fast check that the patch Kotlin compiles.
- `.\gradlew.bat :extensions:extension:compileDebugJavaWithJavac` — fast check of extension Java.
- `.\gradlew.bat buildAndroid` — full build; output is `patches/build/libs/patches-1.0.0.mpp`.
- `.\gradlew.bat generatePatchesList` — regenerates `patches-list.json` from the built jar
  (also loads every patch, catching wiring errors).

## Credentials

The `app.morphe.patches` plugin and `morphe-patcher` artifacts come from
`https://maven.pkg.github.com/MorpheApp/registry` and require a GitHub PAT with
`read:packages`. Provide it via `GITHUB_TOKEN`/`GITHUB_ACTOR` env vars or
`gpr.key`/`gpr.user` in `~/.gradle/gradle.properties`. Never commit tokens.

## Conventions

- Every patch: `@Suppress("unused")` (loaded reflectively), `compatibleWith(COMPATIBILITY_ANIME_WITCHER)`,
  `default = true`, and a KDoc comment describing what/why.
- Method hooks: resolve via `XFingerprint.method` inside `execute { }`, then inject smali
  strings with `addInstructions(index, smali)` or `addInstructionsWithLabels` (internal
  labels like `:original` followed by `nop` are supported inside the fragment).
- Registers: `addInstructions` validates against the method's register count; keep to
  registers the method already declares (e.g. `.locals 5` → v0..v4 free).
- In Kotlin smali strings, escape `$` in type descriptors as `${'$'}` (Kotlin template).
- Extension classes must be framework-only: the extension module has no dependency
  repositories, so no appcompat/androidx imports. Newer android.jar stubs (API 36/37)
  dropped some once-public methods (e.g. `AbsListView.setItemsCanFocus`) — call those
  via reflection with try/catch instead.
- Keep the D-pad fix semantics: only consume a key when `requestFocus()` succeeded and the
  target `hasFocus()`; content threshold is `y >= 0x9c` (top bar height).

## Secrets

Token is used session-scoped only (env vars); nothing is written to repo files.