/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.drafts

import app.morphe.util.names.origParameterTypes
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.requireParameterIntact
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.one
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.BitSet
import app.morphe.util.names.origRef
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origInterfaces
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origSuperclass
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

private const val PATCH = "Disable draft link previews"
internal const val WEB_PAGE_PREVIEW = "Lorg/telegram/tgnet/tl/TL_account\$getWebPagePreview;"
internal const val DRAFT_PREVIEWS = "$EXTENSION_PACKAGE/misc/DraftPreviews;"
internal const val LOCAL_DRAFTS = "$EXTENSION_PACKAGE/misc/LocalDrafts;"
internal const val SAVE_DRAFT = "Lorg/telegram/tgnet/TLRPC\$TL_messages_saveDraft;"
internal const val SEND_REQUEST = "Lorg/telegram/tgnet/ConnectionsManager;->sendRequest(Lorg/telegram/tgnet/TLObject;Lorg/telegram/tgnet/RequestDelegate;)I"
internal const val INPUT_REPLY_TO = "Lorg/telegram/tgnet/TLRPC\$InputReplyTo;"
/** Where a draft goes in a channel's direct messages you manage: the person's chat there, and no reply. */
internal const val MONO_FORUM_REPLY = "Lorg/telegram/tgnet/TLRPC\$TL_inputReplyToMonoForum;"
private const val INPUT_PEER = "Lorg/telegram/tgnet/TLRPC\$InputPeer;"
/** messages.saveDraft's effect:flags.7?long, the one piece of content held in its flags. */
internal const val DRAFT_EFFECT_FLAG = 0x80
/** media:flags.5?InputMedia, the other bit the request writes as it's set instead of from the field. */
internal const val DRAFT_MEDIA_FLAG = 0x20
/** What a saveDraft request holds besides where it goes and how it's shown; each one counts as content. */
internal val DRAFT_CONTENT = mapOf(
    "message" to "Ljava/lang/String;",
    "entities" to "Ljava/util/ArrayList;",
    "reply_to" to "Lorg/telegram/tgnet/TLRPC\$InputReplyTo;",
    "suggested_post" to "Lorg/telegram/tgnet/TLRPC\$SuggestedPost;",
    "rich_message" to "Lorg/telegram/tgnet/tl/TL_iv\$TL_inputRichMessage;",
    "media" to "Lorg/telegram/tgnet/TLRPC\$InputMedia;",
)
/** The rest: the chat, the flags, the effect they flag, and the link preview and media order switches. */
private val DRAFT_FRAME = mapOf("peer" to "Lorg/telegram/tgnet/TLRPC\$InputPeer;", "flags" to "I", "effect" to "J",
    "no_webpage" to "Z", "invert_media" to "Z")
private val MOVE_RESULTS = setOf(Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_WIDE, Opcode.MOVE_RESULT_OBJECT)
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
private const val STRING = "Ljava/lang/String;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"
private const val HASH_MAP = "Ljava/util/HashMap;"
private const val RUNNABLE = "Ljava/lang/Runnable;"
private const val UTILITIES = "Lorg/telegram/messenger/AndroidUtilities;"
private const val MESSAGES_CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
private const val WEB_PAGE = "Lorg/telegram/tgnet/TLRPC\$WebPage;"
private const val ENCRYPTED_CHAT = "Lorg/telegram/tgnet/TLRPC\$EncryptedChat;"
private const val BOT_WEB_PAGE = "Lorg/telegram/tgnet/TLRPC\$TL_botInlineMessageMediaWebPage;"
private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)

@Suppress("unused")
val disableDraftPreviewsPatch = bytecodePatch(
    name = PATCH,
    description = "Keeps Telegram from looking up a link's preview before you send the message. Sent messages still get" +
        " a preview. The same page has Keep drafts on this phone, so unsent drafts stop syncing to your other devices," +
        " and Keep searches on this phone, so what you type in the main search isn't sent to Telegram. Each starts" +
        " off. Turn them on in HushTelegram settings > Privacy.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("disableDraftPreviews")
        DraftPreviewTarget.entries.forEach { requireStatusMethod(it.capability) }
        requireStatusMethod("localDrafts")
        requireStatusMethod("localSearch")
        // Every builder, skip target and borrowed register is checked before the first edit.
        val hooks = resolveDraftPreviewHooks()
        val drafts = resolveLocalDraftHook()
        val search = resolveLocalSearch()
        shape(hooks.values.none { it.method === drafts.method }, "the draft upload shares a method with a preview builder")
        shape(search.edits.none { edit -> edit.method === drafts.method || hooks.values.any { it.method === edit.method } },
            "chat search shares a method with a draft hook")
        search.rehearse()
        // The runtime's stubs first: on their own nothing calls them.
        writeStub(LOCAL_DRAFTS, "carries", 2, drafts.reader)
        writeStub(LOCAL_DRAFTS, "clear", 3, drafts.emptier)
        search.lookUp?.let { writeStub(LOCAL_SEARCH, "lookUp", PHONE_MATCH_REGISTERS, it) }
        drafts.method.addInstructionsAtControlFlowLabel(drafts.index, drafts.code,
            ExternalLabel("hush_done", drafts.method.getInstruction(drafts.finish)))
        enableCapability("localDrafts")
        search.apply()
        enableCapability("localSearch")
        for ((target, hook) in hooks) {
            hook.method.addInstructionsAtControlFlowLabel(hook.index, hook.code,
                ExternalLabel("hush_done", hook.method.getInstruction(hook.finish)))
            when (target) {
                DraftPreviewTarget.CHAT -> enableCapability("chatDraftPreviews")
                DraftPreviewTarget.SHARE -> enableCapability("shareDraftPreviews")
                DraftPreviewTarget.POLL -> enableCapability("pollLinkPreviews")
                DraftPreviewTarget.STORY -> enableCapability("storyLinkPreviews")
                DraftPreviewTarget.BOT_SHARE -> enableCapability("botSharePreviews")
            }
        }
        enableStatus("disableDraftPreviews")
    }
}

internal enum class DraftPreviewTarget(val capability: String, val hook: String) {
    CHAT("chatDraftPreviews", "skipChatPreview"),
    SHARE("shareDraftPreviews", "skipSharePreview"),
    POLL("pollLinkPreviews", "skipPollPreview"),
    STORY("storyLinkPreviews", "skipStoryLinkPreview"),
    BOT_SHARE("botSharePreviews", "skipBotSharePreview"),
}

/** [finish] is where a skipped preview goes: the builder's own exit for a draft that has no link to preview. */
internal data class DraftPreviewHook(val method: MutableMethod, val index: Int, val finish: Int, val code: String, val size: Int)

/**
 * Sorts every getWebPagePreview builder by its kept shape. Link opening (Browser) and the refresh
 * of received messages' previews are left as they are; any other builder refuses the patch, so a
 * new compose surface can't go unnoticed.
 */
internal fun BytecodePatchContext.resolveDraftPreviewHooks(): Map<DraftPreviewTarget, DraftPreviewHook> {
    requireRuntimeHooks()
    val builders = mutableListOf<Method>()
    forEachClassMentioning(Mention.reference(WEB_PAGE_PREVIEW)) { classDef ->
        if (classDef.origType.startsWith("Lapp/hushtelegram/extension/")) return@forEachClassMentioning
        classDef.methods.filterTo(builders) { it.constructs(WEB_PAGE_PREVIEW) }
    }
    val found = DraftPreviewTarget.entries.associateWith { mutableListOf<Method>() }
    for (builder in builders) {
        val target = when {
            builder.origDefiningClass == MESSAGES_CONTROLLER && builder.origName == "reloadWebPages" -> null
            builder.isStatic() && builder.params().take(2) == listOf("Landroid/content/Context;", "Landroid/net/Uri;") -> null
            builder.isStatic() && builder.hasShape(listOf(builder.definingClass, CHAR_SEQUENCE, MESSAGES_CONTROLLER, "Z"), "V") -> DraftPreviewTarget.CHAT
            !builder.isStatic() && builder.hasShape(listOf(CHAR_SEQUENCE, "Z"), "V") -> DraftPreviewTarget.SHARE
            !builder.isStatic() && builder.origReturnType == "V" && builder.params().size == 2 && builder.params()[0] == "I" -> DraftPreviewTarget.POLL
            !builder.isStatic() && builder.origName == "run" && builder.hasShape(emptyList(), "V") &&
                builder.instructions().any { it.opcode == Opcode.INSTANCE_OF && it.reference() == BOT_WEB_PAGE } -> DraftPreviewTarget.BOT_SHARE
            builder.storySheet() != null -> DraftPreviewTarget.STORY
            else -> refuse("unknown link preview builder ${builder.definingClass}->${builder.name}")
        }
        if (target != null) found.getValue(target) += builder
    }
    val hooks = linkedMapOf<DraftPreviewTarget, DraftPreviewHook>()
    for ((target, matches) in found) {
        val match = matches.one("$target preview builder", ::refuse)
        val method = tgMutableClassDefBy(match.definingClass).methods.single { it.sameSignature(match) }
        hooks[target] = when (target) {
            DraftPreviewTarget.CHAT -> chatHook(method)
            DraftPreviewTarget.SHARE -> shareHook(method)
            DraftPreviewTarget.POLL -> pollHook(method)
            DraftPreviewTarget.STORY -> storyHook(method)
            DraftPreviewTarget.BOT_SHARE -> botShareHook(method)
        }
    }
    shape(hooks.values.map { it.method }.distinct().size == hooks.size, "two preview builders share a method")
    return hooks
}

/** ChatActivity's link search, inlined with its cache: the hook sits on the secret-chat question in front of the request. */
private fun chatHook(method: MutableMethod): DraftPreviewHook {
    val body = method.instructions()
    val fragment = method.parameterRegisterNumber(0)
    val request = requestSite(method)
    val secret = body.indices.filter { body[it].opcode == Opcode.IGET_OBJECT && body[it].field()?.let { field ->
        field.origDefiningClass == method.origDefiningClass && field.origType == ENCRYPTED_CHAT } == true }.one("chat secret-chat read", ::refuse)
    val secretBranch = secret + 1
    val mode = secret + 2
    shape(body[secret].namedRegisters() == listOf(body[secret].namedRegisters()[0], fragment) &&
        body.getOrNull(secretBranch)?.opcode == Opcode.IF_EQZ && body[secretBranch].namedRegisters() == listOf(body[secret].namedRegisters()[0]) &&
        request in ControlFlow.of(method).normal[secretBranch] &&
        body.getOrNull(mode)?.opcode == Opcode.IGET && body[mode].field()?.let { it.origDefiningClass == MESSAGES_CONTROLLER && it.origName == "secretWebpagePreview" } == true &&
        body[mode].namedRegisters()[1] == method.parameterRegisterNumber(2), "secret-chat preview question no longer leads to the request")
    // A draft with no links stores the empty result and posts Telegram's own clear. That one sits in the
    // link search's try block, whose handler reads registers the hook holds differently, so a skip goes to
    // the same clear Telegram posts after the block for text too short to hold a link.
    val store = body.indices.filter { body[it].opcode == Opcode.IPUT_OBJECT && body[it].field()?.let { field ->
        field.origDefiningClass == method.origDefiningClass && field.origType == ARRAY_LIST } == true &&
        body[it].namedRegisters().getOrNull(1) == fragment }.one("found link list store", ::refuse)
    val noLinks = store + 1
    shape(body.getOrNull(noLinks)?.opcode == Opcode.IF_NEZ && body[noLinks].namedRegisters() == listOf(body[store].namedRegisters()[0]) &&
        clearRunnable(method, store + 2, fragment), "no-link clear changed")
    val flow = ControlFlow.of(method)
    val clear = body[store + 2].reference()
    val finish = body.indices.filter { it != store + 2 && clearRunnable(method, it, fragment) && body[it].reference() == clear &&
        (it..it + 3).all { at -> flow.exceptional[at].isEmpty() } }.one("no-link clear outside the link search", ::refuse)
    shape(finish > secret, "no-link clear outside the link search moved in front of the request")
    method.requireParameterIntact(PATCH, 0, listOf(secret, finish + 2))
    // The links were stored before the hook. A draft with none stores null there, and so does a skip,
    // or the same links would read as unchanged and fetch nothing once the switch is off again.
    shape(fragment <= 15, "chat fragment register v$fragment is out of iput-object's reach")
    val links = body[store].field()!!
    return gate(DraftPreviewTarget.CHAT, method, secret, finish, request,
        forget = { scratch -> "const/4 v$scratch, 0x0\niput-object v$scratch, v$fragment, $links" })
}

/** The share sheet's comment field: after it has links, before it joins them for the request. */
private fun shareHook(method: MutableMethod): DraftPreviewHook {
    val body = method.instructions()
    val flow = ControlFlow.of(method)
    val request = requestSite(method)
    val join = body.indices.filter { body[it].call()?.let { call -> call.origDefiningClass == "Landroid/text/TextUtils;" &&
        call.origName == "join" && call.hasShape(listOf(CHAR_SEQUENCE, "Ljava/lang/Iterable;"), STRING) } == true }.one("share link join", ::refuse)
    val index = join - 1
    val skip = index - 1
    val emptyBranch = index - 2
    val empty = index - 4
    val nullBranch = index - 5
    val links = body.getOrNull(nullBranch)?.namedRegisters()?.singleOrNull()
    shape(body.getOrNull(index)?.opcode == Opcode.CONST_STRING && body[index].string() == " " &&
        body[join].namedRegisters() == listOf(body[index].namedRegisters()[0], links) &&
        body.getOrNull(skip)?.opcode in GOTOS && body.getOrNull(emptyBranch)?.opcode == Opcode.IF_EQZ &&
        index in flow.normal[emptyBranch] && body.getOrNull(nullBranch)?.opcode == Opcode.IF_EQZ &&
        body.getOrNull(empty)?.call()?.let { it.origDefiningClass == ARRAY_LIST && it.origName == "isEmpty" } == true &&
        body[empty].namedRegisters() == listOf(links), "share link presence checks changed")
    val finish = flow.normal[skip].single()
    shape(finish in flow.normal[nullBranch] && finish > request, "share no-link reset is no longer shared")
    // The reset cancels the pending request and drops the preview it held.
    val thisRegister = method.parameterRegisterNumber(0) - 1
    shape(body[finish].call()?.let { it.origDefiningClass == method.origDefiningClass && it.hasShape(emptyList(), "V") } == true &&
        body[finish].namedRegisters() == listOf(thisRegister) && body.getOrNull(finish + 1)?.opcode == Opcode.IPUT_OBJECT &&
        body[finish + 1].field()?.let { it.origDefiningClass == method.origDefiningClass && it.origType == WEB_PAGE } == true,
        "share no-link reset changed")
    // The sheet keeps the links it last saw in a list it empties and refills before the hook. A
    // draft with none leaves it empty, and so does a skip, so the same links fetch once the switch is off.
    val reset = body.indices.filter { body[it].call()?.let { call -> call.origDefiningClass == ARRAY_LIST && call.origName == "clear" &&
        call.parameterTypes.isEmpty() } == true }.one("share link list reset", ::refuse)
    val held = body[reset].namedRegisters().single()
    val load = (reset - 1 downTo 0).firstOrNull { held in body[it].writes() } ?: refuse("share link list isn't loaded")
    shape(reset < index && body[load].opcode == Opcode.IGET_OBJECT && body[load].namedRegisters()[1] == thisRegister &&
        body[load].field()?.let { it.origDefiningClass == method.origDefiningClass && it.origType == ARRAY_LIST } == true &&
        body.getOrNull(reset + 2)?.call()?.let { it.origDefiningClass == ARRAY_LIST && it.origName == "addAll" } == true &&
        body[reset + 2].namedRegisters() == listOf(held, links), "share link list no longer holds the links it saw")
    shape(thisRegister <= 15, "share sheet register v$thisRegister is out of iget-object's reach")
    method.requireThisIntact(PATCH, listOf(index))
    val list = body[load].field()!!
    return gate(DraftPreviewTarget.SHARE, method, index, finish, request,
        forget = { scratch -> "iget-object v$scratch, v$thisRegister, $list\ninvoke-virtual {v$scratch}, $ARRAY_LIST->clear()V" })
}

/** A link attached to a poll, with WebPageLoader.get inlined: the hook takes the cache miss only. */
private fun pollHook(method: MutableMethod): DraftPreviewHook {
    val body = method.instructions()
    val flow = ControlFlow.of(method)
    val request = requestSite(method)
    val contains = body.indices.filter { body[it].call()?.let { call -> call.origDefiningClass == HASH_MAP && call.origName == "containsKey" } == true }
    shape(contains.size == 2, "poll preview loader has ${contains.size} cache checks")
    val (cached, loading) = contains
    val cachedBranch = cached + 2
    val index = loading
    shape(body.getOrNull(cached + 1)?.opcode == Opcode.MOVE_RESULT && body.getOrNull(cachedBranch)?.opcode == Opcode.IF_EQZ &&
        index in flow.normal[cachedBranch] && body.getOrNull(index - 1)?.opcode in GOTOS &&
        body.getOrNull(request - 1)?.opcode in GOTOS && body.getOrNull(request - 2)?.opcode == Opcode.IF_EQZ &&
        request in flow.normal[request - 2], "poll preview cache and loading checks changed")
    val finish = flow.normal[index - 1].single()
    shape(flow.normal[request - 1].single() == finish && finish > request, "poll cache hit and pending load no longer meet")
    // There Telegram shows the link without a preview: checkPollLinkMedia(link, false).
    val media = method.parameterRegisterNumber(1)
    val linkType = body.indices.filter { body[it].opcode == Opcode.INSTANCE_OF && body[it].namedRegisters()[1] == media }
        .one("poll attached link test", ::refuse).let { body[it].reference() }
    val link = body.indices.filter { body[it].opcode == Opcode.CHECK_CAST && body[it].reference() == linkType }.one("poll link cast", ::refuse)
    val linkRegister = body[link].namedRegisters()[0]
    val thisRegister = method.parameterRegisterNumber(0) - 1
    val check = body.getOrNull(finish + 1)?.call()
    shape(body[finish].opcode == Opcode.CONST_4 && (body[finish] as NarrowLiteralInstruction).narrowLiteral == 0 &&
        check != null && check.origDefiningClass == method.origDefiningClass && check.origReturnType == "V" &&
        check.params() == listOf(linkType, "Z") &&
        body[finish + 1].namedRegisters() == listOf(thisRegister, linkRegister, body[finish].namedRegisters()[0]) &&
        link < cached, "poll link check without preview changed")
    return gate(DraftPreviewTarget.POLL, method, index, finish, request)
}

/**
 * The story link sheet a preview builder belongs to: its own class for 13.1.1's static builder, or,
 * where 13.2 inlines that builder into the runnable the sheet posts, the sheet that runnable captured
 * and reads right after making the request. Null for any other builder.
 */
internal fun Method.storySheet(): String? {
    if (isStatic()) return definingClass.takeIf { hasShape(listOf(definingClass), "V") }
    if (origName != "run" || !hasShape(emptyList(), "V")) return null
    val body = instructions()
    val request = body.indexOfFirst { it.opcode == Opcode.NEW_INSTANCE && it.reference() == WEB_PAGE_PREVIEW }
    val read = body.getOrNull(request + 2)?.takeIf { request >= 0 && it.opcode == Opcode.IGET_OBJECT } ?: return null
    val field = read.field() ?: return null
    return field.type.takeIf { field.definingClass == definingClass && read.namedRegisters()[1] == implementation!!.registerCount - 1 }
}

/** The story link sheet: the builder is a delayed runnable, so the hook sits where its URL check would post it. */
private fun BytecodePatchContext.storyHook(builder: MutableMethod): DraftPreviewHook {
    val sheet = builder.storySheet()!!
    val checks = tgMutableClassDefBy(sheet).methods.filter { it.isStatic() && it.hasShape(listOf(sheet, STRING), "V") &&
        it.instructions().any { instruction -> instruction.call()?.let { call -> call.origDefiningClass == UTILITIES && call.origName == "cancelRunOnUIThread" } == true } }
    val method = checks.one("story link URL check", ::refuse)
    val body = method.instructions()
    val flow = ControlFlow.of(method)
    val cancel = body.indices.filter { body[it].call()?.let { call -> call.origDefiningClass == UTILITIES && call.origName == "cancelRunOnUIThread" } == true }.one("story preview cancel", ::refuse)
    val post = body.indices.filter { body[it].call()?.let { call -> call.origDefiningClass == UTILITIES && call.origName == "runOnUIThread" &&
        call.hasShape(listOf(RUNNABLE, "J"), "V") } == true }.one("story preview post", ::refuse)
    val runnable = body[cancel].namedRegisters().single()
    shape(body[post].namedRegisters()[0] == runnable, "story URL check posts another runnable")
    val load = (cancel - 1 downTo 0).firstOrNull { runnable in body[it].writes() } ?: refuse("story preview runnable isn't loaded")
    shape(body[load].opcode == Opcode.IGET_OBJECT && (load + 1 until post).none { runnable in body[it].writes() },
        "story URL check doesn't post the runnable it read")
    val runnableType = body[load].field()!!.type
    // 13.2's runnable is the builder itself.
    shape(body[load].namedRegisters()[1] == method.parameterRegisterNumber(0) && (runnableType == builder.definingClass && builder.origName == "run" ||
        tgClassDefByOrNull(runnableType)?.methods?.any { it.origName == "run" && it.instructions().any { instruction ->
            instruction.call()?.let { call -> call.origDefiningClass == sheet && call.origName == builder.origName } == true } } == true),
        "story preview runnable no longer builds the request")
    val result = body.indices.filter { body[it].opcode == Opcode.MOVE_RESULT && body.getOrNull(it - 1)?.call()?.let { call ->
        call.origDefiningClass == sheet && call.hasShape(listOf(STRING), "Z") } == true }.one("story containsURL result", ::refuse)
    val hasUrl = body[result].namedRegisters().single()
    val branch = cancel + 3
    val index = branch + 1
    shape(body.getOrNull(branch)?.opcode == Opcode.IF_EQZ && body[branch].namedRegisters() == listOf(hasUrl) &&
        result < cancel && index < post, "story URL check no longer branches before the post")
    val finish = flow.normal[branch].single { it != index }
    shape(finish > post, "story no-URL path no longer follows the post")
    // The Done button still follows the real URL check after a skip.
    val enable = body.indices.filter { body[it].call()?.origName == "setEnabled" }.one("story Done button", ::refuse)
    shape(enable > finish && body[enable].namedRegisters().last() == hasUrl &&
        body.indices.none { it > result && hasUrl in body[it].writes() }, "story Done button no longer reads the URL check")
    method.requireParameterIntact(PATCH, 0, listOf(index, finish))
    return gate(DraftPreviewTarget.STORY, method, index, finish, post)
}

/**
 * A message a mini app prepared for sharing. A skip hands Telegram's own callback no preview, the
 * answer it gets when the server has none, so the sheet opens without one.
 */
private fun BytecodePatchContext.botShareHook(method: MutableMethod): DraftPreviewHook {
    val body = method.instructions()
    val flow = ControlFlow.of(method)
    val request = requestSite(method)
    val create = (request - 1 downTo 0).firstOrNull { body[it].opcode == Opcode.NEW_INSTANCE } ?: refuse("bot share callback missing")
    val callback = body[create].namedRegisters().single()
    val callbackType = body[create].reference()!!
    val initialize = (create + 1 until request).firstOrNull { body[it].call()?.let { call -> call.origDefiningClass == callbackType && call.origName == "<init>" } == true }
        ?: refuse("bot share callback isn't initialized before the request")
    val index = initialize + 1
    shape((create + 1 until index).none { callback in body[it].writes() }, "bot share callback register changes before the request")
    // 13.2 names the callback's run as the build names its interface's, which the table only maps on the interface.
    val run = tgClassDefByOrNull(callbackType)?.let { owner -> owner.methods.singleOrNull { m ->
        m.hasShape(listOf("Ljava/lang/Object;"), "V") && (m.origName == "run" || owner.origInterfaces.any { face ->
            tgClassDefByOrNull(face)?.methods?.any { it.origName == "run" && it.name == m.name && it.hasShape(listOf("Ljava/lang/Object;"), "V") } == true })
    } }
    shape(run != null && !run.isStatic() && AccessFlags.PUBLIC.isSet(run.accessFlags) && run.instructions().take(2).let { first ->
        first.size == 2 && first[1].opcode == Opcode.CHECK_CAST && first[1].reference() == WEB_PAGE } == true,
        "bot share callback no longer takes the loaded preview")
    val send = (request until body.size).firstOrNull { body[it].call()?.let { call -> call.origDefiningClass == "Lorg/telegram/tgnet/ConnectionsManager;" &&
        call.origName == "sendRequestTyped" } == true } ?: refuse("bot share preview request isn't sent")
    val leave = (send until body.size).firstOrNull { body[it].opcode in GOTOS } ?: refuse("bot share preview request has no exit")
    val finish = flow.normal[leave].single()
    shape(body[finish].opcode == Opcode.RETURN_VOID, "bot share preview exit has more work after it")
    val (answer, empty) = method.freeLocalsAt(PATCH, index, 2, targets = listOf(finish), highest = 15)
    val code = """
        invoke-static {}, $DRAFT_PREVIEWS->${DraftPreviewTarget.BOT_SHARE.hook}()Z
        move-result v$answer
        if-eqz v$answer, :hush_fetch
        move-object/from16 v$answer, v$callback
        const/4 v$empty, 0x0
        invoke-virtual {v$answer, v$empty}, $callbackType->${run!!.name}(Ljava/lang/Object;)V
        goto/16 :hush_done
        :hush_fetch
        nop
    """.trimIndent()
    requireGuarded(method, index, request)
    return DraftPreviewHook(method, index, finish, code, 8)
}

/** A skip to [finish]; [forget], given a free register, is two instructions run on a skip before it leaves. */
private fun gate(target: DraftPreviewTarget, method: MutableMethod, index: Int, finish: Int, request: Int,
                 forget: ((Int) -> String)? = null): DraftPreviewHook {
    requireGuarded(method, index, request)
    val answer = method.freeLocalsAt(PATCH, index, 1, targets = listOf(finish), highest = if (forget == null) 255 else 15).single()
    val ask = "invoke-static {}, $DRAFT_PREVIEWS->${target.hook}()Z\nmove-result v$answer"
    if (forget == null) return DraftPreviewHook(method, index, finish, "$ask\nif-nez v$answer, :hush_done", 3)
    return DraftPreviewHook(method, index, finish,
        "$ask\nif-eqz v$answer, :hush_fetch\n${forget(answer)}\ngoto/16 :hush_done\n:hush_fetch\nnop", 7)
}

/** Nothing, thrown or not, reaches the request without passing the hook first. */
private fun requireGuarded(method: Method, hook: Int, request: Int) {
    val flow = ControlFlow.of(method)
    val seen = BitSet()
    val pending = ArrayDeque<Int>()
    pending += 0
    while (pending.isNotEmpty()) {
        val index = pending.removeFirst()
        if (index == hook || seen[index]) continue
        seen.set(index)
        pending += flow.normal[index]
        pending += flow.exceptional[index]
    }
    shape(!seen[request], "${method.definingClass}->${method.name} reaches its preview request without the switch")
}

/** Telegram's clear: new runnable(fragment, case), posted to the UI thread, then return. */
private fun clearRunnable(method: Method, at: Int, fragment: Int): Boolean {
    val body = method.instructions()
    val runnable = body.getOrNull(at)?.takeIf { it.opcode == Opcode.NEW_INSTANCE } ?: return false
    val type = runnable.reference()
    val register = runnable.namedRegisters().single()
    val case = body.getOrNull(at + 1)?.takeIf { it.opcode == Opcode.CONST_16 || it.opcode == Opcode.CONST_4 } ?: return false
    val initialize = body.getOrNull(at + 2)?.call() ?: return false
    val post = body.getOrNull(at + 3)?.call() ?: return false
    return initialize.origDefiningClass == type && initialize.origName == "<init>" &&
        initialize.params() == listOf(method.definingClass, "I") &&
        body[at + 2].namedRegisters() == listOf(register, fragment, case.namedRegisters()[0]) &&
        post.origDefiningClass == UTILITIES && post.origName == "runOnUIThread" && post.params() == listOf(RUNNABLE) &&
        body[at + 3].namedRegisters() == listOf(register) && body.getOrNull(at + 4)?.opcode == Opcode.RETURN_VOID
}

private fun requestSite(method: Method): Int {
    val body = method.instructions()
    val index = body.indices.filter { body[it].opcode == Opcode.NEW_INSTANCE && body[it].reference() == WEB_PAGE_PREVIEW }
        .one("${method.definingClass}->${method.name} preview request", ::refuse)
    shape(body.getOrNull(index + 1)?.call()?.let { it.origDefiningClass == WEB_PAGE_PREVIEW && it.origName == "<init>" && it.parameterTypes.isEmpty() } == true &&
        body[index + 1].namedRegisters() == body[index].namedRegisters(), "preview request constructor changed")
    return index
}

/**
 * The draft upload's send at [index] and the instruction after it, [finish]; [reader] and [emptier]
 * are the bodies written for LocalDrafts.carries and LocalDrafts.clear.
 */
internal data class LocalDraftHook(val method: MutableMethod, val index: Int, val finish: Int, val code: String,
                                   val reader: String, val emptier: String)

/**
 * MediaDataController.saveDraft keeps a draft on the phone and then sends it to Telegram's server
 * as messages.saveDraft. That send is the only way a draft leaves, so the hook sits on it, after the
 * request is filled in. The runtime takes the content out of a draft it keeps, so what goes is an
 * empty draft for the same chat, which clears any copy the server had. Only when it can't does the
 * draft skip the send and go on to what Telegram does next, re-sorting the chat list. Every field of
 * the request is known here: one Telegram adds refuses the patch, since it could be a new kind of
 * content the reader wouldn't see or the emptier wouldn't take out.
 */
internal fun BytecodePatchContext.resolveLocalDraftHook(): LocalDraftHook {
    val owner = tgClassDefByOrNull(LOCAL_DRAFTS)
    shape(owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags), "no public local drafts runtime")
    // One method of each name, so writing a stub can't pick another or fail once the gate is in.
    for (name in listOf("keepOnPhone", "carries", "clear")) {
        val named = owner!!.methods.filter { it.origName == name }
        shape(named.size == 1 && named.single().let { it.hasShape(listOf("Ljava/lang/Object;"), "Z") && it.isStatic() &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.NATIVE.isSet(it.accessFlags) &&
            !AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.implementation != null },
            "no single callable public static runtime $name")
    }
    val request = tgClassDefByOrNull(SAVE_DRAFT)
    shape(request != null && AccessFlags.PUBLIC.isSet(request.accessFlags), "no public draft request")
    val fields = request!!.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
    shape(fields.associate { it.name to it.type } == DRAFT_CONTENT + DRAFT_FRAME && fields.size == DRAFT_CONTENT.size + DRAFT_FRAME.size &&
        fields.all { AccessFlags.PUBLIC.isSet(it.accessFlags) }, "draft request fields changed")
    // A reply counts as content only when it's to a message, as Telegram's own empty-draft check has it.
    // The other kind is where a draft goes in a channel's direct messages you manage, kept when one is emptied.
    val reply = tgClassDefByOrNull(INPUT_REPLY_TO)
    shape(reply != null && AccessFlags.PUBLIC.isSet(reply.accessFlags) && listOf("reply_to_msg_id" to "I", "monoforum_peer_id" to INPUT_PEER)
        .all { (name, type) -> reply.fields.any { it.origName == name && it.origType == type && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
            !AccessFlags.STATIC.isSet(it.accessFlags) } }, "draft reply fields changed")
    val direct = tgClassDefByOrNull(MONO_FORUM_REPLY)
    shape(direct != null && AccessFlags.PUBLIC.isSet(direct.accessFlags) && direct.origSuperclass == INPUT_REPLY_TO &&
        direct.methods.any { it.origName == "<init>" && it.parameterTypes.isEmpty() && AccessFlags.PUBLIC.isSet(it.accessFlags) },
        "direct messages draft target changed")
    val uploads = mutableListOf<Method>()
    forEachClassMentioning(Mention.reference(SAVE_DRAFT)) { classDef ->
        if (classDef.origType.startsWith("Lapp/hushtelegram/extension/")) return@forEachClassMentioning
        classDef.methods.filterTo(uploads) { it.constructs(SAVE_DRAFT) }
    }
    val found = uploads.one("draft upload", ::refuse)
    val method = tgMutableClassDefBy(found.definingClass).methods.single { it.sameSignature(found) }
    val body = method.instructions()
    val created = body.indices.filter { body[it].opcode == Opcode.NEW_INSTANCE && body[it].reference() == SAVE_DRAFT }
        .one("draft request", ::refuse)
    val held = body[created].namedRegisters().single()
    shape(body.getOrNull(created + 1)?.call()?.let { it.origDefiningClass == SAVE_DRAFT && it.origName == "<init>" && it.parameterTypes.isEmpty() } == true &&
        body[created + 1].namedRegisters() == listOf(held), "draft request constructor changed")
    val index = body.indices.filter { body[it].reference() == SEND_REQUEST }.one("draft upload send", ::refuse)
    shape(body[index].opcode == Opcode.INVOKE_VIRTUAL && body[index].namedRegisters().getOrNull(1) == held && index > created,
        "draft upload no longer sends the request it built")
    // Every way to the send passes the constructor, and nothing on the way puts anything else in its register.
    requireGuarded(method, created, index)
    shape(keeps(method, created, index, held), "draft request register is written again before the send")
    // The send's answer is dropped, so a draft kept back leaves nothing unset.
    val finish = index + 1
    shape(body.getOrNull(finish) != null && body[finish].opcode !in MOVE_RESULTS, "draft upload reads the send's answer")
    // An effect goes in with its flag bit, and that bit is what the reader checks.
    val effect = body.indices.filter { body[it].opcode == Opcode.IPUT_WIDE && body[it].reference() == "$SAVE_DRAFT->effect:J" }
        .one("draft effect store", ::refuse)
    val flag = body.getOrNull(effect + 2)
    shape(body[effect].namedRegisters().getOrNull(1) == held &&
        body.getOrNull(effect + 1)?.opcode == Opcode.IGET && body[effect + 1].reference() == "$SAVE_DRAFT->flags:I" &&
        flag?.opcode == Opcode.OR_INT_LIT16 && (flag as NarrowLiteralInstruction).narrowLiteral == DRAFT_EFFECT_FLAG &&
        body.getOrNull(effect + 3)?.opcode == Opcode.IPUT && body[effect + 3].reference() == "$SAVE_DRAFT->flags:I" &&
        body[effect + 3].namedRegisters().getOrNull(1) == held, "draft effect no longer sets flag $DRAFT_EFFECT_FLAG")
    val answer = method.freeLocalsAt(PATCH, index, 1, targets = listOf(finish), highest = 255).single()
    val code = listOf(
        "invoke-static/range {v$held .. v$held}, $LOCAL_DRAFTS->keepOnPhone(Ljava/lang/Object;)Z",
        "move-result v$answer",
        "if-nez v$answer, :hush_done",
    ).joinToString("\n")
    return LocalDraftHook(method, index, finish, code, draftReader(), draftEmptier())
}

/**
 * LocalDrafts.carries, with the request in p0 and v0 to work in: true when it holds any [DRAFT_CONTENT]
 * or a flagged effect. A reply counts when it's to a message, so a direct messages target alone doesn't.
 */
private fun draftReader(): String {
    val lines = mutableListOf("check-cast p0, $SAVE_DRAFT")
    for ((name, type) in DRAFT_CONTENT) {
        lines += "iget-object v0, p0, $SAVE_DRAFT->$name:$type"
        lines += when (name) {
            "message" -> listOf("invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z",
                "move-result v0", "if-eqz v0, :carries")
            "entities" -> listOf("if-eqz v0, :no_entities", "invoke-virtual {v0}, $type->isEmpty()Z",
                "move-result v0", "if-eqz v0, :carries", ":no_entities")
            "reply_to" -> listOf("if-eqz v0, :no_reply", "iget v0, v0, $INPUT_REPLY_TO->reply_to_msg_id:I",
                "if-nez v0, :carries", ":no_reply")
            else -> listOf("if-nez v0, :carries")
        }
    }
    lines += listOf("iget v0, p0, $SAVE_DRAFT->flags:I", "and-int/lit16 v0, v0, 0x${DRAFT_EFFECT_FLAG.toString(16)}",
        "if-nez v0, :carries", "const/4 v0, 0x0", "return v0", ":carries", "const/4 v0, 0x1", "return v0")
    return lines.joinToString("\n")
}

/**
 * LocalDrafts.clear, with the request in p0 and v0 and v1 to work in. Every piece of [DRAFT_CONTENT]
 * comes out and the two flag bits the request doesn't work out for itself go: what's left is the empty
 * draft Telegram sends to clear one, for the same chat. A reply becomes no reply, except that in a
 * channel's direct messages you manage the draft keeps the person's chat it's for, as Telegram's own
 * clear does there. The chat and the preview and media order switches stay as they were.
 */
private fun draftEmptier(): String {
    val lines = mutableListOf("check-cast p0, $SAVE_DRAFT", "const-string v0, \"\"", "iput-object v0, p0, $SAVE_DRAFT->message:$STRING",
        "const/4 v0, 0x0")
    for ((name, type) in DRAFT_CONTENT) if (name != "message" && name != "reply_to") lines += "iput-object v0, p0, $SAVE_DRAFT->$name:$type"
    lines += listOf(
        "iget v0, p0, $SAVE_DRAFT->flags:I",
        "and-int/lit16 v0, v0, -0x${(DRAFT_EFFECT_FLAG or DRAFT_MEDIA_FLAG).inc().toString(16)}",
        "iput v0, p0, $SAVE_DRAFT->flags:I",
        "const-wide/16 v0, 0x0",
        "iput-wide v0, p0, $SAVE_DRAFT->effect:J",
        "iget-object v0, p0, $SAVE_DRAFT->reply_to:$INPUT_REPLY_TO",
        "if-eqz v0, :done",
        "iget-object v1, v0, $INPUT_REPLY_TO->monoforum_peer_id:$INPUT_PEER",
        "if-eqz v1, :no_reply",
        "instance-of v0, v0, $MONO_FORUM_REPLY",
        "if-nez v0, :done",
        "new-instance v0, $MONO_FORUM_REPLY",
        "invoke-direct {v0}, $MONO_FORUM_REPLY-><init>()V",
        "iput-object v1, v0, $INPUT_REPLY_TO->monoforum_peer_id:$INPUT_PEER",
        "iput-object v0, p0, $SAVE_DRAFT->reply_to:$INPUT_REPLY_TO",
        "goto :done",
        ":no_reply",
        "const/4 v0, 0x0",
        "iput-object v0, p0, $SAVE_DRAFT->reply_to:$INPUT_REPLY_TO",
        ":done",
        "const/4 v0, 0x1",
        "return v0",
    )
    return lines.joinToString("\n")
}

/** No instruction on a path from [created] to [use] writes [register] again. */
private fun keeps(method: Method, created: Int, use: Int, register: Int): Boolean {
    val flow = ControlFlow.of(method)
    val body = method.instructions()
    val next = body.indices.map { flow.normal[it] + flow.exceptional[it] }
    val previous = body.indices.map { mutableListOf<Int>() }
    next.forEachIndexed { from, targets -> targets.forEach { previous[it] += from } }
    fun reach(start: List<Int>, edges: List<List<Int>>, stop: Int): BitSet {
        val seen = BitSet()
        val pending = ArrayDeque(start)
        while (pending.isNotEmpty()) {
            val at = pending.removeFirst()
            if (at == stop || seen[at]) continue
            seen.set(at)
            pending += edges[at]
        }
        return seen
    }
    val after = reach(next[created], next, use)
    val before = reach(previous[use], previous, created)
    return body.indices.none { after[it] && before[it] && register in body[it].writes() }
}

private fun BytecodePatchContext.requireRuntimeHooks() {
    val owner = tgClassDefByOrNull(DRAFT_PREVIEWS)
    shape(owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags), "no public draft preview runtime")
    for (target in DraftPreviewTarget.entries) {
        shape(owner!!.methods.count { it.origName == target.hook && it.hasShape(emptyList(), "Z") && it.isStatic() &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.NATIVE.isSet(it.accessFlags) &&
            !AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
            it.implementation?.instructions?.any { instruction -> !instruction.opcode.format.isPayloadFormat } == true } == 1,
            "no callable public static runtime ${target.hook}")
    }
}

private fun refuse(reason: String): Nothing =
    throw PatchException("$PATCH: $reason; refuses changed draft preview geometry before editing")
private fun shape(valid: Boolean, reason: String) {
    if (!valid) refuse(reason)
}
private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)
private fun Method.params(): List<String> = origParameterTypes
private fun MethodReference.params(): List<String> = origParameterTypes
private fun Method.hasShape(parameters: List<String>, returns: String) = returnType == returns && params() == parameters
private fun MethodReference.hasShape(parameters: List<String>, returns: String) = returnType == returns && params() == parameters
private fun Method.sameSignature(other: Method) = name == other.name && returnType == other.returnType && params() == other.params()
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Method.constructs(type: String) = instructions().any { it.opcode == Opcode.NEW_INSTANCE && it.reference() == type }
private fun Instruction.reference(): String? = origRef()
private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Instruction.string(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
/** The registers an instruction sets: the first named one for writes, both halves for a wide one. */
private fun Instruction.writes(): Set<Int> {
    if (!opcode.setsRegister()) return emptySet()
    val first = namedRegisters().firstOrNull() ?: return emptySet()
    return if (opcode.setsWideRegister()) setOf(first, first + 1) else setOf(first)
}
