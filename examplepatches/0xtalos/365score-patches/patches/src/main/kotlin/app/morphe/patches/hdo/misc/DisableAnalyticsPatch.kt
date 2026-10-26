package app.morphe.patches.hdo.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.hdo.utils.COMPATIBILITY_HDO
import org.w3c.dom.Element

/** Meta-data read by Firebase Analytics while the process is starting up. */
private val ANALYTICS_FLAGS = mapOf(
    // Turns measurement off before any event can be recorded.
    "firebase_analytics_collection_enabled" to "false",
    // The Flutter screen route observer reports every navigation as a screen_view.
    "google_analytics_automatic_screen_reporting_enabled" to "false",
    // Stops the advertising id from being collected and attached to events.
    "google_analytics_adid_collection_enabled" to "false",
    // Stops the device serial / SSAID from being collected.
    "google_analytics_ssaid_collection_enabled" to "false",
)

/**
 * Manifest flags that keep Firebase Analytics off from process start.
 *
 * Measurement can also be switched off at runtime, but the app is free to turn it back on, so
 * the default is disabled here as well. Firestore, Auth and Messaging are unaffected.
 */
internal val analyticsResourcePatch = resourcePatch {
    compatibleWith(*COMPATIBILITY_HDO)

    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("AndroidManifest.xml has no <application>")

            val existing = buildSet {
                val metaDatas = application.getElementsByTagName("meta-data")
                for (i in 0 until metaDatas.length) {
                    (metaDatas.item(i) as? Element)?.getAttribute("android:name")?.let(::add)
                }
            }

            ANALYTICS_FLAGS.forEach { (name, value) ->
                if (name in existing) {
                    throw PatchException("Analytics meta-data \"$name\" is already declared")
                }
                val metaData = document.createElement("meta-data")
                metaData.setAttribute("android:name", name)
                metaData.setAttribute("android:value", value)
                application.appendChild(metaData)
            }
        }
    }
}

/**
 * The Firebase Analytics plugin method the app can call at any time to turn measurement back on.
 * The first parameter is the boolean to force, the second is the Pigeon result callback whose
 * type is obfuscated, so the parameter list is verified by a custom condition instead.
 */
private object SetAnalyticsCollectionEnabledFingerprint : Fingerprint(
    definingClass = "Lio/flutter/plugins/firebase/analytics/FlutterFirebaseAnalyticsPlugin;",
    name = "setAnalyticsCollectionEnabled",
    returnType = "V",
    custom = { method, _ ->
        method.parameterTypes.size == 2 && method.parameterTypes[0] == "Z"
    },
)

/**
 * Disables Firebase Analytics, the only analytics SDK used by HDO Box.
 */
@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Disables Firebase Analytics collection, automatic screen reporting and " +
        "advertising id collection, and prevents the app from re-enabling them.",
) {
    compatibleWith(*COMPATIBILITY_HDO)
    dependsOn(analyticsResourcePatch)

    execute {
        val method = SetAnalyticsCollectionEnabledFingerprint.methodOrNull
            ?: throw PatchException("FlutterFirebaseAnalyticsPlugin.setAnalyticsCollectionEnabled not found")
        // Force the `enabled` parameter to false before the plugin forwards it to Firebase.
        method.addInstructions(0, "const/4 p1, 0x0")
    }
}
