package app.jofslash.patches.booking.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * The methods of [classType] (as "Lcom/booking/...;") called [name], optionally only those with
 * these [parameters]. Throws when the class or the method is gone, so a changed app fails loudly.
 */
internal fun BytecodePatchContext.methodsOf(
    classType: String,
    name: String,
    parameters: List<String>? = null,
): List<MutableMethod> {
    val classDef = mutableClassDefByOrNull(classType)
        ?: throw PatchException("Couldn't find the class $classType")
    val methods = classDef.methods.filter { method ->
        method.name == name && (parameters == null || method.parameterTypes.map { it.toString() } == parameters)
    }
    if (methods.isEmpty()) throw PatchException("Couldn't find $classType->$name")
    return methods
}

/** The one method of [classType] called [name]; see [methodsOf]. */
internal fun BytecodePatchContext.methodOf(
    classType: String,
    name: String,
    parameters: List<String>? = null,
): MutableMethod {
    val methods = methodsOf(classType, name, parameters)
    if (methods.size != 1) throw PatchException("Expected one $classType->$name, found ${methods.size}")
    return methods.single()
}

/**
 * Every method of [classType] that only returns the field [fieldName] of the object: the getter,
 * and for a Kotlin data class also its componentN() function, which R8 can keep as a second copy.
 */
internal fun BytecodePatchContext.fieldGettersOf(classType: String, fieldName: String): List<MutableMethod> {
    val classDef = mutableClassDefByOrNull(classType)
        ?: throw PatchException("Couldn't find the class $classType")
    val getters = classDef.methods.filter { method ->
        if (method.parameterTypes.isNotEmpty() || AccessFlags.STATIC.isSet(method.accessFlags)) return@filter false
        val instructions = method.implementation?.instructions?.toList() ?: return@filter false
        if (instructions.size != 2) return@filter false
        val read = instructions[0]
        read.opcode == Opcode.IGET_OBJECT &&
                ((read as ReferenceInstruction).reference as FieldReference).name == fieldName &&
                instructions[1].opcode == Opcode.RETURN_OBJECT
    }
    if (getters.isEmpty()) throw PatchException("Couldn't find a getter of $classType->$fieldName")
    return getters
}

/** Makes the method return at once: void methods just return, others return null, false or 0. */
internal fun MutableMethod.returnEarly() {
    val smali = when (returnType) {
        "V" -> "return-void"
        "Z", "B", "S", "C", "I", "F" -> "const/4 v0, 0x0\nreturn v0"
        "J", "D" -> "const-wide/16 v0, 0x0\nreturn-wide v0"
        else -> "const/4 v0, 0x0\nreturn-object v0"
    }
    addInstructions(0, smali)
}
