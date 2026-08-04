package dev.jason.gboardpatches.patches.gboard.features.latinglobe

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.debug.DebugItem
import com.android.tools.smali.dexlib2.iface.debug.LineNumber
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationPlan
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationState
import dev.jason.gboardpatches.patches.gboard.shared.applyVerified
import dev.jason.gboardpatches.patches.gboard.shared.isInvoke
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.isOpcode
import dev.jason.gboardpatches.patches.gboard.shared.isReference
import dev.jason.gboardpatches.patches.gboard.shared.isRegisterOperation
import dev.jason.gboardpatches.patches.gboard.shared.mutableClass
import dev.jason.gboardpatches.patches.gboard.shared.semanticShape
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import java.nio.charset.StandardCharsets
import java.security.MessageDigest

private const val LATIN_IME_CLASS =
    "Lcom/google/android/apps/inputmethod/libs/latin5/LatinIme;"
private const val LATIN_RUNTIME_PARAMS_TYPE = "Lxdj;"
private val LATIN_GLOBE_RUNTIME_CALL =
    RuntimeCallId.LATIN_GLOBE_KEY_IGNORE_INTERVAL_RUNTIME_APPLY_OVERRIDE
private val LATIN_GLOBE_RUNTIME_DESCRIPTOR = RuntimeAbiCatalog.abi(LATIN_GLOBE_RUNTIME_CALL).reference
private const val TARGET_METHOD_NAME = "U"
private const val TARGET_DESCRIPTOR =
    "$LATIN_IME_CLASS->U()$LATIN_RUNTIME_PARAMS_TYPE"
private const val STOCK_REGISTER_COUNT = 12
private const val STOCK_RETURN_REGISTER = 0
private const val STOCK_FINGERPRINT =
    "44E34E8D24D4542580CD5A91DF2BCBC9EEB684890BC05C3DEFF3D4EDB2F39181"
private val TARGET_ACCESS_FLAGS =
    AccessFlags.PROTECTED.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value

internal val gboardLatinGlobeKeyIgnoreIntervalBytecodePatch = bytecodePatch(
    description = "允許覆寫英文地球鍵忽略時間。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val target = selectLatinGlobeFactory(mutableClass(LATIN_IME_CLASS).methods.toList())
        target.applyLatinGlobeKeyIgnoreIntervalOverride()
    }
}

internal fun selectLatinGlobeFactory(methods: List<MutableMethod>): MutableMethod {
    val matches = methods.filter { method ->
        method.definingClass == LATIN_IME_CLASS &&
            method.name == TARGET_METHOD_NAME &&
            method.returnType == LATIN_RUNTIME_PARAMS_TYPE &&
            method.parameterTypes.isEmpty() &&
            method.accessFlags == TARGET_ACCESS_FLAGS
    }
    check(matches.size == 1) {
        "Expected exactly one protected static final $TARGET_DESCRIPTOR target"
    }
    return matches.single()
}

internal fun MutableMethod.applyLatinGlobeKeyIgnoreIntervalOverride(): MutableMethod {
    requireExactTarget()
    return applyVerified(
        VerifiedTransformationPlan(
            targetName = TARGET_DESCRIPTOR,
            classify = MutableMethod::classifyLatinGlobeOverride,
            mutate = { method ->
                val instructions = method.implementation?.instructions
                    ?: error("No instructions available in $TARGET_DESCRIPTOR")
                method.addInstructions(
                    method.singleReturnIndex(instructions),
                    buildLatinGlobeDelegate(STOCK_RETURN_REGISTER),
                )
                method
            },
        ),
    )
}

private fun MutableMethod.classifyLatinGlobeOverride(): VerifiedTransformationState {
    val instructions = implementation?.instructions
        ?: error("No instructions available in $TARGET_DESCRIPTOR")
    return when (instructions.count { it.isMethodReference(LATIN_GLOBE_RUNTIME_DESCRIPTOR) }) {
        0 -> {
            validateStockBody(instructions)
            VerifiedTransformationState.STOCK
        }
        1 -> {
            validateCompletedPatch()
            VerifiedTransformationState.PATCHED
        }
        else -> VerifiedTransformationState.MALFORMED
    }
}

private fun MutableMethod.requireExactTarget() {
    check(
        definingClass == LATIN_IME_CLASS &&
            name == TARGET_METHOD_NAME &&
            returnType == LATIN_RUNTIME_PARAMS_TYPE &&
            parameterTypes.isEmpty() &&
            accessFlags == TARGET_ACCESS_FLAGS,
    ) {
        "Refusing non-target Latin Globe method " +
            definingClass + "->" + name + "(" + parameterTypes.joinToString("") + ")" + returnType
    }
}

private fun MutableMethod.validateStockBody(instructions: List<Instruction>) {
    val implementation = implementation ?: error("No instructions available in $TARGET_DESCRIPTOR")
    check(implementation.registerCount == STOCK_REGISTER_COUNT) {
        "Unexpected register count in $TARGET_DESCRIPTOR: " + implementation.registerCount
    }
    check(implementation.tryBlocks.isEmpty()) {
        "Unexpected try blocks in exact $TARGET_DESCRIPTOR"
    }
    val returnIndex = singleReturnIndex(instructions)
    check(returnIndex == instructions.lastIndex) {
        "$TARGET_DESCRIPTOR must end at its single RETURN_OBJECT"
    }
    check((instructions[returnIndex] as OneRegisterInstruction).registerA == STOCK_RETURN_REGISTER) {
        "$TARGET_DESCRIPTOR must return exact v$STOCK_RETURN_REGISTER"
    }
    check(instructions.none { it.isMethodReference(LATIN_GLOBE_RUNTIME_DESCRIPTOR) }) {
        "$TARGET_DESCRIPTOR contains an orphan Latin Globe delegate"
    }
    requireStockFingerprint(instructions, implementation.debugItems)
}

private fun MutableMethod.validateCompletedPatch() {
    requireExactTarget()
    val implementation = implementation ?: error("No instructions available in $TARGET_DESCRIPTOR")
    check(implementation.registerCount == STOCK_REGISTER_COUNT)
    check(implementation.tryBlocks.isEmpty())
    val instructions = implementation.instructions
    val returnIndex = singleReturnIndex(instructions)
    check(returnIndex == instructions.lastIndex)
    check((instructions[returnIndex] as OneRegisterInstruction).registerA == STOCK_RETURN_REGISTER)
    check(
        returnIndex >= 3 &&
            instructions[returnIndex - 3].isExactDelegateInvoke() &&
            instructions[returnIndex - 2].isExactOneRegister(
                "MOVE_RESULT_OBJECT",
                STOCK_RETURN_REGISTER,
            ) &&
            instructions[returnIndex - 1].isExactCast(
                STOCK_RETURN_REGISTER,
                LATIN_RUNTIME_PARAMS_TYPE,
            ),
    ) {
        "$TARGET_DESCRIPTOR final Latin Globe delegate is missing or malformed"
    }
    check(instructions.count {
        it.isMethodReference(LATIN_GLOBE_RUNTIME_DESCRIPTOR)
    } == 1) {
        "$TARGET_DESCRIPTOR must contain exactly one Latin Globe delegate"
    }
    val stockInstructions = instructions.filterIndexed { index, _ ->
        index !in (returnIndex - 3)..(returnIndex - 1)
    }
    requireStockFingerprint(stockInstructions, implementation.debugItems)
}

private fun MutableMethod.singleReturnIndex(instructions: List<Instruction>): Int {
    val returns = instructions.indices.filter { index ->
        instructions[index].isOpcode("RETURN_OBJECT")
    }
    check(returns.size == 1) {
        "$TARGET_DESCRIPTOR must contain exactly one RETURN_OBJECT"
    }
    return returns.single()
}

private fun requireStockFingerprint(
    instructions: List<Instruction>,
    debugItems: Iterable<DebugItem>,
) {
    val fingerprint = stockFingerprint(instructions, debugItems)
    check(fingerprint == STOCK_FINGERPRINT) {
        "Stock body drift in $TARGET_DESCRIPTOR: $fingerprint"
    }
}

private fun stockFingerprint(
    instructions: List<Instruction>,
    debugItems: Iterable<DebugItem>,
): String {
    val canonical = buildString {
        instructions.forEach { instruction ->
            append(instruction.semanticShape()).append('\n')
        }
        append("--debug--\n")
        debugItems.forEach { item ->
            check(item is LineNumber) {
                "Unexpected debug item type " + item.javaClass.name + " in " + TARGET_DESCRIPTOR
            }
            append(item.codeAddress).append(':').append(item.lineNumber).append('\n')
        }
    }
    return MessageDigest.getInstance("SHA-256")
        .digest(canonical.toByteArray(StandardCharsets.UTF_8))
        .joinToString("") { value -> "%02X".format(value) }
}

private fun Instruction.isExactDelegateInvoke(): Boolean =
    isInvoke(
        "INVOKE_STATIC",
        LATIN_GLOBE_RUNTIME_DESCRIPTOR,
        STOCK_RETURN_REGISTER,
    )

private fun Instruction.isExactOneRegister(opcode: String, register: Int): Boolean =
    isRegisterOperation(opcode, register)

private fun Instruction.isExactCast(register: Int, type: String): Boolean =
    isExactOneRegister("CHECK_CAST", register) &&
        isReference(type)

private fun buildLatinGlobeDelegate(register: Int): String = """
    ${RuntimeCallEmitter.invoke(LATIN_GLOBE_RUNTIME_CALL, "v$register")}

    move-result-object v$register

    check-cast v$register, $LATIN_RUNTIME_PARAMS_TYPE
""".trimIndent()
