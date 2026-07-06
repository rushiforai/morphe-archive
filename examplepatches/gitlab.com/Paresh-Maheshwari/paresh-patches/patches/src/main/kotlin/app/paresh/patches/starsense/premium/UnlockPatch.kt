package app.paresh.patches.starsense.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.paresh.patches.starsense.shared.Constants.COMPATIBILITY_STARSENSE

@Suppress("unused")
val starsenseUnlockPatch = bytecodePatch(
    name = "StarSense Unlock",
    description = "Bypasses the unlock code check to enable all features."
) {
    compatibleWith(COMPATIBILITY_STARSENSE)

    execute {
        IsUnlockedFingerprint.method.returnEarly(true)
    }
}
