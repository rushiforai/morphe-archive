# Pluralsight patches

**App:** Pluralsight (`com.pluralsight`) · **target 2026.11.05**
(versionCode 903935, minSdk 32, targetSdk 37) · split bundle `.apks`
(Play-signed, SHA-256 `8f7fc4fb…ae31bcf`).

Full static recon: `docs/phase2-analysis.md`; failures and fixes:
`docs/phase2-devlog.md`.

## Patches

| Patch | Default | What it does |
|---|---|---|
| **Bypass PairIP license check** | ✅ | lite-variant PairIP launch gate, including this build's custom-trial re-arm. |
| **Disable trackers** | ✅ | No-ops `pa1.a(String, Map)V` — the app's own Firebase Analytics event sink. |
| **Disable tracker components** | ✅ | Disables Heap's two auto-init ContentProviders and **creates** the Firebase opt-outs. |

There is deliberately **no ads patch** (no ad SDK ships — the lone `gms/ads` class is the
deprecated `AdvertisingIdClient` identifier, covered by nothing here because the ad-ID is
not exposed by these patches) and deliberately **no premium patch**: Pluralsight's
entitlement is server-authoritative.

## Protection: PairIP + a separate entitlement layer

PairIP is the standard lite variant (`com/pairip/application/` + `licensecheck/` only, no
`VMRunner`/`StartupLauncher`/`libpairipcore.so`), and the gate is a *subclass*:
`com/pairip/application/Application .super Lcom/pluralsight/KMPApplication;`, so the
manifest `android:name` is left alone and `LicenseClient.checkLicense` is the choke point.

What `killPairIpFull` + the extras neutralise (measured on the target APK):

| Method | Instrs before → after |
|---|---|
| `initializeLicenseCheck()` | 29 → 3 (forces `LOCAL_CHECK_OK`) |
| `processResponse(I, Bundle)` | 54 → 1 |
| `performLocalInstallerCheck()` | 53 → 2 (→ true) |
| `startPaywallActivity(PendingIntent)` | 11 → 1 |
| `handleTrialEnd()` | 26 → 1 (custom-trial re-arm) |
| `startErrorDialogActivity()` | 9 → 1 |
| `handleError(LicenseCheckException)` | 5 → 1 |
| `scheduleAppShutdown()` | 7 → 1 |
| `initiateFreshLicensingServiceConnection(Z)` | 3 → 1 |

`handleTrialEnd` matters: it sets `customTrialEndTriggered = true` **and**
`licenseCheckState = CHECK_REQUIRED`, re-arming a real network check — the same extension
We Love Deals has and OferHub does not.

## Premium is out of reach (honest classification)

- Subscription state: `GET /v1/subscription` → `SubscriptionInfo` Room row
  (`slices`, `trial`, `subscriptionStatus`, `isPendingVerification`) → paywall chrome only.
- Course access: `GET /v2/user/courses` → `CourseAccessResponseDto(viewableModules,
  mayDownload, isEmbargoed)` → `CourseAccess` / `ViewableModule` Room tables.
- Media: `VideoResponseDto(url, rankedOptions, sessionId)` — the `url` is **issued by the
  server**, over authenticated endpoints `/v2/library/videos/offline` and
  `/v2/library/videos/offline/viewreporting`. Downloads are decrypted locally, but their
  source URLs come from the server data source, so local decryption is not a leverage
  point.

A client patch can only strip paywall chrome; it cannot mint playable or downloadable
media. That is why no premium patch exists here.

## Telemetry: what was reachable and what was not

| SDK | Anchor used | Outcome |
|---|---|---|
| **Firebase Analytics** | `Lpa1;->a(Ljava/lang/String;Ljava/util/Map;)V` — app-owned wrapper, the single public method; sets the analytics user-id then forwards events | no-op |
| **Heap** (session recording) | two manifest ContentProviders, `initOrder` 1 and 2 | disabled |
| **Firebase Remote Config / Crashlytics / FCM** | — | **kept** — config/push/analytics infrastructure, not analytics sinks |
| **Mux** (video analytics) | — | **deliberately not patched** |

The premium-wall string `0x7f110108` is **not** used as a fingerprint: it has no DEX
constant reference, only the generated `R` field.

### Why Mux is left alone (evidence, not caution-for-its-own-sake)

- The app's only Mux coupling is the R8-renamed `…datasourceImpl.b`
  (`MuxAnalyticsRemoteDataSourceImpl`). Its whole Mux call surface is
  `CustomerPlayerData`/`CustomerData`/`CustomData` **model setters** — no send method.
- All three public methods of that class are **suspend** functions (`(…)Ljava/lang/Object;`).
  The repo's `MutableMethod.clearBody()` notes forbid rewriting suspend wrappers, and a
  survivable injected `sget-object …Lkotlin/Unit;` is what actually breaks on device.
- The SDK-level entry (`CustomerPlayerData.setEnvironmentKey(Ljava/lang/String;)V`) is
  shared with Mux's own `MuxDataSdk` internal call path — no-op'ing it is unsafe.
- There is no Mux ContentProvider and no `Lcom/mux/streamee` usage anywhere, so there is no
  clean component-level switch either.

## Verification (2026-11-20, Morphe CLI on the real 2026.11.05 base APK)

All three patches applied together with `--exclusive`:
- `pa1.a` body contains **0** instructions (`invoke-`/`iget`) — neutralised.
- Both Heap providers gained `android:enabled="false"` and `android:exported="false"`.
- `firebase_analytics_collection_enabled=false`, `firebase_analytics_collection_deactivated=true`,
  `firebase_data_collection_default_enabled=false` (+ two more) were **created** in the
  manifest — none existed before, which is exactly why the patch creates them.
- PairIP instruction counts as tabulated above.
- DEX verifier (`--verify-with-sdk`) clean for the classes these patches touch.

## Known gaps

1. **Mux video analytics remains active** — see the evidence above; it is the one
   telemetry surface this bundle does not disable.
2. **Ads/telemetry at the SDK level** (Firebase's own auto-collection) is covered only by
   opt-outs + the app's wrapper; a future build wiring Firebase Analytics directly rather
   than through the wrapper would need re-auditing.