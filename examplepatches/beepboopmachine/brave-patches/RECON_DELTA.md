# Brave Android (v1.100.58) Extended Morphe Patch Reconnaissance Blueprint (Delta Pass)

## Executive Architectural Assessment

This specification establishes an implementation-ready, verified reverse-engineering blueprint for eight (8) extended Morphe bytecode patches targeting **Brave Browser Android `v1.100.58`** (`versionCode: 430005804`, `targetSdkVersion: 36`, `compileSdkVersion: 37`).

All class names, obfuscated descriptors, method signatures, Smali opcodes, and resource IDs reported in this document have been derived strictly from the local decompiled Brave APK (`./work/apktool/` and `./work/jadx/`) following a strict clean-room protocol. Every hook point provides verified stable anchors and explicit register allocation strategies for resilient Morphe patching across minor upstream browser updates.

---

## 1. Menu & Settings Bloat Debloating + Tools Entry Point

### 1.1 Architectural Analysis & Menu Model Hierarchy
Brave's primary 3-dot overflow menu for tabbed browsing is constructed via `hq2` (`smali_classes2/hq2.smali`), which extends the Chromium base menu properties delegate `vb0` (`smali_classes2/vb0.smali`).

Menu items are maintained within a Chromium property model list `b1b` (`smali_classes2/b1b.smali`, which subclasses `uoa` / `MVCListAdapter.ModelList`). The items stored inside `b1b` are strongly-typed wrappers of type `La1b;` (`new La1b(PropertyModel, int viewType)`), whose models are constructed using `Lib0;->l(Context, fb0, int id, int titleRes, int iconRes, boolean)`.

Brave-specific promotional items (Brave Wallet, Leo AI, Brave News, Brave Talk, Brave Rewards, and Brave VPN) are populated inside `hq2->X()Ljava/util/List;` using `gq2` (`smali_classes2/gq2.smali`). 

Importantly, click events on app menu items are **not** dispatched through Android's standard `MenuItem` callbacks; instead, Chromium routes all menu and keyboard actions directly through `onMenuOrKeyboardAction`:
- **Real Action Dispatcher**: `Lt62;->z4(IZLandroid/os/Bundle;Lo8c;)Z` in `smali_classes2/t62.smali` (`ChromeTabbedActivity` / `BraveActivity`), where `p1` holds the integer menu action ID.

### 1.2 Resource IDs & Preference Keys
- **Menu Item IDs (`res/values/public.xml`)**:
  - `brave_wallet_id`: `0x7f0102e0`
  - `brave_leo_id`: `0x7f01028b`
  - `brave_rewards_id`: `0x7f010296`
  - `brave_news_id`: `0x7f01028e`
  - `request_brave_vpn_id`: `0x7f010d78`
  - `request_vpn_location_id`: `0x7f010d7d`
- **Settings Preference Keys (`res/xml/APKTOOL_RENAMED_0x7f180019.xml`)**:
  - Section: `features_section` (`0x7f010777`)
  - Target Preferences: `brave_news_v2`, `brave_wallet`, `brave_vpn`, `brave_leo`, `brave_account`

### 1.3 Morphe Fingerprint Blueprint: Menu Debloating & Tools Injection

| Target Purpose | Smali Descriptor | Access & Signature | Stable Anchors (Opcodes / Strings / Registers) | Register & Injection Strategy |
|:---|:---|:---|:---|:---|
| **Filter Bloat Menu Items** | `Lhq2;` | `public final U()Lb1b;` | `iget-object v9, p0, Lvb0;->q:Lfb0;`<br>`const v10, 0x7f010772`<br>`invoke-virtual {v0, v1}, Luoa;->F(Ljava/lang/Object;)V`<br>`return-object v0` | In `U()Lb1b;`, immediately before `return-object v0`, instantiate an `int[]` array with IDs `[0x7f0102e0, 0x7f01028b, 0x7f010296, 0x7f01028e, 0x7f010d78, 0x7f010d7d]` and invoke `invoke-static {v0, v1}, Lhq2;->d0(Lb1b;[I)V`. This removes bloat without clobbering Brave's internal removal lists. |
| **Inject Native "Brave Tools" Entry** | `Lhq2;` | `public final U()Lb1b;` | `return-object v0` | Before return, construct a `PropertyModel` via `Lib0;->l(context, p0.q, 0x7f019999, R.string.brave_tools, R.drawable.ic_tools, false)`, wrap in `new-instance v1, La1b; invoke-direct {v1, p0, v2}, La1b;-><init>(Lorg/chromium/ui/modelutil/PropertyModel;I)`, and append via `invoke-virtual {v0, v1}, Luoa;->F(Ljava/lang/Object;)V`. |
| **Route "Brave Tools" Click Action** | `Lt62;` | `public z4(IZLandroid/os/Bundle;Lo8c;)Z` | `invoke-virtual {p0}, Lfo3;->c4()Lorg/chromium/chrome/browser/tab/Tab;`<br>`const p2, 0x7f0102e0`<br>`if-ne p1, p2, :cond_4` | At entry of `z4(IZLandroid/os/Bundle;Lo8c;)Z`, test if `p1 == 0x7f019999`. If true, launch `BraveToolsBottomSheetDialogFragment` / `BraveToolsActivity` and return `1` (`true`). |
| **Debloat Main Settings** | `Lorg/chromium/chrome/browser/settings/BraveMainPreferencesBase;` | `public final V3(Landroid/os/Bundle;)V` | `const-string v0, "features_section"`<br>`invoke-virtual {p0, v0}, Landroidx/preference/PreferenceFragmentCompat;->findPreference(Ljava/lang/CharSequence;)Landroidx/preference/Preference;` | After `features_section` is retrieved, iterate over keys `["brave_news_v2", "brave_wallet", "brave_vpn", "brave_leo", "brave_account"]` and invoke `removePreference(Landroidx/preference/Preference;)Z`. |

---

## 2. True AMOLED Black Theme

### 2.1 Theme & Dynamic Color Resolution Architecture
Chromium and Brave utilize a dual theming model:
1. **XML Color Tokens**: Static dark theme surfaces defined in `res/values-night/colors.xml`. Base dark background `color_surface_dark` is `#1f1f1f` (`0x7f070af1`), leaving dark-gray surfaces rather than true OLED black.
2. **Material You Dynamic Color Resolution**: Dynamic elevation surfaces computed via `SemanticColorUtils` (`smali/g7b.smali`), which intercepts color attributes at runtime using `q5b;->f(...)` and `g7b;->g(...)`.

### 2.2 Elevation Hierarchy & Contrast Steps
To prevent "gray islands" while maintaining surface hierarchy on AMOLED displays:
- **Base Canvas (Surface 0)**: `#000000` (Omnibox URL bar background, NTP canvas, settings root, main tab switcher background)
- **Low Elevation (Surface 1)**: `#0A0A0C` (Bottom sheets, modal dialog cards)
- **Container Elevation (Surface 2)**: `#0E0E10` (Toolbar container, URL focus pill, search chips)
- **High Elevation (Surface 3)**: `#161618` (Popups, context menus, 3-dot dropdowns)
- **Highest Elevation (Surface 4)**: `#1C1C1F` (Dividers, floating action buttons, elevated badges)

### 2.3 Morphe Fingerprint Blueprint: AMOLED Theme

| Target Purpose | Smali Descriptor | Access & Signature | Stable Anchors (Opcodes / Strings / Registers) | Register & Injection Strategy |
|:---|:---|:---|:---|:---|
| **Base Surface Override** | `res/values-night/colors.xml` | Resource Table Token `0x7f070af1` | `<color name="color_surface_dark">#ff1f1f1f</color>` | Patch resource table entry `0x7f070af1` and related surface attributes (`color_surface_container_*`) to `#000000` and stepped `#0A0A0C` - `#161618`. |
| **TypedValue Surface Color Filter** | `Lg7b;` | `public static g(Landroid/content/Context;Landroid/util/TypedValue;)I` | `iget v0, p1, Landroid/util/TypedValue;->resourceId:I`<br>`invoke-virtual {p0, v0}, Landroid/content/Context;->getColor(I)I`<br>`iget p0, p1, Landroid/util/TypedValue;->data:I` | Hook `g(Landroid/content/Context;Landroid/util/TypedValue;)I` right before `return p0`. If resolved color matches standard dark gray tones (`#1f1f1f`, `#141414`, `#1b1b1b`, `#202124`, `#28292c`), remap to `#000000` or stepped elevation `#0E0E10` based on dark mode configuration. |
| **Semantic Color Attribute Hook** | `Lg7b;` | `public static c(Landroid/content/Context;ILjava/lang/String;)I` | `invoke-static {p0, p1, p2}, Lq5b;->f(Landroid/content/Context;ILjava/lang/String;)Landroid/util/TypedValue;`<br>`move-result-object p1`<br>`invoke-static {p0, p1}, Lg7b;->g(Landroid/content/Context;Landroid/util/TypedValue;)I` | R8 inlines attribute resource IDs directly as integer parameters in `p1`. Intercept `p1` for known surface attributes (`colorSurface`, `colorSurfaceContainer`), returning `#000000` or `#0E0E10` when night mode is active. |

---

## 3. Clean New Tab Page (NTP)

### 3.1 NTP Layout & Sponsored Element Architecture
The New Tab Page layout is managed by `BraveNewTabPageLayout` (`smali_classes2/org/chromium/chrome/browser/ntp/BraveNewTabPageLayout.smali`).

- **Sponsored Wallpapers**: Wallpaper data models are bound inside `BraveNewTabPageLayout->h()V`. When `wallpaper.h` (`Z`) is `true`, a sponsored background image is rendered, and `@id/bg_sponsored_rich_media_view` (`0x7f010202`) is inflated with ad tracking pixels.
- **Brave News Cards**: Governed by `Lfh2;->g(Lorg/chromium/chrome/browser/profiles/Profile;)Z` and `Lyf2;->a(Lorg/chromium/chrome/browser/profiles/Profile;)Z`, which check the native preference `"brave.news.disabled_by_policy"`.
- **Most Visited Tiles**: Tile grid dimensions are governed by `MostVisitedTilesLayout` (`smali/org/chromium/chrome/browser/suggestions/tile/MostVisitedTilesLayout.smali`).

### 3.2 Morphe Fingerprint Blueprint: Clean NTP

| Target Purpose | Smali Descriptor | Access & Signature | Stable Anchors (Opcodes / Strings / Registers) | Register & Injection Strategy |
|:---|:---|:---|:---|:---|
| **Enforce 4-Column Pinned Tile Grid** | `Lorg/chromium/chrome/browser/suggestions/tile/MostVisitedTilesLayout;` | `public final b(II)V` | `invoke-virtual {p0, v0}, Landroid/widget/GridLayout;->setColumnCount(I)V` | Before `setColumnCount(I)`, overwrite parameter register `v0` with `const/4 v0, 0x4` to guarantee an unyielding 4-column layout on all phone screens. |
| **Neutralize Sponsored Background Ads** | `Lorg/chromium/chrome/browser/ntp/BraveNewTabPageLayout;` | `public final h()V` | `iget-boolean v2, v1, Lorg/chromium/chrome/browser/ntp_background_images/model/Wallpaper;->h:Z`<br>`if-eqz v2, :cond_5`<br>`const v2, 0x7f010202` | Immediately before `if-eqz v2, :cond_5`, force `const/4 v2, 0x0`. This cleanly bypasses WebContents creation and inflation of `0x7f010202` (`bg_sponsored_rich_media_view`). |
| **Disable Brave News Feed via Policy Hook** | `Lyf2;` | `public static a(Lorg/chromium/chrome/browser/profiles/Profile;)Z` | `const-string v1, "brave.news.disabled_by_policy"`<br>`invoke-virtual {p0, v1}, Lorg/chromium/components/prefs/PrefService;->b(Ljava/lang/String;)Z` | Prepend `const/4 v0, 0x1; return v0` at line 1 of `yf2->a()`. This marks news as disabled by policy, ensuring `Lfh2;->g(Lorg/chromium/chrome/browser/profiles/Profile;)Z` returns `false` and prevents feed recycler view creation on the NTP. |

---

## 4. Incognito Screenshots (`FLAG_SECURE`)

### 4.1 Window Security Coordinator Identification
Brave delegates Incognito screenshot restrictions to `v65` (`smali_classes2/v65.smali`), which implements `zgc` and `ew5`.

Method `v65->g()V` queries the active tab model state (`b03.z() == 1`). If in Incognito mode:
- Window attributes flag `0x2000` (`WindowManager.LayoutParams.FLAG_SECURE = 8192`) is tested.
- If feature flag `ur3.Z2` (`"IncognitoScreenshot"`) is false or on Android versions < 33, `Window.addFlags(0x2000)` is invoked.
- Additionally, on Android 13+ (API 33+), `activity.setRecentsScreenshotEnabled(!isIncognito)` is invoked.

### 4.2 Security Policy Recommendation
- **Recommended Implementation**: Use **Option B** (replacing `Window.addFlags(0x2000)` with `Window.clearFlags(0x2000)`) rather than Option A (`return-void`). This ensures any previously applied `FLAG_SECURE` mask is actively stripped when switching into Incognito mode.
- **Crypto Wallet Guardrail**: Skip unblocking `FLAG_SECURE` on `BraveWalletActivity` and `AddAccountActivity` unless screenshotting private seed phrases or financial balances is explicitly required by the user.

### 4.3 Morphe Fingerprint Blueprint: Incognito Screenshots

| Target Purpose | Smali Descriptor | Access & Signature | Stable Anchors (Opcodes / Strings / Registers) | Register & Injection Strategy |
|:---|:---|:---|:---|:---|
| **Strip Incognito FLAG_SECURE (Option B)** | `Lv65;` | `public final g()V` | `const/16 v4, 0x2000`<br>`invoke-virtual {v1, v4}, Landroid/view/Window;->addFlags(I)V`<br>`invoke-virtual {v1, v4}, Landroid/view/Window;->clearFlags(I)V` | Locate `invoke-virtual {v1, v4}, Landroid/view/Window;->addFlags(I)V`. Replace with `invoke-virtual {v1, v4}, Landroid/view/Window;->clearFlags(I)V`. |
| **Allow Recents Screenshots on API 33+** | `Lv65;` | `public final g()V` | `const/16 v6, 0x21`<br>`invoke-static {p0, v2}, Lik;->l(Landroid/app/Activity;Z)V` | Force `v2` (boolean flag for `setRecentsScreenshotEnabled`) to `const/4 v2, 0x1` so recents app switcher previews are never blanked. |

---

## 5. Share & Copy Tracking Stripper

### 5.1 Text & URL Interception Architecture
Outgoing URLs leave the browser process via two primary channels:
1. **Clipboard Operations**: Omnibox "Copy link", context menu "Copy link address", and tab sharing copy actions all route through `d14` (`smali/d14.smali`), which subclasses `Lorg/chromium/ui/base/Clipboard;`. Method `d14->setText(Ljava/lang/String;)V` takes parameter `p1` and delegates to `d14->j(Ljava/lang/String;Ljava/lang/String;Z)V`.
2. **Chromium Primary Share Sheet Pipeline**: The 3-dot "Share..." action (`0x7f010ec1`) routes from `Lrcg;->a(IZ)Z` through `ShareDelegateImpl` (`smali_classes2/jn2.smali`). Method `Ljn2;->d(Lbih;Lzu3;I)V` processes `ShareParams` (`bih`). Method `bih.b()` supplies the target URL string (`getUrl()`).

### 5.2 Strip Parameters & URL Validation Guard
To avoid corrupting plain-text clipboard copies (passwords, code snippets, memos), `d14->setText` must strictly validate that `p1` is a valid web URL before stripping parameters:
- **Validation Guard**: `p1 != null && (p1.startsWith("http://") || p1.startsWith("https://")) && !p1.contains(" ")`
- **Strip Parameters**:
  - **Campaign/Analytics**: `utm_source`, `utm_medium`, `utm_campaign`, `utm_term`, `utm_content`, `utm_id`, `utm_reader`, `utm_referrer`
  - **Ad Trackers**: `gclid`, `gbraid`, `wbraid`, `fbclid`, `msclkid`, `twclid`, `dclid`
  - **Platform Trackers**: `igshid`, `si` (YouTube tracking identifier), `mc_eid`, `vero_id`, `_openstat`

### 5.3 Morphe Fingerprint Blueprint: Share & Copy Stripper
*(Canonical extension implementation: `dev.brave.extension.tools.UrlStripper`)*

| Target Purpose | Smali Descriptor | Access & Signature | Stable Anchors (Opcodes / Strings / Registers) | Register & Injection Strategy |
|:---|:---|:---|:---|:---|
| **Sanitize Clipboard Copies (Guarded)** | `Ld14;` | `public final setText(Ljava/lang/String;)V` | `const-string v0, "text"`<br>`const/4 v1, 0x0`<br>`invoke-virtual {p0, v0, p1, v1}, Ld14;->j(Ljava/lang/String;Ljava/lang/String;Z)V` | Before `invoke-virtual {p0, v0, p1, v1}, Ld14;->j(...)`: Insert `invoke-static {p1}, Ldev/brave/extension/tools/UrlStripper;->sanitizeUrlIfHttp(Ljava/lang/String;)Ljava/lang/String;` and `move-result-object p1`. |
| **Sanitize Share Sheet Dispatch** | `Ljn2;` | `public final d(Lbih;Lzu3;I)V` | `invoke-virtual {p1}, Lbih;->b()Ljava/lang/String;`<br>`invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z` | At entry of `jn2->d(Lbih;Lzu3;I)V`, inspect `p1` (`ShareParams`). If `p1.d` (URL string) is non-empty, sanitize via `UrlStripper.sanitizeUrlIfHttp()` before Mojo serialization (`LJ/N;->VOOO(...)`). |
| **Sanitize Generic Chooser Intent** | `Lcye;` | `public static e(Landroid/content/Context;Ljava/lang/String;)V` | `const-string v1, "android.intent.action.SEND"`<br>`const-string v1, "android.intent.extra.TEXT"`<br>`invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;` | Before `putExtra`: Insert `invoke-static {p1}, Ldev/brave/extension/tools/UrlStripper;->sanitizeUrlIfHttp(Ljava/lang/String;)Ljava/lang/String;` and `move-result-object p1`. |

---

## 6. Fullscreen HTML5 Video Gestures

### 6.1 Chromium Fullscreen Manager Architecture
Chromium manages HTML5 fullscreen transitions via `v28` (`smali_classes2/v28.smali`), which implements `FullscreenManager`.

- **Entering Fullscreen**: Method `v28->h(Lorg/chromium/chrome/browser/tab/Tab;Lorg/chromium/chrome/browser/fullscreen/FullscreenOptions;)V` is triggered when a `<video>` element enters fullscreen.
  - Active Tab: Parameter `p1` (`Lorg/chromium/chrome/browser/tab/Tab;`).
  - Active Host Activity: Field `p0.v` (`Landroid/app/Activity;`).
  - Active WebContents: `p1.getWebContents()` (`Lorg/chromium/content_public/browser/WebContents;`).
- **Exiting Fullscreen**: Method `v28->c()V` cleans up fullscreen states.

### 6.2 Robust Video Element Targeting & JS Execution
- **Production JS Execution**: Do **not** use test-only `evaluateJavaScriptForTests`. Route calls through `WebContents.M(String)` (or `JsInjectionHub`), which invokes the direct JNI execution path (`WebContentsImpl.M(String script)`) as proven in RECON.md Section 3.1.
- **Robust Video Selector**:
  ```javascript
  const v = document.fullscreenElement?.tagName === 'VIDEO' ? document.fullscreenElement : (document.fullscreenElement?.querySelector('video') || document.querySelector('video'));
  ```
- **Touch Pass-Through**: The injected `FullscreenGestureOverlayView` must return `false` on single tap events (`MotionEvent.ACTION_UP` without movement) so that native player controls (play/pause, seekbar dragging, quality settings) remain fully responsive.

### 6.3 Morphe Fingerprint Blueprint: Fullscreen Video Gestures
*(Canonical extension implementation: `dev.brave.extension.gestures.VideoGestureOverlay`)*

| Target Purpose | Smali Descriptor | Access & Signature | Stable Anchors (Opcodes / Strings / Registers) | Register & Injection Strategy |
|:---|:---|:---|:---|:---|
| **Hook Fullscreen Enter** | `Lv28;` | `public final h(Lorg/chromium/chrome/browser/tab/Tab;Lorg/chromium/chrome/browser/fullscreen/FullscreenOptions;)V` | `invoke-interface {p1}, Lorg/chromium/chrome/browser/tab/Tab;->getWebContents()Lorg/chromium/content_public/browser/WebContents;`<br>`const-string v0, "FullscreenHtmlApiHandler.enterFullScreen"` | At end of `h()`, inject: `iget-object v0, p0, Lv28;->v:Landroid/app/Activity;`<br>`invoke-static {v0, p1}, Ldev/brave/extension/gestures/VideoGestureOverlay;->attach(Landroid/app/Activity;Lorg/chromium/chrome/browser/tab/Tab;)V`. |
| **Hook Fullscreen Exit** | `Lv28;` | `public c()V` | `const-string v0, "FullscreenHtmlApiHandler.exitFullScreen"`<br>`invoke-static {v0, v1}, Ly0m;->j(Ljava/lang/Object;Ljava/lang/String;)V` | At entry of `c()`, inject: `iget-object v0, p0, Lv28;->v:Landroid/app/Activity;`<br>`invoke-static {v0}, Ldev/brave/extension/gestures/VideoGestureOverlay;->detach(Landroid/app/Activity;)V`. |

---

## 7. Startup Optimization, Max Refresh Rate, Telemetry/Crash & Locale

### 7.1 Startup Optimization: PartnerBrowserCustomizations Listener Drain
During cold start, `PartnerBrowserCustomizations->c(Landroid/content/Context;)V` initializes partner bookmarks. 

Chromium queues startup listeners in field `this.d` (`Ljava/util/ArrayList;` of `Runnable`). If `this.b = Boolean.TRUE;` is assigned without executing the listener queue, any component waiting on `j(Ljava/lang/Runnable;)V` will freeze indefinitely.
- **Hook Strategy**: 
  1. Set `this.b = Boolean.TRUE;`.
  2. Check if `this.d != null`. If not null, iterate through `this.d`, invoke `Runnable.run()` on each callback, and call `this.d.clear()`.
  3. `return-void`.

### 7.2 Max Refresh Rate (90Hz / 120Hz / 144Hz) with Resolution Matching
Display refresh rate is controlled in `WindowAndroid` (`smali/org/chromium/ui/base/WindowAndroid.smali`). Method `r(F)V` inspects available `Display.Mode` objects stored in `this.G` (`Ljava/util/ArrayList;`).
- **Resolution Matching Guard**: Do **not** select the maximum refresh rate indiscriminately across `this.G`. Selecting a high-Hz mode with a lower physical resolution will downscale display clarity. The selector must filter `Display.Mode` entries where `mode.getPhysicalWidth() == currentMode.getPhysicalWidth() && mode.getPhysicalHeight() == currentMode.getPhysicalHeight()` before selecting the maximum `mode.getRefreshRate()`.

### 7.3 Telemetry & Crash Reporting Neutralization
- **P3A Serialization**: `Lp3a;` (`smali_classes2/p3a.smali`). In method `p3a->a(Lmt6;)V`, prepend `return-void` to completely prevent P3A Mojo message serialization.
- **Native UserPrefs**: Preferences `"brave.p3a.enabled"` and `"brave.stats.reporting_enabled"` are queried via `Lac2;->a()Lorg/chromium/components/prefs/PrefService;`. Force `PrefService.b("brave.p3a.enabled")` to return `false`.
- **Chromium UMA Metrics**: In `Lorg/chromium/chrome/browser/metrics/UmaSessionStats;->changeMetricsReportingConsent(ZZ)V`, force parameters to `false`.

### 7.4 Locale Directory Stripping
Inspection of `recon_raw/delta/xml/locale_dirs.txt` reveals 39 resource directory configurations. Non-target locales in `res/values-*` (e.g., `values-ar`, `values-zh`, `values-ru`, `values-hi`) can be pruned during APK packaging, yielding an immediate ~22 MB size reduction.

### 7.5 Morphe Fingerprint Blueprint: Performance, Refresh Rate & Telemetry
*(Canonical extension implementation: `dev.brave.extension.*`)*

| Target Purpose | Smali Descriptor | Access & Signature | Stable Anchors (Opcodes / Strings / Registers) | Register & Injection Strategy |
|:---|:---|:---|:---|:---|
| **Bypass Partner Customizations & Drain Queue** | `Lorg/chromium/chrome/browser/partnercustomizations/PartnerBrowserCustomizations;` | `public final c(Landroid/content/Context;)V` | `const-string v2, "Chrome.Homepage.PartnerCustomizedDefaultGurl"`<br>`const-wide/16 v2, 0x2710`<br>`invoke-static {v1, p1, v2, v3}, Lorg/chromium/base/task/PostTask;->b(...)V` | Hook entry of `c()`: set `this.b = Boolean.TRUE;`, drain and execute all `Runnable`s in `this.d` (`ArrayList`), invoke `this.d.clear()`, and `return-void`. |
| **Unlock Max Refresh Rate (Resolution Matched)** | `Lorg/chromium/ui/base/WindowAndroid;` | `public final r(F)V` | `iget-object v0, p0, Lorg/chromium/ui/base/WindowAndroid;->G:Ljava/util/ArrayList;`<br>`iget v0, p1, Landroid/view/WindowManager$LayoutParams;->preferredDisplayModeId:I` | Replace the refresh rate selection loop with `Ldev/brave/extension/DisplayHelper;->getResolutionMatchedMaxModeId(Ljava/util/ArrayList;Landroid/view/Display$Mode;)I`; assign result to `preferredDisplayModeId`. |
| **Neutralize P3A Telemetry Serialization** | `Lp3a;` | `public final a(Lmt6;)V` | `const/16 v1, 0x8`<br>`const/16 v3, 0x10`<br>`invoke-virtual {p1, v3, v2}, Lmt6;->v(II)Lmt6;` | Prepend `return-void` at line 1 of `.method public final a(Lmt6;)V` in `smali_classes2/p3a.smali`. |

---

## 8. Package Cloning Audit

### 8.1 Package ID Transformation
- **Original Package**: `com.brave.browser`
- **Cloned Package**: `com.brave.browser.clone` (or custom prefix `com.morphe.brave`)

### 8.2 ContentProvider Authority Collision Matrix
All `AndroidManifest.xml` ContentProviders declared with explicit package-bound authorities must be rewritten to avoid `INSTALL_FAILED_CONFLICTING_PROVIDER`:

| Provider Component Class | Original Authority String | Cloned Target Authority String | Exported | GrantUriPermissions |
|:---|:---|:---|:---|:---|
| `org.chromium.chrome.browser.util.ChromeFileProvider` | `com.brave.browser.FileProvider` | `com.brave.browser.clone.FileProvider` | `false` | `true` |
| `org.chromium.chrome.browser.download.DownloadFileProvider` | `com.brave.browser.DownloadFileProvider` | `com.brave.browser.clone.DownloadFileProvider` | `false` | `true` |
| `org.chromium.ui.dragdrop.DropDataContentProvider` | `com.brave.browser.DropDataProvider` | `com.brave.browser.clone.DropDataProvider` | `false` | `true` |
| `org.chromium.ui.base.ClipboardTextDataProvider` | `com.brave.browser.ClipboardTextDataProvider` | `com.brave.browser.clone.ClipboardTextDataProvider` | `false` | `true` |
| `org.chromium.chrome.browser.pdf.PdfContentProvider` | `com.brave.browser.PdfContentProvider` | `com.brave.browser.clone.PdfContentProvider` | `false` | `true` |
| `org.chromium.chrome.browser.provider.ChromeBrowserProvider` | `com.brave.browser.ChromeBrowserProvider;com.brave.browser.browser;com.brave.browser` | `com.brave.browser.clone.ChromeBrowserProvider;com.brave.browser.clone.browser;com.brave.browser.clone` | `true` | `false` |
| `org.chromium.chrome.browser.provider.PageContentProvider` | `com.brave.browser.PageContentProvider` | `com.brave.browser.clone.PageContentProvider` | `false` | `true` |
| `org.chromium.chrome.browser.screenshotprovider.ScreenshotContentProvider` | `com.brave.browser.ScreenshotContentProvider` | `com.brave.browser.clone.ScreenshotContentProvider` | `false` | `true` |
| `org.chromium.chrome.browser.autofill.AutofillThirdPartyModeContentProvider` | `com.brave.browser.AutofillThirdPartyModeContentProvider` | `com.brave.browser.clone.AutofillThirdPartyModeContentProvider` | `true` | `false` |

### 8.3 Custom Permission Collision Matrix
The following signature-level permissions defined in `AndroidManifest.xml` must be renamed to match the cloned package name to prevent `INSTALL_FAILED_DUPLICATE_PERMISSION`:
1. `com.brave.browser.permission.CHILD_SERVICE` -> `com.brave.browser.clone.permission.CHILD_SERVICE`
2. `com.brave.browser.permission.READ_WRITE_BOOKMARK_FOLDERS` -> `com.brave.browser.clone.permission.READ_WRITE_BOOKMARK_FOLDERS`
3. `com.brave.browser.TOS_ACKED` -> `com.brave.browser.clone.TOS_ACKED`
4. `com.brave.browser.permission.C2D_MESSAGE` -> `com.brave.browser.clone.permission.C2D_MESSAGE`
5. `com.brave.browser.permission.DEBUG` -> `com.brave.browser.clone.permission.DEBUG`

### 8.4 Smali Bytecode Audit for Hardcoded Authorities
A comprehensive scan across all `smali*/` classes confirmed **zero hardcoded authority strings** in bytecode. AndroidX `FileProvider` (`ph7.smali`) and Chromium providers query `ProviderInfo.authority` directly from the package manager metadata initialized during application startup. Renaming authorities inside `AndroidManifest.xml` cleanly isolates the cloned package without necessitating additional bytecode edits.

---

## 9. Concise Implementation Risk Assessment

1. **Obfuscated Action Dispatcher Volatility**: `onMenuOrKeyboardAction` in `t62` (`z4`) and `v28` / `v65` helper classes are subject to R8 identifier re-shuffling on upstream updates; fingerprints must anchor on permanent opcodes, integer literals (`0x2000`, `0x7f0102e0`), and UKM / action strings rather than class names alone.
2. **Dynamic Color Fallback Integrity**: AMOLED theme overrides in `SemanticColorUtils` (`g7b`) must safeguard against `Resources.NotFoundException` by defaulting gracefully to `#000000` when dynamic Material You color attributes are missing on Android 11 and older.
3. **Multi-Authority Manifest Delimiter Preservation**: When modifying `ChromeBrowserProvider` in cloned builds, the semicolon-delimited alias structure (`com.brave.browser.clone.ChromeBrowserProvider;...;...`) must be strictly preserved to avoid breaking Android Search / QuickSearchBox integration.
4. **Fullscreen Gesture Touch Hit Target Conflicts**: The injected `FullscreenGestureOverlayView` must return `false` on tap events without drag distance to guarantee that native video seekbars and player controls remain clickable without deadzones.
5. **Startup Queue Deadlocks**: Neutralizing `PartnerBrowserCustomizations` must drain all registered `Runnable` callbacks in `this.d` to prevent background initializers from hanging the browser launch thread.
6. **Display Resolution Matching in High-Hz Modes**: Forcing maximum refresh rate in `WindowAndroid->r(F)V` must verify physical display dimensions against current mode dimensions to prevent accidental panel downscaling.
