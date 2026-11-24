# SidelineSwap Patch Specifications

Supported target: **2.3.2** (`com.sidelineswap.android`, version code 1251, minSdk 24).
SidelineSwap 2.3.2 is a Compose rewrite that shares no bytecode descriptors with 1.52.0, which is no
longer supported. See [architecture.md](architecture.md) for the reverse-engineering detail.

| Patch                                                         | Type                    | Default | Description                                                                                                                |
| ------------------------------------------------------------- | ----------------------- | ------- | -------------------------------------------------------------------------------------------------------------------------- |
| [AMOLED Theme](#amoled-theme)                                 | `compositeFeaturePatch` | `false` | Pure-black Compose palette, light text/icons, black launch window, light system-bar icons, force-dark WebViews.            |
| [Block Tracking and Telemetry](#block-tracking-and-telemetry) | `compositeFeaturePatch` | `true`  | Neutralizes first-party, Amplitude, Firebase, Crashlytics, Iterable, Braintree FPTI, install-referrer and AAID collection. |
| [Change Brand Color](#change-brand-color)                     | `compositeFeaturePatch` | `false` | Replaces the Compose brand accent constants and the launcher icon background.                                              |
| [Remove Invite Friends](#remove-invite-friends)               | `bytecodePatch`         | `true`  | Hides the Account referral entry and blocks direct and deep-link navigation to it.                                         |

All patches verify the artifact version and fail fast on anything other than 2.3.2.

---

## Block Tracking and Telemetry

### Motivation

2.3.2 funnels every interaction through one tracker interface `Lij;` whose implementations fan out to
SidelineSwap's own HTTP endpoint and to Amplitude, and it still ships Firebase Analytics, Crashlytics,
Iterable, payment telemetry, an install-referrer reporter and an advertising-id client. This patch
neutralizes each source independently, leaving search, browsing, selling, messaging, notifications,
auth and checkout entry working.

### Options

| Option key                  | Default | 2.3.2 target                                                                                                                                                                                                               |
| --------------------------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `disableFirstParty`         | `true`  | `Lwl2;->b(String, Map)` returns immediately. The fan-out multiplexer `Loi1` is left intact so the other clients stay independently controllable.                                                                           |
| `disableAmplitude`          | `true`  | `Lli;->a(String)`, `Lli;->b(String, Map)`, `Lli;->reset()` return immediately.                                                                                                                                             |
| `disableFirebase`           | `true`  | `AppMeasurement;->logEventInternal` returns immediately; `AppMeasurementReceiver`, `AppMeasurementService`, `AppMeasurementJobService`, `SessionLifecycleService` and `AD_SERVICES_CONFIG` are stripped from the manifest. |
| `disableCrashlytics`        | `true`  | Wrapper `Lyb5;->a/b` return immediately and the crash handler `Lqs1;->a(Thread, Throwable)` returns `false`, so exceptions are not recorded while the default handler still terminates the process.                        |
| `disableIterable`           | `true`  | Wrapper `Ls24;->a/clear` and SDK `Lb14;->i/k` return immediately; Iterable push services and receivers are stripped from the manifest.                                                                                     |
| `disableBraintreeTelemetry` | `true`  | `AnalyticsUploadWorker.c()` and `AnalyticsWriteToDbWorker.c()` return WorkManager success (`Lhn4`) without uploading, so queued work drains without retries.                                                               |
| `zeroAdvertisingId`         | `true`  | Renamed `AdvertisingIdClient` `Lie;->a(Context)` and `Lie;->e()` return `Lhe` with an all-zero UUID and limit-ad-tracking enabled.                                                                                         |
| `disableInstallReferrer`    | `true`  | GMS install-referrer reporter `Llab;->S` returns immediately.                                                                                                                                                              |

There is no Facebook SDK in 2.3.2, so no Facebook option is offered. No display-ad flow exists, so no
ad-removal patch is provided.

---

## AMOLED Theme

### Motivation

2.3.2 is a light-only Compose application: white background/surface tokens, white launch window, dark
foregrounds and dark system-bar icons. This patch converts the app-owned palette to pure black with
readable light foregrounds and keeps embedded web content legible.

### Technical Strategy

The app has no XML theme to edit, so the patch operates on the Compose palette producers:

1. **Launch surfaces** (`res/values/styles.xml`, `res/values-v31/styles.xml`): `Theme.Sls.Launch`
   `android:windowBackground` and `android:windowSplashScreenBackground` become `@android:color/black`,
   removing the white launch flash and splash.
2. **Neutral ramp** (`Lzg0`, backing every app text/surface token): `#F5F5F7` → `#121212`,
   `#E6E9F0` → `#262A2E`, `#DADEE5` → `#8A9099`, `#78828F` → `#A8B2BE`, `#242529` → `#ECEFF1`.
3. **Surface tokens** (`Ldo7`): `#FFFFFF` → `#000000`; the translucent selected-row overlay is
   re-tinted to a dark green.
4. **Material light token table** (`Ljd1`, read only by the ColorScheme factory): `surfaceBright`
   `#0F0F0F`, `surfaceDim` `#000000`, `surfaceContainer` `#0A0A0A`, `surfaceContainerHigh` `#141414`,
   `surfaceContainerHighest` `#1A1A1A`, `surfaceContainerLow` `#050505`, `surfaceContainerLowest`
   `#000000`, `errorContainer` `#4A1512`, `onErrorContainer` `#FFD9D6`.
5. **App-authored light surfaces outside the palette**: free-shipping card `Lbd0`
   (`#F5FCF8` → `#0C1A12`, border `#BFEBD2` → `#1E3B2B`) and selected row `Lbl1`
   (`#EAF8EE` → `#10241A`).
6. **System bar icons**: `MainActivity.onCreate` forces the two `isDark` arguments of
   `Lmj9;->P(...)` to `true`, producing light status/navigation icons over the transparent bars.
7. **WebViews**: `DarkWebViewBridge.applyDarkMode` is injected into the Ada chat host (`Ld9`), the
   Compose web factory (`Lec`), the web dialog host (`Lb24`), and re-applied in `Lc34.onPageFinished`.

Every anchor is required and validated. Vendor Compose UI that is not app-owned is left untouched.

### Coexistence with Change Brand Color

The shipped brand green `#253C32` is authored for light surfaces and stays dim on black. Enable
`Change Brand Color` for a brighter accent. The two patches never write the same anchor: AMOLED owns
surfaces/foregrounds/containers, brand color owns the `Lho7` accent constants and the launcher icon.

---

## Change Brand Color

### Motivation

The Compose accent palette is a set of Kotlin constants, so the 1.52 XML approach (`colorPrimary` and
friends) no longer applies.

### Options

| Option key         | Title               | Default   | Applies to                                                                                                                        |
| ------------------ | ------------------- | --------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `primaryColor`     | Primary Brand Color | `#1E88E5` | `Lho7;->a` — the Material primary role **and** the 60+ classes that use the brand accent directly; also `ic_launcher_background`. |
| `primaryDarkColor` | Primary Dark Color  | `#1565C0` | `Lho7;->b` — the secondary accent, normally copied from the green tonal ramp.                                                     |

### Technical Strategy

- The shipped primary literal (`0xFF253C32`) is replaced in `Lho7`'s static initializer, so both the
  Material primary role and every direct accent usage follow automatically.
- The secondary accent store is overwritten with the chosen color; the green tonal ramp (`Lgd3`) is
  left intact so success/status iconography keeps its semantic colors.
- `ic_launcher_background` in `res/values/colors.xml` is updated from `#02c874` to the chosen primary.
- Tertiary, error, warning and info accents are semantic and are not rewritten.

---

## Remove Invite Friends

### Motivation

The Account screen exposes a referral row ("Invite Friends" / referral amounts) that is reachable
both from the account page and from `sidelineswap://invite` / `https://sidelineswap.com/invite` deep
links. Users who do not want referral prompts can remove the entry without losing any other account
action.

### Technical Strategy

1. **Row hidden**: in the Compose account content (`Lw5`), the referral row guard on `Lu6;->d:Lai6`
   is neutralized so neither branch renders the row. Every other account row keeps its own rendering
   block (seller dashboard, purchase history, updates, settings, help, gift cards, trade-in events,
   vacation, phone verification, email update, locker).
2. **Direct navigation blocked**: navigation callback `Lh5` case `8` returns Unit instead of pushing
   `InviteFriendsRoute` (`Liy3`).
3. **Deep links blocked**: the URL parser `Liz` resolves the `invite` path to `null` (the same result
   as an unmatched path) instead of the referral action, so external invite links no longer open the
   referral screen. Other deep links keep resolving.

2.3.2 has no account badge, so the 1.52 phantom-dot workaround does not apply.

---

## Hidden Features

No hidden-menu or feature-unlock patch is provided. `api_force_staging` belongs to Google Play
services (`DynamiteModule`), the app's `STAGING` environment is hardcoded to `PRODUCTION`, there is no
debug/developer screen, and Pro/Pro+/Autopilot/auto-reject are enforced from server-supplied
`UserConfigurationData` rather than client-side checks. Forcing those gates would only relabel UI
while the server still denies the benefit.
