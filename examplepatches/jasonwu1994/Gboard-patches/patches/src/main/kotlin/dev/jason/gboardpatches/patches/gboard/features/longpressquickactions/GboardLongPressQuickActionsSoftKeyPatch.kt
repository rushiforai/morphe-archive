package dev.jason.gboardpatches.patches.gboard.features.longpressquickactions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardStructuralFingerprint
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal const val LONG_PRESS_QUICK_ACTIONS_RUNTIME_CLASS =
    "Ldev/jason/gboardpatches/extension/longpressquickactions/GboardLongPressQuickActions1777Runtime;"
private const val SOFT_KEY_RUNTIME_DESCRIPTOR =
    "$LONG_PRESS_QUICK_ACTIONS_RUNTIME_CLASS->maybePatchMetadata(Ljava/lang/Object;Landroid/view/View;)Ljava/lang/Object;"
private const val SOFT_KEY_STOCK_ENTRY_STRING = "SoftKeyView.setSoftKeyDef"

internal val LONG_PRESS_QUICK_ACTIONS_SOFT_KEY_DELEGATE = """
    invoke-static {p1, p0}, $SOFT_KEY_RUNTIME_DESCRIPTOR

    move-result-object p1

    check-cast p1, Lowd;
""".trimIndent()

internal val gboardLongPressQuickActionsSoftKeyPatch = bytecodePatch(
    description = "在 17.7.7 SoftKeyView bind 前套用或回復 long-press shortcut metadata。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val method = findMutableMethodOrThrow(
            GboardLongPressQuickActions1777Bindings.softKeyBind,
        )
        method.applyLongPressQuickActionsSoftKeyDelegate()
    }
}

internal fun MutableMethod.applyLongPressQuickActionsSoftKeyDelegate() {
    val count = implementation!!.instructions.count {
        it.methodDescriptor() == SOFT_KEY_RUNTIME_DESCRIPTOR
    }
    check(count <= 1) { "Duplicate Long-press SoftKey delegates" }
    val stockEntryIndex = requireLongPressSoftKeyStockBodyFingerprint()
    if (count == 1) {
        requireValidLongPressSoftKeyDelegate(stockEntryIndex)
        return
    }
    addInstructions(0, LONG_PRESS_QUICK_ACTIONS_SOFT_KEY_DELEGATE)
    check(implementation!!.instructions.count {
        it.methodDescriptor() == SOFT_KEY_RUNTIME_DESCRIPTOR
    } == 1) { "Long-press SoftKey delegate insertion failed" }
    val patchedStockEntryIndex = requireLongPressSoftKeyStockBodyFingerprint()
    requireValidLongPressSoftKeyDelegate(patchedStockEntryIndex)
}

private fun MutableMethod.requireLongPressSoftKeyStockBodyFingerprint(): Int {
    val instructions = implementation!!.instructions
    val stockEntryIndex = instructions.indexOfFirst { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string ==
            SOFT_KEY_STOCK_ENTRY_STRING
    }
    check(stockEntryIndex >= 0) {
        "Missing stock entry anchor in ${GboardLongPressQuickActions1777Bindings.softKeyBind.descriptor()}"
    }
    val actual = gboardStructuralFingerprint(stockEntryIndex)
    check(actual == GboardLongPressQuickActions1777Bindings.softKeyStockFingerprint) {
        "Stock body drift in ${GboardLongPressQuickActions1777Bindings.softKeyBind.descriptor()}: $actual"
    }
    return stockEntryIndex
}

private fun MutableMethod.requireValidLongPressSoftKeyDelegate(stockEntryIndex: Int) {
    val instructions = implementation!!.instructions
    val delegateIndex = instructions.indexOfFirst {
        it.methodDescriptor() == SOFT_KEY_RUNTIME_DESCRIPTOR
    }
    check(delegateIndex >= 0 && delegateIndex + 2 < stockEntryIndex) {
        "Malformed Long-press SoftKey delegate position"
    }
    val moveResult = instructions[delegateIndex + 1] as? OneRegisterInstruction
    val checkCast = instructions[delegateIndex + 2]
    val checkCastRegister = checkCast as? OneRegisterInstruction
    check(
        moveResult?.opcode == Opcode.MOVE_RESULT_OBJECT &&
            checkCast.opcode == Opcode.CHECK_CAST &&
            moveResult?.registerA == checkCastRegister?.registerA &&
            (checkCast as? ReferenceInstruction)?.reference?.toString() == "Lowd;",
    ) {
        "Malformed Long-press SoftKey delegate sequence"
    }
}

internal fun MutableMethod.requireLongPressStockFingerprint(
    expected: String,
    descriptor: String,
) {
    val actual = gboardStructuralFingerprint()
    check(actual == expected) { "Stock body drift in $descriptor: $actual" }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.methodDescriptor(): String? =
    ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()
