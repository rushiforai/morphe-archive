# Microsoft Teams patches

**App:** Microsoft Teams (`com.microsoft.teams`) · **version `1416/1.0.0.2026202302`** ·
versionCode `2026202325` · minSdk 30 / targetSdk 36 · XAPK bundle (base + `config.arm64_v8a`
+ `config.mdpi` + `config.en`; the base alone is ~146 MB).

**Signer (SHA-256):** `d49b848e0580370b89c4da712b8da7296782e866bcbfb58ccd873fd954725985`.

## Patches

| Patch | Default | What it does |
|---|---|---|
| **Disable AppCenter telemetry** | ✅ | No-ops the AppCenter SDK bootstrap (`configureAndStartServices` + `startServices`). |
| **Remove ads** | ✅ | Strips the advertising-ID / ad-services / install-referrer permissions (Teams ships no ad SDK) and disables any ad-SDK init provider. |
| **Unbloat (trim manifest)** | ✅ | Removes the 16 third-party launcher-badge permissions (Samsung/HTC/Sony/Sony-Ericsson/Huawei/OPPO/"badger"). |

Scope here was deliberately **"unbloat", not feature unlocks** (Teams is server-side: every
capability, entitlement and much of the telemetry lives behind Microsoft's authenticated APIs
and cannot be changed by a client patch).

## What was actually worth removing

- **AppCenter** is the one client-side telemetry/crash SDK bundled (≈203 referenced classes:
  `AppCenter`, `crashes`, `analytics`, `channel/OneCollectorChannelListener`). R8 had **inlined
  the public `AppCenter.start(Application, String, Class…)` facade** into the SDK's internal
  bootstrap, so the methods that actually exist in this dex are
  `AppCenter.configureAndStartServices(Application, String, Class[])V` and
  `AppCenter.startServices([Class])V` — both are no-oped (**2 methods**), so the SDK never
  initialises a service and nothing is collected or uploaded.
- **Permission surface**: 80 declared permissions, including a badge zoo for launchers that are
  not installed. The 16 badge permissions are removed (and the install-referrer), taking the
  manifest from **80 → 63** permissions. Nothing Teams needs for messaging, calls,
  notifications, files or Intune is touched.
- **No ad SDK** exists in Teams (no `com/google/android/gms/ads`, AppLovin, Unity, ironSource,
  Vungle, Pangle, ByteDance; no `MobileAdsInitProvider`; no ad-unit ids), so "Remove ads" is a
  defensive permission/ad-provider strip.

There is **no meaningful client-side telemetry beyond AppCenter** (no OneCollector/1DS/Aria,
Appsflyer, Facebook or Crashlytics classes are present). Microsoft's own telemetry is sent
through Teams' normal API calls and is out of reach of a client patch.

## Hard limit: Play Integrity

Teams bundles the **Play Integrity API** (`com.google.android.play.core.integrity`). On a
**re-signed** build the integrity verdict is produced by Google and validated by Microsoft's
servers, so the app shows

> *"Can't open app — This app may not be from a trusted source. You can reinstall or update the
> app in the Google Play store to continue."*

and refuses to continue past the welcome screen. This is an external, Google-signed check: no
client-side patch can satisfy it (forcing the local check to "pass" would only be cosmetic — the
server verdict still fails). It is also why the emulator (userdebug / dev-keys) shows the same
dialog for the *original* Play-signed build, i.e. it is not caused by these patches.

## Verification

- **Static (patch run + `aapt2` on the patched APK):** `appliedPatches` = the three patches,
  `failedPatches: []`; `[teamsDisableAppCenter] AppCenter bootstrap methods no-oped: 2`;
  `[teamsTrimManifest] badge permissions removed: 16`; permissions **80 → 63**, with 0
  badge / install-referrer / advertising-ID matches left.
- **Device (RootEmu):** the 157 MB patched build installs (streamed install, Success), launches
  to `com.microsoft.skype.teams.views.activities.WelcomeActivity`, process alive, **0 `Fatal
  signal` / `FATAL EXCEPTION`**; the welcome UI renders, then the Play Integrity dialog above
  appears — the documented hard limit.
