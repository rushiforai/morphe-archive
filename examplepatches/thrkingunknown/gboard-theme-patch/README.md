# Gboard AMOLED Theme Studio

Standalone Morphe patch for **Gboard only** (`com.google.android.inputmethod.latin`).

## Default values

| Option | Default |
|---|---|
| Theme name | `Midnight Red` |
| Background | `#000000` |
| Primary / action | `#FF0000` |
| Secondary / normal keys | `#2A0A0A` |
| Tertiary / modifier keys | `#1F0B0B` |

Colours accept `#RRGGBB` or `#AARRGGBB`.

## Compatibility

- Package: `com.google.android.inputmethod.latin`
- App: Gboard
- Supported version: **Any**
- No `AppTarget` version restrictions.

Morphe documents that specifying a package without version targets means the patch
is compatible with any version of that package.

## Runtime safety

Theme registration is inserted after Gboard finishes constructing its built-in
theme list and immediately before its theme-list adapter is created. This makes
the custom item part of the adapter's initial data set rather than mutating a
list after the screen has rendered.

The registration obtains an Android `Context` via `android.app.ActivityThread.currentApplication()`.
This avoids `Class.getMethod("getContext")` reflection which fails with `NoSuchMethodException`
when `ThemeListingFragment`'s `getContext()` is non-public in the obfuscated class hierarchy.
No labels, branches, or try-catch blocks are injected.

## Version

Project/release version is managed by semantic-release; the generated release metadata below is authoritative.


<!-- PATCHES_START -->
> **[v1.3.0](https://github.com/thrkingunknown/gboard-theme-patch/releases/tag/v1.3.0)** • `main` • 1 patches total
<details open>
<summary>📦 Gboard • 1 patch</summary>
<br>
| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Gboard AMOLED Theme Studio](#gboard-amoled-theme-studio) | Adds a configurable standalone AMOLED Gboard theme. Midnight Red is the default palette. | • Theme name<br>• Background<br>• Primary / action<br>• Secondary / normal keys<br>• Tertiary / modifier keys |
</details>

<!-- PATCHES_END -->
