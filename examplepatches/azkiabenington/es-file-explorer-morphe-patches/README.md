# 🧩 ES File Explorer Optimized Morphe Patches

Custom Morphe patches for **ES File Explorer (`com.estrongs.android.pop`)** targeting version `4.4.2.2.1` and `4.4.3.x`.

## 🚀 Features

* **🔓 Unlock VIP Lifetime**: Unlocks VIP features permanently, removes ads, forces lifetime license state, and suppresses signature mismatch warnings.
* **🚫 Block Ads**: Total suppression of all banner ads, interaction interstitial popups, video player pause ads, and charge saver popups.
* **🛡️ Block Tracking & Telemetry**: Completely kills UMeng SDK analytics initialization, device telemetry, install source reporting, and ad event tracking.
* **⚡ Make App Lightweight & Fast Launch**: Instant app start skipping splash delay screen, auto-finishes background-return nag screens, and bypasses upgrade modal dialogs.

---

## 📲 How to Use in Morphe Manager

### Method 1: Remote (GitHub Source)
1. Open **Morphe Manager** on your Android device.
2. Go to **Settings** -> **Sources** -> **Add Source**.
3. Choose **Remote** tab.
4. Enter repository URL:
   ```
   github.com/azkiabenington/es-file-explorer-morphe-patches
   ```
5. Or tap the one-click deep link:  
   👉 [Add to Morphe Manager](https://morphe.software/add-source?github=azkiabenington/es-file-explorer-morphe-patches)

### Method 2: Local File (`.mpp`)
1. Download or copy `patches-*.mpp` from [Releases](https://github.com/azkiabenington/es-file-explorer-morphe-patches/releases) to your phone.
2. In Morphe Manager, select **Add patch source** -> **Local**.
3. Select the `.mpp` file and start patching!

---

## 🛠️ Building Locally

```bash
# Clone repository
git clone https://github.com/azkiabenington/es-file-explorer-morphe-patches.git
cd es-file-explorer-morphe-patches

# Build .mpp package
./gradlew :patches:build
```

Generated `.mpp` bundle will be located at:
`patches/build/libs/patches-*.mpp`

## 📜 License
Licensed under [GPLv3](LICENSE).

