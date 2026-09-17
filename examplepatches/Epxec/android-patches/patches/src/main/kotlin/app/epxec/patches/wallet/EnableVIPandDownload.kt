package app.epxec.patches.wallet

import app.morphe.patcher.patch.bytecodePatch
import app.epxec.patches.shared.Constants.COMPATIBILITY_Wallet
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.epxec.patches.wallet.Fingerprints.WalletPaidFingerprint
import app.epxec.patches.wallet.Fingerprints.WalletLifetimeFingerprint
import app.epxec.patches.wallet.Fingerprints.WalletFreeFingerprint
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch

@Suppress("unused")
val enableVipPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables Premium features except Bank Sync, Group Sharing, Facebook and Google login.",
    default = true
) {
    compatibleWith(COMPATIBILITY_Wallet)

    dependsOn(changePackageInstallerPatch())

    execute {

        WalletPaidFingerprint.method.addInstructions(
            0,
            """
                    const/4 p0, 0x1
                    return p0
            """
        )


        WalletLifetimeFingerprint.method.addInstructions(
            0,
            """
                    const/4 p0, 0x1
                    return p0
            """
        )

        WalletFreeFingerprint.method.addInstructions(
            0,
            """
                    const/4 p0, 0x0
                    return p0
            """
        )
    }

}
