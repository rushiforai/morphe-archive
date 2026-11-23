package app.template.patches.crex.misc.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_CREX
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

private const val GMA = "Lcom/google/android/libraries/ads/mobile/sdk/"
private const val GMA_LOAD_CALLBACK = "${GMA}common/AdLoadCallback;"
private const val GMA_NATIVE_CALLBACK = "${GMA}nativead/NativeAdLoaderCallback;"

// Google Mobile Ads next-gen SDK: class names are public API and kept, the load methods are
// R8-renamed (a/b/c/f), so they are matched by their load-callback parameter. Each format has a
// static entry point on the ad class and the Companion it delegates to; the banner loads through
// AdView. Every other network in the app (Crackle, Pangle, Mintegral, IronSource, Unity, Vungle,
// InMobi, Digital Turbine, PubMatic, Amazon bids) is only reached through GMA mediation.
// R8 may drop the interface-level static delegate (26.11.04 no longer has it on InterstitialAd,
// AppOpenAd and NativeAdLoader), so each format needs at least one of its owners to carry a load.
private val GMA_LOADERS = listOf(
    listOf("${GMA}interstitial/InterstitialAd;", "${GMA}interstitial/InterstitialAd\$Companion;") to GMA_LOAD_CALLBACK,
    listOf("${GMA}rewarded/RewardedAd;", "${GMA}rewarded/RewardedAd\$Companion;") to GMA_LOAD_CALLBACK,
    listOf("${GMA}rewardedinterstitial/RewardedInterstitialAd\$Companion;") to GMA_LOAD_CALLBACK,
    listOf("${GMA}appopen/AppOpenAd;", "${GMA}appopen/AppOpenAd\$Companion;") to GMA_LOAD_CALLBACK,
    listOf("${GMA}nativead/NativeAdLoader;", "${GMA}nativead/NativeAdLoader\$Companion;") to GMA_NATIVE_CALLBACK,
    listOf("${GMA}banner/AdView;") to GMA_LOAD_CALLBACK,
)

// Parth Ads, CREX's own ad exchange (parthadex.com house and direct-sold ads). The class name is
// kept; every public load method takes one of its typed *LoadCallback listeners.
private const val PARTH_AD_REQUEST = "Lcom/parth/ads/AdRequest;"

private const val CREX_ADS = "Lin/cricketexchange/app/cricketexchange/ads/"
private val PARTH_WIDGET_LOADERS = listOf(
    "${CREX_ADS}IntegratedPredictionAdLoader;",
    "${CREX_ADS}PredictionPollsAdLoader;",
)
private val PARTH_WIDGET_LOAD_PARAMS = listOf("Landroid/app/Activity;", "Landroid/content/Context;", "Lorg/json/JSONObject;")

// Meta Audience Network banner, loaded directly by the inline native/banner loaders.
private const val FAN_AD_VIEW = "Lcom/facebook/ads/AdView;"

private fun Method.params() = parameterTypes.map(CharSequence::toString)

private fun BytecodePatchContext.neuter(owner: String, label: String, predicate: (Method) -> Boolean) {
    val targets = mutableClassDefBy(owner).methods.filter { method ->
        method.implementation != null && method.returnType == "V" && predicate(method)
    }
    if (targets.isEmpty()) throw PatchException("No $label entry point found on $owner")
    targets.forEach { it.returnEarly() }
}

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads. Rewarded videos no longer give rewards."
) {
    compatibleWith(COMPATIBILITY_CREX)

    execute {
        // 1. Google Mobile Ads (next-gen): every load returns without requesting an ad.
        GMA_LOADERS.forEach { (owners, callback) ->
            var neutered = 0
            owners.forEach { owner ->
                val cls = mutableClassDefByOrNull(owner) ?: return@forEach
                cls.methods.filter { method ->
                    method.implementation != null && method.returnType == "V" && callback in method.params()
                }.forEach {
                    it.returnEarly()
                    neutered++
                }
            }
            if (neutered == 0) throw PatchException("No GMA load entry point found on ${owners.joinToString()}")
        }

        // 2. Parth Ads: banner, inline/native, interstitial, app-open, prediction and poll ads.
        neuter(PARTH_AD_REQUEST, "Parth ad load") { method ->
            AccessFlags.PUBLIC.isSet(method.accessFlags) && !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.params().any { it.endsWith("LoadCallback;") }
        }

        // 2b. The integrated-prediction and prediction-polls widgets build their own com.parth.ads.a
        // request (parthadex.com getAdForAdUnit) without going through AdRequest. Their app loaders
        // have kept names and one (Activity, Context, JSONObject) load method each.
        PARTH_WIDGET_LOADERS.forEach { owner ->
            neuter(owner, "Parth widget ad load") { it.params() == PARTH_WIDGET_LOAD_PARAMS }
        }

        // 3. Meta Audience Network: both loadAd overloads.
        neuter(FAN_AD_VIEW, "AdView.loadAd") { it.name == "loadAd" }
    }
}
