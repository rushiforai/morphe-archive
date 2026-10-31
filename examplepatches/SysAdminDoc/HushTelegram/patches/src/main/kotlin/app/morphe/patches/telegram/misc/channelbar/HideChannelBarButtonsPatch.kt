/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.channelbar

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.requireParameterIntact
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

private const val PATCH = "Hide channel bar buttons"
internal const val CHANNEL_BUTTONS = "$EXTENSION_PACKAGE/misc/ChannelButtons;"
private const val STRINGS = "Lorg/telegram/messenger/R\$string;->"
// The side buttons this hides, by the label each one is read out with: Search, Direct messages and
// Info. Gift, the fourth, is Hide Premium, gifts and Stars'.
internal val SIDE_LABELS = listOf("Search", "ChannelOpenDirect", "BroadcastGroupInfo").map { "$STRINGS$it:I" }
private const val GIFT_LABEL = "${STRINGS}ProfileActionsGift:I"
// The chat screen's bar update is the one place that also labels the middle button Mute. The
// channel's Recent actions log builds the same bar for a Search of its own and never reads it.
internal const val MUTE_LABEL = "${STRINGS}ChannelMuteNoCaps:I"
internal const val SET_BUTTON = "$CHANNEL_BUTTONS->set(Ljava/lang/Object;IZZ)V"
private val CONSTANTS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16)
private val MOVES = setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16)

@Suppress("unused")
val hideChannelBarButtonsPatch = bytecodePatch(
    name = PATCH,
    description = "Removes the Search, Direct messages and Info buttons from the bar at the bottom of a channel. Mute " +
        "and Join stay. Starts off. Turn it on in HushTelegram settings > Look and feel.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val plan = resolveChannelBarButtons()
        val mute = resolveChannelMute(plan)
        val share = resolveChannelShare()
        // Assembled on copies first, so a refusal leaves the app untouched.
        mute.rehearse()
        writeStub(CHANNEL_BUTTONS, "sideButtons", 1, "const/16 v0, ${plan.mask}\nreturn v0")
        writeStub(CHANNEL_BUTTONS, "place", 4, """
            check-cast p0, ${plan.bar}
            invoke-virtual {p0, p1, p2, p3}, ${plan.place}
            return-void
        """)
        plan.calls.sortedDescending().forEach { at -> plan.update.replaceInstruction(at, setCall(plan.update.controlBody()[at])) }
        enableStatus("hideChannelButtons")
        if (mute.missing == null) {
            mute.apply()
            enableCapability("hideChannelMute")
        } else {
            patchLog.warning("$PATCH: ${mute.missing}. The patch goes on without the Mute switch.")
        }
        if (share.missing == null) {
            share.apply()
            enableCapability("hideChannelShare")
        } else {
            patchLog.warning("$PATCH: ${share.missing}. The patch goes on without the share button switch.")
        }
    }
}

/**
 * The bar's button placer ([place], defined on [bar]), the chat screen's bar [update] and the
 * places in it that call the placer, and which button numbers ([mask], one bit each) are the side
 * buttons this hides.
 */
internal data class ChannelBarPlan(val bar: String, val place: String, val update: MutableMethod, val calls: List<Int>, val mask: Int)

/** The placer call, the same operands in the same order, handed to the extension instead. */
private fun setCall(call: Instruction): String {
    val registers = call.namedRegisters()
    return if (call is RegisterRangeInstruction) "invoke-static/range {v${registers.first()} .. v${registers.last()}}, $SET_BUTTON"
    else "invoke-static {${registers.joinToString { "v$it" }}}, $SET_BUTTON"
}

/**
 * A channel's bottom bar places each side button with one method taking the button's number,
 * whether to show it and whether to animate. The first time it shows a button it builds it and
 * reads its label out by the number, so the labels give each side button's number.
 */
internal fun BytecodePatchContext.resolveChannelBarButtons(): ChannelBarPlan {
    requireStatusMethod("hideChannelButtons")
    controlHook(CHANNEL_BUTTONS, "set", listOf("Ljava/lang/Object;", "I", "Z", "Z"), "V")
    controlHook(CHANNEL_BUTTONS, "place", listOf("Ljava/lang/Object;", "I", "Z", "Z"), "V")
    controlHook(CHANNEL_BUTTONS, "sideButtons", emptyList(), "I")

    val placers = mutableListOf<Method>()
    forEachClassMentioning(Mention.allReferences(SIDE_LABELS + GIFT_LABEL)) { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.filterTo(placers) { m ->
            !AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" &&
                m.parameterTypes.map { it.toString() } == listOf("I", "Z", "Z") &&
                m.controlBody().let { body -> (SIDE_LABELS + GIFT_LABEL).all { label -> body.any { it.controlRef() == label } } }
        }
    }
    shape(placers.size == 1, "the channel bar's button placer is missing or ambiguous (${placers.size})")
    val placer = placers.single()
    val place = "${placer.definingClass}->${placer.name}(IZZ)V"
    val numbers = SIDE_LABELS.map { label -> buttonNumber(placer, label) }
    shape(numbers.distinct().size == numbers.size && numbers.all { it in 0..14 } &&
        buttonNumber(placer, GIFT_LABEL) !in numbers, "the channel bar's side buttons no longer have numbers of their own")

    val updates = mutableListOf<Pair<String, Method>>()
    forEachClassMentioning(Mention.reference(MUTE_LABEL) and Mention.reference(place)) { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.filter { m ->
            m.controlBody().let { body -> body.any { it.controlRef() == MUTE_LABEL } && body.any { it.controlRef() == place } }
        }.forEach { updates += cls.type to it }
    }
    shape(updates.size == 1, "the chat screen's channel bar update is missing or ambiguous (${updates.size})")
    val (type, found) = updates.single()
    val update = mutableClassDefBy(type).methods.single { signature(it) == signature(found) }
    val body = update.controlBody()
    val calls = body.indices.filter { body[it].controlRef() == place }
    shape(calls.all { body[it].opcode in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE) && body[it].namedRegisters().size == 4 },
        "the chat screen no longer places channel bar buttons with a plain call")
    // Each side button is placed there by its own number, so the calls this takes over are the bar's.
    val placed = calls.mapNotNull { constantBefore(body, it, body[it].namedRegisters()[1]) }.toSet()
    shape(placed.containsAll(numbers), "the chat screen no longer places Search, Direct messages and Info")
    return ChannelBarPlan(placer.definingClass, place, update, calls, numbers.sumOf { 1 shl it })
}

/** The number the placer compares its button with right before reading out [label]. */
private fun buttonNumber(placer: Method, label: String): Int {
    val body = placer.controlBody()
    val reads = body.indices.filter { body[it].controlRef() == label }
    shape(reads.size == 1, "the channel bar labels $label more than once")
    val compare = body.getOrNull(reads.single() - 1)
    val button = placer.parameterRegisterNumber(0)
    val operands = compare?.namedRegisters().orEmpty()
    try {
        placer.requireParameterIntact(PATCH, 0, listOf(reads.single() - 1))
    } catch (overwritten: PatchException) {
        shape(false, "the channel bar's button number is overwritten before $label")
    }
    return when {
        compare?.opcode == Opcode.IF_NEZ && operands == listOf(button) -> 0
        compare?.opcode == Opcode.IF_NE && operands.count { it == button } == 1 ->
            constantBefore(body, reads.single() - 1, operands.single { it != button })
                ?: throw PatchException("$PATCH: the channel bar compares $label's button with no number (before editing)")
        else -> throw PatchException("$PATCH: the channel bar no longer labels $label by its button number (before editing)")
    }
}

/** The constant [register] last got before [before], in code order, through plain copies. */
private fun constantBefore(body: List<Instruction>, before: Int, register: Int, copies: Int = 4): Int? {
    val write = (0 until before).lastOrNull { body[it].writes(register) } ?: return null
    return when (body[write].opcode) {
        in CONSTANTS -> (body[write] as? NarrowLiteralInstruction)?.narrowLiteral
        in MOVES -> if (copies == 0) null else constantBefore(body, write, body[write].namedRegisters()[1], copies - 1)
        else -> null
    }
}

private fun signature(m: Method) = "${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"

internal fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val destination = namedRegisters().firstOrNull() ?: return false
    return destination == register || opcode.setsWideRegister() && destination + 1 == register
}

private fun shape(ok: Boolean, what: String) {
    if (!ok) throw PatchException("$PATCH: $what (before editing)")
}
