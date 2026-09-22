package app.worldsoccerchamps.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.worldsoccerchamps.patches.shared.Constants.COMPATIBILITY_WSC

private const val PURCHASE_MANAGER = "Liap/PurchaseManager;"
private const val PURCHASE_EVENT_LISTENER = "Liap/PurchaseEventListener;"
private const val PRODUCT = "Liap/Product;"
private const val PRODUCT_DETAILS = "Lcom/android/billingclient/api/ProductDetails;"
private const val HASHMAP = "Ljava/util/HashMap;"

@Suppress("unused")
val worldSoccerChampsFreeIAPPatch = bytecodePatch(
    name = "World Soccer Champs Free IAP",
    description = "All in-app purchases are granted instantly and free without Google Play billing.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WSC)

    execute {
        PurchaseFingerprint.method.addInstructionsWithLabels(0, """
            iget-object v0, p0, ${PURCHASE_MANAGER}->mPurchaseEventListener:${PURCHASE_EVENT_LISTENER}
            if-eqz v0, :skip
            invoke-direct {p0, p1}, ${PURCHASE_MANAGER}->getProductDetailsByProductId(Ljava/lang/String;)${PRODUCT_DETAILS}
            move-result-object v1
            if-eqz v1, :skip
            iput-object v1, p0, ${PURCHASE_MANAGER}->mCurrentRequestPurchaseProductDetails:${PRODUCT_DETAILS}
            iget-object v2, p0, ${PURCHASE_MANAGER}->mProductTypeMap:${HASHMAP}
            invoke-virtual {v2, p1}, ${HASHMAP}->get(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object p1
            if-nez p1, :default_type
            const-string p1, "consumable"
            :default_type
            invoke-static {v1, p1}, ${PRODUCT}->createFromProductDetails(${PRODUCT_DETAILS}Ljava/lang/String;)${PRODUCT}
            move-result-object v1
            const-string v2, "fake_order_001"
            iput-object v2, v1, ${PRODUCT}->transactionID:Ljava/lang/String;
            const-string v2, "{\"orderId\":\"fake_order_001\",\"packageName\":\"com.monkeyibrow.worldsoccerchamps\",\"purchaseState\":0,\"purchaseToken\":\"fake_token\"}"
            iput-object v2, v1, ${PRODUCT}->receipt:Ljava/lang/String;
            const-string v2, "fake_signature"
            iput-object v2, v1, ${PRODUCT}->receiptCipheredPayload:Ljava/lang/String;
            const/4 v2, 0x1
            iput v2, v1, ${PRODUCT}->quantity:I
            sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            iput-object v2, v1, ${PRODUCT}->acknowledged:Ljava/lang/Boolean;
            const-string v2, "purchased"
            iput-object v2, v1, ${PRODUCT}->purchaseState:Ljava/lang/String;
            iget-object v0, p0, ${PURCHASE_MANAGER}->mPurchaseEventListener:${PURCHASE_EVENT_LISTENER}
            invoke-virtual {v0, v1}, ${PURCHASE_EVENT_LISTENER}->onPurchaseSuccess(${PRODUCT})V
            :skip
            return-void
            nop
        """.trimIndent())
    }
}

@Suppress("unused")
val worldSoccerChampsAntiTamperPatch = bytecodePatch(
    name = "World Soccer Champs Anti-Tamper Bypass",
    description = "Disables all Pairip anti-tamper checks including CRC32 integrity verification.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WSC)

    execute {
        SignatureCheckFingerprint.method.addInstructions(0, """
            return-void
        """.trimIndent())

        AntiHijackFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """.trimIndent())

        PlayStoreCheckFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """.trimIndent())

        AntiHookFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """.trimIndent())

        NativeFlagFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """.trimIndent())

        DexCrcFingerprint.method.addInstructions(0, """
            const-string v0, "ok"
            return-object v0
        """.trimIndent())

        AssetCrcFingerprint.method.addInstructions(0, """
            const-string v0, "ok"
            return-object v0
        """.trimIndent())

        InstalledAppsFingerprint.method.addInstructions(0, """
            const-string v0, ""
            return-object v0
        """.trimIndent())

        PlayIntegrityTokenFingerprint.method.addInstructions(0, """
            const-string v0, "fake_integrity_token"
            return-object v0
        """.trimIndent())

        PlayIntegrityVerdictFingerprint.method.addInstructions(0, """
            const-string v0, "fake_integrity_verdict"
            return-object v0
        """.trimIndent())

        PlayIntegrityStatusFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """.trimIndent())
    }
}
