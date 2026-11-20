package app.aidan.patches.sidelineswap.tracking

import app.aidan.patches.shared.compositeFeaturePatch
import app.aidan.patches.shared.disableOptionalVoidMethods
import app.aidan.patches.shared.returnOptionalBoolean
import app.aidan.patches.shared.returnOptionalNullObject
import app.aidan.patches.shared.returnOptionalString
import app.aidan.patches.sidelineswap.shared.COMPATIBILITY_SIDELINESWAP
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

val blockTrackingAndTelemetryPatch = compositeFeaturePatch(
    name = "Block Tracking and Telemetry",
    description = "Neutralizes first-party analytics (SidelineSwap backend), behavioral tracking (Amplitude, Firebase Analytics, Facebook App Events, Iterable), diagnostic telemetry (Firebase Crashlytics, Timber logging tree), payment gateway telemetry (Braintree FPTI), Google Play Install Referrer, and zeros the Google Play Advertising ID (AAID).",
    default = true,
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_SIDELINESWAP)

    val disableFirstParty = booleanOption(
        key = "disableFirstParty",
        default = true,
        title = "Disable First-Party Analytics",
        description = "Neutralizes SidelineSwap's central event dispatcher (AnalyticsLogger), first-party client, and LogRepo HTTP event uploads.",
    )

    val disableAmplitude = booleanOption(
        key = "disableAmplitude",
        default = true,
        title = "Disable Amplitude Analytics",
        description = "Neutralizes the Amplitude client wrapper and core Amplitude SDK event tracking, identification, and initialization across all repositories.",
    )

    val disableFirebase = booleanOption(
        key = "disableFirebase",
        default = true,
        title = "Disable Firebase & GMS Analytics",
        description = "Neutralizes FirebaseClient, Google Play Services Measurement event queue, and removes background AppMeasurement services and sessions.",
    )

    val disableCrashlytics = booleanOption(
        key = "disableCrashlytics",
        default = true,
        title = "Disable Crashlytics & Diagnostic Logging",
        description = "Neutralizes the Timber Crashlytics logging tree and Firebase Crashlytics exception, log, and custom key reporting.",
    )

    val disableFacebook = booleanOption(
        key = "disableFacebook",
        default = true,
        title = "Disable Facebook SDK & App Events",
        description = "Neutralizes Facebook SDK initialization, auto-event collection, activity lifecycle tracking, and removes FacebookInitProvider.",
    )

    val disableIterable = booleanOption(
        key = "disableIterable",
        default = true,
        title = "Disable Iterable Telemetry",
        description = "Neutralizes Iterable client calls, In-App message tracking, session event uploads, and lifecycle callback registration.",
    )

    val disableBraintreeTelemetry = booleanOption(
        key = "disableBraintreeTelemetry",
        default = true,
        title = "Disable Braintree Gateway Telemetry",
        description = "Stubs Braintree FPTI background upload and database workers with immediate success, and neutralizes BraintreeClient analytics dispatchers.",
    )

    val zeroAdvertisingId = booleanOption(
        key = "zeroAdvertisingId",
        default = true,
        title = "Zero Google Play Advertising ID",
        description = "Spoofs minified and standard Google Play AdvertisingIdClient calls to return an all-zero UUID and forces limit-ad-tracking to true.",
    )

    val disableInstallReferrer = booleanOption(
        key = "disableInstallReferrer",
        default = true,
        title = "Disable Install Referrer Tracking",
        description = "Neutralizes Google Play Install Referrer querying and client connections across attribution listeners.",
    )

    resources {
        val targetsToRemove = mutableSetOf<String>()
        if (disableFirebase.value != false) {
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
        if (disableFacebook.value != false) {
            targetsToRemove.addAll(
                listOf(
                    "com.facebook.internal.FacebookInitProvider",
                    "com.facebook.CurrentAccessTokenExpirationBroadcastReceiver",
                    "com.facebook.AuthenticationTokenManager\$CurrentAuthenticationTokenChangedBroadcastReceiver",
                    "com.facebook.sdk.ApplicationId",
                    "com.facebook.sdk.ClientToken",
                )
            )
        }
        if (disableIterable.value != false) {
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
        // Layer 1: First-Party Analytics Neutralization
        if (disableFirstParty.value != false) {
            disableOptionalVoidMethods("Lcom/sidelineswap/android/analytics/AnalyticsLogger;", "delegateToClients")
            returnThis("Lcom/sidelineswap/android/analytics/AnalyticsLogger;", "addClient")
            disableOptionalVoidMethods(
                "Lcom/sidelineswap/android/analytics/SidelineSwapClient;",
                "logEvent",
                "access\$logEvent",
            )
            returnOptionalNullObject("Lcom/sidelineswap/android/repo/LogRepo;", "trackEvent")
        }

        // Layer 2: Amplitude Analytics Neutralization
        if (disableAmplitude.value != false) {
            disableOptionalVoidMethods(
                "Lcom/sidelineswap/android/analytics/AmplitudeClient;",
                "logEvent",
                "access\$logEvent",
            )
            disableOptionalVoidMethods(
                "Lj1/d;",
                "d",
                "e",
                "f",
                "j",
                "k",
                "l",
                "n",
                "o",
                "p",
                "t",
                "u",
                "v",
                "w",
            )
        }

        // Layer 3: Firebase Analytics & GMS AppMeasurement Neutralization
        if (disableFirebase.value != false) {
            disableOptionalVoidMethods(
                "Lcom/sidelineswap/android/analytics/FirebaseClient;",
                "logEvent",
                "access\$logEvent",
                "completedCheckout",
                "initiatedCheckout",
                "joined",
                "newMadeOffer",
                "newMadePurchase",
                "visitedItem",
                "visitedResults",
            )
            disableOptionalVoidMethods(
                "Lcom/google/android/gms/internal/measurement/r0;",
                "b",
            )
        }

        // Layer 4: Firebase Crashlytics & Timber Tree Neutralization
        if (disableCrashlytics.value != false) {
            disableOptionalVoidMethods("Lcom/sidelineswap/android/log/CrashlyticsTree;", "log")
            disableOptionalVoidMethods(
                "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
                "log",
                "recordException",
                "setCrashlyticsCollectionEnabled",
                "setCustomKey",
                "setCustomKeys",
            )
        }

        // Layer 5: Facebook SDK & App Events Neutralization
        if (disableFacebook.value != false) {
            disableOptionalVoidMethods("Lg2/n;", "i")
            disableOptionalVoidMethods("Lv2/y;", "a", "b", "c", "d", "e")
            disableOptionalVoidMethods(
                "Lcom/sidelineswap/android/analytics/FacebookClient;",
                "completedCheckout",
                "initiatedCheckout",
                "joined",
                "newMadeOffer",
                "newMadePurchase",
                "visitedItem",
                "visitedResults",
            )
            disableOptionalVoidMethods("Lh2/h;", "a")
            disableOptionalVoidMethods("Lh2/i;", "d", "e", "f", "g", "h")
            disableOptionalVoidMethods("Lp2/a;", "c")
        }

        // Layer 6: Iterable Telemetry Neutralization
        if (disableIterable.value != false) {
            disableOptionalVoidMethods("Lcom/sidelineswap/android/analytics/IterableClient;", "visitedLocker")
            disableOptionalVoidMethods("Lt5/h;", "d", "g", "h", "j", "k", "l", "m")
            disableOptionalVoidMethods("Lt5/i;", "d")
            disableOptionalVoidMethods("Lt5/e;", "a")
        }

        // Layer 7: Braintree FPTI Gateway Telemetry Neutralization
        if (disableBraintreeTelemetry.value != false) {
            returnWorkerSuccess("Lcom/braintreepayments/api/AnalyticsUploadWorker;", "g")
            returnWorkerSuccess("Lcom/braintreepayments/api/AnalyticsWriteToDbWorker;", "g")
            disableOptionalVoidMethods("Lcom/braintreepayments/api/L;", "b", "c")
        }

        // Layer 8: Google Play Advertising ID Zeroing & Opt-Out
        if (zeroAdvertisingId.value != false) {
            spoofMinifiedAdvertisingId("LY2/a;")
            returnOptionalString(
                "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;",
                "getId",
                "00000000-0000-0000-0000-000000000000",
            )
            returnOptionalBoolean(
                "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;",
                "isLimitAdTrackingEnabled",
                true,
            )
        }

        // Layer 9: Google Play Install Referrer Neutralization
        if (disableInstallReferrer.value != false) {
            disableOptionalVoidMethods("Ll1/a;", "b")
            disableOptionalVoidMethods("Lv2/b\$a;", "a")
        }
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
 * Makes implemented non-static overloads with [methodName] whose return type matches
 * [classDescriptor] return their receiver (`this`). Parameter register widths are taken
 * into account (long and double count as two registers). Absent classes or non-matching
 * overloads are skipped.
 */
private fun BytecodePatchContext.returnThis(
    classDescriptor: String,
    methodName: String,
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return

    for (method in mutableClass.methods) {
        if (
            method.name == methodName &&
            method.returnType == classDescriptor &&
            method.implementation != null &&
            !AccessFlags.STATIC.isSet(method.accessFlags)
        ) {
            val registerCount = method.implementation!!.registerCount
            val paramRegisterCount = method.parameterTypes.sumOf { type ->
                if (type == "J" || type == "D") 2 else 1
            }
            val thisRegister = registerCount - 1 - paramRegisterCount
            method.addInstructions(
                0,
                """
                return-object v$thisRegister
                """.trimIndent(),
            )
        }
    }
}

/**
 * Makes implemented, parameterless overloads with [methodName] and return type
 * `Landroidx/work/ListenableWorker$a;` return a new WorkManager success result
 * without running their original bodies. Absent classes or non-matching overloads are skipped.
 */
private fun BytecodePatchContext.returnWorkerSuccess(
    classDescriptor: String,
    methodName: String = "g",
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return

    for (method in mutableClass.methods) {
        if (
            method.name == methodName &&
            method.returnType == "Landroidx/work/ListenableWorker\$a;" &&
            method.parameterTypes.isEmpty() &&
            method.implementation != null
        ) {
            method.addInstructions(
                0,
                """
                new-instance v0, Landroidx/work/ListenableWorker${'$'}a${'$'}c;
                invoke-direct {v0}, Landroidx/work/ListenableWorker${'$'}a${'$'}c;-><init>()V
                return-object v0
                """.trimIndent(),
            )
        }
    }
}

/**
 * Makes implemented one-parameter methods named a return an AdvertisingIdClient
 * info object with a zeroed AAID and limit-ad-tracking enabled. Absent classes or
 * matches are skipped; parameter and return types are not checked.
 */
private fun BytecodePatchContext.spoofMinifiedAdvertisingId(
    classDescriptor: String = "LY2/a;",
) {
    val mutableClass = mutableClassDefByOrNull(classDescriptor) ?: return

    for (method in mutableClass.methods) {
        if (method.name == "a" && method.implementation != null && method.parameterTypes.size == 1) {
            method.addInstructions(
                0,
                """
                new-instance v0, LY2/a${'$'}a;
                const-string v1, "00000000-0000-0000-0000-000000000000"
                const/4 v2, 0x1
                invoke-direct {v0, v1, v2}, LY2/a${'$'}a;-><init>(Ljava/lang/String;Z)V
                return-object v0
                """.trimIndent(),
            )
        }
    }
}
