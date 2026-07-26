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
import dev.jason.gboardpatches.patches.gboard.shared.mutableClass
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import java.nio.charset.StandardCharsets
import java.security.MessageDigest

private const val LATIN_IME_CLASS =
    "Lcom/google/android/apps/inputmethod/libs/latin5/LatinIme;"
private const val LATIN_RUNTIME_PARAMS_TYPE = "Lxdj;"
private const val LATIN_GLOBE_RUNTIME_CLASS =
    "Ldev/jason/gboardpatches/extension/keyboard/GboardLatinGlobeKeyIgnoreIntervalRuntime;"
private const val LATIN_GLOBE_RUNTIME_DESCRIPTOR =
    "$LATIN_GLOBE_RUNTIME_CLASS->applyOverride(Ljava/lang/Object;)Ljava/lang/Object;"
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
    val instructions = implementation?.instructions
        ?: error("No instructions available in $TARGET_DESCRIPTOR")
    val delegateCount = instructions.count {
        it.methodDescriptor() == LATIN_GLOBE_RUNTIME_DESCRIPTOR
    }
    if (delegateCount != 0) {
        check(delegateCount == 1) {
            "$TARGET_DESCRIPTOR must contain exactly one Latin Globe delegate"
        }
        validateCompletedPatch()
        return this
    }

    validateStockBody(instructions)
    val returnIndex = singleReturnIndex(instructions)
    addInstructions(returnIndex, buildLatinGlobeDelegate(STOCK_RETURN_REGISTER))
    validateCompletedPatch()
    return this
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
    check(instructions.none { it.methodDescriptor() == LATIN_GLOBE_RUNTIME_DESCRIPTOR }) {
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
        it.methodDescriptor() == LATIN_GLOBE_RUNTIME_DESCRIPTOR
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
        instructions[index].normalizedOpcode() == "RETURN_OBJECT"
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

private fun Instruction.semanticShape(): String = buildString {
    append(normalizedOpcode())
    when (this@semanticShape) {
        is FiveRegisterInstruction -> append("|5=")
            .append(registerCount).append(',').append(registerC).append(',')
            .append(registerD).append(',').append(registerE).append(',')
            .append(registerF).append(',').append(registerG)
        is RegisterRangeInstruction -> append("|range=")
            .append(startRegister).append(',').append(registerCount)
        is ThreeRegisterInstruction -> append("|3=")
            .append(registerA).append(',').append(registerB).append(',').append(registerC)
        is TwoRegisterInstruction -> append("|2=")
            .append(registerA).append(',').append(registerB)
        is OneRegisterInstruction -> append("|1=").append(registerA)
    }
    if (this@semanticShape is ReferenceInstruction) {
        append("|ref=").append(reference)
    }
    if (this@semanticShape is WideLiteralInstruction) {
        append("|wide=").append(wideLiteral)
    } else if (this@semanticShape is NarrowLiteralInstruction) {
        append("|narrow=").append(narrowLiteral)
    }
    if (this@semanticShape is OffsetInstruction) {
        append("|offset=").append(codeOffset)
    }
}

private fun Instruction.isExactDelegateInvoke(): Boolean =
    normalizedOpcode() == "INVOKE_STATIC" &&
        methodDescriptor() == LATIN_GLOBE_RUNTIME_DESCRIPTOR &&
        this is FiveRegisterInstruction &&
        registerCount == 1 &&
        registerC == STOCK_RETURN_REGISTER

private fun Instruction.isExactOneRegister(opcode: String, register: Int): Boolean =
    normalizedOpcode() == opcode &&
        this is OneRegisterInstruction &&
        registerA == register

private fun Instruction.isExactCast(register: Int, type: String): Boolean =
    isExactOneRegister("CHECK_CAST", register) &&
        this is ReferenceInstruction &&
        (reference as? TypeReference)?.type == type

private fun Instruction.methodDescriptor(): String? =
    ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()

private fun Instruction.normalizedOpcode(): String =
    opcode.name.uppercase().replace('-', '_').replace('/', '_')

private fun buildLatinGlobeDelegate(register: Int): String = """
    invoke-static {v$register}, $LATIN_GLOBE_RUNTIME_DESCRIPTOR

    move-result-object v$register

    check-cast v$register, $LATIN_RUNTIME_PARAMS_TYPE
""".trimIndent()
