package app.template.patches.way2news.analytics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_WAY2NEWS
import org.w3c.dom.Element

// Manifest switches documented by Firebase / Google Analytics.
private val MANIFEST_SWITCHES = mapOf(
    // Fully deactivates Firebase Analytics collection (cannot be re-enabled at runtime).
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_analytics_collection_enabled" to "false",
    // Stops Google Analytics from reading the advertising id and the Android id.
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_ssaid_collection_enabled" to "false",
)

@Suppress("unused")
val disableAnalyticsPatch = patch(
    name = "Disable analytics",
    description = "Disables Singular attribution and Firebase Analytics tracking.",
    default = true
) {
    compatibleWith(COMPATIBILITY_WAY2NEWS)

    execute {
        // Firebase: switch off automatic data collection at manifest level.
        document("AndroidManifest.xml").use { document ->
            val application = document.documentElement
                .getElementsByTagName("application")
                .item(0) as? Element
                ?: throw PatchException("AndroidManifest.xml does not contain an application element.")

            val existing = application.getElementsByTagName("meta-data")
            MANIFEST_SWITCHES.forEach { (name, value) ->
                var entry: Element? = null
                for (i in 0 until existing.length) {
                    val node = existing.item(i) as? Element ?: continue
                    if (node.getAttribute("android:name") == name) entry = node
                }
                if (entry == null) {
                    entry = document.createElement("meta-data")
                    entry.setAttribute("android:name", name)
                    application.appendChild(entry)
                }
                entry.setAttribute("android:value", value)
            }
        }

        // Singular: never initialise the SDK (all later event calls then return false).
        SingularInitFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        // Firebase Analytics: drop events, user ids, user properties and screen names.
        listOf(
            FirebaseLogEventFingerprint,
            FirebaseSetUserIdFingerprint,
            FirebaseSetUserPropertyFingerprint,
            FirebaseSetCurrentScreenFingerprint,
        ).forEach { it.method.addInstructions(0, "return-void") }

        // Anything that tries to turn collection on is forced to "off".
        FirebaseSetCollectionEnabledFingerprint.method.addInstructions(0, "const/4 p1, 0x0")
    }
}
