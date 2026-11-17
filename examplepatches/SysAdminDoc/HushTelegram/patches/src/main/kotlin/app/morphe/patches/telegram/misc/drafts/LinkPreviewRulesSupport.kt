/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.drafts

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.parameterRegister
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.util.ControlFlow
import app.morphe.util.names.TelegramNames
import app.morphe.util.names.addInstructions
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origRef
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction

internal const val LINK_PREVIEW_RULES = "$EXTENSION_PACKAGE/misc/LinkPreviewRules;"
internal const val LINK_PREVIEW_RULES_SEND = "$LINK_PREVIEW_RULES->send(Ljava/lang/Object;)V"
internal const val RULES_SEND_HELPER = "Lorg/telegram/messenger/SendMessagesHelper;"
internal const val RULES_SEND_PARAMS = "Lorg/telegram/messenger/SendMessagesHelper\$SendMessageParams;"
internal const val RULES_INPUT_WEB_PAGE = "Lorg/telegram/tgnet/TLRPC\$TL_inputMediaWebPage;"
internal const val RULES_MEDIA_WEB_PAGE = "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaWebPage;"
internal const val RULES_PENDING_PAGE = "Lorg/telegram/tgnet/TLRPC\$TL_webPagePending;"
internal const val RULES_MESSAGE_MEDIA = "Lorg/telegram/tgnet/TLRPC\$MessageMedia;"
internal const val RULES_WEB_PAGE = "Lorg/telegram/tgnet/TLRPC\$WebPage;"
private const val RULES_STRING = "Ljava/lang/String;"
private const val RULES_URL = "$RULES_WEB_PAGE->url:$RULES_STRING"
private const val RULES_PAGE = "$RULES_MESSAGE_MEDIA->webpage:$RULES_WEB_PAGE"
private const val RULES_CHOSEN = "$RULES_SEND_PARAMS->mediaWebPage:$RULES_MEDIA_WEB_PAGE"

/** How far past the InputMediaWebPage's new-instance its url is filled from the picked preview's. */
private const val RULES_BUILD_REACH = 12

/**
 * The bodies of LinkPreviewRules' stubs, by name, with the registers each takes. They read the
 * send's parameters in source names, which writeStub turns into the build's.
 */
internal val LINK_PREVIEW_RULE_STUBS: List<Triple<String, Int, String>> = listOf(
    // The text of a plain new message with its preview on: no rich message, no retry, links searched.
    Triple("text", 2, """
        check-cast p0, $RULES_SEND_PARAMS
        iget-object v0, p0, $RULES_SEND_PARAMS->richMessage:Lorg/telegram/tgnet/tl/TL_iv${'$'}RichMessage;
        if-nez v0, :hush_none
        iget-object v0, p0, $RULES_SEND_PARAMS->retryMessageObject:Lorg/telegram/messenger/MessageObject;
        if-nez v0, :hush_none
        iget-boolean v0, p0, $RULES_SEND_PARAMS->searchLinks:Z
        if-eqz v0, :hush_none
        iget-object v0, p0, $RULES_SEND_PARAMS->message:$RULES_STRING
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """.trimIndent()),
    Triple("peer", 3, """
        check-cast p0, $RULES_SEND_PARAMS
        iget-wide v0, p0, $RULES_SEND_PARAMS->peer:J
        return-wide v0
    """.trimIndent()),
    Triple("extras", 2, """
        check-cast p0, $RULES_SEND_PARAMS
        iget-object v0, p0, $RULES_SEND_PARAMS->params:Ljava/util/HashMap;
        return-object v0
    """.trimIndent()),
    // The picked preview's address, "" for a picked preview without one, null when none was picked.
    Triple("chosen", 2, """
        check-cast p0, $RULES_SEND_PARAMS
        iget-object v0, p0, $RULES_CHOSEN
        if-eqz v0, :hush_none
        iget-object v0, v0, $RULES_PAGE
        if-eqz v0, :hush_blank
        iget-object v0, v0, $RULES_URL
        if-eqz v0, :hush_blank
        return-object v0
        :hush_blank
        const-string v0, ""
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """.trimIndent()),
    // A preview still to be made of the address, the size picked for the old one kept. Its flags
    // say the url is there, which is how a pending page carries it.
    Triple("point", 5, """
        check-cast p0, $RULES_SEND_PARAMS
        new-instance v0, $RULES_MEDIA_WEB_PAGE
        invoke-direct {v0}, $RULES_MEDIA_WEB_PAGE-><init>()V
        new-instance v1, $RULES_PENDING_PAGE
        invoke-direct {v1}, $RULES_PENDING_PAGE-><init>()V
        iput-object p1, v1, $RULES_URL
        const/4 v2, 0x1
        iput v2, v1, $RULES_WEB_PAGE->flags:I
        iput-object v1, v0, $RULES_PAGE
        iget-object v1, p0, $RULES_CHOSEN
        if-eqz v1, :hush_keep
        iget-boolean v2, v1, $RULES_MESSAGE_MEDIA->force_large_media:Z
        iput-boolean v2, v0, $RULES_MESSAGE_MEDIA->force_large_media:Z
        iget-boolean v2, v1, $RULES_MESSAGE_MEDIA->force_small_media:Z
        iput-boolean v2, v0, $RULES_MESSAGE_MEDIA->force_small_media:Z
        :hush_keep
        iput-object v0, p0, $RULES_CHOSEN
        return-void
    """.trimIndent()),
)

/** SendMessagesHelper.sendMessage(SendMessageParams), whose start Link preview rules' hook takes. */
internal class LinkPreviewRulesSite(val method: MutableMethod)

/**
 * Link preview rules' target (#79): SendMessagesHelper.sendMessage, which every typed message goes
 * through, and which sends the picked preview as an InputMediaWebPage holding its address. The hook
 * changes only what that preview's address is, so the check is that Telegram still builds the
 * InputMediaWebPage from the picked preview's own address, and that the classes and fields the
 * stubs name are all there. Nothing is edited here.
 */
internal fun BytecodePatchContext.resolveLinkPreviewRules(): LinkPreviewRulesSite {
    val helper = tgMutableClassDefByOrNull(RULES_SEND_HELPER) ?: throw PatchException("SendMessagesHelper is missing")
    val method = helper.methods.singleOrNull { it.origName == "sendMessage" && it.origReturnType == "V" &&
        it.origParameterTypes == listOf(RULES_SEND_PARAMS) && it.implementation != null &&
        !AccessFlags.STATIC.isSet(it.accessFlags) }
        ?: throw PatchException("SendMessagesHelper no longer sends a message from its send parameters the way 13.2 does")
    val instructions = method.implementation!!.instructions.toList()
    if (instructions.none { it.opcode == Opcode.IGET_OBJECT && it.origRef() == RULES_CHOSEN }) {
        throw PatchException("the send no longer reads the picked link preview")
    }
    if (!instructions.indices.any { at -> instructions.buildsPreviewFromPick(at) }) {
        throw PatchException("the send no longer sends the picked preview by its address")
    }
    // Index 0 takes the hook, so nothing may come back to it: only a branch or a handler reaches 0.
    val flow = ControlFlow.of(method)
    if (flow.instructions.indices.any { at -> 0 in flow.normal[at] || 0 in flow.exceptional[at] }) {
        throw PatchException("the send branches back to its start")
    }
    for ((type, what) in listOf(RULES_MEDIA_WEB_PAGE to "the picked preview", RULES_PENDING_PAGE to "a preview still to be made")) {
        val found = tgClassDefByOrNull(type) ?: throw PatchException("$what's class is missing")
        if (found.methods.none { it.name == "<init>" && it.parameterTypes.isEmpty() }) throw PatchException("$what can't be made empty")
    }
    for ((type, field, kind) in listOf(Triple(RULES_WEB_PAGE, "url", RULES_STRING), Triple(RULES_WEB_PAGE, "flags", "I"),
        Triple(RULES_MESSAGE_MEDIA, "webpage", RULES_WEB_PAGE), Triple(RULES_MESSAGE_MEDIA, "force_large_media", "Z"),
        Triple(RULES_MESSAGE_MEDIA, "force_small_media", "Z"))) {
        val owner = tgClassDefByOrNull(type) ?: throw PatchException("$type is missing")
        if (owner.fields.none { it.name == field && it.type == kind && !AccessFlags.STATIC.isSet(it.accessFlags) }) {
            throw PatchException("$type has no $field")
        }
    }
    // Every renamed name the stubs use, so a build without one is refused here rather than halfway.
    LINK_PREVIEW_RULE_STUBS.forEach { (_, _, smali) -> TelegramNames.tg(smali) }
    return LinkPreviewRulesSite(method)
}

/** Whether a new InputMediaWebPage at [at] gets its url from the picked preview's page, in order. */
private fun List<Instruction>.buildsPreviewFromPick(at: Int): Boolean {
    if (this[at].opcode != Opcode.NEW_INSTANCE || this[at].origRef() != RULES_INPUT_WEB_PAGE) return false
    val wanted = listOf(Opcode.IGET_OBJECT to RULES_PAGE, Opcode.IGET_OBJECT to RULES_URL,
        Opcode.IPUT_OBJECT to "$RULES_INPUT_WEB_PAGE->url:$RULES_STRING")
    var next = 0
    for (instruction in subList(at + 1, minOf(size, at + 1 + RULES_BUILD_REACH))) {
        val (opcode, reference) = wanted[next]
        if (instruction.opcode == opcode && instruction.origRef() == reference && ++next == wanted.size) return true
    }
    return false
}

/** Writes LinkPreviewRules' stubs, then hands the send's parameters to it at the send's start. */
internal fun BytecodePatchContext.applyLinkPreviewRules(site: LinkPreviewRulesSite) {
    // The stubs first: on their own nothing calls them.
    for ((name, registers, smali) in LINK_PREVIEW_RULE_STUBS) writeStub(LINK_PREVIEW_RULES, name, registers, smali)
    val params = site.method.parameterRegister(0)
    site.method.addInstructions(0, "invoke-static/range {$params .. $params}, $LINK_PREVIEW_RULES_SEND")
}
