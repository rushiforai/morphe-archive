# Moving from Google Maps for BYD phone edition to Automotive

We have ended development and support for **our phone edition of Google Maps for BYD**. Our work now focuses on the **Automotive edition**, designed for Android automotive systems. You can keep your existing phone edition installed while you try Automotive; it is not required by the new version.

The current test release is **Morphe preview 11**, for **Maps Automotive 26.10.120001.E**. It provides our `.mpp` patches. You create the Maps APK locally by applying them to the matching clean original Maps Automotive APK. Google sign-in is provided by **MicroG-RE (7.2.1 tested for Maps-only; 7.2.2 tested for Gemini)**, independently of phone Maps.

## New optional Gemini setup in preview 6

Maps can still be used on its own. For Gemini, the bundle also contains **Google app for BYD (MicroG-RE TEST)** for the exact Google 17.62.11/API 32+ original. Sign Google with your **same Maps key**. Use MicroG-RE 7.2.2+, grant Contacts/Location to MicroG-RE, allow Google self-start in BYD, and keep **Compact assistant + Automatic compact recovery ON** in Maps. Recovery uses approved local ADB; no computer is needed afterwards. [Short setup](GEMINI-SETUP.en.md) · [Google build and split-APK instructions](GEMINI-BUILD.en.md). **DiLink 3/API 29 does not meet this Google app's Android requirement.**

## What changed in preview 5

Preview 5 keeps the 26.10.120001.E original of preview 4. It adds an experimental option to show the instrument-cluster map without opening Maps (**Instrument cluster → Start cluster map without opening Maps**, OFF by default), wakes the automatic battery reader as soon as the car is switched on, and sends cluster turn hints to the DiLink 3 AMap adapter as well. If you already made a preview 4 APK, patch the same original with preview 5 and **reuse your signing key**; it installs as an update. See [the feature guide](README.md#included-from-preview-5).

## What changed in preview 4

Preview 4 (patch revision 54, diagnostic version `patch-lab.54-maps2610`) moves every preview 3 feature to the newer original **Maps Automotive 26.10.120001.E**. It also keeps steering-wheel zoom working after you switch the car off and on, adds CCS1 to the vehicle profile, and lets the DiLink 3 cluster map resume by itself after a clean session. See [the feature guide](README.md#new-in-preview-4).

Preview 4 needs a **different original APK** from preview 3. If you already made a preview 1, 2 or 3 APK, patch the **26.10.120001.E** original with preview 4 and **reuse your existing signing key**. It installs over your current Automotive app as an update and keeps its data. Refreshing the Morphe source alone does not install that update. Preview 3 stays available for 26.09.280001.E. The [Telegram ready APK](READY-APK-preview.2.md) remains preview 2/build 34.

## Download these files

- [Morphe Manager for Android — official Releases](https://github.com/MorpheApp/morphe-manager/releases).
- Preferred: [Add our TEST patch source to Morphe](https://morphe.software/add-source?github=romanchukg-cloud/maps-automotive-for-byd-patches&name=Maps%20Automotive%20for%20BYD%20%28TEST%29), or paste `https://github.com/romanchukg-cloud/maps-automotive-for-byd-patches` in **Sources → + → Remote**. Morphe fetches the `.mpp`; this source currently serves TEST previews only, including its default main feed.
- [Our Morphe preview 11 patch bundle — Local fallback](https://github.com/romanchukg-cloud/maps-automotive-for-byd-patches/releases/download/morphe-preview.11/maps-automotive-for-byd-morphe-preview.11.mpp).
- [MicroG-RE — official Releases](https://github.com/MorpheApp/MicroG-RE/releases). Choose the matching **ARM64 APK**. Maps alone requires at least7.2.1 (previously tested). Gemini requires 7.2.2+; 7.2.2 was tested with Google 08. Later releases are not automatically verified.
- Your own **clean original Maps Automotive 26.10.120001.E**, version code **1068833407**, ARM64 APK file (APKMirror variant arm64-v8a + x86_64, nodpi). We do not distribute Google's original APK. It is listed, for example, on [APKMirror](https://www.apkmirror.com/apk/google-inc/google-maps-android-automotive/google-maps-android-automotive-26-10-120001-e-release/), a third-party site; compare your file with the exact input below. A later 26.10 build such as 26.10.120003.E is not accepted.

The resulting Automotive app requires an ARM64 head unit with Android 10 or newer (Android 10 support is experimental). You can patch on an Android device and transfer the result to the head unit. The Manager workflow was tested with **preview 1 using Morphe Manager 1.35.0 on Android API 32**. Previews2–6 have not been retested in Android Manager; later Manager releases can also change their UI. On-head-unit patching performance is not established across BYD firmware. For a computer, use [Morphe Desktop from its official Releases page](https://github.com/MorpheApp/morphe-desktop/releases) and the [Desktop fallback guide](https://github.com/romanchukg-cloud/maps-automotive-for-byd-patches/blob/main/README.md#computer-fallback-morphe-desktop-cli), tested with Desktop 1.18.1.

## Which Maps file should I select?

| File | Use as Morphe input? |
| --- | --- |
| Clean original **Maps Automotive 26.10.120001.E**, code 1068833407, ARM64, matching the hash below | **Yes** |
| Your installed phone Google Maps / Google Maps for BYD, or an APK exported from it | **No** |
| Old Automotive for BYD, an APK extracted from that installation, or an already patched Morphe output | **No** |
| Another Maps Automotive version or architecture, including 26.09 (use preview 3 for it) and 26.10.120003.E | **No** |

The clean input's package is `com.google.android.apps.maps`. The phone edition can use that same package name, so the package name alone does **not** identify the correct file. Check the Automotive version, version code, architecture, original Google signature and exact SHA-256:

```text
d9dc74c9fa0f5bee0911ed1594a19adc0761258d524b5031ed480674d81f5ff9
```

Patches are applied to this **APK file**. You do not patch the phone app already installed on the head unit, and you do not need to install the clean original before patching it. Do not use force/continue-on-error if the input is rejected.

## Build your Automotive APK with Morphe Manager

1. Install **Morphe Manager**. Copy the clean original APK to that Android device.
2. **Preferred: Remote source.** Open [Add Maps Automotive for BYD (TEST)](https://morphe.software/add-source?github=romanchukg-cloud/maps-automotive-for-byd-patches&name=Maps%20Automotive%20for%20BYD%20%28TEST%29) and confirm, or use **Home → Sources → + → Remote** with `https://github.com/romanchukg-cloud/maps-automotive-for-byd-patches`. Morphe downloads the patch bundle. **Local fallback:** download our `.mpp`, then select it in **Sources → + → Local**.
3. Open **Settings → Advanced → Expert settings → Expert mode** and enable it. Leave **Optimize for device architecture OFF**, especially when preparing the APK on a different device from the car.
4. Select **Maps Automotive 26.10 TEST** from our source; if several sources are offered, choose ours and leave other sources' patches unselected for this app. Then choose **26.10.120001.E → No, I already have an APK** and select the clean original file described above. Automatic original-APK Download has not been verified for this AAOS build.
5. Select only **Maps Automotive for BYD (MicroG-RE TEST)**. For ordinary map use, leave its **Battery electric vehicle (CCS2)** option OFF. Enable that option only for a confirmed battery electric vehicle when you want the experimental CCS2 route integration; it is not a PHEV mode.
6. Choose **Proceed to patching** and keep Manager in the foreground. When it finishes, choose **Save** to export the signed APK. Transfer the saved APK to the head unit. Install it by opening the file with the normal Android file manager; do not rely on Manager's Install status. That button reported Installed without installing in the API 32 test; a separate installation of the exported file succeeded through ADB.
7. **Back up the signing key:** open **Settings → System → Import & export → Signing key → Export** in Manager. Keep that private backup separately from Manager settings. Import the same key before patching on another device. Do not create a new signing identity for every update.

Morphe Manager creates a signing key for your output. This personal key is what makes your future updates compatible with your installation. The project does not supply its private production key.

## Install alongside phone Maps, or replace old Automotive

**Phone Maps may stay installed.** The patched Automotive output uses `com.google.android.apps.maps.automotive`; the phone edition uses `com.google.android.apps.maps`. They are separate installations. Removing phone Maps is optional after you have checked the new Automotive app; it is not a prerequisite.

If you already have an older **Automotive** build such as `automotive.6`, your new locally signed APK normally has a different signing key. Android cannot update that old installation with the new key. Note the Automotive settings you want to reproduce, uninstall **only the old Automotive app**, then install your locally created APK. This migration removes that Automotive app's local data and settings. Do not uninstall phone Maps or microG to solve an Automotive signature mismatch.

For later patch updates, use the supported clean original again, apply the new `.mpp`, and sign with the **same backed-up key**. Matching package and signer allow an update instead of another reinstall. There is no automatic OTA migration from old Automotive and no in-app APK updater for this preview. Morphe can refresh our remote patch source automatically or through its source-card **Update** action, but you still need to repatch and install the output with the same key. Local `.mpp` sources require importing the replacement file manually. This source is TEST only; the default main feed does not mean the app is stable.

## Google sign-in

1. Install the matching ARM64 APK from the official [MicroG-RE Releases](https://github.com/MorpheApp/MicroG-RE/releases). Maps-only setup was previously tested with 7.2.1. Gemini needs 7.2.2+ (7.2.2 tested); later releases need their own verification. It uses package `app.revanced.android.gms` and is separate from older microG under `com.google.android.gms`.
2. Add your Google account to **MicroG-RE**. An account in older microG does not automatically become a MicroG-RE account.
3. Open your new Maps Automotive APK. Allow Contacts and Location and finish sign-in if requested.
4. Check that the map and your account work before changing anything else.

**Keep older microG if other apps need it.** Do not remove its accounts as part of this migration. Phone Maps is not used as an account helper by the new Automotive app.

If MicroG-RE fails before the email form on a Tang, see the device-specific workaround in the [full project guide](https://github.com/romanchukg-cloud/maps-automotive-for-byd-patches/blob/main/README.md#sign-in-troubleshooting-on-the-tested-tang). It is not a universal setup requirement.

## Optional BYD battery/range and EV routes

Ordinary Maps use does not require the ADB reader. Its two opt-ins start OFF on a new installation.

If you want live battery/range data, enable network ADB on the head unit, then turn on **Instrument cluster → BYD vehicle data → Use BYD vehicle data** and **Automatic reader → Enable automatic reader**. Approve the standard ADB prompt and select **Always allow**. Also allow Maps startup/background operation in BYD settings. On the tested Tang, **Disable background Apps → Maps Automotive must be OFF**, because that menu lists blocked apps; both Maps reader opt-ins stay ON.

After that setup, the reader can start without a computer. It samples about once a minute; values expire after 90 seconds. Experimental native EV planning additionally needs the confirmed-BEV/CCS2 patch option and your own battery capacity in **BYD vehicle data → EV routing profile**. Other firmware, PHEVs and other station connectors are not confirmed. Read the [full setup and limitations](https://github.com/romanchukg-cloud/maps-automotive-for-byd-patches/blob/main/README.md) before enabling this optional feature.

## What has been checked

Revision 54 runs on one BYD Tang (DiLink 5.0) as an update with data and accounts kept. On that car the owner checked every preview 3 feature on 26.10: the map, Search with the EV charge-at-arrival estimate, the instrument-cluster map, pointer offset and cluster zoom during an active route, BYD cluster turn hints, 3D buildings, interface size, the collapsed Search panel and steering-wheel zoom after switching the car off and on. Some checks used a later test build of revision 54 with identical Google-code changes. On an Android 10 emulator the preview 4 build installs as an update, passes the Android 10 verifier and starts without errors; the preview 5 changes were not run on Android 10. On the same Tang, preview 5 showed the cluster map without opening Maps about 10 seconds after switching the car on, with the automatic reader enabled.

The Remote import, source-card details, Local patch/export, separate installation, provider handling and settings tests in Manager 1.35.0/API 32 belong to **preview 1**. The clean Manager emulator had no Google account and did not prove map tiles, live vehicle data or physical cluster output. Preview 5 needs a separate Manager check. The correct original AAOS APK must still be supplied manually.

The optional reader/EV code is unchanged. Morphe revision 25 on one Tang supplied fresh charge/range after a full head-unit reboot without a computer and produced a stationary Paris preview with two automatic charging stops. These older results do not validate revision 54 reboot behavior, road predictions or charging duration. DiLink 3 and DiLink 5.1 have no car test of revision 54. Physical HUD/audio, satellite imagery in the Morphe cluster and the general native navigation-service startup timeout remain open; see the release notes.

[Full guide and Desktop fallback](https://github.com/romanchukg-cloud/maps-automotive-for-byd-patches/blob/main/README.md) · [Morphe preview 11 release notes](RELEASE-NOTES.md)
