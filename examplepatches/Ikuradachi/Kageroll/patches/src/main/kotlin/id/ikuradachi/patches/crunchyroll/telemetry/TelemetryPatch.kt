package id.ikuradachi.patches.crunchyroll.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Blocks Segment and Mux events, disables periodic telemetry loops and flush timers (Mux 1000ms playback poll, Segment 30s flush, Braze push flush alarms, Datadog upload thread), disables Firebase Analytics after consent updates, denies automatic Crashlytics uploads and selects disabled Datadog setup.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)

    execute {
        // shortcut: SDK startup and existing queues remain, audit those paths before claiming full removal.
        SegmentPayloadAdmissionFingerprint.matchAll(1..1).single().method.addInstruction(0, "return-void")

        MuxEventAdmissionFingerprint.matchAll(1..1).single().method.addInstruction(0, "return-void")

        run {
            val match = FirebaseAnalyticsCollectionObserverFingerprint.matchAll(1..1).single()
            val result = match.instructionMatches[1]
            val register = result.getInstruction<OneRegisterInstruction>().registerA
            val setter = match.instructionMatches.last().getInstruction<Instruction35c>()
            check(register in 0..15 && setter.registerCount == 2 && setter.registerD == register) {
                "Unexpected Firebase Analytics collection argument"
            }
            // shortcut: observer runs after Firebase startup, verify an earlier control before claiming startup suppression.
            match.method.replaceInstruction(result.index, "const/4 v$register, 0x0")
        }

        run {
            val match = CrashlyticsAutomaticPermissionFingerprint.matchAll(1..1).single()
            val method = match.method
            val implementation = requireNotNull(method.implementation)
            val instructions = implementation.instructions
            val log = match.instructionMatches.last()
            val call = log.getInstruction<Instruction35c>()
            check(
                implementation.registerCount == 2 && instructions.first().opcode == Opcode.MONITOR_ENTER &&
                    call.registerCount == 2 && call.registerC == 1 && call.registerD == 0 &&
                    instructions[log.index + 1].opcode == Opcode.MONITOR_EXIT &&
                    instructions[log.index + 2].opcode == Opcode.RETURN &&
                    (instructions[log.index + 2] as OneRegisterInstruction).registerA == 0,
            ) { "Unexpected Crashlytics automatic collection control flow" }
            // Replace the labelled slot so both preference/default branches execute the false assignment.
            method.replaceInstruction(log.index, "const/4 v0, 0x0")
            method.addInstructions(
                log.index + 1,
                "invoke-direct {p0, v0}, Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;->logDataCollectionState(Z)V",
            )
        }

        run {
            val match = DatadogSetupFingerprint.matchAll(1..1).single()
            val implementation = requireNotNull(match.method.implementation)
            val instructions = implementation.instructions
            val condition = match.instructionMatches[1]
            val register = condition.getInstruction<OneRegisterInstruction>().registerA
            val branch = instructions[match.instructionMatches[2].index] as BuilderInstruction21t
            val target = branch.target.location.index
            val targetOpcodes = instructions.drop(target).take(6).map { it.opcode }
            val validBranch = targetOpcodes == listOf(
                Opcode.CONST_4, Opcode.CONST_4, Opcode.NEW_INSTANCE,
                Opcode.INVOKE_DIRECT, Opcode.MOVE_OBJECT, Opcode.SPUT_OBJECT,
            ) || targetOpcodes.take(5) == listOf(
                Opcode.CONST_16, Opcode.NEW_INSTANCE,
                Opcode.INVOKE_DIRECT, Opcode.MOVE_OBJECT, Opcode.SPUT_OBJECT,
            ) || targetOpcodes.take(4) == listOf(
                Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT,
                Opcode.MOVE_OBJECT, Opcode.SPUT_OBJECT,
            )
            check(
                implementation.registerCount in setOf(38, 63) && register in 0..15 && branch.registerA == register && validBranch,
            ) { "Unexpected Datadog disabled branch" }
            match.method.replaceInstruction(condition.index, "const/4 v$register, 0x0")
        }

        // Target 12: Mux 1000ms fixed delay scheduled polling loop
        val muxMatch = MuxEventQueue1000msTimerFingerprint.matchAll(1..1).single()
        val scheduleCall = muxMatch.instructionMatches.last()
        muxMatch.method.addInstruction(scheduleCall.index, "return-void")

        // Target 13: Segment 30-second recurring flush gate (force false)
        SegmentShouldFlushFingerprint.matchAll(1..1).single().method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )

        // Target 14: Braze AlarmManager-scheduled push delivery flush receiver
        BrazeFlushReceiverFingerprint.matchAll(1..1).single().method.addInstruction(0, "return-void")

        // Target 15: Datadog continuous in-memory upload thread starter
        DatadogUploadSchedulerStartFingerprint.matchAll(1..1).single().method.addInstruction(0, "return-void")
    }
}
