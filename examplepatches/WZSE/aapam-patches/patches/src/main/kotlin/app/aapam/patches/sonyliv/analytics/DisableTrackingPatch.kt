package app.aapam.patches.sonyliv.analytics

import app.aapam.patches.sonyliv.shared.AppsFlyerTrackParamsFingerprint
import app.aapam.patches.sonyliv.shared.CleverTapQueueFlushFingerprint
import app.aapam.patches.sonyliv.shared.CleverTapSendQueueFingerprint
import app.aapam.patches.sonyliv.shared.Constants
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private val FIREBASE_DISABLE_FLAGS = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_ssaid_collection_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_performance_collection_enabled" to "false",
)

private val disableFirebaseTrackingResourcePatch = resourcePatch(
    name = "Disable Firebase tracking",
    description = "Disables Firebase Analytics, Crashlytics, and Performance data collection via manifest flags.",
) {
    compatibleWith(Constants.COMPATIBILITY_SONYLIV)

    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element

            val existing = HashMap<String, Element>()
            val metaDataNodes = document.getElementsByTagName("meta-data")
            for (i in 0 until metaDataNodes.length) {
                val element = metaDataNodes.item(i) as Element
                existing[element.getAttribute("android:name")] = element
            }

            FIREBASE_DISABLE_FLAGS.forEach { (name, value) ->
                val current = existing[name]
                if (current != null) {
                    current.setAttribute("android:value", value)
                } else {
                    application.appendChild(
                        document.createElement("meta-data").apply {
                            setAttribute("android:name", name)
                            setAttribute("android:value", value)
                        },
                    )
                }
            }
        }
    }
}

@Suppress("unused")
val disableTrackingPatch = bytecodePatch(
    name = "Disable tracking",
    description = "Disables CleverTap, Firebase Analytics/Crashlytics, and AppsFlyer tracking and telemetry exfiltration.",
) {
    compatibleWith(Constants.COMPATIBILITY_SONYLIV)
    dependsOn(disableFirebaseTrackingResourcePatch)

    execute {
        // CleverTap: Drop queue flushing
        CleverTapQueueFlushFingerprint.method.addInstructions(
            0,
            "return-void",
        )

        // CleverTap: Drop network transmission of event batches
        CleverTapSendQueueFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        // AppsFlyer: Short-circuit tracking parameter builder
        AppsFlyerTrackParamsFingerprint.method.addInstructions(
            0,
            "return-void",
        )
    }
}
