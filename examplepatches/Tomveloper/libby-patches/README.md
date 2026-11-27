# Libby Patches

Morphe patches for the Android **Libby: Read Library Books** app.

## About

This repository contains patches for Libby. The current patch adds a **Patch
Settings** sheet to the reader, opened from a **Fonts** item next to Appearance,
with a **Custom Font** section:

- Upload local WOFF2, WOFF, TTF, or OTF fonts, and keep several families and
  faces.
- The reader shows **No font selected** until you upload one.
- Choose the **reading weight** used for chapter text, or leave it on
  **Default** to keep the app's own weight settings. The weight also applies
  while the custom font is off.
- The font is copied into the app's private storage and streamed locally through
  a shared `/morphe/` request router. No remote font URL, no network request, and
  no fixed file-size limit.
- The font choice, weight, and on/off state persist across launches.
- An event-driven runtime with **no polling**, keeping battery use low for a
  reader app.

The font patch depends on an internal **Shared web routes** patch. That patch
installs one `shouldInterceptRequest` hook, and other patches can register
additional `/morphe/` routes without adding another hook.

Supported Libby versions are listed in the generated table below. As of this
writing the target is **9.6.0** (versionCode `960000`); `Constants.kt` is the
authoritative source.

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/Tomveloper/libby-patches

<a href="https://morphe.software/add-source?github=Tomveloper/libby-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/Tomveloper/libby-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**3 patches** across **1 app**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**Libby: Read Library Books**](PATCHES.md#libby-read-library-books-comoverdrivemobileandroidlibby) | 3 | `9.6.0` | [`com.overdrive.mobile.android.libby`](https://play.google.com/store/apps/details?id=com.overdrive.mobile.android.libby) |
<!-- PATCHES_END -->

The table above is generated from `patches-list.json` at release time. Change
`Constants.kt` and let semantic-release refresh it rather than editing it here.

## Building locally

Needs JDK 21 and an Android SDK with the platform and build-tools versions
required by the Morphe Gradle plugin (platform 36 / build-tools 36.0.0 as of
this writing) at `%LOCALAPPDATA%\Android\Sdk`. Local-only binaries live in
`dev/tools/`.

### Quick shortcuts (Windows)

Double-click a wrapper in `dev/` — no terminal needed:

| File | Action |
|---|---|
| `dev/build.cmd` | build the patch bundle |
| `dev/patch.cmd` | apply the newest bundle to the stock APK |
| `dev/install.cmd` | `adb install -r` the patched APK |
| `dev/build_patch_install.cmd` | all three in order |

They call `dev/build-and-install.ps1`, which discovers the newest jar, bundle,
and APK automatically, and restores the signing key into Morphe's jar-adjacent
data folder if it is missing. The manual commands below do the same steps one
at a time.

Versions change with every release. The placeholders below mean:

- `<jar>` — the Morphe desktop jar in `dev/tools/` (e.g.
  `morphe-desktop-2.4.0-all.jar` as of this writing)
- `<bundle>` — the newest `patches-<version>.mpp` in `patches/build/libs/`
- `<apk>` — the stock Libby APK in `dev/tools/` (e.g. `libby-9.6.0.apk` as of
  this writing)

```powershell
.\gradlew.bat buildAndroid

java -jar dev\tools\<jar> patch `
  -p patches\build\libs\<bundle> `
  -o build\libby-patched.apk `
  dev\tools\<apk>
```

Morphe keeps its data root next to the jar, so the signing key must be at
`dev\tools\morphe-data\morphe.keystore`. See `dev\tools\README.md` for the
current file names and hashes.

Add `-e "Enable WebView debugging"` to include the optional WebView debugging
patch.

## License

Libby Patches are licensed under the [GNU General Public License v3.0](LICENSE).
