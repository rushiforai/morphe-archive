package app.morphe.patches.vk.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.vk.shared.Constants.COMPATIBILITY_VK
import org.w3c.dom.Element

internal object MyTrackerInitFingerprint : Fingerprint(
    definingClass = "Lcom/my/tracker/MyTracker;",
    name = "initTracker",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/app/Application;")
)

internal object MyTrackerTrackEventFingerprint : Fingerprint(
    definingClass = "Lcom/my/tracker/MyTracker;",
    name = "trackEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

internal object MyTrackerTrackEventWithMapFingerprint : Fingerprint(
    definingClass = "Lcom/my/tracker/MyTracker;",
    name = "trackEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/Map;")
)

// Firebase Analytics / Crashlytics read these flags at startup; FCM does not depend on them.
private val FIREBASE_FLAGS = mapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_crashlytics_collection_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
)

private val DISABLED_COMPONENTS = setOf(
    "com.google.android.gms.measurement.AppMeasurementReceiver",
    "com.google.android.gms.measurement.AppMeasurementService",
    "com.google.android.gms.measurement.AppMeasurementJobService",
)

// OK Tracer: crash, OpenTelemetry and heap-dump uploads. Core TracerInitializer and LoggerInitializer
// stay so library calls into Tracer find it initialized.
private val TRACER_INITIALIZERS = setOf(
    "ru.ok.tracer.crash.report.CrashReportInitializer",
    "ru.ok.tracer.opentelemetry.OpenTelemetryLazyInitializer",
    "ru.ok.tracer.heap.dumps.HeapDumpInitializer",
)

private val telemetryManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element

            val metaData = document.getElementsByTagName("meta-data")
            val toRemove = mutableListOf<Element>()
            val existing = mutableMapOf<String, Element>()
            for (i in 0 until metaData.length) {
                val e = metaData.item(i) as Element
                val name = e.getAttribute("android:name")
                if (name.startsWith("ru.ok.tracer.startup.Initializer@") &&
                    e.getAttribute("android:value") in TRACER_INITIALIZERS
                ) toRemove += e
                if (name in FIREBASE_FLAGS) existing[name] = e
            }
            toRemove.forEach { it.parentNode.removeChild(it) }

            FIREBASE_FLAGS.forEach { (name, value) ->
                val e = existing[name] ?: document.createElement("meta-data").also {
                    it.setAttribute("android:name", name)
                    application.appendChild(it)
                }
                e.setAttribute("android:value", value)
            }

            for (tag in listOf("service", "receiver")) {
                val nodes = document.getElementsByTagName(tag)
                for (i in 0 until nodes.length) {
                    val e = nodes.item(i) as Element
                    if (e.getAttribute("android:name") in DISABLED_COMPONENTS) e.setAttribute("android:enabled", "false")
                }
            }
        }
    }
}

@Suppress("unused")
val telemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables MyTracker, Firebase Analytics, Crashlytics and OK Tracer crash/telemetry uploads. VK's internal AppStartReporter / BaseAnalyticsSender are intentionally left intact because they carry notification-sync/heartbeat traffic (stubbing them made the unread badge stick and delayed message pushes)."
) {
    compatibleWith(COMPATIBILITY_VK)
    dependsOn(telemetryManifestPatch)

    execute {
        // Prevent MyTracker from initializing
        MyTrackerInitFingerprint.method.apply {
            addInstructions(0, "return-void")
        }

        // Suppress MyTracker event reporting
        MyTrackerTrackEventFingerprint.method.apply {
            addInstructions(0, "return-void")
        }
        MyTrackerTrackEventWithMapFingerprint.method.apply {
            addInstructions(0, "return-void")
        }
    }
}
