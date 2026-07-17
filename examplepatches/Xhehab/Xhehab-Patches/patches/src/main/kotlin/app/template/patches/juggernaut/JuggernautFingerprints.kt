package app.template.patches.juggernaut

import app.morphe.patcher.Fingerprint

/**
 * RN bridge for Iaphub [getActiveProducts]. JS [checkIAPUser] / iapSubscription
 * treats a non-empty active-products list as subscribed (isPremium).
 */
internal object JuggernautGetActiveProductsFingerprint : Fingerprint(
    definingClass = "Lcom/iaphub/RNIaphub/RNIaphubModule;",
    name = "getActiveProducts",
    parameters = listOf(
        "Lcom/facebook/react/bridge/ReadableMap;",
        "Lcom/facebook/react/bridge/Promise;"
    ),
    returnType = "V"
)
