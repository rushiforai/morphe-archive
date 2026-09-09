package app.shadowfight.patches.iap

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.shadowfight.patches.shared.Constants.COMPATIBILITY_SF2

/**
 * Shadow Fight 2 IAP Bypass — Smali-only version
 *
 * Intercepts BillingClientImpl.launchBillingFlow() (the base class method
 * called via JNI from libil2cpp.so) and replaces it with a fake purchase
 * flow:
 *
 * 1. Get ProductDetailsParams list via BillingFlowParams.zzh() getter
 * 2. Extract product ID from the first ProductDetailsParams
 * 3. Build a fake Purchase JSON with the product ID
 * 4. Create a Purchase object from the fake JSON
 * 5. Get the PurchasesUpdatedListener from BillingClientImpl.zze.zzb
 * 6. Call listener.onPurchasesUpdated(OK, [fakePurchase])
 * 7. Return OK BillingResult
 *
 * This triggers the game's normal purchase completion flow (C# callback
 * chain -> PurchasingManager -> item delivery) without opening Google Play.
 *
 * Injected at index 0 of the method. The return-object instructions ensure
 * the original method body is never reached (dead code).
 */
@Suppress("unused")
val sfIAPBypassSmaliPatch = bytecodePatch(
    name = "Shadow Fight 2 IAP Bypass (Smali)",
    description = "Bypasses in-app purchases via smali patching. " +
        "Intercepts launchBillingFlow and triggers fake purchase callback.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SF2)
    execute {
        IAPBypassSmaliFingerprint.method.addInstructionsWithLabels(0, """
            invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/BillingFlowParams;->zzh()Ljava/util/List;
            move-result-object v0
            if-eqz v0, :fallback_error
            invoke-interface {v0}, Ljava/util/List;->size()I
            move-result v1
            if-lez v1, :fallback_error
            const/4 v1, 0x0
            invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;
            move-result-object v0
            check-cast v0, Lcom/android/billingclient/api/BillingFlowParams${'$'}ProductDetailsParams;
            invoke-virtual {v0}, Lcom/android/billingclient/api/BillingFlowParams${'$'}ProductDetailsParams;->zza()Lcom/android/billingclient/api/ProductDetails;
            move-result-object v0
            invoke-virtual {v0}, Lcom/android/billingclient/api/ProductDetails;->getProductId()Ljava/lang/String;
            move-result-object v0
            new-instance v1, Ljava/lang/StringBuilder;
            invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
            const-string v2, "{\"orderId\":\"morphe_bypass\",\"packageName\":\"com.nekki.shadowfight\",\"productIds\":[\""
            invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            const-string v2, "\"],\"purchaseTime\":0,\"purchaseState\":1,\"purchaseToken\":\"morphe_bypass_token\",\"acknowledged\":true}"
            invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
            move-result-object v0
            new-instance v1, Lcom/android/billingclient/api/Purchase;
            const-string v2, ""
            invoke-direct {v1, v0, v2}, Lcom/android/billingclient/api/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V
            new-instance v0, Ljava/util/ArrayList;
            invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
            invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            move-object/from16 v3, p0
            iget-object v1, v3, Lcom/android/billingclient/api/BillingClientImpl;->zze:Lcom/android/billingclient/api/zzn;
            if-eqz v1, :fallback_error
            invoke-virtual {v1}, Lcom/android/billingclient/api/zzn;->zzd()Lcom/android/billingclient/api/PurchasesUpdatedListener;
            move-result-object v1
            if-eqz v1, :fallback_error
            sget-object v2, Lcom/android/billingclient/api/zzcj;->zzl:Lcom/android/billingclient/api/BillingResult;
            invoke-interface {v1, v2, v0}, Lcom/android/billingclient/api/PurchasesUpdatedListener;->onPurchasesUpdated(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
            return-object v2
            :fallback_error
            sget-object v0, Lcom/android/billingclient/api/zzcj;->zzl:Lcom/android/billingclient/api/BillingResult;
            return-object v0
        """.trimIndent())
    }
}
