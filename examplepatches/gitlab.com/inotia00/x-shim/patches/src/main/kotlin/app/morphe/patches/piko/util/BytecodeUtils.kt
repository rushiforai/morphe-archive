package app.morphe.patches.piko.util

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MethodParameter
import com.android.tools.smali.dexlib2.iface.reference.Reference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

fun MutableMethod.cleanup() =
    removeInstructions(0, implementation!!.instructions.lastIndex + 1)

fun Method.cloneMethod(
    registerCount: Int = implementation?.registerCount ?: 0,
    clearImplementation: Boolean = false,
    name: String = this.name,
    accessFlags: Int = this.accessFlags,
    parameters: List<MethodParameter> = this.parameters,
    returnType: String = this.returnType
): MutableMethod {
    val clonedImplementation = implementation?.let {
        ImmutableMethodImplementation(
            registerCount,
            if (clearImplementation) emptyList() else it.instructions,
            if (clearImplementation) emptyList() else it.tryBlocks,
            if (clearImplementation) emptyList() else it.debugItems,
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
    ).toMutable()
}

fun String.escapeString(): String = replace("\\/", "/")
    .replace("\\", "\\\\")
    .replace("\"", "\\\"")
    .replace("\n", "\\n")
    .replace("\r", "\\r")
    .replace("\t", "\\t")

fun String.toJavaClass(): String = drop(1)
    .dropLast(1)
    .replace("/", ".")

fun String.toSmaliClass(): String = "L${replace(".", "/")};"

context(_: BytecodePatchContext)
fun Fingerprint.findField(
    filter: MutableField.() -> Boolean = { definingClass.isNotEmpty() }
): MutableField = classDef.findField(filter)

context(context: BytecodePatchContext)
fun String.findField(
    filter: MutableField.() -> Boolean = { definingClass.isNotEmpty() }
): MutableField = context.mutableClassDefBy(this).findField(filter)

fun MutableClass.findField(
    filter: MutableField.() -> Boolean = { definingClass.isNotEmpty() }
): MutableField = fields.first(filter)

context(_: BytecodePatchContext)
inline fun <reified T : Reference> Fingerprint.getReference(
    matchIndex: Int = 0
) = instructionMatches[matchIndex]
    .instruction
    .getReference<T>()
