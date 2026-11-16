package app.morphe.patches.twitter

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.ANDROID_XML_NAMESPACE
import app.morphe.patches.shared.Constants
import app.morphe.patches.shared.childrenNamed
import app.morphe.patches.shared.disableComponentsByName
import app.morphe.patches.shared.removeChildren
import app.morphe.patches.shared.replaceWithReturnVoid
import app.morphe.patches.shared.removeComponentDiscoveryRegistrarsWhere
import app.morphe.patches.shared.setApplicationMetaData
import app.morphe.patches.shared.stripPermissionsWhere
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private val twitterTelemetryResourcePatch = resourcePatch(
    name = "Block Telemetry & Trackers (Setup)",
    description = "Strips tracking/advertising permissions, disables analytics services and receivers, purges Sentry initialization metadata, and injects opt-out metadata in AndroidManifest.xml.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY_TWITTER)

    execute {
        val manifestFile = get("AndroidManifest.xml")
        if (!manifestFile.exists()) {
            println("[Block Telemetry & Trackers] AndroidManifest.xml not found - skipping manifest purge.")
            return@execute
        }

        val blockedPermissions = setOf(
            "com.google.android.gms.permission.AD_ID",
            "android.permission.ACCESS_ADSERVICES_AD_ID",
            "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
            "android.permission.ACCESS_ADSERVICES_TOPICS",
            "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
        )

        val blockedComponents = setOf(
            // Services
            "com.google.android.gms.measurement.AppMeasurementService",
            "com.google.android.gms.measurement.AppMeasurementJobService",
            "com.google.android.datatransport.runtime.backends.TransportBackendDiscovery",
            "com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService",

            // Receivers
            "com.google.android.gms.measurement.AppMeasurementReceiver",
            "com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver",
            "com.twitter.analytics.tracking.InstallationReferrer\$OemIntentReceiver",

            // Braze marketing components (BrazePushReceiver is preserved)
            "com.braze.BrazeFlushPushDeliveryReceiver",
            "com.braze.push.NotificationTrampolineActivity",
            "com.braze.ui.activities.ContentCardsActivity",
            "com.braze.ui.BrazeWebViewActivity",
        )

        val optOutMetadata = listOf(
            "firebase_analytics_collection_enabled" to "false",
            "firebase_analytics_collection_deactivated" to "true",
            "firebase_crashlytics_collection_enabled" to "false",
            "firebase_performance_collection_enabled" to "false",
            "firebase_performance_collection_deactivated" to "true",
            "google_analytics_adid_collection_enabled" to "false",
            "google_analytics_default_allow_ad_personalization_signals" to "false",
        )

        val sentryMetadataNames = setOf(
            "io.sentry.dsn",
            "io.sentry.send-default-pii",
        )

        var removedPermissions = 0
        var disabledComponents = 0
        var removedRegistrars = 0
        var removedSentryMetadata = 0
        var injectedMetadata = 0

        document(manifestFile.absolutePath).use { doc ->
            val application = doc.documentElement.getElementsByTagName("application").item(0) as? org.w3c.dom.Element

            // 1. Remove advertising and tracking permissions
            removedPermissions = doc.documentElement.stripPermissionsWhere { it in blockedPermissions }.size

            if (application != null) {
                // 2. Disable verified measurement and tracking components
                disabledComponents = application.disableComponentsByName(*blockedComponents.toTypedArray())

                // 3. Remove discovery meta-data registrars (excluding MLKit, push messaging, and Crashlytics)
                removedRegistrars = application.removeComponentDiscoveryRegistrarsWhere { name ->
                    val matchesKeyword = listOf(
                        "analytics",
                        "measurement",
                        "crashlytics",
                        "perf",
                        "remoteconfig",
                        "sessions",
                        "abt",
                    ).any { name.contains(it, ignoreCase = true) }
                    val isExcluded = name.contains("mlkit", ignoreCase = true) ||
                        name.contains("messaging", ignoreCase = true) ||
                        name.contains("crashlytics", ignoreCase = true)
                    matchesKeyword && !isExcluded
                }

                // 4. Remove Sentry auto-initialization metadata
                val sentryMetaElements = application.childrenNamed("meta-data").filter { meta ->
                    val name = meta.getAttribute("android:name").ifBlank { meta.getAttributeNS(ANDROID_XML_NAMESPACE, "name") }
                    name in sentryMetadataNames
                }
                application.removeChildren(sentryMetaElements)
                removedSentryMetadata = sentryMetaElements.size

                // 5. Inject declarative SDK opt-out metadata flags
                optOutMetadata.forEach { (name, value) ->
                    application.setApplicationMetaData(name, value)
                    injectedMetadata++
                }
            }
        }

        println("[Block Telemetry & Trackers] Stripped $removedPermissions permissions, disabled $disabledComponents tracking components, removed $removedRegistrars discovery registrars, removed $removedSentryMetadata Sentry metadata entries, and injected $injectedMetadata opt-out flags in AndroidManifest.xml.")
    }
}

context(_: BytecodePatchContext)
private fun hookVoidMethod(
    fingerprint: Fingerprint,
    hookedMethods: MutableList<String>,
    label: String,
) {
    fingerprint.method.apply {
        replaceWithReturnVoid()
        hookedMethods.add(label)
    }
}

private const val MAX_NULL_CHECK_WINDOW = 8

private fun isFirebasePerfGetInstance(ins: Instruction): Boolean {
    if (ins.opcode != Opcode.INVOKE_STATIC) return false
    val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return ref.parameterTypes.isEmpty() &&
        ref.returnType == ref.definingClass &&
        ref.definingClass.startsWith("Lcom/google/firebase/perf/")
}

private fun isGetClassOnRegister(ins: Instruction, reg: Int): Boolean {
    if (ins.opcode != Opcode.INVOKE_VIRTUAL && ins.opcode != Opcode.INVOKE_VIRTUAL_RANGE) return false
    val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    if (ref.definingClass != "Ljava/lang/Object;" ||
        ref.name != "getClass" ||
        ref.returnType != "Ljava/lang/Class;" ||
        ref.parameterTypes.isNotEmpty()
    ) {
        return false
    }
    return when (ins) {
        is FiveRegisterInstruction -> ins.registerCount == 1 && ins.registerC == reg
        is RegisterRangeInstruction -> ins.registerCount == 1 && ins.startRegister == reg
        else -> false
    }
}

private fun isMoveResult(opcode: Opcode): Boolean =
    opcode == Opcode.MOVE_RESULT ||
        opcode == Opcode.MOVE_RESULT_WIDE ||
        opcode == Opcode.MOVE_RESULT_OBJECT

private fun writesRegister(ins: Instruction, reg: Int): Boolean {
    val setsSingle = ins.opcode.setsRegister()
    val setsWide = ins.opcode.setsWideRegister()
    if (!setsSingle && !setsWide) return false
    val dest = when (ins) {
        is OneRegisterInstruction -> ins.registerA
        is TwoRegisterInstruction -> ins.registerA
        else -> null
    } ?: return false
    return dest == reg || (setsWide && dest + 1 == reg)
}

private fun isBranchOrReturn(ins: Instruction): Boolean =
    !ins.opcode.canContinue() || ins is OffsetInstruction

private fun findNullCheckIndexInWindow(
    instructions: List<Instruction>,
    startIndex: Int,
    reg: Int,
): Int? {
    val windowEnd = minOf(instructions.size - 1, startIndex + MAX_NULL_CHECK_WINDOW)
    for (idx in (startIndex + 1)..windowEnd) {
        val ins = instructions[idx]
        if (isGetClassOnRegister(ins, reg)) {
            val nextIns = instructions.getOrNull(idx + 1)
            if (nextIns != null && isMoveResult(nextIns.opcode)) {
                return null
            }
            return idx
        }
        if (writesRegister(ins, reg) || isBranchOrReturn(ins)) {
            return null
        }
    }
    return null
}

private fun findPerfNullCheckIndices(method: Method): List<Int> {
    val instructions = method.implementation?.instructions?.toList() ?: return emptyList()
    val matches = mutableListOf<Int>()
    for (i in instructions.indices) {
        val ins = instructions[i]
        if (!isFirebasePerfGetInstance(ins)) continue
        val nextIns = instructions.getOrNull(i + 1) ?: continue
        if (nextIns.opcode != Opcode.MOVE_RESULT_OBJECT) continue
        val reg = (nextIns as? OneRegisterInstruction)?.registerA ?: continue
        val nullCheckIdx = findNullCheckIndexInWindow(instructions, i + 1, reg) ?: continue
        matches.add(nullCheckIdx)
    }
    return matches
}

private fun patchNullChecksInMethod(method: MutableMethod, indices: List<Int>): Int {
    val distinctIndices = indices.distinct().sortedDescending()
    for (index in distinctIndices) {
        method.replaceInstruction(index, "nop")
    }
    return distinctIndices.size
}

/**
 * Removes bare Firebase Performance getInstance() null checks in application code.
 *
 * Purging FirebasePerfRegistrar in twitterTelemetryResourcePatch causes FirebasePerformance.getInstance()
 * to return null. R8 inlines Kotlin's
 * newTrace() calls, leaving an orphaned getClass() call on the null instance whose result is unused.
 * This throws NullPointerException when entering post detail or media playback.
 *
 * This function scans for calls to Firebase Performance getInstance() whose move-result register
 * is solely checked via Ljava/lang/Object;->getClass()Ljava/lang/Class;, replacing the getClass instruction
 * with nop to neutralize the crash.
 */
private fun BytecodePatchContext.removePerfGetInstanceNullChecks(): Int {
    var removedCount = 0

    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lcom/google/firebase/")) return@classDefForEach

        val hasMatch = classDef.methods.any { findPerfNullCheckIndices(it).isNotEmpty() }
        if (!hasMatch) return@classDefForEach

        val mutableClass = mutableClassDefBy(classDef)
        for (method in mutableClass.methods) {
            val matches = findPerfNullCheckIndices(method)
            if (matches.isNotEmpty()) {
                removedCount += patchNullChecksInMethod(method, matches)
            }
        }
    }

    if (removedCount == 0) {
        error("[Block Telemetry & Trackers] No Firebase Performance getInstance() null-check call sites found.")
    }

    return removedCount
}

private val appMeasurementLogEventInternalFingerprint = Fingerprint(
    definingClass = "Lcom/google/android/gms/measurement/AppMeasurement;",
    name = "logEventInternal",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Landroid/os/Bundle;"),
    returnType = "V",
)

private val traceStartFingerprint = Fingerprint(
    definingClass = "Lcom/google/firebase/perf/metrics/Trace;",
    name = "start",
    parameters = emptyList(),
    returnType = "V",
)

private val traceStopFingerprint = Fingerprint(
    definingClass = "Lcom/google/firebase/perf/metrics/Trace;",
    name = "stop",
    parameters = emptyList(),
    returnType = "V",
)

private val tracePutAttributeFingerprint = Fingerprint(
    definingClass = "Lcom/google/firebase/perf/metrics/Trace;",
    name = "putAttribute",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    returnType = "V",
)

private val traceRemoveAttributeFingerprint = Fingerprint(
    definingClass = "Lcom/google/firebase/perf/metrics/Trace;",
    name = "removeAttribute",
    parameters = listOf("Ljava/lang/String;"),
    returnType = "V",
)

private val tracePutMetricFingerprint = Fingerprint(
    definingClass = "Lcom/google/firebase/perf/metrics/Trace;",
    name = "putMetric",
    parameters = listOf("Ljava/lang/String;", "J"),
    returnType = "V",
)

private val traceIncrementMetricFingerprint = Fingerprint(
    definingClass = "Lcom/google/firebase/perf/metrics/Trace;",
    name = "incrementMetric",
    parameters = listOf("Ljava/lang/String;", "J"),
    returnType = "V",
)

private fun replaceStringLiteralsInMethod(
    method: MutableMethod,
    targetStrings: Set<String>,
    replacementString: String = "http://0.0.0.0",
): Int {
    val instructions = method.implementation?.instructions?.toList() ?: return 0
    var count = 0
    for ((index, instruction) in instructions.withIndex().reversed()) {
        val opcode = instruction.opcode
        if (opcode != Opcode.CONST_STRING && opcode != Opcode.CONST_STRING_JUMBO) continue
        val ref = (instruction as? ReferenceInstruction)?.reference as? StringReference ?: continue
        if (ref.string in targetStrings) {
            val register = (instruction as? OneRegisterInstruction)?.registerA ?: continue
            method.replaceInstruction(index, "const-string v$register, \"${replacementString.replace("\"", "\\\"")}\"")
            count++
        }
    }
    return count
}

private val brazeTargetUrls = setOf(
    "https://sdk.iad-01.braze.com/api/v3/",
    "https://sondheim.braze.com/api/v3/",
)

private val brazeBaseUrlFingerprint = Fingerprint(
    strings = brazeTargetUrls.toList(),
)

private val sentryTargetUrls = setOf(
    "https://o438986.ingest.sentry.io/api/5405103/store/?sentry_key=524610463d1141a58e7f57053dc7ef87",
)

private val sentryEndpointFingerprint = Fingerprint(
    strings = sentryTargetUrls.toList(),
)

private const val GOOGLE_ADS_URL = "https://googleads.g.doubleclick.net"
private const val PUB_ADS_URL = "https://pubads.g.doubleclick.net"
private const val STATIC_DOUBLECLICK_URL = "https://static.doubleclick.net"
private const val CRASHLYTICS_SETTINGS_URL = "https://firebase-settings.crashlytics.com/spi/v2/platforms/android/gmp/"
private const val APP_MEASUREMENT_A_URL = "https://app-measurement.com/a"
private const val APP_MEASUREMENT_SD_URL = "https://app-measurement.com/s/d"

private val googleAdsTargetUrls = setOf(
    GOOGLE_ADS_URL,
    PUB_ADS_URL,
    STATIC_DOUBLECLICK_URL,
    CRASHLYTICS_SETTINGS_URL,
    APP_MEASUREMENT_A_URL,
    APP_MEASUREMENT_SD_URL,
)

private val googleAdsEndpointFingerprint = Fingerprint(strings = listOf(GOOGLE_ADS_URL))
private val pubAdsEndpointFingerprint = Fingerprint(strings = listOf(PUB_ADS_URL))
private val crashlyticsSettingsFingerprint = Fingerprint(strings = listOf(CRASHLYTICS_SETTINGS_URL))
private val appMeasurementEndpointFingerprint = Fingerprint(strings = listOf(APP_MEASUREMENT_A_URL))

private const val PLAID_ANALYTICS_URL = "https://analytics.plaid.com/sentry/api/"
private const val SCRIBEUP_URL = "https://api.scribeup.io"

private val paymentsTargetUrls = setOf(
    PLAID_ANALYTICS_URL,
    SCRIBEUP_URL,
)

private val plaidAnalyticsFingerprint = Fingerprint(strings = listOf(PLAID_ANALYTICS_URL))
private val scribeupEndpointFingerprint = Fingerprint(strings = listOf(SCRIBEUP_URL))

@Suppress("unused")
val twitterBlockTelemetryPatch = bytecodePatch(
    name = "Block Telemetry & Trackers",
    description = "Blocks tracking services, analytics collection, and advertising identifiers, redirects Braze and Sentry endpoints to 0.0.0.0, and purges Sentry manifest metadata.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_TWITTER)
    dependsOn(twitterTelemetryResourcePatch)

    val blockPaymentsTelemetry by booleanOption(
        key = "blockPaymentsTelemetry",
        default = false,
        title = "Block Payments & Anti-Fraud Telemetry",
        description = "Redirects Plaid, ScribeUp, and financial anti-fraud telemetry endpoints to 0.0.0.0. WARNING: Enabling this disables X Payments and banking verification features.",
    )

    execute {
        val hookedMethods = mutableListOf<String>()

        // Google AppMeasurement
        hookVoidMethod(
            fingerprint = appMeasurementLogEventInternalFingerprint,
            hookedMethods = hookedMethods,
            label = "AppMeasurement.logEventInternal",
        )

        // Firebase Performance
        hookVoidMethod(
            fingerprint = traceStartFingerprint,
            hookedMethods = hookedMethods,
            label = "Trace.start",
        )
        hookVoidMethod(
            fingerprint = traceStopFingerprint,
            hookedMethods = hookedMethods,
            label = "Trace.stop",
        )
        hookVoidMethod(
            fingerprint = tracePutAttributeFingerprint,
            hookedMethods = hookedMethods,
            label = "Trace.putAttribute",
        )
        hookVoidMethod(
            fingerprint = traceRemoveAttributeFingerprint,
            hookedMethods = hookedMethods,
            label = "Trace.removeAttribute",
        )
        hookVoidMethod(
            fingerprint = tracePutMetricFingerprint,
            hookedMethods = hookedMethods,
            label = "Trace.putMetric",
        )
        hookVoidMethod(
            fingerprint = traceIncrementMetricFingerprint,
            hookedMethods = hookedMethods,
            label = "Trace.incrementMetric",
        )

        // Braze base URL redirection
        val brazeMethods = (brazeBaseUrlFingerprint.matchAllOrNull() ?: emptyList()).map { it.method }.ifEmpty {
            listOf(brazeBaseUrlFingerprint.method)
        }
        var brazeRewrites = 0
        for (method in brazeMethods) {
            brazeRewrites += replaceStringLiteralsInMethod(method, brazeTargetUrls, "http://0.0.0.0")
        }
        if (brazeRewrites == 0) {
            error("[Block Telemetry & Trackers] Failed to redirect Braze base URLs: no target const-string instructions found.")
        }

        // Sentry ingest endpoint redirection
        val sentryMethods = (sentryEndpointFingerprint.matchAllOrNull() ?: emptyList()).map { it.method }.ifEmpty {
            listOf(sentryEndpointFingerprint.method)
        }
        var sentryRewrites = 0
        for (method in sentryMethods) {
            sentryRewrites += replaceStringLiteralsInMethod(method, sentryTargetUrls, "http://0.0.0.0")
        }
        if (sentryRewrites == 0) {
            error("[Block Telemetry & Trackers] Failed to redirect Sentry ingest endpoints: no target const-string instructions found.")
        }

        // Google Ads, DoubleClick, Crashlytics settings, and AppMeasurement redirection
        val googleAdsFingerprints = listOf(
            googleAdsEndpointFingerprint,
            pubAdsEndpointFingerprint,
            crashlyticsSettingsFingerprint,
            appMeasurementEndpointFingerprint,
        )
        val googleAdsMethods = googleAdsFingerprints.flatMap { fp ->
            (fp.matchAllOrNull() ?: emptyList()).map { it.method }.ifEmpty {
                listOf(fp.method)
            }
        }.distinct()
        var googleAdsRewrites = 0
        for (method in googleAdsMethods) {
            googleAdsRewrites += replaceStringLiteralsInMethod(method, googleAdsTargetUrls, "http://0.0.0.0")
        }
        if (googleAdsRewrites == 0) {
            error("[Block Telemetry & Trackers] Failed to redirect Google Ads and Crashlytics endpoints: no target const-string instructions found.")
        }

        // Payments & Anti-Fraud Telemetry redirection
        if (blockPaymentsTelemetry == true) {
            val paymentsFingerprints = listOf(
                plaidAnalyticsFingerprint,
                scribeupEndpointFingerprint,
            )
            val paymentsMethods = paymentsFingerprints.flatMap { fp ->
                (fp.matchAllOrNull() ?: emptyList()).map { it.method }.ifEmpty {
                    listOf(fp.method)
                }
            }.distinct()
            var paymentsRewrites = 0
            for (method in paymentsMethods) {
                paymentsRewrites += replaceStringLiteralsInMethod(method, paymentsTargetUrls, "http://0.0.0.0")
            }
            if (paymentsRewrites == 0) {
                error("[Block Telemetry & Trackers] Failed to redirect X Payments endpoints: no target const-string instructions found.")
            }
            println("[Block Telemetry & Trackers] Redirected X Payments and financial telemetry endpoints to 0.0.0.0.")
        } else {
            println("[Block Telemetry & Trackers] Preserved X Payments telemetry: blockPaymentsTelemetry option disabled.")
        }

        val removedNullChecks = removePerfGetInstanceNullChecks()

        println("[Block Telemetry & Trackers] Neutralized ${hookedMethods.size} telemetry dispatch methods: ${hookedMethods.joinToString(", ")}.")
        println("[Block Telemetry & Trackers] Redirected Braze, Google Ads/DoubleClick, and Sentry ingest endpoints to 0.0.0.0.")
        println("[Block Telemetry & Trackers] Removed $removedNullChecks Firebase Performance getInstance() null checks (registrar purged).")
    }
}
