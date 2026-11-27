# W3Schools Patches Documentation

Technical reference for [`RyuuseiAkira/w3s-patches`](https://github.com/RyuuseiAkira/w3s-patches) (`app.w3s.patches`), built for **W3Schools** (`com.w3schools.app.prod`) on [Morphe Patcher](https://github.com/MorpheApp/morphe-patcher).

## Target & Architecture

W3Schools Android ships as a split APK bundle (`ApkFileType.APKS`) combining:

1. **Capacitor WebView + Next.js static export** — UI, curriculum progression checks, update lockouts, and client energy state live in bundled webpack chunks under `assets/public/_next/static/chunks/*.js`.
2. **Android / Dalvik runtime** — `@capgo/capacitor-social-login` handles Google/Facebook Sign-In, Pairip (`com.pairip.licensecheck.LicenseClient`) validates Play Store licensing at startup, and Meta/RevenueCat SDKs emit background analytics/telemetry.

All compatibility metadata lives in [`Constants.kt`](../patches/src/main/kotlin/app/w3s/patches/w3schools/shared/Constants.kt):

| Property | Value |
|---|---|
| Package name | `com.w3schools.app.prod` |
| Bundle format | Split APK (`APKS`) |
| Tested version | `1.0.8` (+ unpinned `isExperimental = true` target) |
| Original cert SHA-256 | `bc4474ff6fc461207f02a711092d7eb0d3f92adfb08775394b4fb615b0263ad4` |
| Original cert SHA-1 | `30e99cb56f09534acd558f3427bbd15e57dc0db1` |

## Patch Matrix

| Patch | Default | Availability | Dependency | Details |
|---|---|---|---|---|
| **Unlimited energy** | On (`true`) | Enabled | `pairipLicenseBypassPatch` | [unlimited-energy.md](unlimited-energy.md) |
| **Unlock curriculum map** | On (`true`) | Enabled | `pairipLicenseBypassPatch` | [unlock-curriculum-map.md](unlock-curriculum-map.md) |
| **Bypass forced updates** | On (`true`) | Enabled | `pairipLicenseBypassPatch` | [bypass-forced-updates.md](bypass-forced-updates.md) |
| **Disable tracking and analytics** | On (`true`) | Enabled | `pairipLicenseBypassPatch` | [disable-telemetry.md](disable-telemetry.md) |
| **Hide upgrade prompts** | On (`true`) | Enabled | `pairipLicenseBypassPatch` | [hide-upgrade-prompts.md](hide-upgrade-prompts.md) |
| **Enable developer tools** | Off (`false`) | Disabled by default | `pairipLicenseBypassPatch` | [enable-developer-tools.md](enable-developer-tools.md) |
| **MicroG-RE support** | Off (`false`) | `DISABLED` (Standard / Shizuku), `UNAVAILABLE` (Mount) | `pairipLicenseBypassPatch` | [microg-re-support.md](microg-re-support.md) |
| *Pairip license bypass* (internal) | Automatic | Shared dependency | — | [pairip-and-limitations.md](pairip-and-limitations.md) |

## Guides

- **[Unlimited energy](unlimited-energy.md)** — `user-energy` JS stubs plus unlimited infinity UI across `/energy`, top bar, curriculum header, and profile.
- **[Unlock curriculum map](unlock-curriculum-map.md)** — `resolveCurriculumAvailability` unlock and removal of `/course-overview` unlock upsells.
- **[Bypass forced updates](bypass-forced-updates.md)** — Neutralizes remote `minimumClientBuild` blocking in `W3SAppUpdateProvider` and Play in-app review prompts.
- **[Disable tracking and analytics](disable-telemetry.md)** — Disables Meta AppEvents, AdServices attribution, AAID/InstallReferrer collection, and RevenueCat diagnostic/event uploads.
- **[Hide upgrade prompts](hide-upgrade-prompts.md)** — Removes remaining free-user upsell banners on `/streak` and `/duel`.
- **[Enable developer tools](enable-developer-tools.md)** — Exposes built-in `/billing-debug` and `/devconsole` tools in Settings.
- **[MicroG-RE support](microg-re-support.md)** — Dalvik bytecode stubs, string/authority rewrites, Android 14+ Credential Manager routing, and manifest spoofing for `app.revanced.android.gms`.
- **[Pairip bypass & client/server boundaries](pairip-and-limitations.md)** — Internal Pairip startup license bypass and which W3Schools features remain server-enforced.
