package app.template.patches.myoadapt

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.MYOADAPT_COMPATIBILITY
import app.template.patches.shared.injectRevenueCatHybridCustomerInfo
import app.template.patches.shared.replaceImplementation
import app.template.patches.shared.returnEarlyBoolean
import app.template.patches.shared.revenueCatHybridCustomerInfoMapFingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * MyoAdapt (Expo/RN + RevenueCat hybridcommon + coach.myoadapt.app backend).
 *
 * Real RC: core-access on main_sub (trial expired 2025-08-04 for test account).
 * Home "Unlock full access" is backend/session-gated; RC spoof alone is not enough.
 *
 * Safe layers only (no bytecode inject into okio / OkHttpClientProvider methods —
 * those cause VerifyError):
 * 1) Hybrid CustomerInfo map spoof
 * 2) Native EntitlementInfos + isActive
 * 3) CustomerInfoFactory JSON spoof (confirmed working)
 * 4) MainApplication.onCreate → install OkHttp factory interceptor + clear MMKV
 */
private const val PRIMARY_ENTITLEMENT = "core-access"
private const val PRIMARY_PRODUCT = "main_sub"
private const val PRIMARY_PLAN = "monthly-introductory-affiliate"
private const val PURCHASE_DATE = "2026-07-09T00:00:00.000Z"
private const val EXPIRATION_DATE = "2035-07-09T00:00:00.000Z"
private const val PURCHASE_DATE_MILLIS = "0x19f442c9400L"
private const val EXPIRATION_DATE_MILLIS = "0x1e163b3d800L"

private const val HELPER = "Lapp/xhehab/extension/MyoAdaptSubscriptionSpoof;"

private val MYOADAPT_ENTITLEMENT_IDS = listOf(
    PRIMARY_ENTITLEMENT,
    "duo-access"
)

private val MYOADAPT_PRODUCT_IDS = listOf(
    PRIMARY_PRODUCT,
    "main_sub",
    "main_sub:monthly",
    "main_sub:annual",
    "main_sub:monthly-introductory-affiliate",
    "solo_sub_monthly",
    "solo_sub_annual",
    "duo_sub_monthly",
    "duo_sub_annual"
)

@Suppress("unused")
val myoAdaptUnlockPremiumPatch = bytecodePatch(
    name = "Unlock MyoAdapt Premium",
    description = "Unlock all Paid features",
    default = true
) {
    compatibleWith(MYOADAPT_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // 1) Hybrid CustomerInfo map
        val customerInfoMap = revenueCatHybridCustomerInfoMapFingerprint()
        customerInfoMap
            .match(classDefBy(customerInfoMap.definingClass!!))
            .method
            .injectRevenueCatHybridCustomerInfo(
                appName = "MyoAdapt",
                primaryEntitlement = PRIMARY_ENTITLEMENT,
                primaryProduct = PRIMARY_PRODUCT,
                entitlementIds = MYOADAPT_ENTITLEMENT_IDS.filter { it != PRIMARY_ENTITLEMENT },
                productIds = MYOADAPT_PRODUCT_IDS.filter { it != PRIMARY_PRODUCT },
                productPlanIdentifier = PRIMARY_PLAN
            )

        // 2) Native entitlement maps + mapper + isActive
        val entitlementMapSmali = buildNativeEntitlementMapSmali()
        listOf(
            MyoAdaptEntitlementInfosActiveFingerprint,
            MyoAdaptEntitlementInfosAllFingerprint
        ).forEach { fingerprint ->
            fingerprint.match(classDefBy(fingerprint.definingClass!!)).let { match ->
                match.classDef.replaceImplementation(
                    match.method,
                    registerCount = 4,
                    smali = entitlementMapSmali
                )
            }
        }

        MyoAdaptEntitlementInfosMapperFingerprint
            .match(classDefBy(MyoAdaptEntitlementInfosMapperFingerprint.definingClass!!))
            .let { match ->
                match.classDef.replaceImplementation(
                    match.method,
                    registerCount = 10,
                    smali = buildEntitlementInfosMapperSmali()
                )
            }

        MyoAdaptEntitlementInfoIsActiveFingerprint
            .match(classDefBy(MyoAdaptEntitlementInfoIsActiveFingerprint.definingClass!!))
            .method
            .returnEarlyBoolean(true)

        runCatching {
            MyoAdaptSubscriptionInfoIsActiveFingerprint
                .match(classDefBy(MyoAdaptSubscriptionInfoIsActiveFingerprint.definingClass!!))
                .method
                .returnEarlyBoolean(true)
        }

        // 3) Native RC JSON spoof
        patchCustomerInfoFactory(
            MyoAdaptCustomerInfoFactoryBuildFingerprint
                .match(classDefBy(MyoAdaptCustomerInfoFactoryBuildFingerprint.definingClass!!))
                .classDef
        )

        // 4) Application.onCreate — OkHttp interceptor factory + MMKV clear
        //    Body rewrite is done only inside Java interceptor (no okio bytecode hacks).
        runCatching {
            MyoAdaptMainApplicationOnCreateFingerprint
                .match(classDefBy(MyoAdaptMainApplicationOnCreateFingerprint.definingClass!!))
                .method
                .addInstructions(
                    0,
                    """
                    invoke-static {p0}, $HELPER->install(Landroid/content/Context;)V
                    """.trimIndent()
                )
        }
    }
}

private fun patchCustomerInfoFactory(classDef: MutableClass) {
    val targets = classDef.methods.filterIsInstance<MutableMethod>().filter { method ->
        method.name == "buildCustomerInfo" &&
            method.returnType == "Lcom/revenuecat/purchases/CustomerInfo;" &&
            method.parameters.isNotEmpty() &&
            method.parameters[0].type == "Lorg/json/JSONObject;"
    }

    targets.forEach { method ->
        val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
        val bodyReg = if (isStatic) "p0" else "p1"
        method.addInstructions(
            0,
            """
            invoke-static {$bodyReg}, $HELPER->spoofCustomerInfoJson(Lorg/json/JSONObject;)V
            """.trimIndent()
        )
    }
}

private fun buildNativeEntitlementMapSmali(): String {
    val puts = MYOADAPT_ENTITLEMENT_IDS.distinct().joinToString("\n") { id ->
        """
        const-string v2, "$id"
        invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        """.trimIndent()
    }
    return """
        new-instance v0, Ljava/util/HashMap;
        invoke-direct {v0}, Ljava/util/HashMap;-><init>()V
        const/4 v1, 0x0
        $puts
        return-object v0
    """.trimIndent()
}

private fun buildEntitlementInfosMapperSmali(): String {
    val entitlementPuts = MYOADAPT_ENTITLEMENT_IDS.distinct().joinToString("\n") { id ->
        """
        const-string v2, "$id"
        invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        invoke-interface {v7, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        """.trimIndent()
    }
    return """
        new-instance v1, Ljava/util/HashMap;
        invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

        const-string v2, "identifier"
        const-string v3, "$PRIMARY_ENTITLEMENT"
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
        const-string v4, "$PURCHASE_DATE"
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "latestPurchaseDateMillis"
        const-wide v8, $PURCHASE_DATE_MILLIS
        invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v8
        invoke-interface {v1, v2, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "originalPurchaseDate"
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "originalPurchaseDateMillis"
        invoke-interface {v1, v2, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "expirationDate"
        const-string v4, "$EXPIRATION_DATE"
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "expirationDateMillis"
        const-wide v8, $EXPIRATION_DATE_MILLIS
        invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v8
        invoke-interface {v1, v2, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "store"
        const-string v4, "PLAY_STORE"
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "productIdentifier"
        const-string v4, "$PRIMARY_PRODUCT"
        invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

        const-string v2, "productPlanIdentifier"
        const-string v4, "$PRIMARY_PLAN"
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
        new-instance v7, Ljava/util/HashMap;
        invoke-direct {v7}, Ljava/util/HashMap;-><init>()V
        $entitlementPuts

        const-string v1, "active"
        invoke-interface {v5, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        const-string v1, "all"
        invoke-interface {v5, v1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        const-string v1, "verification"
        const-string v2, "VERIFIED"
        invoke-interface {v5, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        return-object v5
    """.trimIndent()
}
