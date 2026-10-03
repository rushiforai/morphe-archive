# Blackjack Patch Specifications

## Overview

This document details the binary bytecode and native asset patches available for **Blackjack** (`com.tripledot.blackjack`).

| Patch Name | Type | Default | Description |
|---|---|---|---|
| [Custom Chip Store Binary Hook](#patch-custom-chip-store-binary-hook) | `rawResourcePatch` | `true` | Installs the native ARM64 hook in `libil2cpp.so` to redirect store taps to the Android popup dialog and enable setting chip balances. |
| [Add Custom Chip Store](#patch-add-custom-chip-store) | `bytecodePatch` | `true` | Replaces the defunct in-game chip store with a native Android dialog allowing players to enter any chip amount. |
| [Skip to Next Level](#patch-skip-to-next-level) | `bytecodePatch` | `true` | Allows players to skip to the next level by tapping the level progress indicator in the main menu. |
| [Remove Ads](#patch-remove-ads) | `rawResourcePatch` | `true` | Removes banner, interstitial, and rewarded advertising and removes ad-based chip offers. |
| [Remove Tracking and Analytics](#patch-remove-tracking-and-analytics) | `rawResourcePatch` | `true` | Neutralizes active advertising telemetry, analytics, attribution, and crash reporting. |

---

## Patch: Custom Chip Store Binary Hook

- **Name:** Custom Chip Store Binary Hook
- **Target Package:** `com.tripledot.blackjack`
- **Supported Versions:** `2.22.08`
- **Default State:** `true` (Enabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None

### 1. Motivation & Purpose

In offline or patched environments, Blackjack's native in-game chip store is non-functional. Furthermore, the game contains no native debugging UI or console for setting chip balances or advancing levels.

The **Custom Chip Store Binary Hook** patch provides the foundational native ARM64 engine modifications inside `lib/arm64-v8a/libil2cpp.so`:
1. **Redirects Store Taps:** Rewires `BlackjackApplication.OpenShop` to invoke the native dialog bridge `MNAndroidNative.showDialog`, surfacing the Android popup.
2. **Unified Command Dispatcher:** Replaces `BlackjackApplication.CheckUpdateToVersion` with a custom 192-byte ARM64 assembly routine (`UNIFIED_APP_HOOK`). When messages arrive from Java via `UnityPlayer.UnitySendMessage("BlackjackApplication", "CheckUpdateToVersion", message)`:
   - If the message parses as an integer: updates player chips. If the new balance is less than or equal to current chips, it calls `PlayerProfile.SetDebugCredit`. If greater, it calls `BlackjackApplication.AddChips` with the delta and plays chip reward animations.
   - If the message equals `"skip_level"`: reads `PlayerProfile.LevelData.XPPerLevel`, sets `PlayerData.XP` to the target threshold, calls `PlayerProfile.EarnXp(bet = 1)` to trigger level-up routines, and re-enters the table via `BlackjackApplication.GoToLastPlayedTable`.

### 2. Technical Implementation & Binary Modifications

#### Target File: `lib/arm64-v8a/libil2cpp.so`

1. **`BlackjackApplication.OpenShop` (Offset `0x1fbb1b4`):**
   - **Expected Prologue:** `fe 0f 1a f8 fc 6f 01 a9 fa 67 02 a9 f8 5f 03 a9 f6 57 04 a9` (or previous legacy grant bytes)
- **Replacement Hook (32 bytes):**
     ```arm64
     str x30, [sp, #-0x10]!
     mov x0, xzr
     mov x1, xzr
     mov x2, xzr
     mov x3, xzr
     bl  0x3c59a44             ; bl MNAndroidNative.showDialog
     ldr x30, [sp], #0x10
     ret
     ```
     Opcodes: `fe 0f 1f f8 e0 03 1f aa e1 03 1f aa e2 03 1f aa e3 03 1f aa 1f 6a 72 94 fe 07 41 f8 c0 03 5f d6`

2. **`BlackjackApplication.CheckUpdateToVersion` (Offset `0x1fbc330`):**
   - **Expected Prologue:** `fe 5f bd a9 f6 57 01 a9 f4 4f 02 a9` (or previous set credit hook bytes)
   - **Replacement Hook (192 bytes, `UNIFIED_APP_HOOK`):**
     - Saves `x19` (this pointer) and `x30` (link register).
     - Calls `System.Int64.TryParse(x0 = message, out x1 = sp + 0x10)` at `0x3567cc4`.
     - On parse success:
       - Loads `x19->PlayerProfile` (`[x19, #0x38]`) and current chips (`[[x2, #0x10], #0x10]`).
       - Calculates delta (`newCredit - oldCredit`).
       - If non-positive: invokes `PlayerProfile.SetDebugCredit(x0, x1)` at `0x1fba4bc`.
       - If positive: invokes `BlackjackApplication.AddChips(x0, delta, RewardOption.None = 0, visualize = 1)` at `0x1fbf820`.
     - On parse failure (e.g. `"skip_level"`):
       - Obtains `PlayerProfile.get_LevelData()` at `0x1fb94c8`.
       - Reads `LevelData.XPPerLevel` (`[x0, #0x20]`).
       - Overwrites `PlayerProfile.PlayerData.XP` (`[x8, #0x20] = XPPerLevel`).
       - Invokes `PlayerProfile.EarnXp(x0, bet = 1)` at `0x1fb9b9c`.
       - Invokes `BlackjackApplication.GoToLastPlayedTable(x0)` at `0x1fbf9c8`.
       - Restores registers and returns `true` (`1`).

---

## Patch: Add Custom Chip Store

- **Name:** Add Custom Chip Store
- **Target Package:** `com.tripledot.blackjack`
- **Supported Versions:** `2.22.08`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`) with Extension DEX (`extendWith`)
- **Dependencies:** `Custom Chip Store Binary Hook`
- **Extension Classes:** `app.aidan.extension.blackjack.ChipBalanceDialog`

### 1. Motivation & Purpose

When the player taps the in-game chip store button in the navigation bar, `Custom Chip Store Binary Hook` redirects execution to `MNAndroidNative.showDialog`. This Dalvik patch intercepts that bridge method and displays a native Android `AlertDialog` with an editable text field pre-populated with the user's current chips.

### 2. Technical Implementation & Bytecode Hook

- **Class:** `Lcom/mnp/popups/NativePopupsManager;`
- **Method:** `ShowDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V`
- **Injected Bytecode (at instruction offset 0):**
  ```smali
  invoke-static {}, Lapp/aidan/extension/blackjack/ChipBalanceDialog;->show()V
  return-void
  ```

#### Extension Behavior (`ChipBalanceDialog.java`):
1. Resolves `com.unity3d.player.UnityPlayer.currentActivity` reflectively.
2. Reads current chips from `SimpleStorage/PlayerData.json` (`value.Credit`).
3. Inflates an `AlertDialog` with a numeric `EditText` padded with 24dp horizontal margins.
4. On positive action ("Set Chips"):
   - Parses the input text, removing commas and spaces.
   - Clamps negative values to `0`.
   - Sends the decimal string to Unity via `UnitySendMessage("BlackjackApplication", "CheckUpdateToVersion", amount)`.

---

## Patch: Skip to Next Level

- **Name:** Skip to Next Level
- **Target Package:** `com.tripledot.blackjack`
- **Supported Versions:** `2.22.08`
- **Default State:** `true` (Enabled by default)
- **Type:** Dalvik Bytecode Patch (`bytecodePatch`) with Extension DEX (`extendWith`)
- **Dependencies:** `Add Custom Chip Store`
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

#### Touch Proxy & Dialog Flow (`SkipLevelDialog.java`):
1. Replaces the activity's `Window.Callback` with a dynamic `java.lang.reflect.Proxy`.
2. Inspects `dispatchTouchEvent` events for `MotionEvent.ACTION_UP`.
3. Validates coordinates against a safe-area-relative next-level badge rectangle:
   - `0.75 <= (rawX / screenWidth) <= 0.85`
   - `-0.02 <= ((rawY - topSystemInset) / safeAreaHeight) <= 0.05`
   - The badge is anchored at the top of Unity's safe area, which accounts for display cutouts and differing status-bar heights without making the entire top HUD interactive.
4. Debounces taps within 1,500 ms to prevent duplicate dialogs.
5. Reads `value.Level` from `PlayerData.json`.
6. Displays an `AlertDialog` prompting: `"Do you want to skip to Level {currentLevel + 1}?"`.
7. On confirmation, sends `UnitySendMessage("BlackjackApplication", "CheckUpdateToVersion", "skip_level")`. The binary hook sets XP to maximum and executes `EarnXp(1)`, triggering the official level-up sequence and animations.

---

## Patch: Remove Ads

- **Name:** Remove Ads
- **Target Package:** `com.tripledot.blackjack`
- **Supported Versions:** `2.22.08`
- **Default State:** `true` (Enabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None

### 1. Motivation & Purpose

Blackjack displays intrusive interstitial ads between hands, banners along screen borders, and rewarded video containers encouraging players to watch ads for chip bonuses. This patch neutralizes all ad triggers directly at the native IL2CPP binary level.

### 2. Technical Implementation & Binary Modifications

#### Target File: `lib/arm64-v8a/libil2cpp.so`

| Target Function | Offset | Original Bytes | Injected Replacement | Effect |
|---|---|---|---|---|
| `PlayerData.get_AdsDisabled` | `0x1fa0d28` | `00 b0 40 39 c0 03 5f d6` | `20 00 80 52 c0 03 5f d6` (`mov w0, #1; ret`) | Forces VIP ad-free status to `true`. |
| `BlackjackAds.TryShowInterstitial` | `0x1ffc014` | `ff 03 02 d1 e9 23 03 6d` | `00 00 80 52 c0 03 5f d6` (`mov w0, #0; ret`) | Prevents interstitial triggers. |
| `BlackjackAds.ShowInterstitial` | `0x1ffc460` | `ff c3 03 d1 fe 5b 00 f9 ...` | `e0 03 1f aa e1 03 1f aa e2 03 1f aa e3 03 1f aa c0 03 5f d6` (`mov x0-x3, xzr; ret`) | Returns empty ad show result. |
| `AdManager` ad entrypoint | `0x3b86238` | `ff 83 01 d1` | `c0 03 5f d6` (`ret`) | No-ops mediation ad initialization. |
| `AdManager` ad entrypoint | `0x3b88f2c` | `ff 83 01 d1` | `c0 03 5f d6` (`ret`) | No-ops mediation ad request. |
| `AdManager` ad entrypoint | `0x3b8afc4` | `fe 0f 1c f8` | `c0 03 5f d6` (`ret`) | No-ops mediation ad load. |
| `AdManager` ad entrypoint | `0x3b8b438` | `fe 0f 1e f8` | `c0 03 5f d6` (`ret`) | No-ops mediation ad load callback. |
| `AdManager` show entrypoints (6 sites) | `0x3b874b0`, `0x3b87544`, `0x3b87570`, `0x3b89a08`, `0x3b89a9c`, `0x3b89ac8` | Various prologues | `mov x0-x3, xzr; ret` (16 bytes) | Returns empty ad show result. |
| `LevelUpRewardScreen.watchAnAdContainer` | `0x1fe92bc` | `21 00 80 52` (`mov w1, #1`) | `e1 03 1f 2a` (`mov w1, wzr`) | Sets container visibility to `false`. |

---

## Patch: Remove Tracking and Analytics

- **Name:** Remove Tracking and Analytics
- **Target Package:** `com.tripledot.blackjack`
- **Supported Versions:** `2.22.08`
- **Default State:** `true` (Enabled by default)
- **Type:** Raw Binary / Asset Patch (`rawResourcePatch`)
- **Dependencies:** None

### 1. Motivation & Purpose

Tripledot Blackjack embeds extensive third-party and first-party analytics libraries to record player interactions, game outcomes, hardware profiles, device IDs, and crash dumps. The **Remove Tracking and Analytics** patch injects ARM64 early returns (`ret`) into all native entry points across all six telemetry systems.

### 2. Technical Implementation & Binary Modifications

#### Target File: `lib/arm64-v8a/libil2cpp.so`
Every target is patched with the ARM64 return opcode `c0 03 5f d6` (`ret`):

1. **Tripledot Proprietary Analytics:**
   - `Tripledot Analytics.SendEvent` (`0x3bf0f30`)
   - `Tripledot Analytics.SendEventInternal` (`0x3bf0fd8`)
   - `Tripledot Analytics.SendToSinks` (`0x3bf1bb4`)
2. **Google Firebase Analytics:**
   - `FirebaseAnalytics.LogEvent` variants (6 entry points): `0x20524b4`, `0x20525f4`, `0x2052744`, `0x2052884`, `0x20529c4`, `0x2052ad4`
3. **Firebase Crashlytics:**
   - Crash and exception report entry points: `0x207c800`, `0x207c948`, `0x207c9b0`
4. **Adjust Telemetry & Attribution:**
   - `Adjust.InitSdk` (`0x1f72d3c`)
   - `Adjust` tracking and session paths (5 entry points): `0x1f74c6c`, `0x1f7728c`, `0x1f77f58`, `0x1f77fc0`, `0x1f7882c`
5. **AppsFlyer Marketing Analytics:**
   - `AppsFlyerManager.Init` (`0x3c60670`)
6. **Unity Engine Analytics:**
   - `UnityEngine.Analytics.Initialize` (`0x4103644`)

---

## Verification & Preconditions

1. Target application must be **Blackjack** (`com.tripledot.blackjack`), version `2.22.08`, signed by SHA-256 certificate `32e1c2b4c9ab0189d3e4e1c67806e6f4fc454aa758a74ccaedda8a309aa6b205`.
2. Target binary `lib/arm64-v8a/libil2cpp.so` must exist and match expected prologue byte sequences at all declared offsets.
3. Build verification: `./gradlew :patches:buildAndroid clean --no-daemon`.
4. Metadata verification: `./gradlew generatePatchesList` confirms all 5 patches serialize correctly.
