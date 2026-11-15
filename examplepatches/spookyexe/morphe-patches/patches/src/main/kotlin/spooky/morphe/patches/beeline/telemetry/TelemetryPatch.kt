package spooky.morphe.patches.beeline.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

import spooky.morphe.patches.shared.Constants.COMPATIBILITY_BEELINE

/**
 * No-op a void method found by [this] fingerprint, safely.
 *
 * Guards against two failure modes:
 *  - fingerprint not found  → report and skip (SDK absent in another build)
 *  - fingerprint matched a BODYLESS method (abstract declaration on an
 *    interface) → report and skip. Calling `addInstructions` on such a method
 *    NPEs inside the patcher (InstructionExtensions dereferences the
 *    non-existent implementation), which is exactly what happened when the
 *    Mapbox fingerprint targeted the `MapTelemetry` interface.
 */
private fun Fingerprint.noopVoid(label: String) {
    val method = methodOrNull ?: run {
        println("Telemetry: $label not found — skipping")
        return
    }
    if (method.instructionsOrNull == null) {
        println("Telemetry: $label matched an abstract/bodyless method — skipping")
        return
    }
    method.addInstructions(0, "return-void")
}

/**
 * Disable Beeline telemetry.
 *
 * Stops the app from sending usage and crash telemetry to remote servers.
 * No-ops the dispatch points for the app's analytics and crash-reporting SDKs
 * so no usage data is transmitted, while leaving all core functionality
 * (navigation, routing, map rendering, subscriptions, etc.) untouched.
 *
 * Targets:
 *   • Segment Analytics — `wc.c(Event)` — central Segment event dispatch
 *   • Firebase Analytics — `FirebaseAnalytics.logEvent(String, Bundle)`
 *   • Firebase Crashlytics — `FirebaseCrashlytics.log(String)`
 *   • Firebase Crashlytics — `FirebaseCrashlytics.recordException(Throwable)`
 *   • Mapbox Telemetry — `MapTelemetryImpl.enableTelemetryCollection(Z)` forced
 *     to pass `false` to `TelemetryUtils.setEventsCollectionState`, the single
 *     Java funnel that switches Mapbox events collection on/off
 *
 * This patch is safe to apply with the other Beeline patches (Unlock Plus,
 * Firebase cert fix, signature spoof, install source spoof). It does not
 * interact with any of them.
 */
@Suppress("unused")
val disableBeelineTelemetryPatch = patch(
    name = "Disable Beeline telemetry",
    description = """
        Stops Beeline from sending usage and crash telemetry to remote servers.

        Disables:
        - Segment Analytics (track / screen / identify events)
        - Firebase Analytics (logEvent)
        - Firebase Crashlytics (log messages, recorded exceptions)
        - Mapbox map telemetry (events collection switched off at the SDK level)

        Does not affect app functionality — only telemetry collection is
        suppressed. Navigation, routing, maps and Plus features all keep working.
    """.trimIndent(),
    default = true,
) {
    compatibleWith(COMPATIBILITY_BEELINE)

    execute {
        SegmentAnalyticsDispatchFingerprint.noopVoid("Segment Analytics dispatch (wc.c)")

        FirebaseAnalyticsLogEventFingerprint.noopVoid("Firebase Analytics logEvent")

        FirebaseCrashlyticsLogFingerprint.noopVoid("Firebase Crashlytics log(String)")
        FirebaseCrashlyticsRecordExceptionFingerprint.noopVoid(
            "Firebase Crashlytics recordException(Throwable)"
        )
    }
}
