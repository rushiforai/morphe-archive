# Radio Indonesia

Patches for **Radio Indonesia** (`com.appmind.radios.id`, "Radio Streaming Indonesia" on APKPure),
version `4.2.30`, as an XAPK.

## Patches

All of them are enabled by default. Morphe Manager groups them by category.

| Category | Patch | What it does |
|---|---|---|
| Feature | Faster startup | Stops the splash screen from waiting up to 5 seconds on the Firebase Remote Config fetch, which happens about once a day or whenever the network is slow. The fetch still finishes in the background. |
| Feature | Song info in media notification | Shows the song title and its album art in the media notification and the system media player (lock screen, quick settings, Samsung Now Bar), instead of the station name with no picture. The station moves to the album line. |
| Premium | Premium unlock | Unlocks the lifetime premium client-side: no visual ads, and the music equalizer (EQ button in the mini player). Also keeps every ad network from starting at all, so none of them runs in the background. |
| Privacy | Disable data collection SDKs | Stops the SDKs that collect location, Wi-Fi and mobile network data to sell or share with third parties. |
| Privacy | Disable analytics | Turns off Firebase Analytics, Crashlytics, Performance and Sessions, and the Facebook SDK. |
| Theme | Material You | Colors the app from your wallpaper (Android 12+) in light and dark mode, with rounder cards and wider spacing. Adds a floating now playing bar, a Material 3 bottom bar, and a redesigned full player with scrolling titles and the station logo as artwork when a song has none. |

The media notification patch adds a small extension class to the app. It downloads the artwork
the station already publishes for the current song, scales it down and hands it to the media
session, because Android's media player does not download web images by itself. Until the song's
artwork arrives, or when a station has none, the card shows the station logo. Failed downloads
are retried after 30 seconds.

Material You also ships extension code: the scrolling song and station titles and the redesigned
player views. They only draw what the app already has on screen and make no network calls.

## What the app ships with, in plain terms

The consent dialog on first launch says the app collects "Wi-Fi SSID/BSSID, precise location and
Bluetooth scan records" and shares them "with third parties for the purposes of market research,
traffic research, ad personalization and location-based analytics". That is the business model
behind the free app, and it is spread across three groups of SDKs.

### Data collection SDKs (location and network data brokers)

These run quietly in the background, often in their own process, and keep running after you
close the app. Several of them restart themselves when the phone boots. What they collect is
worth money because it shows where people are, which networks they use and how good the signal
is there. Mobile carriers, city planners, retailers and advertisers buy that data.

| SDK | What it is | What it does on your phone |
|---|---|---|
| **Weplan** (Cumberland) | Network quality and coverage measurement | Records your location, the cell tower and Wi-Fi you are connected to and signal strength, then uploads it. Its code can also read which apps you use, but only with the usage access permission, which this app does not ask for. Has a boot receiver, a heartbeat job and its own location provider. |
| **Wavebrook** | An aggregator that bundles several of the SDKs below under one switch | Starts its partner SDKs and passes them your consent status. The app's "Monedata" wrapper drives it. |
| ↳ CellRebel | Crowdsourced mobile network performance | Runs small speed and latency tests and reports them with your location. |
| ↳ M2Catalyst | Mobile network and device data | Has separate receivers for location and Wi-Fi collection, and exports its own database. |
| ↳ Umlaut / P3 Crowd (InsightCore) | Crowdsourced network benchmarking | Measures connectivity in the background (jobs for connectivity and background tests). |
| ↳ Teragence | Mobile network intelligence | Collects signal and network data for operators. |
| ↳ Rootlake | Data partner of Wavebrook | Starts itself from its own init provider. What it collects is not visible from the app code. |
| ↳ ipinfo | IP address intelligence | Looks up what your IP address says about your location and network. |
| **Speedchecker** | Network speed testing | Runs passive measurements in the background, uses geofences (it wakes up when you move into an area) and restarts on boot. |
| **LowLagLabs** | Network signal measurement | Collects signal data in the background, with boot, alarm and scheduled-job receivers. |
| **GeoTruth** | Location data | Collects and verifies location data. |

**How the patch stops them:** the app already has its own off switches for these SDKs. Two are
lists of phone manufacturers on which the developer chose not to run tracking, and two are remote
config flags the developer can flip from their server. The patch forces every switch to "off", so
the app itself calls each SDK's own stop or disable function: `WeplanSdk.disable()`,
`Wavebrook.stop()`, Speedchecker's component disabling and the LowLagLabs and GeoTruth stop paths.

### Analytics

These report what you do inside the app back to the developer (and, for Facebook, to Meta).

| SDK | What it does | How the patch stops it |
|---|---|---|
| **Firebase Analytics** (Google) | Logs how you use the app, such as which tab you played your first station from, whether you tapped a suggested-station notification and how sessions go, tied to an app instance id and your advertising id. | `firebase_analytics_collection_deactivated` in the manifest, so every logging call does nothing. |
| **Firebase Crashlytics** | Sends crash reports with your phone model and app state. Fairly harmless, but it still phones home. | Collection is off in the manifest, and the call the app uses to force it back on does nothing. |
| **Firebase Performance** | Measures how fast screens and network calls are, and uploads the timings. | `firebase_performance_collection_deactivated`. The app turns Performance on at runtime, but Firebase cannot override this flag. |
| **Firebase Sessions** | Tracks app sessions for Crashlytics and Performance. | `firebase_sessions_enabled=false`. |
| **Facebook SDK** (Meta) | Logs app events to Meta: added a favorite, switched through four stations, ad impressions with revenue. The app also turns automatic event logging and advertising id collection back on at startup, over its own manifest settings. | The app's own "is Facebook configured" check returns false, so the SDK never starts and no event is sent. Its auto-start provider is disabled too. |
| Adjust, UXCam, MyTraffic, InsightCore wrapper | Install attribution and session recording. | Nothing to do: in this build the app ships them as empty stubs. |

### Ad SDKs

Even with premium, the app starts every ad network when the main screen opens. It just never
shows their ads. An ad SDK that is running still fingerprints the device, reads the advertising
id and talks to its servers. The app bundles a lot of them:

Google AdMob / Ad Manager, AppLovin, Unity Ads, IronSource LevelPlay, Liftoff (Vungle),
Mintegral, Pangle (ByteDance / TikTok), InMobi, Moloco, PubMatic (OpenWrap), Smaato, MobileFuse,
Bigo Ads, Tappx, Amazon Publisher Services, BidMachine, Verve (HyBid / PubNative), Digital
Turbine (DT Exchange / Fyber), Meta Audience Network, Magnite and CloudX.

On top of those there is **AppHarbr**, an ad quality service that inspects the ads being shown
and reports on them.

**How Premium unlock stops them:** the ad manager's setup step, which initializes every network,
is skipped, and so is the AppHarbr start. Ten of these SDKs also start themselves from a content
provider before the app's own code runs; the patch disables those providers in the manifest, and
removes Unity's entry from `androidx.startup`. This only works together with the unlock itself:
premium hides every ad slot, so nothing in the UI looks for these SDKs afterwards.

### What is left on purpose

| Component | Why it stays |
|---|---|
| Firebase Remote Config | The app reads its feature settings from it. |
| Firebase Cloud Messaging | Push notifications. |
| Firebase In-App Messaging | Shows in-app campaigns. It relies on Analytics events, which are now off. |
| Google Cast | Casting to speakers and TVs. |
| The first-launch consent dialog | It still shows once, but there is nothing left behind it to consent to. |

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-1.19.1-all.jar patch -p patches/build/libs/patches-<version>.mpp -o radio-patched.apk Radio+Streaming+Indonesia_4.2.30_APKPure.xapk
```

## Getting the APK

Morphe Manager looks the app up through its own API, which only knows APKMirror and Uptodown
pages. It has none for this app and falls back to a web search. Download the XAPK from APKPure by
hand.
