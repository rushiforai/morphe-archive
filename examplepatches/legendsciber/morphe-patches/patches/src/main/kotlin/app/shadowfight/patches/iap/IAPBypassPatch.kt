package app.shadowfight.patches.iap

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.shadowfight.patches.shared.Constants.COMPATIBILITY_SF2

@Suppress("unused")
val sfIAPBypassSmaliPatch = bytecodePatch(
    name = "Shadow Fight 2 IAP Bypass (Smali)",
    description = "Bypasses anti-tamper + intercepts billing for free IAP.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SF2)
    execute {
        IAPBypassSecurityVerifyStepFingerprint.method.addInstructionsWithLabels(0, """
            invoke-static {}, Lcom/nekki/utils/security/SecurityManager;->NotifyOnSuccess()V
            return-void
        """.trimIndent())

        IAPBypassLaunchBillingFlowFingerprint.method.addInstructionsWithLabels(0, """
            new-instance v0, Ljava/lang/StringBuilder;
            invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V
            const-string v1, "{\"orderId\":\"morphe_bypass\",\"packageName\":\"com.nekki.shadowfight\",\"productIds\":[\"gem_d pack\"],\"purchaseTime\":"
            invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
            move-result-wide v2
            invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;
            move-result-object v1
            invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            const-string v1, ",\"purchaseState\":1,\"purchaseToken\":\"morphe_bypass_token\",\"acknowledged\":true}"
            invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
            invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
            move-result-object v0
            new-instance v1, Lcom/android/billingclient/api/Purchase;
            const-string v2, ""
            invoke-direct {v1, v0, v2}, Lcom/android/billingclient/api/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V
            new-instance v0, Ljava/util/ArrayList;
            invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
            invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            invoke-virtual {v0}, Ljava/util/ArrayList;->size()I
            move-result v1
            new-array v1, v1, [Lcom/android/billingclient/api/Purchase;
            invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
            move-result-object v0
            check-cast v0, [Lcom/android/billingclient/api/Purchase;
            move-object/from16 v3, v0
            const/4 v1, 0x0
            const-string v2, ""
            invoke-static/range {v1 .. v3}, Lcom/android/billingclient/api/zzbm;->nativeOnPurchasesUpdated(ILjava/lang/String;[Lcom/android/billingclient/api/Purchase;)V
            const/4 v0, 0x0
            return v0
        """.trimIndent())
    }
}
