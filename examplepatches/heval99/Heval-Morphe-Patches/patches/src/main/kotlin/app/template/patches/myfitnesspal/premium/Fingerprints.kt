package app.template.patches.myfitnesspal.premium

import app.morphe.patcher.Fingerprint

internal const val ENTITLEMENTS = "Lcom/myfitnesspal/queryenvoy/domain/model/subscriptions/entitlements/"

/**
 * 26.37.0 removed the old local `SubscriptionPreferences.getPremiumPlusEnabled` gate: premium
 * state now comes from the server as queryenvoy `FeatureState` objects (feature, entitlement
 * and tier), deserialized through the enum companions. The two parsers below are the single
 * conversion point for the server strings, so overriding them marks every feature as entitled
 * at the highest tier.
 */
object EntitlementParserFingerprint : Fingerprint(
    definingClass = "${ENTITLEMENTS}Entitlement\$a;",
    name = "a",
    parameters = listOf("Ljava/lang/String;"),
    returnType = "${ENTITLEMENTS}Entitlement;",
)

object TierParserFingerprint : Fingerprint(
    definingClass = "${ENTITLEMENTS}Tier\$a;",
    name = "a",
    parameters = listOf("Ljava/lang/String;"),
    returnType = "${ENTITLEMENTS}Tier;",
)
