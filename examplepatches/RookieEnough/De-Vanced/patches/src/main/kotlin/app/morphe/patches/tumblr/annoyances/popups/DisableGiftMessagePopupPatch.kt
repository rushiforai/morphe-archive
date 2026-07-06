/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tumblr/annoyances/popups/DisableGiftMessagePopupPatch.kt
 */
package app.morphe.patches.tumblr.annoyances.popups

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val disableGiftMessagePopupPatch = bytecodePatch(
    name = "Disable gift message popup",
    description = "Disables the popup suggesting to buy TumblrMart items for other people.",
) {
    compatibleWith(AppCompatibilities.TUMBLR)

    execute {
        ShowGiftMessagePopupFingerprint.method.returnEarly()
    }
}

