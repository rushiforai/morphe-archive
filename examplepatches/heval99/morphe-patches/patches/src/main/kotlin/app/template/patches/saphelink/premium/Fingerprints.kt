package app.template.patches.saphelink.premium

import app.morphe.patcher.Fingerprint

// FeatureToggleRouterImpl.userHasFeature(FeatureKey): boolean
// Every public is*Enabled() check on FeatureToggleRouter delegates to this
// private method, which consults the server-provided activation keys. Forcing
// it to return true unlocks every gated feature (navigation, car integration,
// speed limits, voice alarms, roadwork, animal nearby, etc.).
object UserHasFeatureFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Lcom/saphe/communication/FeatureKey;"),
    custom = { method, classDef ->
        classDef.type == "Lcom/saphe/FeatureToggleRouterImpl;" && method.name == "userHasFeature"
    }
)

// SubscriptionManager.isPremium(): boolean
// Secondary subscription gate consulted by the paywall UI and some feature
// guards. Matched by name + boolean return so it survives obfuscation of the
// surrounding class as long as the method signature stays stable.
object IsPremiumFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { method, classDef ->
        method.name == "isPremium" &&
            (classDef.type.contains("Subscription", ignoreCase = true) ||
                classDef.type.contains("Saphe", ignoreCase = true))
    }
)