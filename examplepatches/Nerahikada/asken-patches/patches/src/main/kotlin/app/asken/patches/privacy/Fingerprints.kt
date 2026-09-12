package app.asken.patches.privacy

import app.morphe.patcher.Fingerprint

object ReproSetUserProfileFingerprint : Fingerprint(
    definingClass = "Lio/repro/android/Repro;",
    name = "setStringUserProfile",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;")
)

object ReproPushRegistrationFingerprint : Fingerprint(
    definingClass = "Lio/repro/android/Repro;",
    name = "setPushRegistrationID",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

object ReproHandlePushBundleFingerprint : Fingerprint(
    definingClass = "Lio/repro/android/Repro;",
    name = "applicationShouldHandlePushNotification",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Landroid/os/Bundle;")
)

object ReproHandlePushMapFingerprint : Fingerprint(
    definingClass = "Lio/repro/android/Repro;",
    name = "applicationShouldHandlePushNotification",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Ljava/util/Map;")
)

object ReproTrackFingerprint : Fingerprint(
    definingClass = "Lio/repro/android/Repro;",
    name = "track",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

object ReproTrackWithPropertiesFingerprint : Fingerprint(
    definingClass = "Lio/repro/android/Repro;",
    name = "track",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/Map;")
)

object ReproSetIntUserProfileFingerprint : Fingerprint(
    definingClass = "Lio/repro/android/Repro;",
    name = "setIntUserProfile",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "I")
)

object ReproSetUserIDFingerprint : Fingerprint(
    definingClass = "Lio/repro/android/Repro;",
    name = "setUserID",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

object ReproEnableInAppMessagesFingerprint : Fingerprint(
    definingClass = "Lio/repro/android/Repro;",
    name = "enableInAppMessagesOnForegroundTransition",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;")
)

object ReproGetRemoteConfigFingerprint : Fingerprint(
    definingClass = "Lio/repro/android/Repro;",
    name = "getRemoteConfig",
    returnType = "Lio/repro/android/remoteconfig/RemoteConfig;",
    parameters = listOf()
)

object FirebaseAnalyticsLogEventFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "logEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;")
)

object FirebaseAnalyticsSetUserPropertyFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "setUserProperty",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;")
)

object FirebaseAnalyticsSetUserIdFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "setUserId",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

object FacebookLogEventFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/appevents/AppEventsLogger;",
    name = "logEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

