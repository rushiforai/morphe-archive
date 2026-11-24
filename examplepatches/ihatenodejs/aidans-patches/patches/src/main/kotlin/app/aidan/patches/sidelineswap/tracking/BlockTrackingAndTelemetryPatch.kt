package app.aidan.patches.sidelineswap.tracking

import app.aidan.patches.shared.compositeFeaturePatch
import app.aidan.patches.shared.disableRequiredVoidMethods
import app.aidan.patches.shared.disableRequiredVoidMethodsByName
import app.aidan.patches.shared.isEnabled
import app.aidan.patches.shared.returnRequiredBoolean
import app.aidan.patches.sidelineswap.shared.COMPATIBILITY_SIDELINESWAP
import app.aidan.patches.sidelineswap.shared.requireSidelineSwapCompose
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

// ---------------------------------------------------------------------------
// SidelineSwap 2.3.2 replaced the AnalyticsLogger / SidelineSwapClient / LogRepo
// dispatcher with a single `Lij;` tracker interface. Four implementations exist:
// the fan-out multiplexer (Loi1), the first-party HTTP client (Lwl2), the
// Amplitude wrapper (Lli) and a no-op (Lxb5). The Facebook SDK is not packaged.
// ---------------------------------------------------------------------------

private const val FIRST_PARTY_CLIENT = "Lwl2;"
private const val AMPLITUDE_CLIENT = "Lli;"
private const val CRASHLYTICS_WRAPPER = "Lyb5;"
private const val CRASHLYTICS_HANDLER = "Lqs1;"
private const val ITERABLE_WRAPPER = "Ls24;"
private const val ITERABLE_SDK = "Lb14;"
private const val MEASUREMENT_CLASS = "Lcom/google/android/gms/measurement/AppMeasurement;"
private const val INSTALL_REFERRER_REPORTER = "Llab;"
private const val ADVERTISING_ID_CLIENT = "Lie;"
private const val ADVERTISING_ID_INFO = "Lhe;"
private const val WORK_SUCCESS_CLASS = "Lhn4;"

val blockTrackingAndTelemetryPatch = compositeFeaturePatch(
    name = "Block Tracking and Telemetry",
    description = "Neutralizes first-party analytics (SidelineSwap backend), behavioral tracking (Amplitude, Firebase Analytics, Iterable), diagnostic telemetry (Firebase Crashlytics), payment gateway telemetry (Braintree FPTI), Google Play Install Referrer, and zeros the Google Play Advertising ID (AAID).",
    default = true,
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_SIDELINESWAP)

    val disableFirstParty = booleanOption(
        key = "disableFirstParty",
        default = true,
        title = "Disable First-Party Analytics",
        description = "Neutralizes SidelineSwap's first-party HTTP event client. The fan-out multiplexer stays intact so the remaining clients stay independently controllable.",
    )

    val disableAmplitude = booleanOption(
        key = "disableAmplitude",
        default = true,
        title = "Disable Amplitude Analytics",
        description = "Neutralizes the Amplitude client wrapper's event, identification, and reset entry points.",
    )

    val disableFirebase = booleanOption(
        key = "disableFirebase",
        default = true,
        title = "Disable Firebase & GMS Analytics",
        description = "Neutralizes the Google Play Services measurement event entry point and removes background AppMeasurement services and sessions.",
    )

    val disableCrashlytics = booleanOption(
        key = "disableCrashlytics",
        default = true,
        title = "Disable Crashlytics & Diagnostic Logging",
        description = "Neutralizes the Crashlytics user-id wrapper and stops the crash handler from recording exceptions, while the default handler still terminates crashed processes.",
    )

    val disableIterable = booleanOption(
        key = "disableIterable",
        default = true,
        title = "Disable Iterable Telemetry",
        description = "Neutralizes the Iterable client wrapper and SDK identity/FCM registration entry points, and removes Iterable push services and receivers.",
    )

    val disableBraintreeTelemetry = booleanOption(
        key = "disableBraintreeTelemetry",
        default = true,
        title = "Disable Braintree Gateway Telemetry",
        description = "Stubs Braintree FPTI background upload and database workers with immediate success.",
    )

    val zeroAdvertisingId = booleanOption(
        key = "zeroAdvertisingId",
        default = true,
        title = "Zero Google Play Advertising ID",
        description = "Spoofs the Google Play AdvertisingIdClient entry points to return an all-zero UUID and forces limit-ad-tracking to true.",
    )

    val disableInstallReferrer = booleanOption(
        key = "disableInstallReferrer",
        default = true,
        title = "Disable Install Referrer Tracking",
        description = "Neutralizes the Google Play Services install-referrer reporter.",
    )

    resources {
        packageMetadata.requireSidelineSwapCompose()

        val targetsToRemove = mutableSetOf<String>()
        if (disableFirebase.isEnabled) {
            targetsToRemove.addAll(
                listOf(
                    "com.google.android.gms.measurement.AppMeasurementReceiver",
                    "com.google.android.gms.measurement.AppMeasurementService",
                    "com.google.android.gms.measurement.AppMeasurementJobService",
                    "com.google.firebase.sessions.SessionLifecycleService",
                    "android.adservices.AD_SERVICES_CONFIG",
                )
            )
        }
        if (disableIterable.isEnabled) {
            targetsToRemove.addAll(
                listOf(
                    "com.iterable.iterableapi.IterableFirebaseMessagingService",
                    "com.iterable.iterableapi.IterablePushActionReceiver",
                )
            )
        }

        if (targetsToRemove.isNotEmpty()) {
            document("AndroidManifest.xml").use { doc ->
                removeManifestComponents(doc, targetsToRemove)
            }
        }
    }

    bytecode {
        packageMetadata.requireSidelineSwapCompose()
        patchComposeTracking(
            firstParty = disableFirstParty.isEnabled,
            amplitude = disableAmplitude.isEnabled,
            firebase = disableFirebase.isEnabled,
            crashlytics = disableCrashlytics.isEnabled,
            iterable = disableIterable.isEnabled,
            braintree = disableBraintreeTelemetry.isEnabled,
            advertisingId = zeroAdvertisingId.isEnabled,
            installReferrer = disableInstallReferrer.isEnabled,
        )
    }
}

private fun BytecodePatchContext.patchComposeTracking(
    firstParty: Boolean,
    amplitude: Boolean,
    firebase: Boolean,
    crashlytics: Boolean,
    iterable: Boolean,
    braintree: Boolean,
    advertisingId: Boolean,
    installReferrer: Boolean,
) {
    if (firstParty) {
        // Only the first-party HTTP client; the multiplexer must keep fanning out to the
        // remaining clients so each option stays independent.
        disableRequiredVoidMethods(FIRST_PARTY_CLIENT, "b")
    }

    if (amplitude) {
        disableRequiredVoidMethodsByName(AMPLITUDE_CLIENT, "a", "b", "reset")
    }

    if (firebase) {
        disableRequiredVoidMethods(MEASUREMENT_CLASS, "logEventInternal")
    }

    if (crashlytics) {
        // The app wrapper only sets the Crashlytics user id.
        disableRequiredVoidMethodsByName(CRASHLYTICS_WRAPPER, "a", "b")
        // Returning false means "do not record this exception". The handler still
        // delegates to the default uncaught-exception handler, so crashes keep crashing.
        returnRequiredBoolean(CRASHLYTICS_HANDLER, "a", false)
    }

    if (iterable) {
        disableRequiredVoidMethodsByName(ITERABLE_WRAPPER, "a", "clear")
        disableRequiredVoidMethods(ITERABLE_SDK, "i", "k")
    }

    if (braintree) {
        returnWorkerSuccess("Lcom/braintreepayments/api/AnalyticsUploadWorker;")
        returnWorkerSuccess("Lcom/braintreepayments/api/AnalyticsWriteToDbWorker;")
    }

    if (advertisingId) {
        spoofAdvertisingInfo()
    }

    if (installReferrer) {
        disableRequiredVoidMethods(INSTALL_REFERRER_REPORTER, "S")
    }
}

/**
 * Removes components from AndroidManifest.xml matching the specified set of names.
 */
private fun removeManifestComponents(doc: Document, targets: Set<String>) {
    val allElements = doc.getElementsByTagName("*")
    val toRemove = mutableListOf<Element>()
    for (i in 0 until allElements.length) {
        val elem = allElements.item(i) as? Element ?: continue
        val name = elem.getAttributeNS(ANDROID_NS, "name")
            .ifEmpty { elem.getAttribute("android:name") }
            .trim()
        if (name in targets) {
            toRemove.add(elem)
        }
    }
    for (elem in toRemove) {
        elem.parentNode?.removeChild(elem)
    }
}

/**
 * Returns WorkManager success from Braintree's FPTI workers without running their bodies,
 * so queued uploads drain without retries and without network traffic.
 */
private fun BytecodePatchContext.returnWorkerSuccess(classDescriptor: String) {
    val classDef = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Required policy failed: missing $classDescriptor")

    val targets = classDef.methods.filter {
        it.name == "c" &&
            it.returnType == "Lin4;" &&
            it.parameterTypes.isEmpty() &&
            it.implementation != null
    }
    if (targets.isEmpty()) {
        throw PatchException("Required policy failed: missing doWork() in $classDescriptor")
    }

    for (method in targets) {
        method.addInstructions(
            0,
            """
            new-instance v0, $WORK_SUCCESS_CLASS
            invoke-direct {v0}, $WORK_SUCCESS_CLASS-><init>()V
            return-object v0
            """.trimIndent()
        )
    }
}

/**
 * Makes the renamed Google Play AdvertisingIdClient return a zeroed advertising id with
 * limit-ad-tracking forced on. Both the static and instance entry points are required.
 */
private fun BytecodePatchContext.spoofAdvertisingInfo() {
    val classDef = mutableClassDefByOrNull(ADVERTISING_ID_CLIENT)
        ?: throw PatchException("Required policy failed: missing $ADVERTISING_ID_CLIENT")

    var patched = 0
    for (method in classDef.methods) {
        if (method.returnType != ADVERTISING_ID_INFO || method.implementation == null) continue
        if (method.name != "a" && method.name != "e") continue

        method.addInstructions(
            0,
            """
            new-instance v0, $ADVERTISING_ID_INFO
            const-string v1, "00000000-0000-0000-0000-000000000000"
            const/4 v2, 0x1
            invoke-direct {v0, v1, v2}, $ADVERTISING_ID_INFO-><init>(Ljava/lang/String;Z)V
            return-object v0
            """.trimIndent()
        )
        patched++
    }

    if (patched != 2) {
        throw PatchException(
            "Required policy failed: expected the static and instance $ADVERTISING_ID_CLIENT " +
                "advertising-id entry points, patched $patched"
        )
    }
}
