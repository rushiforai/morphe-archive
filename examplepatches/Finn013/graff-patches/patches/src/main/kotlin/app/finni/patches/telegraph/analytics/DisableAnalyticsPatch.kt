package app.finni.patches.telegraph.analytics

import app.finni.patches.telegraph.shared.Constants.COMPATIBILITY_TELEGRAPH_PLUS
import app.finni.patches.telegraph.shared.putMetaData
import app.finni.patches.telegraph.shared.removeElements
import app.finni.patches.telegraph.signature.disableSignatureCheckPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.util.findFreeRegister

@Suppress("unused")
val disableAnalyticsPatch = patch(
    name = "Disable analytics",
    description = "Stops AppMetrica (Yandex) from sending data right after it is activated, turns off " +
        "Firebase Analytics collection and removes the AppMetrica preload provider.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TELEGRAPH_PLUS)
    dependsOn(disableSignatureCheckPatch)

    execute {
        // AppMetrica: setDataSendingEnabled(false) right after activate().
        AppMetricaActivateFingerprint.matchAll().forEach { match ->
            val afterActivate = match.instructionMatches.single().index + 1
            val register = match.method.findFreeRegister(afterActivate)
            match.method.addInstructions(
                afterActivate,
                """
                    const/4 v$register, 0x0
                    invoke-static { v$register }, Lio/appmetrica/analytics/AppMetrica;->setDataSendingEnabled(Z)V
                """,
            )
        }

        resourceXml("AndroidManifest.xml").use { manifest ->
            manifest.removeElements("provider") { it == "io.appmetrica.analytics.internal.PreloadInfoContentProvider" }

            // Firebase Analytics: documented manifest switches.
            manifest.putMetaData("firebase_analytics_collection_deactivated", "true")
            manifest.putMetaData("google_analytics_adid_collection_enabled", "false")
            manifest.putMetaData("google_analytics_default_allow_ad_personalization_signals", "false")
        }
    }
}
