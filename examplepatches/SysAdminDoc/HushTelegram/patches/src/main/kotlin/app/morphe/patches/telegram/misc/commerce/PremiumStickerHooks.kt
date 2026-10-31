/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.commerce

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val PATCH = "Hide Premium, gifts and Stars"
internal const val STICKER_CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
internal const val PREMIUM_BLOCKED = "$STICKER_CONTROLLER->premiumFeaturesBlocked()Z"
internal const val PREMIUM_DOCUMENT = "Lorg/telegram/messenger/MessageObject;->isPremiumSticker(Lorg/telegram/tgnet/TLRPC\$Document;)Z"
internal const val PREMIUM_MESSAGE = "Lorg/telegram/messenger/MessageObject;->isPremiumSticker()Z"
internal const val STICKER_TOOLTIP = "Lorg/telegram/messenger/R\$string;->PremiumStickerTooltip:I"
internal const val TAP_HINT = "Lorg/telegram/messenger/R\$string;->EmojiInteractionTapHint:I"
internal const val PREMIUM_EMOJI_PACK = "Lorg/telegram/messenger/MessageObject;->isPremiumEmojiPack(Lorg/telegram/tgnet/TLRPC\$TL_messages_stickerSet;)Z"
internal const val FREE_EMOJI = "Lorg/telegram/messenger/MessageObject;->isFreeEmoji(Lorg/telegram/tgnet/TLRPC\$Document;)Z"
internal const val EMOJI_PACKS = "->getEmojipacks()Ljava/util/ArrayList;"
private const val FILTER = "filterPremiumStickers"
private const val GET_MESSAGE = "->getMessageObject()Lorg/telegram/messenger/MessageObject;"
private const val USER_CONFIG = "Lorg/telegram/messenger/UserConfig;"
private const val ACCOUNT_CONFIG = "Lorg/telegram/messenger/BaseController;->getUserConfig()$USER_CONFIG"
private const val ACCOUNT_INSTANCE = "$USER_CONFIG->getInstance(I)$USER_CONFIG"
private const val IS_PREMIUM = "$USER_CONFIG->isPremium()Z"
private const val ASK_BLOCKED = "$COMMERCE->premiumStickersBlocked(Ljava/lang/Object;)Z"
private const val CLEAR = "Ljava/util/ArrayList;->clear()V"

/**
 * Premium stickers and emoji for an account without Premium, under Hide Premium, gifts and Stars.
 * Telegram already knows how to leave stickers out: where Premium can't be bought,
 * premiumFeaturesBlocked answers yes and its sticker filters drop them. [STICKERS] asks Commerce
 * instead at just those places, [EFFECTS] keeps a Premium sticker's full-screen effect and its
 * upsell tooltip from playing in a chat, and [EMOJI_PACKS] takes the locked packs out of the emoji
 * keyboard's tab.
 */
internal enum class PremiumStickerTarget(val capability: String) {
    STICKERS("commercePremiumStickers"), EFFECTS("commercePremiumEffects"), EMOJI_PACKS("commercePremiumEmojiPacks"),
}

/**
 * The edits for each target that applies, read as a map, the Commerce stubs those targets read, and
 * why a target whose places were found but no longer have their shape is left out.
 */
internal class PremiumStickerPlan(
    edits: Map<PremiumStickerTarget, List<CommerceEdit>>,
    val stubs: Map<String, String>,
    val leftOut: Map<PremiumStickerTarget, String>,
) : Map<PremiumStickerTarget, List<CommerceEdit>> by edits

/** A place whose shape changed in this build: its target is left out, and the others still apply. */
private class Drift(reason: String) : Exception(reason)

/** The stubs Commerce's two sticker questions read, written only for the targets that apply. */
internal val PREMIUM_STUBS = mapOf(
    "premiumBlocked" to """
        check-cast p0, $STICKER_CONTROLLER
        invoke-virtual {p0}, $PREMIUM_BLOCKED
        move-result v0
        return v0
    """,
    "premiumAccount" to """
        check-cast p0, $STICKER_CONTROLLER
        invoke-virtual {p0}, $ACCOUNT_CONFIG
        move-result-object v0
        invoke-virtual {v0}, $IS_PREMIUM
        move-result v0
        return v0
    """,
    "premiumSticker" to """
        check-cast p0, Lorg/telegram/messenger/MessageObject;
        invoke-virtual {p0}, $PREMIUM_MESSAGE
        move-result v0
        return v0
    """,
    "messageAccountPremium" to """
        check-cast p0, Lorg/telegram/messenger/MessageObject;
        iget v0, p0, Lorg/telegram/messenger/MessageObject;->currentAccount:I
        invoke-static {v0}, $USER_CONFIG->getInstance(I)$USER_CONFIG
        move-result-object v0
        invoke-virtual {v0}, $IS_PREMIUM
        move-result v0
        return v0
    """,
)

/**
 * [PremiumStickerTarget.STICKERS]: MessagesController's two sticker filters (one pack, and a list
 * of packs) and the keyboard pass that takes Premium stickers out of favorites and recents, each
 * gated on one premiumFeaturesBlocked. [PremiumStickerTarget.EFFECTS]: the effect player's class,
 * found by the tooltip it shows a person without Premium, and its handler that plays a sticker's
 * effect, which a chat calls when the sticker scrolls into view and when it's tapped.
 * [PremiumStickerTarget.EMOJI_PACKS]: the emoji keyboard's pass that sorts installed and featured
 * emoji packs, splitting a Premium pack's free emoji from the rest, and hands them to the tab
 * strip. A target is left out whole when any of its places is missing or has changed shape; two
 * candidates for one place refuse.
 */
internal fun BytecodePatchContext.resolvePremiumStickerHooks(): PremiumStickerPlan {
    val classes = mutableMapOf<String, ClassDef>()
    classDefForEach { if (!it.type.startsWith("Lapp/hushtelegram/extension/")) classes[it.type] = it }
    // Each search reads only the methods of classes that might mention what it looks for, in the
    // app's order, and checks them in full. A method's own class is the only one that holds it.
    fun methods(mentioning: Mention) = classDefsMentioning(mentioning).mapNotNull { classes[it.type] }.flatMap { it.methods.toList() }
    fun methodsOf(type: String) = classes[type]?.methods?.toList().orEmpty()
    fun mutable(method: Method) = mutableClassDefBy(method.definingClass).methods.single { it.sameSignature(method) }
    val hooks = mutableMapOf<PremiumStickerTarget, List<CommerceEdit>>()
    val stubs = mutableMapOf<String, String>()
    val leftOut = mutableMapOf<PremiumStickerTarget, String>()
    // Every edit of a target is planned before any is kept, so a changed place leaves none behind.
    fun plan(target: PremiumStickerTarget, edits: () -> List<CommerceEdit>) {
        try {
            hooks[target] = edits()
        } catch (drift: Drift) {
            leftOut[target] = drift.message!!
        } catch (unread: RuntimeException) {
            // A place this reading doesn't follow, like a call with more registers than it expects.
            // PatchException isn't one, so two candidates for a place still refuse.
            leftOut[target] = "${unread.javaClass.simpleName}: ${unread.message}"
        }
    }

    val sorter = methods(Mention.reference(PREMIUM_EMOJI_PACK) and Mention.reference(FREE_EMOJI)).filter { method ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.hasShape(listOf("Z"), "V") &&
            method.instructions().let { body ->
                body.any { it.reference() == PREMIUM_EMOJI_PACK } && body.any { it.reference() == FREE_EMOJI } &&
                    body.any { it.reference()?.endsWith(EMOJI_PACKS) == true }
            }
    }.unique("emoji keyboard's pack pass")
    if (sorter != null) plan(PremiumStickerTarget.EMOJI_PACKS) {
        val (edit, reads) = emojiEdit(mutable(sorter))
        stubs += reads
        listOf(edit)
    }

    val blocked = methodsOf(STICKER_CONTROLLER).singleOrNull { it.definingClass == STICKER_CONTROLLER && it.name == "premiumFeaturesBlocked" }
    // The stubs read the account the same way Telegram's own answer does.
    val answer = blocked?.instructions()?.mapNotNull { it.reference() }.orEmpty()
    if (blocked == null || ACCOUNT_CONFIG !in answer || IS_PREMIUM !in answer) return PremiumStickerPlan(hooks, stubs, leftOut)

    val filters = methodsOf(STICKER_CONTROLLER).filter { it.definingClass == STICKER_CONTROLLER && it.name == FILTER }
    val keyboard = methods(Mention.reference(PREMIUM_BLOCKED) and Mention.reference(PREMIUM_DOCUMENT)).filter { method ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.hasShape(listOf("Z"), "V") &&
            method.instructions().let { body ->
                body.count { it.reference() == PREMIUM_BLOCKED } == 1 && body.count { it.reference() == PREMIUM_DOCUMENT } >= 2
            }
    }.unique("keyboard's Premium sticker pass")
    if (filters.isNotEmpty() && keyboard != null) plan(PremiumStickerTarget.STICKERS) {
        // A third filter would keep showing what the other two leave out.
        drift(filters.size == 2, "MessagesController has ${filters.size} Premium sticker filters, not two")
        (filters + keyboard).map { blockedEdit(mutable(it)) }
    }

    val tooltip = methods(Mention.reference(STICKER_TOOLTIP) and Mention.reference(PREMIUM_BLOCKED)).filter { method ->
        method.instructions().let { body -> body.any { it.reference() == STICKER_TOOLTIP } && body.any { it.reference() == PREMIUM_BLOCKED } }
    }.unique("Premium sticker tooltip")
    if (tooltip != null) {
        val player = methodsOf(tooltip.definingClass).filter { method ->
            method.definingClass == tooltip.definingClass && method.returnType == "V" && !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.parameterTypes.size == 3 && method.parameterTypes[2].toString() == "Z" &&
                method.instructions().let { body -> body.any { it.reference() == PREMIUM_MESSAGE } && body.any { it.reference() == TAP_HINT } }
        }.unique("sticker effect player")
        if (player != null) plan(PremiumStickerTarget.EFFECTS) { listOf(blockedEdit(mutable(tooltip)), effectEdit(mutable(player))) }
    }
    // Both sticker targets ask premiumStickersBlocked; only the effect player reads a message.
    val sticker = setOf("premiumBlocked", "premiumAccount")
    PREMIUM_STUBS.filterKeys { stub ->
        (PremiumStickerTarget.STICKERS in hooks && stub in sticker) || PremiumStickerTarget.EFFECTS in hooks
    }.forEach { (stub, smali) -> stubs[stub] = smali }
    return PremiumStickerPlan(hooks, stubs, leftOut)
}

/**
 * The one premiumFeaturesBlocked call in [method], asked of Commerce instead with the same
 * controller register. The result is read by the same move-result as before.
 */
private fun blockedEdit(method: MutableMethod): CommerceEdit {
    val body = method.instructions()
    val at = body.indices.filter { body[it].reference() == PREMIUM_BLOCKED }.singleOrNull()
        ?: throw Drift("${method.definingClass}->${method.name} no longer asks premiumFeaturesBlocked once")
    drift(body[at].opcode == Opcode.INVOKE_VIRTUAL && body.getOrNull(at + 1)?.opcode == Opcode.MOVE_RESULT,
        "${method.name}'s premiumFeaturesBlocked answer isn't read right after")
    val controller = body[at].namedRegisters().single()
    return CommerceEdit(method, at, "invoke-static {v$controller}, $ASK_BLOCKED", replace = true)
}

/**
 * Before the effect player does anything: a Premium sticker on an account without Premium returns
 * straight away, the way the player returns for a message it doesn't animate. The cell's message
 * is read with the same call the player makes, into a local, which holds nothing yet at entry. A
 * jump back to the start would run the guard again over a local the player is using, so a player
 * with one is left out.
 */
private fun effectEdit(method: MutableMethod): CommerceEdit {
    val body = method.instructions()
    val cell = method.parameterRegisterNumber(0)
    val read = body.firstOrNull {
        it.opcode == Opcode.INVOKE_VIRTUAL && it.reference() == "${method.parameterTypes[0]}$GET_MESSAGE" && it.namedRegisters() == listOf(cell)
    }?.reference() ?: throw Drift("the sticker effect player no longer reads its cell's message")
    drift(cell - 1 >= 1 && cell <= 15, "the sticker effect player has no room to ask about its cell")
    val flow = ControlFlow.of(method)
    drift((flow.normal + flow.exceptional).none { 0 in it }, "something in the sticker effect player jumps back to its start")
    // The keep label is held by the inserted code: a label on the stock first instruction would move
    // onto the guard along with the method start, and the guard would jump to itself.
    return CommerceEdit(method, 0, """
        if-eqz v$cell, :hush_keep
        invoke-virtual {v$cell}, $read
        move-result-object v0
        invoke-static {v0}, $COMMERCE->skipPremiumEffect(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :hush_keep
        return-void
        :hush_keep
        nop
    """)
}

/**
 * Where the emoji keyboard's pack pass hands its sorted packs to the tab strip. Every way out of
 * its sorting loops reaches the read of the strip's field, so the packs go to Commerce right
 * before it, and the strip, the rows and the taps that index into the list all see what's left.
 * The stubs read the view's account, its "every emoji without Premium" flag and a pack's free flag
 * through the same fields the pass itself reads and writes.
 */
private fun emojiEdit(method: MutableMethod): Pair<CommerceEdit, Map<String, String>> {
    val body = method.instructions()
    val tabs = body.indices.filter { body[it].reference()?.endsWith(EMOJI_PACKS) == true }.singleOrNull()
        ?: throw Drift("the emoji pack pass no longer hands its packs to the tab strip once")
    val view = body[tabs].owner()
    val viewRegister = body[tabs].namedRegisters().single()
    val at = tabs - 2
    val strip = body.getOrNull(at) as? TwoRegisterInstruction
    drift(strip != null && body[at].opcode == Opcode.IGET_OBJECT && body[at].owner() == view && strip.registerB == viewRegister &&
        body[at + 1].opcode == Opcode.IF_EQZ && body[at + 1].namedRegisters() == listOf(strip.registerA),
        "the emoji tab strip isn't read right before it takes the packs")
    val flow = ControlFlow.of(method).normal
    drift(flow.indices.none { it != at && at + 1 in flow[it] } && flow.indices.none { it != at + 1 && tabs in flow[it] },
        "something jumps past the emoji tab strip's read")

    val clear = body.indexOfFirst { it.reference() == CLEAR }
    val list = body.getOrNull(clear - 1) as? TwoRegisterInstruction
    drift(list != null && body[clear - 1].opcode == Opcode.IGET_OBJECT && body[clear - 1].owner() == view &&
        body[clear].namedRegisters() == listOf(list.registerA),
        "the emoji pack pass no longer starts by clearing the view's pack list")

    val premium = body.indices.filter { body[it].reference() == IS_PREMIUM }.singleOrNull() ?: -1
    drift(premium >= 2 && body[premium - 2].reference() == ACCOUNT_INSTANCE && body.getOrNull(premium + 1)?.opcode == Opcode.MOVE_RESULT,
        "the emoji pack pass no longer asks once whether the account has Premium")
    val account = body.filter { it.opcode == Opcode.IGET && it.owner() == view }.singleOrNull()
    drift(account != null && (account as TwoRegisterInstruction).registerA == body[premium - 2].namedRegisters().single(),
        "the emoji pack pass no longer reads its view's account once")
    val answer = (body[premium + 1] as OneRegisterInstruction).registerA
    val allow = (premium + 2 until minOf(premium + 8, body.size)).firstOrNull { body[it].opcode == Opcode.IGET_BOOLEAN }
    drift(allow != null && body[allow].owner() == view && (body[allow] as TwoRegisterInstruction).registerA == answer &&
        (premium + 2 until allow).any { body[it].opcode == Opcode.IF_NEZ && body[it].namedRegisters() == listOf(answer) },
        "the emoji pack pass no longer lets its view show every emoji without Premium")

    // A featured pack is free when none of its emoji needs Premium (the one xor in the pass); an
    // installed pack that isn't a Premium pack gets the same flag set first after the question.
    val xor = body.indices.filter { body[it].opcode == Opcode.XOR_INT_2ADDR }.singleOrNull()
    val free = xor?.let { body.getOrNull(it + 1) }
    val ask = body.indexOfFirst { it.reference() == PREMIUM_EMOJI_PACK }
    drift(free?.opcode == Opcode.IPUT_BOOLEAN &&
        body.drop(ask).firstOrNull { it.opcode == Opcode.IPUT_BOOLEAN }?.reference() == free.reference(),
        "the emoji pack pass no longer marks a pack free the same way for installed and featured packs")
    val freeField = free!!.reference()!!

    val reads = mapOf(
        "emojiViewPremium" to """
            check-cast p0, $view
            iget v0, p0, ${account!!.reference()}
            invoke-static {v0}, $ACCOUNT_INSTANCE
            move-result-object v0
            invoke-virtual {v0}, $IS_PREMIUM
            move-result v0
            if-nez v0, :premium
            iget-boolean v0, p0, ${body[allow!!].reference()}
            :premium
            return v0
        """,
        "emojiPackFree" to """
            check-cast p0, ${free.owner()}
            iget-boolean v0, p0, $freeField
            return v0
        """,
    )
    // The strip's register is written by the read the code goes in front of, so it holds nothing yet.
    return CommerceEdit(method, at, """
        iget-object v${strip!!.registerA}, v$viewRegister, ${body[clear - 1].reference()}
        invoke-static {v$viewRegister, v${strip.registerA}}, $COMMERCE->dropLockedEmojiPacks(Ljava/lang/Object;Ljava/util/List;)V
    """) to reads
}

private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()
private fun Instruction.owner() = reference()?.substringBefore("->")
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Method.hasShape(parameters: List<String>, result: String) =
    parameterTypes.map { it.toString() } == parameters && returnType == result
private fun Method.sameSignature(other: Method) = name == other.name && returnType == other.returnType &&
    parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }
private fun <T> List<T>.unique(what: String): T? {
    shape(size <= 1, "ambiguous $what ($size candidates)")
    return singleOrNull()
}
private fun shape(ok: Boolean, what: String) {
    if (!ok) throw PatchException("$PATCH: $what (before editing)")
}
private fun drift(ok: Boolean, what: String) {
    if (!ok) throw Drift(what)
}
