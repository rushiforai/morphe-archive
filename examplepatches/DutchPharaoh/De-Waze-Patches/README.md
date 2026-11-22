# De-Waze Patches

A collection of Morphe patches that add features to Waze.

## Patches

- **Favorites on map**: always shows your favorites as stars with their name on the map,
  on the phone and in Android Auto, also when you are not navigating.
  Home and work are left out, because Waze already shows those.
- **Alerts bar in Android Auto** (experimental): a vertical bar on the right of the Android Auto
  map with the reports on your route in the next 10 km (speed cameras, police, accidents, jams,
  hazards, closures). Your car is at the bottom; the higher an icon, the farther away it is, with
  the distance to its left (in steps of 100 m).
  In a section control zone (trajectcontrole) a pill above the speedometer shows the speed limit,
  your average speed so far (green, orange or red) and the distance left.
  The bar's position is tuned for one car screen so far.

Supported version: Waze 5.27.4.900. The patches rely on obfuscated Waze internals,
so every new Waze version needs a check before it is added.

## Use in Morphe Manager

Add `https://github.com/DutchPharaoh/De-Waze-Patches` as a patch source in Morphe Manager, next to your other sources,
and select the patches you want when patching Waze.

<!-- PATCHES_START EXPANDED -->
> **[v1.3.1](https://github.com/DutchPharaoh/De-Waze-Patches/releases/tag/v1.3.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Waze&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.waze`

**🎯 Supported versions:**

| 5.27.4.900 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Alerts bar in Android Auto](#alerts-bar-in-android-auto) | Shows a vertical bar on the right of the Android Auto map with the reports on your route in the next 10 km: speed cameras, police, accidents, jams, hazards and closures. In a section control zone it also shows your average speed, the speed limit and the distance left. |  |
| [Favorites on map](#favorites-on-map) | Always shows your favorites as stars with their name on the map, on the phone and in Android Auto, also when not navigating. |  |

</details>

<!-- PATCHES_END -->

## Development

Building needs a GitHub token with `read:packages` in `~/.gradle/gradle.properties`
(`gpr.user` and `gpr.key`). Then run:

```
./gradlew build
```

### Layout

- `patches/src/main/kotlin/app/dewaze/patches/<feature>/`: one folder per patch
  (the patch itself plus its fingerprints).
- `patches/src/main/kotlin/app/dewaze/patches/shared/`: code shared by all patches,
  such as the supported Waze versions.
- `extensions/extension/src/main/java/app/dewaze/extension/`: the Java code the patches call at runtime.

To add a patch, create a new folder under `patches/.../patches/` and, if it needs runtime logic,
a matching class in the extension.

### Favorites on map

The patch adds three small hooks; all logic lives in
`extensions/extension/src/main/java/app/dewaze/extension/FavoritesOnMapPatch.java`.
If the stars do not show, check `adb logcat -s WazeFavoritesOnMap`.

### Alerts bar in Android Auto

Waze's map engine renders and swaps the car map natively, so the bar cannot be drawn into its frames.
Instead the patch hooks Waze's Android Auto `SurfaceCallback` and hands Waze an intermediate surface;
the extension copies each map frame onto the real car surface with the bar on top (one extra GPU copy
per frame; touch input is unaffected). The bar is only shown while navigating, because without a route
Waze puts extra buttons where the bar would go. Its size is in dp, and it follows the right edge of
the visible area that Android Auto reports, so it stays in the button column in split screen too. The reports come from `RtAlertsNativeManager.getRtAlertsOnRoute()`, polled every
2 seconds while the car map is visible; speed cameras (types 1000 and up) are included too.
Code: `RouteAlertsBarPatch.java` (hooks, data and painting) and `BarGl.java` (compositor and layout).
The average speed pill (`AverageSpeedZone.java`) uses Waze's zone callbacks
(`NavigationInfoNativeManagerBase.onAverageSpeedCamZone*JNI` and the segment insights) for the distance
left; Waze does not report the average, so it is the distance driven since the zone started divided by
the time. The speed limit comes from Waze's speedometer state. The compositor draws the pill too.
To simulate a zone: `adb shell setprop log.tag.DeWazeAlertsBar DEBUG`, restart Waze, then
`adb shell am broadcast -a app.dewaze.ZONE_TEST -p com.waze --ei left 5000 --ei limit 100`
(send a lower `left` a few seconds later; `--ez clear true` ends it).
Test without a car with the Android Auto Desktop Head Unit (DHU) from the Android SDK.
Logs: `adb logcat -s DeWazeAlertsBar`.

This project is based on the Morphe patches template; see [NOTICE](NOTICE) and [LICENSE](LICENSE).
