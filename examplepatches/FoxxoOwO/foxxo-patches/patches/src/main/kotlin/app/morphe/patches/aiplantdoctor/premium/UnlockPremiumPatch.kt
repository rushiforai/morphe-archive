package app.morphe.patches.aiplantdoctor.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

private const val APP_PACKAGE = "me.jodoin.aiplantdoctor"
private const val SKU_ANNUAL  = "$APP_PACKAGE.premium_annual"

private val COMPATIBILITY_AIPLANT = Compatibility(
    name = "AI Plant Doctor",
    packageName = APP_PACKAGE,
    targets = listOf(
        AppTarget(
            version = "3.1.0"
        )
    )
)

val unlockPremiumPatch = bytecodePatch(
    name        = "Unlock premium",
    description = "Unlocks all AI Plant Doctor premium features by bypassing Google Play Billing and returning an active annual subscription.",
) {
    compatibleWith(COMPATIBILITY_AIPLANT)

    execute {
        // 1. Force BillingResult to OK (responseCode = 0, debugMessage = "")
        ConvertBillingResultFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                iput v0, p0, Ln2/d;->a:I
                const-string v0, ""
                iput-object v0, p0, Ln2/d;->c:Ljava/lang/String;
            """
        )

        // 2. Inject fake annual subscription Purchase object into the purchases list
        ConvertPurchasesListFingerprint.method.addInstructions(
            0,
            """
                new-instance p0, Ljava/util/ArrayList;
                invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

                new-instance v0, Lcom/android/billingclient/api/Purchase;
                const-string v1, "{\"orderId\":\"GPA.3312-5819-2144-88410\",\"packageName\":\"me.jodoin.aiplantdoctor\",\"productId\":\"me.jodoin.aiplantdoctor.premium_annual\",\"productIds\":[\"me.jodoin.aiplantdoctor.premium_annual\"],\"purchaseTime\":1758250000000,\"purchaseState\":1,\"purchaseToken\":\"morphe_fake_token_annual\",\"autoRenewing\":true,\"acknowledged\":true}"
                const-string v2, ""
                invoke-direct {v0, v1, v2}, Lcom/android/billingclient/api/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V

                invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            """
        )
    }
}
