# Brave Android (v1.100.58) Media & HLS Downloader Reconnaissance & Morphe Blueprint

## Executive Architectural Assessment

This document provides a verified, reverse-engineered blueprint for a Morphe bytecode patch targeting **Brave Browser Android `v1.100.58`** (`versionCode: 430005804`, `targetSdkVersion: 36`, `compileSdkVersion: 37`).

All class names, method signatures, Smali descriptors, and resource IDs reported below have been directly verified against `./work/apktool/smali*/` and decoded XML resources.

---

## 1. Toolbar View Hierarchy & Injection Point

### 1.1 Layout Hierarchy Analysis
Top toolbar layout is defined in `res/layout/APKTOOL_RENAMED_0x7f0e04e1.xml` (decoded `ToolbarPhone`):
```xml
<org.chromium.chrome.browser.toolbar.top.ToolbarPhone android:id="@id/toolbar" ...>
    <HomeButton android:id="@id/home_button" ... />
    <ChromeImageButton android:id="@id/back_button" ... />
    <View android:id="@id/location_bar_background_view" ... />
    <LocationBarPhone android:id="@id/location_bar" ... />

    <LinearLayout android:id="@id/toolbar_buttons"
                  android:layout_gravity="end|top"
                  android:orientation="horizontal" ...>
        <!-- Included layout: APKTOOL_RENAMED_0x7f0e012f (brave_toolbar_container) -->
        <include layout="@layout/APKTOOL_RENAMED_0x7f0e012f" />
        
        <ViewStub android:id="@id/optional_button_stub" ... />
        <ViewStub android:id="@id/signin_button_stub" ... />
        
        <!-- Target Anchor View -->
        <ToggleTabStackButton android:id="@id/tab_switcher_button" ... />
        
        <include layout="@layout/APKTOOL_RENAMED_0x7f0e0304" /> <!-- Menu Button -->
    </LinearLayout>
</org.chromium.chrome.browser.toolbar.top.ToolbarPhone>
```

#### Hierarchy Findings:
1. **Parent `ViewGroup`**: The direct parent of `tab_switcher_button` (`0x7f011042`) is `LinearLayout` with ID `@id/toolbar_buttons` (`0x7f0110f9`).
2. **Brave Shields Button Location**:
   - `brave_shields_button` (`0x7f010297`) is located inside `FrameLayout` `brave_shields_button_layout` (`0x7f010298`).
   - This layout resides inside `LinearLayout` `brave_toolbar_container` (`0x7f0102df`), which is the **first child** included inside `@id/toolbar_buttons`.
   - `brave_shields_button` does **not** live inside `location_bar` on phones; it is part of the right-hand `toolbar_buttons` cluster alongside Shields, Wallet, PIP, and Rewards.
3. **Bottom Toolbar Architecture**:
   - Brave does **not** dynamically re-parent top toolbar views into the bottom bar.
   - When bottom toolbar is enabled (`n42.a() == true`), Brave inflates a completely separate layout `APKTOOL_RENAMED_0x7f0e00fc.xml` (`BrowsingModeBottomToolbarLinearLayout` with ID `@id/bottom_toolbar_browsing`), containing `@id/bottom_tab_switcher_button` (`0x7f01026f`).
   - In `ToolbarPhone` (top toolbar), `tab_switcher_button` has its visibility toggled to `View.GONE` when bottom toolbar is active (via `cr2.m4681S0`).
   - **Recommendation**: Inject our media download button into the top `ToolbarPhone` (`@id/toolbar_buttons`) immediately before `tab_switcher_button`. It will remain visible at the top bar right beside Shields and PIP.

### 1.2 Smali Class Hierarchy
- Class: `Lorg/chromium/chrome/browser/toolbar/top/ToolbarPhone;`
- Direct Superclass: `Lcr2;` (R8 obfuscated name for `BraveToolbarLayoutImpl` / `ToolbarLayout`)
- Base Superclass: `Landroid/widget/FrameLayout;`

### 1.3 Exact Smali Call Sites & Descriptors

#### A) Toolbar Initialization & Inflation
- **Class**: `Lorg/chromium/chrome/browser/toolbar/top/ToolbarPhone;`
- **Method**: `public final onFinishInflate()V`
- **Anchor**:
  - `const-string v0, "ToolbarPhone.onFinishInflate"`
  - `invoke-super {p0}, Lcr2;->onFinishInflate()V`
  - `const v2, 0x7f0110f9` (`R.id.toolbar_buttons`)
- **Injection Offset**:
  Directly after `invoke-super {p0}, Lcr2;->onFinishInflate()V` (or right after `p0.I0` is assigned).
- **Injection Logic**:
  ```smali
  # v2 is toolbar_buttons ViewGroup
  const v1, 0x7f011042 # R.id.tab_switcher_button
  invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;
  move-result-object v1
  invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I
  move-result v1 # Index immediately preceding tab switcher
  # Instantiate/inflate CustomDownloadButton and addView(view, v1)
  ```

#### B) Dynamic Theme & Tint Synchronization
- **Target Button Class**: `Lorg/chromium/chrome/browser/toolbar/top/ToggleTabStackButton;`
- **Method**: `public final i(I)V`
- **Parameters**:
  - `p1` (`I`): `brandedColorScheme` (`0` = Default Light, `1` = Dark, `2` = Incognito, `3` = Themed).
- **Anchor**:
  - `invoke-static {v1, p1, v2}, Liek;->b(Landroid/content/Context;IZ)Landroid/content/res/ColorStateList;`
  - `invoke-virtual {v0, v1}, Likk;->b(Landroid/content/res/ColorStateList;)V`
- **Action**: Whenever `i(I)V` is invoked on `tab_switcher_button`, retrieve the exact active `ColorStateList` via `Liek;->b(Context, p1, true)` and apply to our custom download button. This guarantees 100% color synchronization across Light, Dark, and Incognito themes.

#### C) URL Bar Focus & Bottom Toolbar State Toggles
1. **URL Bar Focus / Omnibox Typing Animation (Primary)**:
   - **Class**: `Lorg/chromium/chrome/browser/toolbar/top/ToolbarPhone;`
   - **Method**: `public final d3(Z)V`
   - **Parameters**: `p1` (`Z`): `true` when URL bar is focused (user typing in Omnibox), `false` when restored.
   - **Anchor**:
     - `const-string v6, "ToolbarPhone.triggerUrlFocusAnimation"`
   - **Injection Offset**: Method entry (offset line 1).
   - **Action**: Call `customButton.setVisibility(p1 ? View.GONE : View.VISIBLE)` (or animate alpha) so the button cleanly hides while the Omnibox expands.

2. **Bottom Toolbar State (Secondary)**:
   - **Class**: `Lcr2;` (superclass of `ToolbarPhone`)
   - **Method**: `public final S0(Z)V`
   - **Parameters**: `p1` (`Z`): `true` when bottom toolbar mode is active, `false` otherwise.
   - **Critical Register Note**: Inside `S0(Z)V`, register `p1` is clobbered mid-method by `const p1, 0x7f011042`. Any hook MUST be injected at **method entry** before `p1` is overwritten.

---

## 2. Active Tab & Lifecycle Hooks

### 2.1 Tab Access Chain
- `ChromeTabbedActivity` (`Lorg/chromium/chrome/browser/ChromeTabbedActivity;`) inherits from `Lfo3;`.
- Field `Lfo3;->Y0:Lorg/chromium/chrome/browser/ActivityTabProvider;`.
- `ActivityTabProvider` implements `Supplier<Tab>`:
  - Exact method: `Lorg/chromium/chrome/browser/ActivityTabProvider;->g()Lorg/chromium/chrome/browser/tab/Tab;` (or bridge `get()Ljava/lang/Object;`).

### 2.2 Tab Instance Accessors (Unmangled in `Lorg/chromium/chrome/browser/tab/Tab;`)
- `tab.getId()`: `invoke-interface {p0}, Lorg/chromium/chrome/browser/tab/Tab;->getId()I`
- `tab.getUrl()`: `invoke-interface {p0}, Lorg/chromium/chrome/browser/tab/Tab;->getUrl()Lorg/chromium/url/GURL;`
  - Get Spec string: `invoke-virtual {v0}, Lorg/chromium/url/GURL;->i()Ljava/lang/String;` (or `GURL.getSpec()`)
- `tab.getWebContents()`: `invoke-interface {p0}, Lorg/chromium/chrome/browser/tab/Tab;->getWebContents()Lorg/chromium/content_public/browser/WebContents;`
- `tab.isIncognito()`: `invoke-interface {p0}, Lorg/chromium/chrome/browser/tab/Tab;->isIncognito()Z`

### 2.3 Lifecycle Hook Points

| Event | Target Class & Method | Anchor / Signature | Action |
|:---|:---|:---|:---|
| **Main-Frame Nav Start** | `Lr1k;->didStartNavigationInPrimaryMainFrame(Lorg/chromium/content_public/browser/NavigationHandle;)V` | `iget-object p0, p0, Lr1k;->v:Ls1k;`<br>`iget-object v0, p0, Ls1k;->v:Lorg/chromium/chrome/browser/tab/TabImpl;` | Clear per-tab media list in registry + reset badge count to 0 (Tab directly accessible via `r1k.v.v`) |
| **Page Load / Nav Finish** | `Lr1k;->didFinishNavigationInPrimaryMainFrame(Lorg/chromium/content_public/browser/NavigationHandle;)V` | `iget-object p0, p0, Lr1k;->v:Ls1k;`<br>`iget-object v1, p0, Ls1k;->v:Lorg/chromium/chrome/browser/tab/TabImpl;` | Check `NavigationHandle.hasCommitted()`; inject sniffer script & ensure JS bridge is bound |
| **Active Tab Switch** | `Lorg/chromium/chrome/browser/ActivityTabProvider;->k(Lorg/chromium/chrome/browser/tab/Tab;)V` | `invoke-virtual {p0, p1}, Ll4d;->set(Ljava/lang/Object;)V` | Retrieve `tab.getId()`; update toolbar button badge count to active tab |
| **Tab Closed / Evicted** | `Lorg/chromium/chrome/browser/tab/TabImpl;->destroyInternal(Z)I` | Entry of `destroyInternal(Z)I` in `TabImpl` | Retrieve `this.getId()`; evict tab entry from registry |

---

## 3. JS Injection & JS-to-Java Bridge Feasibility

### 3.1 Verified JS Execution & `JavascriptInjector` Audit
1. **Surviving Production JS Execution Methods on `WebContents`**:
   - While developer-facing `evaluateJavaScript(..., callback)` was inlined, the direct asynchronous JS execution method on `WebContents` survived intact:
     - **Interface**: `Lorg/chromium/content_public/browser/WebContents;->M(Ljava/lang/String;)V`
     - **Implementation**: `Lorg/chromium/content/browser/webcontents/WebContentsImpl;->M(Ljava/lang/String;)V`
     - **Underlying JNI Anchor**:
       ```smali
       # In WebContentsImpl.M(String script):
       const/16 p0, 0x56 # Opcode 86
       const/4 v2, 0x0   # Null callback
       invoke-static {p0, v0, v1, p1, v2}, LJ/N;->VJOO(IJLjava/lang/Object;Ljava/lang/Object;)V
       ```
     - Calling `webContents.M(script)` asynchronously executes arbitrary JavaScript on the page's main frame without requiring a callback interface.
   - **High-Level Fallback**:
     - `Lorg/chromium/chrome/browser/tab/Tab;->k(Lorg/chromium/content_public/browser/LoadUrlParams;)Leyi;` passing `new LoadUrlParams(0, "javascript:" + script)` provides a robust secondary execution path.

2. **Factory Call for `JavascriptInjectorImpl`**:
   - In Chromium/Brave, `JavascriptInjectorImpl` is retrieved from `WebContents` via UserDataHost factory helper `k0a`:
     ```smali
     const-class v1, Lorg/chromium/content/browser/JavascriptInjectorImpl;
     sget-object v2, Ll0a;->a:Lk0a;
     invoke-interface {v0, v1, v2}, Lorg/chromium/content_public/browser/WebContents;->H1(Ljava/lang/Class;Lv7m;)Lyll;
     move-result-object v0
     check-cast v0, Lorg/chromium/content/browser/JavascriptInjectorImpl;
     ```

3. **Wildcard OriginMatcher Construction (`"*"`)**:
   - Verified from `LensOverlayCoordinator.smali:1131-1189`:
     ```smali
     new-instance v5, Lorg/chromium/components/origin_matcher/OriginMatcher;
     invoke-direct {v5}, Lorg/chromium/components/origin_matcher/OriginMatcher;-><init>()V
     # Add "*" to List<String>
     invoke-virtual {v5, listWithWildcard}, Lorg/chromium/components/origin_matcher/OriginMatcher;->c(Ljava/util/List;)Ljava/util/List;
     # Register bridge:
     invoke-virtual {v0, bridgeObject, "BraveMediaBridge", v5}, Lorg/chromium/content/browser/JavascriptInjectorImpl;->a(Ljava/lang/Object;Ljava/lang/String;Lorg/chromium/components/origin_matcher/OriginMatcher;)V
     ```

### 3.2 Definitive Bridge Architecture: Hybrid Push-Pull Bridge
- **JS Injection**: `WebContents.M(snifferScript)` is called on page load commit.
- **Data Reporting**: The sniffer JavaScript pushes detected media payloads in real time:
  ```javascript
  window.BraveMediaBridge.onMediaFound(JSON.stringify(mediaObject));
  ```
- **Bidirectional Control**: Java can issue runtime commands (e.g. "rescan images", "seek video") via `WebContents.M(commandScript)`. Zero polling overhead, real-time toolbar badge updates.

### 3.3 Cookies & User-Agent Retrieval
1. **Cookies**:
   - Chromium does **not** use `android.webkit.CookieManager`.
   - Because our sniffer operates in the origin context, session cookies are retrieved directly in JS via `document.cookie` and passed over the `@JavascriptInterface` bridge alongside the media URL.
   - For HttpOnly cookies, Chromium exposes `Lorg/chromium/chrome/browser/cookies/CookiesFetcher;` (backed by native JNI `CookieManager`).
2. **User-Agent String**:
   - Can be passed directly from JS `navigator.userAgent` over the bridge.
   - In Java, the active browser user agent is retrieved via `ContentUtils` / `Lorg/chromium/ui/base/DeviceFormFactor;` or `Lorg/chromium/chrome/browser/tab/Tab;->getUserAgent()I` (checks Mobile vs Desktop override).

---

## 4. Theme Tokens & Manifest Diff

### 4.1 Theme Resource Tokens & Hex Fallbacks

| Element | Resource / Theme Token | Hex Fallback (Light / Dark / Incognito) |
|:---|:---|:---|
| **BottomSheet Surface** | `@color/system_surface_light` / `@color/system_surface_dark` | Light: `#FFFFFF` / Dark: `#1F1F1F` / Incognito: `#121212` |
| **Primary Text** | `@color/system_on_surface_light` / `@color/system_on_surface_dark` | Light: `#1F1F1F` / Dark: `#E3E3E3` / Incognito: `#FFFFFF` |
| **Secondary Text** | `@color/system_on_surface_variant_light` / `_dark` | Light: `#444746` / Dark: `#C4C7C5` / Incognito: `#9E9E9E` |
| **Accent / Badge Color** | Brave Orange Brand Color | `#FF5500` (or `#FB542B`) |
| **Chip Background** | `?attr/colorSurfaceContainerHigh` | Light: `#ECE6F0` / Dark: `#2B2930` |
| **Ripple Drawable** | `?android:attr/selectableItemBackgroundBorderless` | Platform default ripple |

### 4.2 Manifest Permissions & Service Diff
Audit of `AndroidManifest.xml` indicates:
- `android.permission.POST_NOTIFICATIONS` is **already present** (line 33).
- `android.permission.FOREGROUND_SERVICE` is **already present** (line 25).
- `android.permission.FOREGROUND_SERVICE_DATA_SYNC` is **already present** (line 28).

#### `<service>` Diff Required for `AndroidManifest.xml`:
```xml
<!-- Injected under <application> -->
<service
    android:name="dev.brave.extension.media.MediaDownloadService"
    android:exported="false"
    android:foregroundServiceType="dataSync" />
```
*Note: Canonical extension package is `dev.brave.extension.*`.*

---

## 5. Morphe Fingerprint Blueprint Specifications

### Blueprint 1: `ToolbarPhoneInflateFingerprint`
- **Target Purpose**: Inject custom media downloader button into top toolbar.
- **Class**: `Lorg/chromium/chrome/browser/toolbar/top/ToolbarPhone;`
- **Method**: `onFinishInflate()V`
- **Access Flags**: `public final` (`0x0011`)
- **Return Type**: `V`
- **Parameter Types**: None
- **Fingerprint Anchors**:
  - `const-string v0, "ToolbarPhone.onFinishInflate"`
  - `invoke-super {p0}, Lcr2;->onFinishInflate()V`
  - `const v2, 0x7f0110f9` (`R.id.toolbar_buttons`)
- **Register / Strategy**:
  - Inject immediately after `invoke-super {p0}, Lcr2;->onFinishInflate()V`.
  - Pass `p0` (`ToolbarPhone`) directly: `invoke-static {p0}, Lcom/brave/media/downloader/ToolbarHook;->onToolbarInflated(Landroid/view/ViewGroup;)V`.
  - Java hook resolves `findViewById(0x7f0110f9)` (`toolbar_buttons`) and inserts the button before `0x7f011042` (`tab_switcher_button`), avoiding volatile field dependencies.

### Blueprint 2: `ToolbarTintFingerprint`
- **Target Purpose**: Sync custom button icon color with browser theme & incognito state.
- **Class**: `Lorg/chromium/chrome/browser/toolbar/top/ToggleTabStackButton;`
- **Method**: `i(I)V`
- **Access Flags**: `public final` (`0x0011`)
- **Return Type**: `V`
- **Parameter Types**: `I` (`brandedColorScheme`)
- **Fingerprint Anchors**:
  - `iget-object v0, p0, Lorg/chromium/chrome/browser/toolbar/top/ToggleTabStackButton;->G:Lcxj;`
  - `invoke-static {v1, p1, v2}, Liek;->b(Landroid/content/Context;IZ)Landroid/content/res/ColorStateList;`
- **Register / Strategy**:
  - Inject at entry of `ToggleTabStackButton->i(I)V`.
  - `p1` = `brandedColorScheme` (`0` = Light, `1` = Dark, `2` = Incognito).
  - Call hook: `Lcom/brave/media/downloader/ToolbarHook;->onColorSchemeChanged(I)V`. The hook invokes `Liek;->b(context, p1, true)` to obtain the identical `ColorStateList` applied to the tab switcher.

### Blueprint 3: `ToolbarUrlFocusFingerprint`
- **Target Purpose**: Hide downloader button when user is typing in Omnibox.
- **Class**: `Lorg/chromium/chrome/browser/toolbar/top/ToolbarPhone;`
- **Method**: `d3(Z)V`
- **Access Flags**: `public final` (`0x0011`)
- **Return Type**: `V`
- **Parameter Types**: `Z`
- **Fingerprint Anchors**:
  - `const-string v6, "ToolbarPhone.triggerUrlFocusAnimation"`
  - `iget-object v3, v0, Lorg/chromium/chrome/browser/toolbar/top/ToolbarPhone;->S0:Landroid/animation/AnimatorSet;`
- **Register / Strategy**:
  - Inject at method entry (line 1 before any register manipulation).
  - `p1` = `boolean z` (`true` when focused/typing, `false` when restored).
  - Call hook: `Lcom/brave/media/downloader/ToolbarHook;->onUrlFocusChange(Z)V`.

### Blueprint 4: `ActiveTabSwitchFingerprint`
- **Target Purpose**: Update toolbar badge count when user switches active tabs.
- **Class**: `Lorg/chromium/chrome/browser/ActivityTabProvider;`
- **Method**: `k(Lorg/chromium/chrome/browser/tab/Tab;)V`
- **Access Flags**: `public final` (`0x0011`)
- **Return Type**: `V`
- **Parameter Types**: `Lorg/chromium/chrome/browser/tab/Tab;`
- **Fingerprint Anchors**:
  - `iget-object v0, p0, Lorg/chromium/chrome/browser/ActivityTabProvider;->u:Lrfa;`
  - `invoke-virtual {p0, p1}, Ll4d;->set(Ljava/lang/Object;)V`
- **Register / Strategy**:
  - Inject before `return-void`.
  - `p1` = active `Tab` (or null).
  - Call hook: `Lcom/brave/media/downloader/TabLifecycleHook;->onActiveTabChanged(Lorg/chromium/chrome/browser/tab/Tab;)V`.

### Blueprint 5: `NavigationStartFingerprint`
- **Target Purpose**: Reset tab media list and clear badge count on new page load with full Tab context.
- **Class**: `Lr1k;` (TabWebContentsObserver implementation)
- **Method**: `didStartNavigationInPrimaryMainFrame(Lorg/chromium/content_public/browser/NavigationHandle;)V`
- **Access Flags**: `public final` (`0x0011`)
- **Return Type**: `V`
- **Parameter Types**: `Lorg/chromium/content_public/browser/NavigationHandle;`
- **Fingerprint Anchors**:
  - `iget-object p0, p0, Lr1k;->v:Ls1k;`
  - `iget-object v0, p0, Ls1k;->v:Lorg/chromium/chrome/browser/tab/TabImpl;`
  - `invoke-interface {v0, v2, p1}, Lznj;->f0(Lorg/chromium/chrome/browser/tab/Tab;Lorg/chromium/content_public/browser/NavigationHandle;)V`
- **Register / Strategy**:
  - Inject at method entry.
  - Access `Tab`: `iget-object v0, p0, Lr1k;->v:Ls1k; iget-object v0, v0, Ls1k;->v:Lorg/chromium/chrome/browser/tab/TabImpl;`
  - Call hook: `Lcom/brave/media/downloader/TabLifecycleHook;->onNavigationStarted(Lorg/chromium/chrome/browser/tab/Tab;Lorg/chromium/content_public/browser/NavigationHandle;)V`.

### Blueprint 6: `NavigationFinishFingerprint`
- **Target Purpose**: Bind JS bridge and inject media sniffer script when navigation completes with full Tab context.
- **Class**: `Lr1k;` (TabWebContentsObserver implementation)
- **Method**: `didFinishNavigationInPrimaryMainFrame(Lorg/chromium/content_public/browser/NavigationHandle;)V`
- **Access Flags**: `public final` (`0x0011`)
- **Return Type**: `V`
- **Parameter Types**: `Lorg/chromium/content_public/browser/NavigationHandle;`
- **Fingerprint Anchors**:
  - `iget-object p0, p0, Lr1k;->v:Ls1k;`
  - `iget-object v1, p0, Ls1k;->v:Lorg/chromium/chrome/browser/tab/TabImpl;`
  - `invoke-interface {v0, v1, p1}, Lznj;->r(Lorg/chromium/chrome/browser/tab/Tab;Lorg/chromium/content_public/browser/NavigationHandle;)V`
- **Register / Strategy**:
  - Inject at method entry.
  - Access `Tab`: `iget-object v0, p0, Lr1k;->v:Ls1k; iget-object v0, v0, Ls1k;->v:Lorg/chromium/chrome/browser/tab/TabImpl;`
  - Call hook: `Lcom/brave/media/downloader/TabLifecycleHook;->onNavigationFinished(Lorg/chromium/chrome/browser/tab/Tab;Lorg/chromium/content_public/browser/NavigationHandle;)V`.

### Blueprint 7: `TabDestroyFingerprint`
- **Target Purpose**: Evict closed tab from in-memory media registry to prevent leaks.
- **Class**: `Lorg/chromium/chrome/browser/tab/TabImpl;`
- **Method**: `destroyInternal(Z)I`
- **Access Flags**: `public final` (`0x0011`)
- **Return Type**: `I`
- **Parameter Types**: `Z`
- **Fingerprint Anchors**:
  - Method name: `destroyInternal`
  - String / Constant: `onAlertStateChanged(-1)`
- **Register / Strategy**:
  - Inject at method entry.
  - `p0` = `TabImpl`.
  - Call hook: `Lcom/brave/media/downloader/TabLifecycleHook;->onTabDestroyed(Lorg/chromium/chrome/browser/tab/Tab;)V`.
