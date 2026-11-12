package app.template.patches.blockbuster.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_BLOCKBUSTER
import app.template.patches.shared.addInstructionsChecked
import org.w3c.dom.Element

/**
 * Turns off Firebase Analytics, Crashlytics, Sessions, Performance and advertising-ID collection
 * through the manifest switches. Firebase Messaging (push) is not touched.
 */
private val disableTelemetryManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_BLOCKBUSTER)

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
                // The app already declares the two analytics switches; overwrite them in place.
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
 * Blockbuster reports usage through @react-native-firebase/analytics and errors through the Sentry
 * RN SDK (auto-init is already off in the stock manifest, so the JS SDK starts it). The patch
 * forces the analytics module's setAnalyticsCollectionEnabled argument to Boolean.FALSE, so the
 * consent flow cannot switch collection back on, and makes every SentryAndroid.init overload return
 * at once, which is where both SentryInitProvider and RNSentryStart end up. Firebase Messaging and
 * the Play Billing purchase flow are untouched.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_BLOCKBUSTER)

    dependsOn(disableTelemetryManifestPatch)

    execute {
        // 1. Firebase Analytics: the JS consent flow cannot re-enable collection.
        val switch = AnalyticsCollectionSwitchFingerprint.method
        val register = switch.implementation!!.registerCount - switch.parameterTypes.size
        val const = if (register < 16) "const/4" else "const/16"
        switch.addInstructionsChecked(0, "$const v$register, 0x0")

        // 2. Sentry: every public init overload returns at once.
        val sentry = mutableClassDefBy(SENTRY_ANDROID)
        val inits = sentry.methods.filter {
            it.name == "init" && it.returnType == "V" && it.implementation != null
        }
        if (inits.size < 4) throw PatchException("$SENTRY_ANDROID has ${inits.size} init overloads, expected 4")
        inits.forEach { it.returnEarly() }
    }
}
