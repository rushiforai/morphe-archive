package app.template.patches.boostcamp

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.BOOSTCAMP_COMPATIBILITY
import app.template.patches.shared.injectRevenueCatHybridCustomerInfo
import app.template.patches.shared.replaceImplementation
import app.template.patches.shared.returnEarlyVoid
import app.template.patches.shared.revenueCatHybridCustomerInfoMapFingerprint

/**
 * Boostcamp (React Native + RevenueCat hybridcommon).
 *
 * Primary entitlement: `premium_entitlement` (from RC promo product IDs
 * `rc_promo_premium_entitlement_{monthly|yearly|lifetime|...}`).
 *
 * Layers:
 * 1) Hybrid CustomerInfo map spoof (JS unlock)
 * 2) Native EntitlementInfos active/all non-empty
 * 3) EntitlementInfosMapper spoof (safe hybrid path even with null values)
 * 4) No-op RC paywall presenters (resolve Promise so JS does not hang)
 */
private const val PRIMARY_ENTITLEMENT = "premium_entitlement"
private const val PRIMARY_PRODUCT = "boostcamp.pro.annual.dec.2023-12-11"
private const val PURCHASE_DATE = "2026-07-09T00:00:00.000Z"
private const val EXPIRATION_DATE = "2035-07-09T00:00:00.000Z"
private const val PURCHASE_DATE_MILLIS = "0x19f442c9400L"
private const val EXPIRATION_DATE_MILLIS = "0x1e163b3d800L"

private val BOOSTCAMP_ENTITLEMENT_IDS = listOf(
    PRIMARY_ENTITLEMENT,
    "pro",
    "premium",
    "plus",
    "subscription",
    "membership",
    "coach_pro",
    "AI_PRO",
    "ai_pro",
    "full_access",
    "all_access",
    "entitlement_monthly",
    "entitlement_yearly",
    "entitlement_lifetime",
    "entitlement_six_month",
    "entitlement_three_month"
)

private val BOOSTCAMP_PRODUCT_IDS = listOf(
    PRIMARY_PRODUCT,
    "ANDOID_ANNUAL_PRO_59_99_2025",
    "ANDROID_MONTHLY_PRO_14_99_2025",
    "ANDROID_ANNUAL_PRO_NEW",
    "ANDROID_MONTHLY_PRO_NEW",
    "ANDROID_ANNUAL_PRO_REFERRAL",
    "ANDROID_MONTHLY_PRO_REFERRAL",
    "ANDROID_AFFILIATE_ANNUAL_PRO_59_99",
    "ANDROID_AFFILIATE_MONTHLY_PRO_14_99",
    "ANDROID_ANNUAL_PRODUCT_ID",
    "ANDROID_MONTHLY_PRODUCT_ID",
    "boostcamp.pro.monthly.dec.2023-12-24",
    "boostcamp.pro.annual.59.99.14.days.free",
    "boostcamp.pro.annual.referralCode",
    "boostcamp.pro.monthly.14.99.14.days.freeTrial",
    "boostcamp.pro.monthly.referral",
    "boostcamp_premium_annual_subscription",
    "boostcamp_premium_annual_subscription:annual-sub-plan-1",
    "boostcamp_premium_monthly_subscription",
    "boostcamp_premium_monthly_subscription:monthly-sub-plan-1",
    "boostcamp_pro:pro-annual-referral_channel",
    "boostcamp_pro:pro-monthly-referral",
    "boostcamp_pro_test_prices:pro-annual-59-99-14-days-free-trial",
    "boostcamp_pro_test_prices:pro-annual-39-99",
    "rc_promo_premium_entitlement_monthly",
    "rc_promo_premium_entitlement_yearly",
    "rc_promo_premium_entitlement_lifetime",
    "rc_promo_premium_entitlement_six_month",
    "rc_promo_premium_entitlement_three_month",
    "IOS_AFFILIATE_ANNUAL_PRO_59_99",
    "IOS_AFFILIATE_MONTHLY_PRO_14_99",
    "IOS_ANNUAL_PRODUCT_ID",
    "IOS_MONTHLY_PRODUCT_ID",
    "IOS_ANNUAL_PRO_59_99_2025",
    "IOS_ANNUAL_PRO_NEW",
    "IOS_MONTHLY_PRO_14_99_2025",
    "IOS_MONTHLY_PRO_NEW",
    "IOS_MONTHLY_PRO",
    "IOS_ANNUAL_PRO_REFERRAL"
)

@Suppress("unused")
val boostcampUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Boostcamp Premium",
    description = "Unlock all Paid features",
    default = true
) {
    compatibleWith(BOOSTCAMP_COMPATIBILITY)

    execute {
        // 1) Hybrid CustomerInfo map → JS sees active premium_entitlement
        val customerInfoMap = revenueCatHybridCustomerInfoMapFingerprint()
        customerInfoMap
            .match(classDefBy(customerInfoMap.definingClass!!))
            .method
            .injectRevenueCatHybridCustomerInfo(
                appName = "Boostcamp",
                primaryEntitlement = PRIMARY_ENTITLEMENT,
                primaryProduct = PRIMARY_PRODUCT,
                entitlementIds = BOOSTCAMP_ENTITLEMENT_IDS.filter { it != PRIMARY_ENTITLEMENT },
                productIds = BOOSTCAMP_PRODUCT_IDS.filter { it != PRIMARY_PRODUCT }
            )

        // 2) Native getActive/getAll non-empty (earlier “has entitlement” checks)
        val entitlementMapSmali = buildNativeEntitlementMapSmali()
        listOf(
            BoostcampEntitlementInfosActiveFingerprint,
            BoostcampEntitlementInfosAllFingerprint
        ).forEach { fingerprint ->
            fingerprint.match(classDefBy(fingerprint.definingClass!!)).let { match ->
                match.classDef.replaceImplementation(
                    match.method,
                    registerCount = 4,
                    smali = entitlementMapSmali
                )
            }
        }

        // 3) Hybrid EntitlementInfosMapper: full spoof so map() never NPEs on null values
        BoostcampEntitlementInfosMapperFingerprint
            .match(classDefBy(BoostcampEntitlementInfosMapperFingerprint.definingClass!!))
            .let { match ->
                match.classDef.replaceImplementation(
                    match.method,
                    registerCount = 10,
                    smali = buildEntitlementInfosMapperSmali()
                )
            }

        // 4) No-op RC paywalls; always resolve Promise so RN does not hang
        fun noOpPaywallWithPromise(
            fingerprint: Fingerprint,
            promiseRegister: Int,
            registerCount: Int
        ) {
            fingerprint.match(classDefBy(fingerprint.definingClass!!)).let { match ->
                match.classDef.replaceImplementation(
                    match.method,
                    registerCount = registerCount,
                    smali = """
                    const-string v0, "CANCELLED"
                    invoke-interface {v$promiseRegister, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                    return-void
                    """
                )
            }
        }

        noOpPaywallWithPromise(
            fingerprint = BoostcampPresentPaywallIfNeededFingerprint,
            promiseRegister = 7,
            registerCount = 8
        )
        noOpPaywallWithPromise(
            fingerprint = BoostcampPresentPaywallPublicFingerprint,
            promiseRegister = 6,
            registerCount = 7
        )
        noOpPaywallWithPromise(
            fingerprint = BoostcampPresentPaywallPrivateFingerprint,
            promiseRegister = 7,
            registerCount = 8
        )

        // Fragment helper overloads (no Promise) — return immediately
        classDefBy(BoostcampPresentPaywallFromFragmentFingerprint.definingClass!!)
            .methods
            .filterIsInstance<MutableMethod>()
            .filter { it.name == "presentPaywallFromFragment" && it.returnType == "V" }
            .forEach { method -> method.returnEarlyVoid() }
    }
}

/** Native EntitlementInfos.getActive/getAll → non-empty map of entitlement id → null */
private fun buildNativeEntitlementMapSmali(): String {
    val puts = BOOSTCAMP_ENTITLEMENT_IDS.distinct().joinToString("\n") { id ->
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

/**
 * Spoofed result of EntitlementInfosMapperKt.map — same shape as hybridcommon
 * (active / all / verification) with a full EntitlementInfo map for each id.
 */
private fun buildEntitlementInfosMapperSmali(): String {
    val entitlementPuts = BOOSTCAMP_ENTITLEMENT_IDS.distinct().joinToString("\n") { id ->
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
