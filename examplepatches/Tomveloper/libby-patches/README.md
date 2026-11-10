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

Tested with Libby **9.5.0** (versionCode `950000`).

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/Tomveloper/libby-patches

<a href="https://morphe.software/add-source?github=Tomveloper/libby-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0-dev.1](https://github.com/Tomveloper/libby-patches/releases/tag/v1.2.0-dev.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`dev`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Libby: Read Library Books&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.overdrive.mobile.android.libby`

**🎯 Supported versions:**

| 9.5.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Custom reading font](#custom-reading-font) | Renders book text with a font you upload in the reader. |  |
| [Enable WebView debugging](#enable-webview-debugging) | Lets you inspect Libby's WebViews with chrome://inspect. |  |
| [Shared web routes](#shared-web-routes) | Internal: installs one /morphe/ request router for extension patches. |  |

</details>

<!-- PATCHES_END -->

## Building locally

Build the patch bundle:

```powershell
.\gradlew.bat buildAndroid
```

The bundle is written to `patches\build\libs\patches-1.0.0.mpp`.

Apply it with Morphe Desktop or the Morphe CLI:

```powershell
java -jar morphe-desktop-1.19.0-all.jar patch `
  -p patches\build\libs\patches-1.0.0.mpp `
  -o libby-patched.apk `
  libby-9.5.0.apk
```

Add `-e "Enable WebView debugging"` to include the optional WebView debugging
patch.

## License

Libby Patches are licensed under the [GNU General Public License v3.0](LICENSE).
