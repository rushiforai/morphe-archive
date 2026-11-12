package app.template.patches.polnews.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_POLNEWS
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.telemetry.disableGemiusAudience
import org.w3c.dom.Element

private const val ANALYTICS_REGISTRAR =
    "Lcom/google/firebase/analytics/connector/internal/AnalyticsConnectorRegistrar;"

/**
 * Turns off Firebase Analytics/Crashlytics/Sessions/Performance and ad-ID collection through the
 * manifest switches.
 */
private val disableTelemetryManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_POLNEWS)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val applications = doc.getElementsByTagName("application")
            if (applications.length == 0) throw PatchException("AndroidManifest.xml has no <application>")
            val application = applications.item(0) as Element

            val existing = buildMap {
                val metas = application.getElementsByTagName("meta-data")
                for (i in 0 until metas.length) {
                    val meta = metas.item(i) as? Element ?: continue
                    if (meta.parentNode != application) continue
                    put(meta.getAttribute("android:name"), meta)
                }
            }

            for ((name, value) in mapOf(
                "firebase_analytics_collection_enabled" to "false",
                "firebase_analytics_collection_deactivated" to "true",
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_performance_collection_deactivated" to "true",
                "firebase_sessions_enabled" to "false",
                "google_analytics_adid_collection_enabled" to "false",
            )) {
                val meta = existing[name] ?: doc.createElement("meta-data").also {
                    it.setAttribute("android:name", name)
                    application.appendChild(it)
                }
                meta.setAttribute("android:value", value)
            }
        }
    }
}

/**
 * Politiken's new app shares the JP/Politikens platform. Its telemetry is Gemius audience
 * measurement, Firebase Analytics and Firebase Crashlytics. The Gemius events are no-opped by the
 * shared helper; the manifest switches turn the Firebase SDKs off at startup, and the Analytics
 * component registers nothing so it cannot be initialised if a later version starts calling it.
 * AdOcean ads and the web paywall are separate and not part of this patch.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_POLNEWS)

    dependsOn(disableTelemetryManifestPatch)

    execute {
        disableGemiusAudience()

        val registrar = mutableClassDefBy(ANALYTICS_REGISTRAR)
        val getComponents = registrar.methods.singleOrNull {
            it.name == "getComponents" && it.parameterTypes.isEmpty() &&
                it.returnType == "Ljava/util/List;" && it.implementation != null
        } ?: throw PatchException("$ANALYTICS_REGISTRAR.getComponents() not found")
        getComponents.addInstructionsChecked(
            0,
            """
                sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;
                return-object v0
            """,
        )
    }
}
