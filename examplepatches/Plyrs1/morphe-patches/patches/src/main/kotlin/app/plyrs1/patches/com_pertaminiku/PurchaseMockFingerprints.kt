package app.plyrs1.patches.com_pertaminiku

import app.morphe.patcher.Fingerprint

/**
 * Fingerprint for F2.a.f(BillingResult, PurchaseList) - the method that builds Pigeon PurchasesResult
 * from BillingResult and Purchase list.
 * 
 * Target signature: f(LT0/f;Ljava/util/List;)V
 * Parameters: p0 = this (F2/a), p1 = T0/f (BillingResult), p2 = List<Purchase>
 * 
 * This matches the queryPurchasesAsync response handler where we inject our mock purchases.
 */
object QueryPurchasesResponseFingerprint : Fingerprint(
    definingClass = "LF2/a;",
    name = "f",
    returnType = "V",
    parameters = listOf("LT0/f;", "Ljava/util/List;")
)

/** Constructor for the Flutter launcher activity. */
object MainActivityConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/pertaminiku/MainActivity;",
    name = "<init>",
    returnType = "V",
    parameters = emptyList()
)
