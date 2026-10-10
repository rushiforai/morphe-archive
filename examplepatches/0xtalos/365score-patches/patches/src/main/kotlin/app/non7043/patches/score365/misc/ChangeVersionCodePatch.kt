package app.non7043.patches.score365.misc

import app.non7043.patches.score365.utils.COMPATIBILITY_365SCORE
import app.morphe.patcher.patch.bytecodePatch

/**
 * Changes the version code reported by 365Score.
 *
 * ## Why this is useful
 * - Prevents Google Play / the app's server from detecting you are on an older version
 * - Stops the Play Store from auto-updating the patched app over your patched version
 */
val changeVersionCodePatch = bytecodePatch(
    name = "Change version code",
    description = "Changes the version code of 365Score to prevent forced updates.",
) {
    compatibleWith(*COMPATIBILITY_365SCORE)

    execute {
    }
}
