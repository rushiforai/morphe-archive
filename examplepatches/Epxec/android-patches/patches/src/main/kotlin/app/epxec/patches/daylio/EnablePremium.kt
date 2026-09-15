package app.epxec.patches.daylio

import app.morphe.patcher.patch.bytecodePatch
import app.epxec.patches.shared.Constants.COMPATIBILITY_Daylio
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.epxec.patches.daylio.Fingerprints.DaylioPurchaseListCheckFingerprint
import app.epxec.patches.daylio.Fingerprints.DaylioSecondPurchaseListCheckFingerprint
import app.epxec.patches.daylio.Fingerprints.DaylioAcknowledgementFingerprint
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import app.morphe.util.addInstructionsAtControlFlowLabel

@Suppress("unused")
val enableVipPatch = bytecodePatch(
    name = "Enable premium features",
    description = "Removed validation on purchases, and forced to acknowledge that user is a premium user",
    default = true
) {
    compatibleWith(COMPATIBILITY_Daylio)

    dependsOn(changePackageInstallerPatch())

    execute {

        val purchaseListCheck = DaylioPurchaseListCheckFingerprint.method
        val secondPurchaseListCheck = DaylioSecondPurchaseListCheckFingerprint.method
        val acknowledgement = DaylioAcknowledgementFingerprint.method

        val invokeIndex = DaylioPurchaseListCheckFingerprint.instructionMatches[0].index

        purchaseListCheck.addInstructions(
            invokeIndex + 2,
            """
                iget-object v0, p0, Lnet/daylio/modules/purchases/g0${'$'}a${'$'}a;->b:Lnet/daylio/modules/purchases/g0${'$'}a;
                iget-object v0, v0, Lnet/daylio/modules/purchases/g0${'$'}a;->b:Lnet/daylio/modules/purchases/g0;
                iget-object v1, p0, Lnet/daylio/modules/purchases/g0${'$'}a${'$'}a;->a:Lfl/o;
                invoke-static {v0, p1, v1}, Lnet/daylio/modules/purchases/g0;->L0(Lnet/daylio/modules/purchases/g0;Ljava/util/List;Lfl/o;)V
                return-void
            """
        )

        secondPurchaseListCheck.addInstructions(
            0,
            """
                const-string v0, "{\"productId\":\"example.product\",\"purchaseTime\":1767225600000,\"purchaseToken\":\"EXAMPLE_TOKEN\",\"acknowledged\":true}"
                const-string v1, "EXAMPLE_SIGNATURE"
                new-instance v2, Lcom/android/billingclient/api/Purchase;
                invoke-direct {v2, v0, v1}, Lcom/android/billingclient/api/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V
                const-wide v0, 0x0
                invoke-direct {p0, v2, v0, v1, p2}, Lnet/daylio/modules/purchases/g0;->f1(Lnet/daylio/data/purchases/c;JLfl/o;)V
                return-void
            """
        )

        acknowledgement.addInstructions(
            0,
            """
                const/4 p1, 0x0
                invoke-interface {p2, p1}, Lfl/o;->onSuccess(Ljava/lang/Object;)V
                return-void
            """
        )

    }

}
