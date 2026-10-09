# Blackjack Architecture & Reverse Engineering Specification

## 1. Overview

| Attribute | Specification |
|---|---|
| **Application Name** | Blackjack |
| **Package Name** | `com.tripledot.blackjack` |
| **Supported Version** | `2.22.09` (Morphe Compatibility: `2.22.09`, `minSdk` 25) |
| **Analyzed Version Code** | Null / Unconstrained in Constants |
| **Minimum SDK** | `25` (Android 7.1) |
| **Distribution Format** | APKM (`ApkFileType.APKM`) |
| **Package Signing SHA-256** | `32e1c2b4c9ab0189d3e4e1c67806e6f4fc454aa758a74ccaedda8a309aa6b205` |
| **Target Architecture** | `arm64-v8a` (Unity IL2CPP native runtime) |
| **Primary Icon Color** | `#205B1F` |

Blackjack by Tripledot Studios is a mobile casino gaming application built with the Unity game engine. Game simulations, rendering, animations, state machines, and business rules are written in C# and compiled via Unity's IL2CPP (Intermediate Language to C++) toolchain into native 64-bit ARM machine code (`lib/arm64-v8a/libil2cpp.so`), hosted by Android's `com.unity3d.player.UnityPlayerActivity`.

---

## 2. Technology Stack & Runtime Architecture

### 2.1 Unity IL2CPP Runtime
- **Host Activity:** `com.unity3d.player.UnityPlayerActivity` manages the window surface, Android lifecycle, and input dispatching.
- **Native Binary:** `lib/arm64-v8a/libil2cpp.so` contains all compiled Unity game classes, including `BlackjackApplication`, `PlayerProfile`, `PlayerData`, `LevelData`, `BlackjackAds`, and `AdManager`.
- **Unity-to-Java Messaging Bridge:**
  - Game logic dispatches native Android dialogs via `com.mnp.popups.NativePopupsManager.ShowDialog`.
  - Android extensions communicate back into the Unity engine via `com.unity3d.player.UnityPlayer.UnitySendMessage(String gameObject, String methodName, String value)`.

### 2.2 Persistence & Storage
- Player statistics, current level, XP, and chip balances are serialized as JSON structures inside `SimpleStorage/PlayerData.json`.
- Candidate file paths used by extensions to resolve `PlayerData.json`:
  1. `/sdcard/Android/data/com.tripledot.blackjack/files/SimpleStorage/PlayerData.json`
  2. `context.getExternalFilesDir(null) + "/SimpleStorage/PlayerData.json"`
  3. `context.getFilesDir() + "/SimpleStorage/PlayerData.json"`
  4. Corresponding root fallback locations (`PlayerData.json`).
- Relevant JSON attributes:
  - `value.Credit`: Total chip balance (64-bit integer string/number).
  - `value.Level`: Current player level.
  - `value.XP`: Accumulated experience points toward the next level.

### 2.3 Advertising & Monetization Systems
The original game incorporates an extensive advertising and monetization network:
- **IronSource / AdManager mediation:** Coordinates banner, interstitial, and rewarded video ads across ad networks.
- **`BlackjackAds`:** Manages interstitial displays between table rounds (`TryShowInterstitial`, `ShowInterstitial`).
- **`LevelUpRewardScreen`:** Displays a rewarded video ad prompt container (`watchAnAdContainer`) offering bonus chips upon leveling up.
- **Native Chip Store:** An in-game storefront (`BlackjackApplication.OpenShop`) that is non-functional or unconfigured in offline/patched states.

### 2.4 Telemetry & Analytics Architecture
Tripledot Blackjack embeds six distinct analytics, attribution, and telemetry SDKs compiled into `libil2cpp.so`:
1. **Tripledot Analytics:** Proprietary first-party behavioral telemetry (`Analytics.SendEvent`, `SendEventInternal`, `SendToSinks`).
2. **Firebase Analytics:** Google event tracking (`FirebaseAnalytics.LogEvent` overloads).
3. **Firebase Crashlytics:** Crash and exception reporting.
4. **Adjust SDK:** Attribution, install referral, device telemetry, and session tracking (`Adjust.InitSdk` and tracking methods).
5. **AppsFlyer SDK:** Mobile attribution and marketing analytics (`AppsFlyerManager.Init`).
6. **Unity Analytics:** Engine-level telemetry and hardware metrics (`UnityEngine.Analytics.Initialize`).

---

## 3. Injected Morphe Extension Architecture

Patches for Blackjack introduce two native Java extension dialogs packaged into `extensions/extension.mpe` (`app.aidan.extension.blackjack.*`):

```
                   +----------------------------------+
                   |       UnityPlayerActivity        |
                   +----------------------------------+
                         |                      |
            onCreate hook|                      |Window.Callback touch proxy
                         v                      v
              [ SkipLevelDialog ]      [ NativePopupsManager ]
              (Intercepts level HUD)            |
                         |            ShowDialog|hook
                         |                      v
                         |             [ ChipBalanceDialog ]
                         |             (Custom Store Dialog)
                         \                      /
                          \                    /
                           v                  v
                 UnityPlayer.UnitySendMessage("BlackjackApplication",
                                              "CheckUpdateToVersion",
                                              payload)
                                      |
                                      v
                     +----------------------------------+
                     |  CheckUpdateToVersion (ARM64)   |
                     |  lib/arm64-v8a/libil2cpp.so     |
                     +----------------------------------+
                       /                              \
       Numeric chip payload                  "skip_level" payload
                     v                                  v
        PlayerProfile.SetDebugCredit          PlayerProfile.EarnXp (XPPerLevel)
        or BlackjackApplication.AddChips      GoToLastPlayedTable
```

1. **`ChipBalanceDialog` (`app.aidan.extension.blackjack.ChipBalanceDialog`):**
   - Injected into `NativePopupsManager.ShowDialog`.
   - Resolves `UnityPlayer.currentActivity` via reflection.
   - Presents an `AlertDialog` with a numeric `EditText` pre-populated with the user's current chip balance read from `PlayerData.json`.
   - On submission, strips whitespace/formatting, clamps negative values to 0, and dispatches the new balance as a string via `UnitySendMessage("BlackjackApplication", "CheckUpdateToVersion", amount)`.

2. **`SkipLevelDialog` (`app.aidan.extension.blackjack.SkipLevelDialog`):**
   - Installed in `UnityPlayerActivity.onCreate`.
   - Wraps `activity.getWindow().getCallback()` with a dynamic `java.lang.reflect.Proxy`.
   - Monitors `dispatchTouchEvent` for `ACTION_UP` gestures within a safe-area-relative next-level badge rectangle:
     - `x`: `0.75` to `0.85` of the window width
     - `y`: `-0.02` to `0.05` of the height between the top and bottom system insets
   - Unity anchors the badge at the top of its safe-area layout. This accounts for a display cutout or a different status-bar height without expanding the hit target through the top HUD.
   - Applies a 1,500 ms debounce filter. When tapped, reads `PlayerData.json` to calculate current level + 1, displays a confirmation dialog, and on confirmation sends `UnitySendMessage("BlackjackApplication", "CheckUpdateToVersion", "skip_level")`.

---

## 4. Patch Targets Summary

1. **`Custom Chip Store Binary Hook` (`rawResourcePatch`):** Replaces `OpenShop` with a call to `MNAndroidNative.showDialog` and repurposes `CheckUpdateToVersion` in `libil2cpp.so` into a dual-purpose input bridge (numeric balance setting + level skip execution).
2. **`Add Custom Chip Store` (`bytecodePatch`):** Hooks `NativePopupsManager.ShowDialog` to present `ChipBalanceDialog`.
3. **`Skip to Next Level` (`bytecodePatch`):** Hooks `UnityPlayerActivity.onCreate` to install the `SkipLevelDialog` touch proxy.
4. **`Remove Ads` (`rawResourcePatch`):** Neutralizes ad flags, interstitial triggers, AdManager entry points, and level-up ad containers in `libil2cpp.so`.
5. **`Remove Tracking and Analytics` (`rawResourcePatch`):** Injects ARM64 `ret` into entry points for Tripledot Analytics, Firebase Analytics, Crashlytics, Adjust, AppsFlyer, and Unity Analytics in `libil2cpp.so`.
6. **`Remove Internet Permissions` (`resourcePatch`):** Removes `android.permission.INTERNET` from `AndroidManifest.xml`; its **Remove Broken Screens** option disables both Settings and Daily Challenge Help Center buttons whose Zendesk content cannot load offline.
7. **`Remove Notifications` (`resourcePatch`):** Removes `android.permission.POST_NOTIFICATIONS` from `AndroidManifest.xml` to eliminate push notification delivery.
