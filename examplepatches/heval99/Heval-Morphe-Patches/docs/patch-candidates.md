# Patch candidates - save for later

Shortlist of apps worth patching next, checked 2026-09-19 against the 777-package
community aggregate (`community_coverage.json`) and for APKMirror availability. None of
these are covered by other bundles, and none are on `docs/patch-blocklist.md`.

Before starting one, follow the normal workflow in `AGENTS.md`: download the latest APK,
triage for PairIP/shields/server-side gates, find a stable anchor, then patch + smoke
test + decompile-verify.

## Tier 1 - ads only, easiest wins (GMA/AppLovin init+load kills)

| App | Package | Latest seen | Notes |
|---|---|---|---|
| Shazam | `com.shazam.android` | 16.59.0 | Massive user base, ads-only free tier, no premium gate to fake |
| Simple Radio | `com.streema.simpleradio` | 6.1.9 | Ad-supported radio; has a "remove ads" IAP to also check |
| WiFi Analyzer | `com.farproc.wifi.analyzer` | 3.11.1-L | Tiny app, ad-only, quickest possible win |

## Tier 2 - ads + local Pro/Premium

| App | Package | Latest seen | Notes |
|---|---|---|---|
| Pi Music Player | `com.Project100Pi.themusicplayer` | 3.2.0.0 | Ads + Pro IAP; expect a cached-purchase boolean |
| Moon+ Reader | `com.flyersoft.moonreader` | 9.9 | The classic: ads + Pro unlock; very requested app |
| TuneIn Radio | `tunein.player` | 42.4 | Ads patch only - Premium is server-side |
| Podcast Republic | `com.podcast.podcasts` | 9.8.5 | Ads + premium; verify whether the gate is local |

## Tier 3 - simple Pro unlocks

| App | Package | Latest seen | Notes |
|---|---|---|---|
| Device Info HW | `ru.andr7e.deviceinfohw` | 5.26.1 | Small app, one Pro boolean, near-zero risk |
| Xplore File Manager | `com.lonelycatgames.Xplore` | 4.49.10 | Pro features via its own license scheme - needs triage |

## Not suggested (checked, rejected or deferred)

- myTuner Radio (`com.mytuner.mobile`), Forza Football (`com.forzafootball`), The Free
  Dictionary (`com.tfd.mobile.TfdSearch`) - not on APKMirror; try APKPure/Aptoide first.
- Squid (`com.steadfastinnovation.android.projectpapyrus`) - premium validated server-side.
- Root Explorer (`com.speedsoftware.rootexplorer`), Titanium Backup
  (`com.keramidas.TitaniumBackup`), Torque (`org.prowl.torquefree`) - paid apps; works
  like Tasker but it is straight piracy. Only on explicit request.

## Recommended first batch

Shazam + Simple Radio + Device Info HW + Pi Music Player: two trivial ad kills and two
local pro gates, all verified available on APKMirror.

## Status (2026-09-19)

Tier 1 progress, all checked against the latest APKMirror builds:

| App | Status |
|---|---|
| Textra SMS | **Shipped** - "Enable Pro" (license pref class located structurally; l() -> true, k() -> false) |
| jetAudio | **Shipped** - "Enable Pro" (purchase info class located by its inline literal; leaf getters -> true) |
| Unified Remote | **Shipped** - "Enable Pro" (RevenueCat `EntitlementInfo.isActive()` -> true) |
| AZ Screen Recorder | **Blocked** - full PairIP (`SignatureCheck`, `VMRunner`, `VmDecryptor`); see patch-blocklist |
| ACR Phone | Parked - readable billing prefs bridge but the premium computation is obfuscated and a periodic purchase-refresh worker can overwrite cached state |
| Car Scanner ELM OBD2 | Parked - fully obfuscated app code, no RevenueCat; billing path not located yet |
| JuiceSSH | Parked - purchases stored in an ORMLite `purchase` table, premium gate in obfuscated code |
| Business Calendar 2 | Parked - obfuscated app code; premium check not located yet |

