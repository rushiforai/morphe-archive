package dev.jason.gboardpatches.patches.gboard.features.flowmode

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationPlan
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationState
import dev.jason.gboardpatches.patches.gboard.shared.applyVerified
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isFieldReference
import dev.jason.gboardpatches.patches.gboard.shared.isInvoke
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.isOpcode
import dev.jason.gboardpatches.patches.gboard.shared.isRegisterOperation
import dev.jason.gboardpatches.patches.gboard.shared.mutableClass
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val FLOW_MODE_DETECTOR_CLASS = "Liof;"
private const val KEY_EVENT_TYPE = "Lpnu;"
private const val KEY_CODE_FIELD = "$KEY_EVENT_TYPE->c:I"
private const val TARGET_METHOD_NAME = "j"
private const val TARGET_REFERENCE = "$FLOW_MODE_DETECTOR_CLASS->j($KEY_EVENT_TYPE)Z"
private const val FORMAL_REGISTER_COUNT = 10
private val FLOW_MODE_KEY_EVENT_RUNTIME_CALL = RuntimeCallId.FLOW_MODE_RUNTIME_MAP_KEY_CODE
private val FLOW_MODE_KEY_EVENT_RUNTIME_REFERENCE =
    RuntimeAbiCatalog.abi(FLOW_MODE_KEY_EVENT_RUNTIME_CALL).reference

internal val gboardFlowModeKeyEventPatch = bytecodePatch(
    description = "讓 ProcessorBasedIme 文字鍵沿用 stock Flow Mode typing pulse。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        selectFlowModeKeyEventMethod(
            mutableClass(FLOW_MODE_DETECTOR_CLASS).methods.toList(),
        ).applyFlowModeKeyEventDelegate()
    }
}

internal fun selectFlowModeKeyEventMethod(methods: List<MutableMethod>): MutableMethod {
    val matches = methods.filter { method ->
        method.definingClass == FLOW_MODE_DETECTOR_CLASS &&
            method.name == TARGET_METHOD_NAME &&
            method.parameterTypes == listOf(KEY_EVENT_TYPE) &&
            method.returnType == "Z"
    }
    check(matches.size == 1) {
        "Expected exactly one formal Flow Mode key-event method $TARGET_REFERENCE"
    }
    return matches.single()
}

internal fun MutableMethod.applyFlowModeKeyEventDelegate(): MutableMethod = applyVerified(
    VerifiedTransformationPlan(
        targetName = TARGET_REFERENCE,
        classify = MutableMethod::classifyFlowModeKeyEventDelegate,
        mutate = { method ->
            val instructions = method.implementation?.instructions
                ?: error("No instructions available in $TARGET_REFERENCE")
            val keyCodeReadIndex = instructions.singleKeyCodeReadIndex()
            val eventRegister = method.eventRegister()
            method.addInstructions(
                keyCodeReadIndex + 1,
                """
                    ${RuntimeCallEmitter.invoke(
                        FLOW_MODE_KEY_EVENT_RUNTIME_CALL,
                        "v$eventRegister",
                    )}

                    move-result v$eventRegister
                """.trimIndent(),
            )
            method
        },
    ),
)

private fun MutableMethod.classifyFlowModeKeyEventDelegate(): VerifiedTransformationState {
    requireExactFlowModeTarget()
    val instructions = implementation?.instructions
        ?: error("No instructions available in $TARGET_REFERENCE")
    val keyCodeReadIndex = instructions.singleKeyCodeReadIndex()
    val eventRegister = eventRegister()
    return when (instructions.count {
        it.isMethodReference(FLOW_MODE_KEY_EVENT_RUNTIME_REFERENCE)
    }) {
        0 -> {
            validateStockFlowModeEntry(instructions, keyCodeReadIndex, eventRegister)
            VerifiedTransformationState.STOCK
        }
        1 -> if (
            instructions.getOrNull(keyCodeReadIndex + 1)?.isInvoke(
                "INVOKE_STATIC",
                FLOW_MODE_KEY_EVENT_RUNTIME_REFERENCE,
                eventRegister,
            ) == true &&
            instructions.getOrNull(keyCodeReadIndex + 2)?.isRegisterOperation(
                "MOVE_RESULT",
                eventRegister,
            ) == true
        ) {
            validateStockFlowModeEntry(instructions, keyCodeReadIndex, eventRegister)
            VerifiedTransformationState.PATCHED
        } else {
            VerifiedTransformationState.MALFORMED
        }
        else -> VerifiedTransformationState.MALFORMED
    }
}

private fun MutableMethod.requireExactFlowModeTarget() {
    check(
        definingClass == FLOW_MODE_DETECTOR_CLASS &&
            name == TARGET_METHOD_NAME &&
            parameterTypes == listOf(KEY_EVENT_TYPE) &&
            returnType == "Z",
    ) {
        "Refusing non-target Flow Mode method " +
            definingClass + "->" + name + "(" + parameterTypes.joinToString("") + ")" +
            returnType
    }
    check(implementation?.registerCount == FORMAL_REGISTER_COUNT) {
        "Unexpected register count in $TARGET_REFERENCE: ${implementation?.registerCount}"
    }
}

private fun MutableMethod.eventRegister(): Int {
    val registerCount = implementation?.registerCount
        ?: error("No implementation in $TARGET_REFERENCE")
    return registerCount - 1
}

private fun List<Instruction>.singleKeyCodeReadIndex(): Int {
    val indices = indices.filter { index ->
        this[index].isOpcode("IGET") && this[index].isFieldReference(KEY_CODE_FIELD)
    }
    check(indices.size == 1) {
        "$TARGET_REFERENCE must contain exactly one $KEY_CODE_FIELD read"
    }
    return indices.single()
}

private fun validateStockFlowModeEntry(
    instructions: List<Instruction>,
    keyCodeReadIndex: Int,
    eventRegister: Int,
) {
    val keyCodeRead = instructions[keyCodeReadIndex] as? TwoRegisterInstruction
        ?: error("$KEY_CODE_FIELD read does not expose two registers")
    check(keyCodeRead.registerA == eventRegister && keyCodeRead.registerB == eventRegister) {
        "$TARGET_REFERENCE must materialize the key code in its p1 register"
    }
    check(instructions.firstOrNull()?.isRegisterOperation("MONITOR_ENTER", eventRegister - 1) == true) {
        "$TARGET_REFERENCE must retain its declared-synchronized monitor entry"
    }
}
