package app.jofslash.patches.yallashoot.tracking

import app.jofslash.patches.yallashoot.shared.Constants.COMPATIBILITY_YALLA_SHOOT
import app.jofslash.patches.yallashoot.shared.editManifest
import app.jofslash.patches.yallashoot.shared.methodsOf
import app.jofslash.patches.yallashoot.shared.returnEarly
import app.jofslash.patches.yallashoot.shared.setApplicationMetaData
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

private const val CRASHLYTICS = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;"

private val blockTrackingResourcePatch = resourcePatch {
    execute {
        editManifest { document ->
            // The app ships Firebase Analytics and Crashlytics off and switches them on from Dart
            // (setAnalyticsCollectionEnabled / setCrashlyticsCollectionEnabled). "deactivated" turns
            // Analytics off for good: the runtime switch can't turn it back on.
            document.setApplicationMetaData("firebase_analytics_collection_deactivated", "true")
            document.setApplicationMetaData("firebase_analytics_collection_enabled", "false")
            document.setApplicationMetaData("google_analytics_adid_collection_enabled", "false")
            document.setApplicationMetaData("firebase_crashlytics_collection_enabled", "false")
            document.setApplicationMetaData("firebase_sessions_enabled", "false")
        }
    }
}

@Suppress("unused")
val blockTrackingPatch = bytecodePatch(
    name = "Block tracking",
    description = "Keeps Firebase Analytics and Crashlytics off for good: the app ships them off and turns " +
            "them on by itself after it starts. Scores, news and notifications aren't touched.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_YALLA_SHOOT)

    dependsOn(blockTrackingResourcePatch)

    execute {
        // Both setCrashlyticsCollectionEnabled overloads (boolean and Boolean) do nothing, so the
        // collection stays at the manifest's "off". Crash reports then stay on the phone.
        val switches = methodsOf(CRASHLYTICS, "setCrashlyticsCollectionEnabled")
        switches.forEach { it.returnEarly() }
    }
}
