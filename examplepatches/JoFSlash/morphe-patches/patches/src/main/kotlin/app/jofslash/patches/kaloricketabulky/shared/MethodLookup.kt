package app.jofslash.patches.kaloricketabulky.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * The methods of [classType] (as "Lcz/psc/...;") that [matches] picks. Throws when the class or
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

/** Makes a method that returns a boolean always return [value]. */
internal fun MutableMethod.returnBoolean(value: Boolean) {
    if (returnType != "Z") throw PatchException("$definingClass->$name doesn't return a boolean")
    addInstructions(0, "const/4 v0, ${if (value) "0x1" else "0x0"}\nreturn v0")
}

/** Sets the boolean parameter number [index] (0 is the first, not counting this) to false at the start. */
internal fun MutableMethod.clearBooleanParameter(index: Int) {
    if (parameterTypes.getOrNull(index)?.toString() != "Z") {
        throw PatchException("$definingClass->$name: parameter $index isn't a boolean")
    }
    // p0 is this in an instance method, so the parameters start at p1 there.
    val static = AccessFlags.STATIC.isSet(accessFlags)
    val register = index + if (static) 0 else 1
    // Every earlier parameter here takes one register (no long or double before it).
    if (parameterTypes.take(index).any { it.toString() == "J" || it.toString() == "D" }) {
        throw PatchException("$definingClass->$name: a wide parameter comes before parameter $index")
    }
    addInstructions(0, "const/16 p$register, 0x0")
}
