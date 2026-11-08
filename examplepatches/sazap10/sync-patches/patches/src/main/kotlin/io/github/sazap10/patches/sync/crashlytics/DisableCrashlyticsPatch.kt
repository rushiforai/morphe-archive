package io.github.sazap10.patches.sync.crashlytics

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import io.github.sazap10.patches.sync.shared.SyncCompatibility
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val COLLECTION_ENABLED = "firebase_crashlytics_collection_enabled"

/**
 * Crashlytics reads this flag in DataCollectionArbiter when nothing was set at runtime. Sync only ever calls
 * setCrashlyticsCollectionEnabled(false) (when the user opts out), so nothing can turn collection back on.
 */
@Suppress("unused")
val disableCrashlyticsPatch = patch(
    name = "Disable Crashlytics",
    description = "Stops Firebase Crashlytics from collecting and sending crash reports.",
    default = true,
) {
    compatibleWith(*SyncCompatibility.SyncForReddit)

    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element?
                ?: throw PatchException("AndroidManifest.xml has no <application>")

            val metaData = application.childNodes.let { nodes ->
                (0 until nodes.length).map { nodes.item(it) }.filterIsInstance<Element>()
                    .filter { it.tagName == "meta-data" && it.getAttribute("android:name") == COLLECTION_ENABLED }
            }
            val element = metaData.firstOrNull() ?: document.createElement("meta-data").also {
                it.setAttributeNS(ANDROID_NS, "android:name", COLLECTION_ENABLED)
                application.appendChild(it)
            }
            metaData.drop(1).forEach(application::removeChild)
            element.setAttributeNS(ANDROID_NS, "android:value", "false")
        }
    }
}
