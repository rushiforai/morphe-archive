package app.diskwala.patches.ad

import app.morphe.patcher.Fingerprint

/**
 * Ad SDK fingerprints for DiskWala 26.9 (native Kotlin/Compose).
 *
 * Ads are initialized from two places:
 *  1. AndroidX/ContentProvider auto-init at process start.
 *  2. j5.u.a() - the app's Google MobileAds initialization wrapper.
 *
 * Stubbing both layers keeps every SDK cold without touching app logic.
 */

// App's Google MobileAds initializer (called when the session is NOT_PREMIUM).
internal object GoogleMobileAdsInitializerFingerprint : Fingerprint(
    definingClass = "Lj5/u;",
    name = "a",
    returnType = "V",
    parameters = emptyList()
)

// Google MobileAds provider actually initializes from attachInfo(), not onCreate().
internal object MobileAdsInitProviderAttachInfoFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/MobileAdsInitProvider;",
    name = "attachInfo",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/content/pm/ProviderInfo;")
)

// ContentProvider auto-init hooks.
internal object AppLovinInitProviderFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/sdk/AppLovinInitProvider;",
    name = "onCreate",
    returnType = "Z"
)

internal object MobileAdsInitProviderFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/MobileAdsInitProvider;",
    name = "onCreate",
    returnType = "Z"
)

internal object VungleProviderFingerprint : Fingerprint(
    definingClass = "Lcom/vungle/ads/VungleProvider;",
    name = "onCreate",
    returnType = "Z"
)

internal object IronSourceLifecycleProviderFingerprint : Fingerprint(
    definingClass = "Lcom/ironsource/lifecycle/IronsourceLifecycleProvider;",
    name = "onCreate",
    returnType = "Z"
)

internal object IronSourceLevelPlayLifecycleProviderFingerprint : Fingerprint(
    definingClass = "Lcom/ironsource/lifecycle/LevelPlayActivityLifecycleProvider;",
    name = "onCreate",
    returnType = "Z"
)

internal object MBComponentLifecycleProviderFingerprint : Fingerprint(
    definingClass = "Lcom/mbridge/msdk/config/component/status/MBComponentLifecycleProvider;",
    name = "onCreate",
    returnType = "Z"
)

internal object BigoAdsProviderFingerprint : Fingerprint(
    definingClass = "Lsg/bigo/ads/controller/provider/BigoAdsProvider;",
    name = "onCreate",
    returnType = "Z"
)

internal object BidMachineInitProviderFingerprint : Fingerprint(
    definingClass = "Lio/bidmachine/BidMachineInitProvider;",
    name = "onCreate",
    returnType = "Z"
)

internal object AudienceNetworkContentProviderFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/ads/AudienceNetworkContentProvider;",
    name = "onCreate",
    returnType = "Z"
)

internal object AppMeasurementContentProviderFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/measurement/AppMeasurementContentProvider;",
    name = "onCreate",
    returnType = "Z"
)

// Direct AppLovin initialization safety net (the provider is normally enough).
internal object AppLovinSdkInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/sdk/AppLovinSdk;",
    name = "initialize",
    returnType = "V",
    parameters = listOf(
        "Lcom/applovin/sdk/AppLovinSdkInitializationConfiguration;",
        "Lcom/applovin/sdk/AppLovinSdk\$SdkInitializationListener;"
    )
)
