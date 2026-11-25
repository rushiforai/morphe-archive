package patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import patches.waze.CatalogCompatibility.COMPATIBILITY_WAZE
import org.w3c.dom.Element
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable

/** Turns Crashlytics on for Waze and names the crash reports: user ID, installation ID, app and build type. */
private object CrashlyticsSwitchOnFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(string("BUILD_TYPE"), string("USER_FLAG")),
)

/** Waze's usage-stats reporter: every stat, signed-out stat and ad event passes through here on its way out. */
private object StatsDispatchFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(string("Not reporting the following stat because user is not authenticated: ")),
)

private const val CLIENT_ENG_STATS = "Lcom/waze/stats/ClientEngStatsEventName;"
private const val METRICS_REPORTER = "Lcom/waze/stats/MetricsReporterNativeManager;"

/** Firebase Performance Monitoring has no switch of its own in the manifest; this one turns it off for good. */
private val performanceMonitoringOffPatch = resourcePatch(description = "Deactivates Firebase Performance Monitoring.") {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as Element
            for ((name, value) in mapOf(
                "firebase_performance_collection_deactivated" to "true",
                "firebase_sessions_enabled" to "false",
            )) application.appendChild(
                manifest.createElement("meta-data").apply {
                    setAttribute("android:name", name)
                    setAttribute("android:value", value)
                },
            )
        }
    }
}

@Suppress("unused")
val wazeRemoveTelemetryPatch = bytecodePatch(
    name = "Remove telemetry",
    description = "No crash reports, usage stats or performance data. Traffic reporting stays.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    dependsOn(wazeConfigOverridesPatch, performanceMonitoringOffPatch)

    execute {
        /** Returns at entry while Remove telemetry is switched on; v0 is a free local in each (checked). */
        fun MutableMethod.skipWhileOn(what: String) {
            if (implementation!!.registerCount - parameterTypes.size - 1 < 1) throw PatchException("$what has no free register")
            addInstructionsWithLabels(
                0,
                """
                    const-string v0, "removeTelemetry"
                    invoke-static { v0 }, $WAZE_CUSTOMIZATION->on(Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :telemetry_on
                    return-void
                """,
                ExternalLabel("telemetry_on", implementation!!.instructions.first()),
            )
        }

        // Crashlytics: off in Waze's manifest, switched on by Waze at start-up together with the user's ID.
        // Never switched on, it keeps no crash report to send.
        CrashlyticsSwitchOnFingerprint.method.skipWhileOn("Crashlytics switch")

        // Waze's own usage stats and client engineering stats, and its metrics -- analytics events only. Live
        // traffic, speed and route data travel separately, through Waze's real-time connection, untouched.
        val stats = mutableClassDefBy(StatsDispatchFingerprint.originalClassDef.type)
        StatsDispatchFingerprint.method.skipWhileOn("stats reporter")
        stats.methods.filter { it.returnType == "V" && it.parameterTypes.firstOrNull()?.toString() == CLIENT_ENG_STATS }
            .ifEmpty { throw PatchException("client engineering stats not found in ${stats.type}") }
            .forEach { it.skipWhileOn("client engineering stats") }
        mutableClassDefBy(METRICS_REPORTER).methods.filter { it.name == "a" && it.returnType == "V" && it.parameterTypes.map { type -> type.toString() } == listOf("Lk/b/c;") }
            .ifEmpty { throw PatchException("metrics reporter not found") }
            .forEach { it.skipWhileOn("metrics reporter") }

        // Ingestion guards do not stop the persistent reporter from draining an old stats DB.
        // This stats-only transport returns the original successful batch without calling its
        // network client. Its caller then removes those queued events normally.
        mutableClassDefBy("Lcom/waze/modules/c/a/c;").methods.single {
            it.name == "c" && it.parameterTypes.map { t -> t.toString() } ==
                listOf("Ljava/util/List;", "Lcom/google/w/fi;")
        }.whenWazeFeature("removeTelemetry", "return-object p1")

        // AD_ID permission removal alone does not prevent collection on Android 12L.
        val fetcher = mutableClassDefBy("Lcom/waze/h/a/d;")
        val originalFetch = fetcher.methods.single {
            it.name == "a" && it.returnType == "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;"
        }
        // The original has no local registers. Keep its body in a private instance helper and
        // replace the public entry with a two-register wrapper; never shift its parameter indices.
        fetcher.methods.remove(originalFetch)
        fetcher.methods.add(ImmutableMethod(fetcher.type, "uaOriginalAdsInfo", emptyList(), originalFetch.returnType,
            AccessFlags.PRIVATE.value, null, null, originalFetch.implementation!!).toMutable())
        fetcher.methods.add(ImmutableMethod(fetcher.type, "a", emptyList(), originalFetch.returnType,
            originalFetch.accessFlags, null, null, MutableMethodImplementation(2)).toMutable().apply {
            addInstructions(0, """
                invoke-direct { p0 }, ${fetcher.type}->uaOriginalAdsInfo()${originalFetch.returnType}
                move-result-object v0
                return-object v0
            """)
            whenWazeFeature("removeTelemetry", "const/4 v0, 0x0\nreturn-object v0")
        })
        val attribution = mutableClassDefBy("Lcom/waze/h/a/g;")
        attribution.methods.single { it.name == "c" && it.returnType == "Z" }
            .whenWazeFeature("removeTelemetry", "const/4 v0, 0x0\nreturn v0")
        val identifier = attribution.methods.single { it.name == "b" && it.returnType == "Ljava/lang/String;" }
        identifier.filterWazeObjectReturns("Lorg/ungoogled/waze/PrivacySignals;->attributionId(Ljava/lang/String;)Ljava/lang/String;")

        // Keep explicit Send logs available, but stop automatic uploads. Complete the optional
        // callback as the normal wrapper does, rather than leaving a waiting UI/coroutine open.
        mutableClassDefBy("Lcom/waze/ConfigManagerBase;").methods.single {
            it.name == "sendLogsAutoConfirm" && it.parameterTypes.map { t -> t.toString() } == listOf("Lg/h/a/l;")
        }.whenWazeFeature("removeTelemetry", """
            if-eqz p1, :waze_log_done
            sget-object v0, Lg/ab;->a:Lg/ab;
            invoke-interface { p1, v0 }, Lg/h/a/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
            :waze_log_done
            return-void
        """)

        // The same, kept off whatever Waze's server says after each sync.
        for (name in listOf(
            "CONFIG_VALUE_GENERAL_ANDROID_CRASHLYTICS_ENABLED",
            "CONFIG_VALUE_GENERAL_CRASHLYTICS_LOG_ENABLED",
            "CONFIG_VALUE_ANALYTICS_FIREBASE_PERFORMANCE_ENABLED",
            "CONFIG_VALUE_ANALYTICS_ANDROID_MAIN_THREAD_RESPONSIVENESS_MONITORING",
            "CONFIG_VALUE_ANALYTICS_ANDROID_CPP_THREAD_RESPONSIVENESS_MONITORING",
            "CONFIG_VALUE_MAP_PERFORMANCE_FRAME_RATE_MEASURE_ENABLED",
            "CONFIG_VALUE_MAP_PERFORMANCE_OBJECT_DENSITY_SAMPLER_ENABLED",
            "CONFIG_VALUE_MAP_PERFORMANCE_OBJECT_SNAPSHOT_SAMPLER_ENABLED",
            "CONFIG_VALUE_CONFIG_REPORT_PREFERENCES_STAT_ENABLED",
            "CONFIG_VALUE_ANDROID_AUTO_LOG_ON_GET_TEMPLATE_DELAY_TO_FIREBASE",
            "CONFIG_VALUE_GOOGLE_ADS_TRUSTLESS_TOKEN_LOGGING_ENABLED",
            "CONFIG_VALUE_SIGNUP_STATS_UNAUTHENTICATED_MODULE_ON",
            "CONFIG_VALUE_STATS_MODULE_IS_ON",
            "CONFIG_VALUE_STATS_SHOWN_CLICKED_FIREBASE_EVENT_LOG_ENABLED",
            "CONFIG_VALUE_LOGGING_WRITE_OFFLINE_LOG_FILE",
            "CONFIG_VALUE_INSIGHT_TRACE_LOGS_ENABLED",
        )) keepWazeConfig("removeTelemetry", name, false)
    }
}
