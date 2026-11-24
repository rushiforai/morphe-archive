package app.jofslash.patches.listonic.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * The methods of [classType] (as "Lcom/l/...;") that [matches] picks. Throws when the class or
 * every such method is gone, so a changed app fails loudly instead of being patched halfway.
 */
internal fun BytecodePatchContext.methodsWhere(
    classType: String,
    what: String,
    matches: (MutableMethod) -> Boolean,
): List<MutableMethod> {
    val classDef = mutableClassDefByOrNull(classType)
        ?: throw PatchException("Couldn't find the class $classType")
    val methods = classDef.methods.filter(matches)
    if (methods.isEmpty()) throw PatchException("Couldn't find $classType->$what")
    return methods
}

/** The methods of [classType] called [name], optionally only those with these [parameters]. */
internal fun BytecodePatchContext.methodsOf(
    classType: String,
    name: String,
    parameters: List<String>? = null,
): List<MutableMethod> = methodsWhere(classType, name) { method ->
    method.name == name && (parameters == null || method.parameterTypes.map { it.toString() } == parameters)
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

/** Makes a method that returns an int always return [value]. */
internal fun MutableMethod.returnInt(value: Int) {
    if (returnType != "I") throw PatchException("$definingClass->$name doesn't return an int")
    addInstructions(0, "const/4 v0, 0x${value.toString(16)}\nreturn v0")
}

/** Makes a method that returns a boolean always return [value]. */
internal fun MutableMethod.returnBoolean(value: Boolean) {
    if (returnType != "Z") throw PatchException("$definingClass->$name doesn't return a boolean")
    addInstructions(0, "const/4 v0, ${if (value) "0x1" else "0x0"}\nreturn v0")
}

/** Whether this method is static. */
internal fun MutableMethod.isStatic(): Boolean = AccessFlags.STATIC.isSet(accessFlags)

/** Throws unless the method has at least [count] registers besides its parameters, for added code. */
internal fun MutableMethod.requireLocalRegisters(count: Int) {
    val implementation = implementation ?: throw PatchException("$definingClass->$name has no code")
    val parameterRegisters = parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 } +
            if (isStatic()) 0 else 1
    if (implementation.registerCount - parameterRegisters < count) {
        throw PatchException("$definingClass->$name has fewer than $count free registers")
    }
}
