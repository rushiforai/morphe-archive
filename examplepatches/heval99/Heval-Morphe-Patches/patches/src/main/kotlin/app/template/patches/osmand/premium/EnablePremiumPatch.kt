package app.template.patches.osmand.premium

import app.morphe.patcher.patch.BytecodePatchContext
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

private val LOCAL_GATES = listOf(
    "isPurchasedLocalFullVersion",
    "isPurchasedLocalDeepContours",
    "isSubscribedToLocalLiveUpdates",
    "isSubscribedToLocalMaps",
    "isSubscribedToLocalOsmAndPro",
)

private fun BytecodePatchContext.booleanMethods(type: String, names: Collection<String>): List<MutableMethod> =
    mutableClassDefByOrNull(type)?.methods.orEmpty()
        .filter { it.implementation != null }
        .filter { it.name in names && it.returnType == "Z" }

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks OsmAnd Pro, Maps+ and live updates."
) {
    compatibleWith(COMPATIBILITY_OSMAND)

    execute {
        // Any SKU lookup answers purchased.
        booleanMethods(HELPER, listOf("isPurchased")).forEach { it.returnEarly(true) }

        // The cached local entitlements used by the feature gates.
        booleanMethods(HELPER_IMPL, LOCAL_GATES).forEach { it.returnEarly(true) }
    }
}
