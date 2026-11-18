package id.ikuradachi.patches.crunchyroll.player.quality

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

private const val WIDTH_1080P = 0x780
private const val HEIGHT_1080P = 0x438

private data class DownloadQualityContext(
    val syncQualityOptionImplType: String,
    val syncQualityHeightField: FieldReference,
    val syncQualityStoreType: String,
    val readSyncQualityMethod: MethodReference,
)

@Suppress("unused")
val downloadQualityPatch = bytecodePatch(
    name = "1080p download quality",
    description = "Upgrades the High offline download quality tier to 1080p and selects the single best matching video track.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    category("Player")
    extendWith("extensions/extension.mpe")

    execute {
        val ctx = patchHighDownloadOption()
        patchDownloadHelperBuilder(ctx)
        patchDownloadHelperOnPrepared(ctx)
    }
}

private fun BytecodePatchContext.patchHighDownloadOption(): DownloadQualityContext {
    val propType = DownloadQualityPropertyCtorFingerprint.matchAll(1..1).single().classDef.type
    val highPropType = createDownloadQualityPropertyHighClinitFingerprint(propType)
        .matchAll(1..1).single().classDef.type

    val highOptionMatch = createSyncQualityHighOptionClinitFingerprint(highPropType)
        .matchAll(1..1).single()
    val clinit = highOptionMatch.method
    val instructions = clinit.implementation!!.instructions

    val widthIdx = highOptionMatch.instructionMatches[1].index
    val heightIdx = highOptionMatch.instructionMatches[2].index
    val ctorCall = highOptionMatch.instructionMatches[3].getMethodCalled()

    val widthReg = (instructions[widthIdx] as OneRegisterInstruction).registerA
    val heightReg = (instructions[heightIdx] as OneRegisterInstruction).registerA
    clinit.replaceInstruction(widthIdx, "const/16 v$widthReg, 0x${WIDTH_1080P.toString(16)}")
    clinit.replaceInstruction(heightIdx, "const/16 v$heightReg, 0x${HEIGHT_1080P.toString(16)}")

    val syncQualityOptionImplType = requireNotNull(highOptionMatch.classDef.superclass) {
        "Missing superclass on ${highOptionMatch.classDef.type}"
    }
    check(ctorCall.definingClass == syncQualityOptionImplType) {
        "Unexpected option constructor definingClass: ${ctorCall.definingClass} != $syncQualityOptionImplType"
    }

    val implClass = classDefBy(syncQualityOptionImplType)
    val syncQualityInterfaceType = implClass.interfaces.single()
    val ctorImpl = implClass.methods.single {
        it.name == "<init>" && it.parameterTypes.size == 5
    }
    val ctorIputs = ctorImpl.implementation!!.instructions
        .filter { it.opcode == Opcode.IPUT || it.opcode == Opcode.IPUT_OBJECT }
        .map { (it as ReferenceInstruction).reference as FieldReference }
    check(ctorIputs.size == 5 && ctorIputs[4].type == "I") {
        "Unexpected field assignments in $syncQualityOptionImplType.<init>: $ctorIputs"
    }
    val syncQualityHeightField = ctorIputs[4]

    val syncQualityStoreType = SyncQualityStoreConstructorFingerprint.matchAll(1..1)
        .single().classDef.type
    val readSyncQualityMethod = createSyncQualityStoreReadFingerprint(
        storeClassType = syncQualityStoreType,
        syncQualityInterfaceType = syncQualityInterfaceType,
    ).matchAll(1..1).single().originalMethod

    return DownloadQualityContext(
        syncQualityOptionImplType = syncQualityOptionImplType,
        syncQualityHeightField = syncQualityHeightField,
        syncQualityStoreType = syncQualityStoreType,
        readSyncQualityMethod = readSyncQualityMethod,
    )
}

private fun BytecodePatchContext.patchDownloadHelperBuilder(ctx: DownloadQualityContext) {
    val match = createDownloadHelperBuilderFingerprint(
        syncQualityStoreType = ctx.syncQualityStoreType,
        readSyncQualityMethodName = ctx.readSyncQualityMethod.name,
    ).matchAll(1..1).single()

    val method = match.method
    val instructions = method.implementation!!.instructions

    val minSizeIdx = match.instructionMatches[3].index
    val maxSizeIdx = match.instructionMatches[6].index
    val minCall = instructions[minSizeIdx] as FiveRegisterInstruction
    val maxCall = instructions[maxSizeIdx] as FiveRegisterInstruction

    val minWidthReg = minCall.registerD
    val minHeightReg = minCall.registerE
    val maxWidthReg = maxCall.registerD

    check(
        minWidthReg != minCall.registerC &&
            minHeightReg != minCall.registerC &&
            minWidthReg != minHeightReg &&
            maxWidthReg != maxCall.registerC &&
            maxWidthReg != maxCall.registerE,
    ) {
        "Unexpected register overlap in ${method.definingClass}.${method.name}"
    }

    // Apply highest-index edit first so minSizeIdx remains valid.
    method.addInstructions(maxSizeIdx, "const v$maxWidthReg, 0x7fffffff")
    method.addInstructions(
        minSizeIdx,
        """
            const/4 v$minWidthReg, 0x0
            const/4 v$minHeightReg, 0x0
        """.trimIndent(),
    )
}

private fun BytecodePatchContext.patchDownloadHelperOnPrepared(ctx: DownloadQualityContext) {
    val formatMatch = FormatToStringFingerprint.matchAll(1..1).single()
    val formatType = formatMatch.classDef.type
    val formatBitrateField = formatMatch.instructionMatches[1].getFieldAccessed()
    val formatWidthField = formatMatch.instructionMatches[3].getFieldAccessed()
    val formatHeightField = formatMatch.instructionMatches[4].getFieldAccessed()

    val match = DownloadHelperOnPreparedFingerprint.matchAll(1..1).single()
    val method = match.method
    val implementation = requireNotNull(method.implementation)
    val instructions = implementation.instructions

    val downloadHelperType = method.parameterTypes.single().toString()
    val mappedInfoStrIdx = match.instructionMatches[0].index
    val trackGroupsStrIdx = match.instructionMatches[1].index

    check(mappedInfoStrIdx >= 2 && trackGroupsStrIdx >= 2) {
        "Unexpected instruction positions in ${method.definingClass}.${method.name}"
    }

    val mappedInfoAget = instructions[mappedInfoStrIdx - 1]
    val mappedInfoIget = instructions[mappedInfoStrIdx - 2]
    check(
        mappedInfoAget.opcode == Opcode.AGET_OBJECT &&
            mappedInfoIget.opcode == Opcode.IGET_OBJECT,
    ) {
        "Unexpected MappedTrackInfo lookup in ${method.definingClass}.${method.name}"
    }
    val mappedTrackInfoReg = (mappedInfoAget as ThreeRegisterInstruction).registerA
    val periodIndexReg = mappedInfoAget.registerC
    val downloadHelperReg = (mappedInfoIget as TwoRegisterInstruction).registerB
    val mappedTrackInfoType = ((mappedInfoIget as ReferenceInstruction).reference as FieldReference)
        .type
        .removePrefix("[")

    val rendererSupportsField = classDefBy(mappedTrackInfoType).fields.single {
        it.type == "[[[I"
    }

    val trackGroupsAget = instructions[trackGroupsStrIdx - 1]
    check(trackGroupsAget.opcode == Opcode.AGET_OBJECT) {
        "Unexpected TrackGroups lookup in ${method.definingClass}.${method.name}"
    }
    val trackGroupArrayReg = (trackGroupsAget as ThreeRegisterInstruction).registerA
    val rendererIndexReg = trackGroupsAget.registerC

    val trackSelectionsField = instructions
        .asSequence()
        .filter { it.opcode == Opcode.IGET_OBJECT }
        .map { (it as ReferenceInstruction).reference as FieldReference }
        .distinct()
        .single {
            it.definingClass == downloadHelperType && it.type == "[[Ljava/util/List;"
        }

    val ifGeIdx = (trackGroupsStrIdx + 1 until instructions.size).first {
        instructions[it].opcode == Opcode.IF_GE
    }
    val ifGeInstr = instructions[ifGeIdx] as TwoRegisterInstruction
    val groupIndexReg = ifGeInstr.registerA
    val groupCountReg = ifGeInstr.registerB

    val trackGroupGetIdx = (ifGeIdx + 1 until minOf(ifGeIdx + 6, instructions.size)).first {
        instructions[it].opcode == Opcode.INVOKE_VIRTUAL &&
            (instructions[it] as FiveRegisterInstruction).registerC == trackGroupArrayReg &&
            (instructions[it] as FiveRegisterInstruction).registerD == groupIndexReg
    }
    val trackGroupGetMethod = (instructions[trackGroupGetIdx] as ReferenceInstruction).reference as MethodReference
    val trackGroupType = trackGroupGetMethod.returnType
    check(instructions[trackGroupGetIdx + 1].opcode == Opcode.MOVE_RESULT_OBJECT) {
        "Expected move-result-object after TrackGroupArray.get"
    }
    val trackGroupFormatsField = classDefBy(trackGroupType).fields.single {
        it.type == "[$formatType"
    }

    val p0Reg = implementation.registerCount - 2
    val thisReg = (0 until mappedInfoStrIdx).firstNotNullOfOrNull { idx ->
        val instr = instructions[idx]
        if ((instr.opcode == Opcode.MOVE_OBJECT || instr.opcode == Opcode.MOVE_OBJECT_FROM16) &&
            (instr as TwoRegisterInstruction).registerB == p0Reg
        ) {
            instr.registerA
        } else {
            null
        }
    } ?: p0Reg

    val onPreparedThisClass = match.classDef
    val exoManagerField = onPreparedThisClass.fields.firstNotNullOf { field ->
        val managerClass = classDefByOrNull(field.type) ?: return@firstNotNullOf null
        val hasProvider = managerClass.fields.any { managerField ->
            classDefByOrNull(managerField.type)?.fields?.any {
                it.type == ctx.syncQualityStoreType
            } == true
        }
        if (hasProvider) field else null
    }
    val exoManagerClass = classDefBy(exoManagerField.type)
    val paramsProviderField = exoManagerClass.fields.single { field ->
        classDefByOrNull(field.type)?.fields?.any { it.type == ctx.syncQualityStoreType } == true
    }
    val syncQualityStoreField = classDefBy(paramsProviderField.type).fields.single {
        it.type == ctx.syncQualityStoreType
    }

    val trackTypeIgetIdx = (trackGroupGetIdx + 2 until instructions.size).first { idx ->
        val instr = instructions[idx]
        if (instr.opcode != Opcode.IGET) return@first false
        val ref = (instr as ReferenceInstruction).reference as FieldReference
        ref.definingClass == trackGroupType &&
            ref.type == "I" &&
            idx + 3 < instructions.size &&
            instructions[idx + 3].opcode == Opcode.INVOKE_INTERFACE
    }
    val trackGroupTypeField = (instructions[trackTypeIgetIdx] as ReferenceInstruction).reference as FieldReference

    val ifNezIdx = (trackTypeIgetIdx + 1 until minOf(trackTypeIgetIdx + 12, instructions.size)).first {
        instructions[it].opcode == Opcode.IF_NEZ
    }
    val gotoSkipIdx = ifNezIdx + 1
    check(
        instructions[gotoSkipIdx].opcode == Opcode.GOTO ||
            instructions[gotoSkipIdx].opcode == Opcode.GOTO_16,
    ) {
        "Expected skip goto after type check in ${method.definingClass}.${method.name}"
    }

    val cond76Idx = (instructions[ifNezIdx] as BuilderOffsetInstruction).target.location.index
    val condDdIdx = (instructions[gotoSkipIdx] as BuilderOffsetInstruction).target.location.index
    val cond76Instr = instructions[cond76Idx]
    val condDdInstr = instructions[condDdIdx]

    check(
        cond76Instr.opcode == Opcode.NEW_INSTANCE &&
            (cond76Instr as ReferenceInstruction).reference.toString() == "Ljava/util/ArrayList;",
    ) {
        "Unexpected ArrayList allocation at target of track-type check"
    }

    val cond88Idx = (cond76Idx + 1 until condDdIdx).first { idx ->
        val instr = instructions[idx]
        instr.opcode == Opcode.NEW_INSTANCE &&
            (instr as ReferenceInstruction).reference.toString() != "Ljava/util/ArrayList;"
    }
    val cond88Instr = instructions[cond88Idx]
    val overrideCtorInstr = instructions[cond88Idx + 1] as FiveRegisterInstruction
    check(overrideCtorInstr.opcode == Opcode.INVOKE_DIRECT && overrideCtorInstr.registerCount == 3) {
        "Unexpected TrackSelectionOverride constructor in ${method.definingClass}.${method.name}"
    }
    val listTargetReg = overrideCtorInstr.registerE

    val liveAfterVideo = (
        computeLiveInRegisters(instructions, cond88Idx) +
            computeLiveInRegisters(instructions, condDdIdx)
        ) - listTargetReg

    val localRegisterLimit = implementation.registerCount - method.parameterTypes.size - 1
    val protectedLow = setOf(
        downloadHelperReg,
        thisReg,
        mappedTrackInfoReg,
        rendererIndexReg,
        trackGroupArrayReg,
        groupCountReg,
        groupIndexReg,
        periodIndexReg,
    )
    check(protectedLow.all { it in 0..15 } && listTargetReg in 0..15) {
        "Expected 4-bit registers in ${method.definingClass}.${method.name}"
    }
    check(listTargetReg !in liveAfterVideo) {
        "List target register v$listTargetReg unexpectedly live across video selection"
    }

    val freeLowRegs = (0..minOf(15, localRegisterLimit - 1))
        .filter { it !in liveAfterVideo && it != listTargetReg && it !in protectedLow }
    check(freeLowRegs.size >= 3) {
        "Need 3 free 4-bit scratch registers in ${method.definingClass}.${method.name}, found $freeLowRegs"
    }
    val scratchA = listTargetReg
    val scratchB = freeLowRegs[0]
    val scratchC = freeLowRegs[1]
    val scratchD = freeLowRegs[2]

    val usedLow = setOf(scratchA, scratchB, scratchC, scratchD)
    val freeWideRegs = ((16 until localRegisterLimit) + (0..minOf(15, localRegisterLimit - 1)))
        .filter { it !in liveAfterVideo && it !in usedLow && it !in protectedLow }
    check(freeWideRegs.size >= 2) {
        "Need 2 free scratch registers for video loop in ${method.definingClass}.${method.name}"
    }
    val selectorReg = freeWideRegs[0]
    val groupLoopReg = freeWideRegs[1]

    val existingCond76Labels = cond76Instr.location.labels.toList()
    val trackGroupReg = overrideCtorInstr.registerD

    method.addInstructionsWithLabels(
        cond76Idx,
        """
            iget v$scratchA, v$trackGroupReg, $trackGroupTypeField
            const/4 v$scratchC, 0x2
            if-ne v$scratchA, v$scratchC, :non_video

            iget-object v$scratchA, v$thisReg, $exoManagerField
            iget-object v$scratchA, v$scratchA, $paramsProviderField
            iget-object v$scratchA, v$scratchA, $syncQualityStoreField
            invoke-virtual {v$scratchA}, ${ctx.readSyncQualityMethod}
            move-result-object v$scratchA
            check-cast v$scratchA, ${ctx.syncQualityOptionImplType}
            iget v$scratchA, v$scratchA, ${ctx.syncQualityHeightField}
            invoke-static {v$scratchA}, $DOWNLOAD_QUALITY_HELPER_CLASS->beginVideoSelection(I)Ljava/lang/Object;
            move-result-object v$selectorReg

            const/4 v$scratchA, 0x0
            move/from16 v$groupLoopReg, v$scratchA

            :video_group_loop
            move/from16 v$scratchA, v$groupLoopReg
            if-ge v$scratchA, v$groupCountReg, :video_group_done
            invoke-virtual {v$trackGroupArrayReg, v$scratchA}, $trackGroupGetMethod
            move-result-object v$scratchB
            iget v$scratchC, v$scratchB, $trackGroupTypeField
            const/4 v$scratchD, 0x2
            if-ne v$scratchC, v$scratchD, :next_video_group

            iget-object v$scratchC, v$scratchB, $trackGroupFormatsField
            iget-object v$scratchD, v$mappedTrackInfoReg, $rendererSupportsField
            aget-object v$scratchD, v$scratchD, v$rendererIndexReg
            aget-object v$scratchD, v$scratchD, v$scratchA
            move-object/from16 v$scratchB, v$selectorReg
            invoke-static {v$scratchB, v$scratchA, v$scratchC, v$scratchD}, $DOWNLOAD_QUALITY_HELPER_CLASS->beginGroup(Ljava/lang/Object;I[Ljava/lang/Object;[I)V

            :video_track_loop
            move-object/from16 v$scratchA, v$selectorReg
            invoke-static {v$scratchA}, $DOWNLOAD_QUALITY_HELPER_CLASS->nextFormat(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$scratchA
            if-eqz v$scratchA, :next_video_group
            check-cast v$scratchA, $formatType
            iget v$scratchB, v$scratchA, $formatWidthField
            iget v$scratchC, v$scratchA, $formatHeightField
            iget v$scratchD, v$scratchA, $formatBitrateField
            move-object/from16 v$scratchA, v$selectorReg
            invoke-static {v$scratchA, v$scratchB, v$scratchC, v$scratchD}, $DOWNLOAD_QUALITY_HELPER_CLASS->recordCandidate(Ljava/lang/Object;III)V
            goto :video_track_loop

            :next_video_group
            add-int/lit8 v$groupLoopReg, v$groupLoopReg, 0x1
            goto :video_group_loop

            :video_group_done
            move-object/from16 v$scratchA, v$selectorReg
            invoke-static {v$scratchA, v$groupIndexReg}, $DOWNLOAD_QUALITY_HELPER_CLASS->finishVideoSelection(Ljava/lang/Object;I)Ljava/util/List;
            move-result-object v$scratchA
            if-eqz v$scratchA, :skip_video_group
            iget-object v$scratchB, v$downloadHelperReg, $trackSelectionsField
            invoke-static {v$scratchB, v$periodIndexReg, v$rendererIndexReg}, $DOWNLOAD_QUALITY_HELPER_CLASS->clearRendererSelections(Ljava/lang/Object;II)V
            goto/16 :use_selected_tracks
        """.trimIndent(),
        ExternalLabel("non_video", cond76Instr),
        ExternalLabel("use_selected_tracks", cond88Instr),
        ExternalLabel("skip_video_group", condDdInstr),
    )

    // Detach pre-existing branch labels from original ArrayList allocation so TRACK_TYPE_VIDEO checks run first.
    val entryLocation = method.implementation!!.instructions[cond76Idx].location
    for (label in existingCond76Labels) {
        check(cond76Instr.location.labels.remove(label)) {
            "Failed to detach branch label in ${method.definingClass}.${method.name}"
        }
        entryLocation.labels.add(label)
    }
}
