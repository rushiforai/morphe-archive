package app.polishapps.patches.lidl.home

import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.lidl.shared.LIDL_EXTENSION
import app.polishapps.patches.lidl.shared.filterHomeModules
import app.polishapps.patches.shared.Constants.COMPATIBILITY_LIDL_PLUS

@Suppress("unused")
val hideOnlineShopCardsPatch = bytecodePatch(
    name = "Hide online shop cards",
    description = "Removes every online shop card from the home screen: the shop teaser, search, campaign and " +
        "Deal of the Day variants (onlineshop1cx*).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LIDL_PLUS)

    extendWith(LIDL_EXTENSION)

    execute {
        filterHomeModules("hideOnlineShopCards")
    }
}
