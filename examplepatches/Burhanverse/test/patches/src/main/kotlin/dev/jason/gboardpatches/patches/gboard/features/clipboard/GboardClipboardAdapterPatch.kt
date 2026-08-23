package dev.jason.gboardpatches.patches.gboard.features.clipboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationPlan
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationState
import dev.jason.gboardpatches.patches.gboard.shared.applyVerified
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.isOpcode
import dev.jason.gboardpatches.patches.gboard.shared.mutableClass
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId

private val TRIM_RUNTIME_CALL = RuntimeCallId.CLIPBOARD_RUNTIME_AFTER_ADAPTER_TRIM
private val ITEM_BIND_BEFORE_RUNTIME_CALL = RuntimeCallId.CLIPBOARD_RUNTIME_BEFORE_ITEM_BIND
private val ITEM_BIND_RUNTIME_CALL = RuntimeCallId.CLIPBOARD_RUNTIME_AFTER_ITEM_BIND

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
    applyVerified(
        VerifiedTransformationPlan(
            targetName = "$CLIPBOARD_ADAPTER_CLASS->F()V",
            classify = { method ->
                method.classifyClipboardReturnDelegate(TRIM_METHOD_DESCRIPTOR, 1)
            },
            mutate = { method ->
                method.injectClipboardReturnDelegate(TRIM_DELEGATE)
                method
            },
        ),
    )
}

internal fun MutableMethod.applyClipboardItemBindDelegate(): MutableMethod {
    requireExactClipboardTarget(
        CLIPBOARD_ADAPTER_CLASS,
        "p",
        "V",
        listOf(RECYCLER_VIEW_HOLDER_CLASS, "I"),
    )
    return applyVerified(
        VerifiedTransformationPlan(
            targetName = "$CLIPBOARD_ADAPTER_CLASS->p(${RECYCLER_VIEW_HOLDER_CLASS}I)V",
            classify = MutableMethod::classifyClipboardItemBind,
            mutate = { stock ->
                stock.expandClipboardItemBindRegisters().also { expanded ->
                    expanded.addInstructions(0, ITEM_BIND_ENTRY)
                    val instructions = expanded.implementation!!.instructions
                    val returnIndices = expanded.returnInstructionIndices().filter {
                        instructions[it].isOpcode("RETURN_VOID")
                    }
                    check(returnIndices.size == ITEM_BIND_RETURN_COUNT) {
                        "Expected $ITEM_BIND_RETURN_COUNT Clipboard item-bind returns"
                    }
                    returnIndices.sortedDescending().forEach { returnIndex ->
                        expanded.addInstructions(returnIndex, ITEM_BIND_DELEGATE)
                    }
                }
            },
        ),
    )
}

private fun MutableMethod.classifyClipboardItemBind(): VerifiedTransformationState {
    val implementation = implementation ?: error("No instructions in $definingClass->$name")
    val fingerprint = clipboardStructuralFingerprint()
    return when (implementation.registerCount) {
        ITEM_BIND_STOCK_REGISTER_COUNT -> {
            check(fingerprint == ITEM_BIND_STOCK_FINGERPRINT) {
                "Unexpected stock Clipboard item-bind structure in $definingClass->$name: " +
                    fingerprint
            }
            VerifiedTransformationState.STOCK
        }
        ITEM_BIND_EXPANDED_REGISTER_COUNT -> {
            check(fingerprint == ITEM_BIND_PATCHED_FINGERPRINT) {
                "Malformed partial Clipboard item-bind state in $definingClass->$name: " +
                    fingerprint
            }
            validateExpandedClipboardItemBind()
            VerifiedTransformationState.PATCHED
        }
        else -> VerifiedTransformationState.MALFORMED
    }
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
            ) &&
            instructions.getOrNull(3)?.isExactRangeInvoke(
                ITEM_BIND_BEFORE_METHOD_DESCRIPTOR,
                savedP0,
                3,
            ) == true,
    ) {
        "Clipboard item-bind entry preparation is missing or malformed"
    }
    val returnIndices = returnInstructionIndices().filter {
        instructions[it].isOpcode("RETURN_VOID")
    }
    check(returnIndices.size == ITEM_BIND_RETURN_COUNT)
    check(
        instructions.clipboardRuntimeReferenceCount() == ITEM_BIND_RETURN_COUNT + 1 &&
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
    this?.isOpcode(opcode) == true &&
        this is TwoRegisterInstruction &&
        registerA == destination &&
        registerB == source

private fun MutableMethod.classifyClipboardReturnDelegate(
    descriptor: String,
    parameterRegisterCount: Int,
): VerifiedTransformationState {
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val returnIndices = returnInstructionIndices().filter {
        instructions[it].isOpcode("RETURN_VOID")
    }
    check(returnIndices.isNotEmpty()) {
        "Could not resolve return instructions in $definingClass->$name"
    }
    val delegateCount = instructions.count { it.isMethodReference(descriptor) }
    val runtimeReferenceCount = instructions.clipboardRuntimeReferenceCount()
    if (runtimeReferenceCount > 0) {
        val completed = delegateCount == returnIndices.size &&
            runtimeReferenceCount == delegateCount &&
            returnIndices.all { returnIndex ->
                instructions.getOrNull(returnIndex - 1)?.isExactRangeInvoke(
                    descriptor,
                    p0Register(),
                    parameterRegisterCount,
                ) == true
            }
        return if (completed) {
            VerifiedTransformationState.PATCHED
        } else {
            VerifiedTransformationState.MALFORMED
        }
    }
    return VerifiedTransformationState.STOCK
}

private fun MutableMethod.injectClipboardReturnDelegate(delegate: String) {
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val returnIndices = returnInstructionIndices().filter {
        instructions[it].isOpcode("RETURN_VOID")
    }
    returnIndices.sortedDescending().forEach { returnIndex ->
        addInstructions(returnIndex, delegate)
    }
}

private val TRIM_DELEGATE = """
    ${RuntimeCallEmitter.invoke(TRIM_RUNTIME_CALL, "p0 .. p0")}
""".trimIndent()

private val ITEM_BIND_DELEGATE = """
    ${RuntimeCallEmitter.invoke(ITEM_BIND_RUNTIME_CALL, "p0 .. p2")}
""".trimIndent()

private val ITEM_BIND_ENTRY = """
    move-object/from16 v13, p0
    move-object/from16 v14, p1
    move/from16 v15, p2

    ${RuntimeCallEmitter.invoke(ITEM_BIND_BEFORE_RUNTIME_CALL, "p0 .. p2")}
""".trimIndent()

private val TRIM_METHOD_DESCRIPTOR = RuntimeAbiCatalog.abi(TRIM_RUNTIME_CALL).reference
private val ITEM_BIND_BEFORE_METHOD_DESCRIPTOR =
    RuntimeAbiCatalog.abi(ITEM_BIND_BEFORE_RUNTIME_CALL).reference
private val ITEM_BIND_METHOD_DESCRIPTOR = RuntimeAbiCatalog.abi(ITEM_BIND_RUNTIME_CALL).reference
private const val ITEM_BIND_STOCK_REGISTER_COUNT = 16
private const val ITEM_BIND_EXPANDED_REGISTER_COUNT = 19
private const val ITEM_BIND_LEGACY_P0_REGISTER = 13
private const val ITEM_BIND_RETURN_COUNT = 5
private const val ITEM_BIND_STOCK_FINGERPRINT =
    "caa7bfc3bd842102dcd076af7fb6d6d01a69e2b6a3dfa71daa7c172965889740"
private const val ITEM_BIND_PATCHED_FINGERPRINT =
    "66ccc1fe5e15f4ba128133cac9c7e945d5eea0f97496716dd698406a665d32ba"
