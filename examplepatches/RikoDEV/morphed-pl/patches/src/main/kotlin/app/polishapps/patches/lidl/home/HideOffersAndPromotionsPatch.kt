package app.polishapps.patches.lidl.home

import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.lidl.shared.LIDL_EXTENSION
import app.polishapps.patches.lidl.shared.filterHomeModules
import app.polishapps.patches.shared.Constants.COMPATIBILITY_LIDL_PLUS

@Suppress("unused")
val hideOffersAndPromotionsPatch = bytecodePatch(
    name = "Hide offers and promotions",
    description = "Removes the offers and promotions carousels from the home screen. The Coupons tab is unchanged.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LIDL_PLUS)

    extendWith(LIDL_EXTENSION)

    execute {
        filterHomeModules("hideOffersAndPromotions")
    }
}
