/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/messenger/layout/HideFacebookButtonPatch.kt
 */
package app.morphe.patches.messenger.layout

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val hideFacebookButtonPatch = bytecodePatch(
    name = "Hide Facebook button",
    description = "Hides the Facebook button in the top toolbar."
) {
    compatibleWith(AppCompatibilities.MESSENGER)

    execute {
        IsFacebookButtonEnabledFingerprint.method.returnEarly(false)
    }
}
