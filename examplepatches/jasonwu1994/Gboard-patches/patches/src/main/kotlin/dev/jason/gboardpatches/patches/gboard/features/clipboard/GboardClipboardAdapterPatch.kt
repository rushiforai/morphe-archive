package dev.jason.gboardpatches.patches.gboard.features.clipboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.mutableClass
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices

internal val gboardClipboardAdapterTrimPatch = bytecodePatch(
    description = "移植 clipboard adapter trim 保險"
) {
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val mutableMethod = findMutableMethodOrThrow(
            classType = CLIPBOARD_ADAPTER_CLASS,
            name = "F",
            returnType = "V",
            parameterTypes = emptyList()
        )
        mutableMethod.applyClipboardAdapterTrimDelegate()
    }
}

internal val gboardClipboardItemBindPatch = bytecodePatch(
    description = "移植 clipboard countdown / creation time / preview lines bind。"
) {
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val mutableMethod = findMutableMethodOrThrow(
            classType = CLIPBOARD_ADAPTER_CLASS,
            name = "p",
            returnType = "V",
            parameterTypes = listOf(RECYCLER_VIEW_HOLDER_CLASS, "I")
        )
        val patchedMethod = mutableMethod.applyClipboardItemBindDelegate()
        if (patchedMethod !== mutableMethod) {
            val methods = mutableClass(CLIPBOARD_ADAPTER_CLASS).methods
            check(methods.remove(mutableMethod) && methods.add(patchedMethod)) {
                "Could not replace expanded Clipboard item-bind method"
            }
        }
    }
}

internal fun MutableMethod.applyClipboardAdapterTrimDelegate() {
    requireExactClipboardTarget(CLIPBOARD_ADAPTER_CLASS, "F", "V", emptyList())
    applyClipboardReturnDelegate(TRIM_METHOD_DESCRIPTOR, TRIM_DELEGATE, 1)
}

internal fun MutableMethod.applyClipboardItemBindDelegate(): MutableMethod {
    requireExactClipboardTarget(
        CLIPBOARD_ADAPTER_CLASS,
        "p",
        "V",
        listOf(RECYCLER_VIEW_HOLDER_CLASS, "I"),
    )
    val implementation = implementation ?: error("No instructions in $definingClass->$name")
    val fingerprint = clipboardStructuralFingerprint()
    if (implementation.registerCount == ITEM_BIND_EXPANDED_REGISTER_COUNT) {
        check(fingerprint == ITEM_BIND_PATCHED_FINGERPRINT) {
            "Malformed partial Clipboard item-bind state in $definingClass->$name: $fingerprint"
        }
        validateExpandedClipboardItemBind()
        return this
    }
    check(
        implementation.registerCount == ITEM_BIND_STOCK_REGISTER_COUNT &&
            fingerprint == ITEM_BIND_STOCK_FINGERPRINT,
    ) {
        "Unexpected stock Clipboard item-bind structure in $definingClass->$name: $fingerprint"
    }

    val expanded = expandClipboardItemBindRegisters()
    expanded.addInstructions(0, ITEM_BIND_ENTRY_COPIES)
    val expandedInstructions = expanded.implementation!!.instructions
    val returnIndices = expanded.returnInstructionIndices().filter {
        expandedInstructions[it].normalizedOpcode() == "RETURN_VOID"
    }
    check(returnIndices.size == ITEM_BIND_RETURN_COUNT) {
        "Expected $ITEM_BIND_RETURN_COUNT Clipboard item-bind returns"
    }
    returnIndices.sortedDescending().forEach { returnIndex ->
        expanded.addInstructions(returnIndex, ITEM_BIND_DELEGATE)
    }
    val patchedFingerprint = expanded.clipboardStructuralFingerprint()
    check(patchedFingerprint == ITEM_BIND_PATCHED_FINGERPRINT) {
        "Unexpected generated Clipboard item-bind structure: $patchedFingerprint"
    }
    expanded.validateExpandedClipboardItemBind()
    return expanded
}

private fun MutableMethod.expandClipboardItemBindRegisters(): MutableMethod {
    val stock = implementation ?: error("No instructions in $definingClass->$name")
    val expandedImplementation = ImmutableMethodImplementation(
        ITEM_BIND_EXPANDED_REGISTER_COUNT,
        stock.instructions,
        stock.tryBlocks,
        stock.debugItems,
    )
    return ImmutableMethod(
        definingClass,
        name,
        parameters,
        returnType,
        accessFlags,
        annotations,
        hiddenApiRestrictions,
        expandedImplementation,
    ).toMutable()
}

private fun MutableMethod.validateExpandedClipboardItemBind() {
    val implementation = implementation ?: error("No instructions in $definingClass->$name")
    check(implementation.registerCount == ITEM_BIND_EXPANDED_REGISTER_COUNT)
    val instructions = implementation.instructions
    val savedP0 = p0Register()
    check(
        instructions.getOrNull(0).isExactMove(
            "MOVE_OBJECT_FROM16", ITEM_BIND_LEGACY_P0_REGISTER, savedP0,
        ) &&
            instructions.getOrNull(1).isExactMove(
                "MOVE_OBJECT_FROM16", ITEM_BIND_LEGACY_P0_REGISTER + 1, savedP0 + 1,
            ) &&
            instructions.getOrNull(2).isExactMove(
                "MOVE_FROM16", ITEM_BIND_LEGACY_P0_REGISTER + 2, savedP0 + 2,
            ),
    ) {
        "Clipboard item-bind entry parameter copies are missing or malformed"
    }
    val returnIndices = returnInstructionIndices().filter {
        instructions[it].normalizedOpcode() == "RETURN_VOID"
    }
    check(returnIndices.size == ITEM_BIND_RETURN_COUNT)
    check(
        instructions.clipboardRuntimeReferenceCount() == ITEM_BIND_RETURN_COUNT &&
            returnIndices.all { returnIndex ->
                instructions.getOrNull(returnIndex - 1)?.isExactRangeInvoke(
                    ITEM_BIND_METHOD_DESCRIPTOR,
                    savedP0,
                    3,
                ) == true
            },
    ) {
        "Clipboard item-bind return delegates are missing or malformed"
    }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction?.isExactMove(
    opcode: String,
    destination: Int,
    source: Int,
): Boolean =
    this?.normalizedOpcode() == opcode &&
        this is TwoRegisterInstruction &&
        registerA == destination &&
        registerB == source

private fun MutableMethod.applyClipboardReturnDelegate(
    descriptor: String,
    delegate: String,
    parameterRegisterCount: Int,
) {
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val returnIndices = returnInstructionIndices().filter {
        instructions[it].normalizedOpcode() == "RETURN_VOID"
    }
    check(returnIndices.isNotEmpty()) {
        "Could not resolve return instructions in $definingClass->$name"
    }
    val delegateCount = instructions.count { it.methodDescriptor() == descriptor }
    if (instructions.clipboardRuntimeReferenceCount() > 0) {
        val completed = delegateCount == returnIndices.size &&
            instructions.clipboardRuntimeReferenceCount() == delegateCount &&
            returnIndices.all { returnIndex ->
                instructions.getOrNull(returnIndex - 1)?.isExactRangeInvoke(
                    descriptor,
                    p0Register(),
                    parameterRegisterCount,
                ) == true
            }
        check(completed) {
            "Malformed partial Clipboard return delegate in $definingClass->$name"
        }
        return
    }
    returnIndices.sortedDescending().forEach { returnIndex ->
        addInstructions(returnIndex, delegate)
    }
}

private val TRIM_DELEGATE = """
    invoke-static/range {p0 .. p0}, ${CLIPBOARD_RUNTIME_CLASS}->afterAdapterTrim(Ljava/lang/Object;)V
""".trimIndent()

private val ITEM_BIND_DELEGATE = """
    invoke-static/range {p0 .. p2}, ${CLIPBOARD_RUNTIME_CLASS}->afterItemBind(Ljava/lang/Object;Ljava/lang/Object;I)V
""".trimIndent()

private val ITEM_BIND_ENTRY_COPIES = """
    move-object/from16 v13, p0
    move-object/from16 v14, p1
    move/from16 v15, p2
""".trimIndent()

private const val TRIM_METHOD_DESCRIPTOR =
    "$CLIPBOARD_RUNTIME_CLASS->afterAdapterTrim(Ljava/lang/Object;)V"
private const val ITEM_BIND_METHOD_DESCRIPTOR =
    "$CLIPBOARD_RUNTIME_CLASS->afterItemBind(Ljava/lang/Object;Ljava/lang/Object;I)V"
private const val ITEM_BIND_STOCK_REGISTER_COUNT = 16
private const val ITEM_BIND_EXPANDED_REGISTER_COUNT = 19
private const val ITEM_BIND_LEGACY_P0_REGISTER = 13
private const val ITEM_BIND_RETURN_COUNT = 5
private const val ITEM_BIND_STOCK_FINGERPRINT =
    "caa7bfc3bd842102dcd076af7fb6d6d01a69e2b6a3dfa71daa7c172965889740"
private const val ITEM_BIND_PATCHED_FINGERPRINT =
    "f8b4f46c446a0dc3787f132f6061d333b3e5d5b5bdf789b4b121294751536b4a"
