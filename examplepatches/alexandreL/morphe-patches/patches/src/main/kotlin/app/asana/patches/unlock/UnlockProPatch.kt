package app.asana.patches.unlock

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.asana.patches.shared.Constants.COMPATIBILITY_ASANA_REBEL

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Asana Rebel Pro",
    description = "Makes the app always behave as if an active subscription exists: " +
        "premium workouts, yoga stories, recipes, songs and downloads are unlocked.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ASANA_REBEL)

    execute {
        // Neutralize the method itself rather than every caller: `isOpen()` is the one
        // source of truth for "user is Pro", so a single return covers current and future callers.
        PayWallIsOpenFingerprint.method.returnEarly(true)
    }
}
