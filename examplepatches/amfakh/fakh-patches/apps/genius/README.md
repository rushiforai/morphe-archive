# Genius

Patches for **Genius** (`com.genius.android`), version `8.2.3.5414`, as an APK from APKMirror.

## Patches

Every patch except **GmsCore support** is on by default. Morphe Manager groups them by category.

| Category | Patch | Default | What it does |
|---|---|---|---|
| Ads | Hide ads | On | Removes the sticky banner, inline feed and search ads, video pre-roll ads, and disables ad SDKs. |
| Feature | Fix Spotify login | On | Makes Spotify login work in the patched app by signing in on Spotify's web page instead of the Spotify app. |
| Feature | GmsCore support | Off | Makes "Sign in with Google" work through [microG RE](https://github.com/WSTxda/MicroG-RE) (GmsCore) instead of Google Play services. |
| Privacy | Disable analytics | On | Turns off analytics and tracking (Firebase, Mixpanel, comScore, MediaLab Analytics, and Facebook). |
| Theme | Themed icon | On | Adds the themed (monochrome) app icon of Android 13 and later, which follows the wallpaper colors. |

## How the patches work

**Hide ads** disables the pre-`Application.onCreate` ad providers and `androidx.startup` ad initializers, collapses the sticky and inline ad containers (`layout_main_sticky_ad_container` and `item_ad_view.xml`), stubs MediaLab Ads initialization and banner lifecycle methods, and forces `AdRequestFactory.isAdvertisingEnabled` to return false.

**Fix Spotify login** intercepts `SpotifyAuthHandler.start` and opens Spotify's authorize page in a `WebView` dialog, then delivers the `genius://callback` redirect back to `LoginActivity` so Spotify's native app signature check is bypassed.

**GmsCore support** redirects the app's Google Play services calls to microG RE (`app.revanced.android.gms`) and declares Genius's original signing certificate SHA-1. A toast tells the user to install microG RE when "Sign in with Google" is tapped without it.

**Disable analytics** uses Firebase's manifest switches, disables `TransportBackendDiscovery`, turns off Facebook App Events and advertiser ID collection, and stubs `com.comscore.Analytics.start`, `MediaLabAnalytics`, `MixpanelAPI`, `FirebaseAnalytics.logEvent`, and `ErrorReporter.send`.

## Build

See the [repo README](../../README.md).
