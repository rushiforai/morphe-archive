package app.aidan.patches.adobescan.customization

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val FILE_OPTIONS_MENU_HELPER = "Lqt/u;"
internal const val FILE_LIST_TOOLS_HELPER = "Lut/q0;"
internal const val FILE_LIST_TOOLS_ACTIONS = "Lut/r0;"
internal const val FILE_LIST_TOOLS = "Lut/p0;"
internal const val SHARE_BOTTOM_SHEET = "Lqt/q2;"
internal const val SCAN_UTIL_A = "Lcom/adobe/scan/android/util/a;"

internal const val RES_GENAI_SUMMARY_TITLE = 0x7f142405
internal const val RES_FILE_LIST_MOVE = 0x7f142396
internal const val RES_COMPRESS_PDF = 0x7f1421b3
internal const val RES_SEND_COMPRESSED = 0x7f1427dd

/**
 * Neutralizes the Generative summary item in the File Options bottom sheet.
 * Generative summary requires Adobe Document Cloud and GenAI subscription infrastructure.
 * This method is idempotent across multiple calls.
 */
internal fun BytecodePatchContext.removeGenerativeSummary() {
    val fileOptionsClass = mutableClassDefByOrNull(FILE_OPTIONS_MENU_HELPER)
        ?: throw PatchException("FileOptionsMenuBottomSheet class $FILE_OPTIONS_MENU_HELPER not found")
    val optionsMethod = fileOptionsClass.methods.singleOrNull {
        it.name == "a" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Lqt/a;", "Lfu/b;", "Ljava/util/List;") &&
            it.returnType == "Lm90/b;" &&
            it.implementation != null
    } ?: throw PatchException("FileOptionsMenuBottomSheet options method not found")

    val instructions = optionsMethod.implementation?.instructions
        ?: throw PatchException("FileOptionsMenuBottomSheet options method has no implementation")

    val genAiIndex = instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_INTERFACE_RANGE &&
            reference?.definingClass == "Lfu/b;" &&
            reference.name == "g" &&
            reference.parameterTypes.isEmpty() &&
            reference.returnType == "Z"
    }
    if (genAiIndex < 0) {
        throw PatchException("Could not find GenAI entitlement call in FileOptionsMenuBottomSheet")
    }

    val moveResult = instructions.getOrNull(genAiIndex + 1) as? OneRegisterInstruction
        ?: throw PatchException("Missing move-result for GenAI entitlement call")
    if (moveResult.opcode != Opcode.MOVE_RESULT) {
        throw PatchException("Unexpected instruction following GenAI call: ${moveResult.opcode}")
    }

    // Check if already patched
    val nextInst = instructions.getOrNull(genAiIndex + 2)
    if (nextInst is OneRegisterInstruction && nextInst.opcode == Opcode.CONST_4 && nextInst.registerA == moveResult.registerA) {
        return
    }

    val hasSummaryString = (genAiIndex + 2..minOf(instructions.size - 1, genAiIndex + 20)).any { idx ->
        val inst = instructions[idx]
        inst is NarrowLiteralInstruction && inst.narrowLiteral == RES_GENAI_SUMMARY_TITLE
    }
    if (!hasSummaryString) {
        throw PatchException("Did not find Generative summary resource id following GenAI check")
    }

    optionsMethod.addInstructions(genAiIndex + 2, "const/4 v${moveResult.registerA}, 0x0")
}

/**
 * Removes non-functional Edit text from File Options bottom sheets, Preview bottom toolbar,
 * and Recent scan cards by disabling the global edit text availability predicate.
 * Idempotent.
 */
internal fun BytecodePatchContext.removeEditText() {
    val utilAClass = mutableClassDefByOrNull(SCAN_UTIL_A)
        ?: throw PatchException("Util class $SCAN_UTIL_A not found")
    val jMethod = utilAClass.methods.singleOrNull {
        it.name == "j" &&
            it.parameterTypes.isEmpty() &&
            it.returnType == "Z" &&
            it.implementation != null
    } ?: throw PatchException("Util method j not found in $SCAN_UTIL_A")

    val first = jMethod.implementation?.instructions?.firstOrNull()
    if (first is OneRegisterInstruction && first.opcode == Opcode.CONST_4 && first.registerA == 0) {
        return
    }

    jMethod.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
}

/**
 * Removes the Move file option from File Options bottom sheets across all surfaces.
 * Idempotent.
 */
internal fun BytecodePatchContext.removeMove() {
    val fileOptionsClass = mutableClassDefByOrNull(FILE_OPTIONS_MENU_HELPER)
        ?: throw PatchException("FileOptionsMenuBottomSheet class $FILE_OPTIONS_MENU_HELPER not found")
    val optionsMethod = fileOptionsClass.methods.singleOrNull {
        it.name == "a" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Lqt/a;", "Lfu/b;", "Ljava/util/List;") &&
            it.returnType == "Lm90/b;" &&
            it.implementation != null
    } ?: throw PatchException("FileOptionsMenuBottomSheet options method not found")

    val instructions = optionsMethod.implementation?.instructions
        ?: throw PatchException("FileOptionsMenuBottomSheet options method has no implementation")

    val moveIndices = instructions.mapIndexedNotNull { idx, inst ->
        if (inst is NarrowLiteralInstruction && inst.narrowLiteral == RES_FILE_LIST_MOVE) idx else null
    }
    if (moveIndices.isEmpty()) {
        throw PatchException("Could not find Move resource id in FileOptionsMenuBottomSheet")
    }

    moveIndices.forEach { moveIdx ->
        val range = moveIdx + 1..minOf(instructions.size - 1, moveIdx + 10)
        var addIndex: Int? = null
        for (idx in range) {
            val inst = instructions[idx]
            if (inst.opcode == Opcode.NOP) {
                break
            }
            val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
            if (inst.opcode == Opcode.INVOKE_VIRTUAL &&
                ref?.definingClass == "Lm90/b;" &&
                ref.name == "add"
            ) {
                addIndex = idx
                break
            }
        }
        if (addIndex != null) {
            optionsMethod.replaceInstruction(addIndex, "nop")
        }
    }
}

/**
 * Removes cloud-dependent Save as Word doc from Recent scan cards.
 * Idempotent.
 */
internal fun BytecodePatchContext.removeSaveAsWord() {
    if (isLocalPdfExportActive || isLocalPdfExportHooked()) {
        return
    }
    val q0Class = mutableClassDefByOrNull(FILE_LIST_TOOLS_HELPER)
        ?: throw PatchException("FileListToolsHelper class $FILE_LIST_TOOLS_HELPER not found")
    val bMethod = q0Class.methods.singleOrNull {
        it.name == "b" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Lcom/adobe/scan/android/file/m0;") &&
            it.returnType == "Z" &&
            it.implementation != null
    } ?: throw PatchException("FileListToolsHelper method b not found in $FILE_LIST_TOOLS_HELPER")

    val first = bMethod.implementation?.instructions?.firstOrNull()
    if (first is OneRegisterInstruction && first.opcode == Opcode.CONST_4 && first.registerA == 0) {
        // already patched
    } else {
        bMethod.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }

    val toolsClass = mutableClassDefByOrNull(FILE_LIST_TOOLS_ACTIONS)
        ?: throw PatchException("FileListTools actions class $FILE_LIST_TOOLS_ACTIONS not found")
    val initMethod = toolsClass.methods.firstOrNull {
        it.name == "<init>" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Lod/ll;", "Lod/ll;") &&
            it.implementation != null
    } ?: throw PatchException("FileListTools actions constructor not found")

    val initInstructions = initMethod.implementation?.instructions
        ?: throw PatchException("FileListTools actions constructor has no implementation")

    val wordSgetIndexInInit = initInstructions.indexOfFirst { inst ->
        val ref = (inst as? ReferenceInstruction)?.reference as? FieldReference
        inst.opcode == Opcode.SGET_OBJECT &&
            ref?.definingClass == FILE_LIST_TOOLS &&
            ref.name == "r"
    }
    if (wordSgetIndexInInit >= 0) {
        val filledArrayIdxInInit = (wordSgetIndexInInit + 1..minOf(initInstructions.size - 1, wordSgetIndexInInit + 5)).firstOrNull {
            initInstructions[it].opcode == Opcode.FILLED_NEW_ARRAY
        }
        if (filledArrayIdxInInit != null) {
            val filledInst = initInstructions[filledArrayIdxInInit] as? FiveRegisterInstruction
            if (filledInst != null && filledInst.registerCount == 3) {
                initMethod.replaceInstruction(
                    filledArrayIdxInInit,
                    "filled-new-array {v${filledInst.registerC}, v${filledInst.registerE}}, [Lod/ll;"
                )
            }
        }
    }
}

/**
 * Removes cloud link sharing options from the Share bottom sheet, leaving only local PDF sharing.
 * Idempotent.
 */
internal fun BytecodePatchContext.removeLinkSharing() {
    val shareSheetClass = mutableClassDefByOrNull(SHARE_BOTTOM_SHEET)
        ?: throw PatchException("Share bottom sheet class $SHARE_BOTTOM_SHEET not found")

    val hMethod = shareSheetClass.methods.firstOrNull {
        it.name == "h" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Lqt/d3;", "Lqt/q1;", "Lg3/o;", "I") &&
            it.returnType == "V" &&
            it.implementation != null
    } ?: throw PatchException("Share link composable method h not found in $SHARE_BOTTOM_SHEET")
    if (hMethod.implementation?.instructions?.firstOrNull()?.opcode != Opcode.RETURN_VOID) {
        hMethod.addInstructions(0, "return-void")
    }

    val eMethod = shareSheetClass.methods.firstOrNull {
        it.name == "e" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Lqt/d3;", "Lqt/q1;", "Lg3/o;", "I") &&
            it.returnType == "V" &&
            it.implementation != null
    } ?: throw PatchException("Share bottom sheet composable method e not found in $SHARE_BOTTOM_SHEET")

    val eInstructions = eMethod.implementation?.instructions
        ?: throw PatchException("Method e has no implementation in $SHARE_BOTTOM_SHEET")

    val hCallIndex = eInstructions.indexOfFirst { inst ->
        val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
        inst.opcode == Opcode.INVOKE_STATIC &&
            ref?.definingClass == SHARE_BOTTOM_SHEET &&
            ref.name == "h"
    }
    if (hCallIndex >= 0) {
        eMethod.replaceInstruction(hCallIndex, "nop")
    }

    val dCallIndex = eInstructions.indexOfFirst { inst ->
        val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
        inst.opcode == Opcode.INVOKE_STATIC &&
            ref?.definingClass == SHARE_BOTTOM_SHEET &&
            ref.name == "d"
    }
    if (dCallIndex >= 0) {
        eMethod.replaceInstruction(dCallIndex, "nop")
    }
}

/**
 * Neutralizes the Compress PDF option in File Options bottom sheet
 * and Send compressed in the Share bottom sheet.
 * If Local PDF Compression replacement is enabled in Local Premium, removal is skipped
 * so the local replacement remains accessible from file menus and share sheets.
 * Idempotent.
 */
internal fun BytecodePatchContext.removeCompressPdf() {
    if (isLocalPdfCompressionActive || isLocalPdfCompressionHooked()) {
        return
    }
    val fileOptionsClass = mutableClassDefByOrNull(FILE_OPTIONS_MENU_HELPER)
        ?: throw PatchException("FileOptionsMenuBottomSheet class $FILE_OPTIONS_MENU_HELPER not found")
    val optionsMethod = fileOptionsClass.methods.singleOrNull {
        it.name == "a" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Lqt/a;", "Lfu/b;", "Ljava/util/List;") &&
            it.returnType == "Lm90/b;" &&
            it.implementation != null
    } ?: throw PatchException("FileOptionsMenuBottomSheet options method not found")

    val instructions = optionsMethod.implementation?.instructions
        ?: throw PatchException("FileOptionsMenuBottomSheet options method has no implementation")

    val compressStringIndex = instructions.indexOfFirst {
        it is NarrowLiteralInstruction && it.narrowLiteral == RES_COMPRESS_PDF
    }
    if (compressStringIndex < 0) {
        throw PatchException("Could not find Compress PDF resource id in FileOptionsMenuBottomSheet")
    }

    val addRange = compressStringIndex + 1..minOf(instructions.size - 1, compressStringIndex + 15)
    var addIndex: Int? = null
    for (idx in addRange) {
        val inst = instructions[idx]
        if (inst.opcode == Opcode.NOP) {
            break
        }
        val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
        if (inst.opcode == Opcode.INVOKE_VIRTUAL && ref?.name == "add") {
            addIndex = idx
            break
        }
    }
    if (addIndex != null) {
        optionsMethod.replaceInstruction(addIndex, "nop")
    }

    val shareSheetClass = mutableClassDefByOrNull(SHARE_BOTTOM_SHEET)
        ?: throw PatchException("Share bottom sheet class $SHARE_BOTTOM_SHEET not found")
    val iMethod = shareSheetClass.methods.firstOrNull {
        it.name == "i" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Lqt/d3;", "Lqt/q1;", "Lg3/o;", "I") &&
            it.returnType == "V" &&
            it.implementation != null
    } ?: throw PatchException("Share bottom sheet composable method i not found in $SHARE_BOTTOM_SHEET")

    val iInstructions = iMethod.implementation?.instructions
        ?: throw PatchException("Method i has no implementation in $SHARE_BOTTOM_SHEET")

    val sendCompressedIndex = iInstructions.indexOfFirst {
        it is NarrowLiteralInstruction && it.narrowLiteral == RES_SEND_COMPRESSED
    }
    if (sendCompressedIndex < 0) {
        throw PatchException("Could not find Send compressed resource id in Share bottom sheet")
    }

    val gRange = sendCompressedIndex + 1..minOf(iInstructions.size - 1, sendCompressedIndex + 25)
    var gCallIndex: Int? = null
    for (idx in gRange) {
        val inst = iInstructions[idx]
        if (inst.opcode == Opcode.NOP) {
            break
        }
        val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
        if (inst.opcode == Opcode.INVOKE_STATIC &&
            ref?.definingClass == SHARE_BOTTOM_SHEET &&
            ref.name == "g"
        ) {
            gCallIndex = idx
            break
        }
    }
    if (gCallIndex != null) {
        iMethod.replaceInstruction(gCallIndex, "nop")
    }
}

internal fun BytecodePatchContext.isLocalPdfCompressionHooked(): Boolean {
    val qaClass = mutableClassDefByOrNull(COMPRESS_RESULT_CONSUMER) ?: return false
    return qaClass.methods.any { method ->
        method.implementation?.instructions?.any { inst ->
            val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lapp/aidan/extension/adobescan/PdfCompressionBridge;"
        } == true
    }
}

internal fun BytecodePatchContext.isLocalPdfExportHooked(): Boolean {
    val actionClass = mutableClassDefByOrNull(RECENT_CARD_TOOL_ACTION) ?: return false
    return actionClass.methods.any { method ->
        method.implementation?.instructions?.any { inst ->
            val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lapp/aidan/extension/adobescan/PdfExportBridge;"
        } == true
    }
}
