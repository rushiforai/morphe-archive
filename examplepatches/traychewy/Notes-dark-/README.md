# Samsung Notes patches for Morphe

One patch: **Force dark mode** — Samsung Notes always opens in dark mode, whatever your system theme is.

## Add to Morphe
In Morphe Manager: **Sources → + → Remote**, then paste `https://github.com/traychewy/notes-dark-`.
Or download the `.mpp` from [Releases](https://github.com/traychewy/notes-dark-/releases) and add it under **Local**.

## Patches list

<!-- PATCHES_START -->
> **[v1.1.2](https://github.com/traychewy/Notes-dark-/releases/tag/v1.1.2)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**2 patches** across **1 app**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**Samsung Notes**](PATCHES.md#samsung-notes-comsamsungandroidappnotes) | 1 | — | [`com.samsung.android.app.notes`](https://play.google.com/store/apps/details?id=com.samsung.android.app.notes) |
| 2 | [**Universal**](PATCHES.md#universal) | 1 | — | — |
<!-- PATCHES_END -->


## Force dark mode (any app)
A universal version of the same idea. It's off by default, so tick it in Morphe for each app you patch.
- Uses the app's own dark theme via per-app night mode (Android 12+). The system theme isn't changed.
- Option **Auto-darken apps without a dark theme** (on by default): lets Android invert light-only screens. Turn it off if an app's colours look wrong.
- Won't work for apps that are packed/protected, that check their own signature, or that you can't uninstall (built-in system apps). Google apps also need microG for sign-in.

## How it works (Samsung Notes)
- Reads the Application class from `AndroidManifest.xml` and injects a call at the start of its `onCreate()` (or adds an `onCreate()` if there isn't one).
- That call (`extensions/.../samsungnotes/ForceDarkModePatch.java`) uses `UiModeManager.setApplicationNightMode(MODE_NIGHT_YES)` (Android 12+), a per-app night mode. Only Samsung Notes is affected; the system theme is untouched.
- Fallback: `AppCompatDelegate.setDefaultNightMode(MODE_NIGHT_YES)` via reflection, if that class isn't obfuscated.

## Build
Same as the Morphe patches template: set `gpr.user` / `gpr.key` (a GitHub token with `read:packages`) in `~/.gradle/gradle.properties`, then
```
./gradlew buildAndroid
```
The `.mpp` file lands in `patches/build/libs/`. Load it in Morphe Manager as a local patch source, or use Morphe CLI/Desktop.

Package names still use the template's `app.template.*` — rename if you publish it.
