# Waze

**App version:** 5.26.90.901 · **Build:** 1030746 · **Original file:** APKM

[Download original app](https://buzzheavier.com/cpwy7pirf997){ .md-button .md-button--primary }

Select the complete original APKM archive for this version in Morphe Manager.

[Install Waze for Android Auto: steps with screenshots](../guides/android-auto.md){ .md-button }

## Where these patches come from

24 of these 40 patches come from [bearinmind patches](https://github.com/bearinmindcat/morphe-patches) by bearinmindcat, where they are published as De-Waze for Waze 5.24.5.0. This project ported them to 5.26.90.901 and maintains that port separately. Five additional patches and the extensions to bearinmind patches come from this project, compared with bearinmind patches v2.8.3.

| Area | Added by this project |
| --- | --- |
| Ads | **Hide ads** also removes sponsored search results on the phone and in the car, the ad token and Adspam cookie sent with searches, and main-menu promotions, including ones Waze already saved. |
| Telemetry | **Remove telemetry** also stops advertising ID collection and hides any saved ID, discards usage events already queued for upload, blocks automatic diagnostic log uploads and turns off Firebase Sessions. You can still send logs yourself. |
| Consent | New: **Skip consent screens** answers privacy and terms prompts without showing them and declines personalized ads. |
| Music | New: **SoundCloud in Waze** and **YT Music Morphe in Waze** add both services to the built-in audio player. |
| Other apps | New: **Broadcast navigation data** shares speed and zone data with other apps, and **Support Gearslip** lets Gearslip run Waze, including a patched Gearslip. |
| Alert sharing | **Share alerts with Maps** now stops at once when you switch it off and clears alerts it already shared. |

The eleven optional controls below are adapted from [Forsigh Waze Patches](https://github.com/Forsigh/waze-patches) for this Waze version.

## Patches

### Added by this project

| Patch | Default | What it does |
| --- | --- | --- |
| **Broadcast navigation data** | On | Shares current speed, road limits, road alerts and approaching/active average-speed zones with other apps while Waze runs in the background. No overlay required. |
| **Skip consent screens** | On | Answers privacy and terms consent silently and declines ad personalization without showing a screen. |
| **SoundCloud in Waze** | On | Adds SoundCloud to Waze's built-in audio player. Show list displays the signed-in Feed and playable mixes, not the personal Library. SoundCloud Home recommendations are not included. |
| **Support Gearslip** | On | Accepts Gearslip as a car host by package name, whichever key signed it, so a patched Gearslip keeps working. Other hosts keep Android Auto validation. |
| **YT Music Morphe in Waze** | On | Adds YT Music Morphe to Waze's built-in audio player. Show list displays supported Home recommendations and mixes, not your personal Library. Available shelves depend on the installed client. |

### From bearinmind patches, extended here

| Patch | Default | What it does |
| --- | --- | --- |
| **Hide ads** | On | Removes sponsored pins, stop ads and ad tracking, plus sponsored search results and main-menu promotions. |
| **Remove telemetry** | On | No crash reports, usage stats or performance data. Also blocks advertising ID collection, queued usage uploads and automatic diagnostic logs. Traffic reporting stays. |
| **Share alerts with Maps** | On | Shows Waze alerts in Ungoogled Maps on this phone. Waze must be signed in and open. Switching it off stops sharing at once. |

### From bearinmind patches, ported to 5.26.90.901

| Patch | Default | What it does |
| --- | --- | --- |
| **Alert distances** | On | How early each alert is announced. |
| **All moods** | Off | Unlocks every mood, beta ones too. |
| **Average speed zone bar** | On | Bar with progress and your average speed in an average speed zone. Off until switched on. |
| **Bigger alert pins** | Off | Bigger alert pins on the map. |
| **Bigger speedometer** | On | Bigger speedometer and speed limit digits. |
| **Change app name** | On | Renames the app, with De-Waze as the default. Look for that name in Android Auto too. |
| **Flock cameras** | On | Chime when a Flock camera is ahead, from OpenStreetMap. No map pins or routing. Off until switched on. |
| **Full black** | On | True black dark mode for AMOLED screens. |
| **Map skin** | On | Bigger map labels, a wider arrow and a warm day background. |
| **Navigation distances** | Off | Android Auto heads-up distances and the traffic bar threshold. |
| **No AI reporting** | Off | Turns off Gemini voice reporting. |
| **No Google Assistant** | Off | Removes Google Assistant from Waze. |
| **Open without device location** | Off | Opens Waze with location off and uses it once it is on. Still needs the location permission. |
| **Remove permissions** | On | Removes contacts, calendar, phone, camera and advertising ID access. |
| **Remove sign-in prompts** | On | Stops Waze's own reminder to register your account. |
| **Report speed limit** | Off | Lets you correct speed limits from the speedometer (unverified). |
| **Speed camera alerts** | On | Chime when a speed camera is ahead, from OpenStreetMap, in any country. No map pins or routing. Off until switched on. |
| **Speed camera sound at any speed** | On | Plays the camera sound even when you are not speeding. |
| **Speed cameras everywhere** | Off | Enables camera and police alerts across countries. Check local rules before enabling. |
| **Speed limit sign** | Off | One speed limit sign style in every country. |
| **Stay awake in the background** | Off | Keeps Waze running without a route so its alerts keep reaching Maps. Uses more battery. |

### Optional controls adapted from Forsigh Waze Patches

All eleven patches are off by default. Select only the controls you want when patching; their switches start on in Customization.

| Patch | Default | What it does |
| --- | --- | --- |
| **Auto zoom** | Off | Keeps the selected auto-zoom mode: Off, On or By speed. Change the mode later in Customization. |
| **Lane guidance** | Off | Enables lane guidance and optional straight-ahead hints where lane data is available. Your own Waze lane-guidance setting still applies. |
| **Extra map info** | Off | Adds independent compass and toll-price switches. Prices appear only when Waze supplies them with route data. |
| **Speed limit controls** | Off | Adds independent switches for always showing the known road limit and for limit-drop warnings. Warning distance is editable, initially 1,000 m. Reporting and sign style stay separate. |
| **Car alerts as notifications** | Off | Uses car notifications for supported alerts when the car host supports them. |
| **Car traffic meter** | Off | Enables the traffic meter on supported car navigation screens. |
| **Native camera and hazard controls** | Off | Keeps selected phone-use, bus-lane, carpool/HOV and noise cameras, plus raised/highway crosswalk alerts enabled. Includes map, notification and applicable camera-sound settings. Requires Waze data. |
| **Speed bump controls** | Off | Adds independent switches to show speed bumps on the map and suppress their on-route warnings. |
| **Car reconnect grace period** | Off | Keeps Waze ready through brief Android Auto disconnections. Initially 2 minutes, adjustable from 1 to 10; the phone background timeout is unchanged. |
| **Hide recent destinations** | Off | Hides recent destinations without deleting stored history. Favorites and future events stay available. Reopen the list after switching. |
| **Allow high refresh rate** | Off | Raises the phone display-mode ceiling to 90 Hz initially, adjustable from 60 to 120 Hz. Uses supported modes; does not guarantee rendering FPS or change the car display rate. |

Configure these on the phone before connecting. Car features need individual checks in Gearslip or Android Auto; selecting them does not establish that every host displays them.

Camera/hazard and speed-bump switches return their settings to Waze when switched off. The native camera controls complement our OpenStreetMap alerts; they cannot add missing road data. Speed-bump warning suppression extends Forsigh's map-visibility control with a separate warning setting.

Restart Waze after changing the refresh ceiling or reconnect delay, then reconnect the car. A grace period can keep Waze active longer after disconnecting. Higher phone refresh rates may use more battery and increase heat; rendering and power behavior need checks on your phone.

## Advertising and tracking services

Hide ads and Remove telemetry reduce the supported advertising, crash reporting and usage measurement. Waze still uses online services for maps, routes, live traffic, accounts and reports. These patches do not make navigation anonymous.

## Before using

After patching, open **Customization** in the side menu below **Shut off** to configure the features you applied. Speed camera alerts, Flock cameras and Average speed zone bar start off there even when their patches are selected. Restart Waze after changing map or alert-pin settings.

**Broadcast navigation data** needs Waze’s native engine and background location access, not a foreground phone Activity. It automatically includes the background keep-alive control (180 minutes by default, configurable). Native approach observations can warn before zone entry. Road reports include available camera, police, hazard, crash, jam and closure alerts, plus enabled Flock/speed-camera layers. Averages cover the observed part of a zone; estimated progress and missing/stale values are identified explicitly. [Broadcast contract](https://github.com/johninnl/nl-morphe-patches/blob/main/docs/navigation-broadcasts.md).

**Skip consent screens** makes privacy and terms choices without showing those screens. It declines personalized ads and accepts required terms. Leave this patch off if you want to read and make those choices yourself. Remove telemetry and Remove permissions reduce the listed data access; essential navigation services remain active.

For Android Auto, follow the [KingInstaller steps with screenshots](../guides/android-auto.md). With **Change app name**, Waze may appear as **De-Waze** in the app list. The two audio patches are not tied to one version; the other patches on this page target 5.26.90.901. Available audio content depends on your music app and account. Live routing, road alerts and every car setup have not been fully tested. Report speed limit remains unverified.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md#waze)
