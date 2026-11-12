# TextNow patches

**App:** TextNow (`com.enflick.android.TextNow`) · **target 26.45.0.0**
(versionCode 15780, minSdk 29, targetSdk 36) · split bundle `.apks`
(base + `split_config.arm64_v8a` + density splits).

> An earlier revision of this patch targeted **6.1.0.1** (versionCode 12231) — that was a
> wrong download: an ancient build whose internals (AdMarvel/AppNext/MoPub ads,
> Adjust + Flurry analytics) have nothing in common with the current app. It is replaced.

## Patches

| Patch | Default | What it does |
|---|---|---|
| **Remove ads** | ✅ | Disables the ad-network components the manifest declares (Facebook Audience Network, Amazon APS/DTB) and strips the ad-ID / ad-services / install-referrer permissions. |
| **Disable ad SDK** | ✅ | Forces `isEnabled()` → false on all seven partner ad-SDK initializers (see below). |
| **Disable trackers** | ✅ | No-ops AppsFlyer's implementation entry points (`start`, `logEvent`). |
| **Disable tracker components** | ✅ | Disables Firebase measurement, the AppsFlyer install-referrer provider and Facebook auto-init, and sets the Firebase/GA/Facebook opt-outs. FCM push is kept. |

## How 26.45.0.0 serves ads (and the chokepoints used)

The app runs a **strategy list** of ad-SDK initializers,
`com.enflick.android.ads.utils.GAMInitializer.INITIALIZERS`, holding seven objects:

```
GAMInitializer$Amazon          Amazon APS / DTB
GAMInitializer$FacebookPreInit Facebook Audience Network + app-events
GAMInitializer$FyberPreInit    DT Exchange (Fyber)
GAMInitializer$InMobiPreInit   InMobi
GAMInitializer$NimbusInit      Nimbus
GAMInitializer$LiveRampAts     LiveRamp (identity)
GAMInitializer$TradeDeskUID    The Trade Desk (identity)
```

The orchestrator calls `isEnabled(Context, AdsSDKConfigInterface, Continuation)` on each
and only then `setup(…)`. Forcing **`isEnabled` → false** disables the whole ad stack at
the app's own gate, leaving the shared list intact. Google Mobile Ads is never configured
in this build (there is no `gms.ads.APPLICATION_ID` meta-data), so AdMob cannot initialise
regardless of the mediation libraries that ship alongside it.

Analytics/attribution surviving in this build: **AppsFlyer** (`com.appsflyer.internal.AFa1tSDK`,
driven from the app's own `…attribution.AppsFlyerAttributionProvider`), **Facebook
app-events**, and **Firebase measurement**. Adjust, Flurry, Crashlytics and the old ad
networks are gone.

## Verification

- All four patches apply on the real 26.45.0.0 bundle with `failedPatches: []`;
  the patcher merges the `.apks` into a single installable APK.
- Patched manifest re-dumped (`aapt2 dump xmltree`): ad-ID / ad-services / referrer /
  AppsFlyer permissions removed; `AppMeasurementReceiver|Service|JobService`,
  `com.facebook.internal.FacebookInitProvider`, `com.appsflyer.referrer.INSTALL_PROVIDER`
  and `com.facebook.ads.AudienceNetworkContentProvider` all `enabled=false`;
  `com.facebook.sdk.AutoLogAppEventsEnabled=false`; `firebase_analytics_collection_enabled=false`.
- **Device (RootEmu):** installs, launches to
  `com.enflick.android.TextNow/authorization.ui.AuthorizationActivity`, process alive,
  **0 `FATAL EXCEPTION`**.

### The mistake this patch taught (and why the fix is shaped this way)

The first revision no-op'ed the app's *suspend* functions
(`AppsFlyerAttributionProvider.start`, `setUser`) by returning
`sget-object kotlin.Unit.INSTANCE`. On device that crashed:

```
NoSuchFieldError: No static field INSTANCE of type Lkotlin/Unit; in class Lkotlin/Unit;
    at …attribution.AppsFlyerAttributionProvider.start
```

TextNow's R8 pass **stripped `kotlin.Unit.INSTANCE`** (nothing in the app reads it), so an
injected reference to it is a dangling field. The rule now enforced in the skill:

> Never neutralise a Kotlin **suspend** function with `kotlin.Unit.INSTANCE`. Neutralise
> the **void** SDK entry point it calls instead — here `AFa1tSDK.start()V` /
> `logEvent(…)V`, behind the abstract `AppsFlyerLib.start()` the app invokes.
> `shared/MethodExtensions.kt` provides `returnVoid()` (void methods) and
> `returnFalseSuspend()` (suspend `Boolean` predicates, which returns
> `java.lang.Boolean.FALSE` — a field R8 cannot strip).

## Notes

- The split bundle ships only `arm64-v8a` native libraries; device testing therefore used
  the emulator's ARM translation (the same route used for adidas). `x86_64`-only
  installation is not possible for the merged APK.
