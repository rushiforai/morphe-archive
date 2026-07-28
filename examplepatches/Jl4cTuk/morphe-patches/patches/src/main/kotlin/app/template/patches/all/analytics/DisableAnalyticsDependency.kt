package app.template.patches.all.analytics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import java.util.logging.Logger

private val logger = Logger.getLogger("DisableAnalytics")
private const val APP_METRICA_API_CLASS = "Lio/appmetrica/analytics/AppMetrica;"

private val disableAnalyticsManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application = manifest.childrenNamed("application").single() as Element

            val appMetrica: (String) -> Boolean = {
                it.startsWith("io.appmetrica.analytics.") ||
                    it.startsWith("com.yandex.metrica.") ||
                    it.startsWith("com.yandex.preinstallsatellite.appmetrica.")
            }
            val appMetricaFound = application
                .childrenNamed("activity", "provider", "service", "receiver")
                .any { appMetrica(it.getAttribute("android:name")) }
            application.removeChildren(
                application.childrenNamed("activity", "provider", "service", "receiver")
                    .filter { appMetrica(it.getAttribute("android:name")) },
            )
            application.setApplicationMetaData("io.appmetrica.analytics.auto_tracking_enabled", "false")
            application.setApplicationMetaData("io.appmetrica.analytics.location_tracking_enabled", "false")
            logger.info("AppMetrica: ${if (appMetricaFound) "patched" else "not found"}")

            val myTrackerFound = application.disableComponentsWhere {
                it.startsWith("com.my.tracker.") ||
                    it.startsWith("ru.mail.mytracker.") ||
                    it.contains(".mytracker.", ignoreCase = true)
            } > 0
            logger.info("MyTracker: ${if (myTrackerFound) "patched" else "not found"}")

            mapOf(
                "firebase_analytics_collection_enabled" to "false",
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_performance_collection_enabled" to "false",
                "firebase_performance_logcat_enabled" to "false",
                "firebase_data_collection_default_enabled" to "false",
                "google_analytics_adid_collection_enabled" to "false",
                "google_analytics_deferred_deep_link_enabled" to "false",
            ).forEach { (name, value) -> application.setApplicationMetaData(name, value) }
            application.disableComponentsByName(
                "com.google.android.datatransport.runtime.backends.TransportBackendDiscovery",
                "com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService",
                "com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver",
                "com.google.firebase.sessions.SessionLifecycleService",
            )

            val googleAnalyticsFound = application.disableComponentsByPrefix(
                "com.google.android.gms.analytics.",
                "com.google.android.gms.tagmanager.",
            ) > 0
            logger.info(
                "Google Analytics: ${if (googleAnalyticsFound) "patched" else "not found"}",
            )

            application.setApplicationMetaData("io.sentry.enabled", "false")
            application.setApplicationMetaData("io.sentry.dsn", "")
            val sentryFound = application.disableComponentsWhere {
                it.startsWith("io.sentry.") || it.contains(".Sentry")
            } > 0
            logger.info("Sentry: ${if (sentryFound) "patched" else "not found"}")

            manifest.removeChildren(
                manifest.childrenNamed("uses-permission")
                    .filter { it.getAttribute("android:name").startsWith("com.adjust.") },
            )
            val adjustFound = application.disableComponentsByPrefix("com.adjust.") > 0
            logger.info("Adjust: ${if (adjustFound) "patched" else "not found"}")

            manifest.removeChildren(
                manifest.childrenNamed("uses-permission")
                    .filter {
                        it.getAttribute("android:name") ==
                            "com.appsflyer.referrer.INSTALL_PROVIDER"
                    },
            )
            val appsFlyerFound = application.disableComponentsByPrefix("com.appsflyer.") > 0
            logger.info("AppsFlyer: ${if (appsFlyerFound) "patched" else "not found"}")

            application.setApplicationMetaData("com.facebook.sdk.AutoLogAppEventsEnabled", "false")
            application.setApplicationMetaData(
                "com.facebook.sdk.AdvertiserIDCollectionEnabled",
                "false",
            )
            application.disableComponentsByPrefix("com.facebook.appevents.")
            val facebookFound = application.disableComponentsByPrefix("com.facebook.analytics.") > 0
            logger.info("Facebook: ${if (facebookFound) "patched" else "not found"}")

            application.setApplicationMetaData(
                "com_moengage_core_file_based_initialisation_enabled",
                "false",
            )
            application.setApplicationMetaData(
                "com_moengage_core_background_data_sync_enabled",
                "false",
            )
            application.setApplicationMetaData("com_moengage_core_carrier_tracking_enabled", "false")
            application.setApplicationMetaData(
                "com_moengage_core_device_attribute_tracking_enabled",
                "false",
            )
            application.setApplicationMetaData(
                "com_moengage_core_user_registration_enabled",
                "false",
            )
            application.setApplicationMetaData("com_moengage_fcm_registration_enabled", "false")
            val moEngageFound = application.disableComponentsByPrefix("com.moengage.") > 0
            logger.info("MoEngage: ${if (moEngageFound) "patched" else "not found"}")

            val comScoreFound = application.disableComponentsByPrefix("com.comscore.") > 0
            logger.info("comScore: ${if (comScoreFound) "patched" else "not found"}")

            val amplitudeFound = application.disableComponentsByPrefix("com.amplitude.") > 0
            logger.info("Amplitude: ${if (amplitudeFound) "patched" else "not found"}")

            val mixpanelFound = application.disableComponentsByPrefix("com.mixpanel.") > 0
            logger.info("Mixpanel: ${if (mixpanelFound) "patched" else "not found"}")
        }
    }
}

/**
 * Shared, unnamed dependency. It is included in the bundle only through app-specific patches
 * and does not appear as a standalone patch in Morphe Manager.
 */
val disableAnalyticsDependency = bytecodePatch {
    dependsOn(disableAnalyticsManifestPatch)

    execute {
        var appMetricaAppOpenMethods = 0
        classDefForEach { classDef ->
            if (classDef.type != APP_METRICA_API_CLASS) return@classDefForEach

            mutableClassDefBy(classDef).methods.forEach { method ->
                if (
                    method.name == "reportAppOpen" &&
                    method.returnType == "V" &&
                    method.implementation != null
                ) {
                    method.addInstructions(0, "return-void")
                    appMetricaAppOpenMethods++
                }
            }
        }
        logger.info("AppMetrica reportAppOpen: patched $appMetricaAppOpenMethods methods")

        AppMetricaActivateFingerprint.methodOrNull
            ?.addInstructions(0, "return-void")
            .also {
                logger.info("AppMetrica activation: ${if (it != null) "patched" else "not found"}")
            }

        AppMetricaPublicApiFingerprint.methodOrNull
            ?.addInstructions(0, "return-void")
            .also {
                logger.info("AppMetrica public API: ${if (it != null) "patched" else "not found"}")
            }

        AppMetricaInternalReportFingerprint.methodOrNull
            ?.addInstructions(0, "return-void")
            .also {
                logger.info("AppMetrica internal: ${if (it != null) "patched" else "not found"}")
            }

        AppMetricaInternalQueueFingerprint.methodOrNull
            ?.addInstructions(
                0,
                """
                    const/4 p0, 0x0
                    invoke-static {p0}, Ljava/util/concurrent/CompletableFuture;->completedFuture(Ljava/lang/Object;)Ljava/util/concurrent/CompletableFuture;
                    move-result-object p0
                    return-object p0
                """,
            )
            .also {
                logger.info("AppMetrica queue: ${if (it != null) "patched" else "not found"}")
            }

        AppMetricaInternalCallbackFingerprint.methodOrNull
            ?.addInstructions(0, "const/4 p0, 0x0\nreturn-object p0")
            .also {
                logger.info("AppMetrica callback: ${if (it != null) "patched" else "not found"}")
            }

        MyTrackerInitFingerprint.methodOrNull
            ?.addInstructions(0, "return-void")
            .also { logger.info("MyTracker: ${if (it != null) "patched" else "not found"}") }

        FirebaseCrashlyticsCollectionFingerprint.methodOrNull
            ?.addInstructions(0, "return-void")
            .also {
                logger.info(
                    "Firebase Crashlytics collection: ${if (it != null) "patched" else "not found"}",
                )
            }

        FirebasePerformanceCollectionFingerprint.methodOrNull
            ?.addInstructions(0, "return-void")
            .also {
                logger.info(
                    "Firebase Performance collection: ${if (it != null) "patched" else "not found"}",
                )
            }
    }
}
