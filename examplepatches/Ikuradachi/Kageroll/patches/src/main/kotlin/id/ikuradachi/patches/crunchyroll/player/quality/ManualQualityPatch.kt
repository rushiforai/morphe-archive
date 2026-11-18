package id.ikuradachi.patches.crunchyroll.player.quality

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.BuilderSwitchPayload
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL
import java.util.function.Supplier

@Volatile
private var discoveredQualityContext: QualityDiscovery? = null

private val manualQualityDiscoveryPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        discoveredQualityContext = discoverQualityContext()
    }

    finalize {
        discoveredQualityContext = null
    }
}

@Suppress("unused")
val manualQualityPatch = bytecodePatch(
    name = "Manual video quality",
    description = "Replaces the preset quality tiers with manual per-resolution selection and Auto.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    category("Player")
    dependsOn(manualQualityDiscoveryPatch)

    extendWithAll(Supplier {
        val ctx = requireNotNull(discoveredQualityContext) {
            "QualityDiscovery context was not initialized"
        }
        listOf(Supplier { manualQualityDex(ctx) })
    })

    execute {
        val ctx = requireNotNull(discoveredQualityContext) {
            "QualityDiscovery context was not initialized"
        }

        patchOnTracksChanged(ctx)
        patchQualitySnap(ctx)
        patchQualityApply(ctx)
        patchHighestQualityDataTitle(ctx)
        patchQualitiesMappers(ctx)
        patchCustomRadioGroup()
        patchUpdateQualitySummary(ctx)
        patchComposeTitleSite(
            siteName = "ComposeQualityItem",
            method = createComposeQualityItemFingerprint(
                preferredQualityDataBaseType = ctx.preferredQualityDataBaseType,
                titleFieldName = ctx.titleDataField.name,
            ).matchAll(1..1).single().let { match ->
                Triple(match.method, match.instructionMatches[0].index, match.instructionMatches[1].index)
            },
        )
        patchComposeTitleSite(
            siteName = "ComposeQualitySummary",
            method = createComposeQualitySummaryFingerprint(
                preferredQualityDataBaseType = ctx.preferredQualityDataBaseType,
                titleFieldName = ctx.titleDataField.name,
            ).matchAll(1..1).single().let { match ->
                Triple(match.method, match.instructionMatches[1].index, match.instructionMatches[2].index)
            },
        )
    }
}

private fun BytecodePatchContext.discoverQualityContext(): QualityDiscovery {
    val highestQualityMatch = HighestVideoQualityToStringFingerprint.matchAll(1..1).single()
    val highestQualityClass = highestQualityMatch.classDef
    val highestQualityType = highestQualityClass.type
    val videoQualityBaseType = requireNotNull(highestQualityClass.superclass) {
        "Missing superclass on $highestQualityType"
    }
    val highestQualityInstanceField = highestQualityClass.staticFields.single {
        it.type == highestQualityType
    }

    val heightQualityMatch = HeightVideoQualityToStringFingerprint.matchAll(1..1).single()
    val heightQualityClass = heightQualityMatch.classDef
    val heightQualityType = heightQualityClass.type
    val heightInit = heightQualityClass.methods.single {
        it.name == "<init>" && it.parameterTypes.map { p -> p.toString() } == listOf("I", "I", "I")
    }
    val heightInitIputs = heightInit.implementation!!.instructions
        .toList()
        .filter { it.opcode == Opcode.IPUT }
        .map { (it as ReferenceInstruction).reference as FieldReference }
    check(heightInitIputs.size == 3) {
        "Expected 3 IPUT instructions in $heightQualityType.<init>(III), found ${heightInitIputs.size}"
    }
    val widthField = heightInitIputs[0]
    val heightField = heightInitIputs[1]
    val bitrateField = heightInitIputs[2]

    fun findIntGetterName(targetField: FieldReference): String =
        heightQualityClass.methods.single { method ->
            method.name != "hashCode" &&
                method.parameterTypes.isEmpty() &&
                method.returnType == "I" &&
                method.implementation?.instructions?.toList().let { instrs ->
                    instrs != null &&
                        instrs.size == 2 &&
                        instrs[0].opcode == Opcode.IGET &&
                        (instrs[0] as ReferenceInstruction).reference == targetField &&
                        instrs[1].opcode == Opcode.RETURN
                }
        }.name

    val widthMethodRef = "$videoQualityBaseType->${findIntGetterName(widthField)}()I"
    val heightMethodRef = "$videoQualityBaseType->${findIntGetterName(heightField)}()I"
    val bitrateMethodRef = "$videoQualityBaseType->${findIntGetterName(bitrateField)}()I"

    val adStateMatch = AdStateToStringFingerprint.matchAll(1..1).single()
    val adStateType = adStateMatch.classDef.type
    val adIsActiveField = adStateMatch.instructionMatches[1].getFieldAccessed()

    val formatMatch = FormatToStringFingerprint.matchAll(1..1).single()
    val formatType = formatMatch.classDef.type
    val formatBitrateField = formatMatch.instructionMatches[1].getFieldAccessed()
    val formatWidthField = formatMatch.instructionMatches[3].getFieldAccessed()
    val formatHeightField = formatMatch.instructionMatches[4].getFieldAccessed()

    val highestDataMatch = HighestVideoQualityDataToStringFingerprint.matchAll(1..1).single()
    val highestDataClass = highestDataMatch.classDef
    val highestQualityDataType = highestDataClass.type
    val preferredQualityDataBaseType = requireNotNull(highestDataClass.superclass) {
        "Missing superclass on $highestQualityDataType"
    }
    val highestQualityDataInstanceField = highestDataClass.staticFields.single {
        it.type == highestQualityDataType
    }

    val preferredQualityDataBaseClass = classDefBy(preferredQualityDataBaseType)
    val preferredQualityDataCtor = preferredQualityDataBaseClass.methods.single {
        it.name == "<init>" &&
            it.parameterTypes.map { p -> p.toString() } ==
            listOf(videoQualityBaseType, "I", "I", "Ljava/lang/String;")
    }
    val baseCtorInstrs = preferredQualityDataCtor.implementation!!.instructions.toList()
    val titleDataField = baseCtorInstrs
        .first { it.opcode == Opcode.IPUT }
        .let { (it as ReferenceInstruction).reference as FieldReference }
    val heightCallIdx = baseCtorInstrs.indexOfFirst { instr ->
        instr.opcode == Opcode.INVOKE_VIRTUAL &&
            (instr as ReferenceInstruction).reference.toString() == heightMethodRef
    }
    check(heightCallIdx >= 0 && heightCallIdx + 2 < baseCtorInstrs.size) {
        "Failed to locate height field assignment in $preferredQualityDataCtor"
    }
    check(
        baseCtorInstrs[heightCallIdx + 1].opcode == Opcode.MOVE_RESULT &&
            baseCtorInstrs[heightCallIdx + 2].opcode == Opcode.IPUT,
    ) {
        "Unexpected height field assignment pattern in $preferredQualityDataCtor"
    }
    val heightDataField = (baseCtorInstrs[heightCallIdx + 2] as ReferenceInstruction).reference as FieldReference

    val moderateQualityDataType = ModerateVideoQualityDataToStringFingerprint.matchAll(1..1).single().classDef.type
    val dataSaverQualityDataType = DataSaverVideoQualityDataToStringFingerprint.matchAll(1..1).single().classDef.type
    val qualitySelectorType = QualityTrackSelectorConstructorFingerprint.matchAll(1..1).single().classDef.type

    val qualityApplyMatch = createQualityApplyFingerprint(qualitySelectorType).matchAll(1..1).single()
    val applyInstrs = qualityApplyMatch.method.implementation!!.instructions
    val playerStateFlowField = applyInstrs
        .first {
            it.opcode == Opcode.IGET_OBJECT &&
                ((it as ReferenceInstruction).reference as FieldReference).definingClass == qualitySelectorType
        }
        .let { (it as ReferenceInstruction).reference as FieldReference }
    val flowIdx = applyInstrs.indexOfFirst {
        it.opcode == Opcode.IGET_OBJECT &&
            (it as ReferenceInstruction).reference == playerStateFlowField
    }
    val stateFlowGetValueMethod = applyInstrs[flowIdx + 1].let {
        check(it.opcode == Opcode.INVOKE_INTERFACE) { "Expected StateFlow.getValue in $qualitySelectorType.b" }
        (it as ReferenceInstruction).reference as MethodReference
    }
    val playerStateCastIdx = (flowIdx + 2 until applyInstrs.size).first {
        applyInstrs[it].opcode == Opcode.CHECK_CAST
    }
    val playerStateType = (applyInstrs[playerStateCastIdx] as ReferenceInstruction).reference.toString()
    val availableQualitiesField = (playerStateCastIdx + 1 until applyInstrs.size)
        .firstNotNullOf { idx ->
            val instr = applyInstrs[idx]
            if (instr.opcode == Opcode.IGET_OBJECT) {
                val fieldRef = (instr as ReferenceInstruction).reference as FieldReference
                if (fieldRef.definingClass == playerStateType && fieldRef.type == "Ljava/util/List;") {
                    fieldRef
                } else {
                    null
                }
            } else {
                null
            }
        }
    val adStateField = classDefBy(playerStateType).fields.single { it.type == adStateType }

    val setMaxVideoSizeMethod = qualityApplyMatch.instructionMatches[1].getMethodCalled()
    val trackSelectionBuilderType = setMaxVideoSizeMethod.definingClass
    val trackSelectionBuilderClass = classDefBy(trackSelectionBuilderType)
    val clearOverridesOfTypeMethod = trackSelectionBuilderClass.methods.single {
        it.parameterTypes.map { p -> p.toString() } == listOf("I") &&
            it.returnType == trackSelectionBuilderType
    }

    val onTracksMatch = createOnTracksChangedFingerprint(highestQualityType).matchAll(1..1).single()
    val onTracksMethod = onTracksMatch.method
    val tracksType = onTracksMethod.parameterTypes.first().toString()
    val onTracksInstrs = onTracksMethod.implementation!!.instructions
    val tracksGroupsField = onTracksInstrs
        .first {
            it.opcode == Opcode.IGET_OBJECT &&
                ((it as ReferenceInstruction).reference as FieldReference).definingClass == tracksType &&
                ((it as ReferenceInstruction).reference as FieldReference).type ==
                "Lcom/google/common/collect/ImmutableList;"
        }
        .let { (it as ReferenceInstruction).reference as FieldReference }
    val groupsIdx = onTracksInstrs.indexOfFirst {
        it.opcode == Opcode.IGET_OBJECT &&
            (it as ReferenceInstruction).reference == tracksGroupsField
    }
    val trackGroupInfoCastIdx = (groupsIdx + 1 until onTracksInstrs.size).first {
        onTracksInstrs[it].opcode == Opcode.CHECK_CAST
    }
    val trackGroupInfoType = (onTracksInstrs[trackGroupInfoCastIdx] as ReferenceInstruction).reference.toString()
    val trackGroupField = (trackGroupInfoCastIdx + 1 until onTracksInstrs.size)
        .firstNotNullOf { idx ->
            val instr = onTracksInstrs[idx]
            if (instr.opcode == Opcode.IGET_OBJECT) {
                val ref = (instr as ReferenceInstruction).reference as FieldReference
                if (ref.definingClass == trackGroupInfoType) ref else null
            } else {
                null
            }
        }
    val trackGroupType = trackGroupField.type
    val trackTypeField = (trackGroupInfoCastIdx + 1 until onTracksInstrs.size)
        .firstNotNullOf { idx ->
            val instr = onTracksInstrs[idx]
            if (instr.opcode == Opcode.IGET) {
                val ref = (instr as ReferenceInstruction).reference as FieldReference
                if (ref.definingClass == trackGroupType && ref.type == "I") ref else null
            } else {
                null
            }
        }

    val trackGroupInfoClass = classDefBy(trackGroupInfoType)
    val trackGroupLengthField = trackGroupInfoClass.fields.single { it.type == "I" }
    val isTrackSupportedMethod = trackGroupInfoClass.methods.single {
        it.parameterTypes.map { p -> p.toString() } == listOf("I") && it.returnType == "Z"
    }
    val getTrackFormatMethod = trackGroupInfoClass.methods.single {
        it.parameterTypes.map { p -> p.toString() } == listOf("I") && it.returnType == formatType
    }

    val setOverrideForTypeMethod = trackSelectionBuilderClass.methods.single { method ->
        if (method.parameterTypes.size != 1 || method.returnType != trackSelectionBuilderType) {
            return@single false
        }
        val paramType = method.parameterTypes.single().toString()
        val paramClass = classDefByOrNull(paramType) ?: return@single false
        paramClass.methods.any { ctor ->
            ctor.name == "<init>" &&
                ctor.parameterTypes.map { p -> p.toString() } ==
                listOf(trackGroupType, "Ljava/util/List;")
        }
    }
    val trackSelectionOverrideType = setOverrideForTypeMethod.parameterTypes.single().toString()

    return QualityDiscovery(
        videoQualityBaseType = videoQualityBaseType,
        highestQualityType = highestQualityType,
        highestQualityInstanceField = highestQualityInstanceField,
        heightQualityType = heightQualityType,
        heightMethodRef = heightMethodRef,
        widthMethodRef = widthMethodRef,
        bitrateMethodRef = bitrateMethodRef,
        preferredQualityDataBaseType = preferredQualityDataBaseType,
        preferredQualityDataCtor = preferredQualityDataCtor,
        titleDataField = titleDataField,
        heightDataField = heightDataField,
        highestQualityDataType = highestQualityDataType,
        highestQualityDataInstanceField = highestQualityDataInstanceField,
        moderateQualityDataType = moderateQualityDataType,
        dataSaverQualityDataType = dataSaverQualityDataType,
        qualitySelectorType = qualitySelectorType,
        playerStateFlowField = playerStateFlowField,
        stateFlowGetValueMethod = stateFlowGetValueMethod,
        playerStateType = playerStateType,
        adStateField = adStateField,
        adIsActiveField = adIsActiveField,
        availableQualitiesField = availableQualitiesField,
        tracksType = tracksType,
        tracksGroupsField = tracksGroupsField,
        trackGroupInfoType = trackGroupInfoType,
        trackGroupField = trackGroupField,
        trackGroupLengthField = trackGroupLengthField,
        isTrackSupportedMethod = isTrackSupportedMethod,
        getTrackFormatMethod = getTrackFormatMethod,
        trackGroupType = trackGroupType,
        trackTypeField = trackTypeField,
        formatWidthField = formatWidthField,
        formatHeightField = formatHeightField,
        formatBitrateField = formatBitrateField,
        trackSelectionBuilderType = trackSelectionBuilderType,
        clearOverridesOfTypeMethod = clearOverridesOfTypeMethod,
        setOverrideForTypeMethod = setOverrideForTypeMethod,
        setMaxVideoSizeMethod = setMaxVideoSizeMethod,
        trackSelectionOverrideType = trackSelectionOverrideType,
    )
}

private fun BytecodePatchContext.patchOnTracksChanged(ctx: QualityDiscovery) {
    val match = createOnTracksChangedFingerprint(ctx.highestQualityType).matchAll(1..1).single()
    val method = match.method
    val implementation = requireNotNull(method.implementation)
    val instructions = implementation.instructions

    val newArrayIndex = match.instructionMatches[1].index
    val startIndex = newArrayIndex - 1
    check(
        startIndex >= 0 &&
            instructions[startIndex].opcode == Opcode.CONST_4 &&
            (instructions[startIndex] as NarrowLiteralInstruction).narrowLiteral == 3,
    ) {
        "Expected const/4 3 before new-array in onTracksChanged"
    }
    val constThreeReg = (instructions[startIndex] as OneRegisterInstruction).registerA

    val listResultIndex = (newArrayIndex + 1 until minOf(newArrayIndex + 16, instructions.size)).first {
        instructions[it].opcode == Opcode.MOVE_RESULT_OBJECT
    }
    val listReg = (instructions[listResultIndex] as OneRegisterInstruction).registerA

    val selectorReg = (0 until startIndex).firstNotNullOf { idx ->
        val instr = instructions[idx]
        if (instr.opcode == Opcode.IGET_OBJECT &&
            ((instr as ReferenceInstruction).reference as FieldReference).type == ctx.qualitySelectorType
        ) {
            (instr as TwoRegisterInstruction).registerA
        } else {
            null
        }
    }

    val p1Reg = implementation.registerCount - 1
    val tracksReg = (0 until startIndex).firstNotNullOf { idx ->
        val instr = instructions[idx]
        if ((instr.opcode == Opcode.MOVE_OBJECT || instr.opcode == Opcode.MOVE_OBJECT_FROM16) &&
            (instr as TwoRegisterInstruction).registerB == p1Reg
        ) {
            instr.registerA
        } else {
            null
        }
    }

    val stateReg = (0 until startIndex).last { idx ->
        val instr = instructions[idx]
        instr.opcode == Opcode.CHECK_CAST &&
            (instr as ReferenceInstruction).reference.toString() == ctx.playerStateType
    }.let { (instructions[it] as OneRegisterInstruction).registerA }

    check(
        selectorReg in 0..15 &&
            tracksReg in 0..15 &&
            stateReg in 0..15 &&
            constThreeReg in 0..15 &&
            constThreeReg !in setOf(selectorReg, tracksReg, stateReg),
    ) {
        "Unexpected registers in onTracksChanged: selector=$selectorReg tracks=$tracksReg state=$stateReg const=$constThreeReg"
    }
    val liveAfter = computeLiveInRegisters(instructions, listResultIndex + 1)
    val preservedConstants = linkedMapOf<Int, Int>()
    for (i in startIndex..listResultIndex) {
        val instr = instructions[i]
        val op = instr.opcode
        when {
            op == Opcode.CONST_4 || op == Opcode.CONST_16 || op == Opcode.CONST || op == Opcode.CONST_HIGH16 -> {
                val reg = (instr as OneRegisterInstruction).registerA
                if (reg in liveAfter && reg != listReg) {
                    preservedConstants[reg] = (instr as WideLiteralInstruction).wideLiteral.toInt()
                }
            }
            op.setsRegister() && i != listResultIndex -> {
                val reg = when (instr) {
                    is OneRegisterInstruction -> instr.registerA
                    is TwoRegisterInstruction -> instr.registerA
                    is ThreeRegisterInstruction -> instr.registerA
                    else -> error("Unexpected register-setting instruction at index $i: $op")
                }
                preservedConstants.remove(reg)
                check(reg !in liveAfter) {
                    "Removed non-constant register v$reg at index $i is still live after onTracksChanged quality list"
                }
                if (op.setsWideRegister()) {
                    preservedConstants.remove(reg + 1)
                    check((reg + 1) !in liveAfter) {
                        "Removed wide register v${reg + 1} at index $i is still live after onTracksChanged quality list"
                    }
                }
            }
        }
    }
    check(constThreeReg in preservedConstants) {
        "Expected const/4 3 register v$constThreeReg to be preserved in onTracksChanged"
    }

    val scratchReg = findFreeScratchRegister(
        instructions = instructions,
        fromIndex = listResultIndex + 1,
        registerCount = implementation.registerCount,
        protectedRegs = setOf(selectorReg, tracksReg, stateReg, constThreeReg, listReg),
    )

    prepareRemovalRange(
        implementation = implementation,
        startIdx = startIndex,
        endIdx = listResultIndex,
        contextName = "quality list initialization in onTracksChanged",
    )

    val restoreConsts = preservedConstants.entries.joinToString("\n") { (reg, value) ->
        formatConstInstruction(reg, value)
    }

    method.removeInstructions(startIndex, listResultIndex - startIndex + 1)
    method.addInstructions(
        startIndex,
        """
            iget-object v$constThreeReg, v$stateReg, ${ctx.adStateField}
            iget-boolean v$constThreeReg, v$constThreeReg, ${ctx.adIsActiveField}
            iget-object v$scratchReg, v$stateReg, ${ctx.availableQualitiesField}
            invoke-static {v$selectorReg, v$tracksReg, v$constThreeReg, v$scratchReg}, $MANUAL_QUALITY_BRIDGE_CLASS->discoverVideoQualities(Ljava/lang/Object;${ctx.tracksType}ZLjava/util/List;)Ljava/util/List;
            move-result-object v$listReg
            $restoreConsts
        """.trimIndent(),
    )
}

private fun BytecodePatchContext.patchQualitySnap(ctx: QualityDiscovery) {
    val match = createQualitySnapFingerprint(
        qualitySelectorType = ctx.qualitySelectorType,
        videoQualityBaseType = ctx.videoQualityBaseType,
    ).matchAll(1..1).single()
    val method = match.method
    val implementation = requireNotNull(method.implementation)
    check(implementation.registerCount >= 4) {
        "Unexpected register count in ${ctx.qualitySelectorType}.${method.name}: ${implementation.registerCount}"
    }

    method.addInstructions(
        0,
        """
            if-eqz p0, :auto
            instance-of v0, p0, ${ctx.highestQualityType}
            if-nez v0, :auto
            invoke-virtual {p0}, ${ctx.heightMethodRef}
            move-result v0
            if-lez v0, :auto
            invoke-virtual {p0}, ${ctx.widthMethodRef}
            move-result v1
            const/16 v2, 0xf00
            if-ne v1, v2, :keep
            const/16 v2, 0x870
            if-ne v0, v2, :keep
            invoke-virtual {p0}, ${ctx.bitrateMethodRef}
            move-result v2
            if-eqz v2, :auto
            const v1, 0x7fffffff
            if-eq v2, v1, :auto
            :keep
            return-object p0
            :auto
            sget-object v0, ${ctx.highestQualityInstanceField}
            return-object v0
        """.trimIndent(),
    )
}

private fun BytecodePatchContext.patchQualityApply(ctx: QualityDiscovery) {
    val match = createQualityApplyFingerprint(ctx.qualitySelectorType).matchAll(1..1).single()
    val method = match.method
    val implementation = requireNotNull(method.implementation)
    val instructions = implementation.instructions

    val setTagIndex = match.instructionMatches[0].index
    val mCheckIndex = setTagIndex + 1
    check(
        setTagIndex >= 1 &&
            instructions[setTagIndex - 1].opcode == Opcode.CHECK_CAST &&
            instructions[mCheckIndex].opcode == Opcode.INVOKE_STATIC,
    ) {
        "Unexpected state cast/check shape in ${ctx.qualitySelectorType}.${method.name}"
    }
    val stateReg = (instructions[setTagIndex - 1] as OneRegisterInstruction).registerA
    val scratchA = (instructions[setTagIndex] as OneRegisterInstruction).registerA

    val setMaxVideoSizeIndex = match.instructionMatches[1].index
    val applyStartIndex = setMaxVideoSizeIndex - 4
    val applyEndIndex = setMaxVideoSizeIndex + 1
    check(
        applyStartIndex > mCheckIndex &&
            applyEndIndex < instructions.size &&
            instructions[applyStartIndex].opcode == Opcode.INVOKE_VIRTUAL_RANGE &&
            instructions[applyStartIndex + 1].opcode == Opcode.MOVE_RESULT &&
            instructions[applyStartIndex + 2].opcode == Opcode.INVOKE_VIRTUAL_RANGE &&
            instructions[applyStartIndex + 3].opcode == Opcode.MOVE_RESULT &&
            instructions[applyEndIndex].opcode == Opcode.MOVE_RESULT_OBJECT,
    ) {
        "Unexpected TrackSelectionParameters.Builder.setMaxVideoSize block in ${ctx.qualitySelectorType}.${method.name}"
    }
    prepareRemovalRange(
        implementation = implementation,
        startIdx = applyStartIndex,
        endIdx = applyEndIndex,
        contextName = "TrackSelectionParameters.Builder block",
    )

    val builderCall = instructions[setMaxVideoSizeIndex] as FiveRegisterInstruction
    val builderReg = builderCall.registerC
    val wReg = (instructions[applyStartIndex + 1] as OneRegisterInstruction).registerA
    val selectedReg = (instructions[applyStartIndex + 2] as RegisterRangeInstruction).startRegister
    val resultBuilderReg = (instructions[applyEndIndex] as OneRegisterInstruction).registerA

    val selectorReg = (mCheckIndex + 1 until applyStartIndex).reversed().firstNotNullOf { idx ->
        val instr = instructions[idx]
        if (instr.opcode == Opcode.IGET_OBJECT &&
            ((instr as ReferenceInstruction).reference as FieldReference).definingClass == ctx.qualitySelectorType
        ) {
            (instr as TwoRegisterInstruction).registerB
        } else {
            null
        }
    }

    val scratchB = findFreeScratchRegister(
        instructions = instructions,
        fromIndex = mCheckIndex + 1,
        registerCount = implementation.registerCount,
        protectedRegs = setOf(selectorReg, stateReg, scratchA, selectedReg),
    )

    check(
        selectorReg in 0..15 &&
            stateReg in 0..15 &&
            scratchA in 0..15 &&
            scratchB in 0..15 &&
            builderReg in 0..15 &&
            wReg in 0..15 &&
            resultBuilderReg in 0..15,
    ) {
        "Registers out of 4-bit range in ${ctx.qualitySelectorType}.${method.name}"
    }

    // Apply highest-index edit first so mCheckIndex remains valid.
    method.removeInstructions(applyStartIndex, applyEndIndex - applyStartIndex + 1)
    method.addInstructions(
        applyStartIndex,
        """
            move-object/from16 v$wReg, v$selectedReg
            invoke-static {v$selectorReg, v$builderReg, v$wReg}, $MANUAL_QUALITY_BRIDGE_CLASS->applyQualityOverride(${ctx.qualitySelectorType}${ctx.trackSelectionBuilderType}${ctx.videoQualityBaseType})${ctx.trackSelectionBuilderType}
            move-result-object v$resultBuilderReg
        """.trimIndent(),
    )

    method.addInstructions(
        mCheckIndex + 1,
        """
            move-object/from16 v$scratchA, v$selectedReg
            iget-object v$scratchB, v$stateReg, ${ctx.availableQualitiesField}
            invoke-static {v$scratchA, v$scratchB}, $MANUAL_QUALITY_BRIDGE_CLASS->canonicalizeQuality(${ctx.videoQualityBaseType}Ljava/util/List;)${ctx.videoQualityBaseType}
            move-result-object v$scratchA
            move-object/from16 v$selectedReg, v$scratchA
        """.trimIndent(),
    )
}

private fun BytecodePatchContext.patchHighestQualityDataTitle(ctx: QualityDiscovery) {
    val clinit = HighestVideoQualityDataToStringFingerprint.classDef.methods.single { it.name == "<clinit>" }
    val instructions = requireNotNull(clinit.implementation).instructions
    val ctorCallIdx = instructions.indexOfFirst { instr ->
        instr.opcode == Opcode.INVOKE_DIRECT &&
            (instr as ReferenceInstruction).reference == ctx.preferredQualityDataCtor
    }
    check(ctorCallIdx >= 0) {
        "Failed to locate ${ctx.preferredQualityDataCtor} call in ${ctx.highestQualityDataType}.<clinit>"
    }
    val titleReg = (instructions[ctorCallIdx] as FiveRegisterInstruction).registerE
    val titleConstIdx = (ctorCallIdx - 1 downTo 0).first { idx ->
        val instr = instructions[idx]
        (instr.opcode == Opcode.CONST || instr.opcode == Opcode.CONST_HIGH16) &&
            (instr as OneRegisterInstruction).registerA == titleReg
    }
    clinit.replaceInstruction(titleConstIdx, "const v$titleReg, 0x7e000000")
}

private fun BytecodePatchContext.patchQualitiesMappers(ctx: QualityDiscovery) {
    val currentMatch = createQualitiesCurrentMapperFingerprint(
        videoQualityBaseType = ctx.videoQualityBaseType,
        highestDataType = ctx.highestQualityDataType,
        moderateDataType = ctx.moderateQualityDataType,
        dataSaverDataType = ctx.dataSaverQualityDataType,
    ).matchAll(1..1).single()

    val listMatch = createQualitiesListMapperFingerprint(
        videoQualityBaseType = ctx.videoQualityBaseType,
        highestDataType = ctx.highestQualityDataType,
        moderateDataType = ctx.moderateQualityDataType,
        dataSaverDataType = ctx.dataSaverQualityDataType,
    ).matchAll(1..1).single()

    listOf(
        Triple(currentMatch.method, currentMatch.instructionMatches[0].index, currentMatch.instructionMatches.last().index),
        Triple(listMatch.method, listMatch.instructionMatches[1].index, listMatch.instructionMatches.last().index),
    ).forEach { (method, checkCastIdx, lastSgetIdx) ->
        val implementation = requireNotNull(method.implementation)
        val instructions = implementation.instructions
        val qualityReg = (instructions[checkCastIdx] as OneRegisterInstruction).registerA
        val outReg = (instructions[lastSgetIdx] as OneRegisterInstruction).registerA
        check(qualityReg == outReg && qualityReg in 0..15) {
            "Unexpected mapper register layout in ${method.definingClass}: in=$qualityReg out=$outReg"
        }
        prepareRemovalRange(
            implementation = implementation,
            startIdx = checkCastIdx + 1,
            endIdx = lastSgetIdx,
            contextName = "quality mapper ${method.definingClass}",
        )
        method.removeInstructions(checkCastIdx + 1, lastSgetIdx - checkCastIdx)
        method.addInstructions(
            checkCastIdx + 1,
            """
                invoke-static {v$qualityReg}, $MANUAL_QUALITY_DATA_CLASS->fromQuality(${ctx.videoQualityBaseType})${ctx.preferredQualityDataBaseType}
                move-result-object v$qualityReg
            """.trimIndent(),
        )
    }
}

private fun BytecodePatchContext.patchCustomRadioGroup() {
    val match = CustomRadioGroupBindOptionsFingerprint.matchAll(1..1).single()
    val callIdx = match.instructionMatches[1].index
    val callInstr = match.instructionMatches[1].getInstruction<FiveRegisterInstruction>()
    match.method.replaceInstruction(
        callIdx,
        "invoke-static {v${callInstr.registerC}, v${callInstr.registerD}}, $QUALITY_HELPER_CLASS->getTitleString(Landroid/content/Context;I)Ljava/lang/String;",
    )
}

private fun BytecodePatchContext.patchUpdateQualitySummary(ctx: QualityDiscovery) {
    val match = createUpdateQualitySummaryFingerprint(
        preferredQualityDataBaseType = ctx.preferredQualityDataBaseType,
        titleFieldName = ctx.titleDataField.name,
    ).matchAll(1..1).single()
    val method = match.method
    val implementation = requireNotNull(method.implementation)
    val instructions = implementation.instructions

    val stringIdx = match.instructionMatches[0].index
    val igetIdx = match.instructionMatches[2].index
    val getStringIdx = match.instructionMatches[3].index
    val moveResultIdx = getStringIdx + 1
    val mCheckIdx = stringIdx + 1

    check(
        getStringIdx == igetIdx + 1 &&
            moveResultIdx < instructions.size &&
            instructions[moveResultIdx].opcode == Opcode.MOVE_RESULT_OBJECT &&
            instructions[mCheckIdx].opcode == Opcode.INVOKE_STATIC,
    ) {
        "Unexpected PlayerSettingsFragment.l2 layout"
    }
    prepareRemovalRange(
        implementation = implementation,
        startIdx = igetIdx,
        endIdx = moveResultIdx,
        contextName = "PlayerSettingsFragment.l2 summary lookup",
    )

    val scratchReg = (instructions[stringIdx] as OneRegisterInstruction).registerA
    val paramReg = (instructions[igetIdx] as TwoRegisterInstruction).registerB
    val thisReg = (instructions[getStringIdx] as FiveRegisterInstruction).registerC
    val destReg = (instructions[moveResultIdx] as OneRegisterInstruction).registerA
    val getStringRef = match.instructionMatches[3].getMethodCalled()

    check(
        destReg == paramReg &&
            scratchReg in 0..15 &&
            paramReg in 0..15 &&
            thisReg in 0..15 &&
            scratchReg !in setOf(paramReg, thisReg),
    ) {
        "Unexpected registers in PlayerSettingsFragment.l2: scratch=$scratchReg param=$paramReg this=$thisReg dest=$destReg"
    }

    val resumeInstr = instructions[mCheckIdx + 1]
    method.removeInstructions(igetIdx, 3)
    method.addInstructionsWithLabels(
        mCheckIdx + 1,
        """
            iget v$scratchReg, v$paramReg, ${ctx.titleDataField}
            invoke-static {v$scratchReg}, $QUALITY_HELPER_CLASS->resolveSyntheticTitle(I)Ljava/lang/String;
            move-result-object v$paramReg
            if-nez v$paramReg, :resolved_title
            invoke-virtual {v$thisReg, v$scratchReg}, $getStringRef
            move-result-object v$paramReg
        """.trimIndent(),
        ExternalLabel("resolved_title", resumeInstr),
    )
}

private fun patchComposeTitleSite(
    siteName: String,
    method: Triple<MutableMethod, Int, Int>,
) {
    val (targetMethod, igetIdx, callIdx) = method
    val implementation = requireNotNull(targetMethod.implementation)
    val instructions = implementation.instructions
    val moveResultIdx = callIdx + 1
    check(
        moveResultIdx + 1 < instructions.size &&
            instructions[moveResultIdx].opcode == Opcode.MOVE_RESULT_OBJECT,
    ) {
        "Expected move-result-object after stringResource in $siteName"
    }

    val resReg = (instructions[igetIdx] as TwoRegisterInstruction).registerA
    val callInstr = instructions[callIdx] as FiveRegisterInstruction
    val composerReg = callInstr.registerC
    check(callInstr.registerD == resReg) {
        "Mismatched title resId register in $siteName: expected $resReg, got ${callInstr.registerD}"
    }
    val resultReg = (instructions[moveResultIdx] as OneRegisterInstruction).registerA
    check(resReg in 0..15) {
        "Title resId register out of 4-bit invoke range in $siteName: $resReg"
    }

    val callInstruction = instructions[callIdx]
    val afterInstruction = instructions[moveResultIdx + 1]

    if (resultReg != resReg && resultReg != composerReg && resultReg in 0..15) {
        targetMethod.addInstructionsWithLabels(
            callIdx,
            """
                invoke-static {v$resReg}, $QUALITY_HELPER_CLASS->resolveSyntheticTitle(I)Ljava/lang/String;
                move-result-object v$resultReg
                if-nez v$resultReg, :after_compose_str
            """.trimIndent(),
            ExternalLabel("after_compose_str", afterInstruction),
        )
    } else {
        val scratchReg = findFreeScratchRegister(
            instructions = instructions,
            fromIndex = callIdx,
            registerCount = implementation.registerCount,
            protectedRegs = setOf(resReg, composerReg, resultReg),
        )
        targetMethod.addInstructionsWithLabels(
            callIdx,
            """
                invoke-static {v$resReg}, $QUALITY_HELPER_CLASS->resolveSyntheticTitle(I)Ljava/lang/String;
                move-result-object v$scratchReg
                if-eqz v$scratchReg, :use_compose_str
                move-object/from16 v$resultReg, v$scratchReg
                goto :after_compose_str
            """.trimIndent(),
            ExternalLabel("use_compose_str", callInstruction),
            ExternalLabel("after_compose_str", afterInstruction),
        )
    }
}

private fun prepareRemovalRange(
    implementation: MutableMethodImplementation,
    startIdx: Int,
    endIdx: Int,
    contextName: String,
) {
    val instructions = implementation.instructions
    val range = startIdx..endIdx
    val internalLabels = range.flatMap { instructions[it].location.labels }.toSet()

    if (internalLabels.isNotEmpty()) {
        for (i in instructions.indices) {
            if (i in range) continue
            when (val instr = instructions[i]) {
                is BuilderOffsetInstruction -> check(instr.target !in internalLabels) {
                    "External branch at index $i targets label inside $contextName"
                }
                is BuilderSwitchPayload -> check(instr.switchElements.none { it.target in internalLabels }) {
                    "External switch at index $i targets label inside $contextName"
                }
            }
        }
    }

    for (tryBlock in implementation.tryBlocks) {
        check(
            tryBlock.start !in internalLabels &&
                tryBlock.end !in internalLabels &&
                tryBlock.exceptionHandler.handler !in internalLabels &&
                tryBlock.start.location.index !in range &&
                tryBlock.end.location.index !in range &&
                tryBlock.exceptionHandler.handler.location.index !in range,
        ) {
            "Try/catch block overlaps $contextName"
        }
    }

    for (i in range) {
        instructions[i].location.labels.clear()
    }
}

private fun formatConstInstruction(reg: Int, value: Int): String {
    val literal = if (value < 0) "-0x${(-value.toLong()).toString(16)}" else "0x${value.toLong().toString(16)}"
    return when {
        reg in 0..15 && value in -8..7 -> "const/4 v$reg, $literal"
        value in -32768..32767 -> "const/16 v$reg, $literal"
        else -> "const v$reg, $literal"
    }
}

private fun findFreeScratchRegister(
    instructions: List<BuilderInstruction>,
    fromIndex: Int,
    registerCount: Int,
    protectedRegs: Set<Int>,
): Int {
    val liveAtEntry = computeLiveInRegisters(instructions, fromIndex)
    val maxReg = minOf(registerCount - 1, 15)
    for (r in 0..maxReg) {
        if (r !in liveAtEntry && r !in protectedRegs) {
            return r
        }
    }
    error("No free 4-bit scratch register available (registerCount=$registerCount, live=$liveAtEntry)")
}

internal fun computeLiveInRegisters(
    instructions: List<BuilderInstruction>,
    fromIndex: Int,
): Set<Int> {
    val size = instructions.size
    val liveIn = Array(size) { mutableSetOf<Int>() }
    val uses = Array(size) { mutableSetOf<Int>() }
    val defs = Array(size) { mutableSetOf<Int>() }
    val succs = Array(size) { emptyList<Int>() }

    for (i in 0 until size) {
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
                    if (op.name.contains("_LONG") || op.name.contains("_DOUBLE") || op == Opcode.CMP_LONG) {
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
                        if (op == Opcode.MOVE_WIDE || op == Opcode.MOVE_WIDE_FROM16 || op == Opcode.MOVE_WIDE_16 ||
                            op.name.startsWith("LONG_TO_") || op.name.startsWith("DOUBLE_TO_") ||
                            op == Opcode.NEG_LONG || op == Opcode.NOT_LONG || op == Opcode.NEG_DOUBLE
                        ) {
                            u += instr.registerB + 1
                        }
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
        for (i in (size - 1) downTo 0) {
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

    return liveIn[fromIndex]
}
