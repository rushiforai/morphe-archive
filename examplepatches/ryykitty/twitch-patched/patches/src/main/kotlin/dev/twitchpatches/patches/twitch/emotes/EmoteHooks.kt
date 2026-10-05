package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import dev.twitchpatches.patches.twitch.shared.*

internal const val EMOTES = "Ldev/twitchpatches/extension/emotes/EmoteRuntime;"
internal const val TEXT_SETTER = "Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView\$BufferType;)V"
private const val CONNECTION = "Ltv/twitch/android/shared/chat/pub/messages/data/ChannelChatConnectionKey;"
internal const val CHANNEL_ID = "Ltv/twitch/android/models/Tuid;"

internal data class EmoteHooks(val connection: Method, val binder: Method, val setterIndex: Int,
    val source: FieldReference, val textView: FieldReference)

internal fun BytecodePatchContext.resolveEmoteHooks(): EmoteHooks {
    val classes = mutableListOf<ClassDef>().apply { classDefForEach { add(it) } }
    val model = classes.filter { type -> type.methods.any { it.name == "toString" &&
            it.hasStrings("MessageRecyclerItem(messageId=", ", sourceChannelId=") } }.uniqueHook("chat message row model")
    val source = sourceChannelField(model.methods.filter { it.name == "toString" }.uniqueHook("chat model description"))
    val binders = classes.flatMap { it.methods }.filter { method ->
        method.isInstance(listOf(model.type, "Z"), "V") &&
            method.references().count { it.toString() == TEXT_SETTER } == 1
    }
    val binder = binders.uniqueHook("formatted chat text binder")
    val setterIndex = binder.code().indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == TEXT_SETTER }
    val field = textViewField(binder, setterIndex)
    var owner: ClassDef? = classDefBy(binder.definingClass)
    while (owner != null && owner.type != field.definingClass) owner = owner.superclass?.let { parent -> classes.singleOrNull { it.type == parent } }
    if (owner == null) throw PatchException("Emotes: text field is outside the chat row hierarchy.")
    val declaration = owner.fields.filter { it.name == field.name && it.type == field.type }.uniqueHook("chat text field declaration")
    if (AccessFlags.STATIC.isSet(declaration.accessFlags) || AccessFlags.PRIVATE.isSet(declaration.accessFlags))
        throw PatchException("Emotes: chat text field is inaccessible to the typed bridge.")
    val connection = classDefBy(CONNECTION).methods.filter {
        it.name == "<init>" && it.parameterTypes.size == 2 &&
            it.parameterTypes[0].toString() in setOf("Ljava/lang/String;", CHANNEL_ID) &&
            it.isInstance(listOf(it.parameterTypes[0].toString(), "Ljava/lang/String;"), "V")
    }.uniqueHook("chat connection constructor")
    validateEmoteConnection(connection)
    if (connection.parameterTypes[0].toString() == CHANNEL_ID) {
        classDefBy(CHANNEL_ID).methods.filter { it.name == "toString" &&
            it.isInstance(emptyList(), "Ljava/lang/String;") && AccessFlags.PUBLIC.isSet(it.accessFlags)
        }.uniqueHook("chat channel ID string conversion")
    }
    return EmoteHooks(connection, binder, setterIndex, source, field)
}

internal fun validateEmoteConnection(connection: Method) {
    val channelType = connection.parameterTypes.firstOrNull()?.toString()
    if (channelType !in setOf("Ljava/lang/String;", CHANNEL_ID) ||
        !connection.isInstance(listOf(channelType ?: "", "Ljava/lang/String;"), "V"))
        throw PatchException("Emotes: unsupported chat connection parameters.")
    if (connection.code().lastOrNull()?.opcode != Opcode.RETURN_VOID ||
        connection.references().filterIsInstance<FieldReference>().none { it.name == "channelId" &&
            it.type == channelType && it.definingClass == connection.definingClass })
        throw PatchException("Emotes: chat connection channel ID contract changed.")
    val channelAssignment = connection.code().filter { it.opcode == Opcode.IPUT_OBJECT &&
        ((it as? ReferenceInstruction)?.reference as? FieldReference)?.name == "channelId" }.uniqueHook("chat channel ID assignment")
    val connectionParameters = (connection.implementation?.registerCount ?: 0) - 3
    if (channelAssignment !is TwoRegisterInstruction || channelAssignment.registerA != connectionParameters + 1 ||
        channelAssignment.registerB != connectionParameters || connection.code().any {
            it.opcode.setsRegister() && it is OneRegisterInstruction && it.registerA in connectionParameters + 1..connectionParameters + 2
        }) throw PatchException("Emotes: chat connection constructor no longer preserves its channel arguments.")
}

internal fun sourceChannelField(method: Method): FieldReference {
    val code = method.code()
    val marker = code.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == ", sourceChannelId=" }
    if (marker < 0) throw PatchException("Emotes: source channel label is missing.")
    val segment = code.drop(marker + 1).takeWhile { (it as? ReferenceInstruction)?.reference !is StringReference }
    return segment.filter { it.opcode == Opcode.IGET_OBJECT }.mapNotNull {
        (it as? ReferenceInstruction)?.reference as? FieldReference
    }.filter { it.definingClass == method.definingClass && it.type == "Ljava/lang/String;" }.distinctBy { it.toString() }
        .uniqueHook("chat source channel field")
}

internal fun textViewField(method: Method, setterIndex: Int): FieldReference {
    val code = method.code()
    val call = code.getOrNull(setterIndex) as? FiveRegisterInstruction
        ?: throw PatchException("Emotes: chat text setter invoke shape changed.")
    if (code[setterIndex].opcode != Opcode.INVOKE_VIRTUAL || call.registerCount != 3 ||
        (code[setterIndex] as? ReferenceInstruction)?.reference?.toString() != TEXT_SETTER)
        throw PatchException("Emotes: expected typed chat text setter.")
    val params = (method.implementation?.registerCount ?: 0) - 3
    if (params < 0 || method.parameterTypes.size != 2 || method.parameterTypes[1].toString() != "Z")
        throw PatchException("Emotes: chat binder parameter layout changed.")
    if (code.take(setterIndex + 1).any { it.opcode.setsRegister() && it is OneRegisterInstruction && it.registerA in params..params + 1 })
        throw PatchException("Emotes: chat binder overwrites bridge input parameters.")
    for (index in setterIndex - 1 downTo 0) {
        val instruction = code[index]
        if (!instruction.opcode.canContinue() || instruction.opcode.name.startsWith("IF_") || instruction.opcode.name.endsWith("SWITCH")) break
        if (instruction.opcode.setsRegister() && instruction is OneRegisterInstruction && instruction.registerA == call.registerC) {
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            if (instruction.opcode == Opcode.IGET_OBJECT && instruction is TwoRegisterInstruction &&
                field?.type == "Landroid/widget/TextView;" && isHolderAlias(method, index, instruction.registerB, params)) return field
            break
        }
    }
    throw PatchException("Emotes: chat TextView receiver cannot be derived safely.")
}

private fun isHolderAlias(method: Method, before: Int, register: Int, holderParameter: Int): Boolean {
    if (register == holderParameter) return true
    val code = method.code()
    val writes = code.take(before).withIndex().filter {
        it.value.opcode.setsRegister() && it.value is OneRegisterInstruction && (it.value as OneRegisterInstruction).registerA == register
    }
    if (writes.size != 1) return false
    val assignment = writes.single()
    val move = assignment.value as? TwoRegisterInstruction ?: return false
    if (move.opcode !in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16) || move.registerB != holderParameter) return false
    return code.take(assignment.index).none { !it.opcode.canContinue() || it.opcode.name.startsWith("IF_") || it.opcode.name.endsWith("SWITCH") }
}
