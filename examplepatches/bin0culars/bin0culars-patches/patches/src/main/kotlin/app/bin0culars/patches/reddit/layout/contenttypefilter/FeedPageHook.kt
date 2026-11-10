package app.bin0culars.patches.reddit.layout.contenttypefilter

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private val PAGE_CONSTRUCTOR_PARAMS =
    listOf(
        "Ljava/util/List;",
        "Ljava/lang/String;",
        null,
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        "Ljava/util/List;",
        null,
    )

private fun isPageConstructor(params: List<String>): Boolean {
    val expected = PAGE_CONSTRUCTOR_PARAMS
    return params.size == expected.size && expected.withIndex().all { (i, t) -> t == null || params[i] == t }
}

private fun findPageConstructorIndex(instructions: List<Instruction>, from: Int): Int =
    instructions.withIndex().drop(from).firstOrNull { (_, i) ->
        (i.opcode == Opcode.INVOKE_DIRECT || i.opcode == Opcode.INVOKE_DIRECT_RANGE) &&
            i.methodRef()?.let { it.name == "<init>" && isPageConstructor(it.parameterTypes.map(CharSequence::toString)) } == true
    }?.index ?: throw PatchException("Could not find 7-param constructor after getData")

private fun listRegisterOf(instruction: Instruction): Int =
    (instruction as? RegisterRangeInstruction)?.let { it.startRegister + 1 }
        ?: throw PatchException("Unsupported constructor instruction: ${instruction.javaClass.name}")

private fun isMoveObject(instruction: Instruction): Boolean =
    instruction.opcode == Opcode.MOVE_OBJECT ||
        instruction.opcode == Opcode.MOVE_OBJECT_FROM16 ||
        instruction.opcode == Opcode.MOVE_OBJECT_16

private fun hasMoveObject(instructions: List<Instruction>, destReg: Int, srcReg: Int): Boolean =
    instructions.any { instr ->
        isMoveObject(instr) &&
            (instr as? TwoRegisterInstruction)?.let { it.registerA == destReg && it.registerB == srcReg } == true
    }

private fun findDataSourceRegister(
    instructions: List<Instruction>,
    end: Int,
    dataSourceType: String,
    p0Register: Int,
): Int {
    val prefix = instructions.subList(0, end)
    return prefix.asReversed().firstOrNull { instr ->
        instr.opcode == Opcode.CHECK_CAST &&
            instr.typeRef() == dataSourceType &&
            (instr as? OneRegisterInstruction)?.let { hasMoveObject(prefix, it.registerA, p0Register) } == true
    }?.let { (it as? OneRegisterInstruction)?.registerA }
        ?: throw PatchException("Could not find data source register for $dataSourceType")
}

private fun buildFilterPageInstruction(
    listRegister: Int,
    dataSourceRegister: Int,
    requestRegister: Int,
): String {
    if (listRegister < 16 && dataSourceRegister < 16 && requestRegister < 16) {
        return "invoke-static { v$listRegister, v$dataSourceRegister, v$requestRegister }, " +
            "$EXTENSION_CLASS->filterPage(Ljava/util/List;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;"
    }
    throw PatchException("Registers must be < 16: list=$listRegister, ds=$dataSourceRegister, req=$requestRegister")
}

private fun findPageKeyField(requestType: String): String {
    val tagMethod = FeedPageBuildFingerprint.classDef.methods.firstOrNull { method ->
        method.implementation?.instructions?.any { instr ->
            instr.opcode == Opcode.NEW_INSTANCE &&
                instr.typeRef() == "Lcom/reddit/network/common/tags/FeedParamsFirstPageRequestTag;"
        } == true
    } ?: throw PatchException("Could not find method containing FeedParamsFirstPageRequestTag")

    return tagMethod.implementation?.instructions?.firstOrNull { instr ->
        instr.opcode == Opcode.IGET_OBJECT &&
            ((instr as? ReferenceInstruction)?.reference as? FieldReference)?.let {
                it.definingClass == requestType && it.type == "Ljava/lang/String;"
            } == true
    }?.let { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.name }
        ?: throw PatchException("Could not find String field on $requestType in tag method")
}

private fun fillIsFirstPageBridge() {
    val requestType = FeedPageBuildFingerprint.method.parameterTypes[1].toString()
    val fieldName = findPageKeyField(requestType)

    val smali = """
        if-eqz p0, :no
        check-cast p0, $requestType
        iget-object p0, p0, $requestType->$fieldName:Ljava/lang/String;
        if-nez p0, :no
        const/4 p1, 0x1
        return p1
        :no
        const/4 p1, 0x0
        return p1
    """.trimIndent()
    fillBridge("isFirstPage", smali)
}

internal fun hookFeedPages(): String {
    fillIsFirstPageBridge()

    val pageBuildMethod = FeedPageBuildFingerprint.method
    val pageInstructions = pageBuildMethod.instructions.toList()
    val getDataMatch = FeedPageBuildFingerprint.instructionMatches.last()

    val injectionIndex = findPageConstructorIndex(pageInstructions, getDataMatch.index)
    val listRegister = listRegisterOf(pageInstructions[injectionIndex])

    val param0Type = pageBuildMethod.parameterTypes.first().toString()
    val implementation = pageBuildMethod.implementation
        ?: throw PatchException("Method ${pageBuildMethod.name} has no implementation")
    val p0Register = implementation.registerCount - 3
    val requestRegister = implementation.registerCount - 2
    val dataSourceRegister = findDataSourceRegister(pageInstructions, injectionIndex, param0Type, p0Register)

    val invokeInstruction = buildFilterPageInstruction(listRegister, dataSourceRegister, requestRegister)
    pageBuildMethod.addInstructions(
        injectionIndex,
        """
            $invokeInstruction
            move-result-object v$listRegister
        """,
    )

    return param0Type
}
