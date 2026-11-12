# Strava patches

**App:** Strava (`com.strava`) · targets **480.15 / 485.12 / 486.9 / 486.11** ·
XAPK / APKS split bundle (arm64-v8a only; no x86_64 libs → cannot run on an x86_64
emulator unless it also has an arm64-v8a image and the ABI split is included).

## Patches

| Patch | Default | What it does |
|---|---|---|
| **Unlock Premium** | ✅ | Rewrites `SubscriptionDetail.<init>` to force `isPremium=true`, far-future expiry and `state=PAID`, and forces the three `StravaProductAccess` gate statics. Also re-enables password login after OTP. |
| **Remove upsells & promos** | ✅ | Modular-UI upsells (upsell-shape predicate), subscription bottom-sheet upsells (one chokepoint), and the dedicated upsell screens. See below. |
| **Remove telemetry** | ✅ | GA4 + first-party Room analytics + Mapbox telemetry. |
| **Extra settings screen / resources** | ✅ | Native-style in-app screen (accent, upsell toggles, touch lock, share-overlay unlock). |
| **AMOLED dark theme**, **Custom app name** | ✅ | Theme/branding resources. |

## The upsell leak (v4, 2026-11-11) — root cause and fix

The v3 gate only removed a **fixed list of five** module types and, crucially,
**defaulted to SHOW for any type it did not recognise**. Strava then added more
upsell types, which is exactly the "still leaking upsells" symptom. Two separate
delivery systems are involved:

**1. Modular UI (converter-driven).** Types flow through `hts.a(GenericLayoutModule)`;
returning `null` there drops the module. Types proven present in 486.x that the
old list missed:

```
toolbar-upsell                              yis-2026-upsell-card-generic
best-efforts-peek-upsell-chart              yis-2026-upsell-card-legendary
sub-android-year-in-sport-2026-upsell-*     yis-2026-upsell-card-rare
year-in-sport-2026-upsell-android           achieve--instant-workouts--runna-banner--android
```

**Fix:** the gate now uses an **upsell-shape predicate** instead of a list —
`type.contains("upsell")` plus the explicit names that are not "upsell"-named
(`sub-preview-banner`, `subscriber-feature-header`, `recap-progress-entrypoint`,
`yis-2026`, `year-in-sport-2026`, `runna-banner`). Any future server-added upsell
type is covered without a code change; the per-type `morphe.hide.<type>` pref still
overrides, and now derives its default from the predicate.

**2. Non-modular surfaces (the part v3 never covered).** Verified by audit: only
`ActivityReplayUpsellCardConverter` and `DataPeekUpsellConverter` implement
`createModule(GenericLayoutModule,…)`, so the yis/toolbar/best-efforts types do
**not** pass through `hts.a`. Their surfaces are:

- **Subscription bottom-sheet upsells** ("Unlock our best training tools" half-sheets).
  Every one is shown by the single method
  `ww4.a(FragmentManager, SubscriptionsUpsellLocation)V`, which maps a location to a
  `BottomSheetUpsell` enum and starts `BottomSheetUpsellDialogFragment`. **Fix:** gate
  `ww4.a` → `return-void` (one chokepoint for the whole family), pref
  `morphe.hide.upsell_sheets`.
- **Dedicated upsell screens** (activities): `subscriptionsyearinsport.upsell.
  YearInSportUpsellActivity` (the seasonal YIS-2026 campaign), `subscriptionsdatapeek.
  BestEffortsDataPeekUpsellActivity`, `subscriptionsdeviceconnect.
  DeviceConnectUpsellActivity`. **Fix:** inject `finish()` after `super.onCreate`
  (the same proven pattern as the celebration gate), pref `morphe.hide.upsell_screens`.

Both new switches are in **Extra Settings → Hide upsells & promos**.

Deliberately left visible: the legitimate subscribe/checkout flow and the benign
"Manage subscription" row.

## Verification

- **Static, both targets (486.11 and 486.9):** patch applies with `failedPatches: []`;
  patch-time log confirms `subscription bottom-sheet upsell gate wired (ww4.a)` and
  `upsell screen gates wired (3 activities)`.
- **Re-decoded the patched 486.11 dex:** `hts.a` contains the predicate (all six
  substring/equals checks); `ww4.a` begins with the gate; all three upsell activities
  contain `morphe.hide.upsell_screens` + `Activity→finish()`.
- **Device (RootEmu, 486.9 with the ABI split):** installs, launches to
  `com.strava/.authorization.view.welcomeCarouselActivity.WelcomeCarouselActivity`,
  process alive, **0 `FATAL EXCEPTION` / `VerifyError`**.

### Known-untouched surfaces (parked, not hidden)

These are upsell-adjacent but were not gated in v4 (each needs a runtime check or a
riskier anchor): `FlyoverUpsellBanner.Content` (a `@Composable` — early return is
unsafe for Compose), `RoutesRepositoryImpl.fetchSuggestedRoutesForUpsell-0E7RQCE`
(a suspend fun — needs a coroutine-park idiom), the `dorado` promo engine
(`FullscreenPromoFragment` / `PromoDialogFragment` — may be legitimate marketing),
`MapsBottomSheet$Modal$Upsell`, and `monthlystats` `UpsellData`.
