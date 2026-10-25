package app.template.patches.truecaller.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val PREMIUM_TIER_TYPE = "Lcom/truecaller/premium/data/tier/PremiumTierType;"
internal const val PREMIUM_FEATURE = "Lcom/truecaller/premium/data/feature/PremiumFeature;"
private const val PREMIUM_FEATURE_STATUS = "Lcom/truecaller/premium/data/feature/PremiumFeatureStatus;"
private const val PREMIUM_LAUNCH_CONTEXT_STATIC = "Lcom/truecaller/premium/PremiumLaunchContext\$Static;"

// Truecaller is R8-obfuscated apart from its model, enum and worker classes, so the anchors are
// the premium SharedPreferences keys, the kept types in method signatures, and method shape.

// The premium settings store (a6x in 26.39.6): the tier getter reads the "premiumLevel" pref
// and maps it to a PremiumTierType (FREE by default).
internal object PremiumTierFingerprint : Fingerprint(
    returnType = PREMIUM_TIER_TYPE,
    parameters = listOf(),
    filters = listOf(string("premiumLevel")),
)

// Same class: isPremium() is !getBoolean("isPremiumExpired", true). A sibling getter also reads
// "isPremiumExpired" but only answers "in grace period", so it is excluded.
internal object IsPremiumFingerprint : Fingerprint(
    classFingerprint = PremiumTierFingerprint,
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(string("isPremiumExpired")),
    custom = { method, _ ->
        method.implementation?.instructions?.none {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "isInGracePeriod"
        } == true
    },
)

// The static status check every availableFeatures lookup goes through:
// status == PremiumFeatureStatus.INCLUDED.
internal object FeatureStatusIncludedFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(PREMIUM_FEATURE_STATUS),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = PREMIUM_FEATURE_STATUS, name = "INCLUDED"),
    ),
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
)

// The premium feature manager's isFeatureAvailable(feature, refresh): false when the feature is
// in the server's "disabledPremiumFeatures" list, else true only when the account's
// availableFeatures entry for it is INCLUDED (compared by identifier, not through the check above).
internal object FeatureAvailableFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(PREMIUM_FEATURE, "Z"),
    filters = listOf(string("disabledPremiumFeatures")),
)

// The premium status sync writer (i3x.e(status, continuation) in 26.39.6): stores the server's
// premium status in the premium prefs, then sends a PremiumStatusUpdate(oldState, newPremium)
// event to its listeners. Only this method writes both keys.
internal object PremiumStatusWriterFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L", "L"),
    strings = listOf("premiumHadPremiumBefore", "entitledCatalogItemIds"),
)

// PremiumState(isPremium, tier, productKind, scope, insuranceState), the state object the premium
// UI observes. Its class is obfuscated; its toString keeps the field names.
internal object PremiumStateToStringFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string("PremiumState(isPremium=", StringComparisonType.STARTS_WITH)),
)

internal object PremiumStateConstructorFingerprint : Fingerprint(
    classFingerprint = PremiumStateToStringFingerprint,
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Z",
        PREMIUM_TIER_TYPE,
        "Lcom/truecaller/premium/data/ProductKind;",
        "Lcom/truecaller/premium/data/PremiumScope;",
        "Lcom/truecaller/premium/data/InsuranceState;",
    ),
)

// Push-triggered worker (kept: WorkManager instantiates it by name) that posts the
// "subscription expired / in grace period" notification.
internal object SubscriptionStatusWorkerFingerprint : Fingerprint(
    definingClass = "Lcom/truecaller/premium/PremiumSubscriptionStatusNotificationWorker;",
    name = "doWork",
    returnType = "Ljava/lang/Object;",
)

// The Premium tab's screen states (PremiumUserTabPaywallViewModel; alx / dlx in 26.41.5): Entitled
// (the subscription management screen) and Paywall (the plans). Obfuscated classes; their
// toStrings keep the state names.
internal object PremiumTabEntitledStateToStringFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string("Entitled(subscriptionFetchResult=", StringComparisonType.STARTS_WITH)),
)

internal object PremiumTabPaywallStateToStringFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string("Paywall(subscriptionFetchResult=", StringComparisonType.STARTS_WITH)),
)

// The Premium tab view model's suspend state chooser (amx.L in 26.41.5): after the subscription
// fetch it reads isPremium, then the "isSubscriptionOnHoldOrPaused" pref, then compares the launch
// context with a kept PremiumLaunchContext.Static constant, and builds Entitled or Paywall. The patch
// also requires both state types and the isPremium call in it.
internal object PremiumTabScreenStateFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    filters = listOf(
        string("isSubscriptionOnHoldOrPaused"),
        fieldAccess(opcode = Opcode.SGET_OBJECT, type = PREMIUM_LAUNCH_CONTEXT_STATIC),
    ),
)

// androidx.work ListenableWorker.Result.Success / Failure. R8 renames them, but their toString
// text comes from the library.
internal object WorkResultSuccessToStringFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string("Success {mOutputData=")),
)

internal object WorkResultFailureToStringFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string("Failure {mOutputData=")),
)
