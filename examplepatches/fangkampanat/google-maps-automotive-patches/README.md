# Google Maps Automotive for MicroG-RE on BYD cars

Google Maps Automotive on a BYD DiLink 3 head unit (Android 10) with [MicroG-RE 7.3.0](https://github.com/MorpheApp/MicroG-RE/releases/tag/7.3.0). The patched app, **Maps**, installs alongside phone Google Maps. This repository publishes `.mpp` bundles only; bring your own original APK.

[BYD Files](https://tryy.cc/byd), PIN: 344993

![The patched Maps in split screen on a BYD Dolphin: route preview to Nakhon Ratchasima showing "Arrive with 29%", next to MicroG-RE 7.2.2](docs/gmaps-cars-byd.webp)

## Features

### Screen

- **UI density**: Fits the car layout to split screen.
- **Language**: English or Thai for this app, whatever the head unit's language.
- **Driver side**: Puts Maps' cards on the driver's side.
- **Color scheme**: Auto (headlights) uses night colors only while the low beam is on, since BYD keeps the head unit in night mode. Auto (time) uses night colors between two times you set, 18:00 to 06:00 by default.
- **3D buildings** in the map layer menu.

### BYD battery (EV)

- Battery on arrival from the car's own reading (read-only).
- Choose the battery to arrive with at charging stops, and see the battery health.
- On cars with BYD's energy table, Maps plans with that table adjusted for your car from the A/C draw and guided routes.
- **Export records** copies the drive records to `Android/data/app.morphe.android.apps.maps.automotive/files/Documents/morphe-drive-records`.

### More

- **Send to car** from phone Google Maps on the same Google account, with a status check.
- **BYD navigation volume** for spoken directions.
- **Updates**: A daily check for a new release, on by default. It sends only the patches version. Maps from the ready-made APK in BYD Files can install the next release after you confirm.
- **Report Maps** icon for problem reports, and a safe mode.

UI density, Language, Driver side, Color scheme, BYD battery, Send to car and Updates are in Maps' Settings. All patches except Android 9 (API 28) are on by default; only that set is tested.

## Tested

Tested on a BYD Dolphin (DiLink 3.0, Android 10) with MicroG-RE 7.3.0.

- Other BYD models, DiLink 5 and Android 11 or newer are untested.
- BYD battery starts on for the Dolphin and for BYD model ids 128 and 138, where owners' reports show it working. On other models, and on DiLink 5, it starts off.
- Plug-in hybrids are not supported.

## Requirements

- [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) 2.1.0 or newer, with Java 21
- The original **Google Maps (Android Automotive) 26.10.120003.E** APK (version code `1068833413`), for example from APKMirror. Other versions are untested.
- An ARM64 BYD head unit with Android 10 or newer, 4 KiB memory pages and ADB access for one command during install

## Install

### 1. MicroG-RE on the head unit

1. Install `microg-7.3.0-icon-arm64-v8a.apk` from [MicroG-RE 7.3.0](https://github.com/MorpheApp/MicroG-RE/releases/tag/7.3.0).
2. Run this once over ADB. Without it, MicroG-RE stops sending your location to Maps on DiLink 3.

   ```bash
   adb shell dumpsys deviceidle whitelist +app.revanced.android.gms
   ```

3. Turn OFF **MicroG RE** in BYD's **Disable Autostart**.
4. Open MicroG-RE, grant its permissions and sign in.
5. For Send to car, turn on **Cloud messaging** and keep **Device registration** on.
6. For voice guidance, install [Google TTS for MicroG-RE](https://github.com/fangkampanat/google-tts-microg) and download your voices.

### 2. Patch in Morphe Desktop

1. Add this repository as a **Remote** source and turn off other sources for Google Maps:

   ```text
   https://github.com/fangkampanat/google-maps-automotive-patches
   ```

2. Turn on **Settings › Advanced › Expert mode**.
3. Drop the original APK onto **Drop APK here** and click **Continue**.
4. Optional: To rename the app, set **App name** under **Configure options** of "Google Maps Automotive for MicroG-RE".
5. Click **Patch**. Leave **Continue on error** off, and don't patch in a synced folder such as Google Drive.

If patching fails at **Rebuilding APK** on Windows set to Thai, start Morphe Desktop with [`_Start-Morphe.cmd`](https://github.com/fangkampanat/gmaps-patches#verifyexception-at-rebuilding-apk-windows) and patch again.

### 3. Maps on the head unit

1. Install the result and start **Maps**.
2. For Send to car, turn OFF **Maps** in BYD's **Disable Autostart**. BYD turns it back on after each install or update.

## Reporting problems

1. Open the red **Report Maps** icon and tap **Send**. If the app hangs on a grey screen, send the report before you restart the head unit.
2. Tap **GitHub QR code** and scan it with your phone to open an issue with the report ID.

Reports leave out your location, e-mail, VIN and push tokens, and are deleted after 14 days. If no report can be sent, attach the crash file from `/sdcard/Documents/Morphe/` to an [issue](https://github.com/fangkampanat/google-maps-automotive-patches/issues).

**Safe mode**: After two crashes within 10 minutes, the app starts with its extra features off. Turn them back on one at a time in Report Maps to find the one that crashes.

## Patches list

<!-- PATCHES_START -->
[v0.1.8](https://github.com/fangkampanat/google-maps-automotive-patches/releases/tag/v0.1.8) · 7 patches

Eligible versions: Any version.

| Patch | Description | Options |
| --- | --- | --- |
| 3D buildings | Adds Maps' own 3D buildings to the map layers. Google hides them in this app. |  |
| Android 9 (API 28) | Test builds for Android 9 head units (issue #11): lets the app install and start on Android 9. Tested on one Android 9 head unit; BYD head units do not need it. |  |
| BYD battery (EV) | Feeds the BYD battery into Maps' EV routing (battery on arrival, chargers). On by default on the tested BYD Dolphin and on BYD model ids 128 and 138, where owners' reports show it working; off with an "untested" notice on other BYD models and on DiLink 5. A Settings row turns it on or off and sets the battery to arrive with at charging stops and at the destination. |  |
| BYD location flicker fix | Holds back BYD's brief location off/on flips for up to 3 s, so Maps does not flash its location lockout. |  |
| BYD navigation volume | Plays Maps' spoken directions on BYD's navigation volume instead of the media volume. |  |
| Google Maps Automotive for MicroG-RE | Runs Google Maps for Android Automotive on Android 10 with MicroG-RE 7.3.0, named "Maps" unless the App name option says otherwise. Adds UI density, language, driver side and color scheme settings, a problem report, an update check and a safe mode. | • App name |
| Send to car | Lets phone Maps send a trip to the head unit through MicroG-RE (push routes, the notification service identity and maps.app.goo.gl links). Adds a Send to car row in Settings: a status check and the car's name in phone Maps (default "Vehicle 1"). |  |

<!-- PATCHES_END -->

## Credits and license

Built on [Morphe](https://github.com/MorpheApp) and [MicroG-RE](https://github.com/MorpheApp/MicroG-RE). The project is unofficial and not endorsed by Google, BYD or Morphe. Source code is licensed under [GPL-3.0](LICENSE); preserve [NOTICE](NOTICE). Build instructions: [docs/build-setup.md](docs/build-setup.md).
