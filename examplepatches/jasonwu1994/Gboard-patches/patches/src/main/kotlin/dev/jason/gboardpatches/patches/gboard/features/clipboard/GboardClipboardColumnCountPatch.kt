package dev.jason.gboardpatches.patches.gboard.features.clipboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch

internal val gboardClipboardColumnCountPatch = bytecodePatch(
    description = "移植 clipboard 欄數 override。"
) {
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val mutableMethod = findMutableMethodOrThrow(
            classType = CLIPBOARD_KEYBOARD_CLASS,
            name = "l",
            returnType = "I",
            parameterTypes = emptyList()
        )
        mutableMethod.applyClipboardColumnCountDelegate()
    }
}

internal fun MutableMethod.applyClipboardColumnCountDelegate() {
    requireExactClipboardTarget(CLIPBOARD_KEYBOARD_CLASS, "l", "I", emptyList())
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val p0 = p0Register()
    val delegateCount = instructions.count { it.methodDescriptor() == COLUMN_METHOD_DESCRIPTOR }
    val invoke = instructions.getOrNull(1) as? FiveRegisterInstruction
    val completed = instructions.size >= 8 &&
        instructions[0].normalizedOpcode() == "MOVE_OBJECT" &&
        (instructions[0] as? TwoRegisterInstruction)?.registerA == 0 &&
        (instructions[0] as? TwoRegisterInstruction)?.registerB == p0 &&
        instructions[1].normalizedOpcode() == "INVOKE_STATIC" &&
        instructions[1].methodDescriptor() == COLUMN_METHOD_DESCRIPTOR &&
        invoke?.registerCount == 1 && invoke.registerC == 0 &&
        instructions[2].normalizedOpcode() == "MOVE_RESULT_OBJECT" &&
        (instructions[2] as? OneRegisterInstruction)?.registerA == p0 &&
        instructions[3].normalizedOpcode() == "IF_EQZ" &&
        (instructions[3] as? OneRegisterInstruction)?.registerA == p0 &&
        instructions[4].methodDescriptor() == INTEGER_VALUE_DESCRIPTOR &&
        instructions[5].normalizedOpcode() == "MOVE_RESULT" &&
        (instructions[5] as? OneRegisterInstruction)?.registerA == p0 &&
        instructions[6].normalizedOpcode() == "RETURN" &&
        (instructions[6] as? OneRegisterInstruction)?.registerA == p0 &&
        instructions[7].normalizedOpcode() == "MOVE_OBJECT" &&
        (instructions[7] as? TwoRegisterInstruction)?.registerA == p0 &&
        (instructions[7] as? TwoRegisterInstruction)?.registerB == 0
    if (instructions.clipboardRuntimeReferenceCount() > 0) {
        check(delegateCount == 1 && completed) {
            "Malformed partial Clipboard column delegate in $definingClass->$name"
        }
        return
    }
    addInstructions(0, COLUMN_COUNT_DELEGATE)
}

private val COLUMN_COUNT_DELEGATE = """
    move-object v0, p0

    invoke-static {v0}, ${CLIPBOARD_RUNTIME_CLASS}->resolveColumnCountOverride(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object p0

    if-eqz p0, :jasondev_continue

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0

    :jasondev_continue
    move-object p0, v0
""".trimIndent()

private const val COLUMN_METHOD_DESCRIPTOR =
    "$CLIPBOARD_RUNTIME_CLASS->resolveColumnCountOverride(Ljava/lang/Object;)Ljava/lang/Integer;"
private const val INTEGER_VALUE_DESCRIPTOR = "Ljava/lang/Integer;->intValue()I"
