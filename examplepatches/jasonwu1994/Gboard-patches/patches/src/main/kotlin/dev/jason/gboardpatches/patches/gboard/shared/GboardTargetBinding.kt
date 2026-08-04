package dev.jason.gboardpatches.patches.gboard.shared

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal class GboardMethodTarget(
    classType: String,
    val name: String,
    parameterTypes: List<String>,
    returnType: String,
) {
    private val owner = classType
    private val parameters = parameterTypes
    private val returns = returnType
    val descriptor: String = "(${parameters.joinToString("")})$returns"
    val reference: String = "$owner->$name$descriptor"
    val ownerDescriptor: String get() = owner

    fun resolve(context: BytecodePatchContext): MutableMethod =
        resolve(context.mutableClass(owner))

    fun resolve(ownerClass: MutableClass): MutableMethod = ownerClass.methods.firstOrNull(::matches)
        ?: error("Could not find $reference")

    fun ownerClass(context: BytecodePatchContext): MutableClass = context.mutableClass(owner)

    fun matches(method: MethodReference): Boolean =
        method.definingClass == owner &&
            method.name == name &&
            method.parameterTypes == parameters &&
            method.returnType == returns

    fun referenceNamed(replacementName: String): String = "$owner->$replacementName$descriptor"

    fun installHelper(
        context: BytecodePatchContext,
        name: String,
        accessFlags: Int,
        registerCount: Int,
        body: String,
    ) {
        context.addHelperMethodIfMissing(
            classType = owner,
            name = name,
            parameterTypes = parameters,
            returnType = returns,
            accessFlags = accessFlags,
            registerCount = registerCount,
            body = body,
        )
    }

}

internal class GboardFieldTarget(
    classType: String,
    val name: String,
    val type: String,
) {
    private val owner = classType
    val reference: String = "$owner->$name:$type"

    fun resolve(context: BytecodePatchContext): MutableField =
        context.mutableClass(owner).fields.firstOrNull(::matches)
            ?: error("Could not find $reference")

    fun matches(field: FieldReference): Boolean =
        field.definingClass == owner && field.name == name && field.type == type

}

@JvmInline
internal value class GboardTypeTarget(val descriptor: String)
