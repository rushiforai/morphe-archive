package app.template.patches.protonpass

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.PROTON_PASS_COMPATIBILITY
import app.template.patches.shared.Constants.PROTON_PASS_FDROID_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.template.patches.shared.ensureRegisters

private val SendEventFingerprint = Fingerprint(
    definingClass = "Lproton/android/pass/telemetry/impl/TelemetryManagerImpl;",
    name = "sendEvent",
    returnType = "V",
    parameters = listOf("Landroidx/credentials/CreateCredentialRequest;"),
)

private val LiveStartListeningFingerprint = Fingerprint(
    definingClass = "Lproton/android/pass/telemetry/impl/LiveTelemetryManagerImpl;",
    name = "startListening",
    returnType = "V",
    parameters = listOf(
        "Lproton/android/pass/telemetry/impl/TelemetryManagerImpl\$startListening\$2\$1\$\$ExternalSyntheticLambda0;",
        "Landroidx/compose/material/ColorsKt\$\$ExternalSyntheticLambda0;",
        "Lkotlin/coroutines/jvm/internal/ContinuationImpl;",
    ),
)

private val DeferredStartListeningFingerprint = Fingerprint(
    definingClass = "Lproton/android/pass/telemetry/impl/DeferredTelemetryManagerImpl;",
    name = "startListening",
    returnType = "V",
    parameters = listOf(
        "Lproton/android/pass/telemetry/impl/TelemetryManagerImpl\$startListening\$2\$1\$\$ExternalSyntheticLambda0;",
        "Landroidx/compose/material/ColorsKt\$\$ExternalSyntheticLambda0;",
        "Lkotlin/coroutines/jvm/internal/ContinuationImpl;",
    ),
)

private val LiveRepositorySendEventFingerprint = Fingerprint(
    definingClass = "Lproton/android/pass/data/impl/repositories/LiveTelemetryRepositoryImpl;",
    name = "sendEvent",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Lme/proton/core/domain/entity/UserId;",
        "Lproton/android/pass/telemetry/api/TelemetryEvent\$LiveTelemetryEvent;",
        "Lkotlin/coroutines/jvm/internal/ContinuationImpl;",
    ),
)

private val LiveRepositorySendGrowthEventFingerprint = Fingerprint(
    definingClass = "Lproton/android/pass/data/impl/repositories/LiveTelemetryRepositoryImpl;",
    name = "sendGrowthEvent",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Lproton/android/pass/telemetry/api/TelemetryEvent\$LiveTelemetryGrowthEvent;",
        "Lkotlin/coroutines/jvm/internal/ContinuationImpl;",
    ),
)

@Suppress("unused")
val protonPassSuppressTelemetryPatch = bytecodePatch(
    name = "Suppress telemetry",
    description = "Disables Proton Pass telemetry event dispatch, listeners and repository upload entry points.",
    default = false,
) {
    compatibleWith(PROTON_PASS_COMPATIBILITY, PROTON_PASS_FDROID_COMPATIBILITY)

    execute {
        SendEventFingerprint.method.apply {
            clearBody()
            addInstructions(0, "return-void")
        }

        listOf(LiveStartListeningFingerprint, DeferredStartListeningFingerprint).forEach { fingerprint ->
            fingerprint.methodOrNull?.apply {
                clearBody()
                addInstructions(0, "return-void")
            }
        }

        listOf(
            LiveRepositorySendEventFingerprint,
            LiveRepositorySendGrowthEventFingerprint,
        ).forEach { fingerprint ->
            fingerprint.methodOrNull?.apply {
                ensureRegisters(1)
                clearBody()
                addInstructions(0, "sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;\nreturn-object v0")
            }
        }
    }
}
