package app.morphe.patches.brobuddy.billing

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Constants

private val billingLaunchFingerprint = Fingerprint(
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "launchBillingFlow",
    returnType = "Lcom/android/billingclient/api/BillingResult;",
    parameters = listOf("Landroid/app/Activity;", "Lcom/android/billingclient/api/BillingFlowParams;"),
)

private val billingAcknowledgeFingerprint = Fingerprint(
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "acknowledgePurchase",
    returnType = "V",
    parameters = listOf("Lcom/android/billingclient/api/AcknowledgePurchaseParams;", "Lcom/android/billingclient/api/AcknowledgePurchaseResponseListener;"),
)

private val billingConsumeFingerprint = Fingerprint(
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "consumeAsync",
    returnType = "V",
    parameters = listOf("Lcom/android/billingclient/api/ConsumeParams;", "Lcom/android/billingclient/api/ConsumeResponseListener;"),
)

private val billingQueryPurchasesFingerprint = Fingerprint(
    definingClass = "Lcom/android/billingclient/api/BillingClientImpl;",
    name = "queryPurchasesAsync",
    returnType = "V",
    parameters = listOf("Lcom/android/billingclient/api/QueryPurchasesParams;", "Lcom/android/billingclient/api/PurchasesResponseListener;"),
)

@Suppress("unused")
val broBuddyFreeStorePatch = bytecodePatch(
    name = "BroBuddy Free Store & Unlimited Currency",
    description = "Every store item — coin packs, gem bundles, remove ads and the starter bundles — is granted the instant you tap Buy, and no Google Play payment sheet ever opens. Because nothing is fetched from Play, purchases work fully offline with no Play account, and remove-ads stays unlocked across restarts since the entitlement is re-delivered from a fake owned-purchases list at every launch.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_BROBUDDY)
    dependsOn(broBuddyNativeIapPatch)

    execute {
        billingAcknowledgeFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Lcom/android/billingclient/api/BillingResult;->newBuilder()Lcom/android/billingclient/api/BillingResult${'$'}Builder;
                move-result-object v0
                const/4 v1, 0x0
                invoke-virtual {v0, v1}, Lcom/android/billingclient/api/BillingResult${'$'}Builder;->setResponseCode(I)Lcom/android/billingclient/api/BillingResult${'$'}Builder;
                move-result-object v0
                const-string v1, "OK"
                invoke-virtual {v0, v1}, Lcom/android/billingclient/api/BillingResult${'$'}Builder;->setDebugMessage(Ljava/lang/String;)Lcom/android/billingclient/api/BillingResult${'$'}Builder;
                move-result-object v0
                invoke-virtual {v0}, Lcom/android/billingclient/api/BillingResult${'$'}Builder;->build()Lcom/android/billingclient/api/BillingResult;
                move-result-object v0
                if-eqz p2, :ack_done
                invoke-interface {p2, v0}, Lcom/android/billingclient/api/AcknowledgePurchaseResponseListener;->onAcknowledgePurchaseResponse(Lcom/android/billingclient/api/BillingResult;)V
                :ack_done
                return-void
            """.trimIndent()
        )

        billingConsumeFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Lcom/android/billingclient/api/BillingResult;->newBuilder()Lcom/android/billingclient/api/BillingResult${'$'}Builder;
                move-result-object v0
                const/4 v1, 0x0
                invoke-virtual {v0, v1}, Lcom/android/billingclient/api/BillingResult${'$'}Builder;->setResponseCode(I)Lcom/android/billingclient/api/BillingResult${'$'}Builder;
                move-result-object v0
                const-string v1, "OK"
                invoke-virtual {v0, v1}, Lcom/android/billingclient/api/BillingResult${'$'}Builder;->setDebugMessage(Ljava/lang/String;)Lcom/android/billingclient/api/BillingResult${'$'}Builder;
                move-result-object v0
                invoke-virtual {v0}, Lcom/android/billingclient/api/BillingResult${'$'}Builder;->build()Lcom/android/billingclient/api/BillingResult;
                move-result-object v0
                if-eqz p2, :consume_done
                if-eqz p1, :call_listener
                invoke-virtual {p1}, Lcom/android/billingclient/api/ConsumeParams;->getPurchaseToken()Ljava/lang/String;
                move-result-object v1
                goto :call_listener_with_token
                :call_listener
                const-string v1, "morphe-token"
                :call_listener_with_token
                invoke-interface {p2, v0, v1}, Lcom/android/billingclient/api/ConsumeResponseListener;->onConsumeResponse(Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)V
                :consume_done
                return-void
            """.trimIndent()
        )

        billingQueryPurchasesFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Lcom/android/billingclient/api/BillingResult;->newBuilder()Lcom/android/billingclient/api/BillingResult${'$'}Builder;
                move-result-object v0
                const/4 v1, 0x0
                invoke-virtual {v0, v1}, Lcom/android/billingclient/api/BillingResult${'$'}Builder;->setResponseCode(I)Lcom/android/billingclient/api/BillingResult${'$'}Builder;
                move-result-object v0
                const-string v1, "OK"
                invoke-virtual {v0, v1}, Lcom/android/billingclient/api/BillingResult${'$'}Builder;->setDebugMessage(Ljava/lang/String;)Lcom/android/billingclient/api/BillingResult${'$'}Builder;
                move-result-object v0
                invoke-virtual {v0}, Lcom/android/billingclient/api/BillingResult${'$'}Builder;->build()Lcom/android/billingclient/api/BillingResult;
                move-result-object v0
                if-eqz p2, :qp_done
                new-instance v1, Ljava/util/ArrayList;
                invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
                invoke-interface {p2, v0, v1}, Lcom/android/billingclient/api/PurchasesResponseListener;->onQueryPurchasesResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
                :qp_done
                return-void
            """.trimIndent()
        )

        val launchSmali = """
            move-object/from16 v10, p0
            move-object/from16 v11, p2

            invoke-static {}, Lcom/android/billingclient/api/BillingResult;->newBuilder()Lcom/android/billingclient/api/BillingResult${'$'}Builder;
            move-result-object v0
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, Lcom/android/billingclient/api/BillingResult${'$'}Builder;->setResponseCode(I)Lcom/android/billingclient/api/BillingResult${'$'}Builder;
            move-result-object v0
            const-string v1, "OK"
            invoke-virtual {v0, v1}, Lcom/android/billingclient/api/BillingResult${'$'}Builder;->setDebugMessage(Ljava/lang/String;)Lcom/android/billingclient/api/BillingResult${'$'}Builder;
            move-result-object v0
            invoke-virtual {v0}, Lcom/android/billingclient/api/BillingResult${'$'}Builder;->build()Lcom/android/billingclient/api/BillingResult;
            move-result-object v0

            invoke-virtual {v11}, Lcom/android/billingclient/api/BillingFlowParams;->zzj()Ljava/util/ArrayList;
            move-result-object v1
            if-eqz v1, :try_product_details
            invoke-virtual {v1}, Ljava/util/ArrayList;->size()I
            move-result v2
            if-lez v2, :try_product_details
            const/4 v2, 0x0
            invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
            move-result-object v2
            check-cast v2, Lcom/android/billingclient/api/SkuDetails;
            invoke-virtual {v2}, Lcom/android/billingclient/api/SkuDetails;->getSku()Ljava/lang/String;
            move-result-object v2
            goto :sku_done

            :try_product_details
            invoke-virtual {v11}, Lcom/android/billingclient/api/BillingFlowParams;->zzk()Ljava/util/List;
            move-result-object v1
            if-eqz v1, :try_sku_fallback
            invoke-interface {v1}, Ljava/util/List;->size()I
            move-result v2
            if-lez v2, :try_sku_fallback
            const/4 v2, 0x0
            invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;
            move-result-object v2
            check-cast v2, Lcom/android/billingclient/api/BillingFlowParams${'$'}ProductDetailsParams;
            invoke-virtual {v2}, Lcom/android/billingclient/api/BillingFlowParams${'$'}ProductDetailsParams;->zza()Lcom/android/billingclient/api/ProductDetails;
            move-result-object v2
            invoke-virtual {v2}, Lcom/android/billingclient/api/ProductDetails;->getProductId()Ljava/lang/String;
            move-result-object v2
            goto :sku_done

            :try_sku_fallback
            const-string v2, "brobuddy_free_iap"
            :sku_done

            new-instance v3, Ljava/lang/StringBuilder;
            invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
            const-string v4, "{\"productId\":\""
            invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            const-string v4, "\",\"purchaseToken\":\"morphe-token\",\"orderId\":\"GPA.1234-5678-9012\",\"purchaseState\":1,\"products\":[\""
            invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            const-string v4, "\"],\"quantity\":1,\"packageName\":\"com.brobuddy.game\",\"purchaseTime\":1700000000,\"acknowledged\":false}"
            invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
            move-result-object v6

            const-string v7, "MorpheFakeSignature"
            new-instance v8, Lcom/android/billingclient/api/Purchase;
            invoke-direct {v8, v6, v7}, Lcom/android/billingclient/api/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V

            iget-object v6, v10, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Lcom/android/billingclient/api/zzs;
            if-eqz v6, :deliver_done
            invoke-virtual {v6}, Lcom/android/billingclient/api/zzs;->zzd()Lcom/android/billingclient/api/PurchasesUpdatedListener;
            move-result-object v6
            if-eqz v6, :deliver_done
            new-instance v9, Ljava/util/ArrayList;
            invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V
            invoke-virtual {v9, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            invoke-interface {v6, v0, v9}, Lcom/android/billingclient/api/PurchasesUpdatedListener;->onPurchasesUpdated(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

            :deliver_done
            return-object v0
        """.trimIndent()

        billingLaunchFingerprint.method.addInstructions(0, launchSmali)
    }
}
