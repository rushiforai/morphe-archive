package app.epxec.patches.decompile

import app.morphe.patcher.patch.bytecodePatch
import app.epxec.patches.shared.Constants.COMPATIBILITY_Decompile
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.epxec.patches.decompile.Fingerprints.DecompilePremiumFingerprint
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables the premium features of the app.",
    default = true
) {
    compatibleWith(COMPATIBILITY_Decompile)

    dependsOn(changePackageInstallerPatch())

    execute {
        DecompilePremiumFingerprint.method.addInstructions(
            0,
            """
                const/4 p1, 0x1
            """
        )
    }

}
