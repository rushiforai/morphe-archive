# Analysis: Apple Music 7.0.0-beta (Android)

- File: `Apple Music 7.0.0-beta (120-640dpi) (Android 11+)`, APKMirror `.apkm` bundle (base + 11 splits)
- Package: `com.apple.android.music`, versionCode 1606, minSdk 30, targetSdk 36
- Launcher activity: `com.apple.android.music.common.MainActivity`
- 4 DEX files, code obfuscated by R8 (except the classes referenced by layouts and part of the `com.apple.*` classes)

To reproduce:

```bash
python3 -I tools/apk_triage.py "Apple Music.apkm" --json triage.json
python3 -I tools/apk_res.py "Apple Music.apkm" layout res/layout/fragment_music_content.xml
python3 -I tools/dex_inspect.py "Apple Music.apkm" class 'Leightbitlab/com/blurview/Blur(View|Target);' --code
```

---

## 1. Verdict: classic Views, with a blur already in place

The app is hybrid (there are `ComposeView`s for dialogs and gradients), but the tab bar and the mini player are classic `View`s. Apple even uses the BlurView v3 library (Dimezis, package `eightbitlab.com.blurview`) to blur the content under both pills. All the plumbing that captures the background is therefore already there. The mod only has to replace the effect that is applied (plain blur → blur + refraction + saturation + highlight) and lighten the tint drawn on top.

---

## 2. View hierarchy of the main screen (phone)

`res/layout/fragment_music_content.xml` (data binding `q8/R4` in this version):

```
ConstraintLayout                     @id/content_container
├── BlurTarget                       @id/blur_target          ← blur source (all the content)
│   └── FrameLayout                  @id/tab_navigation_host  ← fragments of the tabs
├── ComposeView                      @id/top_and_bottom_gradients
├── BlurView                         @id/mini_player_blur     ← pill of the mini player (GONE at first)
│     background=@drawable/bg_corner_radius_pill, height=@dimen/miniplayer_height (48dp)
├── CoordinatorLayout                @id/player_coordinator
│   └── FragmentContainerView        @id/player_sheet_container
│         PlayerMainFragment (BottomSheetBehavior, peekHeight=@dimen/player_peek_height)
│         └── layout/mini_player.xml: content of the mini player (title, artist, ▶, ⏭, …)
│               ConstraintLayout     @id/mini_player_content  background=@drawable/bg_apple_material
├── BlurView                         @id/bottom_nav_blur      ← aligned with bottom_nav_view
│     background=@drawable/bg_corner_radius_pill
└── BottomNavigationView             @id/bottom_nav_view      ← the tab bar
      background=@drawable/bg_apple_material, height=@dimen/navigation_tabs_height (62dp)
      marginStart/End=@dimen/endMargin (16/20/34dp), itemActiveIndicatorStyle=@null
```

The tablet variants (`layout-w600dp`, `layout-w675dp`, `layout-w735dp`) follow the same principle. Other `BlurView`s exist: `top_nav_blur`, `floating_search_bar_blur` (floating search bar) and `drawer_blur` (main activity). They can get the same treatment.

In `layout-w600dp/activity_main.xml`, `drawer_blur` (background `bg_corner_radius_xxl`) sits next to `blur_target` in `main_container`, and the `NavigationView` `drawer_nav_view` (background `apple_material_background_thick`) is drawn over it by the `DrawerLayout`: the same pattern as the tab bar.

Other facts used by 1.2.0:

- `BottomNavigationView` is obfuscated (`vf.j`), but its public `getMenu()`, `getSelectedItemId()` and `setSelectedItemId(int)` keep their names. The menu items are `action_listen_now_deprecated` (Home), `action_browse_deprecated` (New), `action_multiply_radio_deprecated` (Radio), `action_library_deprecated` (Library) and `search_fragment_deprecated` (Search).
- The accent of the app is `key_color_dark` (`#fffa2d48`) and `key_color_light` (`#fffa233b`) in `values/colors.xml`; `color_primary` and the other accents point to them, and `color_primary_disabled` repeats the red in `values` and `values-night`.
- The launcher icon is `mipmap-anydpi-v26/ic_launcher.xml` (adaptive: `music_appicon_background`, `music_appicon_foreground`, which is also the monochrome layer), with raster `ic_launcher` and `ic_launcher_round` in every density.
- Apple's settings screen is built in code. Only the Dolby Atmos, karaoke and debug screens load preference XML.

### Where the near-opaque look comes from

Drawing order of a pill:

1. `BlurView`: blur of the window background and the `BlurTarget`, radius 16 (a constant passed to `setBlurRadius`, inlined in `oh.f.d()`) times the scale factor 4, so `createBlurEffect(64, 64)`. The layout sets no overlay color.
2. On top, the content view (`bottom_nav_view` / `mini_player_content`) has `bg_apple_material` as its background, a `layer-list`:
   - `@id/artwork_color_scheme_layer` → `layer_artwork_color_scheme` (pill shape, `apple_material_background`);
   - `@id/material_layer` → `layer_apple_material` (pill shape, `apple_material_background`, stroke `apple_material_stroke` of width `apple_material_bg_stroke`).

| Color | Light | Dark |
|---|---|---|
| `apple_material_background` | `#8cf5f5f7` (55%) | `#99262628` (60%) |
| `apple_material_background_thick` | `#bff5f5f7` (75%) | `#bf262628` (75%) |
| `apple_material_stroke` | `#1a000000` | `#33ffffff` |

With two layers at 60% over a strong blur, only ~16% of the background stays visible, hence "a little translucency". `corner_radius_pill` = 80dp, so the shape is a capsule.

Apple changes this material at runtime. `MusicContentFragment.onCreateView` keeps the mutated `LayerDrawable` of `bottom_nav_view`, and every value of `MainActivityViewModel.getFloatingElementColorScheme()` goes through `Aa.a0.c(LayerDrawable, scheme)`:

- `artwork_color_scheme_layer`: `setAlpha(255)` for the default scheme, otherwise a color taken from the artwork, a saturation filter (×2.2) and `setAlpha(0.6 × 255)` or `setAlpha(0.55 × 255)`;
- `material_layer`: replaced with a fresh `layer_apple_material` (or one of its two variants) through `setDrawableByLayerId`, so at full alpha.

A change made to these layers once is therefore undone at the next color change, at the latest when the first song loads.

---

## 3. BlurView v3 in this APK (obfuscated names in 7.0.0-beta)

| Role (BlurView v3 source) | Name here | Stable? |
|---|---|---|
| `BlurView` | `eightbitlab.com.blurview.BlurView` | Yes (referenced by layouts) |
| `BlurTarget` | `eightbitlab.com.blurview.BlurTarget` | Yes |
| `BlurTarget.renderNode` (`"BlurViewHost node"`) | field `a : RenderNode` | Found by type |
| `BlurView.blurController` | field `a : oh.a` (the only field with an interface type) | Found by type |
| `BlurView.overlayColor` | field `b : int` | — |
| `BlurView.setupWith(BlurTarget)` | `b(BlurTarget) : oh.a` | Unique signature |
| `BlurView.draw(Canvas)` | `draw(Canvas)` | Yes (overrides a framework method) |
| interface `BlurController` | `oh.a`: `g(Canvas)Z` (= draw), `f()V`, `destroy()`, `b(Z)`, `d()`, `e(Drawable)` | `draw` = the only `(Canvas)boolean` method |
| `RenderNodeBlurController` | `oh.f` (field `e : RenderNode` `"BlurView node"`, `k : float` radius, `j : int` overlay) | Through the interface + `RenderNode` field |
| `PreDrawBlurController` (API < 31) | `oh.d` + `oh.g` (RenderScript) | — |

How `oh.f.g(Canvas)` works (API 31+ with a hardware canvas):

1. the `"BlurView node"` takes the size of the `BlurTarget`, translated by −(position of the BlurView inside the target);
2. it records `frameClearDrawable`, then `drawRenderNode(BlurTarget.renderNode)`;
3. it applies `RenderEffect.createBlurEffect(k, k, CLAMP)`;
4. it draws this node clipped to the rectangle of the BlurView, then the noise (`oh.c`) and `drawColor(overlay)`.

`BlurTarget.dispatchDraw` records its content into its `RenderNode` again on every frame. Scrolling therefore propagates on its own, without invalidating the BlurView.

Calls on Apple's side:

- `MainActivity.onCreate`: `binding.b0 (BlurView).setupWith(binding.Z (BlurTarget)).setBlurRadius(16).setFrameClearDrawable(decorView.background)` for `drawer_blur`;
- `MusicContentFragment.onViewCreated`, through the lambda `Vb.x`: the same chain for `bottom_nav_blur` (`q8/R4.a0`), `top_nav_blur` (`h0`) and `mini_player_blur` (`d0`), with `q8/R4.Z` (`blur_target`), unconditionally;
- `SearchLandingFragment.onViewCreated`: the same for `floating_search_bar_blur`.

The frame clear drawable matters: `BlurTarget` only records its children, and the black of the screen is the window background, outside the target. Without it, the blurred node is transparent wherever the app draws no background of its own, and the sharp content behind the pill shows through.

---

## 4. Security and the non-root path

| Item | Finding | Consequence |
|---|---|---|
| Play Integrity | `com.apple.android.music.utils.AppIntegrityManager`, `prepareIntegrityToken`, an `appIntegrityToken` sent in `WebViewModel.initiateRequest` (commerce / account flows) and `externalAppIntegrity` in the store "bag" config | Play Integrity will see a re-signed APK (Morphe, LSPatch, static patch) as an "unrecognized app": sign-in or subscription will probably be refused. The LSPosed route (root, no re-signing) avoids the problem |
| Signatures | `AMSStableIdentifier.verifyPackageSignature` (checks *other* Apple packages), `ke.k.c(PackageInfo)` (Google library) | No check of its own signature found on the Java side |
| Root | the string `/system/xbin/su` is present (classes4) | Basic detection is possible: test with LSPosed, and hide root if needed |
| Native | `libCoreFP.so`, `libCoreADI.so`, `libCoreLSKD.so`, `libFPDIFor3P.so` (FairPlay / ADI), `libmediaplatform.so`, `libAMSKit.so`… | Native DRM: the mod touches nothing native and nothing in playback |

---

## 5. Hook points used by the patch

1. `BlurView.draw(Canvas)` (stable name). The patch inserts a call to `LiquidGlassPatch.drawBlurView(this, canvas)` at the start of the method. When it returns `true`, the method calls `super.draw(canvas)` (background and children) and returns, which skips the original blur. Targeted views, by resource name: `bottom_nav_blur` and `mini_player_blur`, plus `floating_search_bar_blur` and `top_nav_blur` when the "Search bar" option is on. An LSPosed module can hook the same method.
2. Background source: the `BlurTarget` set up by Apple, read from the controller (the only field with an interface type, then its `BlurTarget` field), or else the closest neighbouring `BlurTarget`. Its `RenderNode` field is found by type. There is no extra recording and no risk of recursion, because the target does not contain the pills.
3. Tint: on `bottom_nav_view` and `mini_player_content`, the background is a `LayerDrawable`. The extension lowers the alpha of the `material_layer` / `artwork_color_scheme_layer` layers through `findDrawableByLayerId(getIdentifier(...))`, before every frame, since Apple sets them again on each color change. The thin stroke belongs to `material_layer` and fades with it; the extension draws its own highlight on the edge instead, in the overlay of the same view.
4. Position: an `OnPreDrawListener` per pill invalidates the BlurView when its position inside the target changes (mini player animations, the keyboard opening…).
5. Fallback: API < 31 or a software canvas → Apple's original rendering. API 31-32 → saturation and highlight (plus blur if the option is on), without the AGSL refraction.
