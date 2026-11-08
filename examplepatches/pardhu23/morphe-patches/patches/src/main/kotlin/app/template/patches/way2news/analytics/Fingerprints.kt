package app.template.patches.way2news.analytics

import app.morphe.patcher.Fingerprint

// Singular attribution SDK wrapper. The wrapper class is obfuscated, so match by log strings.
// Method: static boolean init(Context, Config). When Singular is never initialised its
// event method returns false without sending anything.
object SingularInitFingerprint : Fingerprint(
    returnType = "Z",
    isStatic = true,
    parameters = listOf("Landroid/content/Context;", "L"),
    strings = listOf("Failed to init() Singular SDK"),
)

private const val FIREBASE_ANALYTICS = "Lcom/google/firebase/analytics/FirebaseAnalytics;"

object FirebaseLogEventFingerprint : Fingerprint(
    definingClass = FIREBASE_ANALYTICS,
    name = "logEvent",
    returnType = "V",
)

object FirebaseSetUserIdFingerprint : Fingerprint(
    definingClass = FIREBASE_ANALYTICS,
    name = "setUserId",
    returnType = "V",
)

object FirebaseSetUserPropertyFingerprint : Fingerprint(
    definingClass = FIREBASE_ANALYTICS,
    name = "setUserProperty",
    returnType = "V",
)

object FirebaseSetCurrentScreenFingerprint : Fingerprint(
    definingClass = FIREBASE_ANALYTICS,
    name = "setCurrentScreen",
    returnType = "V",
)

object FirebaseSetCollectionEnabledFingerprint : Fingerprint(
    definingClass = FIREBASE_ANALYTICS,
    name = "setAnalyticsCollectionEnabled",
    returnType = "V",
)
