package app.morphe.patches.colonyflow

import app.morphe.patches.colonyflow.Constants.COMPATIBILITY_COLONY_FLOW
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val BILLING_CLIENT_IMPL = "Lcom/android/billingclient/api/BillingClientImpl;"

internal object LaunchBillingFlowFingerprint : Fingerprint(
    definingClass = BILLING_CLIENT_IMPL,
    name = "launchBillingFlow",
    parameters = listOf(
        "Landroid/app/Activity;",
        "Lcom/android/billingclient/api/BillingFlowParams;",
    ),
    returnType = "Lcom/android/billingclient/api/BillingResult;",
)

@Suppress("unused")
val billingBypassPatch =
    bytecodePatch(
        name = "Free In-App Purchases (IAP Bypass)",
        description = "Bypasses Google Play billing dialog and immediately simulates a successful purchase.",
    ) {
        compatibleWith(COMPATIBILITY_COLONY_FLOW)

        execute {
            LaunchBillingFlowFingerprint.method.addInstructions(
                0,
                """
                const-string v0, "com.abi.ant.coin1"
                move-object/from16 v1, p2
                if-eqz v1, :cond_default_id_set
                invoke-virtual {v1}, Lcom/android/billingclient/api/BillingFlowParams;->zzk()Ljava/util/List;
                move-result-object v1
                if-eqz v1, :cond_default_id_set
                invoke-interface {v1}, Ljava/util/List;->isEmpty()Z
                move-result v2
                if-nez v2, :cond_default_id_set
                const/4 v2, 0x0
                invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;
                move-result-object v1
                check-cast v1, Lcom/android/billingclient/api/BillingFlowParams${'$'}ProductDetailsParams;
                if-eqz v1, :cond_default_id_set
                invoke-virtual {v1}, Lcom/android/billingclient/api/BillingFlowParams${'$'}ProductDetailsParams;->zza()Lcom/android/billingclient/api/ProductDetails;
                move-result-object v1
                if-eqz v1, :cond_default_id_set
                invoke-virtual {v1}, Lcom/android/billingclient/api/ProductDetails;->getProductId()Ljava/lang/String;
                move-result-object v1
                if-eqz v1, :cond_default_id_set
                move-object v0, v1

                :cond_default_id_set
                new-instance v1, Lorg/json/JSONObject;
                invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

                const-string v2, "orderId"
                const-string v3, "GPA.1234-5678-9012-34567"
                invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

                const-string v2, "packageName"
                const-string v3, "com.abi.colony.flow"
                invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

                const-string v2, "productId"
                invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

                const-string v2, "purchaseTime"
                const-wide v3, 0x18bd92bb400L
                invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

                const-string v2, "purchaseState"
                const/4 v3, 0x1
                invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

                const-string v2, "purchaseToken"
                const-string v3, "dummy_purchase_token"
                invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

                const-string v2, "acknowledged"
                const/4 v3, 0x1
                invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

                invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
                move-result-object v0

                new-instance v1, Lcom/android/billingclient/api/Purchase;
                const-string v2, "dummy_signature"
                invoke-direct {v1, v0, v2}, Lcom/android/billingclient/api/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V

                invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;
                move-result-object v0

                sget-object v1, Lcom/android/billingclient/api/zzdc;->zzi:Lcom/android/billingclient/api/BillingResult;

                move-object/from16 v2, p0
                iget-object v2, v2, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Lcom/android/billingclient/api/zzab;
                if-eqz v2, :cond_listener_null
                invoke-virtual {v2}, Lcom/android/billingclient/api/zzab;->zzf()Lcom/android/billingclient/api/PurchasesUpdatedListener;
                move-result-object v2
                if-eqz v2, :cond_listener_null
                invoke-interface {v2, v1, v0}, Lcom/android/billingclient/api/PurchasesUpdatedListener;->onPurchasesUpdated(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

                :cond_listener_null
                return-object v1
                """.trimIndent(),
            )
        }
    }
