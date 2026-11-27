# Disable tracking and analytics

- **Patch name:** `Disable tracking and analytics`
- **Default:** `true` (enabled)
- **Dependency:** `pairipLicenseBypassPatch`
- **Sources:**
  - [`DisableTelemetryPatch.kt`](../patches/src/main/kotlin/app/w3s/patches/w3schools/misc/privacy/DisableTelemetryPatch.kt)
  - [`Fingerprints.kt`](../patches/src/main/kotlin/app/w3s/patches/w3schools/misc/privacy/Fingerprints.kt)

## What It Does

Disables background analytics, advertising ID harvesting, Privacy Sandbox ad attribution, install referrer tracking, and RevenueCat diagnostic/event uploads while leaving login and billing APIs intact.

## Patch Stages

### 1. Meta / Facebook SDK & Privacy Sandbox Stubs (`classes.dex`)

| Target | Patched Behavior | Effect |
|---|---|---|
| `FacebookSdk.getAutoLogAppEventsEnabled()Z` | `false` (`0`) | Disables automatic Meta app event logging |
| `FacebookSdk.getAdvertiserIDCollectionEnabled()Z` | `false` (`0`) | Disables Meta AAID collection |
| `FacebookSdk.getCodelessSetupEnabled()Z` | `false` (`0`) | Disables Meta codeless event bindings |
| `FacebookSdk.publishInstallAsync(...)V` | `return-void` | Stops install ping to Meta Graph API |
| `AppEventsManager.start()V` | `return-void` | Skips Meta AppEvents initialization |
| `AutomaticAnalyticsLogger.logActivateAppEvent()V` | `return-void` | Suppresses foreground launch event uploads |
| `AutomaticAnalyticsLogger.isImplicitPurchaseLoggingEnabled()Z` | `false` (`0`) | Disables Meta automatic IAP logging |
| `InAppPurchaseAutoLogger.startIapLogging(...)V` | `return-void` | Disables Meta Play Billing purchase wrapper |
| `GpsAraTriggersManager.enable()V`, `PACustomAudienceClient.enable()V`, `GpsTopicsManager.enableTopicsObservation()V` | `return-void` | Disables Android Privacy Sandbox / AdServices triggers |
| `AttributionIdentifiers$Companion.getAndroidIdViaReflection(...)`, `getAndroidIdViaService(...)` | `null` (`0`) | Prevents Meta SDK from fetching Google Advertising ID |
| `InstallReferrerUtil.tryUpdateReferrerInfo(...)V` | `return-void` | Prevents querying Google Play Install Referrer API |

### 2. RevenueCat Telemetry Stubs (`classes.dex`)

Stubs `DiagnosticsTracker.trackEvent(...)` and `EventsManager.track(...)` / `flushEvents(...)` to `return-void` while keeping core `Purchases` initialization and customer entitlement calls (`getCustomerInfo`, `presentPaywall`) untouched.

### 3. Manifest & AdServices XML

- Sets `com.facebook.sdk.AutoLogAppEventsEnabled`, `com.facebook.sdk.AdvertiserIDCollectionEnabled`, and `com.facebook.sdk.CodelessDebugLogEnabled` `<meta-data>` entries in `AndroidManifest.xml` to `"false"`.
- If `res/xml/ad_services_config.xml` is present, sets `allowAllToAccess="false"` on `<attribution>`, `<custom-audiences>`, and `<topics>`.
