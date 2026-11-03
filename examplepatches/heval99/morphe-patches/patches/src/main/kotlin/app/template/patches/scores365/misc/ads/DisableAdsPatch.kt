package app.template.patches.scores365.misc.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_365SCORES
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// 14.9.8 replaced the Google Mobile Ads classes with the next-gen Ads SDK, which is compiled
// into the app and R8-renamed to ads_mobile_sdk.*. There is no stable SDK class left to hook
// (only the manifest-kept common.AdActivity), so Disable ads works at the app layer instead.
//
// EntitlementRepository (14.9.8: uej) has two no-arg boolean gates that every ad path asks:
//   - the "ads removed" gate, which logs "isUserAdsRemoved=" (EntFlow) - uej.e() in 14.9.8,
//     eoi.e() in 14.9.7;
//   - its sibling, which reads forceShowAds + IsUserRemovedAdsPackageBuying and does not log the
//     isUserAdsRemoved line - uej.a() in 14.9.8, eoi.a() in 14.9.7.
// Every banner, interstitial, in-feed/MPU, AllScores and betting-promo path checks them through
// uej.c ("showAds=") and uej.d. Forcing both true makes the app behave as if ads were removed,
// which also blocks the betting promos (BPMB).
private const val ADS_REMOVED = "isUserAdsRemoved="
private const val FORCE_SHOW_ADS = "forceShowAds"
private const val PURCHASE_FLAG = "IsUserRemovedAdsPackageBuying"

// The app's own ad gates. Declared on an R8-renamed interface and implemented by readable base
// activities (GameCenterBaseActivity, BottomNavigationActivity, WebViewActivity, ...) plus a few
// R8-renamed classes. 14.9.8 renamed BaseActionBarActivity to u41, so the presence check uses
// GameCenterBaseActivity, which still survives R8.
private val APP_AD_GATES = setOf("showAdsForContext", "isBannerNeedToBeShown")
private const val GATE_ACTIVITY = "Lcom/scores365/gameCenter/GameCenterBaseActivity;"

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_365SCORES)

    execute {
        // 1. The two entitlement gates answer "ads removed".
        var gateOwner: String? = null
        classDefForEach { classDef ->
            if (gateOwner == null && classDef.methods.any { it.isEntitlementGate() }) gateOwner = classDef.type
        }
        val ownerType = gateOwner ?: throw PatchException("Disable ads: no ()Z gate logging $ADS_REMOVED")
        val gates = mutableClassDefBy(ownerType).methods.filter {
            it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
        }
        val removedGate = gates.singleOrNull { it.strings().contains(ADS_REMOVED) }
            ?: throw PatchException("Disable ads: no single $ownerType ()Z with $ADS_REMOVED")
        val siblingGate = gates.singleOrNull { method ->
            method !== removedGate &&
                !method.strings().contains(ADS_REMOVED) &&
                method.strings().containsAll(listOf(FORCE_SHOW_ADS, PURCHASE_FLAG))
        } ?: throw PatchException("Disable ads: no single $ownerType ()Z reading $FORCE_SHOW_ADS + $PURCHASE_FLAG")
        removedGate.returnEarly(true)
        siblingGate.returnEarly(true)

        // 2. The per-activity gates answer false, so no banner slot or interstitial is requested
        // and the layout keeps no empty ad space.
        val owners = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.methods.any { it.isAppAdGate() }) owners += classDef
        }
        if (owners.none { it.type == GATE_ACTIVITY }) {
            throw PatchException("$GATE_ACTIVITY no longer implements the app ad gates")
        }
        for (owner in owners) {
            mutableClassDefBy(owner).methods.filter { it.isAppAdGate() }.forEach { it.returnEarly(false) }
        }
    }
}

private fun Method.isAppAdGate() =
    name in APP_AD_GATES && returnType == "Z" && parameterTypes.isEmpty() && implementation != null

private fun Method.isEntitlementGate() =
    returnType == "Z" && parameterTypes.isEmpty() && implementation != null && strings().contains(ADS_REMOVED)

private fun Method.strings(): List<String> =
    implementation?.instructions?.toList().orEmpty().mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }
