package app.saketh.patches.webnovel.theme

import app.morphe.patcher.patch.patch
import app.saketh.patches.shared.Constants.COMPATIBILITY_WEBNOVEL
import app.saketh.patches.webnovel.controls.registerFeature

@Suppress("unused")
val amoledThemePatch = patch(
    name = "AMOLED dark theme",
    description = "Adds a Patch controls switch that turns dark mode backgrounds, the bottom bar and reader pages pure black.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WEBNOVEL)
    dependsOn(themeHooksPatch)

    execute {
        registerFeature("amoled")
    }
}
