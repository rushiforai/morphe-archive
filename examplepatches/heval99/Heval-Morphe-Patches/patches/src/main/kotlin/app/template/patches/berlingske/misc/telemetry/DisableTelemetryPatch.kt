package app.template.patches.berlingske.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_BERLINGSKE
import app.template.patches.shared.Constants.COMPATIBILITY_BT
import org.w3c.dom.Element

// The app's Firebase Analytics is R8-shrunk to the three event methods; the public class keeps its
// name and the signatures are stable library APIs.
private const val ANALYTICS = "Lcom/google/firebase/analytics/FirebaseAnalytics;"

/**
 * Turns off Firebase Analytics, Crashlytics, Performance, Sessions and ad-ID collection through the
 * manifest switches. The Firebase components stay registered (the app calls
 * FirebaseAnalytics.getInstance from a wrapper, so removing the component would fail); the switches
 * stop collection while the objects stay available.
 */
private val disableTelemetryManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_BERLINGSKE, COMPATIBILITY_BT)

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
                // Crashlytics and the ad-ID switch already ship; overwrite them in place.
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
 * Berlingske and B.T. are the same small native news app (one binary, two packages) with no ad SDK. Its only telemetry is Firebase Analytics
 * and Crashlytics; the Analytics instance is fetched once from a wrapper, but no events are sent
 * through the three event methods in this build. They are no-opped anyway so a later call cannot
 * log anything, and the manifest switches stop the automatic collection.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_BERLINGSKE, COMPATIBILITY_BT)

    dependsOn(disableTelemetryManifestPatch)

    execute {
        val analytics = mutableClassDefBy(ANALYTICS)
        val eventMethods = analytics.methods.filter {
            it.returnType == "V" && it.implementation != null &&
                (
                    (it.name == "a" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "Landroid/os/Bundle;")) ||
                        (it.name == "b" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "Ljava/lang/String;")) ||
                        (it.name == "setCurrentScreen" && it.parameterTypes.size == 3)
                    )
        }
        if (eventMethods.size != 3) {
            throw PatchException(
                "$ANALYTICS has ${eventMethods.size} event methods; expected the logEvent, " +
                    "setUserProperty and setCurrentScreen shapes",
            )
        }
        eventMethods.forEach { it.returnEarly() }
    }
}
