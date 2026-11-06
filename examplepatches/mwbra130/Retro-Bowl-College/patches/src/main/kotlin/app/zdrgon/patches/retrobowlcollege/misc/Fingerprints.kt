package app.zdrgon.patches.retrobowlcollege.misc

import app.morphe.patcher.Fingerprint

/**
 * Matches the billing callback that converts Google Play purchase data into the
 * JSON handed to the GameMaker runtime:
 *
 *   GooglePlayBillingService$N.onQueryPurchasesResponse(BillingResult, List)
 *
 * Uses the order-independent `strings` declaration. "sku_type" is referenced by
 * exactly one method in the entire APK, so this fingerprint depends neither on
 * the anonymous-inner-class number ($1, $2, ...) nor on instruction order, both
 * of which can differ between builds of the app.
 */
object QueryPurchasesResponseFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Lcom/android/billingclient/api/BillingResult;",
        "Ljava/util/List;",
    ),
    strings = listOf(
        "sku_type",
        "response_json",
        "Malformed JSON data from queryPurchases.",
    ),
)
