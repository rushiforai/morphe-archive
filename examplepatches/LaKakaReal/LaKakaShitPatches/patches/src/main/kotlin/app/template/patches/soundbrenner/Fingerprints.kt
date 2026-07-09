package app.template.patches.soundbrenner

import app.morphe.patcher.Fingerprint

object HasActiveSubscriptionPlanFingerprint : Fingerprint(
    definingClass = "Lcom/soundbrenner/pulse/ui/subscriptions/new_paywall/PaywallSubscriptionManager;",
    name = "getHasActiveSubscriptionPlan",
    returnType = "Z",
    parameters = listOf()
)

object HasPlusEntitlementFingerprint : Fingerprint(
    definingClass = "Lcom/soundbrenner/pulse/ui/subscriptions/new_paywall/PaywallSubscriptionManager;",
    name = "getHasPlusEntitlement",
    returnType = "Z",
    parameters = listOf()
)

object IsPlusUserForHomeV4Fingerprint : Fingerprint(
    definingClass = "Lcom/soundbrenner/home/v4/utils/HomeCustomizationUtilsKt;",
    name = "isPlusUserForHomeV4",
    parameters = listOf("Landroid/content/Context;"),
    returnType = "Z"
)

object CanCustomizeHomeFingerprint : Fingerprint(
    definingClass = "Lcom/soundbrenner/home/v4/utils/HomeCustomizationUtilsKt;",
    name = "canCustomizeHome",
    parameters = listOf("Z", "Z", "Z"),
    returnType = "Z"
)