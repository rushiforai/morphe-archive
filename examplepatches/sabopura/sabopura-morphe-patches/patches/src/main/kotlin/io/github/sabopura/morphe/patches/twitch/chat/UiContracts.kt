package io.github.sabopura.morphe.patches.twitch.chat

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import io.github.sabopura.morphe.patches.twitch.support.callRegisters
import io.github.sabopura.morphe.patches.twitch.support.classesWithStrings
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract

private fun Instruction.setsVodText(): Boolean {
    val ref = (this as? ReferenceInstruction)?.reference as? MethodReference
    return ref?.definingClass == "Landroid/widget/TextView;" && ref.name == "setText" &&
        ref.parameterTypes.map { it.toString() } == listOf("Ljava/lang/CharSequence;")
}

internal fun isVodBinder(method: Method): Boolean = !AccessFlags.STATIC.isSet(method.accessFlags) &&
    method.returnType == "V" && method.parameterTypes.size == 1 && method.parameterTypes[0].startsWith("L") &&
    method.implementation?.instructions?.any { it.setsVodText() } == true

/**
 * Where the VOD hook goes: right after the binder's only text setter. Later in the binder Twitch
 * reuses the row's register (31.9.0 keeps a touch listener in p0), so a hook at the return would
 * get the wrong objects; one that would get them here fails at patch time instead.
 */
internal fun vodHookIndex(method: Method): Int {
    val implementation = method.implementation ?: throw PatchException("VOD chat: binder has no code")
    val code = implementation.instructions.toList()
    val setters = code.indices.filter { code[it].setsVodText() }
    val setter = setters.singleOrNull() ?: throw PatchException("VOD chat: ${setters.size} text setters in the binder")
    val row = implementation.registerCount - 2
    for (instruction in code.take(setter)) {
        val target = (instruction as? OneRegisterInstruction)?.registerA
        if (target == null || !instruction.opcode.setsRegister()) continue
        val written = if (instruction.opcode.setsWideRegister()) target..target + 1 else target..target
        // The holder parameter is narrowed by check-cast, or set to null on the path that skips the setter.
        val narrowsHolder = instruction.opcode == Opcode.CHECK_CAST ||
            instruction.opcode == Opcode.CONST_4 && (instruction as NarrowLiteralInstruction).narrowLiteral == 0
        if (row in written || row + 1 in written && !narrowsHolder)
            throw PatchException("VOD chat: binder overwrites its row or holder before the text is set")
    }
    return setter + 1
}

internal fun isVodRow(type: ClassDef, model: String): Boolean =
    type.instanceFields.count { it.type == model } == 1 &&
        type.methods.any { it.name == "getItemId" && it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty() } &&
        type.methods.any(::isVodBinder)

internal fun isFollowingCardsBuilder(method: Method): Boolean = !AccessFlags.STATIC.isSet(method.accessFlags) &&
    method.parameterTypes.map { it.toString() } == listOf("Ljava/util/List;", "Z", "Ljava/util/Map;", "Ljava/util/Map;", "Ljava/util/Map;") &&
    method.returnType in setOf("Ljava/util/ArrayList;", "Ljava/util/List;") &&
    method.implementation?.instructions?.any {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Ltv/twitch/android/models/streams/StreamModelBase;" && ref.name == "getChannelId"
    } == true

/** Parameter order can change with R8 argument propagation, even when the behavior is unchanged. */
internal fun widthHook(method: Method): String {
    if (!AccessFlags.STATIC.isSet(method.accessFlags) || method.returnType != "V")
        throw PatchException("Layout: width helper must be static and void")
    val parameters = method.parameterTypes.map { it.toString() }
    val view = parameters.indexOf("Landroid/view/View;")
    val percent = parameters.indexOf("I")
    if (parameters.size != 2 || view < 0 || percent < 0)
        throw PatchException("Layout: width helper parameter contract changed")
    val registers = method.implementation?.registerCount ?: throw PatchException("Layout: width helper has no code")
    val target = "Lio/github/sabopura/morphe/extension/twitch/player/LayoutTools;->chatWidth(Landroid/view/View;I)I"
    val call = if (view == 0) "invoke-static/range {p0 .. p1}, $target"
        else if (registers <= 16) "invoke-static {p$view, p$percent}, $target"
        else throw PatchException("Layout: reordered width arguments exceed compact-call registers")
    return "$call\nmove-result p$percent"
}

/** Reasons Twitch's chat client logs when it refuses a join; only its join method writes all three. */
private val JOIN_REFUSALS = listOf("not_disconnected", "empty_channel_name", "null_or_empty_channel_name")

/**
 * Twitch asking its chat client to join a channel. The channel's connection key is also built when
 * a channel is left, for refused joins and when it is restored, so the key cannot tell which channel
 * chat moved to.
 */
internal fun channelJoinMethod(context: BytecodePatchContext): MutableMethod {
    fun refusesAll(method: Method) = method.implementation?.instructions
        ?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
        ?.toSet()?.containsAll(JOIN_REFUSALS) == true
    val owner = context.classesWithStrings(*JOIN_REFUSALS.toTypedArray()).uniqueContract("chat join")
    val join = owner.methods.filter(::refusesAll).uniqueContract("chat join method")
    return context.mutableClassDefBy(owner).methods.single {
        it.name == join.name && it.parameterTypes == join.parameterTypes && it.returnType == join.returnType
    }
}

/**
 * Smali for the join's entry that calls [target] with the channel ID (a Tuid, or an int on 30.7.2,
 * as an Object) and the channel name, before Twitch checks either. It only writes v0 and v1, at the
 * entry where no local holds a value yet; branches to the first instruction do not run it.
 */
internal fun channelJoinHook(method: Method, target: String): String {
    val code = method.implementation ?: throw PatchException("Chat: channel join has no code")
    val parameters = method.parameterTypes.map { it.toString() }
    val ids = parameters.withIndex().filter { it.value == "Ltv/twitch/android/models/Tuid;" || it.value == "I" }
    val name = parameters.indexOf("Ljava/lang/String;")
    if (AccessFlags.STATIC.isSet(method.accessFlags) || parameters.size != 3 || ids.size != 1 || name < 0 ||
        parameters.any { it == "J" || it == "D" } || code.registerCount - parameters.size - 1 < 2)
        throw PatchException("Chat: unsupported channel join")
    // The channel name is what Twitch null-checks first; the other String names the caller.
    val firstParameter = code.registerCount - parameters.size
    if ((code.instructions.firstOrNull { it.opcode == Opcode.IF_EQZ } as? OneRegisterInstruction)?.registerA != firstParameter + name)
        throw PatchException("Chat: channel join no longer checks the channel name first")
    val id = ids.single()
    val readId = if (id.value == "I") """
        move/from16 v1, p${id.index + 1}
        invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
        move-result-object v1
    """ else "move-object/from16 v1, p${id.index + 1}"
    return """
        move-object/from16 v0, p${name + 1}
        $readId
        invoke-static {v1, v0}, $target
    """
}

internal data class FollowingIndexHook(val index: Int, val listRegister: Int)

/** Match the completed-row iterator that builds section -> adapter-index, not another list loop. */
internal fun followingIndexLoop(method: Method, section: FieldReference): FollowingIndexHook? {
    val code = method.implementation?.instructions?.toList() ?: return null
    val read = code.indices.filter {
        code[it].opcode == Opcode.IGET_OBJECT && (code[it] as? ReferenceInstruction)?.reference == section
    }.singleOrNull() ?: return null
    val iterator = (0 until read).lastOrNull {
        (code[it] as? ReferenceInstruction)?.reference?.toString() ==
            "Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;"
    } ?: return null
    val span = code.subList(iterator + 1, read)
    if (span.none { (it as? ReferenceInstruction)?.reference?.toString() == "Ljava/util/Iterator;->next()Ljava/lang/Object;" } ||
        span.none { it.opcode == Opcode.INSTANCE_OF && (it as? ReferenceInstruction)?.reference?.toString() == section.definingClass }) return null
    // Exact adjacent valueOf/move-result/put sequence ties the section field to the index map.
    if (code.getOrNull(read + 1).let { (it as? ReferenceInstruction)?.reference?.toString() } != "Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;" ||
        code.getOrNull(read + 2)?.opcode != Opcode.MOVE_RESULT_OBJECT ||
        code.getOrNull(read + 3).let { (it as? ReferenceInstruction)?.reference?.toString() } != "Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;") return null
    val list = code[iterator].callRegisters().singleOrNull() ?: return null
    return FollowingIndexHook(iterator, list)
}
