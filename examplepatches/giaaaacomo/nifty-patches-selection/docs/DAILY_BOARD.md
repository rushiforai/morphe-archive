# Samsung Daily Board

Supported APK: `com.samsung.android.homemode` version `15.1.01.3` (Android 14+).
Distribute the patch bundle (`.mpp`) only; obtain and patch the APK locally.

## Choose the behavior

All Daily Board patches are opt-in in Morphe. Each optional patch automatically
includes **Enable phone support** and can be selected without the other extras.

| Selection | Result |
| --- | --- |
| Enable phone support | Device compatibility, launcher and Android dream component, phone-sized layout and onboarding, safe activation-mode switching, local photo fallback and calendar holiday-provider crash fixes. No custom extension runtime is injected. |
| Use Open-Meteo weather | Replaces the Samsung weather integration with Open-Meteo using approximate location. |
| Enable media controls | Restores active media sessions through Android notification access. |
| Use phone charging as dock | Treats wireless or landscape charging as docking and updates the related labels. |
| Customize orientation | Adds System, Portrait, Landscape and sensor rotation independent of Android's rotation lock. |
| Customize screen saver | Adds angle filtering, range editor access, diagnostics and optional Android screen saver setting control. |

The base keeps Samsung's weather and media integrations. On an ordinary signed
install, Samsung services may deny access; the corresponding optional patches
supply alternatives. Photos use the existing local source because initializing
Samsung's signature-protected photo provider crashes the entire app at startup.
A base-only selection does not add notification access, Open-Meteo requests, custom
settings, or charging-as-docking. Choose Daily Board in Android screen saver settings
manually. The app's mode selector does not write privileged Android settings.

Orientation and screen saver customization are independent. Orientation defaults
to System with sensor override off; it applies to the main activity, settings,
angle calibration and dream window when selected. Existing settings can be retained
when updating the APK, but a setting has no effect without its corresponding patch.

The screen saver angle switch uses the same range as Samsung's angle editor.
Existing angle configuration is inherited on the first use, then its enabled
state is stored separately from Samsung's app/charging mode. Angle diagnostics
shows live sensor values and up to 16 recent gate decisions in memory only.
No diagnostic history is saved or uploaded.

## Android screen saver setup

Select Daily Board in Android's screen saver settings and enable the screen saver.
The app's activation modes are distinct: app/notification/charging opens the normal
activity, while Android starts the screen saver after the screen timeout while
charging. A launcher tap is not a screen saver test.

An ordinary app cannot change Android's secure screen saver settings. Without
additional permission, switching modes remains safe, but configure Android's
screen saver manually. Outside the angle range, the optional patch hides the
dream contents and lowers brightness; this is not the same as handing off to AOD.

For automatic mode switching and angle handoff to AOD/screen-off, the optional
patch can use the already-declared permission, granted once through ADB:

```sh
adb shell pm grant com.samsung.android.homemode android.permission.WRITE_SECURE_SETTINGS
```

To revoke it:

```sh
adb shell pm revoke com.samsung.android.homemode android.permission.WRITE_SECURE_SETTINGS
```

With permission, the gate suspends Daily Board outside the configured range and
re-enables it after a stable in-range reading. It briefly wakes the display so
Android can apply its normal timeout. Recovery also runs on app replacement,
unlock and charging changes. A different screen saver selected in Android is
not replaced by angle recovery. Android may stop background processes; after a
force-stop, reopen the app and check Android's screen saver settings if needed.

## Media and weather

Notification access authorizes Android's active media-session API. The extension
does not inspect or store notification content; it retries when Android binds the
listener after access was granted. Android settings control this permission.

Weather uses Open-Meteo. Coordinates are rounded to two decimal places before
network requests or reverse geocoding and are not stored. Weather and the display
location name are cached privately for 30 minutes. Legacy coordinate cache keys
are removed. These media and weather behaviors apply only when their respective patches are selected.

## Validation of the split

The local build and CLI patch application were checked for the base, each of the
five extras alone, and all extras together against 15.1.01.3. DEX inspection
confirmed the base injects no extension and preserves the original entry points
for weather, media, docking, orientation and dream start. Photo initialization
uses the compatibility fallback in the base. Each isolated
extra changes its intended entry point; the combined selection includes all five.
Manifest inspection confirmed the notification service appears only with media
controls and the recovery receiver only with screen saver customization.
Device validation is recorded separately; CLI success is not a runtime test.

On Samsung SM-G998B (Android 14), Morphe Manager 1.34.0 applied and installed
the base and combined selections. Base onboarding, main board, activation-mode
switching and USB auto-start toggle completed without a crash. The combined
selection exposed the orientation choices and live angle diagnostics, and
Android screen saver preview started HomeModeDreamService successfully without
WRITE_SECURE_SETTINGS. Network weather results, active music playback, and every
angle boundary were not exhaustively retested in this release.

When upgrading from 0.3.3, select the weather, media and charging patches to retain
those features; they are no longer bundled into Enable phone support.
