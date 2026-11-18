/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.channelbar

import app.morphe.util.names.addInstruction
import app.morphe.util.names.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val CHANNEL_MUTE = "$EXTENSION_PACKAGE/misc/ChannelMute;"
internal const val MUTE_BEGIN = "$CHANNEL_MUTE->begin()V"
internal const val MUTE_LABELLED = "$CHANNEL_MUTE->muteLabelled()V"
internal const val MUTE_FINISH = "$CHANNEL_MUTE->finish(Ljava/lang/Object;)V"
internal const val MUTE_VISIBILITY = "$CHANNEL_MUTE->visibility(Ljava/lang/Object;I)I"
internal const val MUTE_BUBBLE = "$CHANNEL_MUTE->bubble(Ljava/lang/Object;I)Z"
private const val DRAWABLE_DRAW = "Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V"
private const val UNMUTE_LABEL = "Lorg/telegram/messenger/R\$string;->ChannelUnmuteNoCaps:I"
private const val NOT_IN_CHAT = "Lorg/telegram/messenger/ChatObject;->isNotInChat(Lorg/telegram/tgnet/TLRPC\$Chat;)Z"
private const val REPLY_USER = "Lorg/telegram/messenger/UserObject;->isReplyUser(Lorg/telegram/tgnet/TLRPC\$User;)Z"
/** How far after a label's read the button's text is set, in instructions. */
private const val LABEL_WINDOW = 5
/** How far after isNotInChat's answer the update tests it, in instructions. */
private const val TEST_WINDOW = 4

/**
 * What the Mute switch needs from the chat screen's bar update, or [missing], why this build can't
 * have the switch. [labelled] are the places right after the update names the middle button Mute or
 * Unmute for a joined channel, [finishAt] the place after its last button is set, and [bar] the
 * register holding the bar there. [visibility] is the bar's own setVisibility, and [bubble] where
 * the view holding the bar decides to draw the rounded bubble behind it.
 */
internal class ChannelMuteBar(
    private val update: MutableMethod?,
    private val visibility: MutableMethod?,
    private val bubble: MuteBubble?,
    private val labelled: List<Int>,
    private val finishAt: Int,
    private val bar: Int,
    val missing: String?,
) {
    /** The same edit on copies, so a smali problem refuses before the app is touched. */
    fun rehearse() {
        if (update != null && visibility != null && bubble != null) {
            swap(MutableMethod(ImmutableMethod.of(update)), MutableMethod(ImmutableMethod.of(visibility)),
                MutableMethod(ImmutableMethod.of(bubble.draw)))
        }
    }

    fun apply() {
        if (update != null && visibility != null && bubble != null) swap(update, visibility, bubble.draw)
    }

    /** Each insert goes in from the highest original index down, so none moves the next. */
    private fun swap(update: MutableMethod, visibility: MutableMethod, draw: MutableMethod) {
        val barCall = if (bar <= 15) "invoke-static {v$bar}, $MUTE_FINISH" else "invoke-static/range {v$bar .. v$bar}, $MUTE_FINISH"
        update.addInstruction(finishAt, barCall)
        labelled.sortedDescending().forEach { update.addInstruction(it, "invoke-static {}, $MUTE_LABELLED") }
        update.addInstruction(0, "invoke-static {}, $MUTE_BEGIN")
        visibility.addInstructions(0, "invoke-static/range {p0 .. p1}, $MUTE_VISIBILITY\nmove-result p1")
        val flag = bubble!!.flag
        draw.addInstructions(bubble.at, "invoke-static {v${bubble.self}, v$flag}, $MUTE_BUBBLE\nmove-result v$flag")
    }
}

/** Whether [call] draws the drawable in [field]: as a Drawable, or (13.2) as the field's own class. */
internal fun drawsBubble(call: Instruction, field: FieldReference): Boolean {
    if (call.controlRef() == DRAWABLE_DRAW) return true
    val ref = (call as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return call.opcode == Opcode.INVOKE_VIRTUAL && ref.definingClass == field.type && ref.name == "draw" &&
        ref.parameterTypes.map { it.toString() } == listOf("Landroid/graphics/Canvas;") && ref.returnType == "V"
}

/** In [draw], the bubble's show flag sits in register [flag] from just before [at], and `this` in [self]. */
internal class MuteBubble(val draw: MutableMethod, val at: Int, val flag: Int, val self: Int)

/**
 * Telegram 13 draws a rounded bubble behind the bar at the bottom of a chat, from the view that
 * holds the bar. Its draw reads a flag, and if it's set draws the bubble's drawable, the one its
 * setInputBubbleAlpha fades. With the bar taken off the bubble would stay as an empty pill.
 */
private fun BytecodePatchContext.resolveMuteBubble(): MuteBubble? {
    var holder: String? = null
    classDefForEach { cls ->
        if (holder == null && cls.methods.any { it.origName == "getInputIslandBubbleContainer" && it.parameterTypes.isEmpty() }) holder = cls.type
    }
    val cls = holder?.let { tgMutableClassDefByOrNull(it) } ?: return null
    val faded = cls.methods.singleOrNull { it.origName == "setInputBubbleAlpha" && it.parameterTypes.map { p -> p.toString() } == listOf("I") }
        ?.controlBody()?.firstOrNull { it.opcode == Opcode.IGET_OBJECT }?.controlField() ?: return null
    val draw = cls.methods.singleOrNull {
        it.origName == "dispatchDraw" && it.parameterTypes.map { p -> p.toString() } == listOf("Landroid/graphics/Canvas;") && it.implementation != null
    } ?: return null
    val body = draw.controlBody()
    val read = body.indices.singleOrNull {
        body[it].opcode == Opcode.IGET_OBJECT && body[it].controlField() == faded && body.getOrNull(it + 1)?.let { next -> drawsBubble(next, faded) } == true
    } ?: return null
    if (read < 2 || body[read - 1].opcode != Opcode.IF_EQZ || body[read - 2].opcode != Opcode.IGET_BOOLEAN) return null
    val flag = body[read - 1].namedRegisters().single()
    val self = draw.implementation!!.registerCount - 2
    val flagRead = body[read - 2].namedRegisters()
    if (flagRead != listOf(flag, self) || flag > 15 || self > 15) return null
    return MuteBubble(draw, read - 1, flag, self)
}

/**
 * The chat screen's bar update names the middle button Mute or Unmute in several places: for a
 * joined channel, and for the user chats and bots that borrow the bar. A joined channel's are the
 * two that come after the update asks whether the chat is one you're not in and before it asks
 * about a reply user, on the side of that question a chat you're in takes: every path to them goes
 * through where the answer sends such a chat. Plus Messenger asks the same question once more near
 * the top of the update, to decide on a linked-chat button of its own, and both sides of that one
 * meet again long before the user chats' Mute and Unmute that follow it, so those stay out. The
 * update ends by setting its last button on the bar, which is the place to decide, and the bar's
 * own setVisibility keeps Telegram's other code from showing it again.
 */
internal fun BytecodePatchContext.resolveChannelMute(plan: ChannelBarPlan): ChannelMuteBar {
    controlHook(CHANNEL_MUTE, "begin", emptyList(), "V")
    controlHook(CHANNEL_MUTE, "muteLabelled", emptyList(), "V")
    controlHook(CHANNEL_MUTE, "finish", listOf("Ljava/lang/Object;"), "V")
    controlHook(CHANNEL_MUTE, "visibility", listOf("Ljava/lang/Object;", "I"), "I")
    controlHook(CHANNEL_MUTE, "bubble", listOf("Ljava/lang/Object;", "I"), "Z")
    requireStatusMethod("hideChannelMute")
    fun missing(why: String) = ChannelMuteBar(null, null, null, emptyList(), 0, 0, why)

    val body = plan.update.controlBody()
    val flow = ControlFlow.of(plan.update)
    val owners = body.indices.filter { body[it].controlRef() == NOT_IN_CHAT || body[it].controlRef() == REPLY_USER }
    val joined = labelUses(flow, body).filter { (at, _) ->
        val owner = owners.lastOrNull { it < at }
        owner != null && body[owner].controlRef() == NOT_IN_CHAT && inChatBranch(flow, owner)?.let { flow.onEveryPath(it, at) } == true
    }
    if (joined.size != 2 || joined.map { it.second }.toSet() != setOf(MUTE_LABEL, UNMUTE_LABEL)) {
        return missing("the chat screen no longer names a joined channel's button Mute and Unmute in one place each (${joined.size})")
    }
    val after = joined.map { it.first }.map { at ->
        val set = (at + 1 until minOf(body.size, at + LABEL_WINDOW)).firstOrNull {
            body[it].opcode == Opcode.INVOKE_VIRTUAL && body[it].controlRef()?.endsWith("(Ljava/lang/String;Z)V") == true
        } ?: return missing("the chat screen no longer sets the Mute button's text with a plain call")
        set + 1
    }

    val last = plan.calls.max()
    if (last + 1 >= body.size) return missing("the chat screen ends right after placing its last button")
    val bar = body[last].namedRegisters().first()
    val reads = (0 until last).lastOrNull { body[it].writes(bar) }
    val field = reads?.takeIf { body[it].opcode == Opcode.IGET_OBJECT }?.let { body[it].controlField() }
        ?: return missing("the chat screen no longer reads its bar from a field before placing the last button")
    val setVisibility = tgMutableClassDefByOrNull(field.type)?.methods?.singleOrNull {
        it.origName == "setVisibility" && it.parameterTypes.map { p -> p.toString() } == listOf("I") && it.origReturnType == "V" &&
            !AccessFlags.STATIC.isSet(it.accessFlags) && !AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.implementation != null
    } ?: return missing("the bar no longer has a setVisibility of its own")
    val bubble = resolveMuteBubble() ?: return missing("the chat screen no longer draws the bubble behind its bar in a way the switch can skip")
    return ChannelMuteBar(plan.update, setVisibility, bubble, after, last + 1, bar, null)
}

/**
 * Where the update goes from the isNotInChat call at [call] for a chat you're in: the side of the
 * test on its answer that a no takes. Null unless the answer is tested within [TEST_WINDOW] plain
 * instructions of the call (13.2 tests it at once, Plus Messenger's own ask clears a register first).
 */
private fun inChatBranch(flow: ControlFlow, call: Int): Int? {
    val body = flow.instructions
    if (body.getOrNull(call + 1)?.opcode != Opcode.MOVE_RESULT) return null
    val answer = body[call + 1].namedRegisters().single()
    for (i in call + 2 until minOf(body.size, call + 2 + TEST_WINDOW)) {
        val test = body[i]
        if ((test.opcode == Opcode.IF_EQZ || test.opcode == Opcode.IF_NEZ) && test.namedRegisters() == listOf(answer)) {
            val taken = flow.normal[i].singleOrNull { it != i + 1 } ?: return null
            return if (test.opcode == Opcode.IF_EQZ) taken else i + 1
        }
        if (answer in test.namedRegisters() || flow.normal[i] != listOf(i + 1)) return null
    }
    return null
}

/**
 * Whether every path from the start of the method to [at] goes through [through]. 13.2 sends a
 * joined channel's branch two ways (its isNotInChat's no, and the yes side's next test failing), so
 * this asks about the place both land on, not one jump.
 */
private fun ControlFlow.onEveryPath(through: Int, at: Int): Boolean {
    if (through == at || through == 0) return true
    val seen = BooleanArray(instructions.size).also { it[0] = true }
    val pending = ArrayDeque(listOf(0))
    while (pending.isNotEmpty()) {
        val i = pending.removeFirst()
        if (i == at) return false
        for (next in normal[i] + exceptional[i]) {
            if (next != through && !seen[next]) {
                seen[next] = true
                pending += next
            }
        }
    }
    return true
}

/**
 * Each call in [flow]'s method that is handed the Mute or Unmute label, with that label. 13.1.1 reads a label
 * just before each use; 13.2 loads both once at the top of the update and passes the registers on, so
 * a call counts when every path to it leaves one label, and only that label, in a register it reads.
 */
private fun labelUses(flow: ControlFlow, body: List<Instruction>): List<Pair<Int, String>> {
    val labels = setOf(MUTE_LABEL, UNMUTE_LABEL)
    if (body.none { it.controlRef() in labels }) return emptyList()
    val predecessors = Array(body.size) { mutableSetOf<Int>() }
    for (i in body.indices) for (next in flow.normal[i] + flow.exceptional[i]) predecessors[next] += i
    fun writes(i: Int, register: Int): Boolean {
        val written = (body[i] as? OneRegisterInstruction)?.registerA ?: return false
        return body[i].opcode.setsRegister() && (written == register || body[i].opcode.setsWideRegister() && written + 1 == register)
    }
    /** The label every definition of [register] reaching [at] loads, or null if any path leaves something else or nothing. */
    fun label(register: Int, at: Int): String? {
        val pending = ArrayDeque(predecessors[at])
        val seen = HashSet<Int>()
        val found = HashSet<String?>()
        if (pending.isEmpty()) return null
        while (pending.isNotEmpty()) {
            val i = pending.removeFirst()
            if (!seen.add(i)) continue
            if (writes(i, register)) found += body[i].controlRef()?.takeIf { it in labels }
            else if (i == 0 || predecessors[i].isEmpty()) return null
            else pending.addAll(predecessors[i])
        }
        return found.singleOrNull()
    }
    return body.indices.mapNotNull { at ->
        if ((body[at] as? ReferenceInstruction)?.reference !is MethodReference) return@mapNotNull null
        body[at].namedRegisters().distinct().firstNotNullOfOrNull { label(it, at) }?.let { at to it }
    }
}
