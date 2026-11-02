# Waze patch catalog

The source branch provides 40 patches: the two existing audio patches, all 24 Waze patches from deWaze, silent consent completion, native navigation broadcasts, Gearslip host support and eleven opt-in controls. Imported patches target **5.26.90.901** (version code **1030746**, Android **12L/API 32+**). Supply the original APKM with its ABI, density and language splits.

The audio patches remain **Any**: their source was unchanged and both applied with fingerprint validation to this build. This confirms application to this version; signed-in playback, shelves and provider login need live provider testing.

| Patch | Default | App version | Source |
| --- | --- | --- | --- |
| Alert distances | On | 5.26.90.901 | [WazeExtrasPatches.kt](../../patches/src/main/kotlin/patches/waze/WazeExtrasPatches.kt) |
| All moods | Off | 5.26.90.901 | [WazeExtrasPatches.kt](../../patches/src/main/kotlin/patches/waze/WazeExtrasPatches.kt) |
| Average speed zone bar | On | 5.26.90.901 | [WazeZoneBarPatch.kt](../../patches/src/main/kotlin/patches/waze/WazeZoneBarPatch.kt) |
| Bigger alert pins | Off | 5.26.90.901 | [WazeMapSkinPatch.kt](../../patches/src/main/kotlin/patches/waze/WazeMapSkinPatch.kt) |
| Bigger speedometer | On | 5.26.90.901 | [WazeSpeedometerPatch.kt](../../patches/src/main/kotlin/patches/waze/WazeSpeedometerPatch.kt) |
| Broadcast navigation data | On | 5.26.90.901 | [WazeNavigationBroadcastPatch.kt](../../patches/src/main/kotlin/patches/waze/WazeNavigationBroadcastPatch.kt) |
| Change app name | On | 5.26.90.901 | [WazeAppNamePatch.kt](../../patches/src/main/kotlin/patches/waze/WazeAppNamePatch.kt) |
| Flock cameras | On | 5.26.90.901 | [WazeFlockCamerasPatch.kt](../../patches/src/main/kotlin/patches/waze/WazeFlockCamerasPatch.kt) |
| Full black | On | 5.26.90.901 | [WazeBlackPatch.kt](../../patches/src/main/kotlin/patches/waze/WazeBlackPatch.kt) |
| Hide ads | On | 5.26.90.901 | [WazeExtrasPatches.kt](../../patches/src/main/kotlin/patches/waze/WazeExtrasPatches.kt) |
| Map skin | On | 5.26.90.901 | [WazeMapSkinPatch.kt](../../patches/src/main/kotlin/patches/waze/WazeMapSkinPatch.kt) |
| Navigation distances | Off | 5.26.90.901 | [WazeExtrasPatches.kt](../../patches/src/main/kotlin/patches/waze/WazeExtrasPatches.kt) |
| No AI reporting | Off | 5.26.90.901 | [WazeExtrasPatches.kt](../../patches/src/main/kotlin/patches/waze/WazeExtrasPatches.kt) |
| No Google Assistant | Off | 5.26.90.901 | [WazeExtrasPatches.kt](../../patches/src/main/kotlin/patches/waze/WazeExtrasPatches.kt) |
| Open without device location | Off | 5.26.90.901 | [WazeExtrasPatches.kt](../../patches/src/main/kotlin/patches/waze/WazeExtrasPatches.kt) |
| Remove permissions | On | 5.26.90.901 | [WazeRemovePermissionsPatch.kt](../../patches/src/main/kotlin/patches/waze/WazeRemovePermissionsPatch.kt) |
| Remove sign-in prompts | On | 5.26.90.901 | [WazeRemoveSignInPromptsPatch.kt](../../patches/src/main/kotlin/patches/waze/WazeRemoveSignInPromptsPatch.kt) |
| Remove telemetry | On | 5.26.90.901 | [WazeRemoveTelemetryPatch.kt](../../patches/src/main/kotlin/patches/waze/WazeRemoveTelemetryPatch.kt) |
| Report speed limit | Off | 5.26.90.901 | [WazeExtrasPatches.kt](../../patches/src/main/kotlin/patches/waze/WazeExtrasPatches.kt) |
| Share alerts with Maps | On | 5.26.90.901 | [WazeShareAlertsPatch.kt](../../patches/src/main/kotlin/patches/waze/WazeShareAlertsPatch.kt) |
| Skip consent screens | On | 5.26.90.901 | [WazeConsentScreensPatch.kt](../../patches/src/main/kotlin/patches/waze/WazeConsentScreensPatch.kt) |
| SoundCloud in Waze | On | Any | [SoundCloudSupportPatch.kt](../../patches/src/main/kotlin/patches/waze/SoundCloudSupportPatch.kt) |
| Speed camera alerts | On | 5.26.90.901 | [WazeSpeedCameraAlertsPatch.kt](../../patches/src/main/kotlin/patches/waze/WazeSpeedCameraAlertsPatch.kt) |
| Speed camera sound at any speed | On | 5.26.90.901 | [WazeExtrasPatches.kt](../../patches/src/main/kotlin/patches/waze/WazeExtrasPatches.kt) |
| Speed cameras everywhere | Off | 5.26.90.901 | [WazeExtrasPatches.kt](../../patches/src/main/kotlin/patches/waze/WazeExtrasPatches.kt) |
| Speed limit sign | Off | 5.26.90.901 | [WazeExtrasPatches.kt](../../patches/src/main/kotlin/patches/waze/WazeExtrasPatches.kt) |
| Stay awake in the background | Off | 5.26.90.901 | [WazeShareAlertsPatch.kt](../../patches/src/main/kotlin/patches/waze/WazeShareAlertsPatch.kt) |
| Support Gearslip | On | 5.26.90.901 | [WazeGearslipPatch.kt](../../patches/src/main/kotlin/patches/waze/WazeGearslipPatch.kt) |
| YT Music Morphe in Waze | On | Any | [YouTubeMusicMorphePatch.kt](../../patches/src/main/kotlin/patches/waze/YouTubeMusicMorphePatch.kt) |
| Auto zoom | Off | 5.26.90.901 | [WazeDrivingPatches.kt](../../patches/src/main/kotlin/patches/waze/WazeDrivingPatches.kt) |
| Lane guidance | Off | 5.26.90.901 | [WazeDrivingPatches.kt](../../patches/src/main/kotlin/patches/waze/WazeDrivingPatches.kt) |
| Extra map info | Off | 5.26.90.901 | [WazeDrivingPatches.kt](../../patches/src/main/kotlin/patches/waze/WazeDrivingPatches.kt) |
| Speed limit controls | Off | 5.26.90.901 | [WazeDrivingPatches.kt](../../patches/src/main/kotlin/patches/waze/WazeDrivingPatches.kt) |
| Car alerts as notifications | Off | 5.26.90.901 | [WazeDrivingPatches.kt](../../patches/src/main/kotlin/patches/waze/WazeDrivingPatches.kt) |
| Car traffic meter | Off | 5.26.90.901 | [WazeDrivingPatches.kt](../../patches/src/main/kotlin/patches/waze/WazeDrivingPatches.kt) |
| Native camera and hazard controls | Off | 5.26.90.901 | [WazeAlertControlsPatch.kt](../../patches/src/main/kotlin/patches/waze/WazeAlertControlsPatch.kt) |
| Speed bump controls | Off | 5.26.90.901 | [WazeAlertControlsPatch.kt](../../patches/src/main/kotlin/patches/waze/WazeAlertControlsPatch.kt) |
| Car reconnect grace period | Off | 5.26.90.901 | [WazeReconnectPatch.kt](../../patches/src/main/kotlin/patches/waze/WazeReconnectPatch.kt) |
| Hide recent destinations | Off | 5.26.90.901 | [WazeRecentsPatch.kt](../../patches/src/main/kotlin/patches/waze/WazeRecentsPatch.kt) |
| Allow high refresh rate | Off | 5.26.90.901 | [WazeRefreshRatePatch.kt](../../patches/src/main/kotlin/patches/waze/WazeRefreshRatePatch.kt) |

## Configuration

Imported patch options and defaults are preserved. The Customization row below Shut off opens switches for applied features and editable sizes, colors and distances. Speed camera alerts, Flock cameras and the average speed zone bar start off inside Waze even when their patches are selected. Change app name defaults to De-Waze. Share alerts with Maps retains the Ungoogled Maps broadcast protocol; a compatible receiver must be installed for Maps to display alerts.

The eleven optional controls are off by default in Manager. When selected, their switches start on in Customization. Auto zoom offers Off, On and By speed; limit-drop warning distance is editable from 0 to 20,000 m (patch default 1,000 m). Compass/toll prices and limit display/drop warnings have independent switches. The compass-only visibility hook also handles Waze's on-tap controls preference without changing other map buttons. Lane guidance retains Waze's user preference and needs road lane data. Toll prices require route price data. Car notification and traffic-meter presentation depends on the host. These controls add no car settings screen.

Native camera controls keep map/notification/sound gates enabled per selected type; crosswalk controls also keep their feature gates enabled. They require Waze data and leave OSM alert providers alone. Speed-bump map visibility and on-route suppression are separate. Reconnect delay is projection-only (2 minutes, editable 1–10); the phone timeout and Android Automotive keep-alive flag are untouched. Hide recent destinations redirects one read through a switchable bridge, preserving the original JNI method and stored history. Display ceiling is editable 60–120 Hz (90 default, 60 while off); restart Waze after display/reconnect changes.

The runtime reapplies chosen configuration values after server and preferences sync, using IDs read from this build’s ConfigValues initializer. Turning a feature off unlocks those values and restores Waze defaults. Full black changes APK night surfaces; its optional black map and the Map skin/Bigger alert pins settings change Waze’s writable asset copies. Restart Waze after map/pin changes.

## Version uplift

- Side menu: `com.waze.ui.n.ae`; row `com.waze.ab.a.a.h.b`; Function0 `g.h.a.a`; icon constructor includes the nullable Dp parameter; Shut off is `0x7f1207db`.
- Preferences sync: `PreferencesConfigNativeManagerBase.onPreferencesConfigSyncedJNI()` is hooked before it posts `PreferencesConfigNativeManager.b()` to the main looper. Both sync hooks dispatch configuration writes through `NativeManager.Post`.
- Alerts: `updateAlertersRepositoryJNI` dispatches `AlerterNativeManager.b(NativeAlertRepositoryUpdate)`.
- Average-speed zone: update `NavigationInfoNativeManager.i(proto)` and clear `h()`; insights `InsightsInfraNativeManager.c(proto)`.
- Mood eligibility: `MoodManager.v(Context, String)`; metrics dispatcher `MetricsReporterNativeManager.a(k.b.c)`.
- This is a beta build: launcher and Android Auto labels reference `app_name_beta`. The rename patch creates a new base-only string so language splits cannot shadow the chosen name.

## Validation

Run the project Android build, then:

```sh
python3 scripts/validate_waze.py ORIGINAL.apkm patches/build/libs/patches-VERSION.mpp morphe-desktop-all.jar --output /tmp/waze-validation
```

The validator requires all 40 patches to pass together and individually, with fingerprint uniqueness validation and no forced compatibility. It rejects partial patch runs even if the CLI reports overall success. Reports/logs remain in the output directory. It does not install apps.

See the [privacy audit and follow-up](privacy-audit.md) and [validation evidence](validation.md) for tested behavior and limits. Patch application and synthetic tests do not establish live road alerts, routing, Android Auto behavior, signed-in media playback, or companion Maps delivery. Report speed limit retains upstream’s unverified status.

## Source and license

Catalog patches and `org.ungoogled.waze` runtime classes derive from [bearinmindcat/morphe-patches](https://github.com/bearinmindcat/morphe-patches), locally supplied as deWaze. [upstream.json](upstream.json) records the exact commit and hashes of all imported source files. They retain their package namespace and are distributed under the repository’s GPLv3 license and applicable notice. The eleven optional controls adapt feature selections/configuration keys from [Forsigh/waze-patches](https://github.com/Forsigh/waze-patches), source commit `9cf1b4b`, using this project's native configuration and Customization helpers. See NOTICE for attribution. The existing audio integration remains in `app.wazeytm.extension.waze`.

[Navigation broadcast contract and Gearslip support](navigation-broadcasts.md).
