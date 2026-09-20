package com.dmoniak.patches.hungryshark.util

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MethodParameter
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.util.MethodUtil

/**
 * Find the [MutableMethod] from a given [Method] in a [MutableClass].
 */
fun MutableClass.findMutableMethodOf(method: MethodReference) = this.methods.first {
    MethodUtil.methodSignaturesMatch(it, method)
}

/**
 * @return The registers used by this instruction.
 */
val Instruction.registersUsed: List<Int>
    get() = when (this) {
        is FiveRegisterInstruction -> {
            when (registerCount) {
                0 -> listOf()
                1 -> listOf(registerC)
                2 -> listOf(registerC, registerD)
                3 -> listOf(registerC, registerD, registerE)
                4 -> listOf(registerC, registerD, registerE, registerF)
                else -> listOf(registerC, registerD, registerE, registerF, registerG)
            }
        }
        is ThreeRegisterInstruction -> listOf(registerA, registerB, registerC)
        is TwoRegisterInstruction -> listOf(registerA, registerB)
        is OneRegisterInstruction -> listOf(registerA)
        is RegisterRangeInstruction -> (startRegister until (startRegister + registerCount)).toList()
        else -> emptyList()
    }

/**
 * @return The number of registers for all parameters, including p0.
 * This includes 2 registers for each wide parameter.
 */
val Method.numberOfParameterRegisters: Int
    get() {
        var count = 0
        if (!AccessFlags.STATIC.isSet(accessFlags)) {
            count += 1
        }
        for (param in parameters) {
            count += when (param.type) {
                "J", "D" -> 2
                else -> 1
            }
        }
        return count
    }

/**
 * @return The number of parameter registers, including p0 as 'this' if method is not static.
 */
val Method.numberOfParameterRegistersLogical: Int
    get() = parameters.count() + if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1

/**
 * @return The actual register number of p0 for this method.
 */
val Method.p0Register: Int
    get() {
        val impl = implementation ?: throw IllegalStateException("Method has no implementation: $this")
        var paramRegs = 0
        for (type in this.parameterTypes) {
            paramRegs += if (type == "J" || type == "D") 2 else 1
        }
        if (!AccessFlags.STATIC.isSet(this.accessFlags)) {
            paramRegs += 1
        }
        return impl.registerCount - paramRegs
    }

/**
 * Clones a method and adds extra registers to prevent register collisions.
 */
fun Method.cloneMutable(
    name: String = this.name,
    accessFlags: Int = this.accessFlags,
    parameters: List<MethodParameter> = this.parameters,
    returnType: String = this.returnType,
    additionalRegisters: Int = 0,
): MutableMethod {
    check(additionalRegisters >= 0) { "Additional registers cannot be negative" }

    val implementationExists = implementation != null
    val oldFirstParameterRegister = if (implementationExists) p0Register else 0

    val clonedImplementation = implementation?.let {
        ImmutableMethodImplementation(
            it.registerCount + additionalRegisters,
            it.instructions,
            it.tryBlocks,
            it.debugItems,
        )
    }

    return ImmutableMethod(
        definingClass,
        name,
        parameters,
        returnType,
        accessFlags,
        annotations,
        hiddenApiRestrictions,
        clonedImplementation
    ).toMutable().apply {
        var insertIndex = 0
        var addedInstructions = 0
        val isNotStatic = !AccessFlags.STATIC.isSet(accessFlags)

        if (implementationExists && additionalRegisters > 0 && (parameters.isNotEmpty() || isNotStatic)) {
            var destReg = oldFirstParameterRegister
            var pReg = 0

            // Handle `this`.
            if (isNotStatic) {
                addInstructions(insertIndex++, "move-object/from16 v$destReg, p0")
                addedInstructions++
                destReg += 1
                pReg += 1
            }

            // Handle method parameters.
            for (parameter in parameters) {
                val opcode = when (parameter.type) {
                    "J", "D" -> "move-wide/from16"
                    else -> {
                        if (parameter.type.startsWith('L') || parameter.type.startsWith('[')) {
                            "move-object/from16"
                        } else {
                            "move/from16"
                        }
                    }
                }

                addInstructions(insertIndex++, "$opcode v$destReg, p$pReg")
                addedInstructions++

                val width = if (opcode.startsWith("move-wide")) 2 else 1
                destReg += width
                pReg += width
            }

            if (addedInstructions != numberOfParameterRegistersLogical) {
                throw IllegalStateException(
                    "Added instructions do not match additional registers " +
                            "addedInstructions: $addedInstructions " +
                            "numberOfParameterRegistersLogical: $numberOfParameterRegistersLogical"
                )
            }
        }
    }
}

/**
 * Replaces the method in [mutableClass] with a cloned copy with [numberOfParameterRegisters] extra registers.
 */
fun Method.cloneParameters(mutableClass: MutableClass): MutableMethod {
    check(!AccessFlags.STATIC.isSet(accessFlags) || parameters.isNotEmpty()) {
        "Static methods have no parameter registers to preserve"
    }

    val clonedMethod = cloneMutable(additionalRegisters = numberOfParameterRegisters)

    mutableClass.methods.apply {
        remove(this@cloneParameters)
        add(clonedMethod)
    }

    return clonedMethod
}

/**
 * Convenience extension on [BytecodePatchContext] to clone parameters for a method.
 */
fun BytecodePatchContext.cloneParameters(method: Method): MutableMethod =
    method.cloneParameters(mutableClassDefBy(method.definingClass))

/**
 * Replaces the method in [BytecodePatchContext] with a cloned copy with [additionalRegisters] extra registers.
 */
fun BytecodePatchContext.cloneMethodWithAdditionalRegisters(
    method: Method,
    additionalRegisters: Int,
): MutableMethod {
    val mutableClass = mutableClassDefBy(method.definingClass)
    val clonedMethod = method.cloneMutable(additionalRegisters = additionalRegisters)
    mutableClass.methods.apply {
        remove(method)
        add(clonedMethod)
    }
    return clonedMethod
}

/**
 * Completely replaces a method's implementation with a brand-new implementation with [registerCount] registers
 * and [smaliCode], leaving zero leftover instructions, zero dead-code register type mismatches, and no try blocks.
 */
fun BytecodePatchContext.replaceMethod(
    method: Method,
    registerCount: Int,
    smaliCode: String,
): MutableMethod {
    val mutableClass = mutableClassDefBy(method.definingClass)
    val target = mutableClass.methods.first { MethodUtil.methodSignaturesMatch(it, method) }
    mutableClass.methods.remove(target)

    val newImpl = ImmutableMethodImplementation(
        registerCount,
        emptyList(),
        emptyList(),
        null,
    )
    val newMethod = ImmutableMethod(
        method.definingClass,
        method.name,
        method.parameters,
        method.returnType,
        method.accessFlags,
        method.annotations,
        method.hiddenApiRestrictions,
        newImpl,
    ).toMutable().apply {
        addInstructions(0, smaliCode)
    }
    mutableClass.methods.add(newMethod)
    return newMethod
}

