# Viber Morphe Patches 🟣

Custom bytecode and resource patch bundle for **Viber** (`com.viber.voip`) designed to run seamlessly with **[Morphe Manager](https://morphe.software/)** and **Morphe Desktop**.

---

## 🚀 Features & Patches

| Patch | ID | Description |
| :--- | :--- | :--- |
| **Hide Ads** | `viber-hide-ads` | Suppresses in-app banner ads, chat list promotional cards, and post-call full-screen ads. |
| **Ghost Mode** | `viber-ghost-mode` | Disables sending read receipts ("seen" double checkmarks) and typing indicators to other participants. |
| **Anti-Delete Messages** | `viber-anti-delete` | Blocks remote retraction commands so you can continue viewing messages even if the sender deletes them. |
| **Clean UI** | `viber-clean-ui` | Hides the Explore/Discover tab, marketing banners, and sticker store badges for a minimal messenger experience. |
| **Secondary Device Mode** | `viber-secondary-device` | Enables running Viber on 2 mobile phones simultaneously via QR companion pairing without deactivating the primary phone. |

---

## 📁 Repository Structure

```
viber-morphe-patches/
├── .github/workflows/          # Automated GitHub Actions release workflow
├── extensions/
│   └── viber/                  # Android companion runtime library (injected into Viber APK)
│       ├── src/main/java/app/morphe/extension/viber/
│       │   ├── ViberModPreferences.kt    # In-app settings & toggles
│       │   ├── AdBlockHook.kt            # Ad suppression hooks
│       │   ├── PrivacyHook.kt            # Ghost mode hooks
│       │   ├── AntiDeleteHook.kt         # Message retention hooks
│       │   └── UiHook.kt                 # UI customization hooks
│       └── build.gradle.kts
├── patches/                    # Bytecode & Resource patches (Morphe DSL)
│   ├── src/main/kotlin/app/morphe/patches/viber/
│   │   ├── shared/Constants.kt           # Package names & target compatibility
│   │   ├── ad/                           # Hide Ads patch & fingerprints
│   │   ├── privacy/                      # Ghost mode patch & fingerprints
│   │   ├── messages/                     # Anti-delete patch & fingerprints
│   │   ├── ui/                           # Clean UI patch & fingerprints
│   │   └── all/AllPatches.kt             # Patch collection registry
│   └── build.gradle.kts
├── patches-bundle.json         # Bundle metadata for Morphe Manager
├── patches-list.json           # Patch list manifest for Morphe Manager
├── settings.gradle.kts         # Root Gradle build configuration
└── DEVELOPMENT_GUIDE.md        # Step-by-step reverse engineering & patching guide
```

---

## 📲 How to Use in Morphe Manager

### Method 1: Using Morphe Manager (Android App)
1. Install **Morphe Manager** on your Android device from [morphe.software](https://morphe.software/).
2. Open **Morphe Manager** and navigate to **Settings** > **Sources**.
3. Under **Patches source**, add your hosted repository or release URL (pointing to `patches-bundle.json`).
4. Return to the **Dashboard** and tap **Patcher**.
5. Select **Viber** (`com.viber.voip`) from your installed apps or choose a downloaded Viber APK.
6. Select your preferred patches (Hide ads, Ghost mode, Anti-delete, Clean UI).
7. Tap **Patch**, wait for the bytecode patching to complete, then tap **Install**.

---

## 👥 How to Use Viber on 2 Mobile Phones Simultaneously

By default, activating a phone number on a second mobile phone immediately logs out and disables the first phone. With the **Secondary Device Mode** patch, your second phone links as an official companion device:

1. **Keep Phone 1 (Primary):** Leave Viber running normally on your first phone.
2. **Patch & Install on Phone 2 (Secondary):** 
   - Apply the **Secondary device mode** patch to the Viber APK using Morphe Manager.
   - Install the patched APK on your second phone.
3. **Open Viber on Phone 2:**
   - Launch Viber and tap **Start now**.
   - Enter your primary phone number.
   - Because of the patch, instead of triggering SMS verification (which invalidates Phone 1), Viber displays a **QR code pairing screen**!
4. **Link Devices:**
   - On **Phone 1**, open Viber -> tap **More** -> tap the **QR Code Scanner** icon in the top right.
   - Scan the QR code displayed on **Phone 2**.
5. **Done!** Both phones are now active simultaneously on the same account. Incoming messages, chats, and calls will ring on both devices.

---

## 🛠️ Building the Patches Locally

### Requirements
* **JDK 17** or newer
* **Android SDK** (API 34)

### Build Commands
Compile and package the Morphe patch bundle:
```bash
# On Windows
.\gradlew build

# On Linux / macOS
./gradlew build
```

The resulting compiled Morphe Patch file (`.mpp`) will be generated under:
```
patches/build/libs/patches-<version>.mpp
```

---

## 🔍 Updating Fingerprints for New Viber Releases
See [DEVELOPMENT_GUIDE.md](file:///C:/Users/Kal/.gemini/antigravity/scratch/viber-morphe-patches/DEVELOPMENT_GUIDE.md) for detailed instructions on decompiling Viber APKs with Jadx and updating smali fingerprints.

---

## ⚖️ License & Disclaimer
This project is for educational and interoperability research purposes. Viber is a trademark of Rakuten Viber.
Licensed under the GNU General Public License v3.0 (GPL-3.0).
