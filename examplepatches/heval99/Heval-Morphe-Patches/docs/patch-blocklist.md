# Do not revisit: apps that cannot be patched

A record of apps we tried and why they failed, so nobody spends time on them again.
Keep entries short; link the blocker, not the story.

## Hard blockers — anti-tamper / PairIP

| App | Package | Why |
|---|---|---|
| Swift Backup | `org.swiftapps.swiftbackup` | Developer deliberately blocks patched builds: the app crashes or uninstalls itself on patches, Xposed hooks, or spoofed Play purchase data, partly via a Firebase-backed check (<https://www.swiftapps.org/issues#piracy>). Our premium patch was removed in v1.3.2. A community bundle (byehi98) ships a "Tamper Protection" bypass; deliberately not ported. |
| HabitNow | `com.habitnow` | PairIP license client (`com.pairip.licensecheck`) plus server-side purchase validation (`ProductivityNowApi`, `PurchaseApi`). |
| Musicolet | `in.krosbits.musicolet` | PairIP protection. |
| Fishbrain | `com.fishbrain.app` | PairIP plus RevenueCat server-side entitlements. |
| KWGT / KLWP | `org.kustom.widget` / `org.kustom.wallpaper` | PairIP protection. |
| FC Pro 2 | `com.undergroundcreative.footballchairmanpro2` | Commercial app shield, verified 2026-09-19 on v1.2.2. All game logic sits in encrypted web assets: `www/js/min-122.js` and the language bundle are high-entropy blobs decrypted on the fly by a native `loader` library that the shield extracts from UUID-named files under `assets/j1O1pP4cpnaLPxs2xoSf/` (no `lib/` entries in the APK). String constants are natively encrypted (`m04sL2.r1L574`), and the loader kills the process if it cannot load (`Process.killProcess` in `yzROc7.kgeTd0.bYtcD4.ujE4X5`). A re-signed build fails the native integrity checks before any dex patch runs, and the live-update mechanism can replace local code. Unpacking the shield is a research project, not a Morphe patch. |

## Server-side entitlement — a client patch cannot unlock

| App | Package | Why |
|---|---|---|
| Flashscore (premium) | `eu.livesport.FlashScore_com` | No Play Billing client at all. The app carries an `ENTITLEMENT_TOKEN` validated server-side (`/api/v2/android/validate_subscription_v2`); premium content comes from their API. The "Disable ads" patch is the only meaningful one and ships. |
| Carrot Weather | `com.grailr.carrotweather` | Subscription validated by `verifySubscriptionWithGoogle` before entitlements apply. |
| EasyExpense | `com.easyexpense` | React Native + Hermes bytecode; RevenueCat with trusted entitlements. Research-grade, not worth it. |
| TOD TV | `com.todtv.tod` | Irdeto OTT DRM + Widevine and IP-based region locking; React Native + Hermes. Content decrypts only when the server issues a license; nothing client-side to flip. |

## Nothing to patch

| App | Package | Why |
|---|---|---|
| ZArchiver | `ru.zdevs.zarchiver` | 1.0.10 has no ad SDK and no billing/pro path in the dex. |
| Retro Music | `code.name.monkey.retromusic` | FOSS: no ads, no paid tier. |

## Parked — possible but needs an app-specific deep dive

| App | Package | Why parked |
|---|---|---|
| BlackPlayer Free | `com.kodarkooperativet.blackplayerfree` | Uses the old AdMob dynamite/WebView generation: the dex only has identifier/mediation stubs and ad-unit strings, no core GMA classes to hook. |
| Action Launcher | `com.actionlauncher.playstore` | Fully obfuscated; IAP state did not surface with method-name scans. |
| FX Explorer | `nextapp.fx` | Plus state is hidden behind its plugin registry. |
| Cronometer | `com.cronometer.android` | APKMirror keeps returning Cloudflare 403 for our IP; likely RevenueCat/server-side anyway. |
| RadarScope | `com.basevelocity.radarscope` | Paid app, not published on APKMirror — cannot obtain a base APK from our source. |
| BeSoccer | `com.besoccer` | APKMirror slug lookup failed; package ID may be wrong. |

## Already covered by community bundles — do not duplicate

These are patchable by other Morphe bundles (checked against the 777-package aggregate of
morphe-patches.software, September 2026):

- SD Maid SE (`eu.darken.sdmse`) — Doom's patches, Paresh patches
- Poweramp — Hooman's patches
- Solid Explorer — Xtra patches, Hoodles patches
- Podcast Addict, Windy — Hoodles patches
- Hermit — Lain patches
- Calimoto, Windy — Doom's patches
- Nova Launcher, Sleep as Android — Doom's / Hoodles / Morning Entree patches
- MiXplorer — FTL patches

## Known fingerprint drift (re-anchor later, app stays supported)

| App | Last good | Failing on |
|---|---|---|
| LibrePods | 1.0.0-rc1-play-63 | no store mirror carries the pinned Play build; GitHub ships FOSS builds only |

Re-anchored and bytecode-verified on 2026-09-18 (removed from this table):
- FotMob 237.17536.20260911 (storage-agnostic getter search)
- Brave Origin 1.95.104 (the subscription writer swapped its parameter order)
- MyFitnessPal 26.37.0 (premium moved to queryenvoy enum parsers)
- BoxBox 5.4.9 (telemetry and interstitial overloads now patched by class scan)

## Package-name traps (avoid downloading the wrong app)

- Flashscore is `eu.livesport.FlashScore_com`, **not** `com.flashscore`.
- OneFootball is `de.motain.iliga`, **not** `com.onefootball`.
- SD Maid SE is `eu.darken.sdmse`, **not** `eu.thedarken.sdm.se`.
- The FotMob Wear OS build shares `com.mobilefootie.wc2010`; its versions end in `w`
  (e.g. `236.253021660w.20260827`). Check `android.hardware.type.watch` on any download.

## Patch limitations worth remembering

- **FairEmail + Gmail OAuth**: tokens come from `AccountManager`, and Google only issues them
  to packages signed with the OAuth client's registered certificates. A re-signed patched build
  cannot get them — use an app password for Gmail accounts. The pro patch itself works.
- **Flashscore premium**: server-side entitlement (see above).
