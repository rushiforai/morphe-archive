/*
 * Forked from:
 * https://github.com/burgers1312/revanced-patches/tree/main/patches/src/main/kotlin/com/burgers1312/revanced/patches/splitwise
 */
package app.morphe.patches.splitwise

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Constants

val enableFeaturesPatch = bytecodePatch(
    name = "Enable Features",
    description = "Enables features by skipping checks"
) {
    compatibleWith(Constants.SPLITWISE)

    execute {
        adFeatureStatusGetEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
        adFeatureStatusGetVisibleFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}