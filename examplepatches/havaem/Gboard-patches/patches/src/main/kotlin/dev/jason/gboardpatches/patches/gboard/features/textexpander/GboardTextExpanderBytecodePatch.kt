package dev.jason.gboardpatches.patches.gboard.features.textexpander

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardTextExpanderBytecodePatch = bytecodePatch(
    description = "在 IME 輸入事件入口攔截空白鍵，將游標前的縮寫換成展開文字。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        findMutableMethodOrThrow(
            classType = INPUT_SERVICE_CLASS,
            name = INPUT_EVENT_NAME,
            returnType = INPUT_EVENT_RETURN,
            parameterTypes = listOf(INPUT_EVENT_TYPE),
        ).applyTextExpanderInputHook()
    }
}

/**
 * The runtime consumes a Space press only after it replaced a shortcut; every other event
 * falls through to the stock entry unchanged.
 */
internal fun MutableMethod.applyTextExpanderInputHook() {
    val abi = RuntimeAbiCatalog.abi(RuntimeCallId.TEXT_EXPANDER_RUNTIME_ON_INPUT)
    val body = implementation ?: error("No instructions in $definingClass->$name")
    val existing = body.instructions.count { it.isMethodReference(abi.reference) }
    if (existing > 0) {
        check(existing == 1) { "Malformed text expander input hook in $definingClass->$name" }
        return
    }
    // v0 is a local: the stock body overwrites it before reading it.
    check(body.registerCount > parameterTypes.size + 1) {
        "No scratch register in $definingClass->$name"
    }
    addInstructions(
        0,
        """
            ${RuntimeCallEmitter.invoke(RuntimeCallId.TEXT_EXPANDER_RUNTIME_ON_INPUT, "p0 .. p1")}

            move-result v0

            if-eqz v0, :jasondev_text_expander_stock

            return-void

            :jasondev_text_expander_stock
        """.trimIndent(),
    )
}

private const val INPUT_SERVICE_CLASS = "Lphr;"
private const val INPUT_EVENT_NAME = "dG"
private const val INPUT_EVENT_TYPE = "Lohe;"
private const val INPUT_EVENT_RETURN = "V"
