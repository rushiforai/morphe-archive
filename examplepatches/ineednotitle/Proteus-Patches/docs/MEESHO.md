# Meesho — patch status and analysis

Meesho: Online Shopping App (`com.meesho.shopping`, Meesho / FSN E-Commerce
Ventures) is India's largest social-commerce marketplace app. This document is
the current status page, mirroring the Mint/HT analysis.

## Distribution facts (public listings, observed 2026-11-06/07)

| Field | Value |
|---|---|
| Package | `com.meesho.shopping` |
| Latest seen | **29.9** (2026-11-06, arm64-v8a, 480-640dpi, Android 10+, 19.12 MB), **29.8**, **29.7** (872), **29.6** (870), **29.5** (868), 29.3, 29.1, 28.x |
| Form | **XAPK split bundles** ("BUNDLE 9 S/11 S…") — patch in XAPK mode, like Amazon |
| Min SDK | API 21 (listings); recent arm64 builds target Android 10+ |
| Version codes | 29.7=872, 29.6=870, 29.5=868 (observed); 29.9/29.8 ship without public codes in the listings — pinned version-only |

**No `com.meesho.shopping` APK has been decompiled in this build environment.**

## What the bundle ships for Meesho (v2.2.8 re-cut #5)

App-scoped entries (off by default, unverified on device — same thin wrappers
over the universal heuristics as the Mint/HT entries):

- **Meesho: Block analytics & tracking SDKs** — Firebase/AppsFlyer/Adjust/
  Facebook/Segment/Amplitude/Mixpanel/Localytics/Countly/UrbanAirship +
  WebEngage/CleverTap/Flurry/Branch/Kochava markers
- **Meesho: Disable video autoplay (ExoPlayer/Media3)** — flips literal
  `setPlayWhenReady(true)` sites to false
- **Meesho: Prefer external browser over Custom Tabs**

Plus, app-agnostic and visible for Meesho today with no new code: universal
**Block analytics & tracking SDKs**, **Disable video autoplay (ExoPlayer/Media3)**,
**Remove dangerous permissions**, **Disable PairIP license check**,
**Fix Firebase after re-signing**, **Prefer external browser over Custom Tabs**.

## Not in the bundle, and why

- **Sponsored product / in-feed ad suppression** — needs the APK (which ad SDK
  renders the cards, and whether promo flags exist on the models)
- **AMOLED black reading surface** — needs the build's theme resources
- **Rating/review nag removal** — blocked on a fabricated `Task<ReviewInfo>`;
  the extension module has no play-review compile classpath
- **Integrity self-defense bypass** — if re-signed Meesho builds crash or
  black-screen the way Mereframe did (likely for this app family), it needs the
  obfuscated wrapper-flow analysis + Mereframe-style per-crash triage on an APK.
  Note the "Diagnostic crash log" patch is Mereframe-specific and does NOT
  apply to Meesho — capture `logcat` around launch instead
- **Premium unlock** — Meesho has no premium tier; nothing to unlock

## Verification checklist (device)

1. Bundle reports **v2.2.8** in the manager.
2. Meesho shows as supported (target must match your installed build:
   29.9 / 29.8 / 29.7 / 29.6 / 29.5) and the XAPK form is used.
3. Patch list under Meesho shows the three scoped entries + universals.
4. If the patcher rejects the file (single .apk selected instead of the
   XAPK/bundle), pull **all** splits (`adb shell pm path com.meesho.shopping`),
   or use the universal variant.
5. If install fails with an integrity-style crash after patching, enable
   **Diagnostic crash log** (Mereframe-style) + send the log from
   Downloads/mereframe-crash-*.txt — it now records app versionName/versionCode.
