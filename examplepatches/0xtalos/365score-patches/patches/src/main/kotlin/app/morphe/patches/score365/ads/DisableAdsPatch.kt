package app.morphe.patches.score365.ads

import app.morphe.patches.score365.utils.COMPATIBILITY_365SCORE
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.iface.ClassDef

private val APP_AD_GATES = setOf("showAdsForContext", "isBannerNeedToBeShown")
private const val BASE_ACTION_BAR_ACTIVITY = "Lcom/scores365/Design/Activities/BaseActionBarActivity;"

/**
 * Disables Google Mobile Ads (AdMob) initialization and the app's own ad placements,
 * removing banner, interstitial, rewarded, native and mediated ads.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables Google Mobile Ads (AdMob) initialization and the app's own ad " +
        "placements, removing banner, interstitial, rewarded, native and mediated ads.",
) {
    compatibleWith(*COMPATIBILITY_365SCORE)

    execute {
        // Google Mobile Ads (AdMob) is the primary ad network, loaded through the Blaze GAM SDK wrapper;
        // without MobileAds.initialize no GAM-mediated format loads and AdMob never initializes or prompts for updates.
        neutraliseMobileAdsStatics("initialize")

        // The app-side gates return false, so no banner slot or interstitial is ever requested
        // and the layout keeps no empty ad space.
        val owners = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.methods.any { it.isAppAdGate() }) owners += classDef
        }
        if (owners.none { it.type == BASE_ACTION_BAR_ACTIVITY }) {
            throw PatchException("$BASE_ACTION_BAR_ACTIVITY no longer implements the app ad gates")
        }
        for (owner in owners) {
            mutableClassDefBy(owner).methods.filter { it.isAppAdGate() }.forEach { it.returnEarly(false) }
        }
    }
}

private fun com.android.tools.smali.dexlib2.iface.Method.isAppAdGate() =
    name in APP_AD_GATES && returnType == "Z" && parameterTypes.isEmpty() && implementation != null
