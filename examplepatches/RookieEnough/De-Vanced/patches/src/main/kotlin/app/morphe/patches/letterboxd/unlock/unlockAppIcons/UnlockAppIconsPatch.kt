/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/letterboxd/unlock/unlockAppIcons/UnlockAppIconsPatch.kt
 */
package app.morphe.patches.letterboxd.unlock.unlockAppIcons

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val unlockAppIconsPatch = bytecodePatch(
    name = "Unlock app icons",
) {
    compatibleWith(AppCompatibilities.LETTERBOXD)

    execute {
        GetCanChangeAppIconFingerprint.method.returnEarly(true)
    }
}

