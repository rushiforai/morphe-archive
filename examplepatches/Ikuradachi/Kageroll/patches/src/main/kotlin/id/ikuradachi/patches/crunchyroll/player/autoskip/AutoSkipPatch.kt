package id.ikuradachi.patches.crunchyroll.player.autoskip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction23x
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

private const val MASK_INTRO = 1
private const val MASK_RECAP = 1 shl 1
private const val MASK_CREDITS = 1 shl 2
private const val MASK_PREVIEW = 1 shl 3
private const val MASK_PROMO = 1 shl 4

private data class SkipContext(
    val videoSkipEventClass: String,
    val endMsField: FieldReference,
    val skipEventTypeField: FieldReference,
    val skipEventTypeEnumClass: String,
    val videoMetaContentClass: String,
    val videoIdField: FieldReference,
)

@Suppress("unused")
val autoSkipPatch = bytecodePatch(
    name = "Auto-skip segments",
    description = "Automatically skips intros, recaps, credits, previews, or promos in the video player.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    category("Player")

    extendWith("extensions/extension.mpe")

    val skipIntro = booleanOption(
        key = "skipIntro",
        default = true,
        title = "Auto-skip intros",
        description = "Automatically skip opening/intro segments.",
    )
    val skipRecap = booleanOption(
        key = "skipRecap",
        default = true,
        title = "Auto-skip recaps",
        description = "Automatically skip episode recap segments.",
    )
    val skipCredits = booleanOption(
        key = "skipCredits",
        default = false,
        title = "Auto-skip credits",
        description = "Automatically skip ending credits (preserves post-credits scenes when present).",
    )
    val skipPreview = booleanOption(
        key = "skipPreview",
        default = false,
        title = "Auto-skip next-episode previews",
        description = "Automatically skip next-episode preview segments.",
    )
    val skipPromo = booleanOption(
        key = "skipPromo",
        default = false,
        title = "Auto-skip promos",
        description = "Automatically skip promotional segments.",
    )

    execute {
        var segmentMask = 0
        if (skipIntro.value == true) segmentMask = segmentMask or MASK_INTRO
        if (skipRecap.value == true) segmentMask = segmentMask or MASK_RECAP
        if (skipCredits.value == true) segmentMask = segmentMask or MASK_CREDITS
        if (skipPreview.value == true) segmentMask = segmentMask or MASK_PREVIEW
        if (skipPromo.value == true) segmentMask = segmentMask or MASK_PROMO

        val maskMethod = AutoSkipHelperMaskFingerprint.matchAll(1..1).single().method
        val maskImpl = requireNotNull(maskMethod.implementation) {
            "Missing implementation for AutoSkipHelper.getEnabledSegmentMask"
        }
        check(maskImpl.registerCount >= 1) {
            "Unexpected register count in AutoSkipHelper.getEnabledSegmentMask: ${maskImpl.registerCount}"
        }
        maskMethod.addInstructions(
            0,
            """
                const/16 v0, 0x${segmentMask.toString(16)}
                return v0
            """.trimIndent(),
        )

        val skipEventMatch = VideoSkipEventToStringFingerprint.matchAll(1..1).single()
        val endMsField = skipEventMatch.instructionMatches[2].getFieldAccessed()
        val skipEventTypeField = skipEventMatch.instructionMatches[5].getFieldAccessed()

        val metaContentMatch = VideoMetaContentToStringFingerprint.matchAll(1..1).single()
        val videoIdField = metaContentMatch.instructionMatches[1].getFieldAccessed()

        val ctx = SkipContext(
            videoSkipEventClass = skipEventMatch.classDef.type,
            endMsField = endMsField,
            skipEventTypeField = skipEventTypeField,
            skipEventTypeEnumClass = skipEventTypeField.type,
            videoMetaContentClass = metaContentMatch.classDef.type,
            videoIdField = videoIdField,
        )

        patchFlowMapEmitter(
            viewModelName = "SkipSegmentButtonViewModelImpl",
            onClickFingerprint = SkipSegmentOnClickFingerprint,
            ctx = ctx,
        )
        patchFlowMapEmitter(
            viewModelName = "FloatingPlayerPlaybackController",
            onClickFingerprint = FloatingPlayerOnClickFingerprint,
            ctx = ctx,
        )
    }
}

private fun BytecodePatchContext.patchFlowMapEmitter(
    viewModelName: String,
    onClickFingerprint: Fingerprint,
    ctx: SkipContext,
) {
    val onClickMatch = onClickFingerprint.matchAll(1..1).single()
    val viewModelClass = onClickMatch.classDef.type
    val onClickMethod = onClickMatch.method
    val playerField = onClickMatch.instructionMatches[0].getFieldAccessed()
    val getStateMethod = onClickMatch.instructionMatches[1].getMethodCalled()
    val getValueMethod = onClickMatch.instructionMatches[3].getMethodCalled()
    val playerStateClass =
        (onClickMatch.instructionMatches[5].instruction as ReferenceInstruction).reference.toString()
    val contentMetadataField = onClickMatch.instructionMatches[6].getFieldAccessed()
    check(contentMetadataField.type == ctx.videoMetaContentClass) {
        "Unexpected content metadata field type in $viewModelName: ${contentMetadataField.type}"
    }

    val emitterMatch = createFlowMapEmitterFingerprint(
        viewModelType = viewModelClass,
        skipEventTypeEnumType = ctx.skipEventTypeEnumClass,
    ).matchAll(1..1).single()

    val method = emitterMatch.method
    val implementation = requireNotNull(method.implementation) {
        "Missing implementation for $viewModelName flow mapper emit"
    }
    check(implementation.tryBlocks.isEmpty()) {
        "Unexpected try blocks in $viewModelName flow mapper emit"
    }

    val instructions = implementation.instructions
    val cmp1Instr = emitterMatch.instructionMatches[1].getInstruction<Instruction23x>()
    val cmp2Match = emitterMatch.instructionMatches[2]
    val cmp2Instr = cmp2Match.getInstruction<Instruction23x>()
    val posReg = cmp1Instr.registerB
    check(cmp2Instr.registerB == posReg) {
        "Mismatched position register in $viewModelName flow mapper emit"
    }

    val cmp2Index = cmp2Match.index
    val skipTypeIgetIndex = emitterMatch.instructionMatches[3].index
    val vmReg = emitterMatch.instructionMatches[4].getInstruction<TwoRegisterInstruction>().registerB
    val emitIndex = emitterMatch.instructionMatches[5].index

    var moveObjectIndex = -1
    for (i in (cmp2Index + 1) until skipTypeIgetIndex) {
        val instr = instructions[i]
        if (instr.opcode == Opcode.CHECK_CAST &&
            (instr as ReferenceInstruction).reference.toString() == ctx.videoSkipEventClass
        ) {
            val prev = instructions[i - 1]
            check(
                prev.opcode == Opcode.MOVE_OBJECT || prev.opcode == Opcode.MOVE_OBJECT_FROM16,
            ) {
                "Expected move-object before check-cast in $viewModelName flow mapper emit"
            }
            check(
                (prev as TwoRegisterInstruction).registerA == (instr as OneRegisterInstruction).registerA,
            ) {
                "Mismatched move/check-cast register in $viewModelName flow mapper emit"
            }
            moveObjectIndex = i - 1
            break
        }
    }
    check(moveObjectIndex in (cmp2Index + 1) until skipTypeIgetIndex) {
        "Failed to locate post-loop check-cast in $viewModelName flow mapper emit"
    }

    val originalMoveInstr = instructions[moveObjectIndex]
    val moveInstr = originalMoveInstr as TwoRegisterInstruction
    val matchReg = moveInstr.registerB

    check(emitIndex >= 2 && emitIndex + 4 < instructions.size) {
        "Unexpected emit instruction position in $viewModelName flow mapper emit"
    }
    val emitStartInstr = instructions[emitIndex - 2]
    check(emitStartInstr.opcode == Opcode.IPUT) {
        "Expected IPUT before downstream emit in $viewModelName"
    }
    val emitInstr = instructions[emitIndex] as FiveRegisterInstruction
    check(emitInstr.registerD == matchReg) {
        "Unexpected emitted value register in $viewModelName"
    }
    val moveResultInstr = instructions[emitIndex + 1] as OneRegisterInstruction
    check(moveResultInstr.opcode == Opcode.MOVE_RESULT_OBJECT) {
        "Expected MOVE_RESULT_OBJECT after downstream emit in $viewModelName"
    }
    val resultReg = moveResultInstr.registerA

    val ifNeIndex = emitIndex + 2
    val ifNeInstr = instructions[ifNeIndex] as TwoRegisterInstruction
    check(ifNeInstr.opcode == Opcode.IF_NE && ifNeInstr.registerA == resultReg) {
        "Expected IF_NE on emit result in $viewModelName"
    }
    val suspendReg = ifNeInstr.registerB

    val returnSuspendInstr = instructions[emitIndex + 3] as OneRegisterInstruction
    check(
        returnSuspendInstr.opcode == Opcode.RETURN_OBJECT && returnSuspendInstr.registerA == suspendReg,
    ) {
        "Expected RETURN_OBJECT COROUTINE_SUSPENDED in $viewModelName"
    }
    val sgetDoneInstr = instructions[emitIndex + 4]
    check(sgetDoneInstr.opcode == Opcode.SGET_OBJECT) {
        "Expected terminal SGET_OBJECT Unit in $viewModelName"
    }
    check(
        instructions[ifNeIndex].location.labels.isEmpty() &&
            instructions[ifNeIndex + 1].location.labels.isEmpty(),
    ) {
        "Unexpected branch labels on post-emit return in $viewModelName"
    }

    check(
        vmReg in 0..15 &&
            matchReg in 0..15 &&
            posReg in 0..14 &&
            resultReg in 0..15 &&
            suspendReg in 0..15,
    ) {
        "Registers out of 4-bit invoke range in $viewModelName"
    }

    val (scratchA, scratchB) = findFreeScratchPair(
        instructions = instructions,
        fromIndex = moveObjectIndex,
        registerCount = implementation.registerCount,
        protectedRegs = setOf(vmReg, matchReg, posReg, posReg + 1, resultReg, suspendReg),
        deadBeforeOverwrite = setOf(posReg, posReg + 1),
    )

    // Apply highest-index edit (post-emit skip execution) before pre-emit check to keep moveObjectIndex valid.
    val onClickMethodRef = "${onClickMethod.definingClass}->${onClickMethod.name}()V"
    method.addInstructionsWithLabels(
        ifNeIndex + 2,
        """
            if-ne v$resultReg, v$suspendReg, :after_emit
            return-object v$suspendReg
            :after_emit
            if-eqz v$matchReg, :done
            invoke-static {v$vmReg}, $AUTO_SKIP_HELPER_CLASS->consumePendingAutoSkip(Ljava/lang/Object;)Z
            move-result v$resultReg
            if-eqz v$resultReg, :done
            invoke-virtual {v$vmReg}, $onClickMethodRef
        """.trimIndent(),
        ExternalLabel("done", sgetDoneInstr),
    )
    method.removeInstructions(ifNeIndex, 2)

    val existingMoveLabels = originalMoveInstr.location.labels.toList()
    method.addInstructionsWithLabels(
        moveObjectIndex,
        """
            if-eqz v$matchReg, :normal_flow
            check-cast v$matchReg, ${ctx.videoSkipEventClass}
            iget-wide v$scratchA, v$matchReg, ${ctx.endMsField}
            sub-long v$posReg, v$scratchA, v$posReg
            iget-object v$scratchA, v$vmReg, $playerField
            invoke-interface {v$scratchA}, $getStateMethod
            move-result-object v$scratchA
            invoke-interface {v$scratchA}, $getValueMethod
            move-result-object v$scratchA
            check-cast v$scratchA, $playerStateClass
            if-eqz v$scratchA, :null_video_id
            iget-object v$scratchA, v$scratchA, $contentMetadataField
            if-eqz v$scratchA, :null_video_id
            iget-object v$scratchA, v$scratchA, ${ctx.videoIdField}
            goto :got_video_id
            :null_video_id
            const/4 v$scratchA, 0x0
            :got_video_id
            iget-object v$scratchB, v$matchReg, ${ctx.skipEventTypeField}
            invoke-virtual {v$scratchB}, Ljava/lang/Enum;->name()Ljava/lang/String;
            move-result-object v$scratchB
            invoke-static {v$vmReg, v$scratchA, v$scratchB, v$posReg, v${posReg + 1}}, $AUTO_SKIP_HELPER_CLASS->tryPrepareAutoSkip(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;J)Z
            move-result v$scratchA
            if-nez v$scratchA, :emit_only
        """.trimIndent(),
        ExternalLabel("emit_only", emitStartInstr),
        ExternalLabel("normal_flow", originalMoveInstr),
    )

    // Move the loop's matched-segment jump label(s) onto the injected pre-emit entry instruction.
    val firstInsertedLocation = method.implementation!!.instructions[moveObjectIndex].location
    for (label in existingMoveLabels) {
        check(originalMoveInstr.location.labels.remove(label)) {
            "Failed to detach label from original move-object instruction in $viewModelName"
        }
        firstInsertedLocation.labels.add(label)
    }
}

private fun findFreeScratchPair(
    instructions: List<BuilderInstruction>,
    fromIndex: Int,
    registerCount: Int,
    protectedRegs: Set<Int>,
    deadBeforeOverwrite: Set<Int> = emptySet(),
): Pair<Int, Int> {
    val size = instructions.size
    val liveIn = Array(size) { mutableSetOf<Int>() }
    val uses = Array(size) { mutableSetOf<Int>() }
    val defs = Array(size) { mutableSetOf<Int>() }
    val succs = Array(size) { emptyList<Int>() }

    for (i in fromIndex until size) {
        val instr = instructions[i]
        val op = instr.opcode
        val u = uses[i]
        val d = defs[i]

        when (instr) {
            is FiveRegisterInstruction -> {
                val regs = intArrayOf(
                    instr.registerC,
                    instr.registerD,
                    instr.registerE,
                    instr.registerF,
                    instr.registerG,
                )
                for (r in 0 until instr.registerCount) u += regs[r]
            }
            is RegisterRangeInstruction -> {
                for (r in instr.startRegister until instr.startRegister + instr.registerCount) u += r
            }
            is ThreeRegisterInstruction -> {
                if (op.setsRegister()) {
                    d += instr.registerA
                    if (op.setsWideRegister()) d += instr.registerA + 1
                    u += instr.registerB
                    u += instr.registerC
                    if (isWideBinarySource(op)) {
                        u += instr.registerB + 1
                        u += instr.registerC + 1
                    }
                } else {
                    u += instr.registerA
                    if (op == Opcode.APUT_WIDE) u += instr.registerA + 1
                    u += instr.registerB
                    u += instr.registerC
                }
            }
            is TwoRegisterInstruction -> {
                if (op.setsRegister()) {
                    if (op.name.endsWith("_2ADDR")) {
                        u += instr.registerA
                        u += instr.registerB
                        if (op.setsWideRegister()) {
                            u += instr.registerA + 1
                            u += instr.registerB + 1
                        }
                    } else {
                        u += instr.registerB
                        if (isWideUnaryOrMoveSource(op)) u += instr.registerB + 1
                    }
                    d += instr.registerA
                    if (op.setsWideRegister()) d += instr.registerA + 1
                } else {
                    u += instr.registerA
                    if (op == Opcode.IPUT_WIDE) u += instr.registerA + 1
                    u += instr.registerB
                }
            }
            is OneRegisterInstruction -> {
                if (op == Opcode.CHECK_CAST) {
                    u += instr.registerA
                    d += instr.registerA
                } else if (op.setsRegister()) {
                    d += instr.registerA
                    if (op.setsWideRegister()) d += instr.registerA + 1
                } else {
                    u += instr.registerA
                    if (op == Opcode.RETURN_WIDE || op == Opcode.SPUT_WIDE) u += instr.registerA + 1
                }
            }
        }

        succs[i] = when {
            op == Opcode.RETURN_VOID ||
                op == Opcode.RETURN ||
                op == Opcode.RETURN_WIDE ||
                op == Opcode.RETURN_OBJECT ||
                op == Opcode.THROW -> emptyList()
            op == Opcode.GOTO || op == Opcode.GOTO_16 || op == Opcode.GOTO_32 ->
                listOf((instr as BuilderOffsetInstruction).target.location.index)
            instr is BuilderOffsetInstruction ->
                listOfNotNull(
                    (i + 1).takeIf { it < size },
                    instr.target.location.index,
                )
            else -> listOfNotNull((i + 1).takeIf { it < size })
        }
    }

    var changed = true
    while (changed) {
        changed = false
        for (i in (size - 1) downTo fromIndex) {
            val newLive = mutableSetOf<Int>()
            for (s in succs[i]) {
                newLive += liveIn[s]
            }
            newLive -= defs[i]
            newLive += uses[i]
            if (newLive != liveIn[i]) {
                liveIn[i] = newLive
                changed = true
            }
        }
    }

    val liveAtEntry = liveIn[fromIndex]
    val liveOverwriteConflicts = deadBeforeOverwrite.filter { it in liveAtEntry }
    check(liveOverwriteConflicts.isEmpty()) {
        "Registers $liveOverwriteConflicts are still live at index $fromIndex and cannot be overwritten (live=$liveAtEntry)"
    }
    val maxReg = minOf(registerCount - 1, 15)
    for (r in 0 until maxReg) {
        if (r !in liveAtEntry &&
            (r + 1) !in liveAtEntry &&
            r !in protectedRegs &&
            (r + 1) !in protectedRegs
        ) {
            return r to (r + 1)
        }
    }
    error("No free adjacent scratch register pair available (registerCount=$registerCount, live=$liveAtEntry)")
}

private fun isWideBinarySource(op: Opcode): Boolean =
    op.name.contains("_LONG") || op.name.contains("_DOUBLE") || op == Opcode.CMP_LONG

private fun isWideUnaryOrMoveSource(op: Opcode): Boolean =
    op == Opcode.MOVE_WIDE ||
        op == Opcode.MOVE_WIDE_FROM16 ||
        op == Opcode.MOVE_WIDE_16 ||
        op.name.startsWith("LONG_TO_") ||
        op.name.startsWith("DOUBLE_TO_") ||
        op == Opcode.NEG_LONG ||
        op == Opcode.NOT_LONG ||
        op == Opcode.NEG_DOUBLE
