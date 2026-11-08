# Amazon — patch status and issue responses

Applies to **Amazon Shopping** `com.amazon.mShop.android.shopping` and
**Amazon India** `in.amazon.mShop.android.shopping` (XAPK splits).

## Patches in the bundle

| Patch | Default (v2.2.9 re-cut) | Scope |
|---|---|---|
| Dark mode | ON | AMOLED resource pass — **android:-framework attributes only** (hard "Unknown attribute name: colorSurface" guard, same class of fix as Google Photos) + WebView CSS injection |
| Disable video autoplay | ON | **WebView media-gesture gate only** (MShopWebView.initialize) — in-app web pages, not feed video |
| **Amazon: Stop feed video autoplay** | off — NEW | Native ExoPlayer/Media3 players (home-feed live video units); same setPlayWhenReady(true)→false heuristic as the universal patch. See issue #21 |
| Remove ads | ON | CSS injection into WebViews (sponsored placements on web surfaces) |
| Disable search suggestions tracking | ON | — |
| Fix Amazon manifest conflicts | ON | — |
| Hide Rufus tab | ON | — |
| Open links in browser | ON | — |
| Price history charts | ON | — |
| **Universal** also suggested: Disable video autoplay (ExoPlayer/Media3) | off | Same heuristic, app-agnostic |
| **Universal** also suggested: Block analytics & tracking SDKs | off | Heuristic, India-market markers |

## Issue #22 — "Amazon India patching error (Unknown attribute name: colorSurface)" — FIXED

Root cause: the AMOLED resource pass wrote Material attribute names
(`colorSurface`, `colorBackgroundFloating`, `colorSurfaceContainer*`, …) into
`<style>` items. On Amazon's Compose-era builds those attributes are not in
the app's resource table, so the reandroid XML encoder aborts the whole patch
run ("Unknown attribute name: colorSurface", styles.xml line 58).

Fix (shipped 2026-11-07, v2.2.8 re-cut #4 / v2.2.9): themes receive only
android: framework attributes (colorBackground, navigationBarColor,
statusBarColor, windowBackground, windowLightStatusBar/NavigationBar), a
hard `android:` guard sits in `ensureStyleItem`, and Material surfaces go
black through the `<color>`-token pass + WebView CSS instead. **The Google
Photos AMOLED patch carried the same defect and got the identical fix in
this release** (it wrote the same Material attribute set, including
`colorSurfaceContainer*`).

If the error reappears on ANY Android build, check `docs/AMAZON.md` history
first — the failure class is "attribute not in the target's resource table".

## Issue #21 — "Amazon India video ads / live video automatically running" — ADDRESSED (limits documented)

The pre-existing "Disable video autoplay" patch gates WebView video only;
comments on the issue assumed one switch covered everything.

What you should enable now:

1. **Remove ads** (ON by default) — CSS ad blocking on web surfaces.
2. **Disable video autoplay** (ON by default) — WebView pages.
3. **Amazon: Stop feed video autoplay** (NEW, off by default) — the native
   home-feed live video units; flips literal `setPlayWhenReady(true)` to
   false in ExoPlayer/Media3 players anywhere in the app.
4. Optionally **Disable video autoplay (ExoPlayer/Media3)** (universal, off) —
   identical heuristic, useful if the Amazon-scoped one is missed by your
   build (both are independent toggles — harmless to enable both).

What remains out of reach: video units starting via reflection/obfuscated
player factories, players that never pass a literal `setPlayWhenReady(true)`,
and any system where the feed video is driven by remote-config (server-flagged
on) with no local literal to flip — that requires the decompiled APK
(which was not in this environment) plus device confirmation. If the videos
still autoplay after enabling (3) and (4), attach the exact Amazon version
code (Settings → Applications → Amazon Shopping) and we will fingerprint the
player startup path precisely.

## Notes

- Amazon mShop APKs ship split XAPK bundles — patch in XAPK mode.
- Unverified on device for the Amazon set, same as the rest of this bundle.
