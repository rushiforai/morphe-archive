// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/all/analytics/DisableAnalyticsDependency.kt.
package app.privacy.patches.analytics.jl4ctuk

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.shared.*
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import org.w3c.dom.Element
import java.util.logging.Logger

private val logger = Logger.getLogger("DisableAnalytics")

/**
 * Every app in this bundle that this dependency has been wired into via `dependsOn`.
 *
 * `dependsOn` only orders execution between patches that are independently enabled -
 * confirmed by direct testing (2026-10-09): a `dependsOn`-only wiring on a `default =
 * false`, non-package-gated patch like this one is silently skipped in a real default
 * build ("Skipping disabled: Disable analytics libraries (default)"), even though every
 * one of its dependents is itself `default = true`. Without its own real package gate
 * this patch can never be `default = true` either - morphe-patcher's framework forces
 * any `default = true` patch with no (or no package-scoped) `Compatibility` back to
 * `false` (see BypassRootBeerPatch.kt for the same constraint and the same fix: real,
 * version-unrestricted `Compatibility` entries). Declaring the gate here, rather than
 * leaving this "shared, invisible" and relying on being `dependsOn`-ed, is what actually
 * makes it run in the apps that need it instead of silently never executing.
 */
internal val DISABLE_ANALYTICS_COMPATIBILITY = arrayOf(
    Compatibility(packageName = "ru.ozon.fintech.finance", name = "Ozon Bank"),
    Compatibility(packageName = "com.vk.vkvideo", name = "VK Video"),
    Compatibility(packageName = "ru.rutube.app", name = "RuTube"),
    Compatibility(packageName = "ru.vk.store", name = "RuStore"),
    Compatibility(
        packageName = "ru.yandex.music",
        name = "Yandex Music",
        targets = listOf(AppTarget(version = "2026.09.5 #167.1rur", versionCode = 24026502)),
    ),
    Compatibility(
        packageName = "ru.yandex.yandexmaps",
        name = "Yandex Maps",
        targets = listOf(AppTarget(version = "31.1.3", versionCode = 739706910)),
    ),
    Compatibility(
        packageName = "ru.yandex.taxi",
        name = "Yandex Go",
        targets = listOf(AppTarget(version = "5.98.0", versionCode = 30128554)),
    ),
    Compatibility(
        packageName = "ru.yandex.rasp",
        name = "Yandex Rasp",
        targets = listOf(AppTarget(version = "3.73.0", versionCode = 35000063)),
    ),
    Compatibility(
        packageName = "ru.yandex.weatherplugin",
        name = "Yandex Weather",
        targets = listOf(AppTarget(version = "26.10.10", versionCode = 260100010)),
    ),
    Compatibility(
        packageName = "com.yandex.bank",
        name = "Yandex Pay",
        targets = listOf(AppTarget(version = "0.243.0", versionCode = 11920)),
    ),
    Compatibility(
        packageName = "ru.sberbankmobile",
        name = "Sberbank",
        targets = listOf(AppTarget(version = "17.13.0", versionCode = 2026062316)),
    ),
    Compatibility(
        packageName = "ru.alfabank.mobile.android",
        name = "Alfa-Bank",
        targets = listOf(AppTarget(version = "12.60.07", versionCode = 2042600700)),
    ),
    Compatibility(
        packageName = "ru.vtb24.mobilebanking.android",
        name = "VTB Online",
        targets = listOf(AppTarget(version = "20.18.1.3", versionCode = 2090141585)),
    ),
    Compatibility(
        packageName = "ru.nspk.mirpay",
        name = "Mir Pay",
        targets = listOf(AppTarget(version = "1.64.5.350", versionCode = 405)),
    ),
    Compatibility(
        packageName = "ru.dublgis.dgismobile",
        name = "2GIS",
        targets = listOf(AppTarget(version = "7.29.1.632.4", versionCode = 282010632)),
    ),
    Compatibility(
        packageName = "com.zvooq.openplay",
        name = "Zvuk",
        targets = listOf(AppTarget(version = "4.117.0rs", versionCode = 511700129)),
    ),
    Compatibility(
        packageName = "ru.oneme.app",
        name = "MAX",
        targets = listOf(AppTarget(version = "26.35.0", versionCode = 6861)),
    ),
    Compatibility(
        packageName = "ru.rostel",
        name = "Gosuslugi",
        targets = listOf(AppTarget(version = "27.1.0.9876-rustore", versionCode = 9876)),
    ),
    Compatibility(
        packageName = "ru.ozon.app.android",
        name = "Ozon",
        targets = listOf(AppTarget(version = "19.38.0", versionCode = 2721)),
    ),
    Compatibility(
        packageName = "com.wildberries.ru",
        name = "Wildberries",
        targets = listOf(AppTarget(version = "7.8.3002-rustore", versionCode = 61085)),
    ),
    Compatibility(
        packageName = "com.avito.android",
        name = "Avito",
        targets = listOf(AppTarget(version = "234.5", versionCode = 3561)),
    ),
    Compatibility(
        packageName = "ru.aliexpress.buyer",
        name = "AliExpress",
        targets = listOf(AppTarget(version = "8.89.1.3597464", versionCode = 844)),
    ),
    Compatibility(
        packageName = "ru.perekrestok.app",
        name = "Perekrestok",
        targets = listOf(AppTarget(version = "3.99.0", versionCode = 4128)),
    ),
    Compatibility(
        packageName = "com.punicapp.whoosh",
        name = "Whoosh",
        targets = listOf(AppTarget(version = "4.0.0", versionCode = 418060)),
    ),
    Compatibility(
        packageName = "com.idamob.tinkoff.android",
        name = "T-Bank",
        targets = listOf(AppTarget(version = "8.4.2", versionCode = 13282)),
    ),
    Compatibility(
        packageName = "ru.yandex.mail",
        name = "Yandex Mail",
        targets = listOf(AppTarget(version = "9.30.1", versionCode = 125935)),
    ),
    Compatibility(
        packageName = "ru.beeline.services",
        name = "Beeline",
        targets = listOf(AppTarget(version = "5.48.5", versionCode = 4391)),
    ),
    Compatibility(
        packageName = "ru.mts.mymts",
        name = "MTS",
        targets = listOf(AppTarget(version = "6.77", versionCode = 150770030)),
    ),
    Compatibility(
        packageName = "ru.megafon.mlk",
        name = "MegaFon",
        targets = listOf(AppTarget(version = "4.69.0", versionCode = 42400548)),
    ),
)

private const val APP_METRICA_API_CLASS = "Lio/appmetrica/analytics/AppMetrica;"
private const val APP_METRICA_CONFIG_CLASS = "Lio/appmetrica/analytics/AppMetricaConfig;"
private const val APP_METRICA_LIBRARY_ADAPTER_CLASS =
    "Lio/appmetrica/analytics/AppMetricaLibraryAdapter;"
private const val APP_METRICA_MODULES_FACADE_CLASS =
    "Lio/appmetrica/analytics/ModulesFacade;"
private const val APP_METRICA_IMPL_PREFIX = "Lio/appmetrica/analytics/impl/"
private const val MY_TRACKER_API_CLASS = "Lcom/my/tracker/MyTracker;"

// Legacy (pre-rename) AppMetrica SDK entry points. Folded in from the old standalone
// `DisableAppMetricaPatch` (xob0t/morphe-patches), which targeted only this namespace and
// had gone stale/0-matches on every app observed to have migrated to the io.appmetrica.*
// namespace above - the two namespaces are different major SDK versions of the same
// product and apps bundle one or the other, never both, so folding both checks into this
// one always-wired dependency (rather than keeping a second, separately-gated patch that
// nothing depended on) is what actually keeps old-namespace apps covered going forward.
private const val LEGACY_YANDEX_METRICA_IMPL_CLASS = "Lcom/yandex/metrica/impl/ob/U1;"
private const val LEGACY_YANDEX_METRICA_IMPL_CALLBACK_CLASS = "Lcom/yandex/metrica/impl/ob/U1\$g;"
private val legacyYandexMetricaFacadeClasses = listOf(
    "Lcom/yandex/metrica/YandexMetrica;",
    "Lcom/yandex/metrica/AppMetricaJsInterface;",
    "Lcom/yandex/metrica/AppMetricaInitializerJsInterface;",
)

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

private fun MutableMethod.injectBeforeFinalReturnVoid(instructions: String) {
    val methodInstructions = implementation?.instructions
        ?: throw PatchException("${name} has no implementation")
    if (methodInstructions.lastOrNull()?.opcode?.name?.startsWith("return-") != true) {
        throw PatchException(
            "${name} ends with ${methodInstructions.lastOrNull()?.opcode?.name ?: "no instruction"}; " +
                "refusing unsafe instrumentation",
        )
    }
    addInstructions(methodInstructions.size - 1, instructions)
}

private fun MutableMethod.forceAppMetricaActivationDataSendingOff() {
    if (signature().parameters != listOf("Landroid/content/Context;", APP_METRICA_CONFIG_CLASS)) {
        return
    }
    addInstructions(
        0,
        """
            sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
            iput-object v0, p1, $APP_METRICA_CONFIG_CLASS->dataSendingEnabled:Ljava/lang/Boolean;
        """,
    )
}

private fun MutableMethod.disableAppMetricaDataSending() {
    if (signature() != MethodSignature("setDataSendingEnabled", listOf("Z"))) {
        throw PatchException("Unexpected AppMetrica data-sending setter signature")
    }
    addInstructions(0, "const/4 p0, 0x0")
}

private fun MutableMethod.disableAppMetricaDataSendingAfterActivation() {
    injectBeforeFinalReturnVoid(
        """
            const/4 p0, 0x0
            invoke-static {p0}, $APP_METRICA_API_CLASS->setDataSendingEnabled(Z)V
        """,
    )
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

// Only the core 3 signatures that are present in every observed MyTracker SDK build are required.
// `trackMiniAppEvent`/`trackLoginEvent` exist only in some app-specific MyTracker SDK variants
// (confirmed present e.g. in VK's bundled build) and are absent from the more common minimal build
// (confirmed via live decompile of MAX 26.35.0 and Sberbank 17.13.0, both missing exactly these 2
// methods) — requiring them here caused a false-negative PatchException on those apps even though
// the class and its core API matched. Any public void method actually present (including these two,
// when they exist) is still disabled below; this set only gates "is this really the MyTracker API
// class" validation, not what gets disabled.
private val myTrackerRequirements = setOf(
    MethodSignature(
        "initTracker",
        listOf("Ljava/lang/String;", "Landroid/app/Application;"),
    ),
    MethodSignature("flush", emptyList()),
    MethodSignature("trackEvent", listOf("Ljava/lang/String;")),
)

@Suppress("unused")
val disableAnalyticsManifestPatch = resourcePatch(
    name = "Disable analytics manifest components",
    description = "Disables analytics and tracking components and metadata in AndroidManifest.xml.",
    default = true,
) {
    compatibleWith(*DISABLE_ANALYTICS_COMPATIBILITY)

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

@Suppress("unused")
val disableAnalyticsDependency = bytecodePatch(
    name = "Disable analytics libraries",
    description = "Disables runtime analytics tracking calls and initializers (AppMetrica, MyTracker, Firebase).",
    default = true,
) {
    compatibleWith(*DISABLE_ANALYTICS_COMPATIBILITY)

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
                methods.forEach { method ->
                    when {
                        classDef.type == APP_METRICA_API_CLASS && method.name == "activate" -> {
                            method.forceAppMetricaActivationDataSendingOff()
                            method.disableAppMetricaDataSendingAfterActivation()
                        }

                        classDef.type == APP_METRICA_API_CLASS &&
                            method.signature() == MethodSignature("setDataSendingEnabled", listOf("Z")) -> {
                            method.disableAppMetricaDataSending()
                        }

                        else -> method.disable()
                    }
                }
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

        // Apps bundle AppMetrica, MyTracker, both, or neither — confirmed by live decompile that
        // MAX and Sberbank ship MyTracker with zero AppMetrica classes present at all. Treat a
        // tracker's complete absence as a normal no-op (mirrors how the other universal patches in
        // this bundle log "no local call sites were found" instead of failing); only throw when a
        // tracker's marker class (or candidate reporter class) IS present but doesn't match the
        // expected shape, since blindly disabling methods on a wrong/unexpected class is unsafe.
        val appMetricaFacadesFound = patchedFacadeCounts.isNotEmpty()
        if (appMetricaFacadesFound) {
            val missingFacades = appMetricaFacadeRequirements.keys - patchedFacadeCounts.keys
            if (missingFacades.isNotEmpty()) {
                logger.info(
                    "AppMetrica: found ${patchedFacadeCounts.size}/" +
                        "${appMetricaFacadeRequirements.size} facade classes, proceeding without " +
                        "the rest (likely stripped by R8 as unused)",
                )
            }
        } else {
            logger.info("AppMetrica facade classes: not found")
        }
        if (patchedMyTrackerMethods == 0) {
            logger.info("MyTracker: not found")
        }

        var patchedReporterMethods = 0
        var reporterTypeCount = 0
        if (reporterCandidates.isEmpty()) {
            logger.info("AppMetrica reporter implementations: not found")
        } else {
            val reporterTypes = reporterCandidates.keys.toMutableSet()
            while (true) {
                val descendants = classHierarchy
                    .filterValues { it in reporterTypes }
                    .keys - reporterTypes
                if (!reporterTypes.addAll(descendants)) break
            }
            // AppMetrica's R8 output is version-dependent: releases have shipped with
            // different numbers of reporter roots and synthetic subclasses. The old
            // implementation required exactly 4 roots / 7 covered classes, which made a
            // valid newer Yandex Music APK fail with "found 7" before any method was patched.
            // Candidate classes are already constrained by the full reporter signature set;
            // patch those candidates and their direct/inherited descendants, while retaining
            // the non-empty and method-level checks below as the safety boundary.
            logger.info(
                "AppMetrica reporter hierarchy: ${reporterCandidates.size} matching roots, " +
                    "${reporterTypes.size} covered classes",
            )

            reporterTypes.forEach { reporterType ->
                val methods = mutableClassDefBy(reporterType).methods
                    .filter(Method::isPublicVoidImplementation)
                methods.forEach(MutableMethod::disable)
                patchedReporterMethods += methods.size
            }
            if (patchedReporterMethods == 0) {
                throw PatchException("AppMetrica reporter methods were not found")
            }
            reporterTypeCount = reporterTypes.size
        }

        if (!appMetricaFacadesFound && patchedMyTrackerMethods == 0 && reporterCandidates.isEmpty()) {
            // Contradicts the no-op design above: an app with neither tracker still has Firebase
            // collection controls to disable below, and this patch is opt-in by default anyway —
            // hard-failing here only hurt a user who explicitly enabled it on a tracker-free app
            // (confirmed live on Sberbank/T-Bank/Ozon/Wildberries, 2026-10-08 deep-verify pass).
            logger.info("Neither AppMetrica nor MyTracker was found in this app — nothing to disable there")
        }

        val crashlyticsMethods = FirebaseCrashlyticsCollectionFingerprint
            .matchAll(0..1)
            .map { it.method }
        crashlyticsMethods.forEach(MutableMethod::disable)

        // Closes the second, boxed-Boolean public overload of the same setter (see
        // Fingerprints.kt) - leaving it live would let app/library code re-enable
        // collection without ever calling the (Z) overload disabled above.
        val crashlyticsBoxedMethods = FirebaseCrashlyticsCollectionBoxedFingerprint
            .matchAll(0..1)
            .map { it.method }
        crashlyticsBoxedMethods.forEach(MutableMethod::disable)

        // Closes the documented sendUnsentReports() bypass (see Fingerprints.kt) of the
        // collection-enabled gate set above and forced false in the manifest patch.
        val crashlyticsSendUnsentReportsMethods = FirebaseCrashlyticsSendUnsentReportsFingerprint
            .matchAll(0..1)
            .map { it.method }
        crashlyticsSendUnsentReportsMethods.forEach(MutableMethod::disable)

        val performanceMethods = FirebasePerformanceCollectionFingerprint
            .matchAll(0..1)
            .map { it.method }
        performanceMethods.forEach(MutableMethod::disable)

        var patchedLegacyMetricaMethods = 0

        legacyYandexMetricaFacadeClasses.forEach { classType ->
            mutableClassDefByOrNull(classType)?.methods
                ?.filter { method ->
                    method.name != "<init>" &&
                        method.returnType == "V" &&
                        method.implementation != null
                }
                ?.forEach { method ->
                    method.disable()
                    patchedLegacyMetricaMethods++
                }
        }

        mutableClassDefByOrNull(LEGACY_YANDEX_METRICA_IMPL_CLASS)?.methods?.forEach { method ->
            when {
                method.name in setOf("reportData", "sendCrash") &&
                    method.returnType == "V" &&
                    method.implementation != null -> {
                    method.disable()
                    patchedLegacyMetricaMethods++
                }

                method.name in setOf("queuePauseUserSession", "queueReport", "queueResumeUserSession") &&
                    method.returnType == "Ljava/util/concurrent/Future;" &&
                    method.implementation != null -> {
                    method.addInstructions(
                        0,
                        """
                            const/4 p0, 0x0
                            invoke-static {p0}, Ljava/util/concurrent/CompletableFuture;->completedFuture(Ljava/lang/Object;)Ljava/util/concurrent/CompletableFuture;
                            move-result-object p0
                            return-object p0
                        """,
                    )
                    patchedLegacyMetricaMethods++
                }
            }
        }

        mutableClassDefByOrNull(LEGACY_YANDEX_METRICA_IMPL_CALLBACK_CLASS)?.methods
            ?.filter { method ->
                method.name == "call" &&
                    method.returnType == "Ljava/lang/Void;" &&
                    method.implementation != null
            }
            ?.forEach { method ->
                method.addInstructions(
                    0,
                    """
                        const/4 p0, 0x0
                        return-object p0
                    """,
                )
                patchedLegacyMetricaMethods++
            }

        logger.info(
            "AppMetrica: patched ${patchedFacadeCounts.values.sum()} facade and " +
                "$patchedReporterMethods reporter methods across " +
                "$reporterTypeCount reporter classes " +
                "(${reporterCandidates.size} contract implementations)",
        )
        logger.info("MyTracker: patched $patchedMyTrackerMethods public void methods")
        logger.info("Legacy Yandex Metrica (pre-rename namespace): patched $patchedLegacyMetricaMethods SDK entry point methods")
        logger.info(
            "Firebase collection controls: patched " +
                "${crashlyticsMethods.size + performanceMethods.size} methods",
        )
    }
}
