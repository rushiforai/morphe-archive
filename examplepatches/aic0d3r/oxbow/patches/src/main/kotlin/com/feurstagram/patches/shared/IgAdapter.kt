package com.feurstagram.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

// Shared helpers for Instagram's Direct-inbox list adapter. They used to live in
// the Quoicouview patch (not ported to Oxbow); the Notes tray and caption patches
// still need them.

// Instagram's list adapter ("IgRecyclerViewAdapter", the name survives in a
// diagnostics string of its constructor). It is built from a builder holding
// its row types ("item definitions"), and the inbox is one of them.
internal object IgRecyclerViewAdapterFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf("IgRecyclerViewAdapter.mDefinitions"),
    custom = { method, _ -> method.parameterTypes.size == 1 },
)

internal val Method.params get() = parameterTypes.map { it.toString() }

internal fun methodRef(reference: Any?) = reference as? MethodReference

/** The adapter's method applying a list update: submit(List) wraps the list and calls it. */
internal fun BytecodePatchContext.igAdapterApply(): MutableMethod {
    val adapterType = IgRecyclerViewAdapterFingerprint.classDef.type
    // The inbox applies its updates directly, so the hook goes on apply, not submit.
    val submit = classDefBy(adapterType).methods.singleOrNull {
        it.returnType == "V" && it.params == listOf("Ljava/util/List;")
    } ?: throw PatchException("Adapter has no submit(List)")
    val apply = submit.implementation!!.instructions.mapNotNull {
        methodRef((it as? ReferenceInstruction)?.reference)
    }.singleOrNull {
        it.definingClass == adapterType && it.parameterTypes.size == 1 && it.returnType == "V"
    } ?: throw PatchException("Adapter submit(List) does not apply an update")
    var target = mutableClassDefBy(adapterType).methods.single {
        it.name == apply.name && it.params == apply.parameterTypes.map { p -> p.toString() }
    }
    // Some inbox variants call apply(update, callback) directly. submit(List)
    // reaches it through apply(update), which is only a convenience wrapper;
    // hooking that wrapper misses both Notes filtering and stories insertion.
    val updateType = apply.parameterTypes.single().toString()
    val visited = mutableSetOf<String>()
    while (visited.add(target.name + target.params)) {
        val delegates = target.instructions.mapNotNull {
            methodRef((it as? ReferenceInstruction)?.reference)
        }.filter {
            it.definingClass == adapterType && it.returnType == "V" &&
                it.parameterTypes.firstOrNull()?.toString() == updateType && it.name != target.name
        }.distinctBy { it.name + it.parameterTypes }
        if (delegates.isEmpty()) return target
        val delegate = delegates.singleOrNull()
            ?: throw PatchException("Ambiguous adapter update delegation")
        target = mutableClassDefBy(adapterType).methods.single {
            it.name == delegate.name && it.params == delegate.parameterTypes.map { p -> p.toString() }
        }
    }
    throw PatchException("Cyclic adapter update delegation")
}

/** The list-model interface of the adapter's row types. */
internal fun BytecodePatchContext.igListModelType(): String {
    val definitionType = classDefBy(IgRecyclerViewAdapterFingerprint.method.params.single()).methods.singleOrNull {
        it.name != "<init>" && it.returnType == "V" && it.parameterTypes.size == 1 &&
            it.parameterTypes[0].toString().let { type ->
                !type.startsWith("Ljava/") && !type.startsWith("Landroid/")
            }
    }?.params?.single() ?: throw PatchException("Adapter builder has no add-definition method")
    val definition = classDefBy(definitionType)
    val holderType = definition.methods.singleOrNull {
        it.params == listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;")
    }?.returnType ?: throw PatchException("Row definition has no create method")
    return definition.methods.singleOrNull {
        it.returnType == "V" && it.parameterTypes.size == 2 && it.params[0] == holderType
    }?.params?.get(1) ?: throw PatchException("Row definition has no bind method")
}

/** Whether a class implements Instagram's list-model interface, directly or not. */
internal fun BytecodePatchContext.isListModel(type: String, modelType: String): Boolean {
    fun extendsModel(interfaceType: String): Boolean = interfaceType == modelType ||
        (runCatching { classDefBy(interfaceType) }.getOrNull()?.interfaces?.any { extendsModel(it) } == true)
    var current: String? = type
    while (current != null && current != "Ljava/lang/Object;") {
        val classDef = runCatching { classDefBy(current) }.getOrNull() ?: return false
        if (classDef.interfaces.any { extendsModel(it) }) return true
        current = classDef.superclass
    }
    return false
}

/** Add a method (public by default) with the given smali body to an extension class. */
internal fun MutableClass.addBridge(
    name: String,
    parameters: List<String>,
    returnType: String,
    registers: Int,
    smali: String,
    accessFlags: Int = AccessFlags.PUBLIC.value,
) {
    methods.add(
        ImmutableMethod(
            type,
            name,
            parameters.map { ImmutableMethodParameter(it, null, null) },
            returnType,
            accessFlags,
            null,
            null,
            MutableMethodImplementation(registers),
        ).toMutable().apply { addInstructions(0, smali.trimIndent()) },
    )
}
