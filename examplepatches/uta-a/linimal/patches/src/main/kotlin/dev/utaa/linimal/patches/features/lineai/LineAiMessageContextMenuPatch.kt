package dev.utaa.linimal.patches.features.lineai

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.utaa.linimal.patches.features.agenti.agentIChatPlusMenuPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatus
import dev.utaa.linimal.patches.status.PatchStatusRecord
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.unsafeFeatureStatus
import dev.utaa.linimal.patches.util.BOOLEAN
import dev.utaa.linimal.patches.util.OBJECT
import dev.utaa.linimal.patches.util.VOID
import dev.utaa.linimal.patches.util.branchTargetAddress
import dev.utaa.linimal.patches.util.instructionAddress
import dev.utaa.linimal.patches.util.isSafeInjectionIndex

private const val CONTEXT = "Landroid/content/Context;"
private const val CONTEXT_MENU_ITEM = "Lxc1/c;"
private const val CONTEXT_MENU_MODEL = "Lfm1/d1;"
private const val CONTEXT_MENU_MAPPER = "Lfm1/g;"
private const val CONTEXT_MENU_CALLBACK = "Lfm1/k0;"
private const val LINE_AI_ENTRY_SOURCE = "Ljz1/a;"
private const val LINE_AI_CONTEXT_SOURCE_VALUE = "chatroom_context_menu"
private const val LINE_AI_CONTEXT_HOOK =
    "Ldev/utaa/linimal/extension/features/lineai/LineAiMessageContextMenuHooks;->adjustAvailability(Z)Z"

/**
 * Concrete LINE_AI model: icon / label resource tuple, callback construction, and enum field are all required.
 * This validates the static item independently from the long-press supplier before any code is injected.
 */
private val lineAiMessageContextModelFingerprint = Fingerprint(
    definingClass = CONTEXT_MENU_MODEL,
    name = "<clinit>",
    returnType = VOID,
    parameters = emptyList(),
    filters = listOf(
        newInstance(CONTEXT_MENU_CALLBACK),
        literal(0x7f080640), // chat_ui_context_line_ai 相当（26.16.0 の public.xml では名前なし）
        literal(0x7f1519dd), // line_chat_button_lineai
        fieldAccess(
            definingClass = CONTEXT_MENU_MODEL,
            name = "LINE_AI",
            type = CONTEXT_MENU_MODEL,
            opcode = Opcode.SPUT_OBJECT,
        ),
    ),
)

/** Mapping from the context action enum to the resource-validated model. */
private val lineAiMessageContextMapperFingerprint = Fingerprint(
    definingClass = CONTEXT_MENU_MAPPER,
    name = "d",
    returnType = CONTEXT_MENU_MODEL,
    parameters = listOf(CONTEXT_MENU_ITEM),
    filters = listOf(
        methodCall(
            definingClass = "Ljava/lang/Enum;",
            name = "ordinal",
            returnType = "I",
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
        fieldAccess(
            definingClass = CONTEXT_MENU_MODEL,
            name = "LINE_AI",
            type = CONTEXT_MENU_MODEL,
            opcode = Opcode.SGET_OBJECT,
        ),
    ),
)

/** Callback attached to the resource-validated item delegates to a static bridge on the model class. */
private val lineAiMessageContextCallbackFingerprint = Fingerprint(
    definingClass = CONTEXT_MENU_CALLBACK,
    returnType = OBJECT,
    parameters = listOf(OBJECT, OBJECT, OBJECT),
    filters = listOf(
        methodCall(
            definingClass = CONTEXT_MENU_MODEL,
            opcode = Opcode.INVOKE_STATIC,
        ),
    ),
)

/** The model's only context-menu handler must enter LINE AI from the context-menu source. */
private val lineAiMessageContextHandlerFingerprint = Fingerprint(
    definingClass = CONTEXT_MENU_MODEL,
    returnType = "L",
    parameters = listOf("L", "L", "L"),
    filters = listOf(
        fieldAccess(
            definingClass = LINE_AI_ENTRY_SOURCE,
            name = "CONTEXT_MENU",
            type = LINE_AI_ENTRY_SOURCE,
            opcode = Opcode.SGET_OBJECT,
        ),
    ),
)

/** The source enum is independently anchored by its stable value and parameter string. */
private val lineAiContextEntrySourceFingerprint = Fingerprint(
    definingClass = LINE_AI_ENTRY_SOURCE,
    name = "<clinit>",
    returnType = VOID,
    parameters = emptyList(),
    filters = listOf(
        string(LINE_AI_CONTEXT_SOURCE_VALUE),
        fieldAccess(
            definingClass = LINE_AI_ENTRY_SOURCE,
            name = "CONTEXT_MENU",
            type = LINE_AI_ENTRY_SOURCE,
            opcode = Opcode.SPUT_OBJECT,
        ),
    ),
)

/**
 * The unique long-press supplier: `LINE_AI` enum object, context-menu source availability check, then the type-set
 * predicate and a direct return of that enum object. The target class / method name is not an identifier condition.
 */
private val lineAiMessageContextSupplierFingerprint = Fingerprint(
    returnType = CONTEXT_MENU_ITEM,
    parameters = listOf(CONTEXT, "L", "L", BOOLEAN),
    filters = listOf(
        fieldAccess(
            definingClass = CONTEXT_MENU_ITEM,
            name = "LINE_AI",
            type = CONTEXT_MENU_ITEM,
            opcode = Opcode.SGET_OBJECT,
        ),
        fieldAccess(
            definingClass = LINE_AI_ENTRY_SOURCE,
            name = "CONTEXT_MENU",
            type = LINE_AI_ENTRY_SOURCE,
            opcode = Opcode.SGET_OBJECT,
        ),
        methodCall(
            parameters = listOf("L", BOOLEAN, LINE_AI_ENTRY_SOURCE),
            returnType = BOOLEAN,
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
    ),
)

/**
 * Suppresses only the LINE AI element while it is being supplied to a freshly constructed long-press menu.
 * It does not alter the general context menu renderer, callback implementation, telemetry, or LINE AI backend.
 */
val lineAiMessageContextMenuPatch = bytecodePatch(
    name = "LINE AI in message context menu",
    description = "メッセージの長押しメニューにある LINE AI の項目を、実行時設定で非表示にできるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(agentIChatPlusMenuPatch)

    execute {
        val modelMatches = lineAiMessageContextModelFingerprint.matchAllOrNull().orEmpty()
        val mapperMatches = lineAiMessageContextMapperFingerprint.matchAllOrNull().orEmpty()
        val callbackMatches = lineAiMessageContextCallbackFingerprint.matchAllOrNull().orEmpty()
        val handlerMatches = lineAiMessageContextHandlerFingerprint.matchAllOrNull().orEmpty()
        val sourceMatches = lineAiContextEntrySourceFingerprint.matchAllOrNull().orEmpty()
        val supplierMatches = lineAiMessageContextSupplierFingerprint.matchAllOrNull().orEmpty()

        val invalidCount = listOf(
            modelMatches.size to "LineAiLongPressContextModelNotUnique",
            mapperMatches.size to "LineAiLongPressContextMapperNotUnique",
            callbackMatches.size to "LineAiLongPressContextCallbackNotUnique",
            handlerMatches.size to "LineAiLongPressContextHandlerNotUnique",
            sourceMatches.size to "LineAiLongPressContextEntrySourceNotUnique",
            supplierMatches.size to "LineAiLongPressContextSupplierNotUnique",
        ).firstOrNull { (count, _) -> count != 1 }
        if (invalidCount != null) {
            recordLineAiMessageContextMenuUnapplied(invalidCount.first, invalidCount.second)
            return@execute
        }

        // callback -> static bridge -> context-menu handler の連結を、同じ model class 内で確認します。
        val bridgeReference = (callbackMatches.single().instructionMatches[0].instruction as? ReferenceInstruction)
            ?.reference as? MethodReference
        val handlerName = handlerMatches.single().originalMethod.name
        val bridgeMatches = if (bridgeReference == null) {
            emptyList()
        } else {
            Fingerprint(
                definingClass = CONTEXT_MENU_MODEL,
                name = bridgeReference.name,
                parameters = bridgeReference.parameterTypes.map { it.toString() },
                filters = listOf(
                    methodCall(
                        definingClass = CONTEXT_MENU_MODEL,
                        name = handlerName,
                        opcode = Opcode.INVOKE_STATIC,
                    ),
                ),
            ).matchAllOrNull().orEmpty()
        }
        if (bridgeMatches.size != 1) {
            recordLineAiMessageContextMenuUnapplied(bridgeMatches.size, "LineAiLongPressContextCallbackBridgeNotUnique")
            return@execute
        }

        val supplier = supplierMatches.single()
        val injectionShape = lineAiMessageContextSupplierInjectionShape(supplier)
        if (
            injectionShape == null ||
            !isSafeInjectionIndex(supplier.method.implementation, injectionShape.availabilityBranchIndex)
        ) {
            patchStatusCollector.record(
                unsafeFeatureStatus(
                    patchId = PatchId.LINE_AI_MESSAGE_CONTEXT_MENU,
                    expectedTargetCount = 1,
                    actualTargetCount = 1,
                    reason = "LineAiLongPressContextSupplierInstructionShapeMismatch",
                ),
            )
            return@execute
        }

        // This predicate is evaluated for every long press, before this specific LINE_AI enum is returned to the list.
        supplier.method.addInstructions(
            injectionShape.availabilityBranchIndex,
            """
                invoke-static/range { v${injectionShape.availabilityRegister} .. v${injectionShape.availabilityRegister} }, $LINE_AI_CONTEXT_HOOK
                move-result v${injectionShape.availabilityRegister}
            """.trimIndent(),
        )
        patchStatusCollector.record(
            patchId = PatchId.LINE_AI_MESSAGE_CONTEXT_MENU,
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "LineAiLongPressContextSupplierGuarded",
        )
    }
}

private data class MessageContextSupplierInjectionShape(
    val availabilityBranchIndex: Int,
    val availabilityRegister: Int,
)

/** Validates the exact operand flow before changing the first conjunct of the LINE_AI supply predicate. */
private fun lineAiMessageContextSupplierInjectionShape(match: Match): MessageContextSupplierInjectionShape? {
    val method = match.method
    val implementation = method.implementation ?: return null
    val instructions = implementation.instructions.toList()
    val lineAiFieldIndex = match.instructionMatches[0].index
    val entrySourceIndex = match.instructionMatches[1].index
    val availabilityIndex = match.instructionMatches[2].index
    val lineAiFieldInstruction = instructions.getOrNull(lineAiFieldIndex) as? OneRegisterInstruction
    val availabilityResult = instructions.getOrNull(availabilityIndex + 1) as? OneRegisterInstruction
    val availabilityBranch = instructions.getOrNull(availabilityIndex + 2) as? OneRegisterInstruction
    val typeSetRead = (instructions.getOrNull(availabilityIndex + 3) as? ReferenceInstruction)
        ?.reference as? FieldReference
    val typeSetContains = (instructions.getOrNull(availabilityIndex + 4) as? ReferenceInstruction)
        ?.reference as? MethodReference
    val typeSetResult = instructions.getOrNull(availabilityIndex + 5) as? OneRegisterInstruction
    val typeBranch = instructions.getOrNull(availabilityIndex + 6) as? OneRegisterInstruction
    val suppliedItemReturn = instructions.getOrNull(availabilityIndex + 7) as? OneRegisterInstruction
    val nullItem = instructions.getOrNull(availabilityIndex + 8) as? OneRegisterInstruction
    val nullItemLiteral = instructions.getOrNull(availabilityIndex + 8) as? NarrowLiteralInstruction
    val nullItemReturn = instructions.getOrNull(availabilityIndex + 9) as? OneRegisterInstruction
    val nullItemAddress = instructionAddress(instructions, availabilityIndex + 8)

    if (
        lineAiFieldInstruction?.opcode != Opcode.SGET_OBJECT ||
        lineAiFieldIndex >= entrySourceIndex ||
        entrySourceIndex >= availabilityIndex ||
        availabilityResult?.opcode != Opcode.MOVE_RESULT ||
        availabilityResult.registerA !in 0..15 ||
        availabilityResult.registerA == lineAiFieldInstruction.registerA ||
        availabilityBranch?.opcode != Opcode.IF_EQZ ||
        availabilityBranch.registerA != availabilityResult.registerA ||
        instructions.getOrNull(availabilityIndex + 3)?.opcode != Opcode.SGET_OBJECT ||
        typeSetRead?.type != "Ljava/util/Set;" ||
        instructions.getOrNull(availabilityIndex + 4)?.opcode != Opcode.INVOKE_INTERFACE ||
        typeSetContains?.definingClass != "Ljava/util/Set;" ||
        typeSetContains.name != "contains" ||
        typeSetContains.parameterTypes != listOf(OBJECT) ||
        typeSetContains.returnType != BOOLEAN ||
        typeSetResult?.opcode != Opcode.MOVE_RESULT ||
        typeBranch?.opcode != Opcode.IF_EQZ ||
        typeBranch.registerA != typeSetResult.registerA ||
        branchTargetAddress(instructions, availabilityIndex + 2) != nullItemAddress ||
        branchTargetAddress(instructions, availabilityIndex + 6) != nullItemAddress ||
        suppliedItemReturn?.opcode != Opcode.RETURN_OBJECT ||
        suppliedItemReturn.registerA != lineAiFieldInstruction.registerA ||
        nullItem?.opcode != Opcode.CONST_4 ||
        nullItemLiteral?.narrowLiteral != 0 ||
        nullItemReturn?.opcode != Opcode.RETURN_OBJECT ||
        nullItemReturn.registerA != nullItem.registerA
    ) {
        return null
    }

    return MessageContextSupplierInjectionShape(
        availabilityBranchIndex = availabilityIndex + 2,
        availabilityRegister = availabilityResult.registerA,
    )
}

private fun recordLineAiMessageContextMenuUnapplied(actualTargetCount: Int, reason: String) {
    patchStatusCollector.record(lineAiMessageContextMenuUnappliedRecord(actualTargetCount, reason))
}

internal fun lineAiMessageContextMenuUnappliedRecord(
    actualTargetCount: Int,
    reason: String,
): PatchStatusRecord = PatchStatusRecord(
    patchId = PatchId.LINE_AI_MESSAGE_CONTEXT_MENU,
    status = when {
        actualTargetCount > 1 -> PatchStatus.ERROR
        actualTargetCount == 0 -> PatchStatus.TARGET_NOT_FOUND
        else -> PatchStatus.ERROR
    },
    expectedTargetCount = 1,
    actualTargetCount = actualTargetCount,
    reason = reason,
)
