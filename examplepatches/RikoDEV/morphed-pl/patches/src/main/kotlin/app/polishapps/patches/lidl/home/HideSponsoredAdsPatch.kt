package app.polishapps.patches.lidl.home

import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.lidl.shared.LIDL_EXTENSION
import app.polishapps.patches.lidl.shared.filterHomeModules
import app.polishapps.patches.shared.Constants.COMPATIBILITY_LIDL_PLUS

@Suppress("unused")
val hideSponsoredAdsPatch = bytecodePatch(
    name = "Hide sponsored ads",
    description = "Removes the sponsored brand deal slots (brandDeals_slot_a and brandDeals_slot_b) from the home screen. " +
        "Their ad requests and view tracking are never made.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LIDL_PLUS)

    extendWith(LIDL_EXTENSION)

    execute {
        filterHomeModules("hideSponsored")
    }
}
