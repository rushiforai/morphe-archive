package app.aidan.patches.canvas.tracking

import app.aidan.patches.canvas.shared.COMPATIBILITY_CANVAS
import app.aidan.patches.shared.compositeFeaturePatch
import app.aidan.patches.shared.disableOptionalVoidMethods
import app.aidan.patches.shared.isEnabled
import app.aidan.patches.shared.returnOptionalBoolean
import app.aidan.patches.shared.returnOptionalNullObject
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import org.w3c.dom.Element

val removeTrackingAndAnalyticsPatch = compositeFeaturePatch(
    name = "Remove Tracking and Analytics",
    description = "Neutralizes behavioral tracking (Pendo SDK session recordings, guides, and click tracking), student surveillance telemetry (Pandata pageview recording, time-spent counters, and background upload worker), first-party app analytics (ScreenView processors, offline analytics, token logging), crash reporting (Firebase Crashlytics), and in-app rating prompts.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_CANVAS)

    val removeCrashlyticsCollection = booleanOption(
        key = "removeCrashlyticsCollection",
        default = true,
        title = "Disable Crashlytics Collection",
        description = "Sets the Firebase Crashlytics collection manifest flag to false and removes the " +
            "Crashlytics NDK registrar. The existing Java Crashlytics method stubs remain active."
    )

    resources {
        if (removeCrashlyticsCollection.isEnabled) {
            document("AndroidManifest.xml").use { document ->
                val applications = document.getElementsByTagName("application")
                if (applications.length != 1) {
                    throw PatchException(
                        "Expected exactly one <application> element, found ${applications.length}."
                    )
                }
                val application = applications.item(0) as? Element
                    ?: throw PatchException("Expected <application> to be an element.")

                val existingMetaData = directChildMetaData(application).firstOrNull {
                    it.getAttribute(ANDROID_NAME) == CRASHLYTICS_COLLECTION_META
                }
                if (existingMetaData != null) {
                    existingMetaData.setAttribute(ANDROID_VALUE, "false")
                } else {
                    val metaData = document.createElement("meta-data")
                    metaData.setAttributeNS(ANDROID_NAMESPACE, ANDROID_NAME, CRASHLYTICS_COLLECTION_META)
                    metaData.setAttributeNS(ANDROID_NAMESPACE, ANDROID_VALUE, "false")
                    application.appendChild(metaData)
                }

                // ComponentDiscoveryService instantiates the NDK registrar that loads libcrashlytics.
                val services = document.getElementsByTagName("service")
                var discoveryService: Element? = null
                for (index in 0 until services.length) {
                    val service = services.item(index) as? Element ?: continue
                    if (service.getAttribute(ANDROID_NAME) == COMPONENT_DISCOVERY_SERVICE) {
                        discoveryService = service
                        break
                    }
                }
                val service = discoveryService
                    ?: throw PatchException("Firebase ComponentDiscoveryService was not found.")

                val registrars = directChildMetaData(service).filter {
                    it.getAttribute(ANDROID_NAME) == NDK_REGISTRAR
                }
                if (registrars.isEmpty()) {
                    throw PatchException("Crashlytics NDK registrar metadata was not found.")
                }
                for (registrar in registrars) service.removeChild(registrar)
            }
        }
    }

    bytecode {
        // Layer 1: Pendo SDK behavioral tracking, visitor identity, guides, and click analytics.
        disableOptionalVoidMethods(
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
        returnOptionalBoolean("Lsdk/pendo/io/Pendo;", "sendClickAnalytic", false)
        returnOptionalNullObject("Lsdk/pendo/io/Pendo;", "getAccountId")
        returnOptionalNullObject("Lsdk/pendo/io/Pendo;", "getVisitorId")
        returnOptionalNullObject("Lsdk/pendo/io/Pendo;", "getDeviceId")

        // Layer 2: Pendo consent handlers and splash-time user/account initialization.
        disableOptionalVoidMethods(
            "Lcom/instructure/pandautils/features/cookieconsent/AnalyticsConsentHandler;",
            "onConsentGranted",
            "onConsentRevoked"
        )

        // Layer 3: Instructure's first-party analytics entry points and auth-token reporting.
        disableOptionalVoidMethods(
            "Lcom/instructure/canvasapi2/utils/Analytics;",
            "logEvent",
            "setUserProperty"
        )
        returnOptionalBoolean("Lcom/instructure/canvasapi2/utils/Analytics;", "isSessionActive", false)
        disableOptionalVoidMethods(
            "Lcom/instructure/student/util/Analytics;",
            "trackAppFlow",
            "trackBookmarkCreated",
            "trackBookmarkSelected",
            "trackButtonPressed",
            "trackUnsupportedFeature",
            "trackWidgetFlow"
        )
        disableOptionalVoidMethods("Lcom/instructure/canvasapi2/AppManager;", "logTokenAnalytics")

        // Layer 4: ScreenView annotations otherwise emit Pendo navigation events.
        disableOptionalVoidMethods(
            "Lcom/instructure/pandautils/analytics/ScreenViewAnnotationProcessor;",
            "processScreenView"
        )

        // Layer 5: Pandata persists course/group/page URLs and time spent, then uploads them.
        disableOptionalVoidMethods(
            "Lcom/instructure/canvasapi2/utils/pageview/PandataManager;",
            "uploadPageViewEvents"
        )
        disableOptionalVoidMethods(
            "Lcom/instructure/pandautils/analytics/pageview/PageViewUtils;",
            "saveSingleEvent",
            "stopEvent"
        )
        disableOptionalVoidMethods(
            "Lcom/instructure/pandautils/analytics/pageview/PageViewAnnotationProcessor;",
            "startEvent",
            "stopEvent"
        )
        returnWorkerSuccess("Lcom/instructure/pandautils/analytics/pageview/PageViewUploadWorker;")

        // Layer 6: Offline use is reported as first-party analytics when connectivity returns.
        disableOptionalVoidMethods(
            "Lcom/instructure/pandautils/analytics/OfflineAnalyticsManager;",
            "offlineModeStarted",
            "reportCourseOpenedInOfflineMode",
            "offlineModeEnded"
        )

        // Layer 7: Prevent remote crash reports, exception data, and identifying custom keys.
        disableOptionalVoidMethods(
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
        disableOptionalVoidMethods(
            "Lcom/instructure/student/mobius/settings/help/StudentHelpDialogFragmentBehavior;",
            "rateTheApp"
        )

        // Layer 9: Do not permit diagnostic logging of user details.
        returnOptionalBoolean("Lcom/instructure/canvasapi2/utils/Logger;", "canLogUserDetails", false)
    }
}

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
private const val ANDROID_NAME = "android:name"
private const val ANDROID_VALUE = "android:value"
private const val CRASHLYTICS_COLLECTION_META = "firebase_crashlytics_collection_enabled"
private const val NDK_REGISTRAR =
    "com.google.firebase.components:com.google.firebase.crashlytics.ndk.CrashlyticsNdkRegistrar"
private const val COMPONENT_DISCOVERY_SERVICE =
    "com.google.firebase.components.ComponentDiscoveryService"

/**
 * Collects the direct `<meta-data>` children of [element]. A document-wide
 * getElementsByTagName("meta-data") also returns metadata nested inside services and
 * providers, which must not be attributed to [element].
 */
private fun directChildMetaData(element: Element): List<Element> {
    val result = mutableListOf<Element>()
    val children = element.childNodes
    for (index in 0 until children.length) {
        val child = children.item(index) as? Element ?: continue
        if (child.tagName == "meta-data") result += child
    }
    return result
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
