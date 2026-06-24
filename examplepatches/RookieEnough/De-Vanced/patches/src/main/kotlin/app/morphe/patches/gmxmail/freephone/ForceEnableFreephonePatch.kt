/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/gmxmail/freephone/ForceEnableFreephonePatch.kt
 */
package app.morphe.patches.gmxmail.freephone

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val forceEnableFreePhonePatch = bytecodePatch(
    name = "Force enable FreePhone",
    description = "Enables the FreePhone menu in the navigation drawer even on devices that do not support eSIM.",
) {
    compatibleWith(AppCompatibilities.GMX_MAIL)

    execute {
        IsEuiccEnabledFingerprint.method.returnEarly(true)
    }
}

