package app.template.patches.offerup

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * OfferUp 2026.38.0 first-party ads wrappers. Class names in `com.offerup.ads`
 * are not R8-obfuscated, so definingClass + name + parameters is enough.
 */
object BannerSetRequestFingerprint : Fingerprint(
    definingClass = "Lcom/offerup/ads/banner/OUGoogleAdBannerView;",
    name = "setRequest",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/ReadableMap;"),
)

object InterstitialSetRequestFingerprint : Fingerprint(
    definingClass = "Lcom/offerup/ads/interstitial/OUGoogleInterstitialAdView;",
    name = "setRequest",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Lcom/facebook/react/bridge/ReadableMap;"),
)

object GoogleAdManagerConfigureFingerprint : Fingerprint(
    definingClass = "Lcom/offerup/ads/OUGoogleAdManager;",
    name = "configure",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Lcom/facebook/react/bridge/ReadableMap;",
        "Lcom/facebook/react/bridge/Promise;",
    ),
)

object GoogleAdManagerLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/offerup/ads/OUGoogleAdManager;",
    name = "loadAd",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Lcom/facebook/react/bridge/ReadableMap;",
        "Lcom/facebook/react/bridge/Promise;",
    ),
)

object GoogleAdManagerIsAdCachedFingerprint : Fingerprint(
    definingClass = "Lcom/offerup/ads/OUGoogleAdManager;",
    name = "isAdCached",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Lcom/facebook/react/bridge/ReadableMap;",
        "Lcom/facebook/react/bridge/Promise;",
    ),
)

object PrebidBootstrapInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/offerup/ads/prebid/PrebidBootstrap;",
    name = "initialize",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

object NimbusInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/adsbynimbus/Nimbus;",
    name = "initialize",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
)

object NimbusInitializeWithComponentsFingerprint : Fingerprint(
    definingClass = "Lcom/adsbynimbus/Nimbus;",
    name = "initialize",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/util/Set;",
    ),
)
