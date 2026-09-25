package app.hungryshark.patches.billing

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.hungryshark.patches.shared.Constants.COMPATIBILITY_HUNGRYSHARK

@Suppress("unused")
val hungrySharkFreeIAPPatch = bytecodePatch(
    name = "Hungry Shark Free IAP",
    description = "All in-app purchases are granted instantly and free without Google Play billing.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HUNGRYSHARK)

    execute {
        PurchaseProductFingerprint.method.addInstructions(
            0,
            """
            new-instance v0, Ljava/lang/StringBuilder;
            invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
            const-string v1, "{\"productId\":\""
            invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            invoke-virtual {p1}, Lcom/android/billingclient/api/ProductDetails;->getProductId()Ljava/lang/String;
            move-result-object v1
            invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            const-string v1, "\",\"purchaseToken\":\""
            invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            move-object p2, v0
            invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;
            move-result-object v1
            invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;
            move-result-object v1
            invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            const-string v0, "\",\"orderId\":\""
            invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            const-string v0, "\",\"purchaseTime\":"
            invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
            move-result-wide v0
            invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
            const-string v0, ",\"purchaseState\":0,\"acknowledged\":false,\"packageName\":\"com.fgol.HungrySharkEvolution\",\"signature\":\"\",\"autoRenewing\":false}"
            invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
            move-result-object v0
            new-instance v1, Lcom/android/billingclient/api/Purchase;
            const-string p2, ""
            invoke-direct {v1, v0, p2}, Lcom/android/billingclient/api/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V
            new-instance v0, Ljava/util/ArrayList;
            invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
            invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            invoke-static {}, Lcom/android/billingclient/api/BillingResult;->newBuilder()Lcom/android/billingclient/api/BillingResult${'$'}Builder;
            move-result-object v1
            const/4 p2, 0x0
            invoke-virtual {v1, p2}, Lcom/android/billingclient/api/BillingResult${'$'}Builder;->setResponseCode(I)Lcom/android/billingclient/api/BillingResult${'$'}Builder;
            move-result-object v1
            const-string p2, ""
            invoke-virtual {v1, p2}, Lcom/android/billingclient/api/BillingResult${'$'}Builder;->setDebugMessage(Ljava/lang/String;)Lcom/android/billingclient/api/BillingResult${'$'}Builder;
            move-result-object v1
            invoke-virtual {v1}, Lcom/android/billingclient/api/BillingResult${'$'}Builder;->build()Lcom/android/billingclient/api/BillingResult;
            move-result-object v1
            iget-object p2, p0, Lcom/ubisoft/orion/monetisationcore/billing/GoogleBillingService;->purchasesUpdatedListener:Lcom/android/billingclient/api/PurchasesUpdatedListener;
            invoke-interface {p2, v1, v0}, Lcom/android/billingclient/api/PurchasesUpdatedListener;->onPurchasesUpdated(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
            return-void
            """.trimIndent(),
        )
    }
}
