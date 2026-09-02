package app.paresh.patches.plusmessenger.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.plusmessenger.shared.Constants.COMPATIBILITY_PLUS_MESSENGER

// AnalyticsHelper.enableAnalytics() — sets up FirebaseAnalytics collection.
// Note: FirebaseApp.initializeApp() lives in start() and must NOT be skipped,
// otherwise FCM push breaks and notifications stop arriving in the background.
object AnalyticsEnableFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/plus/helpers/AnalyticsHelper;",
    name = "enableAnalytics",
    returnType = "V",
    parameters = listOf("Landroid/app/Application;"),
)

object AnalyticsTrackEventFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/plus/helpers/AnalyticsHelper;",
    name = "trackEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

object AnalyticsTrackEventMapFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/plus/helpers/AnalyticsHelper;",
    name = "trackEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/HashMap;"),
)

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Blocks all analytics and tracking."
) {
    compatibleWith(COMPATIBILITY_PLUS_MESSENGER)

    execute {
        // Skip analytics collection but leave FirebaseApp.initializeApp() in start()
        // intact so Firebase Cloud Messaging (push notifications) keeps working.
        AnalyticsEnableFingerprint.method.addInstructions(0, "return-void")
        AnalyticsTrackEventFingerprint.method.addInstructions(0, "return-void")
        AnalyticsTrackEventMapFingerprint.method.addInstructions(0, "return-void")
    }
}
