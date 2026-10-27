package app.template.patches.librepods.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

/**
 * Matches [PlayBillingProvider.processPurchases] (R8-obfuscated, e.g. `so.e` in 1.0.4-play).
 *
 * This is the single writer of the `_isPremium` StateFlow that gates every
 * premium screen in the app (via PurchaseUiState.isPremium). It is identified
 * by its stable inlined JSON-purchase-parsing literals plus its exact shape;
 * no reliance on R8 class/method names.
 */
object ProcessPurchasesFingerprint : Fingerprint(
    strings = listOf(
        // The Play Store product id whose purchase unlocks advanced features.
        string("librepods.advanced_features.v2", StringComparisonType.CONTAINS),
        // JSONObject keys read while parsing each Purchase record.
        string("productIds", StringComparisonType.CONTAINS),
        string("productId", StringComparisonType.CONTAINS),
        string("purchaseState", StringComparisonType.CONTAINS),
    ),
    returnType = "V",
    parameters = listOf("Ljava/util/List;")
)