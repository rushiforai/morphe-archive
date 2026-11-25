package app.jofslash.patches.yallashoot.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

/**
 * The methods of [classType] (as "Lio/flutter/...;") called [name], optionally only those with these
 * [parameters]. Throws when the class or every such method is gone, so a changed app fails loudly
 * instead of being patched halfway.
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

/** Makes a void method return at once. */
internal fun MutableMethod.returnEarly() {
    if (returnType != "V") throw PatchException("$definingClass->$name doesn't return void")
    addInstructions(0, "return-void")
}
