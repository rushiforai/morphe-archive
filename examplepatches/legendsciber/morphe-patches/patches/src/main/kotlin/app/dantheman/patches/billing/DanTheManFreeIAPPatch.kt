package app.dantheman.patches.billing

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.dantheman.patches.shared.Constants.COMPATIBILITY_DANTHEMAN

private const val BILLING_MANAGER = "Lcom/halfbrick/mortar/BillingManager;"
private const val NATIVE_GAME_LIB = "Lcom/halfbrick/mortar/NativeGameLib;"

@Suppress("unused")
val danTheManFreeIAPPatch = bytecodePatch(
    name = "Dan The Man Free IAP",
    description = "All in-app purchases are granted instantly and free without Google Play billing.",
    default = true
) {
    compatibleWith(COMPATIBILITY_DANTHEMAN)

    execute {
        DoPurchaseFingerprint.method.addInstructions(0, """
            invoke-static {}, $NATIVE_GAME_LIB->BeginCallNativeCode()V
            const/4 v0, 0x0
            const-string v1, "fake_token"
            const-string v2, "fake_order"
            const-string v3, "success"
            invoke-static {v0, v1, v2, p0, v3}, $BILLING_MANAGER->ConsumedResponse(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
            invoke-static {}, $NATIVE_GAME_LIB->EndCallNativeCode()V
            return-void
        """.trimIndent())

        GetProductInfoFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            const-string v1, "0.00"
            const-string v2, "USD"
            invoke-static {v0, p0, v1, v2}, $BILLING_MANAGER->DetailsCallback(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
            return-void
        """.trimIndent())
    }
}
