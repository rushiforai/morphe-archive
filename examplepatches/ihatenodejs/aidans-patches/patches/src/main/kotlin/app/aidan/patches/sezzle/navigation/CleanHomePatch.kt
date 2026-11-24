package app.aidan.patches.sezzle.navigation

import app.aidan.patches.sezzle.shared.Constants.COMPATIBILITY_SEZZLE
import app.aidan.patches.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch

private val LOAD_CONST_NULL_RET_R0 = byteArrayOf(0x94.toByte(), 0x00, 0x76, 0x00)

/**
 * Replaces a Hermes component with `return null`. The first four bytes are
 * overwritten, so the function's original prologue is irrelevant and the rest
 * of its body becomes unreachable.
 */
private fun HermesBundleEditor.stubComponent(functionName: String) {
    val offsets = findFunctionOffsetsByName(functionName)
    if (offsets.isEmpty()) {
        throw PatchException("Component '$functionName' not found")
    }
    for (offset in offsets) {
        if (!matchesBytes(offset, LOAD_CONST_NULL_RET_R0)) {
            patchBytes(offset, LOAD_CONST_NULL_RET_R0)
        }
    }
}

/**
 * Trims Sezzle's stock Home (the Shop tab, renamed by Rename Shop to Home) by
 * unmounting its shortcut row, store/brand carousels, and promotional banners.
 */
@Suppress("unused")
val cleanHomePatch = rawResourcePatch(
    name = "Clean Home",
    description = "Removes store/brand carousels and promotional banners from the Home tab, with an optional shortcut-row cleanup.",
    default = true
) {
    category("Interface")
    compatibleWith(COMPATIBILITY_SEZZLE)

    val removeShortcuts = booleanOption(
        key = "removeShortcuts",
        default = false,
        title = "Remove Shortcuts",
        description = "Hides the Your Shortcuts row and its quick-action pills. Disabled by default so the Home tab keeps its shortcuts."
    )

    val removeBrands = booleanOption(
        key = "removeBrands",
        default = true,
        title = "Remove Store and Brand Carousels",
        description = "Removes the store header, category store lists, and brand carousels."
    )

    val removePromotions = booleanOption(
        key = "removePromotions",
        default = true,
        title = "Remove Promotional Banners",
        description = "Removes the Home deal, cashback, and subscription promotional banners."
    )

    val removeSezzleSpendBanner = booleanOption(
        key = "removeSezzleSpendBanner",
        default = false,
        title = "Remove Sezzle Spend Balance Banner",
        description = "Hides the floating Sezzle Spend balance notification. It represents real spendable balance, so this is opt-in."
    )

    execute {
        val bundleFile = get("assets/index.android.bundle")
        if (!bundleFile.exists()) {
            throw PatchException("assets/index.android.bundle not found")
        }

        val editor = HermesBundleEditor(bundleFile.readBytes())

        if (removeShortcuts.value != false) {
            for (component in listOf(
                "ShopTabShortcutsRow",
                "ShopTabShortcutsRowView",
                "ShopTabAlert",
                "EarnSpendPill",
                "VcRewardsPill",
                "RewardChip",
                "StoreHeaderList"
            )) {
                editor.stubComponent(component)
            }
        }

        if (removeBrands.value != false) {
            for (component in listOf(
                "CategoryStoresList",
                "StoresCarousel",
                "RecommendationsCarousel",
                "CircularBrandsList",
                "CircularBrandItem",
                "CircularBrandChrome",
                "CategoryRow",
                "CategoryStoresListHeader",
                "HorizontalVCStoreCategoryPillList",
                "ShopByCategoryScreen",
                "BrazeContentCards",
                "BrazeContentCardItem",
                "VideoContentCard",
                "StoresMultiCategoriesList",
                "HoriztonalMarketPlaceProductsList",
                "HorizontalStoresListHeader",
                "HorizontalStoreBadgeList",
                "VerticalStoreBadgeList",
                "CircularStore",
                "FavoriteStoresEmptyState"
            )) {
                editor.stubComponent(component)
            }
        }

        if (removePromotions.value != false) {
            for (component in listOf(
                "ShopDealsAd",
                "NativeAdCard",
                "CtaBanner",
                "UnlockSpendingPowerBanner",
                "AmazonSpendBanner",
                "AmazonCardInfoBanner",
                "RewardsView",
                "CashbackRewards",
                "SezzleSpendAnywhereView"
            )) {
                editor.stubComponent(component)
            }
        }

        if (removeSezzleSpendBanner.value == true) {
            editor.stubComponent("SpendPill")
            editor.stubComponent("ShopSpendCta")
        }

        editor.updateFooterHash()
        bundleFile.writeBytes(editor.toByteArray())
    }
}
