# Viber Morphe Patches - Development & Reverse Engineering Guide 🛠️

This guide walks through how Morphe patches operate and how to find and update bytecode fingerprints across new versions of Viber (`com.viber.voip`).

---

## 1. Prerequisites & Tooling

To inspect Viber APKs and match bytecode fingerprints, install:
* **[Jadx-GUI](https://github.com/skylot/jadx):** Fast DEX to Java decompiler and search tool.
* **[Apktool](https://ibotpeaches.github.io/Apktool/):** Resource decoding and smali disassembler.
* **[Morphe Desktop](https://github.com/MorpheApp/morphe-desktop):** CLI tool for applying Morphe `.mpp` patches directly on your computer.
* **[Android Build-tools](https://developer.android.com/studio):** `apksigner` and `adb` for signing and installing modified APKs.

---

## 2. Reverse Engineering Viber Bytecode

### A. Obtaining the Viber APK
Obtain a clean, base APK of Viber from an APK mirror (e.g., APKMirror or via `adb pull` from your test phone).
```bash
adb shell pm path com.viber.voip
adb pull /data/app/.../base.apk viber-base.apk
```

### B. Opening in Jadx-GUI
Open `viber-base.apk` in Jadx-GUI (`jadx-gui viber-base.apk`).

---

## 3. Finding Fingerprints

Morphe patches use **Fingerprints** to locate classes and methods resiliently, even when code is obfuscated by ProGuard/R8.

### 1. Ad Suppression Fingerprints
* Search in Jadx for strings:
  * `"ad_unit_id"`
  * `"banner_ad"`
  * `"ads_manager"`
* Once you locate the method that queries or renders banner ads (e.g., `isAdEnabled()` or `loadAd()`):
* Inspect its smali or signature in Jadx (`Copy as smali`):
  * **Return Type:** `Z` (boolean) or `V` (void)
  * **Parameters:** `listOf("Ljava/lang/String;")`
  * Update `ViberAdLoaderFingerprint` in `patches/src/main/kotlin/app/morphe/patches/viber/ad/Fingerprints.kt`.

### 2. Ghost Mode (Read Receipts & Typing)
* Search in Jadx for:
  * `read_receipt`
  * `sendSeenStatus`
  * `typing_state`
* In Viber, read receipts are triggered when a conversation viewport enters the focus with unread message IDs.
* Intercept the dispatcher method that enqueues the status packet to the network thread.
* Update `ReadReceiptDispatcherFingerprint` in `patches/src/main/kotlin/app/morphe/patches/viber/privacy/Fingerprints.kt`.

### 3. Anti-Delete Messages
* Search in Jadx for:
  * `delete_message`
  * `retract_message`
  * `FLAG_DELETED`
* Viber marks messages as retracted in SQLite database sync handlers when receiving a sync event from another user.
* By short-circuiting the method with `return false`, the database update is ignored and the message text remains stored on device.
* Update `MessageRetractionHandlerFingerprint` in `patches/src/main/kotlin/app/morphe/patches/viber/messages/Fingerprints.kt`.

### 4. Secondary Device Mode (Companion Pairing)
* Search in Jadx for:
  * `smallestScreenWidthDp`
  * `"is_tablet"`
  * `device_type`
  * `RegistrationStep`
* Viber checks whether the current device is a tablet (`isTablet()`). If true, the onboarding state machine routes to `CompanionActivationActivity` or `QrActivationFragment` instead of the SMS verification step.
* Hooking `isTablet()` to return `true` triggers the native companion pairing screen on any smartphone form factor.
* Update `IsTabletCheckFingerprint` and `DeviceTypeResolverFingerprint` in `patches/src/main/kotlin/app/morphe/patches/viber/secondary/Fingerprints.kt`.

---

## 4. Testing Your Patches with Morphe Desktop

Instead of transferring files to your phone repeatedly, test your changes using Morphe Desktop:

```bash
# 1. Compile the Morphe patch bundle
./gradlew build

# 2. Apply patches with Morphe Desktop CLI
morphe-desktop patch \
  --patches patches/build/libs/viber-morphe-patches-1.0.0.mpp \
  --apk viber-base.apk \
  --out viber-patched.apk

# 3. Sign the patched APK
apksigner sign --ks test.keystore --ks-pass pass:android viber-patched.apk

# 4. Install onto your connected Android device
adb install -r viber-patched.apk
```

---

## 5. Adding to Morphe Manager (Mobile)

When releasing:
1. Push your repository to GitHub.
2. Create a tag / release (e.g., `v1.0.0`).
3. The GitHub Actions workflow will automatically compile the `.mpp` patch file and update `patches-bundle.json`.
4. In **Morphe Manager** on Android, go to **Settings > Sources > Add custom source**, enter:
   `https://raw.githubusercontent.com/<username>/viber-morphe-patches/main/patches-bundle.json`
5. The patches will appear in your patch list whenever Viber is selected!
