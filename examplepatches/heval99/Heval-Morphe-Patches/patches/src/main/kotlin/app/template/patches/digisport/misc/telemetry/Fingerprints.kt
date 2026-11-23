package app.template.patches.digisport.misc.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

// Since 1.1.16 R8 renames the Firebase Crashlytics, Performance and Piano/Cxense classes too, and
// inlines FirebaseAnalytics.logEvent, Crashlytics.log and CxenseSdk.pushEvents into their callers.
// The anchors are the SDKs' own log and error strings, kept model classes and the measurement
// service's AIDL method names.

internal const val CXENSE_EVENT_ARRAY = "[Lio/piano/android/cxense/model/Event;"

// FirebaseCrashlytics.getInstance(): fails with this message when the component is missing. Its
// class is the renamed FirebaseCrashlytics.
internal val crashlyticsGetInstanceFingerprint = Fingerprint(
    parameters = listOf(),
    filters = listOf(string("FirebaseCrashlytics component is not present.")),
    custom = { method, _ -> method.implementation != null && AccessFlags.STATIC.isSet(method.accessFlags) },
)

// FirebasePerformance.setPerformanceCollectionEnabled(boolean) (the Boolean overload is merged
// into it since 1.1.16): GDPTools switches Performance collection with it.
internal val performanceCollectionFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(string("Firebase Performance is permanently disabled")),
    custom = { method, _ -> method.implementation != null },
)

// CxenseSdk.pushEvents' runnable (pushEvents$lambda$1: putEventsInDatabase, then a flush when
// sendEventsAtPush): since 1.1.16 pushEvents is inlined into SatiManager and the runnable, with
// putEventsInDatabase inlined, is one case of an R8-merged Runnable; it is the only code that casts
// a capture to Event[].
internal val cxensePushEventsRunnableFingerprint = Fingerprint(
    name = "run",
    returnType = "V",
    parameters = listOf(),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            it.opcode == Opcode.CHECK_CAST && (it as ReferenceInstruction).reference.toString() == CXENSE_EVENT_ARRAY
        } == true
    },
)

// The measurement service's logEvent(origin, name, params, ...): FirebaseAnalytics.logEvent is
// inlined since 1.1.16 into a runnable that calls it through the measurement AIDL interface,
// whose method names are kept. The patch covers every concrete implementation (the binder proxy
// and AppMeasurementDynamiteService).
internal const val MEASUREMENT_LOG_EVENT = "logEvent"
internal val MEASUREMENT_LOG_EVENT_PARAMETERS =
    listOf("Ljava/lang/String;", "Ljava/lang/String;", "Landroid/os/Bundle;", "Z", "Z", "J")
