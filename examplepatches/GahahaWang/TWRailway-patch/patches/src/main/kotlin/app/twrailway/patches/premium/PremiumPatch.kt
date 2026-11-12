package app.twrailway.patches.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.twrailway.patches.shared.Constants.COMPATIBILITY_TRAIN_SCHEDULE

@Suppress("unused")
val premiumPatch = bytecodePatch (
    name = "premium",
    default = true,
    description = "enable premium widget"
) {
    compatibleWith(COMPATIBILITY_TRAIN_SCHEDULE)
    execute {
        PremiumFingerprint.method.returnEarly(true)
    }
}
