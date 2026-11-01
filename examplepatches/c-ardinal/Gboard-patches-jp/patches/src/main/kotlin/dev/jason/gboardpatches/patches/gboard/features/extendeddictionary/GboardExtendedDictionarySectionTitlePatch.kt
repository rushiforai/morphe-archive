package dev.jason.gboardpatches.patches.gboard.features.extendeddictionary

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

/** Personal dictionary language label used by every 単語リスト screen (never the picker). */
internal val EXTENDED_DICTIONARY_SECTION_TITLE_TARGET = GboardMethodTarget(
    "Lqpu;",
    "b",
    listOf("Landroid/content/Context;", "Lpex;", "Lsfc;"),
    "Ljava/lang/CharSequence;",
)

internal const val SECTION_TITLE_STOCK_LABEL_CALL =
    "Lpgr;->d(Landroid/content/Context;Lpex;Lsfc;)Ljava/lang/CharSequence;"
private const val SECTION_TITLE_REGISTER_COUNT = 4

internal val gboardExtendedDictionarySectionTitlePatch = bytecodePatch(
    description = "將 Extended Dictionary 匯入的日文字典在單字清單中顯示為獨立名稱。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)
    execute {
        findMutableMethodOrThrow(EXTENDED_DICTIONARY_SECTION_TITLE_TARGET).applySectionTitleHook()
    }
}

/**
 * Stock 18.5.4 tail: `invoke-static {v1, v2, v3}, pgr.d` / `move-result-object v1` /
 * `return-object v1`, with v1 = Context and v3 = sfc (both untouched before the call). v0 only
 * held the dead `sfc.equals` result, so the label is parked in v0 while the runtime receives
 * {v1 Context, v3 sfc, v0 label}; its result goes back to v1 for the original return.
 */
internal fun MutableMethod.applySectionTitleHook() {
    val implementation = implementation ?: error("$definingClass->$name has no implementation")
    check(implementation.registerCount == SECTION_TITLE_REGISTER_COUNT) {
        "Unexpected register count in $definingClass->$name: ${implementation.registerCount}"
    }
    val instructions = implementation.instructions.toList()
    val calls = instructions.indices.filter { index ->
        instructions[index].isMethodReference(SECTION_TITLE_STOCK_LABEL_CALL)
    }
    check(calls.size == 1) { "Expected exactly one pgr.d call in $definingClass->$name" }
    val call = calls.single()
    val invoke = instructions[call]
    val moveResult = instructions.getOrNull(call + 1)
    val returned = instructions.getOrNull(call + 2)
    check(
        invoke.opcode == Opcode.INVOKE_STATIC &&
            (invoke as FiveRegisterInstruction).let { args ->
                args.registerCount == 3 && args.registerC == 1 && args.registerD == 2 &&
                    args.registerE == 3
            } &&
            moveResult?.opcode == Opcode.MOVE_RESULT_OBJECT &&
            (moveResult as OneRegisterInstruction).registerA == 1 &&
            returned?.opcode == Opcode.RETURN_OBJECT &&
            (returned as OneRegisterInstruction).registerA == 1 &&
            call + 3 == instructions.size,
    ) {
        "Unexpected pgr.d tail in $definingClass->$name"
    }
    replaceInstruction(call + 1, "move-result-object v0")
    addInstructions(
        call + 2,
        """
        ${RuntimeCallEmitter.invoke(RuntimeCallId.EXTENDED_DICTIONARY_RUNTIME_SECTION_TITLE, "v1, v3, v0")}
        move-result-object v1
        """.trimIndent(),
    )
}
