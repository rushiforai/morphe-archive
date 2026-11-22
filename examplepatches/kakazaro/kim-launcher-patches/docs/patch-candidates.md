# Patch candidates

These are ranked by how well each is supported by evidence in [apk-analysis.md](apk-analysis.md).
Entitlement, PRO, Trial and licensing checks are out of scope
(see analysis section 7).

| # | Patch | Default | Target (dex) | Status |
|---|---|---|---|---|
| 1 | **Allow non-BYD devices**: skip the "available only on BYD head units" screen (emulator or bench testing) | off | `r2.a.a(Context)Z` returns `true` | Hook located; ready to implement |
| 2 | **Settings-only in-app updates**: the upstream OTA cannot install over a re-signed build | on | `K1/uc.c(I,String,Z,Z)LinkedHashMap` | **Implemented**: `SettingsOnlyOtaUpdatesPatch.kt` |
| 4 | **Always free plan**: `K1/sd.f0` skips the server and stores/returns `free/disabled` | on | `K1/sd.f0(pd,String,Z)md` | **Implemented**: `AlwaysFreePlanPatch.kt` (see below) |
| 3 | **Telegram debug channel**: decide whether to disable it after reading what it sends | ? | `byd/telegram_debug` handler | Needs investigation |

## 1. Allow non-BYD devices

- Fingerprint: a class whose `<clinit>` holds the strings `android.hardware.BYDAutoManager`
  and `com.byd.carsettings`; method `a`, `public final`, params `[Landroid/content/Context;]`,
  returns `Z`.
- Edit: prepend `const/4 v0, 0x1` and `return v0`.
- Caveats: on non-BYD hardware every `BYDAUTO_*` API is absent, so vehicle features will not
  work, and the bootstrap may log failures. The gate result is also used by the Sentry
  services and receivers and by the accessibility service. Test that these do not crash-loop
  when the BYD framework classes are missing.

## 2. Notify-only in-app updates (implemented)

Native call path (1.0.2781):

```
Dart --"byd/update"--> A0/g.onMethodCall (switch id 0x16) --> A0/g.r(call, result)
   "check"        -> K1/qc runnable --+
   "install"      -> K1/rc runnable --+--> K1/D0.g() on K1/uc.c executor --> K1/uc.c(...)
   "cachedStatus" -> K1/uc.b() (SharedPreferences "KimLauncherUpdates", no network)
background check  -> K1/d9 (catch-all) ------------------------------> K1/uc.c(...)
```

`K1/uc.c(int flags, String source, boolean install, boolean force)` does the whole job: it
calls `.../otaAndroidLatest?vehicleId=…&versionCode=2393`, downloads and checks
`kim-launcher-update.apk` (size, SHA-256, package), then opens the package installer. It already
reports failure by throwing. `K1/D0.g()` catches the exception and returns `result.error` to
Dart (`K1/M5`), and `K1/d9` swallows it.

- Fingerprint: `public static`, `(I, Ljava/lang/String;, Z, Z) -> Ljava/util/LinkedHashMap;`,
  strings `/otaAndroidLatest?vehicleId=`, `kim-launcher-update.apk`,
  `Downloaded APK checksum does not match.`. Unique in 1.0.2781.
- Edit: at index 0, `const/16 p2, 0x0` (the `install` flag), so the check and its cached status
  still work but nothing is downloaded or installed. `K1/uc.g()` still needs a Trial/paid plan.
- Not covered: Dart also references `https://kim.storageclbsync.cc/android/PackageInstaller.apk`.
  That is a separate helper download that Morphe cannot reach.
- Not yet verified on a device: what the update screen shows when an update exists.

## 3. `byd/telegram_debug`

- *Unknown:* what data is sent and when. Read the handler before deciding.

## 4. Always free plan (implemented)

`AlwaysFreePlanPatch.kt` inserts, at the start of `K1/sd.f0`, the same ending the original uses
after a successful answer, fed with a fixed JSON,
`{"plan":"free","status":"disabled","expiresAt":0,"paidUntil":0}` (`FREE_PLAN_JSON` in the patch):
parse it with the app's own parser (`free / disabled / expiresAt 0`, `fetchedAt = now`), store it
in the in-memory field, save it to preferences, notify Dart, return it. The values are written
out, so they don't depend on how the parser treats a missing record. The request, token handling, writer-repair call and the
15-minute shortcut are never reached. Every name is read from `f0`'s own instructions, so renamed
classes in later versions still match. Default **on**.

- Verified on 1.0.2781: the fingerprint (`/entitlement.json` + `VehicleLocationSync entitlement
  plan=`) matches only `f0`; each derived reference resolves to exactly one target; the edited
  class assembles to dex. Not built into a bundle (no GitHub Packages credentials here) and not
  run on a device.
- **Limit:** `f0` runs only when a sign-in token exists (the refresh task in `K1/t6` skips it
  silently otherwise), and the app loads its saved status from preferences at start-up. So a
  previously saved `paid/active` record stays in effect until `f0` runs once. Overwriting the
  saved record at load time would be a second hook (the loader in `K1/sa`, around line 190).
- **Effect:** Trial/PRO features lock (Sentry, Studio editing, vehicle controls, ...) even if the
  car has a valid subscription. Turn the patch off to get them back; nothing server-side changes.
