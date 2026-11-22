# 👋 Tokudai's Patches

Clean, ad-free experience, UI decluttering, and reliable enhancements for Android applications, designed for seamless integration with **[Morphe Manager](https://morphe.software)**.

<a href="https://morphe.software/add-source?github=tokudai-vs/tokudai-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

---

## 📱 Supported Applications

| App | Package Name | Compatible Versions | APK Download |
|---|---|---|---|
| **MyGate** | `com.mygate.user` | `7.40.1`, `7.39.0`, `7.38.2` | [Direct APK (APKCube)](https://apkcube.com/mygate/com.mygate.user) |

---

## 🛡️ MyGate (`com.mygate.user`)

> **Direct APK download:** [APKCube MyGate Archive](https://apkcube.com/mygate/com.mygate.user)  
> Supported and verified on MyGate version **7.40.1** (arm64-v8a).

Available as **5 modular, independent patches** so you can pick and choose exactly what you want:

### 1. 🚫 Remove ads
Comprehensive native and Flutter ad blocking without unwanted UI side effects:
- **MyGate Ad SDK Suppression**: Short-circuits all `MygateAdLoader` methods (`loadAd`, `loadGlobalMastheadAd`, `loadImageAd`, `getMyGateAdData`, `getMyGateMultiAdData`), `FloatingBannerAdHandler`, and disables native ad flags on flats and user profiles.
- **Flutter Binary Ad Sinkhole**: Sinks ad endpoints in `libapp.so` (`cmp.mygate.com`, `classifieds-be.mygate.com`, `metrics.kappa.mgmaglev.xyz`, etc.) to localhost (`127.0.0.1:9099`).
- **Flutter Feed Ad Neutralization**: Injects `USER_PREMIUM_PLAN` / `SOCIETY_PREMIUM_PLAN` into the Flutter MethodChannel payload to eliminate sponsored community notices and feed ads.
- **VIP Crown & Badge Neutralization**: Neutralizes promotional badges and VIP crown icons (`layout_plan_badge.xml`, `view_flat_selection.xml`, `ic_premium_user.svg`, `KotlinUtils.Companion.M`) so they never display.
- **Feature Limits Bypass**: Unlocks frequent delivery, visitor, and cab limits (`freqDelivery`, `surpriseDelivery`, `freqCab`, `freqVisitingHelp`, `freqGuest`).

### 2. 🔔 GmsCore support
Enables 100% working push notifications, gate approval alerts, and e-Intercom on non-root, re-signed APKs using **MicroG-RE**:
- **MicroG-RE Default**: Targets `app.revanced.android.gms` ([MorpheApp/MicroG-RE](https://github.com/MorpheApp/MicroG-RE)) by default, ensuring instant push notifications out of the box while also supporting custom MicroG builds (`app.morphe.android.gms`) via patch options.
- **Package Spoofing & Visibility**: Injects spoofed metadata (`SPOOFED_PACKAGE_NAME` = `com.mygate.user`, `SPOOFED_PACKAGE_SIGNATURE`) and Android 11+ package visibility queries for MicroG-RE.
- **C2DM Redirection**: Rewrites all GCM/C2DM permissions, broadcast receivers, and intent actions to the configured MicroG vendor.
- **Firebase HTTPS Certificate Spoofing**: Patches `X-Android-Cert` HTTP headers during Firebase Installations Service (FIS) token registration to match the original MyGate developer signing certificate (`AAB7E367980DA927FB146E862057CC87CD766987`), avoiding `FIS_AUTH_ERROR`.
- **Approval Notification Routing**: Directly routes visitor approval intents to `NotificationCampaignActivity` rather than `SplashActivity` so instant gate approvals work directly from heads-up alerts.
- **Notification Troubleshooting Diagnostics**: Patches `TestNotificationTroubleshootingViewModel` and `tokenNotFound` checks so the built-in MyGate Notification Troubleshooting screen reports all checks passing.

### 3. 🧭 Hide bottom navigation bar
Streamlines screen real estate:
- **Collapses Bottom Bar**: Hides `@id/bottomNavigationView` and the community button (`@id/btnCommunity`).
- **Full-Screen Layout**: Expands the main view container (`@id/container`) to full height without awkward spacing.

### 4. ⚙️ Clean up Settings page
Eliminates all remaining promotional widgets and blank gaps in Settings:
- **Collapses Bloat Widgets**: Hides plan info cards, referral ("Tell a friend") sections, and subscription management links (`@id/clPlanInfo`, `@id/my_plans`, `@id/cl_tell_a_friend`, `@id/clManageCancelSubscription`).
- **Zero-Gap Layout**: Zeroes out empty margins, padding, and unused horizontal divider lines for a tight, polished UI.

### 5. 🏠 Remove home screen bloat
Keeps the home screen focused purely on gate approvals and household entries:
- **Hides Community Posts**: Removes the "Community Posts" section (`@id/community_list_layout`, `@id/tvCommunity`) from the home screen bottom sheet.
- **Filters Quick Actions**: Strips Community, Feed, Smart Devices, Marketplace, and Settings shortcuts from the Quick Actions grid.

---

## 📲 How to Use in Morphe Manager

### Step 1: Add Patch Source
- **One-tap:** Tap the **Add to Morphe** button above on your Android device.
- **Manual:**
  1. Open **Morphe Manager** on your Android device.
  2. Tap **Settings** (bottom-right gear) → **Sources**.
  3. Tap the **`+`** (Add Source) button.
  4. Enter the repository URL:
     ```
     https://github.com/tokudai-vs/tokudai-patches
     ```
  5. *(Optional)* If you wish to receive bleeding-edge pre-releases from the `dev` branch, enable the **Pre-release** toggle for this source.

### Step 2: Patch Your App
1. Go to the **Patcher** tab.
2. Tap **Select an application** and choose **MyGate** (`com.mygate.user`).
   - If not installed, download the compatible APK (version `7.40.1`) from [APKCube](https://apkcube.com/mygate/com.mygate.user).
3. Select your desired patches:
   - ✅ **Remove ads**
   - ✅ **GmsCore support**
   - ✅ **Hide bottom navigation bar**
   - ✅ **Clean up Settings page**
   - ✅ **Remove home screen bloat**
4. Tap **Patch**.
5. Once patching finishes, tap **Install**.

---

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/tokudai-vs/tokudai-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**5 patches** across **1 apps**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**MyGate**](PATCHES.md#mygate-commygateuser) | 5 | `7.38.2`, `7.39.0`, `7.40.1` | [`com.mygate.user`](https://play.google.com/store/apps/details?id=com.mygate.user) |
<!-- PATCHES_END -->

---

## 🛠️ Building Locally

To build the `.mpp` patch bundle locally:
```bash
git clone https://github.com/tokudai-vs/tokudai-patches.git
cd tokudai-patches
./gradlew buildAndroid
```
The compiled patch bundle will be generated at:
```
patches/build/libs/patches-<version>.mpp
```

---

## 📜 License

Licensed under the [GNU General Public License v3.0](LICENSE).
