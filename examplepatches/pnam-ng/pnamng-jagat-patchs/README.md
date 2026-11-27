# Jagat Morphe Patches

Official patch bundle for **Jagat** (`io.jagat.lite`) built for the **Morphe Patcher** ecosystem.

Tested target: **6.8.4** (Version Code: `417`).

---

## Features

### 1. Ad Blocking (Priority)
- **TopOn Mediation Disabled**: Hooks into `TopOnAdManager` and short-circuits initialization, splash ads, banner ads, and interstitial ad requests.
- **ScreenAdActivity Suppressed**: Automatically dismisses fullscreen popup ads on launch and during app usage by calling `finish()` immediately.
- **Background Video Fetch Blocked**: Stops `ScreenAdFetch` from quietly downloading video ad assets in the background, saving mobile data and storage.
- **In-App Ad Views Hidden**: Forces `AdConfigManager.getConfigIsShow()` to return `false` and collapses promotional ad containers (`UserAdsBannerView`, `AdsView`) to `View.GONE`.

### 2. Location Customization & Ghost Mode
- **Freeze Location**: Locks your reported coordinates to a static position so your friends see you in place even when you move.
- **Mock Coordinates**: Allows injecting custom latitude and longitude values.
- **Stealth / Anti-Detection**: Clears the `isFromMockProvider` flag from the `Location` object before Jagat's services transmit it upstream.

### 3. Battery Optimization
- **Idle Polling Throttle**: Checks display state inside `LongTimeLocWorker.doWork()`. When the screen is off, background GPS pings are throttled and wakelocks are released immediately.
- Prevents phone overheating and reduces battery drain caused by continuous location tracking.

---

## Usage

### Method 1: Using Morphe Manager (Android)

1. Open **Morphe Manager** on your Android device.
2. Navigate to **Settings** > **Sources**.
3. Tap **Add Source** (`+`) and enter:
   ```text
   pnam-ng/pnamng-jagat-patchs
   ```
   *(or the full URL: `https://github.com/pnam-ng/pnamng-jagat-patchs`)*
4. Go back to the **Apps** tab, select **Jagat** (`io.jagat.lite`), and choose your desired patches:
   - `Chặn quảng cáo (Block Ads)`
   - `Chỉnh sửa vị trí & Đóng băng toạ độ (Ghost Mode)`
   - `Tối ưu pin & Giảm tải nền (Battery Optimization)`
5. Tap **Patch** and install the generated APK.

---

### Method 2: Build from Source

Requirements:
- Android SDK (API 26+)
- JDK 17 or higher

Clone and compile the `.mpp` patch bundle:

```bash
git clone https://github.com/pnam-ng/pnamng-jagat-patchs.git
cd pnamng-jagat-patchs
./gradlew :patches:buildAndroid
```

The compiled patch bundle will be generated at:
```text
patches/build/libs/patches-1.0.0.mpp
```

---

## Automated Releases

This repository uses GitHub Actions (`.github/workflows/release.yml`) with semantic-release to automatically build, test, and attach `.mpp` bundles to GitHub Releases whenever changes land on the `main` branch.

---

## License

GPL-3.0 License.
