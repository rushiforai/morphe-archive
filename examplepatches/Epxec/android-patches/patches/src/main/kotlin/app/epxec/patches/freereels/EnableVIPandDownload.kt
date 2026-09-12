package app.epxec.patches.freereels

import app.morphe.patcher.patch.bytecodePatch
import app.epxec.patches.shared.Constants.COMPATIBILITY_Freereels
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.epxec.patches.freereels.Fingerprints.FreereelsVipFingerprint
import app.epxec.patches.freereels.Fingerprints.FreereelsDownloadAdsFingerprint
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import app.morphe.util.addInstructionsAtControlFlowLabel

@Suppress("unused")
val enableVipPatch = bytecodePatch(
    name = "Enable VIP and no-ads download",
    description = "Let's you watch all episodes without ads and download all episodes without watching ads beforehand.",
    default = true
) {
    compatibleWith(COMPATIBILITY_Freereels)

    dependsOn(changePackageInstallerPatch())

    execute {

        val iputIndex = FreereelsDownloadAdsFingerprint.instructionMatches[0].index


        FreereelsVipFingerprint.method.addInstructions(
            0,
            """
                    const/4 v0, 0x1
                    return v0
            """
        )


        FreereelsDownloadAdsFingerprint.method.addInstructionsAtControlFlowLabel(
            iputIndex,
            """
                    const/4 p1, 0x0
            """
        )
    }

}
