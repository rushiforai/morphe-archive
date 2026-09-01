package app.epxec.patches.touchthenotch

import app.morphe.patcher.patch.bytecodePatch
import app.epxec.patches.shared.Constants.COMPATIBILITY_Touch_The_Notch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.epxec.patches.touchthenotch.Fingerprints.TouchTheNotchPremiumFingerprint
import app.epxec.patches.shared.installer.spoofInstallSourcePatch

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables the premium features of the app.",
    default = true
) {
    compatibleWith(COMPATIBILITY_Touch_The_Notch)

    dependsOn(spoofInstallSourcePatch)

    execute {

        val igetIndex = TouchTheNotchPremiumFingerprint.instructionMatches[2].index

        TouchTheNotchPremiumFingerprint.method.addInstructions(
            igetIndex,
            """
                const/4 v0, 0x1
            """
        )
    }
}
