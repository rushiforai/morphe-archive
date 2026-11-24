# QM Patches

A Morphe patch for Waze Mod that hides the search sheet when you tap the map, and brings it back when you tap the map again. The original sheet height is retained; swipe up to use search. The sheet also hides after 10 seconds without interaction.

**Advanced Speedometer** is an experimental, optional patch. Long-press and drag the speedometer, or add a second finger while holding and pinch to resize it. The phone and secondary displays keep separate portrait and landscape placements. Double-tap the indicator to swap the large dial and the small speed limit sign. The patch remembers the chosen layout and shows the speed dial in its main position whenever Waze has no sign to display. On supported builds, the indicator stays visible while you pan the map.

**Add navigation and alert widget** adds a **Waze Navigation & Alerts** home-screen widget for original Waze 5.27.5.0. The panel stays expanded, showing current speed, the posted maximum speed, up to four upcoming alerts with Waze icons, and the next maneuver on an active route or the current street if Waze knows it. It shows dashes for missing guidance or alerts and displays 0 while speed is unavailable. It shares the active Waze engine and stops an engine it started for itself when tracking ends and there is no independent Waze session. Upcoming warnings can be spoken through Waze’s audio when its guidance mode permits alerts.

Automatic trip tracking is on by default. Adding the widget asks for any missing permissions and then waits for a trip. For an existing widget that needs access, tap it and choose **Allow permissions**. You can turn off automatic tracking from the widget controls.

An Android Auto projection session or a paired Bluetooth device that reports Car Audio or a Bluetooth LE motorized-vehicle type can start tracking. Android Auto's event is available while Waze's process is running. If Android has stopped that process or blocks a background start, Bluetooth and Google Play services' **In vehicle** detection can still start tracking. A Bluetooth disconnection has a 15-second grace period. Automatic trips continue when the phone is asleep or locked. The screen-off rule for manual tracking follows Android's device-wide sleep state.

Grant **Nearby devices** for Bluetooth detection and **Physical activity** for the motion fallback. In Waze's Location permissions, enable precise location and choose **Allow all the time** so a trip can start while the app is in the background. Waze already declares Bluetooth connection and background location permissions. The patch adds the Physical activity permission.

## Add to Morphe

In Morphe Manager, open **Sources**, add a source, and enter:

`https://github.com/quangmach/waze-minimize-search-bar`

Select the **Waze Minimize Search Bar** patch. Supported builds are Waze Mod `com.chisadin.wazemod` 5.24.5.0 and original Waze `com.waze` 5.24.5.0 and 5.27.5.0. Original Waze support is experimental. Other versions may require a new profile.

The bundle was applied to all three target APKs and its resulting bytecode was inspected. The tap, timeout and touch behavior have not yet been tested on a phone. Re-signing with a different key may require uninstalling an existing installation and can remove its data.

The speedometer patch applied successfully to original Waze 5.24.5.0 and 5.27.5.0 and Waze Mod 5.24.5.0, but its gestures have not yet been tested on a device. It is listed as experimental for Waze and Waze Mod versions and is disabled by default; enable experimental app versions and select it in Morphe.

The repository contains patch source only; it does not distribute Waze or its APK.

## Build

Use JDK 21, the Android SDK, and Morphe's Gradle dependencies. Run `./gradlew buildAndroid`; the output is under `patches/build/libs/`. GitHub Packages access may require credentials. Optional sibling checkouts of Morphe's patcher and Gradle plugin can be used instead, as configured in `settings.gradle.kts`.

Based on Morphe's patches template. Licensed under GPL-3.0; see LICENSE and NOTICE.

**Remove Car mode when Waze inactive on Android Auto** keeps the phone map and shared destinations on the phone while another app is visible on Android Auto. Shared destinations open on the display where the Waze map is already running. The patch also centers the landscape phone map horizontally and raises the vehicle arrow. This optional experimental patch targets original Waze 5.27.5.0.
