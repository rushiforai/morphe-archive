package app.template.patches.firefox.shared

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

// Fenix is built with -dontobfuscate and GeckoView / Android Components keep their API, so class
// and method names are the anchors here. R8 still inlines single-caller methods, drops unused
// parameters and narrows return types, so methods are looked up by name and parameter list
// (never by a pinned object return type) and every lookup fails loudly when it stops matching.

internal const val SETTINGS = "Lorg/mozilla/fenix/utils/Settings;"

internal fun Instruction.fieldRef() = (this as? ReferenceInstruction)?.reference as? FieldReference
internal fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference
internal fun Instruction.typeRef() = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

internal fun Method.insns(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
internal fun Method.params(): List<String> = parameterTypes.map(CharSequence::toString)

internal fun FieldReference.smali() = "$definingClass->$name:$type"
internal fun MethodReference.smali() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/** The class [type] to patch, or a loud failure. */
internal fun BytecodePatchContext.firefoxClass(type: String): MutableClass =
    mutableClassDefByOrNull(type) ?: throw PatchException("$type not found")

/** The class [type] to read only (not re-emitted), or a loud failure. */
internal fun BytecodePatchContext.readClass(type: String): ClassDef =
    classDefByOrNull(type) ?: throw PatchException("$type not found")

/** Every class that directly implements [interfaceType] (collected first, mutated afterwards). */
internal fun BytecodePatchContext.implementersOf(interfaceType: String): List<String> {
    val types = mutableListOf<String>()
    classDefForEach { if (interfaceType in it.interfaces) types += it.type }
    return types
}

/** The single concrete [name]([parameters]) of [type], whatever R8 narrowed its return type to. */
internal fun BytecodePatchContext.concreteMethod(type: String, name: String, parameters: List<String>): MutableMethod {
    val matches = firefoxClass(type).methods.filter {
        it.name == name && it.params() == parameters && it.implementation != null
    }
    return matches.singleOrNull()
        ?: throw PatchException("Expected one concrete $type->$name(${parameters.joinToString("")}), found ${matches.size}")
}

/** A Settings boolean getter (`()Z`), which must still exist under its Kotlin property name. */
internal fun BytecodePatchContext.settingsGetter(name: String): MutableMethod =
    concreteMethod(SETTINGS, name, emptyList()).also {
        if (it.returnType != "Z") throw PatchException("$SETTINGS->$name() returns ${it.returnType}, not Z")
    }

/**
 * `return Unit` at entry, with the `sget-object vX, Lkotlin/Unit;->INSTANCE` copied from the
 * method's own code. v0 always exists: every caller hooks an instance method with a parameter.
 */
internal fun MutableMethod.returnUnit() {
    val unit = insns().firstNotNullOfOrNull { insn ->
        insn.fieldRef()?.takeIf {
            insn.opcode == Opcode.SGET_OBJECT && it.definingClass == "Lkotlin/Unit;" && it.type == "Lkotlin/Unit;"
        }
    } ?: throw PatchException("$definingClass->$name reads no kotlin.Unit")
    addInstructionsChecked(
        0,
        """
            sget-object v0, ${unit.smali()}
            return-object v0
        """,
    )
}

/** `return null` at entry. v0 always exists: every caller hooks an instance method with a parameter. */
internal fun MutableMethod.returnNull() = addInstructionsChecked(
    0,
    """
        const/4 v0, 0x0
        return-object v0
    """,
)

/** Every register an instruction names, read or written. */
internal fun Instruction.registers(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is ThreeRegisterInstruction -> listOf(registerA, registerB, registerC)
    is TwoRegisterInstruction -> listOf(registerA, registerB)
    is OneRegisterInstruction -> listOf(registerA)
    else -> emptyList()
}

/** The register a `move-result*` at [index] writes, or a loud failure when [index] is no move-result. */
internal fun Method.moveResultRegister(index: Int): Int {
    val insn = insns().getOrNull(index)
    if (insn?.opcode != Opcode.MOVE_RESULT && insn?.opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException("$definingClass->$name: instruction $index is ${insn?.opcode}, not move-result")
    }
    return (insn as OneRegisterInstruction).registerA
}
