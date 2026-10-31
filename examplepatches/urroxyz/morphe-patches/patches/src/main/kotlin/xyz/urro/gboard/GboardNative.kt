package xyz.urro.gboard

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** Resolve implementation classes from Gboard's own diagnostic names, not R8 names. */
internal class GboardNative(context: BytecodePatchContext) {
    private val classes = buildList { context.classDefForEach { add(it) } }
    fun logged(path: String): ClassDef = classes.filter { c -> c.methods.any { it.name == "<clinit>" && path in it.strings() } }
        .unique("class $path")
    fun allFields(type: ClassDef): List<com.android.tools.smali.dexlib2.iface.Field> =
        type.fields.toList() + (classes.singleOrNull { it.type == type.superclass }?.let(::allFields) ?: emptyList())
    fun requireFields(type: ClassDef, vararg fields: Pair<String, String>) {
        val available = allFields(type)
        for ((name, kind) in fields) check(available.any { it.name == name && it.type == kind }) {
            "Unsupported Gboard implementation: missing $name:$kind on ${type.type}"
        }
    }
    fun type(name: String): ClassDef = classes.filter { it.type == name }.unique("class $name")
}

internal fun Method.strings() = (implementation?.instructions ?: emptyList()).mapNotNull {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
}.toList()
internal fun Method.calls() = (implementation?.instructions ?: emptyList()).mapNotNull {
    (it as? ReferenceInstruction)?.reference as? MethodReference
}.toList()
internal fun Method.signature(returns: String, vararg parameters: String) =
    returnType == returns && parameterTypes.map(CharSequence::toString) == parameters.toList()
internal fun <T> Iterable<T>.unique(role: String): T {
    val found = toList()
    check(found.size == 1) {
        "Unsupported Gboard implementation: expected one $role, found ${found.size}. No keyboard was installed."
    }
    return found.single()
}
internal fun ClassDef.method(role: String, predicate: (Method) -> Boolean): Method = methods.filter(predicate).unique(role)

internal fun BytecodePatchContext.nativeString(name: String, value: String) {
    val owner = mutableClassDefBy("Lxyz/urro/gboard/NativeApi;")
    val original = owner.methods.single { it.name == name }
    val method = com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
        original.definingClass, original.name, original.parameters, original.returnType,
        original.accessFlags, original.annotations, original.hiddenApiRestrictions,
        com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(1, emptyList(), emptyList(), emptyList()),
    ).toMutable()
    method.addInstructions(0, "const-string v0, \"$value\"\nreturn-object v0")
    check(owner.methods.remove(original)); owner.methods.add(method)
}

internal fun Method.fields() = (implementation?.instructions ?: emptyList()).mapNotNull {
    (it as? ReferenceInstruction)?.reference as? FieldReference
}.toList()
