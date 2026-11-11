package app.polishapps.patches.lidl.home

import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.lidl.shared.LIDL_EXTENSION
import app.polishapps.patches.lidl.shared.filterHomeModules
import app.polishapps.patches.shared.Constants.COMPATIBILITY_LIDL_PLUS

@Suppress("unused")
val hideBannersAndMessagesPatch = bytecodePatch(
    name = "Hide promo banners and messages",
    description = "Removes Lidl's promo banners, video banners and the home message from the home screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LIDL_PLUS)

    extendWith(LIDL_EXTENSION)

    execute {
        filterHomeModules("hideBannersAndMessages")
    }
}
