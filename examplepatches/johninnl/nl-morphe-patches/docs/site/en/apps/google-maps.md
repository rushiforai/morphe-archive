# Google Maps

**App version:** 26.43.05.1002020710 · **Build:** 1068844719 · **Original file:** APK

[Use your original APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the complete original APK for this exact version in Morphe Manager. Android 10 or newer is required.

These 30 Maps patches come from [bearinmind patches](https://github.com/bearinmindcat/morphe-patches) by bearinmindcat, adapted here for this Maps version. This project extends **Waze alerts** with Flitsmeister and the navigation data already supported in Vela Maps.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **120 refresh rate** | On | Lets Maps use the screen’s supported refresh rate. Enable it in Customization; it can use more battery. |
| **Account sheet cleanup** | On | Removes the extra account-menu heading and keeps the menu open when returning from Settings or Customization. |
| **Add microG-RE support** | Off | Builds a separate microG Maps app with Google sign-in through microG-RE or ReVanced GmsCore. |
| **Add original microG support** | Off | Uses original microG for Google sign-in on a ROM with signature spoofing; keeps the stock package name. |
| **Any media app** | On | Adds compatible Android Auto music and podcast apps to Navigation’s Default media app choices. |
| **Avoid Flock cameras** | On | Offers driving detours around mapped Flock cameras using BRouter. Starts off; routes with stops are unchanged. |
| **Better offline maps** | On | Adds a resizable offline-area picker, splits large areas into downloads and shows downloaded coverage. |
| **Black theme** | On | Uses black surfaces in dark mode, including navigation. |
| **Blue pin** | On | Uses a flat blue pin for Maps product logos and the search icon. |
| **Bypass Play Services checks** | On | Lets the patched app run with unavailable or disabled Play services and preserves map, search and routing access. |
| **Change app name** | On | Sets the launcher and app-switcher name; the default is Ungoogled Maps. |
| **Change package name** | On | Installs alongside stock Maps under a separate package name. |
| **Customization screen** | On | Adds Customization to the account menu for the available in-app patch switches. |
| **Flock cameras** | On | Shows mapped number-plate reader cameras with approach notes and chimes. Starts off; uses OpenStreetMap data. |
| **Follow playing media** | Off | Shows media from apps that do not connect directly to Maps. Requires notification access. |
| **Hide ads and clutter** | On | Hides promoted pins, sponsored results, AI summaries, place-sheet business rows and the Explore feed and bottom tabs. |
| **Legacy icon** | On | Restores the flat multicolour Maps pin used before the gradient icon. |
| **Location provider toggle** | On | Adds a choice of Android, Google Play services or microG-RE location, with network-location fallback. |
| **Offline saved places** | On | Saves local places and lists, imports and exports backups, and adds an optional local Timeline recorder. |
| **Power saving mode** | On | Adds a black navigation screen and settings for its button, idle activation, speedometer and frame rate. |
| **Proxy** | On | Adds an HTTP proxy setting for Maps traffic; map loading stops if the configured proxy is unavailable. |
| **Rectangle shapes** | On | Squares off rounded interface corners and navigation buttons. |
| **Remove permissions** | On | Removes selected account, advertising and sensor permissions, including microphone and camera. Voice search, Lens and Live View stop working. |
| **Remove sign-in prompts** | On | Hides first-launch, search and account-menu sign-in reminders. |
| **Remove telemetry** | On | Reduces advertising pings, usage measurement, performance monitoring, surveys and background learning services. |
| **Speed cameras** | On | Shows OpenStreetMap speed and red-light cameras with approach notes and chimes. Starts off. |
| **Speeding chime** | On | Adds a chime when speed exceeds the known road limit; configure the threshold in the external-data settings. |
| **Trim account menu** | On | Removes Timeline, Location sharing, Your data in Maps and Help & feedback from the account menu. |
| **Waze alerts** | On | Adds Waze and Flitsmeister as local sources for road-alert pins, approach chimes, speed, limits and observed average-speed zones. Starts off. |
| **Zoom controls in navigation** | On | Adds zoom-in, zoom-out and reset buttons while the navigation camera keeps following. |

## Advertising and tracking services

**Remove telemetry** and **Hide ads and clutter** reduce the listed advertising and measurement features. Maps still uses Google’s services for maps, search, routes and any enabled account features. The selected Waze or Flitsmeister provider continues using its own services.

External navigation data is received locally from the selected app on the same phone. OpenStreetMap camera layers download nearby camera positions. **Avoid Flock cameras** sends the route’s start and end to `brouter.de` when enabled. These controls start off in the external-data settings.

## Before using

Keep **Change package name** selected to install beside stock Maps; the default package is `org.ungoogled.android.apps.maps`. **Change app name** uses **Ungoogled Maps** by default. With **Add microG-RE support**, the defaults become `org.ungoogled.android.apps.maps.microg` and **microG Maps**. The two microG support patches are alternatives: choose only the one matching your setup. Original microG needs a ROM with signature spoofing and keeps the stock Maps package.

Open the account menu’s **Customization** and **Waze & external data source** rows to configure the selected patches. A patch marked **On** above is selected by default when patching; camera layers and external sources still require enabling in the app. **120 refresh rate** also starts off in Customization.

For extended data, patch [Waze 5.26.90.901](waze.md) or [Flitsmeister 14.17](flitsmeister.md) with **Broadcast navigation data**, open the provider once and allow its background driving/location service to run. Its overlay can stay off. In Maps’ external-data settings, open **Navigation data source** and choose **De-Waze · navigation data** or **Flitsmeister · navigation data**. **Off · Google Maps** restores Maps’ own data. If using the provider patch’s optional **Receiver package**, enter the package name of your patched Maps installation. Android 14 and newer can verify the sender through Android; older versions lack that sender verification.

Choose **Waze · Share alerts with Maps** for the original alert-sharing mode, using Waze patched with **Share alerts with Maps**, signed in and running. Extended navigation data adds current speed, road limits, available road reports and average-speed-zone observations. Coverage depends on what the provider observes; an average covers only the observed part of the zone. It must not be read as the official average for the whole controlled section.

Enable **Compact speed and average-speed control** to show current speed beside a speed-limit sign and, during an observed zone, the partial average, progress and remaining distance. **Road alert types** controls which reports can produce pins and approach warnings; only police reports start selected. Pins and approach chimes have separate switches. Approach distances use the provider’s available distance or an explicitly estimated distance from position and heading; they are not proof that a report is on your chosen route.

Selecting a provider does not create missing road data. Stale or missing external values fall back to fresh Maps values where available; unknown values remain unknown. A provider change, zone exit or expired observation clears its partial average. While a modern external feed supplies usable fresh data, Maps’ own Flock pins and chimes pause to avoid duplicate alerts; your saved Flock settings remain intact. Flock route avoidance keeps its own camera data because external reports do not provide a route-search dataset.

**Remove permissions** disables voice search, Lens and Live View through its microphone/camera changes. The microG-RE account build leaves account-related permissions and services in place. **Proxy** needs a supported network engine; follow its in-app availability message. **Follow playing media** needs notification access and is not intended for root mount installs. YouTube Music and Spotify’s direct media integration still depends on Google’s own Maps; use the available notification-based option where supported.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
