package app.fakhradio.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.fakhradio.patches.shared.Constants.COMPATIBILITY_RADIO_ID
import app.fakhradio.patches.shared.disableProviders
import org.w3c.dom.Element

/**
 * `com.appmind.countryradios.analytics.facebook.c.k()`: whether the Facebook
 * app id and client token are set. Every Facebook path in that class checks it
 * first: SDK init (which also forces auto-logged app events and advertiser id
 * collection back on), favorites/zapping/KVP goal events and ad impressions.
 */
private val facebookConfiguredFingerprint = Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { _, classDef ->
        classDef.type.startsWith("Lcom/appmind/countryradios/analytics/facebook/")
    },
)

/** The app turns Crashlytics on at runtime in its secondary processes, over the manifest flag. */
private val setCrashlyticsCollectionEnabledFingerprint = Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "setCrashlyticsCollectionEnabled",
    returnType = "V",
    parameters = listOf("Z"),
)

/**
 * Firebase reads these at startup. The `deactivated` flags cannot be turned
 * back on at runtime, which matters for Performance: the app calls
 * `setPerformanceCollectionEnabled(true)` in its main process.
 */
private val analyticsManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as Element
            mapOf(
                "firebase_analytics_collection_deactivated" to "true",
                "google_analytics_adid_collection_enabled" to "false",
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_performance_collection_deactivated" to "true",
                "firebase_sessions_enabled" to "false",
            ).forEach { (name, value) ->
                application.appendChild(
                    manifest.createElement("meta-data").apply {
                        setAttribute("android:name", name)
                        setAttribute("android:value", value)
                    }
                )
            }
            manifest.disableProviders("com.facebook.internal.FacebookInitProvider")
        }
    }
}

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Turns off Firebase Analytics, Crashlytics, Performance and Sessions, and the Facebook SDK with its app events.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RADIO_ID)
    category("Privacy")
    dependsOn(analyticsManifestPatch)

    execute {
        facebookConfiguredFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
        setCrashlyticsCollectionEnabledFingerprint.method.addInstructions(0, "return-void")
    }
}
