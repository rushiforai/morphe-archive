package app.polishapps.patches.vulcan.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.polishapps.patches.shared.Constants.COMPATIBILITY_VULCAN
import app.polishapps.patches.shared.Constants.VULCAN_26_08_00
import app.polishapps.patches.shared.targetsFor
import app.polishapps.patches.vulcan.containsSnapshotBuildId
import app.polishapps.patches.vulcan.expectBytes
import app.polishapps.patches.vulcan.nativeLibrary
import app.polishapps.patches.vulcan.textFileOffset
import org.w3c.dom.Element

/**
 * Firebase is initialised by `FirebaseInitProvider` before `Application.onCreate`, so the manifest
 * flags are the only way to stop analytics, Crashlytics, Performance and Sessions from collecting
 * during startup. They are the same flags Google documents for opting out of automatic collection.
 */
private val manifestFlags = mapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_ssaid_collection_enabled" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_sessions_enabled" to "false",
    "firebase_performance_collection_deactivated" to "true",
)

/**
 * Dart-side switches and VULCAN's own Mnemos tracker.
 *
 * The app re-applies its own analytics/Crashlytics consent after startup through the Dart wrappers.
 * Those wrappers are changed to pass the tagged Dart `false` instead of the caller's value, so the
 * native opt-out manifest flags cannot be overridden at runtime. This is much safer than editing the
 * measurement client's startup state: the SDK still initialises normally, it just never enables
 * collection.
 *
 * [trackerSkipBranch] is the `b.ne` in `Tracker.traversal` that skips tracking when analytics
 * consent is off. Every screen build calls it before queueing an event. Turning it into an
 * unconditional branch makes traversal return before it reaches the Mnemos API.
 */
private data class DartTelemetryTargets(
    val libPath: String,
    val snapshotBuildId: String,
    /** `ldur x2, [fp, #-0x18]` in `FirebaseAnalytics.setAnalyticsCollectionEnabled`. */
    val analyticsSetter: Long,
    /** `add x2, NULL, #0x20` in `FirebaseCrashlytics.setCrashlyticsCollectionEnabled`. */
    val crashlyticsSetter: Long,
    val trackerSkipBranch: Long,
)

private val dartTargetsByVersion = mapOf(
    VULCAN_26_08_00 to DartTelemetryTargets(
        libPath = "lib/arm64-v8a/libapp.so",
        snapshotBuildId = "d6031998d1b3bbfebf59cc9bbff9aee1",
        analyticsSetter = 0x00877948,
        crashlyticsSetter = 0x00879fa0,
        trackerSkipBranch = 0x008b2a74,
    ),
)

private val ANALYTICS_SETTER_ARGUMENT = byteArrayOf(
    0xa2.toByte(), 0x83.toByte(), 0x5e, 0xf8.toByte(),
)
private val CRASHLYTICS_SETTER_TRUE = byteArrayOf(
    0xc2.toByte(), 0x82.toByte(), 0x00, 0x91.toByte(),
)
private val DART_FALSE_INTO_X2 = byteArrayOf(
    0xc2.toByte(), 0xc2.toByte(), 0x00, 0x91.toByte(),
)

/** `b.ne 0x8b2b14`, the jump to the early-return path when analytics is off. */
private val TRACKER_SKIP_BRANCH = byteArrayOf(0x01, 0x05, 0x00, 0x54)

/** `b 0x8b2b14`, the same jump but unconditional. */
private val TRACKER_ALWAYS_SKIP = byteArrayOf(0x28, 0x00, 0x00, 0x14)

@Suppress("unused")
val blockTelemetryPatch = resourcePatch(
    name = "Block eduVULCAN telemetry",
    description = "Blocks Firebase Analytics, Crashlytics, Performance and Sessions, plus the built-in " +
        "Mnemos usage tracker. Push notifications and Firebase Remote Config keep working.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_VULCAN)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("AndroidManifest.xml has no <application>")

            val metaData = application.getElementsByTagName("meta-data")
            manifestFlags.forEach { (name, value) ->
                val existing = (0 until metaData.length)
                    .map { metaData.item(it) as Element }
                    .firstOrNull { it.getAttribute("android:name") == name }
                val element = existing ?: manifest.createElement("meta-data").also { created ->
                    created.setAttribute("android:name", name)
                    application.appendChild(created)
                }
                element.setAttribute("android:value", value)
            }
        }

        val targets = targetsFor(dartTargetsByVersion)
        val file = nativeLibrary(targets.libPath)
        val bytes = file.readBytes()
        if (!bytes.containsSnapshotBuildId(targets.snapshotBuildId)) {
            throw PatchException(
                "${targets.libPath} does not contain the expected Dart snapshot build ID " +
                    targets.snapshotBuildId,
            )
        }

        val analyticsOffset = bytes.textFileOffset(targets.analyticsSetter).toInt()
        bytes.expectBytes(analyticsOffset, ANALYTICS_SETTER_ARGUMENT, "analytics consent argument")
        DART_FALSE_INTO_X2.copyInto(bytes, analyticsOffset)

        val crashlyticsOffset = bytes.textFileOffset(targets.crashlyticsSetter).toInt()
        bytes.expectBytes(crashlyticsOffset, CRASHLYTICS_SETTER_TRUE, "Crashlytics consent argument")
        DART_FALSE_INTO_X2.copyInto(bytes, crashlyticsOffset)

        val trackerOffset = bytes.textFileOffset(targets.trackerSkipBranch).toInt()
        bytes.expectBytes(trackerOffset, TRACKER_SKIP_BRANCH, "Tracker.traversal analytics branch")
        TRACKER_ALWAYS_SKIP.copyInto(bytes, trackerOffset)

        file.writeBytes(bytes)
    }
}
