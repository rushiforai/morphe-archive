# Custom Cloned-App Branding Assets (`branding/`)

> **Status**: Standalone vector source assets. `ClonePackageBrandingPatch.kt` currently rewrites the manifest package name, application label, ContentProvider authorities, and custom permissions, and does **not** yet compile/inject these XML drawables into the target APK's `resources.arsc`.

This directory contains Android Adaptive Icon vector source assets and branding specifications for the side-by-side cloned build (`com.brave.browser.clone` / `"Brave Mod"`).

---

## 1. Asset Inventory & Design Rationale

All vector assets are constructed on standard **108dp x 108dp** viewports with primary visual elements contained within the **66dp diameter safe zone** (centered at `54, 54`) to guarantee zero clipping across teardrop, squircle, pebble, round, and square launcher masks.

| Resource Path | Type | Visual Theme & Design Details |
|:---|:---|:---|
| `branding/res/drawable/ic_launcher_background.xml` | Vector Drawable (`108dp`) | True AMOLED `#09090B` deep black canvas with subtle radial depth discs (`#101014`, `#141418`), concentric coordinate grids (`#161619`, `#1E1E24`), and micro-alpha Brave Orange illumination node (`#26FF5500`). |
| `branding/res/drawable/ic_launcher_foreground.xml` | Vector Drawable (`108dp`) | Minimalist Brave shield silhouette in Brave Orange (`#FF5500`) with an inset dark surface (`#18181B`) and a high-contrast downward media arrow + cradle bar in clean white (`#FFFFFF`). Centered strictly in the 66dp safe zone (`[34..74, 27..81]`). |
| `branding/res/drawable/ic_launcher_monochrome.xml` | Vector Drawable (`108dp`) | Clean outline monochrome vector for Android 13+ (API 33+) dynamic themed icons (Material You). Uses crisp white outline and glyphs for system dynamic recoloring. |
| `branding/res/mipmap-anydpi-v26/ic_launcher.xml` | Adaptive Icon XML | Maps background, foreground, and monochrome drawables for standard adaptive icon renderers. |
| `branding/res/mipmap-anydpi-v26/ic_launcher_round.xml` | Adaptive Icon XML | Maps background, foreground, and monochrome drawables for round launcher icon renderers (Pixel Launcher, Samsung OneUI). |

---

## 2. Post-Merge Integration Guide for `ClonePackageBrandingPatch.kt`

When merging `feat/qa-and-branding` into main and integrating with `ClonePackageBrandingPatch.kt`, execute the following injection steps:

### 2.1 Resource Injection Pipeline
Inject the branding assets into target APK resource directories via Morphe's resource injection facility or gradle asset packing:
```kotlin
// In ClonePackageBrandingPatch.kt:
fun injectBrandingResources(apkContext: PatchContext) {
    // 1. Copy drawables to res/drawable/
    apkContext.addResource("res/drawable/ic_launcher_background.xml", backgroundXmlBytes)
    apkContext.addResource("res/drawable/ic_launcher_foreground.xml", foregroundXmlBytes)
    apkContext.addResource("res/drawable/ic_launcher_monochrome.xml", monochromeXmlBytes)

    // 2. Copy adaptive icon definitions to res/mipmap-anydpi-v26/
    apkContext.addResource("res/mipmap-anydpi-v26/ic_launcher.xml", adaptiveIconXmlBytes)
    apkContext.addResource("res/mipmap-anydpi-v26/ic_launcher_round.xml", adaptiveRoundIconXmlBytes)
}
```

### 2.2 Manifest Cloned Branding Attributes
In `AndroidManifest.xml`, ensure the `<application>` node references the newly injected adaptive icons and cloned application label:
```xml
<application
    android:name="org.chromium.chrome.browser.ChromeApplication"
    android:label="@string/app_name"
    android:icon="@mipmap/ic_launcher"
    android:roundIcon="@mipmap/ic_launcher_round"
    ... >
```

### 2.3 String Resource Rewrites (`res/values/strings.xml`)
Transform the following strings to provide distinct side-by-side app distinction in launcher trays, notification shades, and the Android Settings app list:
```xml
<!-- Original: "Brave" -> Cloned: "Brave Mod" -->
<string name="app_name">Brave Mod</string>
<string name="bookmark_widget_title">Brave Mod Bookmarks</string>
<string name="fre_welcome_title">Welcome to Brave Mod</string>
```

### 2.4 ContentProvider & Custom Permission Authority Rewrites
Confirm all 9 ContentProviders and 5 custom signature permissions in `AndroidManifest.xml` are prepended with `com.brave.browser.clone` to prevent `INSTALL_FAILED_CONFLICTING_PROVIDER` and `INSTALL_FAILED_DUPLICATE_PERMISSION`:

#### 9 Cloned ContentProvider Authorities:
1. `com.brave.browser.FileProvider` -> `com.brave.browser.clone.FileProvider`
2. `com.brave.browser.DownloadFileProvider` -> `com.brave.browser.clone.DownloadFileProvider`
3. `com.brave.browser.DropDataProvider` -> `com.brave.browser.clone.DropDataProvider`
4. `com.brave.browser.ClipboardTextDataProvider` -> `com.brave.browser.clone.ClipboardTextDataProvider`
5. `com.brave.browser.PdfContentProvider` -> `com.brave.browser.clone.PdfContentProvider`
6. `com.brave.browser.ChromeBrowserProvider` -> `com.brave.browser.clone.ChromeBrowserProvider;com.brave.browser.clone.browser;com.brave.browser.clone`
7. `com.brave.browser.PageContentProvider` -> `com.brave.browser.clone.PageContentProvider`
8. `com.brave.browser.ScreenshotContentProvider` -> `com.brave.browser.clone.ScreenshotContentProvider`
9. `com.brave.browser.AutofillThirdPartyModeContentProvider` -> `com.brave.browser.clone.AutofillThirdPartyModeContentProvider`

#### 5 Custom Signature Permissions:
1. `com.brave.browser.permission.CHILD_SERVICE` -> `com.brave.browser.clone.permission.CHILD_SERVICE`
2. `com.brave.browser.permission.READ_WRITE_BOOKMARK_FOLDERS` -> `com.brave.browser.clone.permission.READ_WRITE_BOOKMARK_FOLDERS`
3. `com.brave.browser.TOS_ACKED` -> `com.brave.browser.clone.TOS_ACKED` *(Note: `TOS_ACKED` has NO `.permission.` infix)*
4. `com.brave.browser.permission.C2D_MESSAGE` -> `com.brave.browser.clone.permission.C2D_MESSAGE`
5. `com.brave.browser.permission.DEBUG` -> `com.brave.browser.clone.permission.DEBUG`
