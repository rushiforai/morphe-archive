package app.epxec.patches.vaulty

import app.morphe.patcher.patch.bytecodePatch
import app.epxec.patches.shared.Constants.COMPATIBILITY_Vaulty
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.epxec.patches.vaulty.Fingerprints.VaultyProFingerprint
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch

@Suppress("unused")
val enableVipPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Enable Pro features.",
    default = true
) {
    compatibleWith(COMPATIBILITY_Vaulty)

    dependsOn(changePackageInstallerPatch())

    execute {

        val igetIndex = VaultyProFingerprint.instructionMatches[0].index

        VaultyProFingerprint.method.addInstructions(
            igetIndex-1,
            """
                    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            """
        )

    }

}
