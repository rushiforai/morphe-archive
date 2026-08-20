package app.template.patches.sofascore.premium

import app.morphe.patcher.Fingerprint

// AI insights subscription check
object AiInsightsEnabledFingerprint : Fingerprint(
    custom = { method, classDef -> method.name.contains("aiInsights", ignoreCase = true) || method.name.contains("aiAnalysis", ignoreCase = true) }
)

// Remove ads subscription check
object RemoveAdsSubscriptionFingerprint : Fingerprint(
    custom = { method, classDef -> method.name.contains("removeAds", ignoreCase = true) || method.name.contains("RemoveAds", ignoreCase = true) }
)

// Premium token validation
object PremiumTokenValidFingerprint : Fingerprint(
    custom = { method, classDef -> classDef.type.contains("PremiumToken") && method.name.contains("isValid", ignoreCase = true) }
)

// Generic isPremium feature gate
object IsPremiumFeatureFingerprint : Fingerprint(
    custom = { method, classDef -> method.name == "isPremium" || method.name == "hasPremiumFeature" }
)

// Error code premium required check
object PremiumRequiredErrorFingerprint : Fingerprint(
    custom = { method, classDef -> method.name.contains("PREMIUM_ACCOUNT_REQUIRED", ignoreCase = true) || method.name.contains("PremiumRequired", ignoreCase = true) }
)
