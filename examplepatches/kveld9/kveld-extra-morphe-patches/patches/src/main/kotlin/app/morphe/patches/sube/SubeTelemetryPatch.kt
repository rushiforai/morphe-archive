package app.morphe.patches.sube

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.Constants.COMPATIBILITY_SUBE
import app.morphe.patches.shared.replaceWithReturnVoid
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_XML_NAMESPACE = "http://schemas.android.com/apk/res/android"

private val TRACKING_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
)

// FirebaseInitProvider MUST remain enabled (omitted from TELEMETRY_PROVIDERS).
// Disabling FirebaseInitProvider causes a fatal startup crash during MainActivity initialization:
//   java.lang.RuntimeException: Unable to start activity ComponentInfo{com.sube.app/com.sube.app.MainActivity}:
//   java.lang.IllegalStateException: Default FirebaseApp is not initialized in this process com.sube.app. Make sure to call FirebaseApp.initializeApp(Context) first.
//   Caused by: FirebaseApp.getInstance (W6.e.e FirebaseApp.java:56) called from FirebaseCrashlytics (m7.f.a FirebaseCrashlytics.java:1) during MainActivity startup.
// Telemetry suppression is achieved without disabling FirebaseInitProvider via declarative opt-out metadata flags,
// disabling Google AppMeasurement and DataTransport background services/receivers, and bytecode entrypoint stubs.
// Note: FirebasePerfProvider is omitted because it is not present in SUBE DEX/manifest (classes*.dex contains 0 references).
private val TELEMETRY_PROVIDERS = setOf(
    "com.google.android.gms.measurement.AppMeasurementContentProvider",
)

// Note on SessionLifecycleService: stays disabled safely because SessionLifecycleServiceBinder (A8.S.a)
// wraps context.bindService() in try-catch SecurityException and verifies bound status (if (!bound) unbindService)
// with catch IllegalArgumentException, failing gracefully as a no-op when the service is disabled.
private val TELEMETRY_SERVICES = setOf(
    "com.google.android.gms.measurement.AppMeasurementService",
    "com.google.android.gms.measurement.AppMeasurementJobService",
    "com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService",
    "com.google.android.datatransport.runtime.backends.TransportBackendDiscovery",
    "com.google.firebase.sessions.SessionLifecycleService",
)

private val TELEMETRY_RECEIVERS = setOf(
    "com.google.android.gms.measurement.AppMeasurementReceiver",
    "com.google.android.gms.measurement.AppMeasurementInstallReferrerReceiver",
    "com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver",
)

private val TELEMETRY_METADATA_FLAGS = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_performance_collection_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
    "google_analytics_automatic_screen_reporting_enabled" to "false",
)

private data class SdkMethodRule(
    val prefix: String,
    val label: String,
    val targetMethods: Set<String>,
)

private val SDK_RULES = listOf(
    SdkMethodRule(
        prefix = "Lcom/google/firebase/analytics",
        label = "Firebase Analytics",
        targetMethods = setOf("logEvent", "setUserProperty", "setConditionalUserProperty"),
    ),
    SdkMethodRule(
        prefix = "Lcom/google/firebase/crashlytics",
        label = "Firebase Crashlytics",
        targetMethods = setOf("recordException", "log", "setCustomKey", "setCustomKeys", "setUserId"),
    ),
    SdkMethodRule(
        prefix = "Lcom/google/android/gms/measurement",
        label = "Google Measurement",
        targetMethods = setOf("logEvent", "logEventInternal", "setUserProperty", "setUserPropertyInternal"),
    ),
)

private fun getAttributeValue(element: Element, attributeName: String): String {
    val value = element.getAttribute("android:$attributeName")
    if (value.isNotBlank()) return value
    val valueNs = element.getAttributeNS(ANDROID_XML_NAMESPACE, attributeName)
    if (valueNs.isNotBlank()) return valueNs
    return element.getAttribute(attributeName)
}

private fun disableElement(element: Element): Boolean {
    val current = getAttributeValue(element, "enabled")
    if (current.equals("false", ignoreCase = true)) return false
    element.removeAttribute("android:enabled")
    element.setAttributeNS(ANDROID_XML_NAMESPACE, "android:enabled", "false")
    return true
}

private fun stripPermissions(doc: Document, permissionsToStrip: Set<String>): List<String> {
    val removed = mutableListOf<String>()
    val permissionTags = listOf("uses-permission", "uses-permission-sdk-23")
    for (tag in permissionTags) {
        val nodes = doc.getElementsByTagName(tag)
        val toRemove = mutableListOf<Pair<Element, String>>()
        for (i in 0 until nodes.length) {
            val element = nodes.item(i) as? Element ?: continue
            val name = getAttributeValue(element, "name")
            if (name in permissionsToStrip) {
                toRemove.add(element to name)
            }
        }
        for ((element, name) in toRemove) {
            element.parentNode?.removeChild(element)
            removed.add(name)
        }
    }
    return removed
}

private fun disableComponents(doc: Document, tag: String, targetNames: Set<String>): Int {
    var disabledCount = 0
    val nodes = doc.getElementsByTagName(tag)
    for (i in 0 until nodes.length) {
        val element = nodes.item(i) as? Element ?: continue
        val name = getAttributeValue(element, "name")
        if (name in targetNames) {
            if (disableElement(element)) {
                disabledCount++
            }
        }
    }
    return disabledCount
}

private fun injectMetadataFlags(doc: Document): Int {
    val appNodes = doc.getElementsByTagName("application")
    if (appNodes.length == 0) return 0
    val appElem = appNodes.item(0) as? Element ?: return 0
    var injected = 0

    val existingMetadata = mutableMapOf<String, Element>()
    val metaNodes = appElem.getElementsByTagName("meta-data")
    for (i in 0 until metaNodes.length) {
        val meta = metaNodes.item(i) as? Element ?: continue
        val name = getAttributeValue(meta, "name")
        if (name.isNotBlank()) {
            existingMetadata[name] = meta
        }
    }

    for ((flagName, flagValue) in TELEMETRY_METADATA_FLAGS) {
        val existing = existingMetadata[flagName]
        if (existing != null) {
            val currentVal = getAttributeValue(existing, "value")
            if (currentVal != flagValue) {
                existing.removeAttribute("android:value")
                existing.setAttributeNS(ANDROID_XML_NAMESPACE, "android:value", flagValue)
                injected++
            }
        } else {
            val newMeta = doc.createElement("meta-data")
            newMeta.setAttributeNS(ANDROID_XML_NAMESPACE, "android:name", flagName)
            newMeta.setAttributeNS(ANDROID_XML_NAMESPACE, "android:value", flagValue)
            appElem.appendChild(newMeta)
            injected++
        }
    }
    return injected
}

@Suppress("unused")
val subeTelemetryManifestPatch = resourcePatch(
    name = "SUBE Telemetry Manifest Purge",
    description = "Strips advertising permissions, disables measurement services, providers, and install receivers, and injects opt-out metadata flags in AndroidManifest.xml.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SUBE)

    execute {
        val manifestFile = get("AndroidManifest.xml")
        if (!manifestFile.exists()) {
            println("[SUBE Telemetry Manifest Purge] Skipped: AndroidManifest.xml not found.")
            return@execute
        }

        var removedPerms: List<String> = emptyList()
        var disabledProviders = 0
        var disabledServices = 0
        var disabledReceivers = 0
        var injectedFlags = 0

        document(manifestFile.absolutePath).use { doc ->
            removedPerms = stripPermissions(doc, TRACKING_PERMISSIONS)
            disabledProviders = disableComponents(doc, "provider", TELEMETRY_PROVIDERS)
            disabledServices = disableComponents(doc, "service", TELEMETRY_SERVICES)
            disabledReceivers = disableComponents(doc, "receiver", TELEMETRY_RECEIVERS)
            injectedFlags = injectMetadataFlags(doc)
        }

        val summary = "Stripped ${removedPerms.size} permission(s), disabled $disabledProviders provider(s), $disabledServices service(s), $disabledReceivers receiver(s), injected $injectedFlags metadata flag(s)."
        println("[SUBE Telemetry Manifest Purge] $summary")
    }
}

@Suppress("unused")
val subeTelemetryPatch = bytecodePatch(
    name = "Block Telemetry & Trackers",
    description = "Neutralizes Google AppMeasurement, Firebase Analytics, and Firebase Crashlytics event dispatchers at bytecode entrypoints.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SUBE)
    dependsOn(subeTelemetryManifestPatch)

    execute {
        var totalHooked = 0
        var touchedClasses = 0
        val hookCounts = mutableMapOf<String, Int>()

        classDefForEach { classDef ->
            val matchingRule = SDK_RULES.firstOrNull { classDef.type.startsWith(it.prefix) }
                ?: return@classDefForEach

            val blockableMethods = classDef.methods.filter { method ->
                method.implementation != null &&
                    method.returnType == "V" &&
                    method.name in matchingRule.targetMethods &&
                    method.name != "<init>" &&
                    method.name != "<clinit>"
            }

            if (blockableMethods.isEmpty()) return@classDefForEach

            val mutableClass = mutableClassDefBy(classDef)
            var classHooked = 0

            for (targetMethod in blockableMethods) {
                val mutableMethod = mutableClass.methods.firstOrNull {
                    it.name == targetMethod.name &&
                        it.returnType == targetMethod.returnType &&
                        it.parameters.map { p -> p.type } == targetMethod.parameters.map { p -> p.type }
                } ?: continue

                mutableMethod.replaceWithReturnVoid()
                hookCounts[matchingRule.label] = (hookCounts[matchingRule.label] ?: 0) + 1
                classHooked++
                totalHooked++
            }

            if (classHooked > 0) {
                touchedClasses++
            }
        }

        if (totalHooked == 0) {
            error("[Block Telemetry & Trackers] No telemetry dispatch methods found - failing closed.")
        }

        val summary = hookCounts.entries.joinToString(", ") { "${it.key}: ${it.value}" }
        println("[Block Telemetry & Trackers] Applied $totalHooked hook(s) across $touchedClasses class(es) ($summary).")
    }
}
