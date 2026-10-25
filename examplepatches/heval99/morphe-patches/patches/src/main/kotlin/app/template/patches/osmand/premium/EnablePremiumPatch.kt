package app.template.patches.osmand.premium

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_OSMAND

// OsmAnd's in-app layer is not obfuscated. The abstract InAppPurchaseHelper has a concrete
// isPurchased(String) that walks the purchase list, and InAppPurchaseHelperImpl answers the
// local entitlement getters. applyPurchases() derives the OSMAND_PRO_PURCHASED /
// OSMAND_MAPS_PURCHASED / LIVE_UPDATES_PURCHASED settings from these same getters, so forcing
// them also makes the writer keep the settings true instead of resetting them.
private const val HELPER = "Lnet/osmand/plus/inapp/InAppPurchaseHelper;"
private const val HELPER_IMPL = "Lnet/osmand/plus/inapp/InAppPurchaseHelperImpl;"

// Android Auto has its own gate: true for 10 days after install/update, then only for paid
// builds or saved *_PURCHASED settings (filled after an inventory cycle). NavigationSession
// shows RequestPurchaseScreen when it is false.
private const val PURCHASE_UTILS = "Lnet/osmand/plus/inapp/InAppPurchaseUtils;"

private val LOCAL_GATES = listOf(
    "isPurchasedLocalFullVersion",
    "isPurchasedLocalDeepContours",
    "isSubscribedToLocalLiveUpdates",
    "isSubscribedToLocalMaps",
    "isSubscribedToLocalOsmAndPro",
)

/**
 * The concrete boolean methods of [type] named in [names]. Every name must be found: every class
 * and all getters are mandatory, so a rename or a moved method fails the patch instead of
 * leaving a gate unforced.
 */
private fun BytecodePatchContext.booleanMethods(type: String, names: Collection<String>): List<MutableMethod> {
    val methods = mutableClassDefBy(type).methods
        .filter { it.implementation != null }
        .filter { it.name in names && it.returnType == "Z" }
    val missing = names.toSet() - methods.map { it.name }.toSet()
    if (missing.isNotEmpty()) throw PatchException("$type has no concrete boolean $missing")
    return methods
}

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks OsmAnd Pro, Maps+ and Android Auto."
) {
    compatibleWith(COMPATIBILITY_OSMAND)

    execute {
        // Any SKU lookup answers purchased.
        booleanMethods(HELPER, listOf("isPurchased")).forEach { it.returnEarly(true) }

        // The cached local entitlements used by the feature gates.
        booleanMethods(HELPER_IMPL, LOCAL_GATES).forEach { it.returnEarly(true) }

        // Android Auto stays available after the 10-day grace period.
        booleanMethods(PURCHASE_UTILS, listOf("isAndroidAutoAvailable")).forEach { it.returnEarly(true) }
    }
}
