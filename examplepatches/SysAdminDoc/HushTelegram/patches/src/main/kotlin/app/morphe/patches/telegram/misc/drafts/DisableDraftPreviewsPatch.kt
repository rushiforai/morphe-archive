/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.drafts

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
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
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

private const val PATCH = "Disable draft link previews"
internal const val WEB_PAGE_PREVIEW = "Lorg/telegram/tgnet/tl/TL_account\$getWebPagePreview;"
internal const val DRAFT_PREVIEWS = "$EXTENSION_PACKAGE/misc/DraftPreviews;"
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
    description = "Adds a switch, off by default, that stops Telegram fetching link previews for messages you haven't sent yet, in chats, the share sheet, polls, story links and bot shares. Sent messages still get their preview.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("disableDraftPreviews")
        DraftPreviewTarget.entries.forEach { requireStatusMethod(it.capability) }
        // Every builder, skip target and borrowed register is checked before the first edit.
        val hooks = resolveDraftPreviewHooks()
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
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/hushtelegram/extension/")) return@classDefForEach
        classDef.methods.filterTo(builders) { it.constructs(WEB_PAGE_PREVIEW) }
    }
    val found = DraftPreviewTarget.entries.associateWith { mutableListOf<Method>() }
    for (builder in builders) {
        val target = when {
            builder.definingClass == MESSAGES_CONTROLLER && builder.name == "reloadWebPages" -> null
            builder.isStatic() && builder.params().take(2) == listOf("Landroid/content/Context;", "Landroid/net/Uri;") -> null
            builder.isStatic() && builder.hasShape(listOf(builder.definingClass, CHAR_SEQUENCE, MESSAGES_CONTROLLER, "Z"), "V") -> DraftPreviewTarget.CHAT
            !builder.isStatic() && builder.hasShape(listOf(CHAR_SEQUENCE, "Z"), "V") -> DraftPreviewTarget.SHARE
            !builder.isStatic() && builder.returnType == "V" && builder.params().size == 2 && builder.params()[0] == "I" -> DraftPreviewTarget.POLL
            builder.isStatic() && builder.hasShape(listOf(builder.definingClass), "V") -> DraftPreviewTarget.STORY
            !builder.isStatic() && builder.name == "run" && builder.hasShape(emptyList(), "V") &&
                builder.instructions().any { it.opcode == Opcode.INSTANCE_OF && it.reference() == BOT_WEB_PAGE } -> DraftPreviewTarget.BOT_SHARE
            else -> refuse("unknown link preview builder ${builder.definingClass}->${builder.name}")
        }
        if (target != null) found.getValue(target) += builder
    }
    val hooks = linkedMapOf<DraftPreviewTarget, DraftPreviewHook>()
    for ((target, matches) in found) {
        val match = matches.one("$target preview builder")
        val method = mutableClassDefBy(match.definingClass).methods.single { it.sameSignature(match) }
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
        field.definingClass == method.definingClass && field.type == ENCRYPTED_CHAT } == true }.one("chat secret-chat read")
    val secretBranch = secret + 1
    val mode = secret + 2
    shape(body[secret].namedRegisters() == listOf(body[secret].namedRegisters()[0], fragment) &&
        body.getOrNull(secretBranch)?.opcode == Opcode.IF_EQZ && body[secretBranch].namedRegisters() == listOf(body[secret].namedRegisters()[0]) &&
        request in ControlFlow.of(method).normal[secretBranch] &&
        body.getOrNull(mode)?.opcode == Opcode.IGET && body[mode].field()?.let { it.definingClass == MESSAGES_CONTROLLER && it.name == "secretWebpagePreview" } == true &&
        body[mode].namedRegisters()[1] == method.parameterRegisterNumber(2), "secret-chat preview question no longer leads to the request")
    // A draft with no links stores the empty result and posts Telegram's own clear. That one sits in the
    // link search's try block, whose handler reads registers the hook holds differently, so a skip goes to
    // the same clear Telegram posts after the block for text too short to hold a link.
    val store = body.indices.filter { body[it].opcode == Opcode.IPUT_OBJECT && body[it].field()?.let { field ->
        field.definingClass == method.definingClass && field.type == ARRAY_LIST } == true &&
        body[it].namedRegisters().getOrNull(1) == fragment }.one("found link list store")
    val noLinks = store + 1
    shape(body.getOrNull(noLinks)?.opcode == Opcode.IF_NEZ && body[noLinks].namedRegisters() == listOf(body[store].namedRegisters()[0]) &&
        clearRunnable(method, store + 2, fragment), "no-link clear changed")
    val flow = ControlFlow.of(method)
    val clear = body[store + 2].reference()
    val finish = body.indices.filter { it != store + 2 && clearRunnable(method, it, fragment) && body[it].reference() == clear &&
        (it..it + 3).all { at -> flow.exceptional[at].isEmpty() } }.one("no-link clear outside the link search")
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
    val join = body.indices.filter { body[it].call()?.let { call -> call.definingClass == "Landroid/text/TextUtils;" &&
        call.name == "join" && call.hasShape(listOf(CHAR_SEQUENCE, "Ljava/lang/Iterable;"), STRING) } == true }.one("share link join")
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
        body.getOrNull(empty)?.call()?.let { it.definingClass == ARRAY_LIST && it.name == "isEmpty" } == true &&
        body[empty].namedRegisters() == listOf(links), "share link presence checks changed")
    val finish = flow.normal[skip].single()
    shape(finish in flow.normal[nullBranch] && finish > request, "share no-link reset is no longer shared")
    // The reset cancels the pending request and drops the preview it held.
    val thisRegister = method.parameterRegisterNumber(0) - 1
    shape(body[finish].call()?.let { it.definingClass == method.definingClass && it.hasShape(emptyList(), "V") } == true &&
        body[finish].namedRegisters() == listOf(thisRegister) && body.getOrNull(finish + 1)?.opcode == Opcode.IPUT_OBJECT &&
        body[finish + 1].field()?.let { it.definingClass == method.definingClass && it.type == WEB_PAGE } == true,
        "share no-link reset changed")
    // The sheet keeps the links it last saw in a list it empties and refills before the hook. A
    // draft with none leaves it empty, and so does a skip, so the same links fetch once the switch is off.
    val reset = body.indices.filter { body[it].call()?.let { call -> call.definingClass == ARRAY_LIST && call.name == "clear" &&
        call.parameterTypes.isEmpty() } == true }.one("share link list reset")
    val held = body[reset].namedRegisters().single()
    val load = (reset - 1 downTo 0).firstOrNull { held in body[it].writes() } ?: refuse("share link list isn't loaded")
    shape(reset < index && body[load].opcode == Opcode.IGET_OBJECT && body[load].namedRegisters()[1] == thisRegister &&
        body[load].field()?.let { it.definingClass == method.definingClass && it.type == ARRAY_LIST } == true &&
        body.getOrNull(reset + 2)?.call()?.let { it.definingClass == ARRAY_LIST && it.name == "addAll" } == true &&
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
    val contains = body.indices.filter { body[it].call()?.let { call -> call.definingClass == HASH_MAP && call.name == "containsKey" } == true }
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
        .one("poll attached link test").let { body[it].reference() }
    val link = body.indices.filter { body[it].opcode == Opcode.CHECK_CAST && body[it].reference() == linkType }.one("poll link cast")
    val linkRegister = body[link].namedRegisters()[0]
    val thisRegister = method.parameterRegisterNumber(0) - 1
    val check = body.getOrNull(finish + 1)?.call()
    shape(body[finish].opcode == Opcode.CONST_4 && (body[finish] as NarrowLiteralInstruction).narrowLiteral == 0 &&
        check != null && check.definingClass == method.definingClass && check.returnType == "V" &&
        check.params() == listOf(linkType, "Z") &&
        body[finish + 1].namedRegisters() == listOf(thisRegister, linkRegister, body[finish].namedRegisters()[0]) &&
        link < cached, "poll link check without preview changed")
    return gate(DraftPreviewTarget.POLL, method, index, finish, request)
}

/** The story link sheet: the builder is a delayed runnable, so the hook sits where its URL check would post it. */
private fun BytecodePatchContext.storyHook(builder: MutableMethod): DraftPreviewHook {
    val sheet = builder.definingClass
    val checks = mutableClassDefBy(sheet).methods.filter { it.isStatic() && it.hasShape(listOf(sheet, STRING), "V") &&
        it.instructions().any { instruction -> instruction.call()?.let { call -> call.definingClass == UTILITIES && call.name == "cancelRunOnUIThread" } == true } }
    val method = checks.one("story link URL check")
    val body = method.instructions()
    val flow = ControlFlow.of(method)
    val cancel = body.indices.filter { body[it].call()?.let { call -> call.definingClass == UTILITIES && call.name == "cancelRunOnUIThread" } == true }.one("story preview cancel")
    val post = body.indices.filter { body[it].call()?.let { call -> call.definingClass == UTILITIES && call.name == "runOnUIThread" &&
        call.hasShape(listOf(RUNNABLE, "J"), "V") } == true }.one("story preview post")
    val runnable = body[cancel].namedRegisters().single()
    shape(body[post].namedRegisters()[0] == runnable, "story URL check posts another runnable")
    val load = (cancel - 1 downTo 0).firstOrNull { runnable in body[it].writes() } ?: refuse("story preview runnable isn't loaded")
    shape(body[load].opcode == Opcode.IGET_OBJECT && (load + 1 until post).none { runnable in body[it].writes() },
        "story URL check doesn't post the runnable it read")
    val runnableType = body[load].field()!!.type
    shape(body[load].namedRegisters()[1] == method.parameterRegisterNumber(0) &&
        classDefByOrNull(runnableType)?.methods?.any { it.name == "run" && it.instructions().any { instruction ->
            instruction.call()?.let { call -> call.definingClass == sheet && call.name == builder.name } == true } } == true,
        "story preview runnable no longer builds the request")
    val result = body.indices.filter { body[it].opcode == Opcode.MOVE_RESULT && body.getOrNull(it - 1)?.call()?.let { call ->
        call.definingClass == sheet && call.hasShape(listOf(STRING), "Z") } == true }.one("story containsURL result")
    val hasUrl = body[result].namedRegisters().single()
    val branch = cancel + 3
    val index = branch + 1
    shape(body.getOrNull(branch)?.opcode == Opcode.IF_EQZ && body[branch].namedRegisters() == listOf(hasUrl) &&
        result < cancel && index < post, "story URL check no longer branches before the post")
    val finish = flow.normal[branch].single { it != index }
    shape(finish > post, "story no-URL path no longer follows the post")
    // The Done button still follows the real URL check after a skip.
    val enable = body.indices.filter { body[it].call()?.name == "setEnabled" }.one("story Done button")
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
    val initialize = (create + 1 until request).firstOrNull { body[it].call()?.let { call -> call.definingClass == callbackType && call.name == "<init>" } == true }
        ?: refuse("bot share callback isn't initialized before the request")
    val index = initialize + 1
    shape((create + 1 until index).none { callback in body[it].writes() }, "bot share callback register changes before the request")
    val run = classDefByOrNull(callbackType)?.methods?.singleOrNull { it.name == "run" && it.hasShape(listOf("Ljava/lang/Object;"), "V") }
    shape(run != null && !run.isStatic() && AccessFlags.PUBLIC.isSet(run.accessFlags) && run.instructions().take(2).let { first ->
        first.size == 2 && first[1].opcode == Opcode.CHECK_CAST && first[1].reference() == WEB_PAGE } == true,
        "bot share callback no longer takes the loaded preview")
    val send = (request until body.size).firstOrNull { body[it].call()?.let { call -> call.definingClass == "Lorg/telegram/tgnet/ConnectionsManager;" &&
        call.name == "sendRequestTyped" } == true } ?: refuse("bot share preview request isn't sent")
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
        invoke-virtual {v$answer, v$empty}, $callbackType->run(Ljava/lang/Object;)V
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
    return initialize.definingClass == type && initialize.name == "<init>" &&
        initialize.params() == listOf(method.definingClass, "I") &&
        body[at + 2].namedRegisters() == listOf(register, fragment, case.namedRegisters()[0]) &&
        post.definingClass == UTILITIES && post.name == "runOnUIThread" && post.params() == listOf(RUNNABLE) &&
        body[at + 3].namedRegisters() == listOf(register) && body.getOrNull(at + 4)?.opcode == Opcode.RETURN_VOID
}

private fun requestSite(method: Method): Int {
    val body = method.instructions()
    val index = body.indices.filter { body[it].opcode == Opcode.NEW_INSTANCE && body[it].reference() == WEB_PAGE_PREVIEW }
        .one("${method.definingClass}->${method.name} preview request")
    shape(body.getOrNull(index + 1)?.call()?.let { it.definingClass == WEB_PAGE_PREVIEW && it.name == "<init>" && it.parameterTypes.isEmpty() } == true &&
        body[index + 1].namedRegisters() == body[index].namedRegisters(), "preview request constructor changed")
    return index
}

private fun BytecodePatchContext.requireRuntimeHooks() {
    val owner = classDefByOrNull(DRAFT_PREVIEWS)
    shape(owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags), "no public draft preview runtime")
    for (target in DraftPreviewTarget.entries) {
        shape(owner!!.methods.count { it.name == target.hook && it.hasShape(emptyList(), "Z") && it.isStatic() &&
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
private fun <T> List<T>.one(what: String): T {
    shape(size == 1, "$what has $size matches")
    return single()
}
private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)
private fun Method.params(): List<String> = parameterTypes.map { it.toString() }
private fun MethodReference.params(): List<String> = parameterTypes.map { it.toString() }
private fun Method.hasShape(parameters: List<String>, returns: String) = returnType == returns && params() == parameters
private fun MethodReference.hasShape(parameters: List<String>, returns: String) = returnType == returns && params() == parameters
private fun Method.sameSignature(other: Method) = name == other.name && returnType == other.returnType && params() == other.params()
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Method.constructs(type: String) = instructions().any { it.opcode == Opcode.NEW_INSTANCE && it.reference() == type }
private fun Instruction.reference(): String? = (this as? ReferenceInstruction)?.reference?.toString()
private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Instruction.string(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
/** The registers an instruction sets: the first named one for writes, both halves for a wide one. */
private fun Instruction.writes(): Set<Int> {
    if (!opcode.setsRegister()) return emptySet()
    val first = namedRegisters().firstOrNull() ?: return emptySet()
    return if (opcode.setsWideRegister()) setOf(first, first + 1) else setOf(first)
}
