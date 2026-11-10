# Nike Run Club patches

**App:** Nike Run Club (`com.nike.plusgps`) · **version 4.80.0** · versionCode
`1717895889` · minSdk 29 / targetSdk 36 · universal APK (arm64-v8a, armeabi-v7a,
x86, x86_64).

**Signer (SHA-256):** `25512576dacc619bd925d1ea05a3e140311d31b0b853183abe1d9da8fd3f240f`.

NRC is a large native Kotlin/Compose app (16 dex) built on Nike's own
`com.nike.mpe.*` platform modules. Unlike the fully-obfuscated consumer apps, the
platform-module class/method names are **kept** (Nike ships keep rules for its
plugin surface), so the fingerprints below use real dex names.

## Patches

| Patch | Default | What it does |
|---|---|---|
| **Enable dark mode** | ✅ | Turns on NRC's built-in dark theme. |
| **Remove ads** | ✅ | No ad SDK ships; disables any ad-init provider and strips the ad-ID / ad-services / install-referrer permissions. |
| **Disable trackers** | ✅ | Stops Adobe (Omniture) analytics (extension registration) + disables Adobe messaging components and sets Firebase collection opt-outs. |

## Dark mode

NRC already ships a complete dark theme (`OneNikeDarkTheme` plus a dark Compose
colour mode) but keeps it switched off. The single gate is
`com.nike.mpe.capability.design.implementation.internal.DefaultDesignManager.useDarkMode()`:

```
allowDarkMode && (forceDarkMode || systemDarkMode)
```

- `allowDarkMode` — set from a **remote configuration flag** (off in the shipping build),
- `forceDarkMode` — user/forced override,
- `systemDarkMode` — mirrors the system `uiMode`.

`getColorMode()` returns `ColorMode.Dark` when this is `true`, and every Compose
design provider reads that static colour mode. The patch forces `useDarkMode()` to
`true`, so the Compose surface renders dark regardless of the system setting.

**Status:** bytecode-verified (`useDarkMode()` now starts `const/4 v0, 1; return v0`)
and the app launches cleanly on a patched build. The on-device *visual* confirmation
is pending — NRC gates its themed UI behind sign-in (`AuthorizedActivity`), and the
Welcome screen is a full-bleed photo, so the dark theme can only be seen after
logging in. Older View-based screens keep the light app theme; the modern UI is
Compose.

## Ads

NRC declares **no ad SDK** — the `com.google.android.gms.ads` classes in the dex are
an unused transitive dependency (no `MobileAdsInitProvider`, no App-ID meta-data, no
ad surface). The patch keeps the standard ad-init providers disabled defensively and
strips `AD_ID`, `ACCESS_ADSERVICES_*` and the install-referrer permission.

## Telemetry

- **Adobe Experience Platform (Omniture)** is NRC's usage/event telemetry
  (`com.nike.plusgps.core.analytics.AdobeRunningAnalytics` / `NikeOmnitureImpl` →
  `com.adobe.marketing.mobile.*`). Every Adobe extension is registered through a
  single `MobileCore.registerExtensions(List, AdobeCallback)` call; the patch no-ops
  that method, so no Adobe extension ever registers and no event/identity/optimisation
  payload is built or sent. Adobe APIs are null-safe when uninitialised, so the app
  keeps running.
- The Adobe manifest components are also disabled: `ExtensionDiscoveryService`,
  `AssuranceActivity`, `com.adobe.mobile.MessageFullScreenActivity`.
- Firebase collection opt-out meta-data is set defensively (NRC ships only FCM +
  Installations, no Firebase Analytics extension).
- **Left intact on purpose:** Urban Airship / FCM **push** (the user asked push to keep
  working) and Nike's own first-party telemetry module.

## Verification (2026-11-08)

Build: all four patches apply cleanly (`Applied: Disable tracker components /
Disable trackers / Enable dark mode / Remove ads`, `failedPatches: []`).

Bytecode spot-checks on the patched dex:
- `DefaultDesignManager.useDarkMode()Z` → `const/4 v0, #int 1 / return v0`.
- `MobileCore.registerExtensions(List, AdobeCallback)V` → `return-void` (no-ops the
  `MobileCoreInitializer.registerExtensions` call).

Manifest (`aapt2 dump xmltree`): Adobe `ExtensionDiscoveryService`, `AssuranceActivity`
and `MessageFullScreenActivity` all `android:enabled="false"`; `firebase_*` /
`google_analytics_*` opt-out meta-data present and `false`; `AD_ID` /
`ACCESS_ADSERVICES_*` / `com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE`
removed.

Device: patched APK installs and launches to `WelcomeActivity` with no
`FATAL`/`VerifyError`/`UnsatisfiedLinkError`.

> Note: a stray bare `BIND_GET_INSTALL_REFERRER_SERVICE` permission (no package
> prefix — a malformed declaration) remains in the manifest; it is inert.
