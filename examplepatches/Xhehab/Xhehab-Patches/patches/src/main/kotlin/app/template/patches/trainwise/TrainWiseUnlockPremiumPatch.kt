package app.template.patches.trainwise

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.pairip.disablePairIpLicenseCheckPatch
import app.template.patches.shared.Constants.TRAINWISE_COMPATIBILITY
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val trainwiseUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlock all Paid features",
    default = true
) {
    compatibleWith(TRAINWISE_COMPATIBILITY)
    dependsOn(disablePairIpLicenseCheckPatch)

    execute {
        CustomerInfoMapFingerprint
            .match(classDefBy(CustomerInfoMapFingerprint.definingClass!!))
            .method
            .apply {
            if (implementation == null) return@apply

            val returnIndex = instructions.indexOfLast { it.opcode.name.startsWith("return-object") }
            if (returnIndex < 0) error("TrainWise: CustomerInfo mapper return-object not found.")

            val returnRegister = (instructions[returnIndex] as OneRegisterInstruction).registerA

            addInstructions(
                returnIndex,
                """
                    move-object v8, v$returnRegister

                    new-instance v0, Ljava/util/HashMap;
                    invoke-direct {v0, v8}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

                    new-instance v1, Ljava/util/HashMap;
                    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

                    const-string v2, "identifier"
                    const-string v3, "full_access"
                    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v2, "isActive"
                    const/4 v4, 0x1
                    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                    move-result-object v4
                    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v2, "willRenew"
                    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v2, "periodType"
                    const-string v4, "NORMAL"
                    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v2, "latestPurchaseDate"
                    const-string v4, "2026-06-07T00:00:00.000Z"
                    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v2, "originalPurchaseDate"
                    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v2, "expirationDate"
                    const-string v4, "2035-06-07T00:00:00.000Z"
                    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v2, "store"
                    const-string v4, "PLAY_STORE"
                    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v2, "productIdentifier"
                    const-string v4, "trainwise_premium"
                    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v2, "productPlanIdentifier"
                    const/4 v4, 0x0
                    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v2, "isSandbox"
                    const/4 v4, 0x0
                    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                    move-result-object v4
                    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v2, "unsubscribeDetectedAt"
                    const/4 v4, 0x0
                    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v2, "unsubscribeDetectedAtMillis"
                    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v2, "billingIssueDetectedAt"
                    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v2, "billingIssueDetectedAtMillis"
                    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v2, "ownershipType"
                    const-string v4, "PURCHASED"
                    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v2, "verification"
                    const-string v4, "VERIFIED"
                    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    new-instance v5, Ljava/util/HashMap;
                    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

                    new-instance v6, Ljava/util/HashMap;
                    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V
                    const-string v2, "full_access"
                    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    new-instance v7, Ljava/util/HashMap;
                    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V
                    invoke-interface {v7, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v1, "active"
                    invoke-interface {v5, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v1, "all"
                    invoke-interface {v5, v1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v1, "verification"
                    const-string v2, "VERIFIED"
                    invoke-interface {v5, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v1, "entitlements"
                    invoke-interface {v0, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v1, "latestExpirationDate"
                    const-string v2, "2035-06-07T00:00:00.000Z"
                    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    new-instance v8, Ljava/util/ArrayList;
                    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V
                    const-string v1, "trainwise_premium"
                    invoke-interface {v8, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
                    const-string v1, "full_access"
                    invoke-interface {v8, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

                    const-string v1, "activeSubscriptions"
                    invoke-interface {v0, v1, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    const-string v1, "allPurchasedProductIdentifiers"
                    invoke-interface {v0, v1, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                    move-object v$returnRegister, v0
                    """.trimIndent()
            )
        }
    }
}
