# Maps Automotive for BYD — Morphe test preview

**Morphe preview 10 (TEST) · Maps55J 3D car in navigation and car icon + optional Google20 Gemini Live patch · 28 October 2026.**

New user? Start with [Maps from scratch, then optional Gemini](START-HERE.en.md), beginning with Morphe installation. Existing Maps users can go straight to Part2. Start with [Gemini quick setup](GEMINI-SETUP.en.md). One bundle contains separate patches for Maps and Google app. Google/Gemini setup is optional and requires **Android API 32+**; Maps-only Android 10 support is unchanged.

We have ended development and support for **our phone edition of Google Maps for BYD**. Future work focuses on Automotive. Start with the [migration and self-build guide](MIGRATION.md): it explains which APK to use, how to build it in Morphe, and when an old installation needs replacing. **Phone Maps can remain installed** alongside the new Automotive app.

This is the Automotive edition of Google Maps, designed for Android automotive systems. It is a different app from the phone edition. Our patches add the Instrument cluster controls and optional BYD battery/range integration.

This **GitHub repository and its Releases distribute only our own patches (`.mpp`) and code**, without a Maps APK. For self-build, apply the patches to your own matching original APK and sign the result locally, using Morphe Manager on Android or the Desktop workflow. A project-signed **[ready APK — preview 2 / build 34](READY-APK-preview.2.md)** is available as a [Telegram attachment](https://t.me/byd_apps_updates/29), for confirmed BEVs using CCS2 (TEST); previews 3–10 are self-build only. Existing self-build users should reuse their key; moving between a personal key and the project-signed APK requires the one-time reinstall described below. Google sign-in uses **MicroG-RE (7.2.1 tested for earlier Maps-only builds; 7.2.2 tested for Gemini)**; the phone edition of Google Maps for BYD is not required. The Automotive package is `com.google.android.apps.maps.automotive`, so it can coexist with the phone edition.

The Maps patch is named **Maps Automotive for BYD (MicroG-RE TEST)**; the optional Google patch is **Google app for BYD (MicroG-RE TEST)**. Maps keeps diagnostic marker `patch-lab.54-maps2610`, so the public preview number is the update identifier. Preview 10 uses the same **Maps Automotive 26.10.120001.E** original as previews 4–9, plus the separately pinned Google original described in [the Gemini build guide](GEMINI-BUILD.en.md). **Preview 3 remains available for26.09.280001.E** ([its bundle](https://github.com/romanchukg-cloud/maps-automotive-for-byd-patches/releases/download/morphe-preview.3/maps-automotive-for-byd-morphe-preview.3.mpp)). Earlier car results below are identified by their actual tested revision.

![Illustrative native 3D settings on an account-free Android API 32 test emulator](https://raw.githubusercontent.com/romanchukg-cloud/maps-automotive-for-byd-patches/main/docs/morphe-preview.2.png)

*Revision 29 screenshot from an account-free API 32 laboratory emulator, illustrating the native 3D settings UI that is still included. It is not a revision 54 test or proof of rendered buildings, live vehicle readings or physical cluster output.*

## New in preview 10

- **3D car in navigation.** Maps shows a 3D model of the **BYD Tang 2024** instead of the arrow, using Maps' own Navatars feature, with red rear lamps and small animations of our own for standing, driving and turns. It is on by default. **Instrument cluster settings → 3D car on map** turns it off and picks the body colour (Original, Silver, White, Black, Grey, Blue, Red, Green); **Apply now** restarts Maps.
- **Where the 3D car comes from.** The model is adapted from ["2024 BYD Tang" by Ddiaz Design](https://sketchfab.com/3d-models/2024-byd-tang-0af7ffe7b3b64d7fb9e31d4f1bac10c1) (CC BY-NC-SA 4.0): we simplified it and gave it our own rig and animations. The adapted model keeps that licence, non-commercial use only; see [its licence file](assets/navatars/tang2024-LICENSE.txt). No Google model files are used or bundled.
- **Car icon on the map.** With the 3D car off, Maps shows a flat top-down car instead of the blue arrow: blue by day and white at night, without the disc under the arrow. It is our own rendering of a free CC0 model ([Kenney Car Kit](https://kenney.nl/assets/car-kit)); at patch time it replaces only the image of Google's arrow.
- **Nothing else changes in Maps.** The rest of the Maps code is identical to preview 9. The round selection marks in the cluster settings are also fixed (they were stretched into ovals).

**Update Maps only.** The Google patch is unchanged (Google20); a Google app built from preview 9 is byte-identical. [Release notes](RELEASE-NOTES.md).

![3D car during navigation on an Android 12 (API 32) test emulator](https://raw.githubusercontent.com/romanchukg-cloud/maps-automotive-for-byd-patches/main/docs/morphe-preview.10.png)

*Android 12 (API 32) test emulator with a simulated location in Berlin, during navigation, with an enlarged view of the car. The build shown has a Maps output identical to preview 10 apart from the model's licence file. Not a car photo.*

## Included from preview 9

- **Send to car:** in Google Maps on your phone choose a route → **Send to car** → your car (shown as **byd (xxxx)**). The route opens in Maps on the head unit as a route preview with **Start**, usually within a few seconds. Use the same Google account on the phone and in Maps.
- **New setting — Instrument cluster → Send to car → Keep phone routes arriving.** Turn it on once. Maps uses its local ADB key (approve **Always allow** if asked) to exempt MicroG-RE from battery optimization. Without this, Android 12 stops MicroG-RE from restarting its push connection after the car is switched on, and routes do not arrive until it reconnects. **Reconnect now** forces a reconnect.
- **How it works with MicroG-RE:** Maps push is routed to MicroG-RE, Google's notification registration uses the same app identity as sign-in, and Maps expands the `maps.app.goo.gl` route links itself. MicroG-RE's own Dynamic Links service fails on these links ([MicroG-RE #329](https://github.com/MorpheApp/MicroG-RE/issues/329)).

[Send to car setup](START-HERE.en.md#9-send-to-car-from-your-phone-optional).

## Included from preview 8

- **Compact Live capsule:** pause/resume and close above Maps, with no initial flash of the old panel.
- **Live from the map and wheel:** the ordinary Microphone launch mode/selector has been removed. Previous cluster zoom, pointer offsets, button assignment and recovery remain.
- **Settings beside Search:** direct cluster settings access next to the search bar.
- **Experimental music attenuation:** transient assistant audio focus is requested during visible active Live and released on pause/close. **Spotify did not become quieter on the tested Tang/DiLink5.0.** Please report your model, DiLink/Android, player, whether music quiets/pauses, and whether it returns after closing Live. Other players/firmware need independent tests.

**Live-to-Maps directions are not established.** Earlier ordinary Gemini route tests do not prove Live directions support. [Google's Live help](https://support.google.com/gemini/answer/16622866).

## Included from preview 6

- Optional **Gemini over Maps** with a voice-mode icon below the cluster-map toggle.
- One tap opens **Gemini Live** with the companion patched Google app. Optional wheel activation uses the same Live mode. Preview8 removes the older ordinary Microphone mode and selector.
- **Automatic compact recovery**, OFF by default: after explicit setup it uses the head unit's approved local ADB connection to restore Google if BYD clears its assistant state. Enable it for the tested compact setup; a computer is not needed after setup. Another selected assistant is kept.
- **Required BYD setting:** General → Apps → Disable Self-Start → **Google = OFF**. Also keep Maps startup/background operation allowed for the reader/cluster features. Compact mode needs **Compact assistant ON + Automatic compact recovery ON**.
- Own companion **Google app patch** routes sign-in to MicroG-RE 7.2.2+, selects the requested voice mode, keeps the public recognizer selectable at boot, and directs explicit Maps package requests to Automotive.
- A small computer helper preserves and signs the original Google 10-split layout. **Both apps must use your same signing key.** Google requires API 32+; this is not a Gemini port to DiLink 3.

[Short installation/settings guide](GEMINI-SETUP.en.md) · [Exact inputs and self-build](GEMINI-BUILD.en.md) · [Verification limits](RELEASE-NOTES.md#verification).

## Included from preview 5

- **Instrument-cluster map without opening Maps (experimental, OFF by default).** Turn on **Instrument cluster → Start cluster map without opening Maps**. When Android has started Maps in the background, the cluster map then appears without opening the Maps screen. Switching the car off makes BYD stop Maps. With the **Automatic reader** for BYD battery data enabled, Maps is woken again right after the car is switched on: on the tested Tang the cluster map appeared about 10 seconds after switching the car on, without touching anything. Without the automatic reader, Maps is not woken after the car is switched off and on, so open Maps once. This option is for the Tang-style cluster only; it is not shown on DiLink 3 or DiLink 5.1. If a background start fails, Maps falls back to the usual behaviour and waits until you open it.
- **Automatic battery reader after switching the car on.** The reader now sends a reading as soon as the head unit's screen turns on, instead of waiting up to a minute. Its regular one-minute rhythm is unchanged.
- **Cluster turn hints on DiLink 3.** Turn-by-turn hints for the BYD instrument cluster now go to the AMap adapter that is actually installed: `com.byd.amapservice` (DiLink 5.0, as before) or `com.example.amapservice` (DiLink 3). This is not yet confirmed in a DiLink 3 car.
- **Diagnostics.** The Support report now includes instrument-cluster connection counters (attempts, successes, unexpected closes, reasons). They contain numbers only, no locations.

Preview 5 was tested on one BYD Tang (DiLink 5.0) as an update with app data and accounts kept. There the owner confirmed BYD cluster turn hints during a route and their removal at the end of the route, and that with the new option turned on the cluster map appeared without opening Maps, about 10 seconds after switching the car on. The Android verifier accepted every class on the car. Its Google-code changes are identical to preview 4, and the public bundle produces an APK payload identical to the car-tested build. See [release notes](RELEASE-NOTES.md) for the evidence and limits.

## Moved to Maps 26.10 in preview 4

- **Maps Automotive 26.10.120001.E.** All preview 3 features were moved to the newer Google build: instrument cluster and HUD, steering-wheel cluster zoom, navigation pointer offset and zoom, vehicle profile and EV route planning, interface size, 3D buildings, Search alignment, Android 10 compatibility, the DiLink 3 cluster-map test and the DiLink 5.1 theme profile. Use exactly **26.10.120001.E** (version code 1068833407); a later 26.10 build such as 26.10.120003.E is rejected.
- **Steering-wheel zoom after switching the car off and on.** When the car is switched off, BYD stops Maps. Android then kept the wheel-key service listed but no longer connected it, so the custom button rotated the screen until you turned **Steering-wheel zoom** off and on. Maps now re-registers that service once, about 10 seconds after it starts, through the already approved ADB key, without a new prompt. Preview 3 has the old behaviour.
- **CCS1 in the vehicle profile.** **BYD vehicle data → Vehicle profile** now offers CCS1 for BEV and PHEV profiles. EV route planning remains BEV-only.
- **DiLink 3 cluster map (experimental, Android 10 only).** After the car is switched off and on, the projection now resumes once by itself, if the previous projection ran for at least 30 seconds without an error. Otherwise it still waits for **Authorize or retry**, as before.

Revision 54 runs on one BYD Tang (DiLink 5.0) as an update with data and accounts kept. On that car the owner checked every preview 3 feature on 26.10: the map, Search with the EV charge-at-arrival estimate and the instrument-cluster map; during an active route the pointer offset, cluster zoom with the steering wheel without rotating the screen, volume restore, and BYD cluster turn hints that clear at the end of the route; 3D buildings, interface size and the collapsed Search panel; and steering-wheel zoom after switching the car off and on. Some of these checks used a later test build of revision 54 that only changes how the AMap adapter package is chosen; those historical preview 4/5 results are separate from the new Gemini checks. On an Android 10 emulator it installs as an update and starts without errors. The preview 9 Maps payload matches build 55E, which received Send to car routes on the tested Tang. The preview 10 Maps payload matches build 55J (55E plus the 3D car and the car icon) apart from the model's licence file; 55J was checked on an emulator only. The new verification is in the release notes. See [release notes](RELEASE-NOTES.md) for the per-feature evidence and limits.

## What you need

- An ARM64 Android head unit running Android 10 or newer. Android 10 support is experimental. Device testing so far is mainly on one BYD Tang; other firmware is not confirmed.
- The original **Maps Automotive 26.10.120001.E**, version code **1068833407**, ARM64 APK (APKMirror variant arm64-v8a + x86_64, nodpi). The phone Maps APK and other versions are not interchangeable with this input. Obtain your own original; this project does not distribute it. It is listed, for example, on [APKMirror](https://www.apkmirror.com/apk/google-inc/google-maps-android-automotive/google-maps-android-automotive-26-10-120001-e-release/) (a third-party site; compare the SHA-256 below).
- Either [Morphe Manager for Android](https://github.com/MorpheApp/morphe-manager/releases), or [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop/releases) with Java and Android SDK Build Tools. Download the application from its official Releases page.
- [MicroG-RE — official Releases](https://github.com/MorpheApp/MicroG-RE/releases). Choose the matching **ARM64 APK**. Maps alone requires at least7.2.1 (previously tested). Gemini requires 7.2.2+; 7.2.2 was tested with Google 08. Later releases are not automatically verified. Its package is `app.revanced.android.gms`; ordinary microG under `com.google.android.gms` does not replace this dependency.
- Our patch source: [Add Maps Automotive for BYD (TEST) to Morphe](https://morphe.software/add-source?github=romanchukg-cloud/maps-automotive-for-byd-patches&name=Maps%20Automotive%20for%20BYD%20%28TEST%29), or add `https://github.com/romanchukg-cloud/maps-automotive-for-byd-patches` in **Sources → + → Remote**. The source currently serves **TEST previews only**, including its default main channel; this is not a stable channel.
- Optional Local/CLI fallback bundle: [maps-automotive-for-byd-morphe-preview.10.mpp](https://github.com/romanchukg-cloud/maps-automotive-for-byd-patches/releases/download/morphe-preview.10/maps-automotive-for-byd-morphe-preview.10.mpp). Its SHA-256 is `36af65dda03fadce62cc3b82141d14f61f645cafd0a722759edc3355c2e72316`.

The Desktop workflow uses **Morphe Desktop 1.18.1**. **Morphe Manager 1.35.0 on Android API 32 was verified for preview 1**: patch/export, separate APK installation, provider guard, settings and Remote import passed. Preview 6 Local import, both patch/Save flows, shared signing-key export, and actual installation through Manager 2.0.0 passed on a fresh API 32 emulator. Google’s merged APK opens and passes ART verification; authenticated Gemini chat passed; compact/route tests were deferred by the owner. Previews 2–5 were not separately retested in Manager. These are recorded tool versions, not a requirement to use fixed download links or a claim that later releases are verified; newer releases can change their UI or CLI.

The exact tested original APK SHA-256 is:

```text
d9dc74c9fa0f5bee0911ed1594a19adc0761258d524b5031ed480674d81f5ff9
```

The tested MicroG-RE **7.2.1 ARM64** download SHA-256 is (not the hash of future releases):

```text
3425e46e95cd45012892cfaa23061b70db0a25affffcfcb84e3df4511d63eb82
```

## Can I patch the Maps already installed on my head unit?

Morphe needs the **clean original Maps Automotive 26.10.120001.E ARM64 APK file**, version code 1068833407, matching the SHA-256 above. Installed phone Maps, APKs exported from phone Maps, old Automotive for BYD and already patched APKs are not supported input. You do not need to install the original file before patching it. Both the correct original and phone Maps can use `com.google.android.apps.maps`, so the package name alone is not enough to identify the right input.

The patched output uses `com.google.android.apps.maps.automotive` and can coexist with phone Maps. A different signer affects an existing **Automotive** installation: a one-time reinstall loses its local data/settings. Do not remove phone Maps or older microG to resolve that mismatch. Keep older microG if other apps use it; MicroG-RE needs a separate sign-in. See the [complete migration steps](MIGRATION.md).

## First installation and migration

1. Keep your existing Maps working while you prepare the new output APK. Save the settings you want to reproduce.
2. Install the matching ARM64 APK from [MicroG-RE Releases](https://github.com/MorpheApp/MicroG-RE/releases) and add your Google account to it. Maps-only setup was previously tested with 7.2.1. Gemini needs 7.2.2+ (7.2.2 tested); later releases need their own verification. This is a separate sign-in from older microG. Do not remove another Google-services provider or its accounts as part of these steps.
3. Apply the release `.mpp` to the exact original APK using the Manager steps below, or the Desktop fallback. Select **Maps Automotive for BYD (MicroG-RE TEST)**. Leave the patch options at their defaults for ordinary map use. Enable `known_bev` only for a confirmed battery electric vehicle when you intend to use the experimental CCS2 EV routing integration below. It is not a PHEV mode.
4. Manager signs with a key it creates for you; export a private backup as described below. With Desktop, sign using **your own key**. Keep the keystore and its password backed up separately, and reuse that same key for every later patch update.
5. Install the APK you created. A public `automotive.6` installation uses a different signing key: Android will normally reject installing your locally signed APK over it. Migrating then requires uninstalling the old Automotive app and installing yours, which removes its local data/settings. Your regular phone Maps is a separate app. Do not uninstall it or MicroG-RE to solve this signature mismatch.
6. Open Maps Automotive, grant Contacts and Location, then finish Google sign-in if asked. Check the map and account before setting up vehicle data.

Do not use a key from someone else's APK or expect the old in-app APK updater to convert the installation. Automatic migration from `automotive.6` to this patch preview is not provided. For later updates, patch the supported original again and sign with the same backed-up key; same package and signer are required to retain local data.

### Android: Morphe Manager

1. Install Morphe Manager and copy the matching clean original Maps Automotive APK to that Android device. Patching on a phone and transferring the exported APK to the car is possible; leave architecture optimization off.
2. **Preferred: Remote source.** Open [Add Maps Automotive for BYD (TEST)](https://morphe.software/add-source?github=romanchukg-cloud/maps-automotive-for-byd-patches&name=Maps%20Automotive%20for%20BYD%20%28TEST%29) and confirm, or open **Home → Sources → + → Remote** and paste `https://github.com/romanchukg-cloud/maps-automotive-for-byd-patches`. Manager fetches the patch bundle for you. **Local fallback:** download the `.mpp`, then use **Sources → + → Local** and select it. A local source does not update itself; replace its bundle manually.
3. Open **Settings → Expert mode** (Manager 2.0.0) and enable it. Keep **Settings → Patcher → Optimize for device architecture OFF** and the tested **Use embedded VM ON**. In 2.0.0 Expert mode also enables the custom picker; **Settings → Files → Custom file picker OFF** uses Android’s per-file picker and worked without All files access.
4. Choose **Maps Automotive 26.10 TEST** from our source. If Morphe offers several sources, select ours and leave patches from other sources unselected for this app. Select **26.10.120001.E → No, I already have an APK**, then select your clean original APK. Automatic original-APK Download has not been verified for this AAOS version. Do not choose a phone Maps APK or an already patched output.
5. Enable only **Maps Automotive for BYD (MicroG-RE TEST)**. Open its settings icon for **Battery electric vehicle (CCS2)** (`known_bev`). This option defaults OFF; turn it ON only for a confirmed BEV using CCS2 station planning. It does not enter your battery capacity or enable vehicle reading.
6. Choose **Patch** (Proceed to patching in older versions) and keep Manager in the foreground. After success, choose **Save** to export the signed APK. Transfer that APK to the car, then open it with the normal Android file manager to install. Do not rely on the app card’s Installed badge after Save: Manager 2.0.0 showed it before the package existed. Its Install button and Android’s installer did install both preview 6 outputs successfully in the fresh API 32 test.
7. Back up **Settings → Backup → Signing key → Export** (2.0.0; older versions use System / Import & export) separately from your ordinary Manager settings. Import that same signing key when moving to another patching device. A replacement key cannot update an app signed with the old one.

For **preview 1**, on the disposable Android API 32 emulator, actual patching, Save/export and a separate ADB installation succeeded. With MicroG-RE absent, the app displayed the required-provider explanation and **Not now** dismissed it without a crash. After installing fresh MicroG-RE 7.2.1 without an account, first-run and Instrument cluster settings opened. The exported APK also passed signature/alignment, manifest, original-class preservation and written EV/navigation/cluster hook checks. This clean-emulator test did not sign in to Google or prove map tiles, live vehicle data or physical cluster output. A Manager-generated signer differs from the existing public Automotive signer; the same migration and data-loss warning above applies. Patching on the head unit itself has not been established across BYD firmware.

### Updating the source and Maps

Our remote source is **TEST only**, including the default main feed. Morphe can refresh its `.mpp` automatically according to **Settings → Advanced → Updates**, or you can choose **Update** on the source card. This downloads patch updates inside Morphe; it does not update the Maps installation by itself.

**From preview 4–9 to preview 10:** use the same **26.10.120001.E** original. Refresh the Remote source until it shows preview 10, or import the preview 10 `.mpp` as a Local source. Then patch again, sign with your **same key** and install over your current Maps app; it keeps local data. **If you have more than one source, turn the older ones off:** every preview uses the same patch name, and on the tested car Manager once applied the older preview 6 source instead of the new Local file. The Google patch is still Google20: rebuild it only if you come from preview 7 or earlier. If you come from preview 8 or earlier, also turn on **Send to car → Keep phone routes arriving** in the cluster settings. Use the same key as Maps. Gemini is optional: follow [its separate setup](GEMINI-SETUP.en.md) only if wanted.

**From preview 3 to preview 4 or 5:** preview 4 needs the **26.10.120001.E** original instead of 26.09.280001.E. Patch that new original, sign with your **same key** and install the result over your preview 3 app. The package and its version code stay the same, so Android treats it as an ordinary update and keeps your Maps data and settings. Once our source serves preview 4, Morphe offers only the 26.10 patch. To stay on 26.09, use the preview 3 bundle as a Local source.

To update Maps, run patching again with the supported clean original, keep your **same signing key**, choose **Save**, and install the resulting APK. There is no in-app APK OTA or automatic migration from the old Automotive builds. Local `.mpp` imports still need a manual replacement file. Remote import, the source card and patch/version details were checked for **preview 1** in Manager 1.35.0 on clean Android API 32 with Pre-release OFF. That Remote check did not repeat patching; the completed preview 1 Local patch/export/install checks above are separate evidence. Preview 6 was separately imported as a Local source and both app outputs built/exported/installed with Manager 2.0.0 on clean API 32. Our test builds 54O, 54P and 54Q were imported as Local sources and patched with Manager on the tested car. The Remote feed serves preview 10; the Android Manager Remote-download UI was not retested for this release.

### Computer fallback: Morphe Desktop CLI

Use the downloaded filenames in place of the example filenames below; `morphe-desktop.jar` means the Desktop JAR you downloaded from its official Releases page. The command was verified with Desktop 1.18.1, and a later release may change CLI options. Keep the original input unchanged. The first command checks the original APK's signature; also compare its SHA-256 with the value above.

```sh
apksigner verify original-maps-automotive.apk
java -Xmx2g -jar morphe-desktop.jar patch --unsigned -e "Maps Automotive for BYD (MicroG-RE TEST)" -p maps-automotive-for-byd-morphe-preview.10.mpp -o maps-automotive-unsigned.apk -r patch-result.json -t patch-scratch original-maps-automotive.apk
```

For a confirmed BEV using CCS2 station planning, add `-O known_bev=true` to the patch command. Do not add `--force` or `--continue-on-error`; a failed compatibility check means the input or tool combination needs checking.

The output above is unsigned. If you do not already have your own key for this package, create one **once**, using interactive password entry:

```sh
keytool -genkeypair -keystore maps-automotive-user.keystore -alias maps-automotive -keyalg RSA -keysize 4096 -validity 10000
```

Back up that keystore and its password separately before continuing. If you already have a signing key for this package, skip key creation and use its filename/alias in the following commands. Android SDK Build Tools36.0.0 were used for this signing/alignment workflow:

```sh
zipalign -P 16 4 maps-automotive-unsigned.apk maps-automotive-aligned.apk
apksigner sign --ks maps-automotive-user.keystore --ks-key-alias maps-automotive --out maps-automotive.apk maps-automotive-aligned.apk
apksigner verify --print-certs maps-automotive.apk
zipalign -c -P 16 4 maps-automotive.apk
```

Use interactive password entry; do not put a keystore password in a shared command, screenshot or support report. Keep the same key for later updates. Morphe's signing workflow may also be used if it keeps the same exportable key between updates. No production or laboratory signing key is supplied by this project.

## Optional: BYD battery and range

Basic Maps use does not require this setup. Both vehicle-data opt-ins start **off** on a new installation.

1. Enable network ADB in the head unit's settings. The reader connects locally to `127.0.0.1:5555`; ADB must remain enabled after a head-unit reboot.
2. In BYD settings, allow Maps Automotive automatic startup and background operation. On the tested Tang the menu is **Disable background Apps**: the **Maps Automotive switch must be OFF** there, because it is a list of blocked apps. Other firmware may use different labels or switch directions. Recheck this permission after updates.
3. Open **Maps Automotive → Instrument cluster → BYD vehicle data** and enable **Use BYD vehicle data**.
4. Open **Automatic reader → Enable automatic reader**. Approve the standard ADB authorization prompt on the head unit and select **Always allow**. If needed, use **Authorize or retry**.
5. Check for **Automatic reader connected** and fresh battery charge/range readings that match the instrument cluster.

After initial setup, the reader can start without a connected computer. Morphe revision 25 did this after a complete head-unit reboot on the tested Tang. The reader code is unchanged since preview 1, but revision 54 has not had a new reboot test. Readings update about once a minute and expire after 90 seconds. The reader only reads vehicle data; it does not operate the charging port or change vehicle settings.

Leave **Reader compatibility → Automatic CAN/CANFD** selected initially. Unsupported firmware can show Unknown or Unsupported. The advanced firmware-detection mode requires comparing its fresh candidate charge and range with the physical instrument cluster, then explicitly confirming them before EV routing can use them. Do not confirm guesses.

## Optional: experimental EV route planning

This preview's route integration is for **battery electric vehicles using CCS2 charging stations**. It has not been validated for PHEVs or other station connectors. The `known_bev` patch option must have been enabled when creating the APK; it does not turn on the reader or fill in your battery capacity.

Once charge and range are fresh and correct, open **BYD vehicle data → Vehicle profile**. Choose **BEV**, enter your own usable battery capacity in **kWh** and the connectors you use, then **Save vehicle profile** and enable EV routes. After changing the type or connector, Force stop and reopen Maps. The owner test used a BYD Tang with a user-entered 108 kWh capacity and CCS2 stations through an adapter. Use your vehicle's capacity, not this example value.

With the profile enabled, fresh accepted charge/range data are supplied to Maps for its native EV route calculation. In a **Morphe revision 25** stationary test after a full reboot, Maps planned a 907 km route to Paris with **two automatic charging stops and 30% at arrival**, using the car's 91% / 548 km readings. We did not add charger waypoints manually or start driving the route.

These are route-preview results, not a road validation of battery predictions. Charging power and charging duration are not supplied or verified. Do not interpret a displayed journey time as a tested estimate including charging time. When readings expire, the integration withdraws the battery prediction rather than continuing with old data.

## Optional: DiLink 3 instrument-cluster map (experimental, Android 10 only)

1. Keep network ADB enabled; the projection uses the head unit's local ADB.
2. Open **Instrument cluster → DiLink 3 cluster test → Enable DiLink 3 map projection**, confirm **Start test** while parked, and approve the Maps ADB key if prompted. Keep **Show cluster map** enabled.
3. **Projection status** shows the current state. **Restore stock cluster** pauses projection and returns the stock instrument layout; turn the option off after testing to keep it off on the next launch.

If Maps restarts while projection was active, projection stays paused until you press **Authorize or retry**. This prevents a crash loop after an unclean session. Since preview 4 there is one exception: after the car is switched off and on, a projection that previously ran for at least 30 seconds without an error resumes once by itself. HUD guidance is not supported on DiLink 3. One tester's photos showed the map and route on a DiLink 3 hybrid cluster (revision 40); later revisions, including the automatic resume, are not yet confirmed in a car.

## Optional: DiLink 5.1 instrument theme (experimental, not yet tested in a car)

**Instrument cluster → BYD instrument theme** appears only on two exact DiLink 5.1 / UI7 firmware builds. Choose a manual layer (**Map**, **Scenario** or **Simple**), or enable **Follow instrument theme** with the one-time **Allow Usage Access · ADB** setup so Maps follows the stock cluster theme. Unknown visibility hides the map and releases wheel controls; native zoom needs automatic following. This profile has host tests only.

## Sign-in troubleshooting on the tested Tang

If MicroG-RE fails before showing the email form, try **MicroG Settings → Device Registration → Select profile → Google Pixel 5 (Android 13)**, then retry Add account. This changes how MicroG-RE presents the device to Google. That profile allowed sign-in on the tested Tang; it is a device-specific workaround. The historical test also had **Authenticate with device registration** disabled, but disabling it alone did not fix the failure, and its necessity with Pixel 5 was not isolated. It is not a confirmed required setting.

## Preview limits

Gemini was tested only on Tang/DiLink 5.0/API 32. Keep Google self-start allowed and compact recovery ON. The Google patch needs API 32+ and MicroG-RE 7.2.2+; Android 10 Maps support does not imply Gemini support. See [the exact Gemini verification](RELEASE-NOTES.md#verification).

- Revision 54 was checked on one BYD Tang (DiLink 5.0): every preview 3 feature listed above works on 26.10, including pointer offset and cluster zoom during an active route, 3D buildings, interface size, Search alignment, BYD cluster turn hints and steering-wheel zoom after switching the car off and on. Some of these checks used a later test build of revision 54 that only changes how the AMap adapter package is chosen; those historical preview 4/5 results are separate from the new Gemini checks. Other cars and firmware were not tested.
- The preview 10 3D car with our own rig was checked on an Android 12 (API 32) emulator only. The same Tang 2024 model ran on the tested Tang in private builds that used a different rig. The flat car icon was checked on the emulator by day and at night; it has no setting of its own and shows when the 3D car is off.
- The preview 5 option «Start cluster map without opening Maps» and the faster reader wake-up were tested on one Tang only. Waking Maps after the car is switched off and on needs the Automatic reader.
- Android 10 / DiLink 3 and DiLink 5.1 support is experimental. On 26.10, Android 10 was checked only on an emulator, with the preview 4 build (update install, verifier, start, map); the preview 5 changes were not run on Android 10. The DiLink 3 Compose crash fix, the DiLink 3 automatic resume, the DiLink 3 AMap adapter choice and DiLink 5.1 have no car test. Rarely used screens may still reach newer-Android code on Android 10.
- CCS1 in the vehicle profile has host tests only.
- Manager 1.35.0/API 32 evidence belongs to preview 1. Preview 6 Local import / both builds / export / key backup / install passed with Manager 2.0.0 on fresh API 32. Google merged output passed an authenticated Gemini request; those preview6 compact/route checks were deferred. The owner subsequently installed Google20 through Morphe on Tang: capsule LISTENING/close observed, Spotify attenuation failed. New Live route/call/reboot checks are not claimed.
- HUD on DiLink 3, satellite imagery in the Morphe cluster and current-bundle PiP need further work. The cluster arrow may keep its navigation style after a route ends; this is under investigation. A general native navigation-service startup timeout remains unresolved.
- Reader/reboot and Paris charging-stop evidence belongs to Morphe revision 25. No new road validation, charging-power/duration test or charging-inclusive ETA guarantee is claimed. PHEV/HEV profiles have no fuel or combined energy model.
- Morphe updates the patch source. Maps still requires repatching and installation with the same backed-up key; there is no in-app APK OTA. Automatic downloading of the correct original AAOS APK has not been verified.

[Release notes](https://github.com/romanchukg-cloud/maps-automotive-for-byd-patches/releases/tag/morphe-preview.10).
