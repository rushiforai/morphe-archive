package patapon888.morphe.patches.bejeweled.tracking

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import patapon888.morphe.patches.bejeweled.BEJEWELED_3

// Without network access no analytics, ad or attribution SDK can send anything,
// and the data consent form (Google UMP) cannot load, so it is never shown.
private val REMOVED_PERMISSIONS = setOf(
    "android.permission.INTERNET",
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
)

// Also switched off at the source, in case a later Android lets them through anyway.
private val DISABLED_COLLECTION = mapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_messaging_auto_init_enabled" to "false",
)

private const val GLU_ANALYTICS = "Lcom/glu/plugins/gluanalytics"

private object KinesisRecorderStreamCreateFingerprint : Fingerprint(
    definingClass = "$GLU_ANALYTICS/KinesisRecorderStream;",
    name = "create"
)

private val disableTrackingResourcePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val permissions = document.getElementsByTagName("uses-permission")
            (0 until permissions.length).map { permissions.item(it) as Element }
                .filter { it.getAttribute("android:name") in REMOVED_PERMISSIONS }
                .forEach { manifest.removeChild(it) }

            val application = document.getElementsByTagName("application").item(0) as Element
            val metaData = document.getElementsByTagName("meta-data")
            (0 until metaData.length).map { metaData.item(it) as Element }
                .filter { it.getAttribute("android:name") in DISABLED_COLLECTION }
                .forEach { it.parentNode.removeChild(it) }
            DISABLED_COLLECTION.forEach { (name, value) ->
                application.appendChild(document.createElement("meta-data").apply {
                    setAttribute("android:name", name)
                    setAttribute("android:value", value)
                })
            }
        }
    }
}

@Suppress("unused")
val disableTrackingPatch = bytecodePatch(
    name = "Disable tracking",
    description = "Removes the game's network access, which also removes the data consent pop-up, and turns off analytics."
) {
    compatibleWith(BEJEWELED_3)

    dependsOn(disableTrackingResourcePatch)

    execute {
        // Glu analytics uploads from its own thread, which dies without network access.
        // It records into the SDK's do-nothing stream instead, as when the service is disabled.
        KinesisRecorderStreamCreateFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, $GLU_ANALYTICS/DummyRecorderStream;
                invoke-direct {v0}, $GLU_ANALYTICS/DummyRecorderStream;-><init>()V
                return-object v0
            """.trimIndent()
        )
    }
}
