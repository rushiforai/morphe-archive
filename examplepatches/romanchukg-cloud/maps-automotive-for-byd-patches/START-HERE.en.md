# Maps from scratch, then optional Gemini

**TEST preview 10 guide.** Refresh the Remote source and check it shows preview 10 before following the Gemini steps. If you also have a Local or older source, turn the others off: all previews use the same patch name. You can also import the release `.mpp` as a Local source. The two tutorial videos are planned and have not been recorded yet.

**Two independent parts:** Part 1 gets Maps working from a fresh Morphe installation. Part 2 adds Gemini to working Maps. Ordinary map use does not require Gemini, the companion Google app, or the optional BYD data reader.

## Part 1 — Maps Automotive from scratch

### 1. Download and install Morphe Manager on Android

Open the [official Morphe Manager Releases](https://github.com/MorpheApp/morphe-manager/releases). Choose its current regular release and download the installable **Manager `.apk`** under Assets. The exact version used while filming will be recorded alongside the video; do not select a source-code archive. Open the APK with Android's file manager/browser and, if prompted, allow **that installer** to install unknown apps. Finish installation and launch Morphe.

You can build on an Android phone and transfer the output to the head unit. Keep **Optimize for device architecture OFF** when the phone and car are different devices. Patching directly on every BYD head unit has not been verified. Morphe installation requirements and menu locations can change; see its [official first-patch guide](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patching-simple-mode.md).

### 2. Add our patch source

Open [Add our TEST source](https://morphe.software/add-source?github=romanchukg-cloud/maps-automotive-for-byd-patches&name=Maps%20Automotive%20for%20BYD%20%28TEST%29), then confirm in Morphe. Or use **Home → Sources → + → Remote** and enter:

```text
https://github.com/romanchukg-cloud/maps-automotive-for-byd-patches
```

The source contains our patches, not the original Google APK. For a downloaded bundle, **Sources → + → Local** selects the `.mpp`; a Local source must be replaced manually for future patch releases. [Official source guide](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md).

### 3. Obtain the supported original Maps file

Use **Maps Automotive 26.10.120001.E**, versionCode **1068833407**, original ARM64 APK. The [version listing](https://www.apkmirror.com/apk/google-inc/google-maps-android-automotive/google-maps-android-automotive-26-10-120001-e-release/) is a third-party download source; compare this exact SHA-256:

```text
d9dc74c9fa0f5bee0911ed1594a19adc0761258d524b5031ed480674d81f5ff9
```

Download the file **without installing it**. Do not use phone Maps, an already patched output, or a different Automotive version such as 26.10.120003.E. New versions of the Morphe tool do not make every Maps version supported.

### 4. Keep the correct signing key

If you previously built Maps with Morphe, import your **existing signing key before patching**. A fresh personal key cannot update an installation signed by another key; migrating then requires a one-time Maps reinstall and loses its local settings. Phone Maps is a separate package and can stay installed.

For a genuinely new installation, Morphe creates a key when it first builds an app. After this first build, export it through **Settings → Backup → Signing key → Export** (Manager 2.0.0; older versions may place this under System / Import & export) and store a private backup separately. Keep that key for all future Maps updates and the Google app in Part 2. The settings backup alone does not contain the key. [Official key-backup instructions](https://github.com/MorpheApp/morphe-manager/blob/main/docs/backup-and-keystore.md).

### 5. Patch and export Maps

1. Enable **Settings → Expert mode** (Manager 2.0.0). Under **Settings → Patcher**, leave **Optimize for device architecture OFF**; the tested default **Use embedded VM** is ON. Expert mode also enables the custom file picker: to use Android’s normal per-file picker, set **Settings → Files → Custom file picker OFF**. This path worked without All files access.
2. Select **Maps Automotive 26.10 TEST** from our source and choose **26.10.120001.E → No, I already have an APK**.
3. Select your untouched original file. Enable only **Maps Automotive for BYD (MicroG-RE TEST)** from our source. Leave other sources' patches for this app unselected.
4. Leave `known_bev` OFF for ordinary map use. It is an optional confirmed-BEV/CCS2 route-integration setting, not the switch that enables Maps or the instrument cluster.
5. Choose **Patch** (called Proceed to patching in some older versions). Keep Manager in the foreground; the background battery exception can be skipped with Not now. After success, use **Save** to export the signed APK before leaving the result screen. Keep Morphe in the foreground if background patching has not been allowed.
6. Export the signing key now if this was the first build. Transfer the signed Maps APK to the car using your normal file-transfer method; keep its name distinct from the original input. Do not transfer the private key as a public attachment.

The [official Expert guide](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patching-expert-mode.md) describes these controls. Menu labels may differ between Morphe versions. Preview 6 Local import, Maps/Google patching, Save, shared signing key export and installation through Manager 2.0.0 passed on a fresh Android API 32 emulator. Manager can show Installed for a saved APK before Android has installed it: finish the system installer and check the app actually opens. For the exact supported inputs, Experimental / Unsupported Version is the patch’s TEST warning; check the version/build above before continuing. The owner completed account setup and Gemini answered a neutral test question. Compact mode and route handoff on this merged output were deferred by the owner to car testing before filming. A Desktop alternative is in [README](README.md#computer-fallback-morphe-desktop-cli).

### 6. Install MicroG-RE and Maps on the head unit

Get the matching ARM64 APK from [official MicroG-RE Releases](https://github.com/MorpheApp/MicroG-RE/releases). **7.2.2 is tested with our Gemini setup**, so use that tested baseline if you plan Part 2; later versions need their own checks. Install it and allow **Contacts and Location for MicroG-RE itself**. Open it and add your Google account privately. An account in older microG is separate; keep older microG if another app needs it.

Open your exported signed Maps APK on the head unit and install it. If your existing Automotive app has the same key, install as an update without clearing data. A signing conflict needs the migration described above; do not repeatedly clear app data or remove microG to solve it.

Open Maps, allow **Contacts and Location**, and finish any sign-in/setup screens yourself. Confirm that map tiles, your account and a destination search work. Account login, personal suggestions and consent choices are not shown in the video.

### 7. Show Maps on the instrument cluster, if supported

Open **Instrument cluster → Show cluster map**. On the tested Tang, confirm the physical cluster map appears. Do not infer physical visibility from a screenshot of a virtual display. Other profiles need their own setup:

- **DiLink 3:** the experimental cluster projection uses local ADB and its own **DiLink 3 cluster test** page; see [README](README.md#optional-dilink-3-instrument-cluster-map-experimental-android-10-only).
- **DiLink 5.1:** follow the firmware-specific layer/theme instructions in [README](README.md#optional-dilink-51-instrument-theme-experimental-not-yet-tested-in-a-car).

The video demonstrates the verified Tang setup and labels its firmware. It is not a promise that every BYD has the same cluster menu or output.

### 8. Optional battery reader and EV routes

Basic Maps and the Gemini button do not require enabling battery reading. To use live BYD battery/range, follow the [reader/profile section](README.md#optional-byd-battery-and-range). Enable the reader's own opt-ins, approve the Maps local ADB key, and allow Maps self-start/background operation in BYD. Use your own vehicle type, capacity and connector. BEV route integration does not supply a PHEV fuel model. This optional chapter can be skipped when installing navigation only.

**End of Part 1:** Maps opens, the map and Search work, and the signing-key backup is saved. Update later by refreshing the patch source, repatching the supported original and installing with the same key; refreshing the source alone does not update Maps.

### 9. Send to car from your phone (optional)

Use the same Google account in Maps on the head unit and in Google Maps on your phone. After the patched Maps has started and synced once, the phone shows the car in its **Send to car** list as **byd (xxxx)**; the four-character code differs per car.

1. In Maps on the head unit open the cluster settings (the button beside Search) → **Send to car** and turn on **Keep phone routes arriving**. Maps uses its local ADB key once to exempt MicroG-RE from battery optimization; approve **Always allow** if Android asks. Without this, Android 12 stops MicroG-RE from restarting its push connection after the car is switched on, and routes do not arrive until it reconnects. **Reconnect now** forces a reconnect.
2. On the phone: Google Maps → choose a destination → **Directions** → **Send to car** → select the car.
3. The route opens in Maps on the head unit as a route preview with **Start**, usually within a few seconds.

Tested on one BYD Tang with DiLink 5.0 and MicroG-RE 7.2.2. Not yet tested in DiLink 3 or DiLink 5.1 cars.

## Part 2 — add Gemini to working Maps

### 1. Check the baseline

Keep the working Maps installation and signing key. This Google/Gemini build requires **Android API 32+** and **MicroG-RE 7.2.2+**; 7.2.2 is the tested provider. Android 10/DiLink 3 support for Maps does not extend to this Gemini package. For an older Maps preview, repatch with the current preview 10 and your same key first.

### 2. Build the companion Google app

Use the exact original **Google 17.62.11.ve.arm64 /301813762 API 32+ APKM**,120–480dpi variant, specified in [GEMINI-BUILD.en.md](GEMINI-BUILD.en.md). Select **Google app for BYD (MicroG-RE TEST)**, not the Maps patch, and **use the same key as Maps**.

**Current verified route:** the computer helper in GEMINI-BUILD.en.md keeps the original 10-split layout, patches base and signs/verifies all 10 APKs. Install the complete set together, not `base.apk` alone. Use the current Google20 patch; the earlier Google08 Tang results used this split layout.

**Android Manager route:** with Manager 2.0.0 on a fresh API 32 emulator, the whole original APKM merged, patched, exported and installed as one signed APK. Select Google app Gemini TEST → No, I already have an APK → the whole Google APKM; select only our Google patch, choose Patch, then Save and Install. Keep the same key as Maps, embedded VM ON and architecture optimization OFF. Android may ask to allow installation from Morphe; decide this yourself in the system dialog. Google opens and ART verification passes. Account sign-in and a Gemini chat request passed. The owner subsequently installed Google20 through Morphe on Tang: the compact Live capsule reached LISTENING and closed. Spotify attenuation failed. New Live route/call/reboot tests are not claimed; the earlier split-set path remains available.

### 3. Install Google and the original Gemini shell

Install your complete patched Google output. A differently signed existing Google app may need replacing, erasing **Google app's** local settings. If it is a protected system app that cannot be replaced normally, the tested path does not cover it. Do not remove system packages blindly. Leave Maps data, MicroG-RE and its accounts intact.

Install the original **Gemini shell** separately; it is not patched by our bundle. If downloaded as an APKM, use a split-aware installer rather than installing only its base. Google 17.62.11 is the app our Google patch targets; the Gemini icon is a different package.

### 4. Permissions, login and BYD self-start

- MicroG-RE: **Contacts + Location**; add the Google account there.
- Google: **Contacts + Microphone**; allow Location for current-position requests.
- Maps: **Contacts + Location**.

Open Gemini and finish its setup/consents yourself. Confirm it answers a simple question. In BYD open **General → Apps → Disable Self-Start → Google = OFF**. OFF means Google is allowed to start. Keep Maps startup/background allowed for any automatic reader/cluster features you use.

### 5. Compact Gemini and recovery

Open Maps → **Instrument cluster → Gemini voice assistant**:

- Live is always selected since preview 8; there is no Launch mode selector or **Microphone**.
- **Compact assistant → ON**.
- **Automatic compact recovery → ON**.

Enable local/network ADB on the head unit and authorize the **Maps key** with **Always allow**. The `127.0.0.1:5555` address means the head unit itself. Choose **Google** as Android's digital assistant; with no competing assistant selected, recovery can restore Google through approved local ADB. The expected status is **Google assistant is ready**. Local ADB stays needed for recovery; a computer is not needed afterwards. The recovery leaves another selected assistant unchanged.

### 6. Screen button, wheel and music test

Return to the main map and tap the conversation icon below the cluster-map toggle. The small **Live** capsule should open; use its pause/resume and × controls. Ordinary Microphone mode is no longer offered. While parked, play music first, open Live, then close it: report whether music gets quieter or pauses and whether it returns. **Spotify did not get quieter on the tested Tang with Google20.**

**Live-to-Maps directions are not verified.** The earlier ordinary Gemini route test does not prove Live support. Google currently documents directions as unavailable in Live chats ([official help](https://support.google.com/gemini/answer/16622866)). Do not use a route request as the required Live installation test.

For the tested Tang wheel, enable **Long-press microphone** and keep the existing **Wheel key service Connected**. Hold the wheel microphone. Short press keeps BYD's assistant and the star keeps cluster zoom. Other firmware/key codes need their own check. A short phone shot of the physical button can be combined with the screen recording.

If full Gemini opens, check Google self-start, Compact/recovery ON, the approved Maps ADB key, the shared app signer and Google assistant selection. If account selection stalls, first check MicroG-RE's own permissions. Internet, account and Gemini availability are required. [Quick settings reference](GEMINI-SETUP.en.md) · [Exact inputs/build path](GEMINI-BUILD.en.md) · [Verification limits](RELEASE-NOTES.md#verification).
