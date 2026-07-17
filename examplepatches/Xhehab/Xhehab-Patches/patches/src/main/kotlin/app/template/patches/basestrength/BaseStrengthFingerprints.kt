package app.template.patches.basestrength

import app.morphe.patcher.Fingerprint

/**
 * RN bridge for Iaphub [getActiveProducts]. JS stores the resolved array as
 * `purchasedSubscriptions`; non-empty length sets `hasValidSubscription`.
 */
internal object BaseStrengthGetActiveProductsFingerprint : Fingerprint(
    definingClass = "Lcom/iaphub/RNIaphub/RNIaphubModule;",
    name = "getActiveProducts",
    parameters = listOf(
        "Lcom/facebook/react/bridge/ReadableMap;",
        "Lcom/facebook/react/bridge/Promise;"
    ),
    returnType = "V"
)
