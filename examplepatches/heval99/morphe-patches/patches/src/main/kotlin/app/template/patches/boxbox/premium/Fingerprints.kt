package app.template.patches.boxbox.premium

import app.morphe.patcher.Fingerprint

object EntitlementInfoIsActiveFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/revenuecat/purchases/EntitlementInfo;" &&
                method.name == "isActive" &&
                method.returnType == "Z" &&
                method.parameters.isEmpty()
    }
)

object BillingLaunchFlowFingerprint : Fingerprint(
    strings = listOf("launchBillingFlow"),
    returnType = "Lcom/android/billingclient/api/BillingResult;"
)
