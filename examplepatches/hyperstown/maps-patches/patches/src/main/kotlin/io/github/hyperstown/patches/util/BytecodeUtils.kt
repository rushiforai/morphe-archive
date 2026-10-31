package io.github.hyperstown.patches.util

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import io.github.hyperstown.patches.maps.shared.Constants.EXTENSION_PACKAGE
import java.util.logging.Logger

private val logger = Logger.getLogger("io.github.hyperstown.patches")

/**
 * The single app method matching [fingerprint].
 *
 * A fingerprint resolves to the first method it finds. Maps is heavily obfuscated, so this checks
 * every method and fails on an ambiguous match instead of silently patching the wrong one.
 */
internal fun BytecodePatchContext.uniqueMethod(fingerprint: Fingerprint, label: String) =
    uniqueMethodOrNull(fingerprint, label) ?: throw PatchException("Could not find $label")

internal fun BytecodePatchContext.uniqueMethodOrNull(fingerprint: Fingerprint, label: String): MutableMethod? {
    val matches = fingerprint.matchAllOrNull().orEmpty().filterNot {
        it.originalClassDef.type.startsWith(EXTENSION_PACKAGE)
    }
    fingerprint.clearMatch()

    if (matches.size > 1) {
        throw PatchException(
            "Ambiguous $label: " + matches.joinToString { "${it.originalClassDef.type}->${it.originalMethod.name}" },
        )
    }

    return matches.singleOrNull()?.method?.also { logger.info("Found $label: $it") }
}

/**
 * The concrete instance method matching [predicate] that [type] declares or inherits from an app class.
 * Framework superclasses cannot be patched, so the search stops at the first one.
 */
internal fun BytecodePatchContext.inheritedMethod(
    type: String,
    label: String,
    predicate: (Method) -> Boolean,
): MutableMethod {
    var className = type
    val visited = mutableSetOf<String>()

    while (visited.add(className)) {
        val classDef = classDefByOrNull(className) ?: break
        val matches = classDef.methods.filter(predicate)

        if (matches.isNotEmpty()) {
            val match = matches.singleOrNull()
                ?: throw PatchException("Ambiguous $label in $className: ${matches.joinToString()}")
            if (AccessFlags.STATIC.isSet(match.accessFlags) ||
                AccessFlags.PRIVATE.isSet(match.accessFlags) ||
                match.implementation == null
            ) {
                throw PatchException("Expected a concrete instance method for $label: $match")
            }

            return mutableClassDefBy(className).methods.single { it.signatureEquals(match) }
                .also { logger.info("Found $label: $it") }
        }

        className = classDef.superclass ?: break
    }

    throw PatchException("Could not find $label in $type or its app superclasses: ${visited.joinToString()}")
}

internal fun Method.signatureEquals(other: Method) =
    name == other.name && returnType == other.returnType && parameterTypes == other.parameterTypes

internal fun Method.parameterTypeNames() = parameterTypes.map { it.toString() }

internal fun MethodReference.parameterTypeNames() = parameterTypes.map { it.toString() }

internal val Instruction.stringOrNull: String?
    get() = getReference<StringReference>()?.string

/** The registers an invoke passes, in argument order, for both the explicit and the range format. */
internal fun Instruction.invokeRegisters(): List<Int> = when (this) {
    is FiveRegisterInstruction ->
        listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)

    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> throw PatchException("Not an invoke instruction: $opcode")
}

/** The smali that invokes [descriptor] with the same registers as the [original] invoke. */
internal fun invokeStaticWithSameRegisters(original: Instruction, descriptor: String): String {
    val registers = original.invokeRegisters()

    return if (original is RegisterRangeInstruction) {
        "invoke-static/range { v${registers.first()} .. v${registers.last()} }, $descriptor"
    } else {
        "invoke-static { ${registers.joinToString { "v$it" }} }, $descriptor"
    }
}

/** The index of the instruction the branch at [index] jumps to. */
internal fun List<Instruction>.branchTarget(index: Int): Int {
    val target = take(index).sumOf { it.codeUnits } + (this[index] as OffsetInstruction).codeOffset

    var address = 0
    forEachIndexed { i, instruction ->
        if (address == target) return i
        address += instruction.codeUnits
    }

    throw PatchException("Invalid branch target at index $index")
}
