package app.shadowfight.patches.iap

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.shadowfight.patches.shared.Constants.COMPATIBILITY_SF2
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val BFP_PRODUCT_DETAILS_PARAMS = "Lcom/android/billingclient/api/BillingFlowParams${'$'}ProductDetailsParams;"
private const val BILLING_RESULT_BUILDER = "Lcom/android/billingclient/api/BillingResult${'$'}Builder;"
private const val QUERY_PRODUCT = "Lcom/android/billingclient/api/QueryProductDetailsParams${'$'}Product;"
private const val LOG_FILE = "/storage/emulated/0/Download/morphe_log.txt"
private const val PURCHASE_FILE = "/storage/emulated/0/Download/morphe_purchase.json"

@Suppress("unused")
val sfIAPBypassSmaliPatch = bytecodePatch(
    name = "Shadow Fight 2 IAP Bypass (Smali)",
    description = "Bypasses anti-tamper + intercepts billing for free IAP.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SF2)
    execute {
        val billingClientImplClass = IAPBypassLaunchBillingFlowFingerprint.classDef

        // ═══ Debug Logger ═══
        val morpheLogMethod = ImmutableMethod(
            billingClientImplClass.type,
            "morpheLog",
            listOf(ImmutableMethodParameter("Ljava/lang/String;", null, null)),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(5)
        ).toMutable().apply {
            addInstructionsWithLabels(0, """
                invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;
                move-result-object v0
                if-eqz v0, :skip_toast
                invoke-static {v0, p0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
                move-result-object v1
                invoke-virtual {v1}, Landroid/widget/Toast;->show()V
                :skip_toast
                :try_start
                new-instance v0, Ljava/io/FileWriter;
                const-string v1, "$LOG_FILE"
                const/4 v2, 0x1
                invoke-direct {v0, v1, v2}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;Z)V
                new-instance v1, Ljava/io/PrintWriter;
                invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V
                invoke-virtual {v1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V
                invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V
                :try_end
                return-void
                :catch
                move-exception v0
                return-void
            """.trimIndent())
        }
        billingClientImplClass.methods.add(morpheLogMethod)

        // ═══ Save Purchase to File ═══
        val morpheSavePurchaseMethod = ImmutableMethod(
            billingClientImplClass.type,
            "morpheSavePurchase",
            listOf(ImmutableMethodParameter("Ljava/lang/String;", null, null)),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(4)
        ).toMutable().apply {
            addInstructionsWithLabels(0, """
                :try_start
                new-instance v0, Ljava/io/FileWriter;
                const-string v1, "$PURCHASE_FILE"
                invoke-direct {v0, v1}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V
                invoke-virtual {v0, p0}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V
                invoke-virtual {v0}, Ljava/io/FileWriter;->close()V
                :try_end
                return-void
                :catch
                move-exception v0
                return-void
            """.trimIndent())
        }
        billingClientImplClass.methods.add(morpheSavePurchaseMethod)

        // ═══ Load Purchase from File ═══
        val morpheLoadPurchaseMethod = ImmutableMethod(
            billingClientImplClass.type,
            "morpheLoadPurchase",
            listOf(),
            "Ljava/lang/String;",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(5)
        ).toMutable().apply {
            addInstructionsWithLabels(0, """
                :try_start
                new-instance v0, Ljava/io/BufferedReader;
                new-instance v1, Ljava/io/InputStreamReader;
                new-instance v2, Ljava/io/FileInputStream;
                const-string v3, "$PURCHASE_FILE"
                invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
                invoke-direct {v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V
                invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
                invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
                move-result-object v1
                invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
                :try_end
                return-object v1
                :catch
                move-exception v0
                const/4 v1, 0x0
                return-object v1
            """.trimIndent())
        }
        billingClientImplClass.methods.add(morpheLoadPurchaseMethod)

        val morpheFakePurchase = ImmutableMethod(
            billingClientImplClass.type,
            "morpheFakePurchase",
            listOf(
                ImmutableMethodParameter(
                    "Lcom/android/billingclient/api/BillingFlowParams;",
                    null,
                    null
                )
            ),
            "Lcom/android/billingclient/api/BillingResult;",
            AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
            null,
            null,
            MutableMethodImplementation(11)
        ).toMutable().apply {
            addInstructionsWithLabels(0, """
                const-string v7, "[MORPHE] morpheFakePurchase called"
                invoke-static {v7}, Lcom/android/billingclient/api/BillingClientImpl;->morpheLog(Ljava/lang/String;)V
                invoke-static {}, Lcom/android/billingclient/api/BillingResult;->newBuilder()$BILLING_RESULT_BUILDER
                move-result-object v0
                const/4 v1, 0x0
                invoke-virtual {v0, v1}, $BILLING_RESULT_BUILDER->setResponseCode(I)$BILLING_RESULT_BUILDER
                move-result-object v0
                invoke-virtual {v0}, $BILLING_RESULT_BUILDER->build()Lcom/android/billingclient/api/BillingResult;
                move-result-object v0
                invoke-virtual {p1}, Lcom/android/billingclient/api/BillingFlowParams;->zzg()Ljava/util/ArrayList;
                move-result-object v1
                invoke-virtual {v1}, Ljava/util/ArrayList;->size()I
                move-result v2
                if-lez v2, :try_sku
                const/4 v2, 0x0
                invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
                move-result-object v1
                check-cast v1, $BFP_PRODUCT_DETAILS_PARAMS
                invoke-virtual {v1}, $BFP_PRODUCT_DETAILS_PARAMS->zza()Lcom/android/billingclient/api/ProductDetails;
                move-result-object v1
                invoke-virtual {v1}, Lcom/android/billingclient/api/ProductDetails;->getProductId()Ljava/lang/String;
                move-result-object v4
                goto :json_build
                :try_sku
                invoke-virtual {p1}, Lcom/android/billingclient/api/BillingFlowParams;->zzh()Ljava/util/List;
                move-result-object v1
                if-eqz v1, :sku_done
                invoke-interface {v1}, Ljava/util/List;->size()I
                move-result v2
                if-lez v2, :sku_done
                const/4 v2, 0x0
                invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;
                move-result-object v1
                check-cast v1, $BFP_PRODUCT_DETAILS_PARAMS
                invoke-virtual {v1}, $BFP_PRODUCT_DETAILS_PARAMS->zza()Lcom/android/billingclient/api/ProductDetails;
                move-result-object v1
                invoke-virtual {v1}, Lcom/android/billingclient/api/ProductDetails;->getProductId()Ljava/lang/String;
                move-result-object v4
                goto :json_build
                :sku_done
                const-string v4, "unknown_sku"
                :json_build
                new-instance v7, Ljava/lang/StringBuilder;
                invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V
                const-string v8, "[MORPHE] SKU="
                invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                move-result-object v7
                invoke-static {v7}, Lcom/android/billingclient/api/BillingClientImpl;->morpheLog(Ljava/lang/String;)V
                invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
                move-result-wide v2
                invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;
                move-result-object v2
                new-instance v1, Ljava/lang/StringBuilder;
                invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
                const-string v3, "{\"orderId\":\"morphe-"
                invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                const-string v3, "-"
                invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                const-string v3, "\",\"packageName\":\"com.nekki.shadowfight\",\"productId\":\""
                invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                const-string v3, "\",\"purchaseTime\":"
                invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                const-string v3, ",\"purchaseState\":0,\"purchaseToken\":\"morphe-"
                invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                const-string v3, "-"
                invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                const-string v3, "\",\"quantity\":1,\"acknowledged\":false}"
                invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                move-result-object v5
                const-string v2, ""
                new-instance v3, Lcom/android/billingclient/api/Purchase;
                invoke-direct {v3, v5, v2}, Lcom/android/billingclient/api/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V
                const-string v8, "[MORPHE] saving purchase to file..."
                invoke-static {v8}, Lcom/android/billingclient/api/BillingClientImpl;->morpheLog(Ljava/lang/String;)V
                invoke-static {v5}, Lcom/android/billingclient/api/BillingClientImpl;->morpheSavePurchase(Ljava/lang/String;)V
                iget-object v1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zze:Lcom/android/billingclient/api/zzn;
                const-string v7, "[MORPHE] checking zze field..."
                invoke-static {v7}, Lcom/android/billingclient/api/BillingClientImpl;->morpheLog(Ljava/lang/String;)V
                if-eqz v1, :done
                invoke-virtual {v1}, Lcom/android/billingclient/api/zzn;->zzd()Lcom/android/billingclient/api/PurchasesUpdatedListener;
                move-result-object v1
                const-string v7, "[MORPHE] checking listener..."
                invoke-static {v7}, Lcom/android/billingclient/api/BillingClientImpl;->morpheLog(Ljava/lang/String;)V
                if-eqz v1, :done
                const-string v7, "[MORPHE] delivering purchase!"
                invoke-static {v7}, Lcom/android/billingclient/api/BillingClientImpl;->morpheLog(Ljava/lang/String;)V
                invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;
                move-result-object v2
                invoke-interface {v1, v0, v2}, Lcom/android/billingclient/api/PurchasesUpdatedListener;->onPurchasesUpdated(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
                :done
                const-string v7, "[MORPHE] morpheFakePurchase done"
                invoke-static {v7}, Lcom/android/billingclient/api/BillingClientImpl;->morpheLog(Ljava/lang/String;)V
                return-object v0
                nop
            """.trimIndent())
        }

        billingClientImplClass.methods.add(morpheFakePurchase)

        IAPBypassSecurityVerifyStepFingerprint.method.addInstructionsWithLabels(0, """
            const-string v0, "[MORPHE] VerifyStep bypassed"
            invoke-static {v0}, Lcom/android/billingclient/api/BillingClientImpl;->morpheLog(Ljava/lang/String;)V
            invoke-static {}, Lcom/nekki/utils/security/SecurityManager;->NotifyOnSuccess()V
            return-void
        """.trimIndent())

        IAPBypassLaunchBillingFlowFingerprint.method.addInstructionsWithLabels(0, """
            const-string v0, "[MORPHE] launchBillingFlow intercepted"
            invoke-static {v0}, Lcom/android/billingclient/api/BillingClientImpl;->morpheLog(Ljava/lang/String;)V
            move-object/from16 v0, p0
            move-object/from16 v1, p2
            invoke-direct {v0, v1}, Lcom/android/billingclient/api/BillingClientImpl;->morpheFakePurchase(Lcom/android/billingclient/api/BillingFlowParams;)Lcom/android/billingclient/api/BillingResult;
            move-result-object v0
            return-object v0
        """.trimIndent())

        IAPBypassAcknowledgePurchaseFingerprint.method.addInstructions(0, """
            const-string v0, "[MORPHE] acknowledgePurchase called"
            invoke-static {v0}, Lcom/android/billingclient/api/BillingClientImpl;->morpheLog(Ljava/lang/String;)V
            sget-object v0, Lcom/android/billingclient/api/zzcj;->zzl:Lcom/android/billingclient/api/BillingResult;
            invoke-interface {p2, v0}, Lcom/android/billingclient/api/AcknowledgePurchaseResponseListener;->onAcknowledgePurchaseResponse(Lcom/android/billingclient/api/BillingResult;)V
            return-void
        """.trimIndent())

        IAPBypassConsumeAsyncFingerprint.method.addInstructions(0, """
            const-string v0, "[MORPHE] consumeAsync called"
            invoke-static {v0}, Lcom/android/billingclient/api/BillingClientImpl;->morpheLog(Ljava/lang/String;)V
            sget-object v0, Lcom/android/billingclient/api/zzcj;->zzl:Lcom/android/billingclient/api/BillingResult;
            invoke-virtual {p1}, Lcom/android/billingclient/api/ConsumeParams;->getPurchaseToken()Ljava/lang/String;
            move-result-object v1
            invoke-interface {p2, v0, v1}, Lcom/android/billingclient/api/ConsumeResponseListener;->onConsumeResponse(Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)V
            return-void
        """.trimIndent())

        IAPBypassQueryProductDetailsAsyncFingerprint.method.addInstructionsWithLabels(0, """
            const-string v0, "[MORPHE] queryProductDetailsAsync called"
            invoke-static {v0}, Lcom/android/billingclient/api/BillingClientImpl;->morpheLog(Ljava/lang/String;)V
            invoke-virtual {p1}, Lcom/android/billingclient/api/QueryProductDetailsParams;->zza()Lcom/google/android/gms/internal/play_billing/zzco;
            move-result-object v1
            new-instance v2, Ljava/util/ArrayList;
            invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V
            const/4 v3, 0x0
            :cond_loop
            invoke-interface {v1}, Ljava/util/List;->size()I
            move-result v4
            if-ge v3, v4, :done
            new-instance v0, Ljava/lang/StringBuilder;
            invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
            const-string v4, "{\"productId\":\""
            invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;
            move-result-object v4
            check-cast v4, $QUERY_PRODUCT
            invoke-virtual {v4}, $QUERY_PRODUCT->zza()Ljava/lang/String;
            move-result-object v4
            invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            const-string v5, "\",\"type\":\"inapp\",\"title\":\"Morphe Item\",\"name\":\"Morphe Item\",\"price\":\"${'$'}1.99\",\"priceCurrencyCode\":\"USD\",\"originalPrice\":\"${'$'}1.99\",\"originalPriceAmountMicros\":1990000,\"priceAmountMicros\":1990000}"
            invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
            move-result-object v4
            new-instance v5, Lcom/android/billingclient/api/ProductDetails;
            invoke-direct {v5, v4}, Lcom/android/billingclient/api/ProductDetails;-><init>(Ljava/lang/String;)V
            invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
            add-int/lit8 v3, v3, 0x1
            goto :cond_loop
            :done
            invoke-static {}, Lcom/android/billingclient/api/BillingResult;->newBuilder()$BILLING_RESULT_BUILDER
            move-result-object v0
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, $BILLING_RESULT_BUILDER->setResponseCode(I)$BILLING_RESULT_BUILDER
            move-result-object v0
            invoke-virtual {v0}, $BILLING_RESULT_BUILDER->build()Lcom/android/billingclient/api/BillingResult;
            move-result-object v0
            invoke-interface {p2, v0, v2}, Lcom/android/billingclient/api/ProductDetailsResponseListener;->onProductDetailsResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
            return-void
            nop
        """.trimIndent())

        IAPBypassQueryPurchasesAsyncFingerprint.method.addInstructions(0, """
            const-string v0, "[MORPHE] queryPurchasesAsync called"
            invoke-static {v0}, Lcom/android/billingclient/api/BillingClientImpl;->morpheLog(Ljava/lang/String;)V
            sget-object v0, Lcom/android/billingclient/api/zzcj;->zzl:Lcom/android/billingclient/api/BillingResult;
            new-instance v1, Ljava/util/ArrayList;
            invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
            invoke-static {}, Lcom/android/billingclient/api/BillingClientImpl;->morpheLoadPurchase()Ljava/lang/String;
            move-result-object v2
            if-eqz v2, :no_purchase
            new-instance v3, Lcom/android/billingclient/api/Purchase;
            const-string v4, ""
            invoke-direct {v3, v2, v4}, Lcom/android/billingclient/api/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V
            invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;
            move-result-object v1
            const-string v2, "[MORPHE] queryPurchasesAsync returning stored purchase"
            invoke-static {v2}, Lcom/android/billingclient/api/BillingClientImpl;->morpheLog(Ljava/lang/String;)V
            :no_purchase
            invoke-interface {p2, v0, v1}, Lcom/android/billingclient/api/PurchasesResponseListener;->onQueryPurchasesResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
            return-void
        """.trimIndent())

        IAPBypassStartConnectionFingerprint.method.addInstructions(0, """
            const-string v0, "[MORPHE] startConnection hooked - faking connected state"
            invoke-static {v0}, Lcom/android/billingclient/api/BillingClientImpl;->morpheLog(Ljava/lang/String;)V
            const/4 v0, 0x2
            invoke-direct {p0, v0}, Lcom/android/billingclient/api/BillingClientImpl;->zzaJ(I)V
            sget-object v0, Lcom/android/billingclient/api/zzcj;->zzl:Lcom/android/billingclient/api/BillingResult;
            invoke-interface {p1, v0}, Lcom/android/billingclient/api/BillingClientStateListener;->onBillingSetupFinished(Lcom/android/billingclient/api/BillingResult;)V
            return-void
        """.trimIndent())
    }
}
