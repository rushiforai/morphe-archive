/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/photoshopmix/BypassLoginPatch.kt
 */
package app.morphe.patches.photoshopmix

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val bypassLoginPatch = bytecodePatch(
    name = "Bypass login",
    description = "Allows the use of the app after its discontinuation.",
) {
    compatibleWith(AppCompatibilities.PHOTOSHOP_MIX)

    execute {
        IsLoggedInMethodFingerprint.method.returnEarly(true)

        // Disables these buttons that cause the app to crash while not logged in.
        CcLibButtonClickHandlerMethodFingerprint.method.returnEarly()
        LightroomButtonClickHandlerMethodFingerprint.method.returnEarly()
        CcButtonClickHandlerMethodFingerprint.method.returnEarly()
    }
}

