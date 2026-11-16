package app.badfella.patches.linkedin.navigation

import app.badfella.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.badfella.patches.linkedin.shared.markIncluded
import app.badfella.patches.linkedin.shared.sduiComponentFilterPatch
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val moreMenuPatch = bytecodePatch(
    name = "More tab",
    description = "Lets you hide items of the More tab (Puzzle games, Groups, Events, Newsletters), or list them " +
        "at the bottom of the profile menu.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Navigation")
    // The More screen's items are read and hidden as they pass through the SDUI filter.
    dependsOn(sduiComponentFilterPatch)

    execute {
        markIncluded("isMoreMenuIncluded")
    }
}
