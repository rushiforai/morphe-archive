# Blackjack Patch Specifications

## Overview

This document details the binary bytecode and native asset patches available for **Blackjack** (`com.tripledot.blackjack`).

| Patch Name                                                            | Type                    | Default | Description                                                                                                                                                                |
| --------------------------------------------------------------------- | ----------------------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Add Custom Chip Store](#patch-add-custom-chip-store)                 | `compositeFeaturePatch` | `true`  | Replaces the defunct in-game chip store with a native Android dialog allowing players to enter any chip amount, backed by an internal ARM64 native hook in `libil2cpp.so`. |
| [Skip to Next Level](#patch-skip-to-next-level)                       | `bytecodePatch`         | `true`  | Allows players to skip to the next level by tapping the level progress indicator in the main menu.                                                                         |
| [Remove Ads](#patch-remove-ads)                                       | `rawResourcePatch`      | `true`  | Removes banner, interstitial, and rewarded advertising and removes ad-based chip offers.                                                                                   |
| [Remove Tracking and Analytics](#patch-remove-tracking-and-analytics) | `rawResourcePatch`      | `true`  | Neutralizes active advertising telemetry, analytics, attribution, and crash reporting.                                                                                     |
| [Remove Internet Permissions](#patch-remove-internet-permissions)     | `resourcePatch`         | `true`  | Removes Internet permissions from AndroidManifest.xml to prevent network access.                                                                                           |
| [Remove Notifications](#patch-remove-notifications)                   | `resourcePatch`         | `true`  | Removes notification permissions from AndroidManifest.xml to eliminate push notifications entirely.                                                                        |

---

## Patch: Add Custom Chip Store

- **Name:** Add Custom Chip Store
- **Target Package:** `com.tripledot.blackjack`
- **Supported Versions:** `2.22.09`
- **Default State:** `true` (Enabled by default)
- **Type:** Composite Feature Patch (`compositeFeaturePatch`) with Extension DEX (`extendWith`)
- **Dependencies:** None
- **Extension Classes:** `app.aidan.extension.blackjack.ChipBalanceDialog`

### 1. Motivation & Purpose

In offline or patched environments, Blackjack's native in-game chip store is non-functional, and the game contains no debugging console. The **Add Custom Chip Store** composite patch modifies the native ARM64 engine inside `lib/arm64-v8a/libil2cpp.so` and injects an Android Dalvik dialog hook to allow players to set arbitrary chip balances.

### 2. Technical Implementation & Injection Points

#### Native ARM64 Hook Layer (`lib/arm64-v8a/libil2cpp.so`)

1. **`BlackjackApplication.OpenShop` (Offset `0x1fcf6d4`):**
   - Replaces store opening with a call to `MNAndroidNative.showDialog` (`0x3c98ce4`).
2. **`BlackjackApplication.CheckUpdateToVersion` (Offset `0x1fd0850`):**
   - Replaces prologue with the unified 192-byte app hook (`UNIFIED_APP_HOOK`).
   - If input is numeric, parses the chip balance, calculates the delta against `PlayerProfile.SetDebugCredit`, and executes `BlackjackApplication.AddChips`.
   - If input is `"skip_level"`, advances to the next level via `PlayerProfile.EarnXp` and `GoToLastPlayedTable`.

#### Dalvik Bytecode Hook Layer

- **Class:** `Lcom/mnp/popups/NativePopupsManager;`
- **Method:** `ShowDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V`
- **Injected Bytecode (at instruction offset 0):**

  ```smali
  invoke-static {}, Lapp/aidan/extension/blackjack/ChipBalanceDialog;->show()V
  return-void
  ```

#### Extension Behavior (`ChipBalanceDialog.java`)

1. Resolves `com.unity3d.player.UnityPlayer.currentActivity` reflectively.
2. Reads current chips from `SimpleStorage/PlayerData.json` (`value.Credit`).
3. Inflates an `AlertDialog` with a numeric `EditText` padded with 24dp horizontal margins.
4. On positive action ("Set Chips"):
   - Parses the input text, removing commas and spaces.
   - Clamps negative values to `0`.
   - Sends the decimal string to Unity via `UnitySendMessage("BlackjackApplication", "CheckUpdateToVersion", amount)`.

## Patch: Skip to Next Level

- **Name:** Skip to Next Level
- **Target Package:** `com.tripledot.blackjack`
- **Supported Versions:** `2.22.09`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`) with Extension DEX (`extendWith`)
- **Dependencies:** None
- **Extension Classes:** `app.aidan.extension.blackjack.SkipLevelDialog`

### 1. Motivation & Purpose

Advancing levels in Blackjack normally requires grinding hundreds of hands to accumulate experience points. The **Skip to Next Level** patch allows players to tap the level indicator in the main menu HUD to immediately advance to the next level.

### 2. Technical Implementation & Bytecode Hook

- **Class:** `Lcom/unity3d/player/UnityPlayerActivity;`
- **Method:** `onCreate(Landroid/os/Bundle;)V`
- **Injected Bytecode (immediately before terminal `return-void`):**

  ```smali
  invoke-static {p0}, Lapp/aidan/extension/blackjack/SkipLevelDialog;->install(Landroid/app/Activity;)V
  ```

#### Touch Proxy & Dialog Flow (`SkipLevelDialog.java`)

1. Replaces the activity's `Window.Callback` with a dynamic `java.lang.reflect.Proxy`.
2. Inspects `dispatchTouchEvent` events for `MotionEvent.ACTION_UP`.
3. Validates touch coordinates against the safe-area-relative next-level badge rectangle using `MotionEvent.getX()` and `getY()` against the decor-view bounds and root window insets:
   - `0.75 <= (event.getX() / decorView.getWidth()) <= 0.85`
   - `-0.02 <= ((event.getY() - topSystemInset) / contentHeight) <= 0.05`
   - The badge is anchored at the top of Unity's safe area, which accounts for display cutouts and differing status-bar heights without making the entire top HUD interactive.
4. Debounces taps within 1,500 ms to prevent duplicate dialogs.
5. Reads `value.Level` from `PlayerData.json`.
6. Displays an `AlertDialog` prompting: `"Do you want to skip to Level {currentLevel + 1}?"`.
7. On confirmation, sends `UnitySendMessage("BlackjackApplication", "CheckUpdateToVersion", "skip_level")`. The binary hook sets XP to maximum and executes `EarnXp(1)`, triggering the official level-up sequence and animations.

---

## Patch: Remove Ads

- **Name:** Remove Ads
- **Target Package:** `com.tripledot.blackjack`
- **Supported Versions:** `2.22.09`
- **Default State:** `true` (Enabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None

### 1. Motivation & Purpose

Blackjack displays intrusive interstitial ads between hands, banners along screen borders, and rewarded video containers encouraging players to watch ads for chip bonuses. This patch neutralizes all ad triggers directly at the native IL2CPP binary level.

### 2. Technical Implementation & Binary Modifications

#### Target File: `lib/arm64-v8a/libil2cpp.so`

| Target Function                          | Offset                                                                       | Original Bytes                | Injected Replacement                                                                  | Effect                                |
| ---------------------------------------- | ---------------------------------------------------------------------------- | ----------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------- |
| `PlayerData.get_AdsDisabled`             | `0x1fb5210`                                                                  | `00 b0 40 39 c0 03 5f d6`     | `20 00 80 52 c0 03 5f d6` (`mov w0, #1; ret`)                                         | Forces VIP ad-free status to `true`.  |
| `BlackjackAds.TryShowInterstitial`       | `0x2010568`                                                                  | `ff 03 02 d1 e9 23 03 6d`     | `00 00 80 52 c0 03 5f d6` (`mov w0, #0; ret`)                                         | Prevents interstitial triggers.       |
| `BlackjackAds.ShowInterstitial`          | `0x20109b4`                                                                  | `ff c3 03 d1 fe 5b 00 f9 ...` | `e0 03 1f aa e1 03 1f aa e2 03 1f aa e3 03 1f aa c0 03 5f d6` (`mov x0-x3, xzr; ret`) | Returns empty ad show result.         |
| `AdManager` ad entrypoint                | `0x3bc9530`                                                                  | `ff 83 01 d1`                 | `c0 03 5f d6` (`ret`)                                                                 | No-ops mediation ad initialization.   |
| `AdManager` ad entrypoint                | `0x3bcc22c`                                                                  | `ff 83 01 d1`                 | `c0 03 5f d6` (`ret`)                                                                 | No-ops mediation ad request.          |
| `AdManager` ad entrypoint                | `0x3bce2c4`                                                                  | `fe 0f 1c f8`                 | `c0 03 5f d6` (`ret`)                                                                 | No-ops mediation ad load.             |
| `AdManager` ad entrypoint                | `0x3bce738`                                                                  | `fe 0f 1e f8`                 | `c0 03 5f d6` (`ret`)                                                                 | No-ops mediation ad load callback.    |
| `AdManager` show entrypoints (6 sites)   | `0x3bca7a8`, `0x3bca83c`, `0x3bca868`, `0x3bccd08`, `0x3bccd9c`, `0x3bccdc8` | Various prologues             | `mov x0-x3, xzr; ret` (16 bytes)                                                      | Returns empty ad show result.         |
| `LevelUpRewardScreen.watchAnAdContainer` | `0x1ffd7dc`                                                                  | `21 00 80 52` (`mov w1, #1`)  | `e1 03 1f 2a` (`mov w1, wzr`)                                                         | Sets container visibility to `false`. |

---

## Patch: Remove Tracking and Analytics

- **Name:** Remove Tracking and Analytics
- **Target Package:** `com.tripledot.blackjack`
- **Supported Versions:** `2.22.09`
- **Default State:** `true` (Enabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None

### 1. Motivation & Purpose

Tripledot Blackjack embeds extensive third-party and first-party analytics libraries to record player interactions, game outcomes, hardware profiles, device IDs, and crash dumps. The **Remove Tracking and Analytics** patch injects ARM64 early returns (`ret`) into all native entry points across all six telemetry systems.

### 2. Technical Implementation & Binary Modifications

#### Target File: `lib/arm64-v8a/libil2cpp.so`

Every target is patched with the ARM64 return opcode `c0 03 5f d6` (`ret`):

1. **Tripledot Proprietary Analytics:**
   - `Tripledot Analytics.SendEvent` (`0x3c34240`)
   - `Tripledot Analytics.SendEventInternal` (`0x3c342e8`)
   - `Tripledot Analytics.SendToSinks` (`0x3c34ec4`)
2. **Google Firebase Analytics:**
   - `FirebaseAnalytics.LogEvent` variants (6 entry points): `0x2066dc4`, `0x2066f04`, `0x2067054`, `0x2067194`, `0x20672d4`, `0x20673e4`
3. **Firebase Crashlytics:**
   - Crash and exception report entry points: `0x2091110`, `0x2091258`, `0x20912c0`
4. **Adjust Telemetry & Attribution:**
   - `Adjust.InitSdk` (`0x1f87224`)
   - `Adjust` tracking and session paths (5 entry points): `0x1f89154`, `0x1f8b774`, `0x1f8c440`, `0x1f8c4a8`, `0x1f8cd14`
5. **AppsFlyer Marketing Analytics:**
   - `AppsFlyerManager.Init` (`0x3ca3980`)
6. **Unity Engine Analytics:**
   - `UnityEngine.Analytics.Initialize` (`0x4085868`)

---

## Patch: Remove Internet Permissions

- **Name:** Remove Internet Permissions
- **Target Package:** `com.tripledot.blackjack`
- **Supported Versions:** `2.22.09`
- **Default State:** `true` (Enabled by default)
- **Type:** XML Resource Patch (`resourcePatch`)
- **Dependencies:** None

### 1. Motivation & Purpose

The app's Internet permission permits all outbound and inbound network communication. The **Remove Internet Permissions** patch removes the request so Android denies the app network access. Its **Remove Broken Screens** option is enabled by default and removes the Settings and Daily Challenge Help Center buttons, whose Zendesk content cannot load without Internet access.

### 2. Technical Implementation

The patch edits `AndroidManifest.xml` through the XML DOM and removes every `uses-permission` or `uses-permission-sdk-23` declaration whose `android:name` is `android.permission.INTERNET`. It reads the Android namespace attribute with a prefix-preserving fallback and fails fast when no matching declaration exists, preventing a version mismatch from silently producing an incomplete patch.

When **Remove Broken Screens** is enabled, the patch changes the serialized `m_IsActive` flag from `true` to `false` for both `Button_HelpCenter` Unity `GameObject` instances in `assets/bin/Data/sharedassets0.assets.split71`. Active-state byte offsets are deterministically discovered and verified across game updates using `apk-lab unity <artifact> --gameobject Button_HelpCenter`. It accepts an already-disabled button and fails if the expected active-state byte differs.

---

## Patch: Remove Notifications

- **Name:** Remove Notifications
- **Target Package:** `com.tripledot.blackjack`
- **Supported Versions:** `2.22.09`
- **Default State:** `true` (Enabled by default)
- **Type:** XML Resource Patch (`resourcePatch`)
- **Dependencies:** None

### 1. Motivation & Purpose

Tripledot Blackjack requests Android notification access for promotional push alerts, chip reminders, and re-engagement messaging. The **Remove Notifications** patch removes the request so the operating system cannot grant or post those notifications.

### 2. Technical Implementation

The patch edits `AndroidManifest.xml` through the XML DOM and removes every `uses-permission` or `uses-permission-sdk-23` declaration whose `android:name` is `android.permission.POST_NOTIFICATIONS`. It reads the Android namespace attribute with a prefix-preserving fallback and fails fast when no matching declaration exists, preventing a version mismatch from silently producing an incomplete patch.

---

## Verification & Preconditions

1. Target application must be **Blackjack** (`com.tripledot.blackjack`), version `2.22.09`, signed by SHA-256 certificate `32e1c2b4c9ab0189d3e4e1c67806e6f4fc454aa758a74ccaedda8a309aa6b205`.
2. Target binary `lib/arm64-v8a/libil2cpp.so` must exist and match expected prologue byte sequences at all declared offsets.
3. Build verification: `./gradlew :patches:buildAndroid clean --no-daemon`.
4. Metadata verification: `./gradlew generatePatchesList` confirms all 7 patches serialize correctly.
