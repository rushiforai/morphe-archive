/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.protonvpn.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.protonvpn.shared.PROTON_VPN
import app.morphe.patches.protonvpn.shared.PROTON_VPN_FOSS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val PAYMENT_FFI = "Lme/proton/android/payment/core/PaymentFfi;"
private const val OBSERVABILITY_DOMAIN = "Lme/proton/core/observability/domain/d;"
private const val METRIC_EVENT = "Lme/proton/core/observability/data/api/request/MetricEvent;"
private const val KOTLIN_UNIT = "Lkotlin/Unit;"

private object KotlinUnitToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("kotlin.Unit"),
)

private object VpnTelemetryEventFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf("event added, total: "),
)

private object CoreTelemetryEnqueueFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf("core.telemetry.enqueue"),
)

private object ObservabilityUploadFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/util/List;", "L"),
    filters = listOf(
        fieldAccess(definingClass = METRIC_EVENT, opcode = Opcode.SGET_OBJECT),
    ),
)

private object ObservabilityEnabledFingerprint : Fingerprint(
    definingClass = OBSERVABILITY_DOMAIN,
    filters = listOf(
        methodCall(
            definingClass = "Landroid/content/res/Resources;",
            name = "getBoolean",
        ),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ),
)

private object PaymentsObservabilityWorkerFingerprint : Fingerprint(
    name = "runObservabilityWorker",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    custom = { method, classDef ->
        classDef.type == PAYMENT_FFI && method.implementation != null
    },
)

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable Telemetry",
    description = "Forces the observability feature flag off and short-circuits telemetry enqueue, upload, and the payments observability worker.",
) {
    compatibleWith(PROTON_VPN, PROTON_VPN_FOSS)

    execute {
        val unitClasses = KotlinUnitToStringFingerprint.matchAll()
            .map { it.originalClassDef }
            .distinctBy { it.type }

        val unit = unitClasses.singleOrNull { it.type != KOTLIN_UNIT }
            ?: unitClasses.singleOrNull()
            ?: throw PatchException(
                "ProtonVPN: kotlin.Unit toString class not found (version drift?)",
            )

        val unitField = unit.staticFields.singleOrNull { it.type == unit.type }
            ?: throw PatchException(
                "ProtonVPN: ${unit.type} has no self-typed static instance field (version drift?)",
            )

        val returnUnit = """
            sget-object p0, ${unit.type}->${unitField.name}:${unit.type}
            return-object p0
        """.trimIndent()

        var flagSites = 0

        ObservabilityEnabledFingerprint.matchAll().forEach { match ->
            val moveResult = match.instructionMatches.last()
            val register = moveResult.getInstruction<OneRegisterInstruction>().registerA

            match.method.addInstructions(
                moveResult.index + 1,
                "const/16 v$register, 0x0",
            )
            flagSites++
        }

        if (flagSites == 0) {
            throw PatchException(
                "ProtonVPN: $OBSERVABILITY_DOMAIN Resources.getBoolean + MOVE_RESULT not found (version drift?)",
            )
        }

        VpnTelemetryEventFingerprint.match().method.addInstructions(0, returnUnit)
        CoreTelemetryEnqueueFingerprint.match().method.addInstructions(0, returnUnit)
        ObservabilityUploadFingerprint.match().method.addInstructions(0, returnUnit)
        PaymentsObservabilityWorkerFingerprint.match().method.addInstructions(0, returnUnit)

        println("[protonvpn] telemetry: unit=${unit.type} flagSites=$flagSites pipelines=4")
    }
}
