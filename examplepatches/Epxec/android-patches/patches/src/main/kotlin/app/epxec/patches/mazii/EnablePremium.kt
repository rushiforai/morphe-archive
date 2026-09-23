package app.epxec.patches.mazii

import app.morphe.patcher.patch.bytecodePatch
import app.epxec.patches.shared.Constants.COMPATIBILITY_Mazii
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.epxec.patches.mazii.Fingerprints.MaziiIsPremiumFingerprint
import app.epxec.patches.mazii.Fingerprints.MaziiIsPremiumAIFingerprint
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch

@Suppress("unused")
val enableVipPatch = bytecodePatch(
    name = "Enable premium",
    description = "Enables premium features and question sets.",
    default = true
) {
    compatibleWith(COMPATIBILITY_Mazii)

    dependsOn(changePackageInstallerPatch())

    execute {

        val iputIndex = MaziiIsPremiumFingerprint.instructionMatches[0].index
        val iputAIIndex = MaziiIsPremiumAIFingerprint.instructionMatches[0].index

        MaziiIsPremiumFingerprint.method.addInstructions(
            iputIndex+1,
            """
                    const/4 p1, 0x1
            """
        )


        MaziiIsPremiumAIFingerprint.method.addInstructions(
            iputAIIndex+1,
            """
                    const/4 p1, 0x1
            """
        )
    }

}
