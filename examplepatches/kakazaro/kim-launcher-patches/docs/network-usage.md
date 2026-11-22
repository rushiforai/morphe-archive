# Network usage (1.0.2781)

Every endpoint found in the shipped code, grouped by feature. Static analysis only: these are
the URLs in the code, not observed traffic.

## Native side (dex): Morphe can block these

All internet REST in the app's own code uses `java.net.URL.openConnection()`: 38 call sites
in 16 classes (`K1/*`, `M1/h`, `N1/I`, `G6/l`, `b0.1/q`). No OkHttp or raw internet
sockets are used in app code.

| Feature | Endpoint | Class | Effect of blocking |
|---|---|---|---|
| **Cloud sync / Kim PWA tracker** (Firebase project `byd-car-tracker`): live location, trip summaries, charging and refuel sessions, event recordings, Sentry parking previews, remote commands | `byd-car-tracker-default-rtdb.asia-southeast1.firebasedatabase.app/vehicles/…` | `K1/sd`, `K1/D0`, `K1/I0`, `K1/Y3`, `K1/a1`, `K1/Da`, `K1/de` | No phone/PWA remote view, remote control or Proximity smart key relay |
| Device identity (anonymous Firebase auth) | `identitytoolkit.googleapis.com/v1/accounts:signUp`, `securetoken.googleapis.com/v1/token` | `K1/sd` | Pairing stays "pending" |
| Usage telemetry | `…cloudfunctions.net/launcherMonthlyActivity`, `launcherClaimWriterRepair` | `K1/sd` | None visible |
| Map eligibility | `…cloudfunctions.net/launcherMapboxEligibility` | `K1/sd` | Kim Map (Mapbox) may report it is unavailable |
| Subscription status | `vehicles/<id>/entitlement.json` | `K1/sd` | PRO/Trial status cannot refresh; paid features lapse when the cached status or grace period runs out. This project does not change that. |
| **Diagnostics to Telegram**: log and crash bundles, including an *automatic* trigger | `api.telegram.org/bot<token>/sendDocument` (hard-coded bot token and group chat ID, redacted here) | `K1/jc` | None for the user; stops logs leaving the car |
| In-app updates | `…cloudfunctions.net/otaAndroidLatest` | `K1/uc` | Check, popup, download and install all disabled by **Settings-only in-app updates** |
| Package Installer helper link | `kim.storageclbsync.cc/android/PackageInstaller.apk` | `K1/r` (also in Dart) | Opens a browser link only |
| Voice packs | `kim.storageclbsync.cc/voice-packs/catalog.json` plus pack downloads | `N1/I` | Installed packs keep working; no new downloads |
| Weather widget | `api.weatherapi.com/v1/forecast.json` (hard-coded key) | `M1/h` | No weather |
| News widget / Kim AI answers | `news.google.com/rss…` | `M1/h` | No news |
| Crypto, FX and gold widgets / Kim AI answers | `api.coingecko.com`, `api.frankfurter.dev`, `api.gold-api.com` | `M1/h` | No prices |
| Connectivity probe | `clients3.google.com/generate_204` | `K1/U3` | App considers itself offline |

## Subscription status while offline

Native check `K1/md.c(entitlement)` (1.0.2781) rejects the cached status when any of these hold:

1. plan is not `trial` or `paid`, or status is not `active`
2. `expiresAt` is in the past (the subscription period itself)
3. `fetchedAt` is more than **7 days** old (`0x240c8400` ms): "Entitlement cache expired"

So a paid plan keeps working offline for up to 7 days after the last successful sync. One
successful sync (any network, e.g. a phone hotspot) resets the 7 days. The Dart side also has
an "offline grace" (`entitlementGrace`, `remoteGrace`); its length is in `libapp.so` and wasn't
read.

An offline-mode patch must therefore **not** block the entitlement sync (Firebase auth
`identitytoolkit`/`securetoken` and `vehicles/<id>/entitlement*.json`). Blocking it would stop the
status from refreshing even when the car does get a signal, and the features would lock after
7 days. This project does not change the check itself.

## Mapbox SDK (Kim Map, navigation)

Mapbox makes its own native HTTP requests (tiles, search, directions, `events.mapbox.com`
telemetry), outside `URL.openConnection`. The SDK has an official switch,
`com.mapbox.common.OfflineSwitch.getInstance().setMapboxStackConnected(false)` (present in the
dex). With it off, only already-cached or downloaded tiles render, and online routing and search
stop.

## Dart side (`libapp.so`): Morphe cannot block these

| Feature | Endpoint |
|---|---|
| Kim search / AI search | `botbtc.online/kim-search` |
| Nearby POIs and speed limits | Overpass API (`overpass-api.de`, `overpass.kumi.systems`, `overpass.private.coffee`) |
| Charger lookup | OpenChargeMap (skipped when no API key: "Nearby V2 provider=openchargemap skipped reason=api_key_missing") |
| Package Installer link | `kim.storageclbsync.cc/android/PackageInstaller.apk` |

Dart's `HttpClient` doesn't go through Java, so the only way to block these is outside the
app: a firewall or DNS block for the hosts above, or no SIM/Wi-Fi.

## Local-only networking (keep)

These must keep working; they're why the `INTERNET` permission cannot simply be removed:

- ADB self-connection: `127.0.0.1:5555` and `_adb-tls-connect._tcp` (`K1/Y8`, `K1/q`, `K1/C`),
  used to grant the app's privileged permissions
- Local servers for the daemons and PWA event feed (`byd/KimBydDilink5ExtendedDaemon`,
  `K1/n1`, port `47888`)
- Wi-Fi dashcams (70mai and others) at `192.168.x.1` (`K1/U3`)
- `https://kim-ic.invalid/`: an in-app WebView address, never resolved
- Deep links handed to other apps (Google Maps, Waze) do no networking inside Kim

## Which internet features need the paid plan

From the code (1.0.2781). "Checked" means the code tests the same active-plan test described in
[entitlement-check.md](entitlement-check.md) before doing the work.

| Feature (needs internet) | Plan needed? | Evidence |
|---|---|---|
| Kim AI, "Hi Kim", proactive AI; its live answers (prices, news, weather) | **Yes, checked** | `AI_ENTITLEMENT_REQUIRED` in 8 AI channel handlers (`A0/g`, `L1/i`); "Kim AI requires an active Trial or Paid plan" |
| Phone/PWA remote controls (`/remoteControl/request`) | **Yes, checked** | `K1/Da.u` |
| Destination sent from the phone (`/navigation/request.json`) | **Yes, checked** | `K1/I0` |
| Remote polling, remote GPS, trip / charge / refuel / Sentry preview uploads | **Yes, checked** | `K1/de.i` ("remote features locked"), `K1/n1`, `K1/z3`, `K1/D0`, `K1/a1`, `K1/sd.S`; "Trip and remote GPS features require Trial or Paid" |
| Smart Key (Bluetooth; internet only to pair) | **Yes, checked** | `K1/Da.b`; "Smart Key requires active Kim Pro entitlement" |
| In-app updates | **Yes, checked** | `K1/uc.g`: "Updates require active Trial or paid PRO" |
| Kim Map online (Mapbox tiles, search, routing) | No plan check found | Mapbox classes have none. A server-side `launcherMapboxEligibility` call and a Dart quota guard exist; what they depend on is *unknown* |
| Voice pack catalogue and downloads | No plan check found | `N1/I` callers have none |
| Nearby places, speed limits, charger lookup (Overpass, OpenChargeMap) | No plan check found | Dart services mention no entitlement; `main.dart` could still gate the call, *unknown* |
| Dashboard weather widgets | *Unknown* | Weather fetcher `M1/h.l` has no caller I could find; widgets may use another source |
| Google Maps / Waze buttons | No | Opens the other app |

Plan-gated features that do **not** need the internet (listed so they aren't confused with the above):
Widget Studio editing, all Sentry settings, Smart Event Recording (and its sensitivity / camera mode),
Trip history, Automation, Key Mapping, Background Runtime and IC cast. The Dart side blocks the Sentry,
Smart Event and Trip history ones with a "paid feature" notice (13 call sites in `main.dart`).
