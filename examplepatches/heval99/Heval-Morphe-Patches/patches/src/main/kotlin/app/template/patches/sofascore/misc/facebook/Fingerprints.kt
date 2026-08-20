package app.template.patches.sofascore.misc.facebook

import app.morphe.patcher.Fingerprint

// Facebook SDK initialization
object FacebookSdkInitializeFingerprint : Fingerprint(
    custom = { method, classDef -> classDef.type == "Lcom/facebook/FacebookSdk;" && method.name == "sdkInitialize" }
)

// Facebook Marketing logger
object FacebookMarketingLoggerFingerprint : Fingerprint(
    custom = { method, classDef -> classDef.type.contains("marketing") && method.name == "logEvent" }
)

// Facebook Ads internal init
object FacebookAdsInitFingerprint : Fingerprint(
    custom = { method, classDef -> classDef.type.startsWith("Lcom/facebook/ads/") && method.name == "<init>" }
)
