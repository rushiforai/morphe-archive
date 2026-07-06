package app.paresh.patches.protonvpn.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.protonvpn.shared.Constants.COMPATIBILITY_PROTONVPN
import com.android.tools.smali.dexlib2.AccessFlags

// Proton Core telemetry worker — schedules telemetry upload
object TelemetryWorkerEnqueueFingerprint : Fingerprint(
    definingClass = "Lme/proton/core/telemetry/data/worker/TelemetryWorkerManagerImpl;",
    name = "enqueueOrKeep-HG0u8IE",
    returnType = "V",
)

// Proton Core observability — sends analytics events to API
object SendObservabilityFingerprint : Fingerprint(
    definingClass = "Lme/proton/core/observability/data/usecase/SendObservabilityEventsImpl;",
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/util/List;", "Lkotlin/coroutines/Continuation;"),
)

// VPN telemetry — records connection stats, upgrade events, etc.
object VpnTelemetryAddEventFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    parameters = listOf(
        "Lcom/protonvpn/android/telemetry/TelemetryEvent;",
        "Z",
        "Lkotlin/coroutines/Continuation;"
    ),
)

// SettingsTelemetryActivity.onCreate — telemetry settings screen
object TelemetrySettingsOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/protonvpn/android/ui/settings/SettingsTelemetryActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Blocks all telemetry, analytics, and observability data collection."
) {
    compatibleWith(COMPATIBILITY_PROTONVPN)

    execute {
        // Block Proton Core telemetry upload scheduling
        TelemetryWorkerEnqueueFingerprint.method.addInstructions(0, "return-void")

        // Block observability events send
        SendObservabilityFingerprint.method.addInstructions(0, """
            sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
            return-object p0
        """)

        // Block VPN telemetry event recording
        VpnTelemetryAddEventFingerprint.method.addInstructions(0, """
            sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
            return-object p0
        """)
    }
}
