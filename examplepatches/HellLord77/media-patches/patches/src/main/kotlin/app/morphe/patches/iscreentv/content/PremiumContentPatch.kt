package app.morphe.patches.iscreentv.content

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.iscreentv.shared.Constants.COMPATIBILITY_ISCREENTV
import app.morphe.util.returnEarly

@Suppress("unused")
val premiumContentPatch = bytecodePatch(
    name = "Free premium content",
    description = "Spoofs premium content to be free",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ISCREENTV)

    execute {
        GetPremiumFingerprint.matchAll().forEach {
            it.method.returnEarly(false)
        }
    }
}