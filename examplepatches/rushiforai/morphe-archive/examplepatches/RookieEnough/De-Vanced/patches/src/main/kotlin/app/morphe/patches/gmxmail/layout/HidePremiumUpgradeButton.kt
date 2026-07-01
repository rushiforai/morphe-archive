/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/gmxmail/layout/HidePremiumUpgradeButton.kt
 */
package app.morphe.patches.gmxmail.layout

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

@Suppress("unused")
val hidePremiumUpgradeButtonPatch = bytecodePatch(
    name = "Hide Premium upgrade button",
    description = "Hides the Premium upgrade button in the navigation drawer.",
) {
    compatibleWith(AppCompatibilities.GMX_MAIL)

    execute {
        IsUpsellingPossibleFingerprint.method.returnEarly(false)
    }
}

