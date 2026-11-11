package app.polishapps.patches.lidl.home

import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.lidl.shared.LIDL_EXTENSION
import app.polishapps.patches.lidl.shared.filterHomeModules
import app.polishapps.patches.shared.Constants.COMPATIBILITY_LIDL_PLUS

@Suppress("unused")
val hideHomeShortcutsPatch = bytecodePatch(
    name = "Hide home shortcuts",
    description = "Removes the round shortcut bubbles at the top of the home screen (WorldOfNeeds), the product catalog " +
        "categories (productCatalog) and the small blue business model chips under the store header (businessModels).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LIDL_PLUS)

    extendWith(LIDL_EXTENSION)

    execute {
        filterHomeModules("hideShortcuts")
    }
}
