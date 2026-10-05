package dev.twitchpatches.patches.twitch.settings

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import dev.twitchpatches.patches.twitch.shared.code
import dev.twitchpatches.patches.twitch.shared.references
import dev.twitchpatches.patches.twitch.shared.uniqueHook

private const val FRAGMENT = "Ltv/twitch/android/settings/main/MainSettingsFragmentV2;"
internal const val SETTINGS = "Ldev/twitchpatches/extension/settings/PatchSettings;"
internal const val ACTION = "Ldev/twitchpatches/extension/settings/SettingsClickAction;"

internal data class SettingsHooks(
    val group: Method,
    val row: Method,
    val rowIndex: Int,
    val composerRegister: Int,
    val callback: String,
    val composer: String,
    val unit: FieldReference,
)

internal fun BytecodePatchContext.resolveSettingsHooks(): SettingsHooks {
    val roots = mutableListOf<MethodReference>()
    val callbacks = mutableListOf<String>()
    classDefForEach { type ->
        type.methods.forEach { method ->
            val references = method.references()
            if (references.filterIsInstance<TypeReference>().any { it.type == FRAGMENT }) {
                roots.addAll(references.filterIsInstance<MethodReference>().filter {
                    it.returnType == "V" && it.parameterTypes.size > 30 &&
                        it.parameterTypes.count { parameter -> parameter == "Ljava/lang/String;" } == 4
                })
            }
        }
        if (type.methods.any { it.name == "<init>" && it.parameterTypes.map { parameter -> parameter.toString() } ==
                listOf(FRAGMENT, "I") }) callbacks.add(type.type)
    }
    val root = roots.distinctBy { it.toString() }.uniqueHook("native settings composition root")
    val owner = classDefBy(root.definingClass)
    val row = owner.methods.filter(::isSettingsRow).uniqueHook("native settings row renderer")
    val callback = row.parameterTypes[2].toString()
    val composer = row.parameterTypes[5].toString()
    validateCallback(callback)
    val group = owner.methods.filter { method ->
        method.returnType == "V" && AccessFlags.PUBLIC.isSet(method.accessFlags) &&
            AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.parameterTypes.map { it.toString() } == listOf("Z") + List(7) { callback } + listOf(composer, "I")
    }.uniqueHook("account/preferences settings group")
    val rootMethod = owner.methods.filter { it.toString() == root.toString() }.uniqueHook("settings root definition")
    if (rootMethod.references().filterIsInstance<MethodReference>().none { it.toString() == group.toString() }) {
        throw PatchException("Patch settings: account group is not called by the native settings root.")
    }
    val rowCalls = group.code().withIndex().filter {
        (it.value as? ReferenceInstruction)?.reference?.toString() == row.toString()
    }
    if (rowCalls.size != 7) throw PatchException("Patch settings: expected seven native account/preferences rows.")
    val rowIndex = rowCalls.first().index
    val register = rowComposerRegister(group, rowIndex)
    val callbackClass = callbacks.map { classDefBy(it) }.filter { callback in it.interfaces }
        .uniqueHook("settings navigation callback")
    val unit = callbackClass.methods.filter { it.name == "invoke" && it.parameterTypes.isEmpty() }
        .flatMap { method ->
            val returned = method.code().filter { it.opcode == Opcode.RETURN_OBJECT }
                .mapNotNull { (it as? OneRegisterInstruction)?.registerA }.toSet()
            method.code().mapNotNull { load ->
                val field = (load as? ReferenceInstruction)?.reference as? FieldReference
                if (load.opcode == Opcode.SGET_OBJECT && (load as? OneRegisterInstruction)?.registerA in returned &&
                    field != null && field.type == field.definingClass) field else null
            }
        }.distinctBy { it.toString() }.uniqueHook("native settings callback Unit result")
    val unitField = classDefBy(unit.definingClass).fields.filter { it.toString() == unit.toString() }
        .uniqueHook("native Unit field")
    if (!AccessFlags.PUBLIC.isSet(unitField.accessFlags) || !AccessFlags.STATIC.isSet(unitField.accessFlags)) {
        throw PatchException("Patch settings: native Unit field is inaccessible.")
    }
    return SettingsHooks(group, row, rowIndex, register, callback, composer, unit)
}

internal fun isSettingsRow(method: Method): Boolean {
    val params = method.parameterTypes.map { it.toString() }
    return method.returnType == "V" && AccessFlags.PUBLIC.isSet(method.accessFlags) &&
        AccessFlags.STATIC.isSet(method.accessFlags) && params.size == 8 &&
        params.take(2) == listOf("Ljava/lang/String;", "Ljava/lang/String;") &&
        params[2].startsWith("L") && params[3] == "I" && params[4].startsWith("L") &&
        params[5].startsWith("L") && params.takeLast(2) == listOf("I", "I") &&
        method.implementation != null && !AccessFlags.SYNTHETIC.isSet(method.accessFlags)
}

internal fun rowComposerRegister(method: Method, index: Int): Int {
    val instruction = method.code().getOrNull(index)
    val range = instruction as? RegisterRangeInstruction
        ?: throw PatchException("Patch settings: native row call must use a register range.")
    val registers = method.implementation?.registerCount
        ?: throw PatchException("Patch settings: missing group implementation.")
    if (instruction.opcode != Opcode.INVOKE_STATIC_RANGE || range.registerCount != 8 ||
        range.startRegister + range.registerCount > registers) {
        throw PatchException("Patch settings: invalid native row arguments/registers.")
    }
    return range.startRegister + 5
}

private fun BytecodePatchContext.validateCallback(type: String) {
    val pending = ArrayDeque(listOf(type))
    val visited = mutableSetOf<String>()
    var invocations = 0
    while (pending.isNotEmpty()) {
        val current = pending.removeFirst()
        if (!visited.add(current)) continue
        val definition = classDefBy(current)
        if (!AccessFlags.INTERFACE.isSet(definition.accessFlags)) {
            throw PatchException("Patch settings: navigation callback is not an interface.")
        }
        definition.methods.filter { AccessFlags.ABSTRACT.isSet(it.accessFlags) }.forEach {
            if (it.name != "invoke" || it.parameterTypes.isNotEmpty() || it.returnType != "Ljava/lang/Object;") {
                throw PatchException("Patch settings: navigation callback has an unsupported abstract contract.")
            }
            invocations++
        }
        pending.addAll(definition.interfaces)
    }
    if (invocations != 1) throw PatchException("Patch settings: expected one zero-argument callback contract.")
}
