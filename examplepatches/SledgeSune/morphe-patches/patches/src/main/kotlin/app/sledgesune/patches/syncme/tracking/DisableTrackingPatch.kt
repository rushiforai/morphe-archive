package app.sledgesune.patches.syncme.tracking

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.patch
import app.sledgesune.patches.shared.Constants.COMPATIBILITY_SYNCME

private const val ANALYTICS = "Lcom/syncme/utils/analytics/Analytics;"
private const val EXTENSION_CLASS = "Lapp/sledgesune/extension/syncme/DisableTrackingPatch;"

// Analytics fans every event out to Firebase, Mixpanel and Singular. Its class and method names are kept.
private object AnalyticsInitFingerprint : Fingerprint(
    definingClass = ANALYTICS, name = "init", returnType = "V", parameters = listOf(),
)

private object AnalyticsTrackFingerprint : Fingerprint(
    definingClass = ANALYTICS, name = "track", returnType = "V",
    parameters = listOf("Lcom/syncme/utils/analytics/EventToProvider;", "Ljava/util/Map;"),
)

private object AnalyticsIdentifyFingerprint : Fingerprint(
    definingClass = ANALYTICS, name = "identify", returnType = "V", parameters = listOf("Ljava/util/Map;"),
)

private object AnalyticsUserPropertyFingerprint : Fingerprint(
    definingClass = ANALYTICS, name = "userProperty", returnType = "V", parameters = listOf("Ljava/util/Map;"),
)

private object AnalyticsFlushFingerprint : Fingerprint(
    definingClass = ANALYTICS, name = "flush", returnType = "V", parameters = listOf(),
)

// Singular attribution SDK is started separately from App.onCreate.
private object SingularInitFingerprint : Fingerprint(
    definingClass = "Lcom/syncme/utils/analytics/singular/SingularAnalytics;",
    name = "initOrSchedule",
    returnType = "V",
    parameters = listOf(),
)

// FacebookAppInitializer.init(Application) (obfuscated, e.g. `Lu86;->a`): AppEventsLogger.activateApp(app).
private object FacebookActivateAppFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/Application;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/facebook/appevents/AppEventsLogger\$Companion;",
            name = "activateApp",
        ),
    ),
    // The SDK's own static AppEventsLogger.activateApp(Application) has the same shape.
    custom = { _, classDef -> !classDef.type.startsWith("Lcom/facebook/") },
)

@Suppress("unused")
val disableTrackingPatch = patch(
    name = "Disable tracking",
    description = "Stops usage analytics from being sent to Firebase, Mixpanel, Singular and Facebook.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SYNCME)

    extendWith("extensions/extension.mpe")

    execute {
        // Analytics.init(): switch off SDK-level collection instead of starting the services.
        AnalyticsInitFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, $ANALYTICS->context:Landroid/content/Context;
                invoke-static { v0 }, $EXTENSION_CLASS->disableSdkCollection(Landroid/content/Context;)V
                return-void
            """
        )

        listOf(
            AnalyticsTrackFingerprint,
            AnalyticsIdentifyFingerprint,
            AnalyticsUserPropertyFingerprint,
            AnalyticsFlushFingerprint,
            SingularInitFingerprint,
            FacebookActivateAppFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.addInstruction(0, "return-void")
        }
    }
}
