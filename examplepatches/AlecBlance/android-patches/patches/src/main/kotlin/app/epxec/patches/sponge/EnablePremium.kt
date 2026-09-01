package app.epxec.patches.sponge

import app.morphe.patcher.patch.bytecodePatch
import app.epxec.patches.shared.Constants.COMPATIBILITY_Sponge
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.epxec.patches.sponge.Fingerprints.SpongePremiumFingerprint
import app.epxec.patches.shared.installer.spoofInstallSourcePatch

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables the premium features of the app.",
    default = true
) {
    compatibleWith(COMPATIBILITY_Sponge)

    dependsOn(spoofInstallSourcePatch)

    execute {

        val filterStringIndex = SpongePremiumFingerprint.instructionMatches[0].index + 1

        SpongePremiumFingerprint.method.addInstructions(
            filterStringIndex,
            """
                const/4 p1, 0x1
            """
        )
    }
}
