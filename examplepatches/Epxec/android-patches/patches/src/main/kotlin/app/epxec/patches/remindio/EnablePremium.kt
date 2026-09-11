package app.epxec.patches.remindio

import app.morphe.patcher.patch.bytecodePatch
import app.epxec.patches.shared.Constants.COMPATIBILITY_Remindio
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.epxec.patches.remindio.Fingerprints.RemindioPremiumFingerprint
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables the premium features of the app.",
    default = true
) {
    compatibleWith(COMPATIBILITY_Remindio)

    dependsOn(changePackageInstallerPatch())

    execute {

        val method = RemindioPremiumFingerprint.method
        val premiumStatusType = method.parameterTypes[0]

        method.addInstructions(
            0,
            """
                sget-object p1, Le75;->D:Le75;
            """
        )
    }
}
