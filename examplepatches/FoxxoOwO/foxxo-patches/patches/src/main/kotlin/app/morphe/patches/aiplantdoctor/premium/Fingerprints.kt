package app.morphe.patches.aiplantdoctor.premium

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints the method that converts List<Purchase> to List<PurchaseWrapper>.
 * In me.jodoin.aiplantdoctor, this is Landroid/support/v4/media/session/b;->n(List)List.
 *
 * Identified by strings:
 *   "orderId", "purchaseToken", "purchaseTime", "acknowledged"
 */
internal object ConvertPurchasesListFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    strings = listOf(
        "orderId",
        "purchaseToken",
        "purchaseTime",
        "acknowledged",
    ),
)

/**
 * Fingerprints the method that converts BillingResult to BillingResultWrapper.
 * In me.jodoin.aiplantdoctor, this is Landroid/support/v4/media/session/b;->m(BillingResult)r8/p.
 *
 * Identified by strings:
 *   "billingResult", "getDebugMessage(...)"
 */
internal object ConvertBillingResultFingerprint : Fingerprint(
    strings = listOf(
        "billingResult",
        "getDebugMessage(...)",
    ),
)
