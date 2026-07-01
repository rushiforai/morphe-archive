/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/strava/quickedit/DisableQuickEditPatch.kt
 */
package app.morphe.patches.strava.quickedit

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val disableQuickEditPatch = bytecodePatch(
    name = "Disable Quick Edit",
    description = "Prevents the Quick Edit prompt from popping up.",
) {
    compatibleWith(AppCompatibilities.STRAVA)

    execute {
        // In ReVanced this returned the type default; in Morphe, be explicit.
        GetHasAccessToQuickEditFingerprint.method.returnEarly(false)
    }
}

