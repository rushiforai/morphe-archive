package app.template.patches.guardian.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_GUARDIAN
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.AccessFlags

private const val GMA = "Lcom/google/android/gms/ads/"
private val LOAD_AD_ERROR_INIT = listOf(
    "I",
    "Ljava/lang/String;",
    "Ljava/lang/String;",
    "${GMA}AdError;",
    "${GMA}ResponseInfo;",
)

/**
 * Every Google Ad Manager slot in The Guardian loads through one method, and the app's own "no
 * ads" path (the one premium subscribers get) runs through ShouldLoadAds. The patch takes both:
 * no ad request or Amazon APS bid is made (each slot gets the app's usual load failure), and
 * article HTML and the article pager are built without ad slots.
 * MobileAds is not touched (AGENTS.md rule 9) and isPremium / UserTier are not forced, so premium
 * features stay locked.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_GUARDIAN)

    execute {
        // The GMA calls the step 1 prologue makes must exist in this SDK version.
        val gmaCalls = mapOf(
            "${GMA}LoadAdError;" to ("<init>" to LOAD_AD_ERROR_INIT),
            "${GMA}BaseAdView;" to ("getAdListener" to emptyList()),
            "${GMA}AdListener;" to ("onAdFailedToLoad" to listOf("${GMA}LoadAdError;")),
        )
        gmaCalls.forEach { (type, call) ->
            val (name, parameters) = call
            val found = classDefBy(type).methods.any { method ->
                method.name == name && method.parameterTypes.map(CharSequence::toString) == parameters
            }
            if (!found) throw PatchException("$type->$name(${parameters.joinToString("")}) not found")
        }

        // 1. The ad load reports a load failure to the view's AdListener and returns, the same
        // way its own consent and "Forced ad failure" paths do, before the GMA request and the
        // Amazon APS bid. On failure the app's listeners set front advert cards and MPU views to
        // GONE and mark interstitial pages as failed.
        LoadAdFingerprint.method.apply {
            // p-register of the AdManagerAdView (second) parameter: static methods have no `this`.
            val first = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
            val words = parameterTypes.map { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
            val adView = first + words[0]
            val locals = implementation!!.registerCount - words.sum() - first
            if (locals < 7) throw PatchException("The ad load method has only $locals locals")
            addInstructionsWithLabelsChecked(
                0,
                """
                    invoke-virtual/range {p$adView .. p$adView}, ${GMA}BaseAdView;->getAdListener()${GMA}AdListener;
                    move-result-object v0
                    if-eqz v0, :skip
                    new-instance v1, ${GMA}LoadAdError;
                    const/4 v2, 0x3
                    const-string v3, "Ads disabled"
                    const-string v4, "com.guardian"
                    const/4 v5, 0x0
                    const/4 v6, 0x0
                    invoke-direct/range {v1 .. v6}, ${GMA}LoadAdError;-><init>(ILjava/lang/String;Ljava/lang/String;${GMA}AdError;${GMA}ResponseInfo;)V
                    invoke-virtual {v0, v1}, ${GMA}AdListener;->onAdFailedToLoad(${GMA}LoadAdError;)V
                    :skip
                    return-void
                """
            )
        }

        // 2. The app's "ads on" check answers false, so articles get no MPU placeholders and no
        // interstitial pages are inserted between articles.
        val shouldLoadAds = ShouldLoadAdsFingerprint.matchAllOrNull().orEmpty()
        if (shouldLoadAds.size != 1) {
            throw PatchException(
                "Expected one ShouldLoadAds, found " +
                    shouldLoadAds.map { "${it.classDef.type}->${it.method.name}" },
            )
        }
        shouldLoadAds.single().method.returnEarly(false)
    }
}
