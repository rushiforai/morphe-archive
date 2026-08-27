package app.template.patches.expand

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_EXPAND
import org.w3c.dom.Element

private val disableFirebaseAnalyticsPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_EXPAND)

    execute {
        val disabledMetadata = mapOf(
            "firebase_analytics_collection_enabled" to "false",
            "firebase_analytics_collection_deactivated" to "true",
            "google_analytics_adid_collection_enabled" to "false",
            "google_analytics_ssaid_collection_enabled" to "false",
            "google_analytics_automatic_screen_reporting_enabled" to "false",
            "google_analytics_default_allow_analytics_storage" to "false",
            "google_analytics_default_allow_ad_storage" to "false",
            "google_analytics_default_allow_ad_user_data" to "false",
            "google_analytics_default_allow_ad_personalization_signals" to "false",
        )

        document("AndroidManifest.xml").use { document ->
            val metadata = document.getElementsByTagName("meta-data")
            for (index in 0 until metadata.length) {
                val element = metadata.item(index) as? Element ?: continue
                val value = disabledMetadata[element.getAttribute("android:name")] ?: continue
                element.setAttribute("android:value", value)
            }
        }
    }
}

/**
 * Disable Adjust attribution and Firebase Analytics for Expand.
 *
 * Target found in decompiled sources:
 *   sources/com/adjust/sdk/Adjust.java
 *     → initSdk(AdjustConfig)
 *     → trackEvent(AdjustEvent)
 *
 * Call chain (for your own verification):
 *   JS / Hermes
 *     → com.adjust.nativemodule.Adjust.initSdk (RN bridge)
 *       → com.adjust.sdk.Adjust.initSdk  ← we nop this
 */
@Suppress("unused")
val disableAdjustPatch = bytecodePatch(
    name = "Disable Analytics",
    description = "Prevents Adjust and Firebase Analytics from collecting or sending analytics.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_EXPAND)
    dependsOn(disableFirebaseAnalyticsPatch)

    execute {
        // Early return-void: anything after index 0 never runs.
        AdjustInitSdkFingerprint.method.addInstructions(0, "return-void")
        AdjustTrackEventFingerprint.method.addInstructions(0, "return-void")
    }
}
