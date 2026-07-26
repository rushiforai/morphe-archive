package dev.jason.gboardpatches.patches.gboard.features.clipboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch

internal val gboardClipboardLoaderPatch = bytecodePatch(
    description = "移植 clipboard visible list 重組與 TTL cutoff"
) {
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val mutableMethod = findMutableMethodOrThrow(
            classType = CLIPBOARD_LOADER_CALLABLE_CLASS,
            name = "call",
            returnType = "Ljava/lang/Object;",
            parameterTypes = emptyList()
        )
        mutableMethod.applyClipboardLoaderDelegate()
    }
}

internal fun MutableMethod.applyClipboardLoaderDelegate() {
    requireExactClipboardTarget(
        CLIPBOARD_LOADER_CALLABLE_CLASS,
        "call",
        "Ljava/lang/Object;",
        emptyList(),
    )
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val delegateCount = instructions.count { it.methodDescriptor() == LOADER_METHOD_DESCRIPTOR }
    val completed = instructions.size >= 4 &&
        instructions[0].isExactRangeInvoke(LOADER_METHOD_DESCRIPTOR, p0Register(), 1) &&
        instructions[1].normalizedOpcode() == "MOVE_RESULT_OBJECT" &&
        (instructions[1] as? OneRegisterInstruction)?.registerA == 0 &&
        instructions[2].normalizedOpcode() == "IF_EQZ" &&
        (instructions[2] as? OneRegisterInstruction)?.registerA == 0 &&
        instructions[3].normalizedOpcode() == "RETURN_OBJECT" &&
        (instructions[3] as? OneRegisterInstruction)?.registerA == 0
    if (instructions.clipboardRuntimeReferenceCount() > 0) {
        check(delegateCount == 1 && completed) {
            "Malformed partial Clipboard loader delegate in $definingClass->$name"
        }
        return
    }
    addInstructions(0, LOADER_DELEGATE)
}

private val LOADER_DELEGATE = """
    invoke-static/range {p0 .. p0}, ${CLIPBOARD_RUNTIME_CLASS}->maybeBuildLoaderResult(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :jasondev_continue

    return-object v0

    :jasondev_continue
""".trimIndent()

private const val LOADER_METHOD_DESCRIPTOR =
    "$CLIPBOARD_RUNTIME_CLASS->maybeBuildLoaderResult(Ljava/lang/Object;)Ljava/lang/Object;"
