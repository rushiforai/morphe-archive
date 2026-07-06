package app.paresh.patches.fing.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// Targets gm/b.d() — reads subscription_product_id and returns the tier enum
// Uses stable SDK calls and string constants as filters
object GetSubscriptionTierFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf(),
    filters = listOf(
        methodCall(definingClass = "Landroid/content/Context;", name = "getApplicationContext"),
        string("subscription_product_id"),
        methodCall(definingClass = "Ljava/lang/String;", name = "toUpperCase"),
        methodCall(definingClass = "Ljava/lang/String;", name = "isEmpty"),
        string("PREMIUM"),
        methodCall(definingClass = "Ljava/lang/String;", name = "contains")
    )
)

// Targets ServiceActivity.T0() — premium check that gates scan limits
object IsPremiumCheckFingerprint : Fingerprint(
    definingClass = "Lcom/overlook/android/fing/ui/base/ServiceActivity;",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(
        methodCall(definingClass = "Ljava/lang/Enum;", name = "compareTo")
    )
)

// Targets gm/b.h(int) — checks if a feature ID is entitled for current plan
// Same class as GetSubscriptionTierFingerprint
object IsFeatureEntitledFingerprint : Fingerprint(
    classFingerprint = GetSubscriptionTierFingerprint,
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("I"),
    filters = listOf(
        methodCall(definingClass = "Landroid/content/Context;", name = "getApplicationContext"),
        methodCall(definingClass = "Ljava/util/Collection;", name = "stream"),
        methodCall(definingClass = "Ljava/util/stream/Stream;", name = "anyMatch")
    )
)
