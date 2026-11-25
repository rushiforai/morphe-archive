/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.commerce

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.names.addInstructions
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val STATUS_REPEAT = "$EMOJI_STATUS->statusRepeatType(I)I"
internal const val STATUS_IMAGE_RECEIVER = "Lorg/telegram/messenger/ImageReceiver;"
/** How many more times an image plays. ImageReceiver's setter writes it first thing. */
internal const val STATUS_AUTO_REPEAT = "$STATUS_IMAGE_RECEIVER->autoRepeatCount:I"
/** AnimatedEmojiDrawable's cache types for a status next to a name and one in a sheet. */
private val STATUS_CACHE_TYPES = listOf(7, 9)
/** What Telegram sets their play count to before they stop. */
private const val STATUS_PLAYS = 2

/**
 * AnimatedEmojiDrawable's play count method ([ladder]) and the register its cache type is read
 * into, or [missing], why this build can't have the switch. Nothing in the app changes until [apply].
 */
internal class MovingEmojiStatusPlan(
    private val ladder: MutableMethod?,
    private val type: Int,
    val missing: String?,
) {
    fun apply() {
        if (missing != null) return
        ladder!!.addInstructions(1, "invoke-static/range {v$type .. v$type}, $STATUS_REPEAT\n" +
            "move-result v$type")
    }
}

/**
 * AnimatedEmojiDrawable draws an emoji status, and one of its methods sets how many times the
 * status's image plays, from the cache type the drawable was made with: a status next to a name
 * (7) or in a sheet (9) plays twice and stops, like a topic icon (10). The method reads the cache
 * type first thing and weighs it against each type in turn, so EmojiStatus answers right
 * after that read. With the switch on, a status's type comes back as -1, which nothing matches:
 * the method returns without setting a count and the image keeps ImageReceiver's own, which loops.
 * Topic icons and every other type keep Telegram's count.
 */
internal fun BytecodePatchContext.resolveMovingEmojiStatus(): MovingEmojiStatusPlan {
    controlHook(EMOJI_STATUS, "statusRepeatType", listOf("I"), "I")
    requireStatusMethod("commerceMovingEmojiStatus")
    fun missing(why: String) = MovingEmojiStatusPlan(null, 0, why)

    val receiver = tgClassDefByOrNull(STATUS_IMAGE_RECEIVER) ?: return missing("ImageReceiver is gone")
    val setters = receiver.methods.filter { it.setsPlayCount() }
    val setter = setters.singleOrNull() ?: return missing("ImageReceiver no longer sets how many times an image plays in one place")
    val query = Mention.type(STATUS_IMAGE_RECEIVER) and Mention.allOf(STATUS_CACHE_TYPES.map { Mention.literal(it) })
    val ladders = classDefsMentioning(query).filter { classDef ->
        classDef.methods.any { it.weighsCacheType(setter) }
    }.flatMap { classDef -> tgMutableClassDefBy(classDef).methods.filter { it.weighsCacheType(setter) } }
    val ladder = ladders.singleOrNull() ?: return missing(
        if (ladders.isEmpty()) "AnimatedEmojiDrawable no longer sets a status's play count by its cache type"
        else "${ladders.size} places set an emoji status's play count by its cache type")
    val body = ladder.controlBody()
    if (body.getOrNull(1)?.controlRef() == STATUS_REPEAT) return missing("emoji statuses already keep moving")
    if (STATUS_CACHE_TYPES.any { ladder.playsFor(it, setter) != STATUS_PLAYS }) return missing("an emoji status no longer plays twice")
    val flow = ControlFlow.of(ladder)
    if (body.indices.any { at -> at != 0 && (1 in flow.normal[at] || 1 in flow.exceptional[at]) }) {
        return missing("${ladder.definingClass}->${ladder.name} jumps onto its cache type read")
    }
    val type = (body[0] as TwoRegisterInstruction).registerA
    // move-result takes a register up to v255.
    if (type > 255) return missing("AnimatedEmojiDrawable keeps its cache type in a register past v255")
    return MovingEmojiStatusPlan(ladder, type, null)
}

/** ImageReceiver's setAutoRepeatCount: an instance (I)V method whose first act is writing its count into autoRepeatCount. */
private fun Method.setsPlayCount(): Boolean {
    if (returnType != "V" || parameterTypes.map(CharSequence::toString) != listOf("I") || AccessFlags.STATIC.isSet(accessFlags)) return false
    val first = controlBody().firstOrNull() ?: return false
    val registers = implementation!!.registerCount
    return first.opcode == Opcode.IPUT && first.controlRef() == STATUS_AUTO_REPEAT &&
        (first as TwoRegisterInstruction).registerA == registers - 1 && first.registerB == registers - 2
}

/**
 * Takes an ImageReceiver, reads an int field of its own class first and calls [setter] on the
 * ImageReceiver: the shape of AnimatedEmojiDrawable's updateAutoRepeat.
 */
private fun Method.weighsCacheType(setter: Method): Boolean {
    if (returnType != "V" || parameterTypes.map(CharSequence::toString) != listOf(setter.definingClass) ||
        AccessFlags.STATIC.isSet(accessFlags)) return false
    val body = controlBody()
    val read = body.firstOrNull() ?: return false
    val field = (read as? ReferenceInstruction)?.reference as? FieldReference ?: return false
    return read.opcode == Opcode.IGET && field.definingClass == definingClass && field.type == "I" &&
        (read as TwoRegisterInstruction).registerB == implementation!!.registerCount - 2 && body.any { it.calls(setter) }
}

/**
 * The count the method hands [setter] for cache [type]: follows its comparisons from just after
 * the read, with the read's register holding [type], to a constant loaded for the setter's call
 * on the ImageReceiver and the return right after. Null for anything else on the way.
 */
private fun Method.playsFor(type: Int, setter: Method): Int? {
    val body = controlBody()
    val flow = ControlFlow.of(this)
    val receiver = implementation!!.registerCount - 1
    val values = mutableMapOf((body[0] as TwoRegisterInstruction).registerA to type)
    var at = 1
    repeat(body.size) {
        val instruction = body.getOrNull(at) ?: return null
        when (instruction.opcode) {
            Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST -> {
                values[(instruction as OneRegisterInstruction).registerA] = (instruction as NarrowLiteralInstruction).narrowLiteral
                at++
            }
            Opcode.IF_EQ, Opcode.IF_NE -> {
                val pair = instruction as TwoRegisterInstruction
                val first = values[pair.registerA] ?: return null
                val second = values[pair.registerB] ?: return null
                val taken = (first == second) == (instruction.opcode == Opcode.IF_EQ)
                at = if (taken) flow.normal[at].singleOrNull { it != at + 1 } ?: (at + 1) else at + 1
            }
            Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32 -> at = flow.normal[at].single()
            Opcode.INVOKE_VIRTUAL -> {
                val call = instruction as FiveRegisterInstruction
                if (!instruction.calls(setter) || call.registerCount != 2 || call.registerC != receiver) return null
                return values[call.registerD].takeIf { body.getOrNull(at + 1)?.opcode == Opcode.RETURN_VOID }
            }
            else -> return null
        }
    }
    return null
}

private fun Instruction.calls(setter: Method): Boolean {
    val called = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return opcode == Opcode.INVOKE_VIRTUAL && called.definingClass == setter.definingClass && called.name == setter.name &&
        called.parameterTypes.map(CharSequence::toString) == listOf("I") && called.returnType == "V"
}
