package app.saketh.patches.webnovel.privacy

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.saketh.patches.shared.Constants.COMPATIBILITY_WEBNOVEL

private const val DEACTIVATED = "firebase_analytics_collection_deactivated"

@Suppress("unused")
val disableFirebaseAnalyticsPatch = patch(
    name = "Disable Firebase Analytics",
    description = "Deactivates Firebase Analytics collection in this build. Other trackers, anti-tamper reports and reading statistics stay unchanged. Repatch to restore collection; this is not ban protection.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WEBNOVEL)

    execute {
        // SDK deactivation takes precedence over persisted collection preferences.
        resourceXml("AndroidManifest.xml").use { manifest ->
            val application = manifest.root.children.single { it.tag == "application" }
            application.children.filter {
                it.tag == "meta-data" && it.attribute("android:name") == DEACTIVATED
            }.forEach { it.remove() }
            application.appendChild("meta-data") {
                setAttribute("android:name", DEACTIVATED)
                setAttribute("android:value", "true")
            }
        }
    }
}
