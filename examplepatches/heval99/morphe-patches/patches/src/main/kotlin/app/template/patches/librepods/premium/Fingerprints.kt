package app.template.patches.librepods.premium

import app.morphe.patcher.Fingerprint

/**
 * Matches [PlayBillingProvider.processPurchases] (R8-obfuscated, e.g. `uo.e`).
 *
 * This is the single writer of the `_isPremium` StateFlow that gates every
 * premium screen in the app (via PurchaseUiState.isPremium). It is identified
 * by its stable inlined JSON-purchase-parsing literals plus its exact shape;
 * no reliance on R8 class/method names.
 */
object ProcessPurchasesFingerprint : Fingerprint(
    strings = listOf(
        // The Play Store product id whose purchase unlocks advanced features.
        "librepods.advanced_features.v2",
        // JSONObject keys read while parsing each Purchase record.
        "productIds",
        "productId",
        "purchaseState",
    ),
    returnType = "V",
    parameters = listOf("Ljava/util/List;")
)