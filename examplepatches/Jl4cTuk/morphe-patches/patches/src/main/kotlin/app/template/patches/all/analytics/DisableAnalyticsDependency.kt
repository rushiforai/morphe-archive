package app.template.patches.all.analytics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import org.w3c.dom.Element
import java.util.logging.Logger

private val logger = Logger.getLogger("DisableAnalytics")

private const val APP_METRICA_API_CLASS = "Lio/appmetrica/analytics/AppMetrica;"
private const val APP_METRICA_LIBRARY_ADAPTER_CLASS =
    "Lio/appmetrica/analytics/AppMetricaLibraryAdapter;"
private const val APP_METRICA_MODULES_FACADE_CLASS =
    "Lio/appmetrica/analytics/ModulesFacade;"
private const val APP_METRICA_IMPL_PREFIX = "Lio/appmetrica/analytics/impl/"
private const val MY_TRACKER_API_CLASS = "Lcom/my/tracker/MyTracker;"

private data class MethodSignature(
    val name: String,
    val parameters: List<String>,
)

private fun Method.signature() = MethodSignature(
    name,
    parameterTypes.map(CharSequence::toString),
)

private fun Method.isPublicVoidImplementation() =
    returnType == "V" &&
        !name.startsWith("<") &&
        implementation != null &&
        AccessFlags.PUBLIC.isSet(accessFlags)

private fun MutableMethod.disable() {
    addInstructions(0, "return-void")
}

private val appMetricaFacadeRequirements = mapOf(
    APP_METRICA_API_CLASS to setOf(
        MethodSignature(
            "activate",
            listOf(
                "Landroid/content/Context;",
                "Lio/appmetrica/analytics/AppMetricaConfig;",
            ),
        ),
        MethodSignature("reportAppOpen", listOf("Ljava/lang/String;")),
        MethodSignature("reportEvent", listOf("Ljava/lang/String;")),
        MethodSignature(
            "reportError",
            listOf("Ljava/lang/String;", "Ljava/lang/Throwable;"),
        ),
        MethodSignature("sendEventsBuffer", emptyList()),
    ),
    APP_METRICA_LIBRARY_ADAPTER_CLASS to setOf(
        MethodSignature("activate", listOf("Landroid/content/Context;")),
        MethodSignature(
            "reportEvent",
            listOf(
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
            ),
        ),
    ),
    APP_METRICA_MODULES_FACADE_CLASS to setOf(
        MethodSignature(
            "reportEvent",
            listOf("Lio/appmetrica/analytics/ModuleEvent;"),
        ),
        MethodSignature("sendEventsBuffer", emptyList()),
    ),
)

private val appMetricaReporterRequirements = setOf(
    MethodSignature("reportEvent", listOf("Ljava/lang/String;")),
    MethodSignature(
        "reportEvent",
        listOf("Ljava/lang/String;", "Ljava/util/Map;"),
    ),
    MethodSignature(
        "reportError",
        listOf("Ljava/lang/String;", "Ljava/lang/Throwable;"),
    ),
    MethodSignature("sendEventsBuffer", emptyList()),
    MethodSignature("setDataSendingEnabled", listOf("Z")),
)

private val myTrackerRequirements = setOf(
    MethodSignature(
        "initTracker",
        listOf("Ljava/lang/String;", "Landroid/app/Application;"),
    ),
    MethodSignature("flush", emptyList()),
    MethodSignature("trackEvent", listOf("Ljava/lang/String;")),
    MethodSignature(
        "trackMiniAppEvent",
        listOf("Lcom/my/tracker/miniapps/MiniAppEvent;"),
    ),
    MethodSignature(
        "trackLoginEvent",
        listOf(
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map;",
        ),
    ),
)

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
        val classHierarchy = mutableMapOf<String, String?>()
        val reporterCandidates = mutableMapOf<String, Boolean>()
        val patchedFacadeCounts = mutableMapOf<String, Int>()
        var patchedMyTrackerMethods = 0

        classDefForEach { classDef ->
            classHierarchy[classDef.type] = classDef.superclass

            val facadeRequirements = appMetricaFacadeRequirements[classDef.type]
            if (facadeRequirements != null) {
                val foundSignatures = classDef.methods.mapTo(mutableSetOf()) { it.signature() }
                val missingSignatures = facadeRequirements - foundSignatures
                if (missingSignatures.isNotEmpty()) {
                    throw PatchException(
                        "AppMetrica facade ${classDef.type} is missing " +
                            "${missingSignatures.size} required methods",
                    )
                }

                val methods = mutableClassDefBy(classDef).methods
                    .filter(Method::isPublicVoidImplementation)
                if (methods.isEmpty()) {
                    throw PatchException(
                        "AppMetrica facade ${classDef.type} has no public void methods",
                    )
                }
                methods.forEach(MutableMethod::disable)
                patchedFacadeCounts[classDef.type] = methods.size
            }

            if (classDef.type == MY_TRACKER_API_CLASS) {
                val foundSignatures = classDef.methods.mapTo(mutableSetOf()) { it.signature() }
                val missingSignatures = myTrackerRequirements - foundSignatures
                if (missingSignatures.isNotEmpty()) {
                    throw PatchException(
                        "MyTracker is missing ${missingSignatures.size} required methods",
                    )
                }

                val methods = mutableClassDefBy(classDef).methods
                    .filter(Method::isPublicVoidImplementation)
                if (methods.isEmpty()) {
                    throw PatchException("MyTracker has no public void methods")
                }
                methods.forEach(MutableMethod::disable)
                patchedMyTrackerMethods = methods.size
            }

            if (
                classDef.type.startsWith(APP_METRICA_IMPL_PREFIX) &&
                classDef.methods
                    .filter { it.implementation != null }
                    .mapTo(mutableSetOf()) { it.signature() }
                    .containsAll(appMetricaReporterRequirements)
            ) {
                reporterCandidates[classDef.type] =
                    AccessFlags.ABSTRACT.isSet(classDef.accessFlags)
            }
        }

        val missingFacades = appMetricaFacadeRequirements.keys - patchedFacadeCounts.keys
        if (missingFacades.isNotEmpty()) {
            throw PatchException("Missing ${missingFacades.size} AppMetrica facade classes")
        }
        if (patchedMyTrackerMethods == 0) {
            throw PatchException("MyTracker API class was not found")
        }
        if (reporterCandidates.size != 4) {
            throw PatchException(
                "Expected four AppMetrica reporter implementations, " +
                    "found ${reporterCandidates.size}",
            )
        }
        val abstractReporterCandidates = reporterCandidates
            .filterValues { isAbstract -> isAbstract }
            .keys
        if (abstractReporterCandidates.size != 1) {
            throw PatchException(
                "Expected one abstract AppMetrica reporter base, " +
                    "found ${abstractReporterCandidates.size}",
            )
        }

        val reporterTypes = reporterCandidates.keys.toMutableSet()
        while (true) {
            val descendants = classHierarchy
                .filterValues { it in reporterTypes }
                .keys - reporterTypes
            if (!reporterTypes.addAll(descendants)) break
        }
        val abstractReporterBase = abstractReporterCandidates.single()
        fun isDescendantOf(type: String, ancestor: String): Boolean {
            var currentType: String? = type
            val visitedTypes = mutableSetOf<String>()
            while (currentType != null && visitedTypes.add(currentType)) {
                currentType = classHierarchy[currentType]
                if (currentType == ancestor) return true
            }
            return false
        }

        val inheritedReporterTypes = reporterTypes - reporterCandidates.keys
        val abstractBaseDescendants = inheritedReporterTypes.filter { reporterType ->
            isDescendantOf(reporterType, abstractReporterBase)
        }
        val reporterRootsWithDescendants = reporterCandidates.keys.count { reporterRoot ->
            inheritedReporterTypes.any { reporterType ->
                isDescendantOf(reporterType, reporterRoot)
            }
        }
        if (
            inheritedReporterTypes.size != 3 ||
            abstractBaseDescendants.size != 2 ||
            reporterRootsWithDescendants != 2 ||
            reporterTypes.size != 7
        ) {
            throw PatchException(
                "Unexpected AppMetrica reporter hierarchy: " +
                    "${inheritedReporterTypes.size} inherited reporters, " +
                    "${abstractBaseDescendants.size} abstract-base descendants, " +
                    "$reporterRootsWithDescendants roots with descendants, and " +
                    "${reporterTypes.size} covered classes",
            )
        }

        var patchedReporterMethods = 0
        reporterTypes.forEach { reporterType ->
            val methods = mutableClassDefBy(reporterType).methods
                .filter(Method::isPublicVoidImplementation)
            methods.forEach(MutableMethod::disable)
            patchedReporterMethods += methods.size
        }
        if (patchedReporterMethods == 0) {
            throw PatchException("AppMetrica reporter methods were not found")
        }

        val crashlyticsMethods = FirebaseCrashlyticsCollectionFingerprint
            .matchAll(0..1)
            .map { it.method }
        crashlyticsMethods.forEach(MutableMethod::disable)

        val performanceMethods = FirebasePerformanceCollectionFingerprint
            .matchAll(0..1)
            .map { it.method }
        performanceMethods.forEach(MutableMethod::disable)

        logger.info(
            "AppMetrica: patched ${patchedFacadeCounts.values.sum()} facade and " +
                "$patchedReporterMethods reporter methods across " +
                "${reporterTypes.size} reporter classes " +
                "(${reporterCandidates.size} contract implementations)",
        )
        logger.info("MyTracker: patched $patchedMyTrackerMethods public void methods")
        logger.info(
            "Firebase collection controls: patched " +
                "${crashlyticsMethods.size + performanceMethods.size} methods",
        )
    }
}
