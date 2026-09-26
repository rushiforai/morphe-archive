package app.epxec.patches.wallet

import app.morphe.patcher.patch.bytecodePatch
import app.epxec.patches.shared.Constants.COMPATIBILITY_Wallet
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.epxec.patches.wallet.Fingerprints.WalletPaidFingerprint
import app.epxec.patches.wallet.Fingerprints.WalletLifetimeFingerprint
import app.epxec.patches.wallet.Fingerprints.WalletFreeFingerprint
import app.epxec.patches.wallet.Fingerprints.WalletAddAccountFingerprint
import app.epxec.patches.wallet.Fingerprints.WalletAddRecordFingerprint
import app.epxec.patches.wallet.Fingerprints.WalletUsePremiumFeatureFingerprint
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import app.epxec.patches.shared.hoodles.microG

@Suppress("unused")
val enableVipPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables Premium features except Bank Sync, Group Sharing, Facebook login.",
    default = true
) {
    compatibleWith(COMPATIBILITY_Wallet)

    dependsOn(changePackageInstallerPatch(), microG)

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

        WalletAddAccountFingerprint.method.addInstructions(
            0,
            """
                    const/4 v2, 0x1
                    return v2
            """
        )

        WalletAddRecordFingerprint.method.addInstructions(
            0,
            """
                    const/4 v0, 0x1
                    return v0
            """
        )

        WalletUsePremiumFeatureFingerprint.method.addInstructions(
            0,
            """
                    const/4 v2, 0x1
                    return v2
            """
        )
    }

}
