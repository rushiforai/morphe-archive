/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/hexeditor/ad/DisableAdsPatch.kt
 */
package app.morphe.patches.hexeditor.ad

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val disableAdsPatch = bytecodePatch("Disable ads") {
    compatibleWith(AppCompatibilities.HEX_EDITOR)

    execute {
        PrimaryAdsMethodFingerprint.methodOrNull?.returnEarly(true)
    }
}

