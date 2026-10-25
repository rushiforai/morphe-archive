package app.template.patches.scores365.misc.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_365SCORES
import app.template.patches.shared.misc.ads.neutraliseMobileAdsStatics
import com.android.tools.smali.dexlib2.iface.ClassDef

// The app's own ad gates. Declared on an R8-renamed interface and implemented by the readable
// base activities (BaseActionBarActivity, BottomNavigationActivity, SingleEntityDashboardActivity,
// GameCenterBaseActivity, WebViewActivity) plus a few R8-renamed classes. The names survive R8,
// so every concrete override is found by name and shape.
private val APP_AD_GATES = setOf("showAdsForContext", "isBannerNeedToBeShown")
private const val BASE_ACTION_BAR_ACTIVITY = "Lcom/scores365/Design/Activities/BaseActionBarActivity;"

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_365SCORES)

    execute {
        // Google Mobile Ads (AdMob) is the primary ad network, loaded through the Blaze GAM SDK
        // wrapper; without MobileAds.initialize no GAM-mediated format (banner, interstitial,
        // rewarded, native) or mediated network loads. Both initialize overloads are entry points,
        // and every other MobileAds static void is neutered too, since they throw without init
        // (AGENTS.md rule 9).
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
