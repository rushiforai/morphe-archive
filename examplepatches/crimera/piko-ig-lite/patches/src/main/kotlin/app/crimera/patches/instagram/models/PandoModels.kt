/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.models

import app.crimera.bytecode.Block
import app.crimera.bytecode.Target
import app.crimera.patches.common.isAssignableTo
import app.crimera.patches.common.requireAtMostOne
import app.crimera.patches.common.requireExactlyOne
import app.crimera.patches.common.resolveIntegerLiteralOnCurrentPath
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import java.util.WeakHashMap

internal const val MEDIA_DESCRIPTOR = "Lcom/instagram/feed/media/Media;"
internal const val USER_DESCRIPTOR = "Lcom/instagram/user/model/User;"
private const val LIVE_TREE_DESCRIPTOR = "Lcom/instagram/pando/livetree/LiveTreeJNI;"

/**
 * A Pando-backed model and the LiveTree dict that older releases keep its getters on. Current
 * releases declare the getters on the model itself; older ones declare them on the dict the model holds
 * in a field.
 */
internal enum class PandoModel(
    val descriptor: String,
    val dictDescriptor: String,
) {
    MEDIA(MEDIA_DESCRIPTOR, "Lcom/instagram/feed/media/LiveTreeMediaDict;"),
    USER(USER_DESCRIPTOR, "Lcom/instagram/user/model/LiveTreeUserDict;"),
}

/** How a lazy model getter is recognised. */
internal sealed interface PandoField {
    /** The getter spells its Pando key out as a `const-string`. */
    data class Key(
        val key: String,
    ) : PandoField

    /**
     * The getter decodes its key at runtime (`username` never appears as a string in the dex), so it
     * is identified by the Pando field [id] it passes to its LiveTree read. [name] labels failures.
     */
    data class FieldId(
        val name: String,
        val id: Int,
    ) : PandoField
}

/** A resolved lazy getter, reached through [dictField] when it lives on the model's dict. */
internal data class ModelGetter(
    val model: PandoModel,
    val field: PandoField,
    val dictField: FieldReference?,
    val getter: MethodReference,
    val ownerIsInterface: Boolean,
)

private data class ModelGetterKey(
    val model: PandoModel,
    val field: PandoField,
    val returns: String?,
)

private object ModelGetterCache {
    private val values = WeakHashMap<BytecodePatchContext, MutableMap<ModelGetterKey, ModelGetter>>()

    @Synchronized
    fun getOrPut(
        context: BytecodePatchContext,
        key: ModelGetterKey,
        resolve: () -> ModelGetter,
    ): ModelGetter = values.getOrPut(context) { mutableMapOf() }.getOrPut(key, resolve)
}

/**
 * The [model] getter for [field], resolved once per patch context. A key is often spelled by several
 * getters (a `carousel_media` check also sits in the count and flag getters), so [returns] narrows the
 * candidates to the getters whose return type is assignable to that descriptor.
 */
context(context: BytecodePatchContext)
internal fun resolvedModelGetter(
    model: PandoModel,
    field: PandoField,
    returns: String? = null,
): ModelGetter =
    ModelGetterCache.getOrPut(context, ModelGetterKey(model, field, returns)) { resolveModelGetter(model, field, returns) }

context(context: BytecodePatchContext)
private fun resolveModelGetter(
    model: PandoModel,
    field: PandoField,
    returns: String?,
): ModelGetter {
    val modelClass = context.classDefBy(model.descriptor)
    val dictField =
        requireAtMostOne(
            "${model.dictDescriptor} field on ${model.descriptor}",
            modelClass.fields
                .filter { it.type == model.dictDescriptor }
                .map { ImmutableFieldReference(it.definingClass, it.name, it.type) },
        )

    // Both shapes are searched, so a release that declares the getter on both owners fails instead
    // of silently preferring one.
    val candidates =
        (
            modelClass.lazyGetters(field).map { null to it } +
                dictField?.let { dict -> context.classDefBy(dict.type).lazyGetters(field).map { dict to it } }.orEmpty()
        ).filter { (_, getter) -> returns == null || context.isAssignableTo(getter.returnType, returns) }
    val (dict, getter) =
        requireExactlyOne("${model.descriptor} getter for $field returning ${returns ?: "any type"}", candidates) { (dict, getter) ->
            if (dict == null) getter.toString() else "$dict -> $getter"
        }

    val owner = context.classDefBy(getter.definingClass)
    if (!AccessFlags.PUBLIC.isSet(owner.accessFlags) || !AccessFlags.PUBLIC.isSet(getter.accessFlags)) {
        throw PatchException("${model.descriptor} getter for $field is not callable from the extension: $getter")
    }
    if (dict != null && modelClass.fields.none { it.name == dict.name && AccessFlags.PUBLIC.isSet(it.accessFlags) }) {
        throw PatchException("${model.descriptor} dict field $dict is not readable from the extension")
    }

    return ModelGetter(
        model = model,
        field = field,
        dictField = dict,
        getter =
            ImmutableMethodReference(
                getter.definingClass,
                getter.name,
                getter.parameterTypes,
                getter.returnType,
            ),
        ownerIsInterface = AccessFlags.INTERFACE.isSet(owner.accessFlags),
    )
}

/** Instance getters without parameters that read [field]. */
private fun ClassDef.lazyGetters(field: PandoField): List<Method> =
    methods.filter { method ->
        method.parameterTypes.isEmpty() &&
            method.returnType != "V" &&
            !AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.reads(field)
    }

private fun Method.reads(field: PandoField): Boolean {
    val instructions = implementation?.instructions?.toList() ?: return false
    return when (field) {
        is PandoField.Key -> instructions.any { it.getReference<StringReference>()?.string == field.key }

        // The field id must be the argument of a LiveTree value read, not just any literal.
        is PandoField.FieldId ->
            instructions.indices.any { index ->
                val reference = instructions[index].getReference<MethodReference>()
                if (reference?.definingClass != LIVE_TREE_DESCRIPTOR) return@any false
                if (reference.parameterTypes.map { it.toString() } != listOf("I")) return@any false
                val idRegister =
                    when (val invoke = instructions[index]) {
                        is FiveRegisterInstruction -> if (invoke.registerCount == 2) invoke.registerD else return@any false
                        is RegisterRangeInstruction -> if (invoke.registerCount == 2) invoke.startRegister + 1 else return@any false
                        else -> return@any false
                    }
                instructions.resolveIntegerLiteralOnCurrentPath(index, idRegister) == field.id
            }
    }
}

/**
 * Reads [modelGetter] from the model in the 4-bit register [model] into [destination], which must
 * also be a 4-bit register and may equal [model]. Jumps to [whenAbsent] when the model's dict is
 * missing (dict shape only).
 */
internal fun Block.readModelValue(
    destination: Int,
    model: Int,
    modelGetter: ModelGetter,
    whenAbsent: Target,
) {
    var receiver = model
    modelGetter.dictField?.let { field ->
        iget(destination, model, field)
        ifEqz(destination, whenAbsent)
        receiver = destination
    }
    if (modelGetter.ownerIsInterface) {
        invokeInterface(modelGetter.getter, receiver)
    } else {
        invokeVirtual(modelGetter.getter, receiver)
    }
    moveResult(destination, modelGetter.getter.returnType)
}
