/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.channelbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

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
        if (holder == null && cls.methods.any { it.name == "getInputIslandBubbleContainer" && it.parameterTypes.isEmpty() }) holder = cls.type
    }
    val cls = holder?.let { mutableClassDefByOrNull(it) } ?: return null
    val faded = cls.methods.singleOrNull { it.name == "setInputBubbleAlpha" && it.parameterTypes.map { p -> p.toString() } == listOf("I") }
        ?.controlBody()?.firstOrNull { it.opcode == Opcode.IGET_OBJECT }?.controlField() ?: return null
    val draw = cls.methods.singleOrNull {
        it.name == "dispatchDraw" && it.parameterTypes.map { p -> p.toString() } == listOf("Landroid/graphics/Canvas;") && it.implementation != null
    } ?: return null
    val body = draw.controlBody()
    val read = body.indices.singleOrNull {
        body[it].opcode == Opcode.IGET_OBJECT && body[it].controlField() == faded && body.getOrNull(it + 1)?.controlRef() == DRAWABLE_DRAW
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
 * about a reply user. The update ends by setting its last button on the bar, which is the place to
 * decide, and the bar's own setVisibility keeps Telegram's other code from showing it again.
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
    val owners = body.indices.filter { body[it].controlRef() == NOT_IN_CHAT || body[it].controlRef() == REPLY_USER }
    val joined = body.indices.filter { body[it].controlRef() == MUTE_LABEL || body[it].controlRef() == UNMUTE_LABEL }.filter { at ->
        owners.lastOrNull { it < at }?.let { body[it].controlRef() == NOT_IN_CHAT } == true
    }
    if (joined.size != 2 || joined.mapNotNull { body[it].controlRef() }.toSet() != setOf(MUTE_LABEL, UNMUTE_LABEL)) {
        return missing("the chat screen no longer names a joined channel's button Mute and Unmute in one place each (${joined.size})")
    }
    val after = joined.map { at ->
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
    val setVisibility = mutableClassDefByOrNull(field.type)?.methods?.singleOrNull {
        it.name == "setVisibility" && it.parameterTypes.map { p -> p.toString() } == listOf("I") && it.returnType == "V" &&
            !AccessFlags.STATIC.isSet(it.accessFlags) && !AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.implementation != null
    } ?: return missing("the bar no longer has a setVisibility of its own")
    val bubble = resolveMuteBubble() ?: return missing("the chat screen no longer draws the bubble behind its bar in a way the switch can skip")
    return ChannelMuteBar(plan.update, setVisibility, bubble, after, last + 1, bar, null)
}
