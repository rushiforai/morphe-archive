package app.template.patches.myfitnesspal.misc.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MYFITNESSPAL
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val disableDatadogTelemetryPatch = bytecodePatch(
    name = "Disable Datadog telemetry",
    description = "Disables Datadog monitoring.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MYFITNESSPAL)

    execute {
        // The start decision always returns Skip(FLAG_DISABLED), the app's own result when the
        // remote flag is off, so the Datadog core is never initialized. Every first launch
        // already takes a Skip path (no cached flag treatment yet), and the app's Datadog users
        // (consent updates, Compose navigation tracking) handle the missing core.
        val decision = DatadogRumStartDecisionFingerprint
        val skip = (
            decision.method
                .getInstruction<ReferenceInstruction>(decision.instructionMatches.last().index)
                .reference as MethodReference
            ).definingClass
        if (skip == RUM_START_DECISION) {
            throw PatchException("Datadog start decision builds an unexpected Skip type: $skip")
        }
        decision.method.addInstructionsChecked(
            0,
            """
                new-instance v0, $skip
                sget-object v1, $SKIP_REASON->FLAG_DISABLED:$SKIP_REASON
                invoke-direct {v0, v1}, $skip-><init>($SKIP_REASON)V
                return-object v0
            """.trimIndent(),
        )
    }
}
