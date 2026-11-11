package app.polishapps.patches.lidl.home

import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.lidl.shared.LIDL_EXTENSION
import app.polishapps.patches.lidl.shared.filterHomeModules
import app.polishapps.patches.shared.Constants.COMPATIBILITY_LIDL_PLUS

@Suppress("unused")
val hideStorePatch = bytecodePatch(
    name = "Hide store header",
    description = "Removes the usual store header (store name, opening hours and store picker) from the home screen.",
    // The store header is also the way to change store, so this is opt-in.
    default = false,
) {
    compatibleWith(COMPATIBILITY_LIDL_PLUS)

    extendWith(LIDL_EXTENSION)

    execute {
        filterHomeModules("hideStore")
    }
}
