package app.template.patches.lockstar

import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_LOCKSTAR

/*
 * Diagnostic patch. Changes nothing, so selecting only this one produces a LockStar that is
 * re-signed by Morphe but otherwise identical to the original. If that build still crashes,
 * the crash comes from the re-signing, not from the clock patches.
 */
@Suppress("unused")
val resignOnlyTestPatch = patch(
    name = "Re-sign only (test)",
    description = "Does nothing. Select only this patch to test whether a re-signed LockStar opens at all.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_LOCKSTAR)

    execute {
        println("[Re-sign only (test)] No changes applied.")
    }
}
