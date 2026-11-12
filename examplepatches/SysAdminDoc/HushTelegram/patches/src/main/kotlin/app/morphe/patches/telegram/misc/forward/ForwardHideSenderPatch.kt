/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.forward

import app.morphe.util.names.origString
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
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.patches.telegram.misc.messagemenu.FORWARD_SEND
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.definitionReaches
import app.morphe.util.literalReads
import app.morphe.util.namedRegisters
import app.morphe.util.readsAfter
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origSuperclass
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val FORWARD_SENDER = "$EXTENSION_PACKAGE/misc/ForwardSender;"
internal const val STARTS = "$FORWARD_SENDER->starts(Ljava/lang/Object;Ljava/util/ArrayList;)V"
internal const val PICKED = "$FORWARD_SENDER->picked(Ljava/util/ArrayList;JI)Z"
internal const val SHARED = "$FORWARD_SENDER->shared(Ljava/util/ArrayList;JI)Z"
internal const val SHARES = "$FORWARD_SENDER->shares(Ljava/lang/Object;)V"
internal const val SHARE_POPUP = "$FORWARD_SENDER->sharePopup(Ljava/lang/Object;Ljava/lang/Object;)V"
internal const val PREVIEW_PARAMS = "Lorg/telegram/messenger/MessagePreviewParams;"
internal const val UPDATE_FORWARD = "$PREVIEW_PARAMS->updateForward(Ljava/util/ArrayList;J)V"
internal const val FORWARDS = "$PREVIEW_PARAMS->forwardMessages:Lorg/telegram/messenger/MessagePreviewParams\$Messages;"
internal const val HIDE_SENDERS = "$PREVIEW_PARAMS->hideForwardSendersName:Z"
internal const val MESSAGE_OBJECT = "Lorg/telegram/messenger/MessageObject;"
internal const val MESSAGE_TYPE = "$MESSAGE_OBJECT->type:I"
internal const val IS_PREMIUM = "Lorg/telegram/messenger/UserConfig;->isPremium()Z"
private const val USER_CONFIG = "Lorg/telegram/messenger/UserConfig;"
private val COMPARES = setOf(Opcode.IF_EQ, Opcode.IF_NE)
private val ZEROES = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST)
private val MOVE_OBJECTS = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)

/** What the chat picker hands its callback between the picker and the topic: the chats, the comment, two flags and two numbers. */
private val PICKED_CHATS = listOf("Ljava/util/ArrayList;", "Ljava/lang/CharSequence;", "Z", "Z", "I", "I")

/** The animation on the preview's Hide sender's name button. */
internal const val NAME_HIDE = "Lorg/telegram/messenger/R\$raw;->name_hide:I"

@Suppress("unused")
val forwardHideSenderPatch = bytecodePatch(
    name = "Hide sender names when forwarding",
    description = "Turns on Telegram's Hide sender's name option each time you forward, from the forward preview, the " +
        "Share sheet or the chat picker when you pick several chats, so copies arrive without the original author. You " +
        "can still turn it off in the preview or the Share sheet's send menu. Forwards to Saved Messages keep the sender." +
        " Starts off. Turn it on in HushTelegram settings > Conversations.",
    default = true,
) {
    category("Conversations")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveForwardHideSender()
        val share = site.share
        val flagged = (site.picks + share.sends).groupBy { it.method }
        // Assembled on copies first, so a refusal leaves the app untouched.
        insertForwardStart(MutableMethod(ImmutableMethod.of(site.update)))
        flagged.forEach { (method, sends) -> insertSendFlags(MutableMethod(ImmutableMethod.of(method)), sends) }
        insertShares(MutableMethod(ImmutableMethod.of(share.made)), share)
        insertSharePopup(MutableMethod(ImmutableMethod.of(share.popup)), share)
        writeStub(FORWARD_SENDER, "fresh", 2, """
            check-cast p0, $PREVIEW_PARAMS
            iget-object v0, p0, $FORWARDS
            if-nez v0, :hush_held
            const/4 v0, 0x1
            return v0
            :hush_held
            const/4 v0, 0x0
            return v0
        """)
        writeStub(FORWARD_SENDER, "premium", 2, """
            check-cast p0, $MESSAGE_OBJECT
            iget v0, p0, $MESSAGE_OBJECT->currentAccount:I
            invoke-static {v0}, $USER_CONFIG->getInstance(I)$USER_CONFIG
            move-result-object v0
            invoke-virtual {v0}, $IS_PREMIUM
            move-result v0
            return v0
        """)
        writeStub(FORWARD_SENDER, "type", 2, """
            check-cast p0, $MESSAGE_OBJECT
            iget v0, p0, $MESSAGE_TYPE
            return v0
        """)
        writeStub(FORWARD_SENDER, "article", 1, """
            const v0, ${site.article}
            return v0
        """)
        writeStub(FORWARD_SENDER, "hide", 2, """
            check-cast p0, $PREVIEW_PARAMS
            const/4 v0, 0x1
            iput-boolean v0, p0, $HIDE_SENDERS
            return-void
        """)
        writeStub(FORWARD_SENDER, "self", 3, """
            check-cast p0, $MESSAGE_OBJECT
            iget v0, p0, $MESSAGE_OBJECT->currentAccount:I
            invoke-static {v0}, $USER_CONFIG->getInstance(I)$USER_CONFIG
            move-result-object v0
            invoke-virtual {v0}, $USER_CONFIG->getClientUserId()J
            move-result-wide v0
            return-wide v0
        """)
        // The extension's stubs read and set the sheet's list and flag from outside its class.
        tgMutableClassDefBy(share.alert).fields.filter { it.origString() == share.flag || it.origString() == share.messages }.forEach {
            it.accessFlags = it.accessFlags and (AccessFlags.PRIVATE.value or AccessFlags.PROTECTED.value).inv() or AccessFlags.PUBLIC.value
        }
        writeStub(FORWARD_SENDER, "shareMessages", 2, """
            check-cast p0, ${share.alert}
            iget-object v0, p0, ${share.messages}
            return-object v0
        """)
        writeStub(FORWARD_SENDER, "shareHide", 2, """
            check-cast p0, ${share.alert}
            const/4 v0, 0x0
            iput-boolean v0, p0, ${share.flag}
            return-void
        """)
        writeStub(FORWARD_SENDER, "shareUncheck", 2, """
            check-cast p0, ${share.uncheck.substringBefore("->")}
            const/4 v0, 0x0
            invoke-virtual {p0, v0}, ${share.uncheck}
            return-void
        """)
        insertForwardStart(site.update)
        flagged.forEach { (method, sends) -> insertSendFlags(method, sends) }
        insertShares(share.made, share)
        insertSharePopup(share.popup, share)
        enableStatus("forwardHideSender")
    }
}

/**
 * The preview's [update] for a new forward, the message type Telegram keeps behind Premium, the
 * chat picker's own forwards and the Share sheet.
 */
internal class ForwardHideSenderSite(val update: MutableMethod, val article: Int, val picks: List<FlagSend>, val share: ShareSheet)

/** A forward send at [at] in [method], its registers from [first], whose Hide sender's name [hook] picks. */
internal class FlagSend(val method: MutableMethod, val at: Int, val first: Int, val hook: String)

/**
 * The Share sheet [alert], whose Show sender's name [flag] its [sends] turn around and whose
 * [messages] they forward. [made] stores the messages right before [madeAt] with the sheet in [self], and
 * [popup] ticks [uncheck]'s item [item] in the send menu right before [popupAt], the sheet in [popupAlert].
 */
internal class ShareSheet(
    val alert: String,
    val flag: String,
    val messages: String,
    val sends: List<FlagSend>,
    val made: MutableMethod,
    val madeAt: Int,
    val self: Int,
    val popup: MutableMethod,
    val popupAt: Int,
    val popupAlert: Int,
    val item: Int,
    val uncheck: String,
)

/** The extension sees the preview and the messages before Telegram stores them. */
internal fun insertForwardStart(target: MutableMethod) {
    val params = target.implementation!!.registerCount - 4
    target.addInstructions(0, "invoke-static {v$params, v${params + 1}}, $STARTS")
}

/** The extension picks the flag each of [sends] goes with, last first so the earlier indexes hold. */
internal fun insertSendFlags(target: MutableMethod, sends: List<FlagSend>) {
    sends.sortedByDescending { it.at }.forEach {
        target.addInstructionsAtControlFlowLabel(it.at, """
            invoke-static/range {v${it.first + 1} .. v${it.first + 4}}, ${it.hook}
            move-result v${it.first + 4}
        """)
    }
}

/** The extension sees each Share sheet once it holds its messages. */
internal fun insertShares(target: MutableMethod, share: ShareSheet) =
    target.addInstructions(share.madeAt, "invoke-static {v${share.self}}, $SHARES")

/** The extension sees the send menu once Telegram has ticked Show sender's name. */
internal fun insertSharePopup(target: MutableMethod, share: ShareSheet) =
    target.addInstructions(share.popupAt, "invoke-static {v${share.popupAlert}, v${share.item}}, $SHARE_POPUP")

/**
 * MessagePreviewParams.updateForward(messages, dialog) fills the forward preview, and its
 * hideForwardSendersName flag is what the send reads. The preview's own Hide sender's name button
 * refuses a non-Premium account whose forward holds an article, found by its type number.
 */
internal fun BytecodePatchContext.resolveForwardHideSender(): ForwardHideSenderSite {
    requireStatusMethod("forwardHideSender")
    controlHook(FORWARD_SENDER, "starts", listOf("Ljava/lang/Object;", "Ljava/util/ArrayList;"), "V")
    controlHook(FORWARD_SENDER, "fresh", listOf("Ljava/lang/Object;"), "Z")
    controlHook(FORWARD_SENDER, "premium", listOf("Ljava/lang/Object;"), "Z")
    controlHook(FORWARD_SENDER, "type", listOf("Ljava/lang/Object;"), "I")
    controlHook(FORWARD_SENDER, "article", listOf(), "I")
    controlHook(FORWARD_SENDER, "hide", listOf("Ljava/lang/Object;"), "V")
    controlHook(FORWARD_SENDER, "picked", listOf("Ljava/util/ArrayList;", "J", "I"), "Z")
    controlHook(FORWARD_SENDER, "shared", listOf("Ljava/util/ArrayList;", "J", "I"), "Z")
    controlHook(FORWARD_SENDER, "shares", listOf("Ljava/lang/Object;"), "V")
    controlHook(FORWARD_SENDER, "sharePopup", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "V")
    controlHook(FORWARD_SENDER, "self", listOf("Ljava/lang/Object;"), "J")
    controlHook(FORWARD_SENDER, "shareMessages", listOf("Ljava/lang/Object;"), "Ljava/util/ArrayList;")
    controlHook(FORWARD_SENDER, "shareHide", listOf("Ljava/lang/Object;"), "V")
    controlHook(FORWARD_SENDER, "shareUncheck", listOf("Ljava/lang/Object;"), "V")

    val params = tgMutableClassDefByOrNull(PREVIEW_PARAMS)
    controlShape(params != null, "MessagePreviewParams is missing")
    controlShape(params!!.fields.any { it.origString() == FORWARDS && !AccessFlags.STATIC.isSet(it.accessFlags) },
        "the forward preview no longer holds its messages")
    controlShape(params.fields.any { it.origString() == HIDE_SENDERS && !AccessFlags.STATIC.isSet(it.accessFlags) },
        "the forward preview no longer has a Hide sender's name flag")
    val update = params.methods.filter { it.origString() == UPDATE_FORWARD &&
        !AccessFlags.STATIC.isSet(it.accessFlags) }.controlSingle("forward preview update")
    controlShape(update.controlBody().any { it.controlRef() == FORWARDS }, "the forward preview update no longer stores the messages")
    controlShape(ControlFlow.of(update).normal.none { 0 in it }, "something jumps back to the start of the forward preview update")

    val message = tgClassDefByOrNull(MESSAGE_OBJECT)
    controlShape(message != null && listOf("type", "currentAccount").all { name -> message.fields.any { it.origName == name && it.origType == "I" && !AccessFlags.STATIC.isSet(it.accessFlags) } },
        "a message no longer has its type and account")
    val config = tgClassDefByOrNull(USER_CONFIG)
    controlShape(config != null && listOf("getInstance(I)$USER_CONFIG", "isPremium()Z", "getClientUserId()J").all { wanted ->
        config.methods.any { "${it.origName}(${it.origParameterTypes.joinToString("")})${it.origReturnType}" == wanted && AccessFlags.PUBLIC.isSet(it.accessFlags) }
    }, "Telegram's Premium check changed")

    val article = premiumHideSenderTypes().toList().controlSingle("the Premium gate on hiding an article's sender")
    val sends = forwardSends()
    val picks = pickerSends(sends)
    controlShape(picks.isNotEmpty(), "the chat picker's own forwards are missing")
    return ForwardHideSenderSite(update, article, picks, resolveShareSheet(sends))
}

/** A forward send at [at] in [method] of [owner], its registers from [first]: the helper, the messages, the chat, then Hide sender's name. */
private class ForwardSend(val owner: ClassDef, val method: Method, val flow: ControlFlow, val at: Int, val first: Int)

private fun BytecodePatchContext.forwardSends(): List<ForwardSend> {
    val sends = mutableListOf<ForwardSend>()
    forEachClassMentioning(Mention.reference(FORWARD_SEND)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.forEach { m ->
            if (m.controlBody().none { it.controlRef() == FORWARD_SEND }) return@forEach
            val flow = ControlFlow.of(m)
            flow.instructions.forEachIndexed { at, call ->
                if (call.controlRef() == FORWARD_SEND && call is RegisterRangeInstruction && call.registerCount == 16) {
                    sends += ForwardSend(cls, m, flow, at, call.startRegister)
                }
            }
        }
    }
    return sends
}

/** The chat picker's callback when you pick chats: the picker, what [PICKED_CHATS] lists, then the topic. */
internal fun Method.pickerShaped(): Boolean {
    val parameters = origParameterTypes
    return !AccessFlags.STATIC.isSet(accessFlags) && origReturnType == "Z" && parameters.size == 8 &&
        parameters.subList(1, 7) == PICKED_CHATS && parameters[0].startsWith("L") && parameters[7].startsWith("L")
}

/**
 * The forwards the chat picker sends by itself when you pick several chats, with no preview to
 * turn Hide sender's name on in: a send in the picker's callback, or in a lambda the callback
 * makes, whose flag is a plain false that only the send reads.
 */
private fun BytecodePatchContext.pickerSends(sends: List<ForwardSend>): List<FlagSend> {
    val lambdas = mutableMapOf<String, Boolean>()
    fun madeByPicker(cls: ClassDef) = lambdas.getOrPut(cls.origType) {
        var made = false
        if (cls.origSuperclass == "Ljava/lang/Object;" && cls.interfaces.isNotEmpty()) {
            forEachClassMentioning(Mention.type(cls.origType)) { maker ->
                made = made || maker.methods.any { m ->
                    m.pickerShaped() && m.controlBody().any { it.opcode == Opcode.NEW_INSTANCE && it.controlRef() == cls.origType }
                }
            }
        }
        made
    }
    return sends.filter { it.method.pickerShaped() || it.method.name != "<init>" && madeByPicker(it.owner) }.mapNotNull { send ->
        val flag = send.first + 4
        val body = send.flow.instructions
        val zero = body.indices.filter { c ->
            body[c].opcode in ZEROES && (body[c] as OneRegisterInstruction).registerA == flag &&
                (body[c] as NarrowLiteralInstruction).narrowLiteral == 0 && send.flow.definitionReaches(c, send.at, flag)
        }.singleOrNull() ?: return@mapNotNull null
        // move-result takes the flag back, so it needs a register an 8-bit operand reaches.
        if (flag > 255 || send.method.literalReads(zero) != listOf(send.at)) return@mapNotNull null
        FlagSend(mutableMethod(send.owner, send.method), send.at, send.first, PICKED)
    }
}

/**
 * The Share sheet's forward sends with Hide sender's name the opposite of the sheet's Show sender's
 * name flag, and the messages from the sheet's own list. The sheet stores that list once, as it's
 * made, and its send menu sets the flag again each time it opens, ticking the item that says so.
 */
private fun BytecodePatchContext.resolveShareSheet(sends: List<ForwardSend>): ShareSheet {
    val found = sends.mapNotNull { send ->
        val body = send.flow.instructions
        val turn = send.flow.writer(send.at, send.first + 4)
        val turned = body.getOrNull(turn)
        if (turned?.opcode != Opcode.XOR_INT_LIT8 || (turned as NarrowLiteralInstruction).narrowLiteral != 1) return@mapNotNull null
        val shown = body.getOrNull(send.flow.writer(turn, (turned as TwoRegisterInstruction).registerB))
        val list = body.getOrNull(send.flow.writer(send.at, send.first + 1))
        val flag = shown?.takeIf { it.opcode == Opcode.IGET_BOOLEAN }?.controlRef() ?: return@mapNotNull null
        val messages = list?.takeIf { it.opcode == Opcode.IGET_OBJECT }?.controlRef() ?: return@mapNotNull null
        val owner = flag.substringBefore("->")
        if (!messages.startsWith("$owner->") || !messages.endsWith(":Ljava/util/ArrayList;")) return@mapNotNull null
        Triple(owner, flag, messages) to send
    }
    val (alert, flag, messages) = found.map { it.first }.distinct().controlSingle("the Share sheet's forward")
    val shared = found.map { (_, send) ->
        // The send to each chat takes the extension's answer in place of the turned flag, so nothing after it may read that.
        controlShape(send.first + 4 <= 255 && send.method.readsAfter(send.at, send.first + 4).isEmpty(),
            "the Share sheet reads its forward's flag again after sending")
        FlagSend(mutableMethod(send.owner, send.method), send.at, send.first, SHARED)
    }

    val sheet = tgClassDefByOrNull(alert)
    controlShape(sheet != null && AccessFlags.PUBLIC.isSet(sheet.accessFlags), "the Share sheet isn't public")
    controlShape(listOf(flag, messages).all { ref -> sheet!!.fields.any { it.origString() == ref && !AccessFlags.STATIC.isSet(it.accessFlags) } },
        "the Share sheet no longer holds its messages and sender flag")
    val (made, store) = sheet!!.methods.filter { it.name == "<init>" }.flatMap { m ->
        m.controlBody().withIndex().filter { (_, it) -> it.opcode == Opcode.IPUT_OBJECT && it.controlRef() == messages }.map { m to it.index }
    }.controlSingle("the Share sheet storing its messages")
    val flow = ControlFlow.of(made)
    val body = flow.instructions
    val self = (body[store] as TwoRegisterInstruction).registerB
    val p0 = made.implementation!!.registerCount - made.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 } - 1
    val holdsThis = if (self == p0) body.indices.none { flow.writes(it, p0) }
        else flow.writer(store, self) == 0 && body[0].opcode in MOVE_OBJECTS && (body[0] as TwoRegisterInstruction).registerB == p0
    controlShape(holdsThis && self <= 15, "the Share sheet stores its messages from somewhere other than itself")
    controlShape(body.indices.any { at ->
        body[at].opcode in setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE) &&
            body[at].controlRef()?.substringAfter("->")?.startsWith("<init>(") == true &&
            body[at].namedRegisters().firstOrNull() == self && flow.definitionReaches(at, store)
    }, "the Share sheet stores its messages before it's made")
    controlShape(flow.after(store).none { body[it].opcode == Opcode.IPUT_BOOLEAN && body[it].controlRef() == flag },
        "the Share sheet sets its sender flag after it holds the messages")

    class Popup(val owner: ClassDef, val method: Method, val at: Int, val alert: Int, val item: Int, val uncheck: String)
    val popups = mutableListOf<Popup>()
    forEachClassMentioning(Mention.reference(flag)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.forEach { m ->
            val code = m.controlBody()
            for (i in 0 until code.size - 2) {
                val set = code[i]
                val tick = code[i + 1]
                if (set.opcode != Opcode.IPUT_BOOLEAN || set.controlRef() != flag) continue
                val uncheck = tick.controlRef() ?: continue
                val operands = tick.namedRegisters()
                if (tick.opcode != Opcode.INVOKE_VIRTUAL || !uncheck.endsWith("->setChecked(Z)V") ||
                    operands.size != 2 || operands[1] != (set as TwoRegisterInstruction).registerA) continue
                popups += Popup(cls, m, i + 2, (set as TwoRegisterInstruction).registerB, operands[0], uncheck)
            }
        }
    }
    val popup = popups.controlSingle("the Share sheet's send menu ticking Show sender's name")
    controlShape(popup.alert <= 15 && popup.item <= 15, "the Share sheet's send menu holds the sheet in a high register")
    requireReachable(popup.uncheck, false)
    val madeMethod = mutableMethod(sheet, made)
    val popupMethod = mutableMethod(popup.owner, popup.method)
    controlShape(shared.none { it.method === madeMethod || it.method === popupMethod }, "the Share sheet sends from where it's made or its menu")
    return ShareSheet(alert, flag, messages, shared, madeMethod, store + 1, self,
        popupMethod, popup.at, popup.alert, popup.item, popup.uncheck)
}

/** [method] of [owner] as the patch edits it. */
private fun BytecodePatchContext.mutableMethod(owner: ClassDef, method: Method): MutableMethod {
    fun Method.key() = "$name(${parameterTypes.joinToString("")})$returnType"
    return tgMutableClassDefBy(owner.origType).methods.single { it.key() == method.key() }
}

/** The write of [register] last before [use], when every path to [use] runs it, or -1. */
private fun ControlFlow.writer(use: Int, register: Int): Int {
    val at = (use - 1 downTo 0).firstOrNull { writes(it, register) } ?: return -1
    return if (definitionReaches(at, use, register)) at else -1
}

private fun ControlFlow.writes(at: Int, register: Int): Boolean {
    val instruction = instructions[at]
    val destination = instruction.namedRegisters().firstOrNull()
    return instruction.opcode.setsRegister() && destination != null &&
        (destination == register || instruction.opcode.setsWideRegister() && destination + 1 == register)
}

/** Every instruction a path from [index] can reach after it. */
private fun ControlFlow.after(index: Int): Set<Int> {
    val seen = mutableSetOf<Int>()
    val pending = ArrayDeque(normal[index] + exceptional[index])
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (seen.add(at)) pending += normal[at] + exceptional[at]
    }
    return seen
}

/**
 * The Hide sender's name button's gate: not Premium, then each forwarded message's type compared
 * with one number. Every number compared that way, read only from classes that check Premium, name
 * the forwarded messages and load the button's animation. The message menu reads the same gate.
 */
internal fun BytecodePatchContext.premiumHideSenderTypes(): Set<Int> {
    val articles = mutableSetOf<Int>()
    forEachClassMentioning(Mention.reference(IS_PREMIUM) and Mention.reference(FORWARDS) and Mention.reference(NAME_HIDE)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.forEach { m ->
            val body = m.controlBody()
            val premium = body.indexOfFirst { it.controlRef() == IS_PREMIUM }
            if (premium < 0 || body.none { it.controlRef() == FORWARDS } || body.none { it.controlRef() == NAME_HIDE }) return@forEach
            for (i in premium until body.size - 2) {
                val literal = body[i + 1] as? NarrowLiteralInstruction ?: continue
                if (body[i].controlRef() == MESSAGE_TYPE && body[i + 2].opcode in COMPARES) articles += literal.narrowLiteral
            }
        }
    }
    return articles
}
