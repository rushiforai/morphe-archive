# AfterShip Patch Specification

## Overview

This document describes the Morphe bytecode and resource patches available for **AfterShip: Package Tracker** (`com.aftership.AfterShip`).

| Patch | Type | Default | Description |
|---|---|---|---|
| **Add Copy Tracking Number Option** | `bytecodePatch` | `true` | Adds an option to copy tracking numbers in the multi-shipment selection menu. |
| **Bypass Native Signature Check** | `rawResourcePatch` | `true` | Neutralizes native `checkApkSha` in `libandroidsig-lib.so` so API requests succeed on custom-signed builds. |
| **Custom Google Maps API Key** | `resourcePatch` | `false` | Replaces the embedded Google Maps API key with a personal Google Cloud API key so native Google Maps renders on re-signed builds. Note: To use native Google Maps, disable the OpenStreetMap Drop-in Replacement patch. |
| **Full AMOLED Theme** | `resourcePatch` | `true` | Themes AfterShip in pure AMOLED black by removing dark gray backgrounds from the bottom navigation bar, account items, cards, and windows. |
| **Hide Broken Tracking Map** | `bytecodePatch` | `false` | Suppresses the unauthenticated blank white Google Maps view when neither a custom Google Maps API key nor OpenStreetMap is used. |
| **OpenStreetMap Drop-in Replacement** | `bytecodePatch` | `true` | Replaces the broken Google Maps view with a Leaflet/OpenStreetMap engine that renders routes, checkpoints, and day/night styled tiles without requiring an API key. |
| **Remove Ads and Tracking** | `bytecodePatch` | `true` | Neutralizes in-app advertisements (Disco Network SDK shopping/cashback ads and list placements), removes the 'Leave us a 5-star review' in-app rating prompt dialogs, zeros the Google Play Advertising ID (AAID), disables first-party behavioral and impression analytics (StatisticsCenter, AbsListImpEventHelper, AutoUploadManager), and blocks diagnostic telemetry (Firebase Analytics, Crashlytics, Logan logging). |
| **Remove AfterShip Account Page Links** | `bytecodePatch` | `true` | Removes About the app, Share the app, and Feedback links from the Account screen. |
| **Remove Feedback** | `bytecodePatch` | `true` | Removes feedback prompts, Feedback buttons, and star rating component on shipments. |
| **Remove Login** | `bytecodePatch` | `true` | Forces permanent guest mode, removes login carousels and buttons, and suppresses login prompts. |
| **Remove Shipment Sync** | `bytecodePatch` | `true` | Removes email shipment synchronization features, including prompts, banners, dialogs, empty state sync cards, and account settings. |
---

## Patch: Add Copy Tracking Number Option

- **Name:** Add Copy Tracking Number Option
- **Target Package:** `com.aftership.AfterShip`
- **Supported Versions:** `5.25.8` (VersionCode: `52580`+)
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`) with Extension DEX (`extendWith`)
- **Dependencies:** `Bypass Native Signature Check`

### 1. Motivation & Purpose

In AfterShip, activating the multi-selection mode on the Home screen displays a bottom action bar with only "Mark as delivered" and "Delete". When all selected shipments are already delivered, "Mark as delivered" is disabled, leaving "Delete" as the only action.

The **Add Copy Tracking Number Option** patch dynamically inserts a **Copy** action into the bottom action bar directly to the left of the "Delete" button. When selected:
- Extracts tracking numbers from all currently selected shipments.
- Filters blank entries and deduplicates duplicate numbers while preserving selection order.
- Joins the tracking numbers with newlines and copies them to the system clipboard (`android.content.ClipboardManager`).
- Displays a confirmation `Toast` indicating the number of copied tracking numbers (e.g. `"Tracking number copied to clipboard"` or `"3 tracking numbers copied to clipboard"`).
- Automatically exits multi-selection mode, mirroring native AfterShip action workflows.

### 2. Technical Implementation & Bytecode Hook

The patch injects `app.aidan.extension.aftership.CopyTrackingBridge` into the Dalvik DEX:

1. **`HomeActivity.S2(ZZZZ)V` Hook:**
   `HomeActivity.S2(ZZZZ)V` updates the bottom action bar buttons (`multi_mark` and `multi_delete`) whenever multi-selection is toggled or selected items change:
   - `p1`: `isMarkVisible`
   - `p2`: `isMarkEnabled`
   - `p3`: `isDeleteVisible`
   - `p4`: `isDeleteEnabled`

   The patch injects a call directly before `return-void`:
   ```smali
   invoke-static {p0, p3, p4}, Lapp/aidan/extension/aftership/CopyTrackingBridge;->onUpdateButtons(Landroid/app/Activity;ZZ)V
   ```

2. **Dynamic UI Injection & Theme Synchronization (`CopyTrackingBridge`):**
   - Finds `multi_delete` (`0x7f0a0303`) and its parent `LinearLayout`.
   - Lazily creates and inserts a matching `FrameLayout` containing a "Copy" `TextView` immediately before `multi_delete`.
   - Clones text size, font typeface, and color state lists (`ColorStateList`) from sibling action buttons (`multi_mark_tv` / `multi_delete_tv`), ensuring seamless dark/light mode theming and active/disabled state colors.
   - Reflectively accesses `TrackingListTabPresenter.calculateMultiSelectedItems()` to extract tracking numbers from `ShipmentItemEntity.p` (with fallback to `c`).
   - Exits multi-selection mode by invoking `TrackingListFragment.j0()`.

---

## Patch: OpenStreetMap Drop-in Replacement

- **Name:** OpenStreetMap Drop-in Replacement
- **Target Package:** `com.aftership.AfterShip`
- **Supported Versions:** `5.25.8` (VersionCode: `52580`+)
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`) with Extension DEX (`extendWith`)
- **Dependencies:** `Bypass Native Signature Check`

### 1. Motivation & Purpose

When AfterShip is patched and re-signed by Morphe, the embedded Google Maps API key fails authorization with Google Play Services (`ApiTokenService`), leaving the map on a permanent unrendered white canvas. While the `Custom Google Maps API Key` patch allows users to supply their own Google Cloud API key, most users do not want the friction of setting up a Google Cloud billing account, enabling the Maps SDK, and generating API keys.

- **Zero API Keys Required:** Renders an injected `android.webkit.WebView` running Leaflet 1.9.4 and standard OpenStreetMap raster tiles (`https://tile.openstreetmap.org/{z}/{x}/{y}.png`).
- **Visual Parity with Native Google Maps:**
  - **Dark Mode:** Automatically applies high-contrast dark CSS tile filtering (`brightness(0.6) invert(1) contrast(2.5) hue-rotate(190deg) saturate(0.25) brightness(0.85);`) with `#121212` backgrounds, matching AfterShip's native night theme.
  - **Light Mode:** Applies clean light CSS tile filtering (`brightness(1.02) contrast(1.05) saturate(0.85);`) with `#f5f5f5` backgrounds.
- **Dynamic Accent Polylines:** Renders the shipment route connecting all carrier checkpoints using the parcel's status color (`a3().e()`, e.g. `#53BD77` for delivered, `#FD5B26` for in-transit).
- **Custom Pulse & Checkpoint Markers:**
  - Active/latest delivery location renders a smooth CSS `@keyframes pulse-anim` halo and solid center marker.
  - Intermediate checkpoints render clean circular waypoint dots (`#9E9E9E`).
- **Smart Camera Bounds:** Automatically centers and bounds the viewport around all checkpoints with top and bottom offsets (`SlidingUpPanelLayout` clearance).
### 2. Configuration Option

| Option Key | Type | Default | Description |
|---|---|---|---|
| `addZoomButtons` | `Boolean` | `false` | Displays floating `+` and `−` zoom buttons on the map. |

### 3. Technical Implementation & Bytecode Hook

The patch injects `extensions/extension.mpe` containing `app.aidan.extension.aftership.OsmMapBridge` and `OsmMapView`.

In `TrackingMapFragment` (`LA6/c0;`), the map setup method `b3()V` is hooked to dispatch to `OsmMapBridge.updateMap`:

```smali
const/4 v0, 0x0 # or 0x1 if addZoomButtons is enabled
invoke-static {p0, v0}, Lapp/aidan/extension/aftership/OsmMapBridge;->updateMap(Ljava/lang/Object;Z)V
return-void
```
`OsmMapBridge` inspects the fragment's ViewModel (`G6.i` via `a3()`), extracts coordinate pairs from `geoList` (or nested coordinate fields in `f()`), and injects or updates `OsmMapView` inside `tracking_map_container` (`0x7f0a0512`). The embedded WebView enables JavaScript, DOM storage, database, and cache. If no coordinates are available, it displays AfterShip's native fallback card (`tracking_map_default_img` / `tracking_map_tips_tv`).
---

## Patch: Full AMOLED Theme

- **Name:** Full AMOLED Theme
- **Target Package:** `com.aftership.AfterShip`
- **Supported Versions:** `5.25.8` (VersionCode: `52580`+)
- **Default State:** `true` (Enabled by default)
- **Type:** Android XML Resource Patch (`resourcePatch`)
- **Dependencies:** `Bypass Native Signature Check`

### 1. Motivation & Purpose

In default dark mode, AfterShip uses prominent dark gray backgrounds across key UI components:
- The bottom navigation bar uses `#ff272727` (`color_bottom_tab_background`).
- Account item rows and home guide cards use `#333333` (`white_highlight`).
- Window and activity backgrounds use `#121212` (`color_windows_background`, `color_f6f6f6`).
- Transit calculation, insurance containers, and connector platform cards use various shades of dark gray (`#3e4042`, `#2b2f33`, `#f01d1d1d`).

This creates visual inconsistency with sub-screens such as Language and Notifications, which already render against pure AMOLED black (`#000000`).

The **Full AMOLED Theme** patch modifies dark mode color definitions in `res/values-night/colors.xml` to pure `#000000`, creating a seamless, high-contrast, pure AMOLED black experience throughout the entire application.

---

### 2. Technical Implementation & XML Resource Modifications

The patch opens `res/values-night/colors.xml` and mutates the text content of matching `<color>` elements:

| Color Resource Name | Original Night Hex | Patched Hex | Target UI Component |
|---|---|---|---|
| `color_bottom_tab_background` | `#ff272727` | `#000000` | Bottom navigation bar (`layout_home_navigation_view.xml`) |
| `white_highlight` | `#333333` | `#000000` | Account items (`account_item_layout.xml`), Account header (`fragment_account.xml`), Home guide cards (`layout_guide_add_item_view.xml`, `layout_guide_sync_item_view.xml`), Transit calc (`activity_calc_transit_time.xml`) |
| `color_f6f6f6` | `#121212` | `#000000` | Account spacers (`fragment_account.xml`), Order details (`layout_activity_order_details.xml`), Report issue (`activity_report_issue.xml`), Location picker |
| `color_windows_background` | `#121212` | `#000000` | Window background across all activities (`Theme.AppCompat.DayNight` in `styles.xml`) |
| `tracking_detail_holder_bg_color` | `#121212` | `#000000` | Shipment tracking detail view holder |
| `color_0a000000` | `#f01d1d1d` | `#000000` | Transit time cards (`tracking_transit_time_out_bg.xml`) and status cards (`tracking_final_status_message_bg.xml`) |
| `background_quaternary_color` | `#3e4042` | `#000000` | Connector platform shapes (`shape_connector_platform_*.xml`) |
| `insurance_card_container_bg` | `#3e4042` | `#000000` | Insurance card container (`layout_activity_insurance_detail.xml`) |
| `insurance_page_bg` | `#2b2f33` | `#000000` | Insurance page background (`layout_activity_insurance_detail.xml`) |

#### Contrast Preservation Invariants
Text resources (`color_base_text0` -> `#ffffff`, `color_base_text4` -> `#52ffffff`, `color_99000000` -> `#99ffffff`, `black` -> `#ffffff`) and dividers (`color_divider` -> `#1fffffff`, `outline_primary_color` -> `#1fffffff`) in `res/values-night/colors.xml` are already tuned for dark/black surfaces in the base APK and remain untouched.

---
## Patch: Bypass Native Signature Check

- **Name:** Bypass Native Signature Check
- **Target Package:** `com.aftership.AfterShip`
- **Supported Versions:** `5.25.8` (VersionCode: `52580`+)
- **Default State:** `true` (Enabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None

### 1. Motivation & Purpose

AfterShip's backend requires HMAC-SHA256 request signature headers generated by `libandroidsig-lib.so` (`SigEntity.nativeGenerateSignature`). In unpatched binaries, the native C++ function `_Z11checkApkShaP7_JNIEnvP8_jobjectS2_h` queries the Android `PackageManager` for package signatures and verifies that the app's signing certificate matches AfterShip's official production keystore (`SHA-256: 425c56b57ac5ff3e1e7f7b49e246dfa350db1a8d7403e2638e9d4f85c134449f`).

When an APK is patched and re-signed by Morphe with custom or debug keys, `checkApkSha` fails, causing all signed API requests (including guest token generation `/guest/generate-token`) to be rejected by AfterShip's API gateway.

The **Bypass Native Signature Check** patch neutralizes `checkApkSha` across all supported native architectures so API requests succeed on custom-signed builds.

### 2. Technical Implementation & Binary Modifications

#### Binary Patch Sites (`libandroidsig-lib.so`)
The patch overrides the prologue of `checkApkSha` in both arm64-v8a and armeabi-v7a to immediately return `true` (`1`):

1. **`lib/arm64-v8a/libandroidsig-lib.so` (Offset `0x48dd8`):**
   - **Expected Bytes:** `ff 43 02 d1 f7 2b 00 f9` (`sub sp, sp, #0x90; str x23, [sp, #0x28]`)
   - **Replacement Bytes:** `20 00 80 52 c0 03 5f d6` (`mov w0, #1; ret`)
2. **`lib/armeabi-v7a/libandroidsig-lib.so` (Offset `0x3d54c`):**
   - **Expected Bytes:** `f0 b5 03 af` (`push {r4-r7, lr}; sub sp, ...`)
   - **Replacement Bytes:** `01 20 70 47` (`movs r0, #1; bx lr`)

The patch enforces byte verification: if the target binary is already patched, it succeeds idempotently; if byte patterns do not match expected opcodes, it fails fast by throwing `PatchException`.


---

## Patch: Remove Login

- **Name:** Remove Login
- **Target Package:** `com.aftership.AfterShip`
- **Supported Versions:** `5.25.8` (VersionCode: `52580`+)
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Dependencies:** `Bypass Native Signature Check`

### 1. Motivation & Purpose

On first install, AfterShip blocks the user with `LoginRegisterStateActivity`, presenting:
1. Fullscreen promotional carousels.
2. Prominent third-party and native login buttons ("CONTINUE WITH GOOGLE", Outlook icon, Email icon).
3. Terms of use and Privacy Policy acceptance text.
4. A small "Continue as guest" button (`login_register_skip_tv`) in the top right header.

Furthermore, throughout normal usage:
- The **Account tab** features a large "SIGN UP/LOGIN" card (`account_header_ll`) and an "Account" menu item (`layout_account`) that repeatedly prompts the user to authenticate.
- When an anonymous user tracks 2 shipments, `HomePresenter` triggers `AnonymousGuideLoginDialogFragment` (`M5.e`), displaying a persistent popup urging the user to link Google or Outlook for email synchronization.

The **Remove Login** patch transforms AfterShip into a seamless guest-first package tracker:
- **Instant Guest Onboarding:** On first launch, the app skips the login screen and immediately initializes an anonymous guest session, navigating directly to the main tracking interface (`HomeActivity`).
- **Elimination of Login Components:** The Google, Outlook, Email, and carousel views are never inflated or displayed.
- **De-bloated Account Tab:** The "SIGN UP/LOGIN" header and "Account" menu item are completely hidden (`View.GONE`), displaying only functional utility settings (Add orders automatically, Notifications, Language, About, Feedback).
- **Suppression of Login Nags:** The 2-shipment login prompt dialog and copy-from-email sync prompts are permanently neutralized.

---

## 2. Technical Implementation & Bytecode Modifications

### Modification 1: Force Guest Flow in `LoginRegisterStateActivity`
- **Class:** `Lcom/aftership/shopper/views/login/LoginRegisterStateActivity;`
- **Method:** `onCreate(Landroid/os/Bundle;)V`

#### Original Behavior:
Instantiates `AsyncLayoutInflater` (`p.a`), queues `layout_login_register_carousel_a` (`0x7f0d00c1`) onto an async thread, binds Google/Outlook/Email click listeners, and waits for manual user interaction.

#### Patched Behavior:
Replaces the body of `onCreate` to execute the exact guest flow defined in `A6.M` (case 7):
1. Invokes `super.onCreate(bundle)`.
2. Registers with `EventBus.getDefault()`.
3. Sets account auth intent to `d8.b.a.ANONYMOUS` (`sget-object v0, Ld8/b$a;->f:Ld8/b$a; iput-object v0, p0, Lcom/aftership/shopper/views/login/LoginRegisterStateActivity;->r:Ld8/b$a;`).
4. Evaluates `LB4/h;->W()Z` (checks if an anonymous token is already cached):
   - **If true:** Fetches the launch intent and redirects immediately to `HomeActivity.W2(this, getIntent())`, finishing `LoginRegisterStateActivity`.
   - **If false:** Obtains the MVP presenter `L1()` (`LoginRegisterPresenter`) and calls `generateAnonymousToken()`. The presenter queries the backend `/guest/generate-token` endpoint, persists the token in `account_config.xml`, and fires `r2()` (`RouterActivity.V2(...)`), which routes to `HomeActivity` and finishes the login activity.
5. Asynchronous inflation of `layout_login_register_carousel_a` is completely bypassed, ensuring login controls are never created in memory or drawn to the display.

```smali
invoke-super {p0, p1}, Lcom/aftership/common/mvp/base/abs/AbsCommonActivity;->onCreate(Landroid/os/Bundle;)V

invoke-static {}, Lorg/greenrobot/eventbus/EventBus;->getDefault()Lorg/greenrobot/eventbus/EventBus;
move-result-object v0
invoke-virtual {v0, p0}, Lorg/greenrobot/eventbus/EventBus;->register(Ljava/lang/Object;)V

sget-object v0, Ld8/b$a;->f:Ld8/b$a;
iput-object v0, p0, Lcom/aftership/shopper/views/login/LoginRegisterStateActivity;->r:Ld8/b$a;

invoke-static {}, LB4/h;->W()Z
move-result v0
if-eqz v0, :cond_gen_token

invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
move-result-object v0
invoke-static {p0, v0}, Lcom/aftership/shopper/views/home/HomeActivity;->W2(Lcom/aftership/common/mvp/base/abs/AbsCommonActivity;Landroid/content/Intent;)V
invoke-virtual {p0}, Landroid/app/Activity;->finish()V
return-void

:cond_gen_token
invoke-virtual {p0}, Lcom/aftership/shopper/views/login/LoginRegisterStateActivity;->L1()Lcom/aftership/shopper/views/login/contract/ILoginRegisterContract$AbsLoginRegisterPresenter;
move-result-object v0
invoke-virtual {v0}, Lcom/aftership/shopper/views/login/contract/ILoginRegisterContract$AbsLoginRegisterPresenter;->generateAnonymousToken()V
return-void
```

---

### Modification 2: Remove Login Controls from Account Tab (`AccountFragment`)
- **Class:** `LN5/k;` (`com.aftership.shopper.views.home.fragment.AccountFragment`)
- **Method:** `onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V`

#### Target Components:
- `c1702p.f31259d`: `LinearLayout` holding `account_header_ll` ("SIGN UP/LOGIN").
- `c1702p.f31261f.f5507b`: `View` root of `layout_account` ("Account" menu row).

#### Patched Behavior:
Injects bytecode after `super.onViewCreated` (fallback instruction index 3) to set both components to `View.GONE` (`0x8`):
```smali
const/16 v0, 0x8
iget-object v1, p0, LN5/k;->p:Lz2/p;
if-eqz v1, :cond_skip_account_patch
iget-object v2, v1, Lz2/p;->d:Landroid/widget/LinearLayout;
if-eqz v2, :cond_skip_header
invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V
:cond_skip_header
iget-object v1, v1, Lz2/p;->f:LM0/d;
if-eqz v1, :cond_skip_account_patch
iget-object v1, v1, LM0/d;->b:Ljava/lang/Object;
check-cast v1, Landroid/view/View;
if-eqz v1, :cond_skip_account_patch
invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V
:cond_skip_account_patch
```

---

### Modification 3: Suppress In-App Login Prompts & Nags

#### A. 2-Shipments Added Login Nag
- **Class:** `Lcom/aftership/shopper/views/home/presenter/HomePresenter;`
- **Method:** `handleAnonymousLoginBeforeAddTwoTracking()V`
- **Action:** Prepends `return-void` at instruction offset 0. Prevents the remote-config gate from firing `getView().e0()`.

#### B. Anonymous Guide Login Modal Dialog
- **Class:** `LM5/e;` (`com.aftership.shopper.views.dialog.AnonymousGuideLoginDialogFragment`)
- **Methods:**
  - `onStart()V`: Prepends `invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->dismissAllowingStateLoss()V` followed by `return-void`. Guarantees that if the dialog is instantiated through any edge-case navigation, it immediately dismisses without crashing on state loss.
  - `onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;`: Prepends `const/4 v0, 0x0 \n return-object v0`, preventing view hierarchy construction.
---

## Patch: Remove AfterShip Account Page Links

- **Name:** Remove AfterShip Account Page Links
- **Target Package:** `com.aftership.AfterShip`
- **Supported Versions:** `5.25.8` (VersionCode: `52580`+)
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)

### 1. Motivation & Purpose

The Account screen (`AccountFragment`) includes a group of non-essential navigation rows at the bottom:
1. **About the app** (`layout_about` / `R.string.navigation_drawer_menu_about`): Opens `AboutActivity`.
2. **Share the app** (`layout_share` / `R.string.account_item_share_text`): Dispatches an Android share intent with an AfterShip promotional URL.
3. **Feedback** (`layout_feedback` / `R.string.navigation_drawer_menu_feedback`): Opens `FeedbackActivity`.

The **Remove AfterShip Account Page Links** patch strips these three links from the Account screen by setting their root views to `View.GONE` (`0x8`) during fragment view creation, providing a streamlined and distraction-free interface containing only core app settings (Add orders automatically, Notifications, Language).

---

### 2. Technical Implementation & Bytecode Modifications

- **Class:** `LN5/k;` (`com.aftership.shopper.views.home.fragment.AccountFragment`)
- **Method:** `onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V`
- **Target Fields in `Lz2/p;` (ViewBinding):**
  - `e:LM0/d;`: Root wrapper for `layout_about` ("About the app")
  - `v:LM0/d;`: Root wrapper for `layout_share` ("Share the app")
  - `r:LM0/d;`: Root wrapper for `layout_feedback` ("Feedback")

#### Injected Bytecode:
The patch locates the `invoke-super` call in `onViewCreated` and inserts straight-line bytecode immediately following it:

```smali
const/16 v0, 0x8
iget-object v1, p0, LN5/k;->p:Lz2/p;

# About the app
iget-object v2, v1, Lz2/p;->e:LM0/d;
iget-object v2, v2, LM0/d;->b:Ljava/lang/Object;
check-cast v2, Landroid/view/View;
invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

# Share the app
iget-object v2, v1, Lz2/p;->v:LM0/d;
iget-object v2, v2, LM0/d;->b:Ljava/lang/Object;
check-cast v2, Landroid/view/View;
invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

# Feedback
iget-object v1, v1, Lz2/p;->r:LM0/d;
iget-object v1, v1, LM0/d;->b:Ljava/lang/Object;
check-cast v1, Landroid/view/View;
invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V
```

---

## Patch: Remove Feedback

- **Name:** Remove Feedback
- **Target Package:** `com.aftership.AfterShip`
- **Supported Versions:** `5.25.8` (VersionCode: `52580`+)
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Dependencies:** `Bypass Native Signature Check`

### 1. Motivation & Purpose

On shipment tracking detail views, AfterShip displays several user feedback and review mechanisms:
1. A floating feedback container (`floating_container_ll` in `layout_tracking_detail`) containing a "Feedback" button (`panel_up_report`) and interactive star ratings (`panel_up_review`) over the map.
2. A fallback "Report issue" / Feedback button (`report_issue_rl`) shown when no map is visible.
3. Interactive dialogs launching `FeedbackIssueActivity` and `ReviewDetailSheetFragment`.

The **Remove Feedback** patch eliminates all feedback prompts, buttons, star ratings, and review sheets from shipment detail screens.

### 2. Technical Implementation & Bytecode Modifications

1. **`TrackingDetailPresenter` helper (`LZ6/l;`):**
   - **Method:** `g(Lcom/aftership/shopper/views/shipment/adapter/ReviewEntity;Z)V`
   - **Action:** Injects bytecode setting `floating_container_ll` (`Lz2/x;->b:Landroid/widget/LinearLayout;`) and `report_issue_rl` (`Lz2/x;->p:Lz2/y;->c:Landroid/widget/RelativeLayout;`) to `View.GONE` (`0x8`) and returns immediately before review exposure telemetry is reported:
   ```smali
   const/16 v0, 0x8
   iget-object v1, p0, LZ6/l;->b:Lz2/x;
   if-eqz v1, :cond_skip_g
   iget-object v2, v1, Lz2/x;->b:Landroid/widget/LinearLayout;
   if-eqz v2, :cond_skip_floating_g
   invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V
   :cond_skip_floating_g
   iget-object v1, v1, Lz2/x;->p:Lz2/y;
   if-eqz v1, :cond_skip_g
   iget-object v1, v1, Lz2/y;->c:Landroid/widget/RelativeLayout;
   if-eqz v1, :cond_skip_g
   invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V
   :cond_skip_g
   return-void
   ```
2. **`TrackingDetailFragment` (`LA6/X;`):**
   - `k3()V` (starts `FeedbackIssueActivity`): Injects `return-void` at instruction index 0.
   - `l3(I)V` (opens `ReviewDetailSheetFragment`): Injects `return-void` at instruction index 0.

---

## Patch: Remove Shipment Sync

- **Name:** Remove Shipment Sync
- **Target Package:** `com.aftership.AfterShip`
- **Supported Versions:** `5.25.8` (VersionCode: `52580`+)
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Dependencies:** `Bypass Native Signature Check`

### 1. Motivation & Purpose

By default, AfterShip aggressively pushes users to connect their personal email accounts (Gmail, Outlook, etc.) to automatically scan and import package tracking numbers:
1. **Shipments Screen Toolbar Banner:** Displays a prominent banner urging: *"Enable email sync in order to add shipments automatically from your inbox."* with an **ENABLE** button (`R.string.google_grant_authorization_normal_content`, `R.string.common_dialog_enable`).
2. **Empty State Guide Card:** When the tracking list is empty, a *"Sync shipment"* card (`R.string.text_guide_sync_title`: *"Auto sync tracking from your email by one click."*) is shown alongside the manual *"Add shipment"* option.
3. **Account Screen Navigation Row:** The Account screen includes an *"Add orders automatically"* setting row (`layout_email` / `R.string.email_manage_add_orders_automatically`) that opens `EmailActivity`.
4. **Recurring Enable Sync Dialog:** A 7-day recurring popup modal dialog (`R.string.enable_email_syn_text`: *"Add shipments automatically from your inbox."*) interrupts the user.
5. **Add Shipment Screen Entrypoint:** The manual tracking creation screen includes a *"Copy tracking numbers from email"* button (`copy_tracking_number_ll`).
6. **Authorization Failure & Expiry Dialogs:** Alert dialogs and push triggers prompt for re-authorization (`R.string.google_grant_authorization_expired_dialog_content`, `R.string.google_grant_authorization_duplicate_dialog_content`, `R.string.email_grant_fail_dialog_title`).

The **Remove Shipment Sync** patch completely strips all email synchronization features, banners, guide cards, account options, and dialog prompts across the entire app.

### 2. Technical Implementation & Bytecode Modifications

1. **Account Screen Sync Entrypoint (`LN5/k;`):**
   - In `onViewCreated`, injects bytecode after the super call hiding `Lz2/p;->p` ("Add orders automatically" layout) by setting its root View to `View.GONE` (`0x8`).
2. **Shipments Toolbar Banner (`LY6/i;`):**
   - In `m3()V`, injects `return-void` at index 0, preventing toolbar sync banner inflation.
3. **Empty Packages Guide Card (`LZ6/o;`):**
   - In `e(Z)Ljava/util/ArrayList;`, forces argument `p1` to `false` (`const/4 p1, 0x0`), ensuring the "Sync shipment" guide card is omitted and "Add shipment" is styled as the lone empty card.
4. **Recurring Enable Email Sync Popup (`LY6/b;`):**
   - In `G1()V`, injects `return-void` at index 0.
5. **Background Grant Polling (`NewTrackingListPresenter`):**
   - In `checkEmailGrantAuth(Z)V`, injects `return-void` at index 0.
6. **Authorization Failure & Duplicate Dialogs (`LP4/i;`):**
   - In `r()V` (auth failure dialog) and `s()V` (duplicate account dialog), injects `return-void` at index 0.
7. **Dialog Handlers in Activities:**
   - `HomeActivity.x(I)V`: Injects `return-void` at index 0.
   - `OrderDetailsActivity.x(I)V`: Injects `return-void` at index 0.
8. **Activity Neutralization:**
   - `EmailGrantGuideActivity.onCreate`: Invokes `BaseActivity.onCreate`, then immediately invokes `finish()` and `return-void`.
   - `EmailActivity.onCreate`: Invokes `BaseMvpActivity.onCreate`, then immediately invokes `finish()` and `return-void`.
9. **Manual Tracking Add Entrypoint (`TrackingAddActivity`):**
   - In `onResume()V`, after `super.onResume`, injects bytecode setting `Lz2/w;->b` ("Copy tracking numbers from email") to `View.GONE` (`0x8`).
---

## Patch: Remove Ads and Tracking

- **Name:** Remove Ads and Tracking
- **Target Package:** `com.aftership.AfterShip`
- **Supported Versions:** `5.25.8` (VersionCode: `52580`+)
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Dependencies:** `Bypass Native Signature Check`

### 1. Motivation & Purpose

The **Remove Ads and Tracking** patch neutralizes all ad SDK initialization and view rendering, eliminates in-app 5-star review rating prompts, spoofs the AAID to a zeroed identifier with tracking disabled, and stubs out first-party analytics, impression trackers, and diagnostic loggers.

---

### 2. Technical Implementation & Bytecode Modifications

#### Modification 1: Neutralize Disco Ad Network SDK & Placements
1. **SDK Initialization:**
   - `Le3/c;->p(Lcom/aftership/shopper/AfterShipApplication;)V`: Injects `return-void` at index 0, preventing Disco SDK startup and live API key registration.
   - `Lcom/disconetwork/discosdk/Disco;`: Injects `return-void` into `initSdk`, `execute`, `events`, `doExecute$discosdk_publicRelease`, and `setDebugLogsEnabled`.
2. **Force Collapse on `DiscoInlinePlacement`:**
   - `Ls4/d;->b(Landroid/content/Context;Ll6/b;)V`: Replaces implementation to set status field `Ls4/d;->b` directly to `PlacementStatus.COLLAPSED` (`Ls4/d$a;->d`) and return void.
3. **Zero `DiscoAdAdapter` Item Count:**
   - `Ls4/a;->j()I` (`getItemCount`): Replaces implementation with `const/4 v0, 0x0` / `return v0`, preventing `ConcatAdapter` in `TrackingDetailFragment` from ever binding or inflating `layout_disco_ad_item`.
4. **Prevent List Ad Insertion:**
   - `LY6/i;->f3(...)Ljava/util/List;`: Replaces implementation with `return-object p1`, passing the original shipments list through unmodified without injecting sponsored items.

#### Modification 2: Spoof Google Play Advertising ID (AAID)
- **Class:** `Lm9/a;` (`com.google.android.gms.ads.identifier.AdvertisingIdClient`)
- **Method:** `a(Landroid/content/Context;)Lm9/a$a;`
- **Patched Behavior:** Instantiates and returns `new AdvertisingIdClient.Info("00000000-0000-0000-0000-000000000000", true)` (opt-out enabled).

#### Modification 3: Neutralize Central Analytics & Event Dispatchers
- **`Lx3/d;` (`FirebaseStatisticsManage`):** Injects `return-void` into event dispatchers `b`, `c`, `d`, `e`, `f`.
- **`Lx3/i;` (`StatisticsCenter`):** Injects `return-void` into central dispatcher `v` and logging helpers `B`, `E`, `J`, `K`, `b`, `c`, `d`, `e`, `f`, `I`, `i`, `j`, `n`, `s`, `t`, `z`, `G`, `H`, `p`, `q`, `w`, `y`.

#### Modification 4: Disable Upload Strategies, Impression Telemetry & Loggers
- **Upload Strategies:** Injects `return-void` into `Lo4/a;->a`, `Lo4/b;->a`, `Lo4/d;->a` (`AbsUploadStrategy.a`), and `Lx3/k;->d` (`UploadStatisticsHelper` OkHttp upload).
- **Impression Telemetry:** Injects `return-void` into `AbsListImpEventHelper` (`postEvent`, `checkAndPostEvent`).
- **Diagnostic Loggers:** Injects `return-void` into `LF2/k;` (`c`, `i`, `j`), `Lcom/dianping/logan/a;->a`, `FirebaseCrashlytics`, and `FirebaseAnalytics.setCurrentScreen`.

#### Modification 5: Neutralize In-App 5-Star Review Rating Prompts
1. **`HomePresenter` Review Logic:**
   - `Lcom/aftership/shopper/views/home/presenter/HomePresenter;`: Injects `return-void` into `checkAndShowReviewsDialog`, `checkAndShowReviewsDialogNewStrategy`, `checkAndShowReviewsDialogOldStrategy`, `showRatingDialog`, `showRatingDialogNewStyle`, and `showRatingDialogOldStyle`.
2. **`HomeActivity` Dialog Inflation:**
   - `Lcom/aftership/shopper/views/home/HomeActivity;`: Injects `return-void` into `N1` (`layout_feedback_dialog_new` display) and `Y` (`layout_feedback_dialog` display).
3. **`TrackingListTabPresenter` & AB Test Strategy:**
   - `Lcom/aftership/shopper/views/shipment/presenter/TrackingListTabPresenter;`: Injects `return-void` into `handleReviewLogic` and `access$handleReviewLogic`.
   - Stubs `hadShowReviewDialog()` to return constant boolean `true` (`1`).
   - Stubs `isUsingNewStrategy()` to return constant boolean `false` (`0`).
   - Stubs `LA3/e$a;->a()` (`ReviewStyleABTestEnum.Companion.isNewStrategy`) to return constant boolean `false` (`0`).
4. **`TrackingListTabFragment` View & Dialog Schedulers:**
   - `LY6/i;`: Injects `return-void` into `Y1` and `b2`.
   - `LY6/e;`: Injects `return-void` into `run()`.

---

## Patch: Custom Google Maps API Key

- **Name:** Custom Google Maps API Key
- **Target Package:** `com.aftership.AfterShip`
- **Supported Versions:** `5.25.8` (VersionCode: `52580`+)
- **Default State:** `false` (Disabled by default)
- **Type:** Android XML Resource Patch (`resourcePatch`)
- **Dependencies:** `Bypass Native Signature Check`

### 1. Motivation & Technical Reason

AfterShip embeds a Google Maps API key (`AIzaSyD3umCsUM0RNxJqT_UZvhqx72FfCWbiLKw`) in `AndroidManifest.xml` under `<meta-data android:name="com.google.android.geo.API_KEY" ... />`. In Google Cloud Console, AfterShip restricts this API key strictly to their official production keystore certificate (`SHA-1: 81:96:92:2F:78:DC:E6:57:44:DC:8D:A9:25:9C:60:77:2B:33:A2:B5`).

When modifying and patching an APK with Morphe, the output APK is re-signed using Morphe's signing key (or a user-supplied keystore). When `SupportMapFragment` loads, the Google Maps SDK queries Google Play Services `ApiTokenService`, which queries Android's `PackageManagerService` for the application's actual certificate SHA-1 fingerprint. Because the certificate differs, Google's backend rejects the token request with an Authorization Failure, leaving the map tile canvas blank and white.

The **Custom Google Maps API Key** patch allows users to supply their own personal Google Maps API key (from Google Cloud Console with "Maps SDK for Android" enabled) via the `apiKey` patch option.

> **Note:** To use native Google Maps with a custom API key, disable the **OpenStreetMap Drop-in Replacement** patch.

### 2. Configuration Option

| Option Key | Type | Default | Description |
|---|---|---|---|
| `apiKey` | `String` | `""` | Personal Google Maps API key with Maps SDK for Android enabled. |

---

## Patch: Hide Broken Tracking Map

- **Name:** Hide Broken Tracking Map
- **Target Package:** `com.aftership.AfterShip`
- **Supported Versions:** `5.25.8` (VersionCode: `52580`+)
- **Default State:** `false` (Disabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`)
- **Dependencies:** `Bypass Native Signature Check`

### 1. Motivation & Purpose

For users who do not use the OpenStreetMap replacement and do not provide a custom Google Maps API key, the native Google Maps view renders as an unauthenticated white canvas across the shipment tracking detail screen.

The **Hide Broken Tracking Map** patch suppresses Google Map fragment attachment in `TrackingMapFragment` (`LA6/c0;->b3()V`) and instead renders AfterShip's native fallback illustration card (`ic_no_location_detail`) and label (`R.string.tracking_map_no_location_tips`).

### 2. Technical Implementation & Bytecode Modifications

- **Class:** `LA6/c0;` (`TrackingMapFragment`)
- **Method:** `b3()V`
- **Patched Behavior:**
  Prepends bytecode at instruction index 0 to force execution of the fallback illustration branch, remove any child `SupportMapFragment`, and return immediately:
  ```smali
  const/4 v0, 0x1
  const-string v5, "tracking-map"
  const-string v1, "showNotLocationView"
  invoke-static {v1, v5}, LD2/a;->c(Ljava/lang/Object;Ljava/lang/String;)V
  iget-object v0, p0, LA6/c0;->p:Lg3/b;
  if-eqz v0, :cond_skip_all
  const/4 v1, 0x0
  iget-object v2, v0, Lg3/b;->b:Ljava/lang/Object;
  check-cast v2, Landroid/widget/ImageView;
  if-eqz v2, :cond_skip_img
  invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setVisibility(I)V
  :cond_skip_img
  iget-object v0, v0, Lg3/b;->c:Ljava/lang/Object;
  check-cast v0, Landroid/widget/TextView;
  if-eqz v0, :cond_skip_txt
  invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
  :cond_skip_txt
  invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;
  move-result-object v0
  const-string v1, "tag_google_map_fragment"
  invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->E(Ljava/lang/String;)Landroidx/fragment/app/Fragment;
  move-result-object v0
  instance-of v1, v0, LS9/d;
  if-eqz v1, :cond_skip_all
  invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;
  move-result-object v1
  new-instance v2, Landroidx/fragment/app/a;
  invoke-direct {v2, v1}, Landroidx/fragment/app/a;-><init>(Landroidx/fragment/app/FragmentManager;)V
  invoke-virtual {v2, v0}, Landroidx/fragment/app/a;->k(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/a;
  const/4 v0, 0x0
  invoke-virtual {v2, v0}, Landroidx/fragment/app/a;->j(Z)I
  :cond_skip_all
  return-void
  ```

> **Map Selection Note:** Because `OpenStreetMap Drop-in Replacement`, `Hide Broken Tracking Map`, and `Custom Google Maps API Key` all target the map setup method in `LA6/c0;->b3()V`, only one map strategy should be used at a time:
> - **OpenStreetMap (Default):** Leave `OpenStreetMap Drop-in Replacement` enabled (`true`).
> - **Native Google Maps:** Disable `OpenStreetMap Drop-in Replacement` (`false`) and provide your API key in `Custom Google Maps API Key`.
> - **No Maps:** Disable `OpenStreetMap Drop-in Replacement` (`false`) and enable `Hide Broken Tracking Map` (`true`).
