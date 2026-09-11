package app.epxec.patches.haloreelspro

import app.morphe.patcher.patch.bytecodePatch
import app.epxec.patches.shared.Constants.COMPATIBILITY_Haloreelspro
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.epxec.patches.haloreelspro.Fingerprints.HaloreelsproVipFingerprint
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch

@Suppress("unused")
val enableVipPatch = bytecodePatch(
    name = "Enable VIP",
    description = "Enables the VIP features of the app.",
    default = true
) {
    compatibleWith(COMPATIBILITY_Haloreelspro)

    dependsOn(changePackageInstallerPatch())

    execute {
        HaloreelsproVipFingerprint.method.addInstructions(
            0,
            """
                const/4 v1, 0x1
                return v1
            """
        )
    }

}
