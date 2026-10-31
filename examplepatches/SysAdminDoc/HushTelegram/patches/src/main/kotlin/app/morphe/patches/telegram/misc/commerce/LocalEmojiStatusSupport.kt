/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.commerce

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal const val LOCAL_STATUS = "$EXTENSION_PACKAGE/misc/LocalEmojiStatus;"
internal const val LOCAL_STATUS_ID = "$LOCAL_STATUS->documentId(Ljava/lang/Long;Ljava/lang/Object;)Ljava/lang/Long;"
internal const val LOCAL_STATUS_PREMIUM = "$LOCAL_STATUS->premium(I)Z"
internal const val LOCAL_STATUS_KEEP = "$LOCAL_STATUS->keep(Ljava/lang/Object;Ljava/lang/Object;)Z"
private const val STATUS_USER = "Lorg/telegram/tgnet/TLRPC\$User;"
internal const val USER_STATUS_ID = "$EMOJI_USERS->$EMOJI_GETTER($STATUS_USER)Ljava/lang/Long;"
internal const val IS_PREMIUM_USER = "$STICKER_CONTROLLER->isPremiumUser($STATUS_USER)Z"
/** The star Telegram draws by a Premium account's name when it has no status: the chat list title's way into the picker. */
internal const val LIST_STAR = "Lorg/telegram/messenger/R\$drawable;->msg_premium_liststar:I"
internal const val SEND_STATUS_NAME = "updateEmojiStatus"
internal val SEND_STATUS_PARAMETERS = listOf(EMOJI_STATUS_TYPE, "Lorg/telegram/tgnet/tl/TL_stars\$StarGift;")
private const val STATUS_BASE_CONTROLLER = "Lorg/telegram/messenger/BaseController;"
private const val STATUS_USER_CONFIG = "Lorg/telegram/messenger/UserConfig;"
private const val STATUS_NOTIFICATIONS = "Lorg/telegram/messenger/NotificationCenter;"
private const val SET_STATUS = "Lorg/telegram/tgnet/TLRPC\$TL_emojiStatus;"
private const val NO_STATUS = "Lorg/telegram/tgnet/TLRPC\$TL_emojiStatusEmpty;"

/**
 * The chat list title's status reads ([title], with the getter and Premium call sites in it) and
 * the account's own status send ([send]), or [missing], why this build can't have the switch.
 * Nothing in the app changes until [apply].
 */
internal class LocalEmojiStatusPlan(
    private val title: MutableMethod?,
    private val send: MutableMethod?,
    val missing: String?,
) {
    fun apply(context: BytecodePatchContext) {
        if (missing != null) return
        val title = title!!
        val send = send!!
        // Later places first: an earlier edit in the same method moves indexes.
        title.statusReads().sortedDescending().forEach { index ->
            val body = title.controlBody()
            val result = (body[index + 1] as OneRegisterInstruction).registerA
            val user = (body[index] as FiveRegisterInstruction).registerC
            title.addInstructions(index + 2, "invoke-static {v$result, v$user}, $LOCAL_STATUS_ID\n" +
                "move-result-object v$result")
        }
        title.premiumReads().sortedDescending().forEach { index ->
            val result = (title.controlBody()[index + 1] as OneRegisterInstruction).registerA
            title.addInstructions(index + 2, "invoke-static/range {v$result .. v$result}, $LOCAL_STATUS_PREMIUM\n" +
                "move-result v$result")
        }
        send.addInstructionsWithLabels(0, """
            invoke-static/range {p0 .. p1}, $LOCAL_STATUS_KEEP
            move-result v0
            if-eqz v0, :hush_stock
            return-void
        """, ExternalLabel("hush_stock", send.getInstruction(0)))
        context.writeStatusStubs()
    }
}

/**
 * Telegram's chat list title draws the account's emoji status next to "Telegram", or the Premium
 * star when a Premium account has none, and either one opens the status picker. Two views share
 * the one method that sets them: the stories strip's title and the action bar's. Each asks the
 * getter for the status's emoji and then MessagesController whether the account has Premium, and
 * each gets LocalEmojiStatus' answer right after. The picker sends the account's new status
 * through one MessagesController method, which asks LocalEmojiStatus first. Channels and gifts call
 * the request underneath it directly, so they're untouched.
 */
internal fun BytecodePatchContext.resolveLocalEmojiStatus(): LocalEmojiStatusPlan {
    controlHook(LOCAL_STATUS, "documentId", listOf("Ljava/lang/Long;", "Ljava/lang/Object;"), "Ljava/lang/Long;")
    controlHook(LOCAL_STATUS, "premium", listOf("I"), "Z")
    controlHook(LOCAL_STATUS, "keep", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "Z")
    requireStatusMethod("commerceLocalEmojiStatus")
    fun missing(why: String) = LocalEmojiStatusPlan(null, null, why)

    val titles = classDefsMentioning(Mention.reference(LIST_STAR)).filter { classDef ->
        classDef.methods.any { it.drawsTitleStatus() }
    }.flatMap { classDef -> mutableClassDefBy(classDef).methods.filter { it.drawsTitleStatus() } }
    val title = titles.singleOrNull() ?: return missing(
        if (titles.isEmpty()) "the chat list title no longer draws the emoji status" else "the chat list title's status has ${titles.size} places to draw it")
    val reads = title.statusReads()
    val premium = title.premiumReads()
    if (reads.isEmpty() || premium.isEmpty()) return missing("the chat list title no longer weighs its status against Premium")
    val body = title.controlBody()
    if (reads.any { body.getOrNull(it + 2)?.controlRef() == LOCAL_STATUS_ID }) return missing("the emoji status is already kept on this phone")
    val tooHigh = reads.any { index ->
        (body[index + 1] as OneRegisterInstruction).registerA > 15 || (body[index] as FiveRegisterInstruction).registerC > 15
    }
    if (tooHigh) return missing("the chat list title keeps its status in a register past v15")
    val predecessors = ControlFlow.of(title).let { flow ->
        body.indices.flatMap { at -> (flow.normal[at] + flow.exceptional[at]).map { it to at } }.groupBy({ it.first }, { it.second })
    }
    (reads + premium).forEach { index ->
        if (predecessors[index + 2] != listOf(index + 1)) {
            return missing("${title.definingClass}->${title.name} jumps between its status read and its use")
        }
    }

    val sends = mutableClassDefBy(STICKER_CONTROLLER).methods.filter {
        it.name == SEND_STATUS_NAME && it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == SEND_STATUS_PARAMETERS
    }
    val send = sends.singleOrNull() ?: return missing("MessagesController no longer sends the account's own status in one place")
    if (send.localRegisterCount() < 1) return missing("the account's status send has no spare register")
    return LocalEmojiStatusPlan(title, send, null)
}

/** Gives LocalEmojiStatus' stubs Telegram's code. */
private fun BytecodePatchContext.writeStatusStubs() {
    writeStub(LOCAL_STATUS, "userId", 3, """
        check-cast p0, $STATUS_USER
        iget-wide v0, p0, $STATUS_USER->id:J
        return-wide v0
    """)
    writeStub(LOCAL_STATUS, "controllerUser", 3, """
        check-cast p0, $STATUS_BASE_CONTROLLER
        invoke-virtual {p0}, $STATUS_BASE_CONTROLLER->getUserConfig()$STATUS_USER_CONFIG
        move-result-object v0
        invoke-virtual {v0}, $STATUS_USER_CONFIG->getClientUserId()J
        move-result-wide v0
        return-wide v0
    """)
    writeStub(LOCAL_STATUS, "statusDocument", 3, """
        instance-of v0, p0, $SET_STATUS
        if-eqz v0, :other
        check-cast p0, $SET_STATUS
        iget-wide v0, p0, $SET_STATUS->document_id:J
        return-wide v0
        :other
        instance-of v0, p0, $NO_STATUS
        if-eqz v0, :gift
        const-wide/16 v0, 0x0
        return-wide v0
        :gift
        const-wide/16 v0, -0x1
        return-wide v0
    """)
    writeStub(LOCAL_STATUS, "statusUntil", 2, """
        check-cast p0, $EMOJI_STATUS_TYPE
        iget v0, p0, $EMOJI_STATUS_TYPE->until:I
        return v0
    """)
    writeStub(LOCAL_STATUS, "refresh", 6, """
        check-cast p0, $STATUS_BASE_CONTROLLER
        invoke-virtual {p0}, $STATUS_BASE_CONTROLLER->getUserConfig()$STATUS_USER_CONFIG
        move-result-object v0
        invoke-virtual {v0}, $STATUS_USER_CONFIG->getCurrentUser()$STATUS_USER
        move-result-object v0
        if-eqz v0, :done
        invoke-virtual {p0}, $STATUS_BASE_CONTROLLER->getNotificationCenter()$STATUS_NOTIFICATIONS
        move-result-object v1
        sget v2, $STATUS_NOTIFICATIONS->userEmojiStatusUpdated:I
        const/4 v3, 0x1
        new-array v3, v3, [Ljava/lang/Object;
        const/4 v4, 0x0
        aput-object v0, v3, v4
        invoke-virtual {v1, v2, v3}, $STATUS_NOTIFICATIONS->postNotificationName(I[Ljava/lang/Object;)V
        :done
        return-void
    """)
}

/** Takes a user and an animated flag, and both reads the user's status and asks about Premium. */
private fun Method.drawsTitleStatus(): Boolean {
    if (returnType != "V" || parameterTypes.map(CharSequence::toString) != listOf(STATUS_USER, "Z")) return false
    val refs = controlBody().mapNotNull { it.controlRef() }
    return LIST_STAR in refs && USER_STATUS_ID in refs && IS_PREMIUM_USER in refs
}

/** Each getter call whose boxed id comes straight back in a move-result. */
private fun Method.statusReads(): List<Int> = controlBody().let { body ->
    body.indices.filter { index ->
        body[index].opcode == Opcode.INVOKE_STATIC && body[index].controlRef() == USER_STATUS_ID &&
            body.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
    }
}

/** Each isPremiumUser call whose answer comes straight back in a move-result. */
private fun Method.premiumReads(): List<Int> = controlBody().let { body ->
    body.indices.filter { index ->
        body[index].opcode == Opcode.INVOKE_VIRTUAL && body[index].controlRef() == IS_PREMIUM_USER &&
            body.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT
    }
}
