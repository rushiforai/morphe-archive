package app.template.patches.smartwod.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_SMARTWOD
import app.template.patches.shared.addInstructionsChecked

// SmartWOD Timer is React Native + Hermes. Ads are Google Mobile Ads only, driven from JS
// through the react-native-google-mobile-ads native module. The patch hooks the stable GMA
// library surface (the SDK never initializes, every load becomes a no-op, so no load callback
// ever fires) and makes the RN module's initialize() resolve its JS promise without starting the
// SDK. GMA's setAppMuted/setAppVolume/openDebugMenu throw IllegalStateException when the SDK was
// never initialized, and the RN module calls them, so they become no-ops too. The UMP consent
// module is left untouched.
private const val GMA = "Lcom/google/android/gms/ads/"

// Every concrete void method named one of [names] in [owner]. Fails loudly when the class or the
// methods are gone, so a library update cannot silently no-op the patch.
private fun BytecodePatchContext.concreteVoidMethods(
    owner: String,
    vararg names: String,
): List<MutableMethod> =
    mutableClassDefBy(owner).methods
        .filter { it.implementation != null && it.returnType == "V" && it.name in names }
        .also { require(it.isNotEmpty()) { "no concrete ${names.joinToString("/")} in $owner" } }

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_SMARTWOD)

    execute {
        // 1. JS mobileAds().initialize() resolves with an empty adapter list instead of starting
        //    the SDK, so any JS awaiting it carries on.
        RnMobileAdsInitializeFingerprint.method.addInstructionsChecked(
            0,
            """
                invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;
                move-result-object v0
                invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                return-void
            """,
        )

        // 2. Never initialize or preload the SDK (both initialize overloads are entry points), and
        //    neuter the setters that throw when the SDK was never initialized.
        for (name in listOf(
            "initialize",
            "startPreload",
            "setAppMuted",
            "setAppVolume",
            "openDebugMenu",
        )) {
            concreteVoidMethods(GMA + "MobileAds;", name).forEach { it.returnEarly() }
        }

        // 3. Every load becomes a no-op (all overloads). AdView only inherits loadAd from
        //    BaseAdView; AdLoader also exposes the multi-load loadAds.
        for (relative in listOf(
            "BaseAdView",
            "AdLoader",
            "interstitial/InterstitialAd",
            "rewarded/RewardedAd",
            "rewardedinterstitial/RewardedInterstitialAd",
            "appopen/AppOpenAd",
            "admanager/AdManagerAdView",
            "admanager/AdManagerInterstitialAd",
        )) {
            concreteVoidMethods("$GMA$relative;", "load", "loadAd", "loadAds")
                .forEach { it.returnEarly() }
        }
    }
}
