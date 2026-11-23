# Patches

> Generated from `patches-list.json` — **v0.3.1** (`main`) · **18 patches** across **3 apps** · back to [README](README.md)

---

## Ditu (com.caracol.streaming)

**Supported versions:** `2.8.1`

| Patch | Details |
|---|---|
| **Block app Firebase custom events** | Stops the app's Firebase custom-event logging call. Other Firebase collection and other analytics SDKs may remain active. |
| **Block client-side VOD ads** | Keeps the original VOD media item instead of attaching the client-side ad configuration. Does not remove stitched server-side ads. |
| **Block client-side live prerolls** | Uses the live player's existing content-only route in place of its local IMA preroll. Ads already in the live stream can still play. |
| **Block remote startup video** | Loads the bundled Ditu logo animation in place of the remote full-screen startup video. |
| **Bypass forced update** | Disables the client forced-update decision while retaining optional update checks. Server-side version requirements can still apply. |
| **Hide player campaign banners** | Disables the player's optional Megaphone banner overlay on phone and TV. This can hide announcements as well as promotions. |
| **Remove advertising ID permissions** | Removes the Google advertising ID and Android Ad Services advertising ID permissions. Other identifiers and telemetry may remain. |

---

## TV Colombia Play (colombia.tv.plus)

**Supported versions:** `1015`

| Patch | Details |
|---|---|
| **Block startup ads, banners and interstitials** | Blocks automatic app-open ads, display ads in app screens, interstitials, and client-side VAST prerolls. |
| **Glass channel grid** | Gives channel cards one translucent surface, more legible labels, and a simpler loading indicator. |
| **Open television on launch** | Opens the television section directly when the startup menu contains the TV, RadioHub, and GeoSky cards. |

---

## ViX (com.univision.prendetv)

**Supported versions:** `4.52.1_mobile`

| Patch | Details |
|---|---|
| **Allow screenshots and screen recording** | Removes Window FLAG_SECURE and prevents LuraPlayer SurfaceView from forcing secure mode. Note: hardware-backed Widevine L1 DRM video surfaces may still be blanked by Android. |
| **Auto-skip server-side ads** | Automatically calls LuraPlayer.skipAd() when an ad starts on non-live VOD streams. |
| **Block player ads** | Disables Lura client-side prerolls, pause ads, GAM pod-serve DAI configurations, clip ad tags, and Google IMA ad tag resolution in ViX players. |
| **Bypass OneTrust consent delay** | Skips OneTrust CMP SDK initialization at startup and invokes the startup continuation immediately. |
| **Bypass forced app update** | Prevents SplashScreenFragment from displaying the blocking AppUpdateDialog. |
| **Disable telemetry and tracking** | Disables NewRelic, Permutive, AppsFlyer attribution, Conviva/PAL player telemetry, advertising ID collection, and strips the AD_ID manifest permission. |
| **Hide promotional popups** | Suppresses Braze in-app promotional dialogs and upgrade banners. |
| **Unlock Developer Tools** | Bypasses the passcode gate for ViX's hidden Developer Tools menu. Tap the app version 6 times in Settings to open it. |

---
