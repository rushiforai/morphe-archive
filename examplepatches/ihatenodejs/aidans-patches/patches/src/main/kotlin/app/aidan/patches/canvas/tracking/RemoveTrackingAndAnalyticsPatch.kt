package app.aidan.patches.canvas.tracking

import app.aidan.patches.canvas.shared.COMPATIBILITY_CANVAS
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch

val removeTrackingAndAnalyticsPatch = bytecodePatch(
    name = "Remove Tracking and Analytics",
    description = "Neutralizes behavioral tracking (Pendo SDK session recordings, guides, and click tracking), student surveillance telemetry (Pandata pageview recording, time-spent counters, and background upload worker), first-party app analytics (ScreenView processors, offline analytics, token logging), crash reporting (Firebase Crashlytics), and in-app rating prompts.",
    default = true
) {
    compatibleWith(COMPATIBILITY_CANVAS)
    execute {
        // Layer 1: Pendo SDK behavioral tracking, visitor identity, guides, and click analytics.
        disableVoidMethods(
            "Lsdk/pendo/io/Pendo;",
            "setup",
            "startSession",
            "track",
            "screenContentChanged",
            "setAccountData",
            "setVisitorData",
            "dismissVisibleGuides",
            "pauseGuides",
            "resumeGuides",
            "endSession"
        )
        returnBoolean("Lsdk/pendo/io/Pendo;", "sendClickAnalytic", false)
        returnNullObject("Lsdk/pendo/io/Pendo;", "getAccountId")
        returnNullObject("Lsdk/pendo/io/Pendo;", "getVisitorId")
        returnNullObject("Lsdk/pendo/io/Pendo;", "getDeviceId")

        // Layer 2: Pendo consent handlers and splash-time user/account initialization.
        disableVoidMethods(
            "Lcom/instructure/pandautils/features/cookieconsent/AnalyticsConsentHandler;",
            "onConsentGranted",
            "onConsentRevoked"
        )

        // Layer 3: Instructure's first-party analytics entry points and auth-token reporting.
        disableVoidMethods(
            "Lcom/instructure/canvasapi2/utils/Analytics;",
            "logEvent",
            "setUserProperty"
        )
        returnBoolean("Lcom/instructure/canvasapi2/utils/Analytics;", "isSessionActive", false)
        disableVoidMethods(
            "Lcom/instructure/student/util/Analytics;",
            "trackAppFlow",
            "trackBookmarkCreated",
            "trackBookmarkSelected",
            "trackButtonPressed",
            "trackUnsupportedFeature",
            "trackWidgetFlow"
        )
        disableVoidMethods("Lcom/instructure/canvasapi2/AppManager;", "logTokenAnalytics")

        // Layer 4: ScreenView annotations otherwise emit Pendo navigation events.
        disableVoidMethods(
            "Lcom/instructure/pandautils/analytics/ScreenViewAnnotationProcessor;",
            "processScreenView"
        )

        // Layer 5: Pandata persists course/group/page URLs and time spent, then uploads them.
        disableVoidMethods(
            "Lcom/instructure/canvasapi2/utils/pageview/PandataManager;",
            "uploadPageViewEvents"
        )
        disableVoidMethods(
            "Lcom/instructure/pandautils/analytics/pageview/PageViewUtils;",
            "saveSingleEvent",
            "stopEvent"
        )
        disableVoidMethods(
            "Lcom/instructure/pandautils/analytics/pageview/PageViewAnnotationProcessor;",
            "startEvent",
            "stopEvent"
        )
        returnWorkerSuccess("Lcom/instructure/pandautils/analytics/pageview/PageViewUploadWorker;")

        // Layer 6: Offline use is reported as first-party analytics when connectivity returns.
        disableVoidMethods(
            "Lcom/instructure/pandautils/analytics/OfflineAnalyticsManager;",
            "offlineModeStarted",
            "reportCourseOpenedInOfflineMode",
            "offlineModeEnded"
        )

        // Layer 7: Prevent remote crash reports, exception data, and identifying custom keys.
        disableVoidMethods(
            "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
            "log",
            "recordException",
            "setCrashlyticsCollectionEnabled",
            "setCustomKey",
            "setCustomKeys",
            "setUserId",
            "sendUnsentReports",
            "deleteUnsentReports"
        )

        // Layer 8: Remove the Help-screen Play Store rating redirect.
        disableVoidMethods(
            "Lcom/instructure/student/mobius/settings/help/StudentHelpDialogFragmentBehavior;",
            "rateTheApp"
        )

        // Layer 9: Do not permit diagnostic logging of user details.
        returnBoolean("Lcom/instructure/canvasapi2/utils/Logger;", "canLogUserDetails", false)
    }
}

/**
 * Makes all implemented void overloads with the requested names return immediately.
 * Absent classes or matches are skipped.
 */
private fun BytecodePatchContext.disableVoidMethods(
    classDescriptor: String,
    vararg methodNames: String
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return
    val methodSet = methodNames.toSet()

    for (method in mutableClass.methods) {
        if (method.name in methodSet && method.returnType == "V" && method.implementation != null) {
            method.addInstructions(0, "return-void")
        }
    }
}

/**
 * Makes all implemented boolean overloads with [methodName] return [value].
 * Absent classes or matches are skipped.
 */
private fun BytecodePatchContext.returnBoolean(
    classDescriptor: String,
    methodName: String,
    value: Boolean
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return
    val constInstruction = if (value) "const/4 v0, 0x1" else "const/4 v0, 0x0"

    for (method in mutableClass.methods) {
        if (method.name == methodName && method.returnType == "Z" && method.implementation != null) {
            method.addInstructions(0, "$constInstruction\nreturn v0")
        }
    }
}

/**
 * Makes all implemented overloads with [methodName] and a class return type return null.
 * Array return types are excluded.
 * Absent classes or matches are skipped.
 */
private fun BytecodePatchContext.returnNullObject(
    classDescriptor: String,
    methodName: String
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return

    for (method in mutableClass.methods) {
        if (method.name == methodName && method.returnType.startsWith("L") && method.implementation != null) {
            method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        }
    }
}


/**
 * Makes implemented doWork overloads returning Object return a new WorkManager success
 * result without executing their original bodies. Absent classes or matches are skipped.
 */
private fun BytecodePatchContext.returnWorkerSuccess(classDescriptor: String) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return

    for (method in mutableClass.methods) {
        if (method.name == "doWork" && method.returnType == "Ljava/lang/Object;" && method.implementation != null) {
            method.addInstructions(
                0,
                """
                new-instance v0, Landroidx/work/u${'$'}a${'$'}c;
                invoke-direct {v0}, Landroidx/work/u${'$'}a${'$'}c;-><init>()V
                return-object v0
                """.trimIndent()
            )
        }
    }
}

