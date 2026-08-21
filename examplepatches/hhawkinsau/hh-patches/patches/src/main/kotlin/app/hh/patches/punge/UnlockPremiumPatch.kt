package app.hh.patches.punge

import app.hh.patches.shared.Constants.COMPATIBILITY_PUNGE
import app.hh.patches.shared.returnActiveRevenueCatEntitlements
import app.hh.patches.shared.returnPurchasedProduct
import app.hh.patches.shared.returnTrueEarly
import app.hh.patches.shared.returnVerifiedRevenueCatEntitlements
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

private const val PRODUCT_ID = "punge_standard"
private val ENTITLEMENT_IDS = listOf(
    "unlocked",
    "punge_standard",
    "premium",
    "pro",
    "standard",
)

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Punge premium",
    description = "Unlocks Punge's paid feature gates by making RevenueCat report an active entitlement.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PUNGE)

    execute {
        val active = EntitlementInfosGetActiveFingerprint.methodOrNull
        val all = EntitlementInfosGetAllFingerprint.methodOrNull
        val isActive = EntitlementInfoIsActiveFingerprint.methodOrNull
        val verification = EntitlementInfosVerificationFingerprint.methodOrNull
        val activeSubscriptions = ActiveSubscriptionsFingerprint.methodOrNull
        val purchasedProducts = PurchasedProductsFingerprint.methodOrNull

        if (
            active == null ||
            all == null ||
            isActive == null ||
            verification == null ||
            activeSubscriptions == null ||
            purchasedProducts == null
        ) {
            throw PatchException(
                "Could not find Punge's RevenueCat entitlement checks. " +
                    "The app may have changed; no changes applied.",
            )
        }

        active.returnActiveRevenueCatEntitlements(ENTITLEMENT_IDS, PRODUCT_ID)
        all.returnActiveRevenueCatEntitlements(ENTITLEMENT_IDS, PRODUCT_ID)
        isActive.returnTrueEarly()
        verification.returnVerifiedRevenueCatEntitlements()
        activeSubscriptions.returnPurchasedProduct(PRODUCT_ID)
        purchasedProducts.returnPurchasedProduct(PRODUCT_ID)
    }
}

private object EntitlementInfosGetActiveFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;",
    name = "getActive",
    parameters = listOf(),
    returnType = "Ljava/util/Map;",
)

private object EntitlementInfosGetAllFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;",
    name = "getAll",
    parameters = listOf(),
    returnType = "Ljava/util/Map;",
)

private object EntitlementInfoIsActiveFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfo;",
    name = "isActive",
    parameters = listOf(),
    returnType = "Z",
)

private object EntitlementInfosVerificationFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;",
    name = "getVerification",
    parameters = listOf(),
    returnType = "Lcom/revenuecat/purchases/VerificationResult;",
)

private object ActiveSubscriptionsFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/CustomerInfo;",
    name = "getActiveSubscriptions",
    parameters = listOf(),
    returnType = "Ljava/util/Set;",
)

private object PurchasedProductsFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/CustomerInfo;",
    name = "getAllPurchasedProductIds",
    parameters = listOf(),
    returnType = "Ljava/util/Set;",
)
