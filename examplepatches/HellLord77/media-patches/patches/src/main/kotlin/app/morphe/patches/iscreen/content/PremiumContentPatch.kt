package app.morphe.patches.iscreen.content

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.iscreen.shared.Constants.COMPATIBILITY_ISCREEN
import app.morphe.util.returnEarly

@Suppress("unused")
val premiumContentPatch = bytecodePatch(
    name = "Free premium content",
    description = "Spoofs premium content to be free",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ISCREEN)

    execute {
        GetPremiumFingerprint.matchAll().forEach {
            it.method.returnEarly(false)
        }
    }
}