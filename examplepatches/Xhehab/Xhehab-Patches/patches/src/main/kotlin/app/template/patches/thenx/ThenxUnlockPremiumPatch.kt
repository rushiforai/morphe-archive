package app.template.patches.thenx

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.pairip.disablePairIpLicenseCheckPatch
import app.template.patches.shared.Constants.THENX_COMPATIBILITY
import app.template.patches.shared.replaceImplementation
import app.template.patches.shared.returnEarlyBoolean
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * THENX (native Compose + RevenueCat + backend UserApiModel.isPro).
 *
 * Premium is gated mainly by UserApiModel.isPro from the API. RC entitlement
 * maps are spoofed as a second layer for client-side Purchases checks.
 *
 * Membership UI (Settings subtitle, Membership Details) reads
 * MyUserCompoundModel.plan / .subscription from the API — those are spoofed
 * so the screen no longer shows "null/null" or "No subscription found".
 *
 * Note: EntitlementInfo date getters / VERIFIED verification previously crashed
 * the RC verifier — keep map values null and force isActive/isPro instead.
 */
private const val THENX_ENTITLEMENT_ID = "premium"
private const val THENX_PRODUCT_ID = "thenx_premium"
private const val THENX_PLAN_NAME = "Yearly"
private const val THENX_PLAN_INTERVAL = "year"
private const val THENX_PERIOD_END = "2035-07-09"
private const val THENX_PRICE = "119.99"
private const val THENX_CURRENCY = "USD"

@Suppress("unused")
val thenxUnlockPremiumPatch = bytecodePatch(
    name = "Unlock THENX Premium",
    description = "Unlock all Paid features",
    default = true
) {
    compatibleWith(THENX_COMPATIBILITY)
    dependsOn(disablePairIpLicenseCheckPatch)

    execute {
        // 1) Backend pro flag — primary gate for paywall / membership UI
        ThenxUserApiModelIsProFingerprint
            .match(classDefBy(ThenxUserApiModelIsProFingerprint.definingClass!!))
            .method
            .apply {
                addInstructions(
                    0,
                    """
                    const/4 v0, 0x1
                    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                    move-result-object v0
                    return-object v0
                    """
                )
            }

        // 2) Content-level hasAccess flags
        listOf(
            ThenxExerciseHasAccessFingerprint,
            ThenxWorkoutHasAccessFingerprint
        ).forEach { fingerprint ->
            fingerprint
                .match(classDefBy(fingerprint.definingClass!!))
                .method
                .apply {
                    addInstructions(
                        0,
                        """
                        const/4 v0, 0x1
                        invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                        move-result-object v0
                        return-object v0
                        """
                    )
                }
        }

        // 3) Spoof plan so Settings shows "Yearly/year" instead of "null/null"
        //    (invoke-direct max 5 regs; use /range for safety)
        ThenxMyUserPlanFingerprint
            .match(classDefBy(ThenxMyUserPlanFingerprint.definingClass!!))
            .let { match ->
                match.classDef.replaceImplementation(
                    match.method,
                    registerCount = 6,
                    smali = """
                    new-instance v0, Lcom/sysops/thenx/data/model2023/model/PlanApiModel;
                    const/4 v1, 0x1
                    const-string v2, "$THENX_PLAN_NAME"
                    const-string v3, "$THENX_PLAN_INTERVAL"
                    const/4 v4, 0x1
                    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                    move-result-object v4
                    invoke-direct/range {v0 .. v4}, Lcom/sysops/thenx/data/model2023/model/PlanApiModel;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V
                    return-object v0
                    """
                )
            }

        // 4) Spoof subscription so Membership Details is not empty
        //    8-arg ctor requires invoke-direct/range (non-range max is 5 regs)
        ThenxMyUserSubscriptionFingerprint
            .match(classDefBy(ThenxMyUserSubscriptionFingerprint.definingClass!!))
            .let { match ->
                match.classDef.replaceImplementation(
                    match.method,
                    registerCount = 8,
                    smali = """
                    new-instance v0, Lcom/sysops/thenx/data/model2023/model/SubscriptionApiModel;
                    const/4 v1, 0x1
                    const-string v2, "$THENX_PERIOD_END"
                    sget-object v3, Lcom/sysops/thenx/data/model2023/model/PaymentGatewayApiModel;->GOOGLE:Lcom/sysops/thenx/data/model2023/model/PaymentGatewayApiModel;
                    sget-object v4, Lcom/sysops/thenx/data/model2023/model/SubscriptionStatusApiModel;->ACTIVE:Lcom/sysops/thenx/data/model2023/model/SubscriptionStatusApiModel;
                    const/4 v5, 0x0
                    const-string v6, "$THENX_PRICE"
                    const-string v7, "$THENX_CURRENCY"
                    invoke-direct/range {v0 .. v7}, Lcom/sysops/thenx/data/model2023/model/SubscriptionApiModel;-><init>(ILjava/lang/String;Lcom/sysops/thenx/data/model2023/model/PaymentGatewayApiModel;Lcom/sysops/thenx/data/model2023/model/SubscriptionStatusApiModel;ZLjava/lang/String;Ljava/lang/String;)V
                    return-object v0
                    """
                )
            }

        // 5) RC EntitlementInfo.isActive always true (safe; no verifier side-effects)
        ThenxEntitlementInfoIsActiveFingerprint
            .match(classDefBy(ThenxEntitlementInfoIsActiveFingerprint.definingClass!!))
            .method
            .returnEarlyBoolean(true)

        // 6) Non-empty activeSubscriptions / purchased product ids
        listOf(
            ThenxCustomerInfoActiveSubscriptionsFingerprint,
            ThenxCustomerInfoAllPurchasedProductIdsFingerprint
        ).forEach { fingerprint ->
            fingerprint.match(classDefBy(fingerprint.definingClass!!)).let { match ->
                match.classDef.replaceImplementation(
                    match.method,
                    registerCount = 2,
                    smali = """
                    const-string v0, "$THENX_PRODUCT_ID"
                    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;
                    move-result-object v0
                    return-object v0
                    """
                )
            }
        }

        // 7) EntitlementInfos active/all non-empty (null values — avoids verifier crash)
        listOf(
            ThenxEntitlementInfosActiveFingerprint,
            ThenxEntitlementInfosAllFingerprint
        ).forEach { fingerprint ->
            fingerprint.match(classDefBy(fingerprint.definingClass!!)).let { match ->
                match.classDef.replaceImplementation(
                    match.method,
                    registerCount = 3,
                    smali = """
                    const-string v0, "$THENX_ENTITLEMENT_ID"
                    const/4 v1, 0x0
                    invoke-static {v0, v1}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;
                    move-result-object v0
                    return-object v0
                    """
                )
            }
        }

        // 8) Force empty-check on active map to false in RC customer-info coroutine
        ThenxCustomerInfoActiveCheckFingerprint
            .match(classDefBy(ThenxCustomerInfoActiveCheckFingerprint.definingClass!!))
            .method
            .apply {
                val isEmptyIndex = instructions.indexOfFirst { instruction ->
                    instruction is ReferenceInstruction &&
                        (instruction.reference as? MethodReference)?.let { reference ->
                            reference.definingClass == "Ljava/util/Map;" &&
                                reference.name == "isEmpty" &&
                                reference.returnType == "Z"
                        } == true
                }
                if (isEmptyIndex < 0) error("THENX: active entitlement empty check not found.")

                val resultIndex = isEmptyIndex + 1
                val resultRegister = (instructions[resultIndex] as? OneRegisterInstruction)?.registerA
                    ?: error("THENX: active entitlement empty-check result register not found.")

                replaceInstruction(resultIndex, "const/16 v$resultRegister, 0x0")
            }
    }
}
