package app.hh.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation

/**
 * Replaces an EntitlementInfos map getter with a synthetic active entitlement.
 *
 * RevenueCat's Flutter bridge serializes this map into CustomerInfo.entitlements,
 * which lets the app keep using its normal feature-gating path without a billing
 * transaction.
 */
context(_: BytecodePatchContext)
internal fun MutableMethod.returnActiveRevenueCatEntitlements(
    entitlementIds: List<String>,
    productId: String,
) {
    if (implementation == null) {
        throw PatchException("RevenueCat entitlement getter has no implementation.")
    }
    if (entitlementIds.isEmpty()) {
        throw PatchException("At least one RevenueCat entitlement identifier is required.")
    }

    // v0..v16 are used by EntitlementInfo's 17-register constructor call.
    // Keep the non-static p0 parameter outside that range at v17.
    ensureRegisters(18)
    clearInstructions()

    val mapEntries = entitlementIds.distinct().joinToString("\n") { entitlementId ->
        """
        const-string v2, "$entitlementId"
        invoke-interface { v1, v2, v0 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        """.trimIndent()
    }

    addInstructions(
        0,
        """
            # Build the non-null purchase dates required by EntitlementInfo.
            const-wide/16 v1, 0x0
            new-instance v0, Ljava/util/Date;
            invoke-direct { v0, v1, v2 }, Ljava/util/Date;-><init>(J)V
            move-object v5, v0
            new-instance v6, Ljava/util/Date;
            invoke-direct { v6, v1, v2 }, Ljava/util/Date;-><init>(J)V

            # Build an active, non-expiring Play Store entitlement.
            new-instance v0, Lcom/revenuecat/purchases/EntitlementInfo;
            const-string v1, "${entitlementIds.first()}"
            const/4 v2, 0x1
            const/4 v3, 0x1
            sget-object v4, Lcom/revenuecat/purchases/PeriodType;->NORMAL:Lcom/revenuecat/purchases/PeriodType;
            # v5 and v6 contain latest/original purchase dates.
            const/4 v7, 0x0
            sget-object v8, Lcom/revenuecat/purchases/Store;->PLAY_STORE:Lcom/revenuecat/purchases/Store;
            const-string v9, "$productId"
            const/4 v10, 0x0
            const/4 v11, 0x0
            const/4 v12, 0x0
            const/4 v13, 0x0
            sget-object v14, Lcom/revenuecat/purchases/OwnershipType;->PURCHASED:Lcom/revenuecat/purchases/OwnershipType;
            new-instance v15, Lorg/json/JSONObject;
            invoke-direct { v15 }, Lorg/json/JSONObject;-><init>()V
            sget-object v16, Lcom/revenuecat/purchases/VerificationResult;->VERIFIED:Lcom/revenuecat/purchases/VerificationResult;
            invoke-direct/range { v0 .. v16 }, Lcom/revenuecat/purchases/EntitlementInfo;-><init>(Ljava/lang/String;ZZLcom/revenuecat/purchases/PeriodType;Ljava/util/Date;Ljava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/Store;Ljava/lang/String;Ljava/lang/String;ZLjava/util/Date;Ljava/util/Date;Lcom/revenuecat/purchases/OwnershipType;Lorg/json/JSONObject;Lcom/revenuecat/purchases/VerificationResult;)V

            new-instance v1, Ljava/util/HashMap;
            invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
            $mapEntries
            return-object v1
        """.trimIndent(),
    )
}

context(_: BytecodePatchContext)
internal fun MutableMethod.returnPurchasedProduct(productId: String) {
    clearInstructions()
    addInstructions(
        0,
        """
            const-string v0, "$productId"
            invoke-static { v0 }, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;
            move-result-object v0
            return-object v0
        """.trimIndent(),
    )
}

context(_: BytecodePatchContext)
internal fun MutableMethod.returnTrueEarly() {
    clearInstructions()
    addInstructions(
        0,
        """
            const/4 v0, 0x1
            return v0
        """.trimIndent(),
    )
}

context(_: BytecodePatchContext)
internal fun MutableMethod.returnVerifiedRevenueCatEntitlements() {
    clearInstructions()
    addInstructions(
        0,
        """
            sget-object v0, Lcom/revenuecat/purchases/VerificationResult;->VERIFIED:Lcom/revenuecat/purchases/VerificationResult;
            return-object v0
        """.trimIndent(),
    )
}

private fun MutableMethod.ensureRegisters(needed: Int) {
    val implementation = implementation ?: return
    if (implementation.registerCount >= needed) return

    val registerCountField = MutableMethodImplementation::class.java.declaredFields
        .firstOrNull { field -> field.type == Int::class.javaPrimitiveType }
        ?.apply { isAccessible = true }
        ?: throw PatchException(
            "Could not resize RevenueCat method registers; dexlib2 layout changed.",
        )

    registerCountField.setInt(implementation, needed)
}

private fun MutableMethod.clearInstructions() {
    val implementation = implementation
        ?: throw PatchException("RevenueCat method has no implementation.")
    repeat(implementation.instructions.count()) {
        implementation.removeInstruction(0)
    }
}
