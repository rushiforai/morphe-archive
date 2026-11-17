package app.template.patches.droidcam.misc.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_DROIDCAM
import com.android.tools.smali.dexlib2.AccessFlags
import app.template.patches.shared.misc.ads.MAX_LOAD_SHOW_HOOKS
import app.template.patches.shared.misc.ads.hideMaxAdView
import app.template.patches.shared.misc.ads.neuterAdHooks
import app.template.patches.shared.misc.ads.neutraliseMobileAdsStatics

/**
 * DroidCam calls Google Mobile Ads directly: its ad manager runs MobileAds.initialize on a
 * background thread after UMP consent, then BaseAdView.loadAd, AppOpenAd.load/show and
 * RewardedAd.load/show. AppLovin, InMobi and Vungle are GMA mediation adapters
 * (com.google.ads.mediation.*); the only MAX caller is GMA's AppLovin waterfall app-open adapter.
 *
 * The ad manager is ready only when initialised && canRequestAds() && adRequest != null, and the
 * adRequest is only set in the OnInitializationCompleteListener, so the no-op MobileAds.initialize
 * is the main block. The shape-matched GMA loads are the second layer, and the AppLovin MAX / InMobi
 * SDK initialisers plus the MAX load/show hooks cover the mediation side.
 */
private val SDK_INIT_HOOKS = mapOf(
    "Lcom/applovin/sdk/AppLovinSdk;" to setOf("initialize"),
    "Lcom/inmobi/sdk/InMobiSdk;" to setOf("init"),
)

// Since 10.0 the app ships the GMA public API with unicode method names (the class names are still
// intact), so GMA's load entry points cannot be anchored by name. Their shape is stable: a concrete
// void on the ad classes taking an AdRequest / AdManagerAdRequest is a load. The app calls GMA
// directly, so this is the second layer behind the no-op MobileAds.initialize.
private const val GMA = "Lcom/google/android/gms/ads/"
private val GMA_REQUIRED_CLASSES = setOf(
    GMA + "BaseAdView;",
    GMA + "appopen/AppOpenAd;",
    GMA + "rewarded/RewardedAd;",
)
private val GMA_LOAD_CLASSES = listOf(
    GMA + "BaseAdView;",
    GMA + "AdView;",
    GMA + "admanager/AdManagerAdView;",
    GMA + "AdLoader;",
    GMA + "interstitial/InterstitialAd;",
    GMA + "admanager/AdManagerInterstitialAd;",
    GMA + "rewarded/RewardedAd;",
    GMA + "rewardedinterstitial/RewardedInterstitialAd;",
    GMA + "appopen/AppOpenAd;",
)
private val GMA_REQUEST_TYPES = setOf(GMA + "AdRequest;", GMA + "admanager/AdManagerAdRequest;")

private fun BytecodePatchContext.neuterGmaLoadsByShape() {
    for (type in GMA_LOAD_CLASSES) {
        val cls = mutableClassDefByOrNull(type)
        if (cls == null) {
            if (type in GMA_REQUIRED_CLASSES) throw PatchException("Disable ads: $type not found")
            continue
        }
        val loads = cls.methods.filter { method ->
            !method.name.startsWith("<") && method.returnType == "V" && method.implementation != null &&
                method.parameterTypes.any { it.toString() in GMA_REQUEST_TYPES }
        }
        if (loads.isEmpty() && type in GMA_REQUIRED_CLASSES) {
            throw PatchException("Disable ads: no GMA load entry point on $type")
        }
        loads.forEach { it.returnEarly() }
    }
}

// MobileAds.initialize(Context, OnInitializationCompleteListener) is the main block; require it by
// shape so a future SDK change that drops it fails the patch (it is neutralised with the other statics).
private fun BytecodePatchContext.requireMobileAdsInitialize() {
    val mobileAds = mutableClassDefBy(GMA + "MobileAds;")
    val found = mobileAds.methods.any { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
            method.implementation != null &&
            method.parameterTypes.map { it.toString() } == listOf(
                "Landroid/content/Context;",
                GMA + "initialization/OnInitializationCompleteListener;",
            )
    }
    if (!found) throw PatchException("Disable ads: no MobileAds.initialize(Context, listener) found")
}

internal fun BytecodePatchContext.disableDroidCamAds() {
    neuterAdHooks(SDK_INIT_HOOKS)
    // MobileAds.initialize is unicode-named since 10.0: no required name, every concrete static
    // void on the class is neutralised (rule 9), which includes it; the shape check keeps it loud.
    requireMobileAdsInitialize()
    if (!neutraliseMobileAdsStatics()) throw PatchException("Disable ads: MobileAds not found")
    neuterGmaLoadsByShape()
    neuterAdHooks(MAX_LOAD_SHOW_HOOKS)
    hideMaxAdView()
}

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads.",
) {
    compatibleWith(COMPATIBILITY_DROIDCAM)

    execute {
        disableDroidCamAds()
    }
}
