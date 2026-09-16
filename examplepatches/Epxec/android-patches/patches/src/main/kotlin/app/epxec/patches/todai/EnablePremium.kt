package app.epxec.patches.todai

import app.morphe.patcher.patch.bytecodePatch
import app.epxec.patches.shared.Constants.COMPATIBILITY_Todai
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.epxec.patches.todai.Fingerprints.TodaiPremiumFingerprint
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch

@Suppress("unused")
val enableVipPatch = bytecodePatch(
    name = "Enable Premium",
    description = "For premium patch to work, you need to login using your email and password (not Google)",
    default = true
) {
    compatibleWith(COMPATIBILITY_Todai)

    dependsOn(changePackageInstallerPatch())

    execute {

        TodaiPremiumFingerprint.method.addInstructions(
            0,
            """
                    const/4 v0, 0x1
                    return v0
            """
        )

    }

}
