package app.paresh.patches.truecaller.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

// Targets com.truecaller.premium.data.k.b() — the central isPremium check
object IsPremiumFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("isPremiumExpired")
    )
)

// Targets com.truecaller.premium.data.k.S1() — returns the premium tier type
object GetPremiumTierFingerprint : Fingerprint(
    returnType = "Lcom/truecaller/premium/data/tier/PremiumTierType;",
    parameters = listOf(),
    filters = listOf(
        string("premiumLevel")
    )
)

// Finds g02.k class via its constructor which has unique parameter names
object PremiumFeatureManagerClassFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("premiumFeaturesInventory", "qaPremiumFeatureHelper")
)

// Targets g02.k.k(PremiumFeature, boolean) — master feature availability check
object IsFeatureAvailableFingerprint : Fingerprint(
    classFingerprint = PremiumFeatureManagerClassFingerprint,
    returnType = "Z",
    parameters = listOf("Lcom/truecaller/premium/data/feature/PremiumFeature;", "Z"),
)

// Targets com.truecaller.premium.data.g.h(z, continuation) — saves server state + notifies observers
// This overwrites local premium state and resets blocking settings
object SavePremiumStateFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lzz1/z;", "Ll33/a;"),
    filters = listOf(
        methodCall(definingClass = "Lzz1/o1;", name = "X"),
        methodCall(definingClass = "Lzz1/o1;", name = "i")
    )
)

// Targets PremiumSubscriptionStatusNotificationWorker.doWork() — handles subscription push notifications
object SubscriptionNotificationWorkerFingerprint : Fingerprint(
    definingClass = "Lcom/truecaller/premium/PremiumSubscriptionStatusNotificationWorker;",
    name = "doWork",
    returnType = "Ljava/lang/Object;",
)

// Targets fh2.m0 toString — CategoriesSettingsState, used to find the class
object CategoriesSettingsStateFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    filters = listOf(
        string("CategoriesSettingsState(isPremiumItemVisible=")
    )
)
