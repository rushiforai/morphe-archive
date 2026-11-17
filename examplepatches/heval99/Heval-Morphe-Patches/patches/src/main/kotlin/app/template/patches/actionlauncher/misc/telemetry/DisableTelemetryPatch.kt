package app.template.patches.actionlauncher.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_ACTIONLAUNCHER
import org.w3c.dom.Element

private const val CRASHLYTICS = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;"

/** Crashlytics, Sessions and the advertising ID through the manifest switches. */
private val disableTelemetryManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_ACTIONLAUNCHER)

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
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_analytics_collection_enabled" to "false",
                "firebase_analytics_collection_deactivated" to "true",
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
 * Action Launcher reports crashes and non-fatals through Crashlytics: its own logger calls
 * FirebaseCrashlytics.log(String) and recordException(Throwable). Both return at once here, and the
 * manifest switch stops the automatic crash/session collection. The launcher itself is untouched.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables crash reporting.",
) {
    compatibleWith(COMPATIBILITY_ACTIONLAUNCHER)

    dependsOn(disableTelemetryManifestPatch)

    execute {
        val crashlytics = mutableClassDefBy(CRASHLYTICS)
        val calls = listOf(
            "log" to listOf("Ljava/lang/String;"),
            "recordException" to listOf("Ljava/lang/Throwable;"),
        )
        calls.forEach { (name, parameters) ->
            val method = crashlytics.methods.singleOrNull {
                it.name == name && it.returnType == "V" && it.implementation != null &&
                    it.parameterTypes.map(CharSequence::toString) == parameters
            } ?: throw PatchException("$CRASHLYTICS->$name$parameters not found")
            method.returnEarly()
        }
    }
}
