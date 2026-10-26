package app.template.patches.cricfy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderArrayPayload
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.ExceptionHandler
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MethodImplementation
import com.android.tools.smali.dexlib2.iface.TryBlock
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

/**
 * Valid `array-payload` (`0x0300`) element widths supported by `dexlib2`.
 */
private val VALID_ARRAY_ELEMENT_WIDTHS = setOf(1, 2, 4, 8)

/**
 * Resolves [fingerprint] against the immutable DEX index first, repairs any anti-decompiler
 * corrupted `array-payload` instructions across the matched class idempotently, and returns
 * the mutable [MutableMethod] ready for smali/bytecode modification.
 */
context(patchContext: BytecodePatchContext)
internal val Fingerprint.repairedMethod: MutableMethod
    get() {
        patchContext.repairClassPayloads(originalClassDef.type)
        return method
    }

/**
 * Replaces the entire body of [target] in its owning [MutableClass] with [smali], stripping all
 * dead instructions and orphaned `try/catch` blocks while preserving exact parameter/register numbering.
 */
internal fun BytecodePatchContext.replaceMethodBody(
    target: MutableMethod,
    smali: String,
) {
    val regCount = target.implementation?.registerCount
        ?: error("Method ${target.definingClass}->${target.name} has no implementation.")

    val replacement = MutableMethod(
        ImmutableMethod(
            target.definingClass,
            target.name,
            target.parameters,
            target.returnType,
            target.accessFlags,
            target.annotations,
            target.hiddenApiRestrictions,
            MutableMethodImplementation(regCount),
        ),
    )
    replacement.addInstructions(0, smali)

    val mutableClass = mutableClassDefBy(target.definingClass)

    @Suppress("UNCHECKED_CAST")
    val methods = (mutableClass as ClassDef).methods as MutableSet<MutableMethod>
    val key = target.signatureKey()
    check(methods.removeAll { it.signatureKey() == key }) {
        "Failed to locate ${target.name} in ${target.definingClass} for body replacement."
    }
    methods.add(replacement)
}

/**
 * Truncates [originalMethod] at instruction [cutIndex], appending a clean `return-void` and dropping
 * all instructions and `try/catch` blocks at or after [cutIndex].
 */
internal fun BytecodePatchContext.truncateVoidMethodAt(
    originalMethod: Method,
    cutIndex: Int,
) {
    repairClassPayloads(originalMethod.definingClass)

    val rawImpl = originalMethod.implementation
        ?: error("Method ${originalMethod.definingClass}->${originalMethod.name} has no implementation.")

    val rawInsns = rawImpl.instructions.toList()
    require(cutIndex in 1..rawInsns.size) {
        "Invalid cutIndex $cutIndex for ${originalMethod.name} (size=${rawInsns.size})."
    }

    var cutCodeAddr = 0
    for (i in 0 until cutIndex) {
        cutCodeAddr += rawInsns[i].codeUnits
    }

    val truncatedImpl = object : MethodImplementation by rawImpl {
        override fun getInstructions(): Iterable<Instruction> =
            rawInsns.subList(0, cutIndex) + BuilderInstruction10x(Opcode.RETURN_VOID)

        override fun getTryBlocks(): List<TryBlock<out ExceptionHandler>> =
            rawImpl.tryBlocks.filter { tb ->
                tb.startCodeAddress + tb.codeUnitCount <= cutCodeAddr &&
                    tb.exceptionHandlers.all { it.handlerCodeAddress < cutCodeAddr }
            }

        override fun getDebugItems() = emptyList<com.android.tools.smali.dexlib2.iface.debug.DebugItem>()
    }

    val replacement = MutableMethod(
        SanitizedMethod(
            delegate = originalMethod,
            sanitizedImpl = truncatedImpl,
        ),
    )

    val mutableClass = mutableClassDefBy(originalMethod.definingClass)

    @Suppress("UNCHECKED_CAST")
    val methods = (mutableClass as ClassDef).methods as MutableSet<MutableMethod>
    val key = originalMethod.signatureKey()
    check(methods.removeAll { it.signatureKey() == key }) {
        "Failed to locate ${originalMethod.name} in ${originalMethod.definingClass} for truncation."
    }
    methods.add(replacement)
}

/**
 * Idempotently sanitizes invalid dead-code `array-payload` (`0x0300`) instructions in [classTypes].
 */
internal fun BytecodePatchContext.repairClassPayloads(vararg classTypes: String): Int {
    var repairedCount = 0

    for (classType in classTypes) {
        val existingClass = classDefBy(classType)
        if (existingClass is MutableClass) continue

        val dirtyMethods = existingClass.methods.mapNotNull { method ->
            val impl = method.implementation ?: return@mapNotNull null
            method.takeIf { impl.hasInvalidArrayPayload() }
        }
        if (dirtyMethods.isEmpty()) continue

        val dirtyBySignature = dirtyMethods.associateBy { it.signatureKey() }
        val mutableClass = mutableClassDefBy(classType)

        @Suppress("UNCHECKED_CAST")
        val mutableMethods = (mutableClass as ClassDef).methods as MutableSet<MutableMethod>

        val sanitizedReplacements = mutableMethods
            .filter { it.signatureKey() in dirtyBySignature }
            .map { mutableMethod ->
                val rawMethod = dirtyBySignature.getValue(mutableMethod.signatureKey())
                val rawImpl = rawMethod.implementation
                    ?: error("Method ${rawMethod.signatureKey()} in $classType has no implementation.")
                MutableMethod(
                    SanitizedMethod(
                        delegate = rawMethod,
                        sanitizedImpl = SanitizedMethodImplementation(rawImpl),
                    ),
                )
            }

        check(sanitizedReplacements.size == dirtyBySignature.size) {
            "Expected to sanitize ${dirtyBySignature.size} methods in $classType, " +
                "but matched ${sanitizedReplacements.size}."
        }

        mutableMethods.removeAll { it.signatureKey() in dirtyBySignature }
        mutableMethods.addAll(sanitizedReplacements)
        repairedCount += sanitizedReplacements.size
    }

    return repairedCount
}

private fun MethodImplementation.hasInvalidArrayPayload(): Boolean =
    instructions.any { insn ->
        insn is ArrayPayload && insn.elementWidth !in VALID_ARRAY_ELEMENT_WIDTHS
    }

private data class MethodSignatureKey(
    val name: String,
    val returnType: String,
    val parameterTypes: List<String>,
)

private fun Method.signatureKey(): MethodSignatureKey = MethodSignatureKey(
    name = name,
    returnType = returnType,
    parameterTypes = parameterTypes.map(CharSequence::toString),
)

private class SanitizedMethod(
    private val delegate: Method,
    private val sanitizedImpl: MethodImplementation,
) : Method by delegate {
    override fun getImplementation(): MethodImplementation = sanitizedImpl
}

private class SanitizedMethodImplementation(
    private val delegate: MethodImplementation,
) : MethodImplementation by delegate {
    override fun getInstructions(): Iterable<Instruction> =
        delegate.instructions.map { insn ->
            if (insn is ArrayPayload && insn.elementWidth !in VALID_ARRAY_ELEMENT_WIDTHS) {
                BuilderArrayPayload(1, listOf<Number>(0))
            } else {
                insn
            }
        }
}
