/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.stickers

import app.morphe.util.names.origDescriptor
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.loadsInt
import app.morphe.util.names.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

internal const val STICKER_SIZE = "$EXTENSION_PACKAGE/misc/StickerSize;"
internal const val SIZE_HOOK = "$STICKER_SIZE->size(Ljava/lang/Object;F)F"
private const val UTILITIES = "Lorg/telegram/messenger/AndroidUtilities;"
private const val CONTENT_LABEL = "Lorg/telegram/messenger/R\$string;->SponsoredMessageAdWhatIsThis:I"
private const val GROUPED = "Lorg/telegram/messenger/MessageObject\$GroupedMessages;"

/** 0.5f and 0.4f: a sticker's largest side as a share of the screen, on a phone and on a tablet. */
private const val PHONE_SHARE = 0x3f000000
private const val TABLET_SHARE = 0x3ecccccd

/** How far before the size the animated-emoji test sits, and how soon after it the emoji and dice tests come. */
private const val BEFORE = 40
private const val AFTER = 16

@Suppress("unused")
val stickerSizePatch = bytecodePatch(
    name = "Change sticker size",
    description = "Shows stickers in chats smaller or larger than Telegram does, at a size you pick. Animated emoji " +
        "and dice keep their size. Starts off. Turn it on in HushTelegram settings > Look and feel.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val plan = resolveStickerSize()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        insertStickerSize(MutableMethod(ImmutableMethod.of(plan.method)), plan)
        writeStub(STICKER_SIZE, "emoji", 2, """
            check-cast p0, $MESSAGE_OBJECT
            invoke-virtual {p0}, $MESSAGE_OBJECT->isAnimatedEmoji()Z
            move-result v0
            if-nez v0, :hush_emoji
            invoke-virtual {p0}, $MESSAGE_OBJECT->isDice()Z
            move-result v0
            :hush_emoji
            return v0
        """)
        insertStickerSize(plan.method, plan)
        enableStatus("stickerSize")
    }
}

/** Where a bubble works out a sticker's largest side: the method, the multiply, and its two registers. */
internal data class StickerSizePlan(val method: MutableMethod, val multiply: Int, val size: Int, val message: Int)

/** Right after the share is applied, the extension may change the size both sides are then fitted into. */
internal fun insertStickerSize(target: MutableMethod, plan: StickerSizePlan) {
    target.addInstructions(plan.multiply + 1, """
        invoke-static {v${plan.message}, v${plan.size}}, $SIZE_HOOK
        move-result v${plan.size}
    """)
}

/**
 * A bubble sizes a sticker in its content setter: the side of the smaller of its width and the
 * screen's height times 0.5 on a phone, or the tablet's shorter side times 0.4, both through one
 * multiply. The sticker's own width and height are then fitted into that square. The same method
 * works out another size the same way for a different layout, so the branch is the one that
 * checks for an animated emoji and a dice just after, the two kinds whose size Telegram sets apart
 * from a sticker's, and for an animated animated emoji just before.
 */
internal fun BytecodePatchContext.resolveStickerSize(): StickerSizePlan {
    requireStatusMethod("stickerSize")
    controlHook(STICKER_SIZE, "size", listOf("Ljava/lang/Object;", "F"), "F")
    controlHook(STICKER_SIZE, "emoji", listOf("Ljava/lang/Object;"), "Z")

    val setters = mutableListOf<Pair<String, String>>()
    forEachClassMentioning(Mention.reference(CONTENT_LABEL)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.filter { m ->
            m.origParameterTypes == listOf(MESSAGE_OBJECT, GROUPED, "Z", "Z", "Z", "Z") && m.origReturnType == "V" &&
                m.controlBody().any { it.loadsInt() && it.controlRef() == CONTENT_LABEL }
        }.forEach { setters += cls.type to signature(it) }
    }
    val (type, wanted) = setters.controlSingle("a message bubble's content setter")
    val method = tgMutableClassDefBy(type).methods.single { signature(it) == wanted }
    val body = method.controlBody()
    val flow = ControlFlow.of(method)

    val multiplies = body.indices.filter { at -> shareMultiply(body, flow, at) && emojiTests(body, at) != null }
    val multiply = multiplies.controlSingle("the sticker's size share")
    val (size, share) = body[multiply].namedRegisters()
    val message = emojiTests(body, multiply)!!
    controlShape(size != share && size <= 15 && message <= 15 && message != size,
        "a sticker's size can't be passed to the extension as it is")
    // The message is the same one the bubble asks about before the size and after it, on the phone's
    // path and the tablet's: both reach the multiply from inside the stretch checked for writes (the
    // tablet's block sits just after the size and jumps back to it).
    val before = body.subList(maxOf(0, multiply - BEFORE), multiply)
    controlShape(before.any { it.controlRef() == "$MESSAGE_OBJECT->isAnimatedAnimatedEmoji()Z" && it.namedRegisters() == listOf(message) } &&
        (multiply - BEFORE until multiply + AFTER).none { it in body.indices && it != multiply && writes(body[it], message) } &&
        flow.normal.indices.filter { multiply in flow.normal[it] }.all { it in multiply - BEFORE until multiply + AFTER },
        "the sticker's message isn't the one the bubble sizes")
    controlShape(flow.normal.indices.filter { multiply + 1 in flow.normal[it] } == listOf(multiply),
        "something jumps into a sticker's size")
    controlShape(body[multiply + 1].opcode == Opcode.FLOAT_TO_INT && body[multiply + 1].namedRegisters().last() == size,
        "a sticker's size is no longer rounded right after its share")
    return StickerSizePlan(method, multiply, size, message)
}

/**
 * `mul-float/2addr size, share` right after the phone's 0.5 is loaded into share, and the jump
 * target of the tablet's path, which loads 0.4 into the same register after asking for the
 * tablet's shorter side.
 */
private fun shareMultiply(body: List<Instruction>, flow: ControlFlow, at: Int): Boolean {
    if (body[at].opcode != Opcode.MUL_FLOAT_2ADDR || at == 0) return false
    val (_, share) = body[at].namedRegisters()
    val phone = body[at - 1]
    if (phone.opcode != Opcode.CONST_HIGH16 || (phone as NarrowLiteralInstruction).narrowLiteral != PHONE_SHARE ||
        phone.namedRegisters() != listOf(share)) return false
    val jumps = flow.normal.indices.filter { it != at - 1 && at in flow.normal[it] }
    if (jumps.size != 1) return false
    val tablet = jumps.single()
    val loads = body.subList(maxOf(0, tablet - 4), tablet + 1)
    return loads.any { it.opcode == Opcode.CONST && (it as NarrowLiteralInstruction).narrowLiteral == TABLET_SHARE && it.namedRegisters() == listOf(share) } &&
        loads.any { it.controlRef() == "$UTILITIES->getMinTabletSide()I" }
}

/** The message register the animated emoji and dice tests right after [at] both ask about, or null. */
private fun emojiTests(body: List<Instruction>, at: Int): Int? {
    val after = body.subList(at, minOf(body.size, at + AFTER))
    val message = after.firstOrNull { it.controlRef() == "$MESSAGE_OBJECT->isAnimatedEmoji()Z" }?.namedRegisters()?.singleOrNull()
        ?: return null
    return message.takeIf { after.any { it.controlRef() == "$MESSAGE_OBJECT->isDice()Z" && it.namedRegisters() == listOf(message) } }
}

/** Whether an instruction writes [register], alone or as the second half of a wide pair. */
private fun writes(instruction: Instruction, register: Int): Boolean {
    val first = instruction.namedRegisters().firstOrNull() ?: return false
    return instruction.opcode.setsRegister() && first == register ||
        instruction.opcode.setsWideRegister() && first == register - 1
}

private fun signature(m: Method) = "${m.origName}${m.origDescriptor}"
