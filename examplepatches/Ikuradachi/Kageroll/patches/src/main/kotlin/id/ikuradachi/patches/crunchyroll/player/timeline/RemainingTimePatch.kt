package id.ikuradachi.patches.crunchyroll.player.timeline

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

private const val REMAINING_TIME_HELPER_CLASS =
    "Lid/ikuradachi/kageroll/extension/crunchyroll/RemainingTimeHelper;"

@Suppress("unused")
val remainingTimePatch = bytecodePatch(
    name = "Remaining time toggle",
    description = "Allows tapping the player timestamp or duration to toggle between elapsed time and remaining time (-MM:SS).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    category("Player")
    extendWith("extensions/extension.mpe")

    val defaultShowRemaining = booleanOption(
        key = "defaultShowRemaining",
        default = false,
        title = "Start in remaining time mode",
        description = "Displays remaining time (-MM:SS) by default before tapping the timestamp.",
    )

    execute {
        val defaultFlag = if (defaultShowRemaining.value == true) 1 else 0
        RemainingTimeDefaultFingerprint.matchAll(1..1).single().method.addInstructions(
            0,
            """
                const/4 v0, 0x$defaultFlag
                return v0
            """.trimIndent(),
        )

        // 1. Attach click listeners on @id/current_time (0x7f0b02fd) and @id/video_duration (0x7f0b0b89).
        val layoutMatch = PlayerTimelineLayoutInitFingerprint.matchAll(1..1).single()
        val layoutMethod = layoutMatch.method
        val layoutInstructions = layoutMethod.implementation!!.instructions
        val currentTimeLiteralIdx = layoutMatch.instructionMatches[1].index
        val durationLiteralIdx = layoutMatch.instructionMatches[2].index

        val currentTimeReg = (currentTimeLiteralIdx + 1 until minOf(currentTimeLiteralIdx + 8, layoutInstructions.size))
            .firstOrNull { layoutInstructions[it].opcode == Opcode.CHECK_CAST }
            ?.let { (layoutInstructions[it] as OneRegisterInstruction).registerA }
            ?: error("Failed to resolve @id/current_time TextView register in PlayerTimelineLayout.<init>")

        val durationReg = (durationLiteralIdx + 1 until minOf(durationLiteralIdx + 8, layoutInstructions.size))
            .firstOrNull { layoutInstructions[it].opcode == Opcode.CHECK_CAST }
            ?.let { (layoutInstructions[it] as OneRegisterInstruction).registerA }
            ?: error("Failed to resolve @id/video_duration TextView register in PlayerTimelineLayout.<init>")

        check(currentTimeReg in 0..15 && durationReg in 0..15) {
            "TextView registers out of range in PlayerTimelineLayout.<init>: v$currentTimeReg, v$durationReg"
        }

        val returnVoidIdx = layoutInstructions.indexOfFirst { it.opcode == Opcode.RETURN_VOID }
        check(returnVoidIdx > durationLiteralIdx) {
            "Failed to locate RETURN_VOID in PlayerTimelineLayout.<init>"
        }

        layoutMethod.addInstructions(
            returnVoidIdx,
            "invoke-static {p0, v$currentTimeReg, v$durationReg}, $REMAINING_TIME_HELPER_CLASS->attach(Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;)V",
        )

        // 2. Hook n10.j.w5(int) right after elapsed string formatting to swap in -MM:SS when active.
        val updateMatch = PlayerTimelineUpdateTimeFingerprint.matchAll(1..1).single()
        val updateMethod = updateMatch.method
        val updateImpl = updateMethod.implementation!!
        check(updateImpl.registerCount >= 7) {
            "Unexpected register count in n10.j.w5: ${updateImpl.registerCount}"
        }
        val instructions = updateImpl.instructions

        val formatInvokeIdx = instructions.indexOfFirst { instr ->
            if (instr.opcode != Opcode.INVOKE_VIRTUAL) return@indexOfFirst false
            val ref = (instr as ReferenceInstruction).reference as MethodReference
            ref.returnType == "Ljava/lang/String;" &&
                ref.parameterTypes.map { it.toString() } == listOf("I")
        }
        check(formatInvokeIdx >= 0 && formatInvokeIdx + 2 < instructions.size) {
            "Failed to locate time formatter call in n10.j.w5"
        }

        val formatMethodRef = (instructions[formatInvokeIdx] as ReferenceInstruction).reference as MethodReference
        val formatMoveResult = instructions[formatInvokeIdx + 1]
        check(formatMoveResult.opcode == Opcode.MOVE_RESULT_OBJECT) {
            "Expected MOVE_RESULT_OBJECT after formatter call in n10.j.w5"
        }
        val textReg = (formatMoveResult as OneRegisterInstruction).registerA

        val viewGetIdx = (0 until formatInvokeIdx).lastOrNull { idx ->
            instructions[idx].opcode == Opcode.CHECK_CAST
        } ?: error("Failed to locate view CHECK_CAST in n10.j.w5")
        val viewReg = (instructions[viewGetIdx] as OneRegisterInstruction).registerA

        val formatterGetIdx = (viewGetIdx + 1 until formatInvokeIdx).firstOrNull { idx ->
            instructions[idx].opcode == Opcode.IGET_OBJECT &&
                ((instructions[idx] as ReferenceInstruction).reference as FieldReference).type ==
                formatMethodRef.definingClass
        } ?: error("Failed to locate formatter IGET_OBJECT in n10.j.w5")
        val formatterReg = (instructions[formatterGetIdx] as TwoRegisterInstruction).registerA

        val durationFieldRef = (formatInvokeIdx + 2 until updateMatch.instructionMatches[0].index)
            .firstOrNull { idx ->
                val instr = instructions[idx]
                instr.opcode == Opcode.IGET &&
                    ((instr as ReferenceInstruction).reference as FieldReference).type == "I"
            }
            ?.let { (instructions[it] as ReferenceInstruction).reference as FieldReference }
            ?: error("Failed to locate duration int field in n10.j.w5")

        val scratchReg = (0..15).first { r ->
            r != viewReg && r != formatterReg && r != textReg && r < 5
        }
        check(
            viewReg in 0..15 &&
                formatterReg in 0..15 &&
                textReg in 0..15 &&
                scratchReg in 0..15,
        ) {
            "Registers out of range in n10.j.w5: view=v$viewReg, fmt=v$formatterReg, text=v$textReg"
        }

        val resumeInstr = instructions[formatInvokeIdx + 2]
        updateMethod.addInstructionsWithLabels(
            formatInvokeIdx + 2,
            """
                const-string v$scratchReg, "${updateMethod.name}"
                invoke-static {v$viewReg, p0, p1, v$scratchReg}, $REMAINING_TIME_HELPER_CLASS->recordTick(Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/String;)Z
                move-result v$scratchReg
                if-eqz v$scratchReg, :elapsed_time
                iget v$scratchReg, p0, $durationFieldRef
                if-lez v$scratchReg, :elapsed_time
                sub-int/2addr v$scratchReg, p1
                if-gez v$scratchReg, :non_negative_remaining
                const/4 v$scratchReg, 0x0
                :non_negative_remaining
                invoke-virtual {v$formatterReg, v$scratchReg}, $formatMethodRef
                move-result-object v$textReg
                invoke-static {v$textReg}, $REMAINING_TIME_HELPER_CLASS->prefixMinus(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$textReg
            """.trimIndent(),
            ExternalLabel("elapsed_time", resumeInstr),
        )
    }
}
