package app.template.patches.pimusicplayer.misc.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.COMPATIBILITY_PIMUSICPLAYER
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.misc.ads.GMA_LOAD_HOOKS
import app.template.patches.shared.misc.ads.GMA_REWARDED_AD
import app.template.patches.shared.misc.ads.MAX_LOAD_SHOW_HOOKS
import app.template.patches.shared.misc.ads.hideMaxAdView
import app.template.patches.shared.misc.ads.neuterAdHooks
import app.template.patches.shared.misc.ads.neutraliseMobileAdsStatics
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

// Pi Music Player mediates ads through AppLovin MAX (banner waterfall, interstitials) plus
// Google Mobile Ads (adaptive banners, natives, interstitials and the rewarded "watch a video
// for temporary ad-free" offer). The patch hooks the stable library surfaces; every hook except
// the MobileAds statics is mandatory and fails loudly.
private const val ADS = "Lcom/google/android/gms/ads/"
private const val LOAD_CALLBACK = "${ADS}AdLoadCallback;"
private const val LOAD_ERROR = "${ADS}LoadAdError;"
private const val FAIL_LOAD = "disableAdsFailLoad"
private const val STRING = "Ljava/lang/String;"

private val PI_HOOKS = mapOf(
    // The app starts MAX itself through the static initializeSdk(Context, listener). Nothing
    // but ads waits on it: the listener sets the "ad SDKs ready" flag that gates every ad
    // preload, the banner dispatch and the interstitial helper, which then never run.
    "Lcom/applovin/sdk/AppLovinSdk;" to setOf("initialize", "initializeSdk"),
    "Lcom/applovin/mediation/ads/MaxRewardedInterstitialAd;" to setOf("loadAd", "showAd"),
)

/**
 * GMA RewardedAd.load answers with an immediate onAdFailedToLoad (code 3, no fill) instead of a
 * silent no-op. The "watch a video ad" entry in the remove-ads sheet preloads one rewarded ad and,
 * when tapped before that load finished, hides its cards behind a spinner until a load callback
 * arrives. A silent no-op would leave that spinner up for good; the failure walks the app's
 * waterfall to its "all loads failed" path, which shows its "issue loading your ad" toast
 * (problem_loading_rewarded_ad) and closes the sheet, both when tapped during and after the
 * preload. The callback runs on the caller's thread (the app loads on the main thread, where
 * GMA delivers callbacks too).
 */
private fun BytecodePatchContext.failRewardedAdLoads() {
    val rewarded = mutableClassDefBy(GMA_REWARDED_AD)
    val loads = rewarded.methods.filter {
        it.name == "load" && it.returnType == "V" && it.implementation != null &&
            AccessFlags.STATIC.isSet(it.accessFlags) &&
            it.parameterTypes.lastOrNull()?.toString() == "${ADS}rewarded/RewardedAdLoadCallback;"
    }
    if (loads.isEmpty()) throw PatchException("Disable ads: no static $GMA_REWARDED_AD->load(..., callback)")

    // LoadAdError's only constructor takes five arguments, so it needs a /range invoke over six
    // free registers; load() has only six in all, one of them the callback. A helper with its
    // own frame builds the error. The constructor must exist as written, or the helper would
    // throw NoSuchMethodError on the first rewarded load.
    val errorInitParameters = listOf("I", STRING, STRING, "${ADS}AdError;", "${ADS}ResponseInfo;")
    if (classDefBy(LOAD_ERROR).methods.none {
            it.name == "<init>" && it.returnType == "V" &&
                it.parameterTypes.map(CharSequence::toString) == errorInitParameters
        }
    ) {
        throw PatchException("Disable ads: no $LOAD_ERROR-><init>(${errorInitParameters.joinToString("")})V")
    }
    rewarded.methods.add(
        ImmutableMethod(
            rewarded.type,
            FAIL_LOAD,
            listOf(ImmutableMethodParameter(LOAD_CALLBACK, null, null)),
            "V",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(7),
        ).toMutable().apply {
            addInstructionsChecked(
                0,
                """
                    if-eqz p0, :done
                    new-instance v0, $LOAD_ERROR
                    const/4 v1, 0x3
                    const-string v2, "No fill."
                    const-string v3, "com.google.android.gms.ads"
                    const/4 v4, 0x0
                    const/4 v5, 0x0
                    invoke-direct/range {v0 .. v5}, $LOAD_ERROR-><init>(${errorInitParameters.joinToString("")})V
                    invoke-virtual {p0, v0}, $LOAD_CALLBACK->onAdFailedToLoad($LOAD_ERROR)V
                    :done
                    return-void
                """.trimIndent(),
            )
        },
    )

    loads.forEach { load ->
        val callback = "p${load.parameterTypes.size - 1}"
        load.addInstructionsChecked(
            0,
            """
                invoke-static {$callback}, ${rewarded.type}->$FAIL_LOAD($LOAD_CALLBACK)V
                return-void
            """.trimIndent(),
        )
    }
}

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_PIMUSICPLAYER)

    execute {
        // 1. Neuter the MobileAds statics that throw without init (AGENTS.md rule 9). Optional:
        // the app never calls MobileAds.initialize itself (only MAX's Google adapter would, and
        // MAX never starts), so this is a guard, not an anchor.
        neutraliseMobileAdsStatics()

        // 2. MAX init, MAX rewarded interstitials (present only in this app's SDK build).
        neuterAdHooks(PI_HOOKS)

        // 3. Every GMA and MAX load/show entry point: MaxAdView loadAd + startAutoRefresh (the
        // banner waterfall and the exit-sheet ad), BaseAdView.loadAd (adaptive banners),
        // AdLoader (natives), interstitials. RewardedAd.load is step 4.
        neuterAdHooks((GMA_LOAD_HOOKS - GMA_REWARDED_AD) + MAX_LOAD_SHOW_HOOKS)

        // 4. Rewarded loads fail at once, so the remove-ads sheet never hangs on its spinner.
        failRewardedAdLoads()

        // 5. Unfilled MAX banner views stay GONE.
        hideMaxAdView()
    }
}
