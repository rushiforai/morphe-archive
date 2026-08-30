package app.diskwala.patches.ad

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Fingerprints for ad SDK init providers and React Native bridge modules.
 * All are non-obfuscated, so we match on full class name + method signature.
 * Filters are kept minimal to survive SDK version bumps.
 */

// Init providers - stub onCreate() to avoid SDK init without crash
internal object AppLovinInitProviderFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/sdk/AppLovinInitProvider;",
    name = "onCreate",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/applovin/impl/h1;",
            name = "a",
            parameters = listOf("Landroid/content/Context;")
        )
    )
)

internal object InMobiInitProviderFingerprint : Fingerprint(
    definingClass = "Lcom/inmobi/sdk/InMobiInitProvider;",
    name = "onCreate",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/inmobi/sdk/InMobiSdk;",
            name = "initFromContentProvider"
        )
    )
)

// MobileAdsInitProvider.onCreate currently returns 0 in 24.5, but keep fingerprint for future
internal object MobileAdsInitProviderFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/MobileAdsInitProvider;",
    name = "onCreate",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf()
)

// React Native AppLovin MAX bridge - the JS entry points for ads
internal object AppLovinMAXInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/reactnative/AppLovinMAXModule;",
    name = "initialize",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Lcom/facebook/react/bridge/Promise;")
)

internal object AppLovinMAXLoadInterstitialFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/reactnative/AppLovinMAXModule;",
    name = "loadInterstitial",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Ljava/lang/String;")
)

internal object AppLovinMAXShowInterstitialFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/reactnative/AppLovinMAXModule;",
    name = "showInterstitial",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;")
)

internal object AppLovinMAXLoadRewardedAdFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/reactnative/AppLovinMAXModule;",
    name = "loadRewardedAd",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Ljava/lang/String;")
)

internal object AppLovinMAXShowRewardedAdFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/reactnative/AppLovinMAXModule;",
    name = "showRewardedAd",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;")
)

internal object AppLovinMAXIsInterstitialReadyFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/reactnative/AppLovinMAXModule;",
    name = "isInterstitialReady",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Ljava/lang/String;", "Lcom/facebook/react/bridge/Promise;")
)

internal object AppLovinMAXIsRewardedAdReadyFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/reactnative/AppLovinMAXModule;",
    name = "isRewardedAdReady",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Ljava/lang/String;", "Lcom/facebook/react/bridge/Promise;")
)

internal object AppLovinMAXLoadAppOpenAdFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/reactnative/AppLovinMAXModule;",
    name = "loadAppOpenAd",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Ljava/lang/String;")
)

internal object AppLovinMAXShowAppOpenAdFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/reactnative/AppLovinMAXModule;",
    name = "showAppOpenAd",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;")
)

internal object AppLovinMAXCreateBannerFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/reactnative/AppLovinMAXModule;",
    name = "createBanner",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z")
)

internal object AppLovinMAXCreateMRecFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/reactnative/AppLovinMAXModule;",
    name = "createMRec",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;")
)

// Additional ad view managers - hide banner/MREC views
internal object AppLovinMAXAdViewFingerprint : Fingerprint(
    definingClass = "Lcom/applovin/reactnative/AppLovinMAXAdView;",
    // any method constructing view - use class fingerprint fallback
    filters = listOf(
        string("AppLovinMAXAdView")
    )
)
