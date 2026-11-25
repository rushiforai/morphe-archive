package app.stayfree.patches.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE
import app.stayfree.patches.shared.resource.androidManifest
import app.stayfree.patches.shared.resource.metaData
import app.stayfree.patches.shared.resource.removeReceiver
import app.stayfree.patches.shared.resource.removeService
import app.stayfree.patches.shared.resource.removeUsesPermission
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

/**
 * Unroutable replacement for every telemetry endpoint. Kept as a valid https URL so SDKs that
 * parse it (`Uri.parse`, OkHttp `HttpUrl`, Bugsnag endpoint validation) don't throw; requests
 * simply fail to connect and are dropped/retried by the SDK's own error handling.
 */
private const val BLOCKED_ENDPOINT = "https://127.0.0.1/"

/**
 * Hard-coded endpoints of SDKs that only do analytics/attribution/crash reporting. Hosts shared
 * with real features (`api.stayfreeapps.com`, `purchases.stayfreeapps.com`, HelpScout support
 * chat, Firebase Remote Config/Storage/Messaging) are deliberately not listed; the SensorTower
 * usage upload that goes to `api.stayfreeapps.com/v1/analytics/...` is blocked by the opt-out
 * patch instead. The Firebase Transport (firelog) URL is string-obfuscated in the SDK, so it is
 * cut off by removing its backend registration from the manifest.
 */
private val TELEMETRY_ENDPOINTS = setOf(
    // Amplitude
    "https://api2.amplitude.com/",
    "https://api.eu.amplitude.com/",
    "https://regionconfig.amplitude.com/",
    "https://regionconfig.eu.amplitude.com/",
    // Singular
    "https://sdk-api-v1.singular.net/api/v1",
    "https://sdk-api-v1.singular.net/api/v1/shorten_link",
    "https://exceptions.singular.net/v2/exceptions/android",
    // Bugsnag
    "https://notify.bugsnag.com",
    "https://sessions.bugsnag.com",
    // Google Analytics for Firebase (App Measurement)
    "https://app-measurement.com/a",
    "https://app-measurement.com/s/d",
    // Crashlytics settings
    "https://firebase-settings.crashlytics.com/spi/v2/platforms/android/gmp/",
)

private val telemetryManifestPatch = resourcePatch(
    description = "Disables telemetry SDKs through their manifest flags and removes their " +
        "components and advertising permissions.",
) {
    execute {
        androidManifest {
            metaData(
                // Firebase / Google Analytics. "deactivated" is permanent: unlike
                // "collection_enabled" it can't be turned back on by the Flutter plugin at runtime.
                "firebase_analytics_collection_deactivated" to "true",
                "firebase_analytics_collection_enabled" to "false",
                "google_analytics_adid_collection_enabled" to "false",
                "google_analytics_ssaid_collection_enabled" to "false",
                "google_analytics_default_allow_ad_personalization_signals" to "false",
                "google_analytics_default_allow_ad_user_data" to "false",
                "google_analytics_default_allow_analytics_storage" to "false",
                "google_analytics_automatic_screen_reporting_enabled" to "false",
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_performance_collection_deactivated" to "true",
                "firebase_performance_collection_enabled" to "false",
                "firebase_sessions_enabled" to "false",
                "delivery_metrics_exported_to_big_query_enabled" to "false",
                // Bugsnag is kept started (the bugsnag_flutter plugin attaches to the native
                // client and would throw into Dart otherwise), but with a release stage list the
                // app's "production" stage is never in, so every event and session is discarded.
                "com.bugsnag.android.ENABLED_RELEASE_STAGES" to "none",
                "com.bugsnag.android.AUTO_DETECT_ERRORS" to "false",
                "com.bugsnag.android.AUTO_TRACK_SESSIONS" to "false",
                "com.bugsnag.android.ENDPOINT_NOTIFY" to BLOCKED_ENDPOINT,
                "com.bugsnag.android.ENDPOINT_SESSIONS" to BLOCKED_ENDPOINT,
                // Facebook SDK: auto-initialized by FacebookInitProvider, which would otherwise
                // log install/activate app events with the advertising ID.
                "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
                "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
                "com.facebook.sdk.MonitorEnabled" to "false",
            )

            // App Measurement (Google Analytics) services/receivers.
            removeService("""com\.google\.android\.gms\.measurement\..+Service""")
            removeReceiver("""com\.google\.android\.gms\.measurement\..+Receiver""")

            // Firebase Transport backend registry (firelog upload used by Crashlytics, Sessions,
            // FCM delivery metrics and ML Kit logging). Without it TransportRuntime finds no
            // backend and drops every event batch.
            removeService("""com\.google\.android\.datatransport\.runtime\.backends\.TransportBackendDiscovery""")

            // SensorTower usage SDK periodic upload job and its boot-time rescheduler. The app's own
            // BootCompletedAndUpdateReceiver (com.burockgames…) is unrelated and kept.
            removeReceiver(
                """com\.sensortower\.usage\.sdk\.upload\.DataUploadJob""",
                """com\.sensortower\.usage\.sdk\.upload\.scheduler\.BootCompletedAndUpdateReceiver""",
            )

            removeUsesPermission(
                """com\.google\.android\.gms\.permission\.AD_ID""",
                """android\.permission\.ACCESS_ADSERVICES_.+""",
                """com\.google\.android\.finsky\.permission\.BIND_GET_INSTALL_REFERRER_SERVICE""",
            )
        }
    }
}

@Suppress("unused")
val disableAllTelemetryPatch = bytecodePatch(
    name = "Disable All Telemetry",
    description = "Removes and blocks all telemetry and analytics: SensorTower usage-data upload " +
        "(app/web usage, browsing, shopping, AI prompts), Amplitude, Singular, Bugsnag, " +
        "Firebase Analytics/Crashlytics/Performance/Sessions, Google App Measurement, Facebook " +
        "app events and the advertising ID. Telemetry endpoints are also rewritten to localhost.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)

    dependsOn(telemetryManifestPatch)

    execute {
        // SensorTower usage SDK: force "opted out" and "consent choice made".
        UsageSdkOptOutFingerprint.matchAllOrNull()!!.forEach { match ->
            match.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }

        // Amplitude: every API call short-circuits in contextAndApiKeySet().
        AmplitudeContextAndApiKeySetFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        // Crashlytics: automatic data collection permanently off, regardless of Dart overrides.
        CrashlyticsIsAutomaticDataCollectionEnabledFingerprint
            .match(CrashlyticsLogDataCollectionStateFingerprint.originalClassDef)
            .method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """,
            )

        // Singular: never create the SDK instance. Every public Singular API checks
        // isInitialized() first and only logs when it is null. SingularInitializer itself is
        // left alone, because it also runs the shared usage-SDK bootstrap.
        mutableClassDefBy("Lcom/singular/sdk/Singular;").methods
            .filter { it.name == "init" && it.returnType == "Z" }
            .forEach { method ->
                method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x0
                        return v0
                    """,
                )
            }

        // Belt and braces: point every hard-coded telemetry endpoint at localhost.
        TELEMETRY_ENDPOINTS.flatMap(::getAllClassesWithString).distinct().forEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)
            mutableClass.methods.forEach methods@{ method ->
                val instructions = method.implementation?.instructions ?: return@methods
                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.CONST_STRING &&
                        instruction.opcode != Opcode.CONST_STRING_JUMBO
                    ) return@forEachIndexed

                    val string = ((instruction as ReferenceInstruction).reference as StringReference).string
                    if (string !in TELEMETRY_ENDPOINTS) return@forEachIndexed

                    method.replaceInstruction(
                        index,
                        BuilderInstruction21c(
                            Opcode.CONST_STRING,
                            (instruction as OneRegisterInstruction).registerA,
                            ImmutableStringReference(BLOCKED_ENDPOINT),
                        ),
                    )
                }
            }
        }
    }
}
