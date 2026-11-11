package app.polishapps.patches.lidl.home

import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.lidl.shared.LIDL_EXTENSION
import app.polishapps.patches.lidl.shared.filterHomeModules
import app.polishapps.patches.shared.Constants.COMPATIBILITY_LIDL_PLUS

@Suppress("unused")
val hideRecipesAndInspirationsPatch = bytecodePatch(
    name = "Hide recipes and inspirations",
    description = "Removes the recipes carousel and the product showcase (inspiration) carousels from the home screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LIDL_PLUS)

    extendWith(LIDL_EXTENSION)

    execute {
        filterHomeModules("hideRecipesAndInspirations")
    }
}
