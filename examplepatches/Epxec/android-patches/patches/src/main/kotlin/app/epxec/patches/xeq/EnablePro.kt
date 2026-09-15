package app.epxec.patches.xeq

import app.morphe.patcher.patch.bytecodePatch
import app.epxec.patches.shared.Constants.COMPATIBILITY_XEQ
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.epxec.patches.xeq.Fingerprints.XEQProFingerprint
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import app.morphe.util.addInstructionsAtControlFlowLabel

@Suppress("unused")
val enableVipPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Enable Pro features",
    default = true
) {
    compatibleWith(COMPATIBILITY_XEQ)

    dependsOn(changePackageInstallerPatch())

    execute {

        val invokeIndex = XEQProFingerprint.instructionMatches[0].index

        XEQProFingerprint.method.addInstructions(
            invokeIndex + 11,
            """
                    invoke-virtual {v0}, Let1;->i()V
            """
        )

    }

}
