package app.template.patches.ninegag.ad

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.ninegag.shared.COMPATIBILITY_NINEGAG
import org.w3c.dom.Element

/**
 * Uses the SDK's documented opt-out. Firebase initialization, services,
 * messaging, Remote Config, and application control flow remain intact.
 * https://firebase.google.com/docs/analytics/android/configure-data-collection
 */
@Suppress("unused")
val deactivateAnalyticsPatch = resourcePatch(
    name = "Deactivate Firebase Analytics (9GAG 8.23.0)",
    description = "Optional: disables Firebase Analytics collection using its documented manifest setting. Does not remove Firebase services.",
    default = false
) {
    compatibleWith(COMPATIBILITY_NINEGAG)
    execute {
        document("AndroidManifest.xml").use { document ->
            val applications = document.getElementsByTagName("application")
            check(applications.length == 1) { "Expected one application element" }
            val application = applications.item(0) as Element
            val key = "firebase_analytics_collection_deactivated"
            val entries = application.getElementsByTagName("meta-data")
            val existing = (0 until entries.length)
                .map { entries.item(it) as Element }
                .filter { it.getAttribute("android:name") == key }
            check(existing.size <= 1) { "Duplicate analytics metadata" }
            val entry = existing.singleOrNull() ?: document.createElement("meta-data").also {
                it.setAttribute("android:name", key)
                application.appendChild(it)
            }
            entry.removeAttribute("android:resource")
            entry.setAttribute("android:value", "true")
        }
    }
}
