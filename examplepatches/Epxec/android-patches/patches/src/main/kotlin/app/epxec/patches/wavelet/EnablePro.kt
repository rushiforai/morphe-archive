package app.epxec.patches.wavelet

import app.morphe.patcher.patch.bytecodePatch
import app.epxec.patches.shared.Constants.COMPATIBILITY_Wavelet
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.epxec.patches.wavelet.Fingerprints.WaveletProFingerprint
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.patch.PatchException
import app.epxec.patches.shared.blazeftl.spoofAppSignature

@Suppress("unused")
val enableVipPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Enables Pro features.",
    default = true
) {
    compatibleWith(COMPATIBILITY_Wavelet)

    dependsOn(changePackageInstallerPatch(), spoofAppSignature)

    execute {

        val isPurchased = WaveletProFingerprint.instructionMatches[1].index
        val proState = WaveletProFingerprint.instructionMatches[3].index

            // throw PatchException("method " + isPurchased + " " + proState + " " + WaveletProFingerprint.method.name)

        WaveletProFingerprint.method.addInstructionsAtControlFlowLabel(
            proState,
            """
                    const/4 p0, 0x1
            """
        )

        WaveletProFingerprint.method.addInstructions(
            isPurchased,
            """
                    const/4 v0, 0x1
            """
        )


        
    }

}
