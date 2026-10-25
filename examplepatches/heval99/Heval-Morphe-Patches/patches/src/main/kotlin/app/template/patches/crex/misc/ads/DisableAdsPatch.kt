package app.template.patches.crex.misc.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
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
private val GMA_LOADERS = mapOf(
    "${GMA}interstitial/InterstitialAd;" to GMA_LOAD_CALLBACK,
    "${GMA}interstitial/InterstitialAd\$Companion;" to GMA_LOAD_CALLBACK,
    "${GMA}rewarded/RewardedAd;" to GMA_LOAD_CALLBACK,
    "${GMA}rewarded/RewardedAd\$Companion;" to GMA_LOAD_CALLBACK,
    "${GMA}rewardedinterstitial/RewardedInterstitialAd\$Companion;" to GMA_LOAD_CALLBACK,
    "${GMA}appopen/AppOpenAd;" to GMA_LOAD_CALLBACK,
    "${GMA}appopen/AppOpenAd\$Companion;" to GMA_LOAD_CALLBACK,
    "${GMA}nativead/NativeAdLoader;" to GMA_NATIVE_CALLBACK,
    "${GMA}nativead/NativeAdLoader\$Companion;" to GMA_NATIVE_CALLBACK,
    "${GMA}banner/AdView;" to GMA_LOAD_CALLBACK,
)

// Parth Ads, CREX's own ad exchange (parthadex.com house and direct-sold ads). The class name is
// kept; every public load method takes one of its typed *LoadCallback listeners.
private const val PARTH_AD_REQUEST = "Lcom/parth/ads/AdRequest;"

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
        GMA_LOADERS.forEach { (owner, callback) ->
            neuter(owner, "GMA load") { callback in it.params() }
        }

        // 2. Parth Ads: banner, inline/native, interstitial, app-open, prediction and poll ads.
        neuter(PARTH_AD_REQUEST, "Parth ad load") { method ->
            AccessFlags.PUBLIC.isSet(method.accessFlags) && !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.params().any { it.endsWith("LoadCallback;") }
        }

        // 3. Meta Audience Network: both loadAd overloads.
        neuter(FAN_AD_VIEW, "AdView.loadAd") { it.name == "loadAd" }
    }
}
