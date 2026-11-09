/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.drafts

import app.morphe.util.names.origString
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.loadsInt
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.ads.GET_SPONSORED_PEERS
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.util.ControlFlow
import app.morphe.util.RegisterLiveness
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
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.util.BitSet
import app.morphe.util.names.origRef
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origSuperclass
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

private const val PATCH = "Disable draft link previews"
internal const val LOCAL_SEARCH = "$EXTENSION_PACKAGE/misc/LocalSearch;"
internal const val SEARCH_KEEP = "$LOCAL_SEARCH->keep()Z"
internal const val SEARCH_SENT = "$LOCAL_SEARCH->sent(Ljava/lang/String;)Ljava/lang/String;"
internal const val SEARCH_EMPTY_TEXT = "$LOCAL_SEARCH->emptyText(Ljava/lang/String;)Ljava/lang/String;"
internal const val SEARCH_KEEPS_TEXT = "$LOCAL_SEARCH->keepsText(Ljava/lang/String;)Z"
/** Messages matching the text in every chat. */
internal const val GLOBAL_MESSAGES = "Lorg/telegram/tgnet/TLRPC\$TL_messages_searchGlobal;"
/** Messages matching the text in one chat; chat search asks it of a forum opened beside the chat list. */
internal const val CHAT_MESSAGES = "Lorg/telegram/tgnet/TLRPC\$TL_messages_search;"
/** Public accounts whose name or username matches the text. */
internal const val USERNAMES = "Lorg/telegram/tgnet/TLRPC\$TL_contacts_search;"
/** Public channel posts under a hashtag. */
internal const val PUBLIC_POSTS = "Lorg/telegram/tgnet/TLRPC\$TL_channels_searchPosts;"
/** The line under "No results" in search, which names the text that found nothing. */
internal const val NO_RESULT_LINE = "Lorg/telegram/messenger/R\$string;->NoResultFoundFor2:I"
private const val STRING = "Ljava/lang/String;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"
private const val CONNECTIONS = "Lorg/telegram/tgnet/ConnectionsManager;"
private const val LOCALE = "Lorg/telegram/messenger/LocaleController;"
private const val RUNNABLE = "Ljava/lang/Runnable;"
private const val OBJECT = "Ljava/lang/Object;"
private const val OBSERVABLE = "Landroid/database/Observable;"
private const val UTILITIES = "Lorg/telegram/messenger/AndroidUtilities;"
private const val TEXT_UTILS = "Landroid/text/TextUtils;"
/** What chat search's own methods take: the search's number and the text. */
private val QUERY = listOf("I", STRING)
/** The username helper's lookup: the text, five switches, a channel, the phone switch, a type, the search's number, a chat to leave out and a callback. */
private val HELPER = listOf(STRING, "Z", "Z", "Z", "Z", "Z", "J", "Z", "I", "I", "J", RUNNABLE)
/** The runtime's phone match and its lookUp stub: the helper, then what its lookup takes. */
internal val PHONE_MATCH = listOf("Ljava/lang/Object;") + HELPER
/** The registers [PHONE_MATCH] fills, two for each long. */
internal val PHONE_MATCH_REGISTERS = PHONE_MATCH.sumOf { if (it == "J" || it == "D") 2 else 1 }
/** The filtered search view's search: a chat, three more numbers, a filter, a switch, the text and whether to clear what it showed. */
private const val FILTERED_TEXT = 6
private val LOWERS = setOf(Opcode.SUB_INT_2ADDR, Opcode.SUB_INT, Opcode.ADD_INT_LIT8)
private val MOVE_RESULTS = setOf(Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_WIDE, Opcode.MOVE_RESULT_OBJECT)

/**
 * The places main search sends its text, and the line it shows when nothing matched. The first five
 * are the Chats tab's lookups, PHONES its "+" phone number match run again on the phone, and the
 * last four the other tabs' searches: Channels, Apps, the Chats tab with a chat or date filter, and
 * the media tabs.
 */
internal enum class SearchLookup { SPONSORED, POSTS, MESSAGES, FORUM, USERNAMES, PHONES, EMPTY_LINE, CHANNELS, APPS, CHAT_FILTERS, MEDIA_TABS }

/** The lookups whose hook asks keep() and takes Telegram's way past on yes. */
private val SKIPS = setOf(SearchLookup.SPONSORED, SearchLookup.POSTS, SearchLookup.MESSAGES, SearchLookup.FORUM,
    SearchLookup.CHANNELS, SearchLookup.APPS)

/** The lookups whose hook hands keepsText() the text and skips the search on yes. */
private val TEXT_SKIPS = setOf(SearchLookup.CHAT_FILTERS, SearchLookup.MEDIA_TABS)

/** [code] goes in front of instruction [index] of [method]; [jump], when it has one, is where its `:hush_local` lands. */
internal class SearchEdit(val lookup: SearchLookup, val method: MutableMethod, val index: Int, val code: String, val jump: Int? = null)

/** [edits], and [lookUp], the body the runtime's lookUp stub gets when the phone match is hooked. */
internal class LocalSearchSite(val edits: List<SearchEdit>, val lookUp: String? = null) {
    /** Every edit, on the methods themselves or on what [into] makes of each. */
    fun apply(into: (MutableMethod) -> MutableMethod = { it }) {
        for (method in edits.map { it.method }.distinctBy { System.identityHashCode(it) }) {
            val target = into(method)
            val own = edits.filter { it.method === method }
            // Marked before the first edit and applied from the end, so no edit moves another's place.
            val marks = own.associateWith { edit -> edit.jump?.let { ExternalLabel("hush_local", target.getInstruction(it)) } }
            for (edit in own.sortedByDescending { it.index }) {
                val mark = marks.getValue(edit)
                if (mark == null) target.addInstructionsAtControlFlowLabel(edit.index, edit.code)
                else target.addInstructionsAtControlFlowLabel(edit.index, edit.code, mark)
            }
        }
    }

    /** The same edits on copies, so a smali or register problem refuses before the app is touched. */
    fun rehearse() = apply { MutableMethod(ImmutableMethod.of(it)) }
}

/**
 * Who is hooking chat search: [patch] is the name a refusal gives, and [runtime] the extension class
 * whose `keep()Z`, `sent(String)String`, `emptyText(String)String`, `keepsText(String)Z` and
 * `phones(...)V` the hooks call. Two patches can hook the same lookups, each with its own runtime,
 * and either can go first.
 */
internal class ChatSearchHooks(val patch: String, val runtime: String) {
    val keep = "$runtime->keep()Z"
    val sent = "$runtime->sent($STRING)$STRING"
    val emptyText = "$runtime->emptyText($STRING)$STRING"
    val keepsText = "$runtime->keepsText($STRING)Z"
    val phones = "$runtime->phones(${PHONE_MATCH.joinToString("")})Z"

    fun refuse(reason: String): Nothing =
        throw PatchException("$patch: $reason; refuses changed search geometry before editing")
    fun shape(valid: Boolean, reason: String) {
        if (!valid) refuse(reason)
    }
    fun gate(answer: Int) = "invoke-static {}, $keep\nmove-result v$answer\nif-nez v$answer, :hush_local"
    fun textGate(text: Int, answer: Int) =
        "invoke-static/range {v$text .. v$text}, $keepsText\nmove-result v$answer\nif-nez v$answer, :hush_local"
}

private val LOCAL = ChatSearchHooks(PATCH, LOCAL_SEARCH)

/**
 * Chat search is the adapter behind search's Chats tab, found by the sponsored accounts request only
 * it builds. Typing there starts a search of the chats and contacts on the phone and five lookups on
 * Telegram's server, and each lookup already has a way past its request that Telegram takes for
 * some other reason. A hook sends the lookup that way:
 *
 * - sponsored accounts and public posts each sit behind a check of the text, and skip as they do
 *   for text that's too short or isn't a hashtag;
 * - global messages skip as they do in a list that has no messages to look up, which takes one off
 *   the count of answers the tab waits for;
 * - a forum's messages skip as they do for an empty box, clearing what an earlier search found;
 * - the username helper gets no text, which Telegram passes for an empty box: the helper drops its
 *   pending requests and server results and answers at once, so the count runs down the same.
 *
 * The helper is shared with contact pickers and other screens, so only chat search's call to it is
 * touched. An empty box also skips the helper's match of a "+" phone number against your contacts,
 * which happens on the phone, so a second hook right after the call runs that match with the text
 * and no username lookup.
 *
 * The pager starts every tab's search for the page on screen. The line under "No results" is set as
 * each search starts. The Channels and Apps tabs each have Telegram's empty box path, which clears the
 * tab and posts nothing, and a typed text takes it too. The Chats tab with a chat or date filter and
 * the media tabs ask the filtered search view, and that call is skipped for typed text, so the tab
 * keeps what it showed. The Posts tab searches only when you tap its button and stays Telegram's.
 */
internal fun BytecodePatchContext.resolveLocalSearch(): LocalSearchSite = resolveChatSearch(LOCAL, SearchLookup.entries.toSet())

/** [resolveLocalSearch]'s finding for any patch, with only the [lookups] it hooks, in [SearchLookup] order. */
internal fun BytecodePatchContext.resolveChatSearch(hooks: ChatSearchHooks, lookups: Set<SearchLookup>): LocalSearchSite {
    hooks.shape(lookups.isNotEmpty(), "no search lookup to hook")
    hooks.shape(SearchLookup.PHONES !in lookups || SearchLookup.USERNAMES in lookups,
        "the phone match runs again only where the username lookup lost its text")
    requireSearchRuntime(hooks, lookups)
    val builders = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.origType.startsWith("Lapp/hushtelegram/extension/")) return@classDefForEach
        classDef.methods.filterTo(builders) { it.constructs(GET_SPONSORED_PEERS) }
    }
    val adapter = tgMutableClassDefBy(builders.one("chat search", hooks::refuse).definingClass)
    fun own(request: String, what: String): MutableMethod {
        val method = adapter.methods.filter { it.constructs(request) }.one(what, hooks::refuse)
        hooks.shape(method.params() == QUERY && method.origReturnType == "V" && !AccessFlags.STATIC.isSet(method.accessFlags),
            "$what no longer takes the search's number and the text")
        return method
    }
    val search = own(GET_SPONSORED_PEERS, "chat search")
    val messages = own(GLOBAL_MESSAGES, "global message search")
    val forum = own(CHAT_MESSAGES, "forum message search")
    hooks.shape(setOf(search.name, messages.name, forum.name).size == 3, "chat search builds two of its requests in one method")
    val helperCall by lazy { usernameCall(hooks, adapter.type, search, messages, forum) }
    val pager by lazy { searchPager(hooks, adapter.type, search) }
    val edits = SearchLookup.entries.filter { it in lookups }.map { lookup ->
        when (lookup) {
            SearchLookup.SPONSORED -> sponsoredEdit(hooks, search)
            SearchLookup.POSTS -> postsEdit(hooks, search)
            SearchLookup.MESSAGES -> messagesEdit(hooks, search, messages)
            SearchLookup.FORUM -> forumEdit(hooks, forum)
            SearchLookup.USERNAMES -> SearchEdit(lookup, helperCall.step, helperCall.call,
                "invoke-static {v${helperCall.text}}, ${hooks.sent}\nmove-result-object v${helperCall.text}")
            SearchLookup.PHONES -> phonesEdit(hooks, helperCall, adapter.type)
            SearchLookup.EMPTY_LINE -> emptyLineEdit(hooks, pager)
            SearchLookup.CHANNELS -> tabEdit(hooks, pager, lookup, "broadcasts")
            SearchLookup.APPS -> tabEdit(hooks, pager, lookup, "bots")
            SearchLookup.CHAT_FILTERS, SearchLookup.MEDIA_TABS -> filteredEdit(hooks, pager, lookup)
        }
    }
    hooks.shape(edits.none { edit -> edit.jump != null && edits.any { it.method === edit.method && it.index == edit.jump } },
        "a search skip lands on another search hook")
    hooks.shape(edits.none { edit -> edits.any { it !== edit && it.method === edit.method && it.index == edit.index } },
        "two search hooks share a place")
    // The helper's own lookup, called on it from the runtime: the same parameters, its text and no usernames.
    val lookUp = if (SearchLookup.PHONES in lookups) "check-cast p0, ${helperCall.helper.definingClass}\n" +
        "invoke-virtual/range {p0 .. p${PHONE_MATCH_REGISTERS - 1}}, ${helperCall.helper}\nreturn-void" else null
    return LocalSearchSite(edits, lookUp)
}

/**
 * The request is built behind `if-eqz text`, which skips it for no text, and that skip is where the
 * hook goes too. It sits in front of that check, well before the request Hide ads hooks, so the two
 * patches never meet whichever runs first.
 */
private fun sponsoredEdit(hooks: ChatSearchHooks, search: MutableMethod): SearchEdit {
    val body = search.instructions()
    val request = body.indices.filter { body[it].opcode == Opcode.NEW_INSTANCE && body[it].reference() == GET_SPONSORED_PEERS }
        .one("sponsored search request", hooks::refuse)
    val store = (request + 1 until body.size).firstOrNull {
        body[it].opcode == Opcode.IPUT_OBJECT && body[it].reference() == "$GET_SPONSORED_PEERS->q:$STRING" }
    hooks.shape(store != null && body[store].namedRegisters()[1] == body[request].namedRegisters().single(),
        "sponsored search no longer carries the text")
    val text = body[store!!].namedRegisters()[0]
    val send = (store until body.size).firstOrNull { body[it].call()?.let { call ->
        call.origDefiningClass == CONNECTIONS && call.origName == "sendRequest" } == true }
    val guard = (request - 1 downTo 0).firstOrNull { body[it].opcode == Opcode.IF_EQZ && body[it].namedRegisters().single() == text }
    hooks.shape(send != null && guard != null && (guard + 1 until store).none { text in body[it].writes() },
        "sponsored search no longer checks the text it sends")
    val past = ControlFlow.of(search).normal[guard!!].filter { it != guard + 1 }.one("sponsored search skip", hooks::refuse)
    hooks.shape(past > send!! && !reaches(search, request, guard), "sponsored search has a way to its request around the text check")
    val answer = search.freeLocalsAt(hooks.patch, guard, 1, targets = listOf(past), highest = 255).single()
    return SearchEdit(SearchLookup.SPONSORED, search, guard, hooks.gate(answer), past)
}

/**
 * Chat search posts a runnable that asks for public posts when the text is a hashtag: `if-eqz tag`
 * skips to the method's return for any other text, and the hook takes the same skip.
 */
private fun BytecodePatchContext.postsEdit(hooks: ChatSearchHooks, search: MutableMethod): SearchEdit {
    val body = search.instructions()
    val created = body.indices.filter { at -> body[at].opcode == Opcode.NEW_INSTANCE && body[at].reference()?.let { type ->
        tgClassDefByOrNull(type)?.methods?.any { it.origName == "run" && it.parameterTypes.isEmpty() && it.constructs(PUBLIC_POSTS) } } == true }
        .one("public posts runnable", hooks::refuse)
    val type = body[created].reference()
    val built = (created + 1..minOf(created + 3, body.lastIndex)).firstOrNull { body[it].call()?.let { call ->
        call.origDefiningClass == type && call.origName == "<init>" } == true }
    val guard = (created - 1 downTo 0).firstOrNull { body[it].opcode == Opcode.IF_EQZ }
    hooks.shape(built != null && guard != null, "public posts runnable is built another way")
    val tag = body[guard!!].namedRegisters().single()
    val past = ControlFlow.of(search).normal[guard].filter { it != guard + 1 }.one("public posts skip", hooks::refuse)
    hooks.shape(tag in body[built!!].namedRegisters().drop(1) && (guard + 1..built).none { tag in body[it].writes() } &&
        body[past].opcode == Opcode.RETURN_VOID && !reaches(search, created, guard),
        "public posts no longer start behind the hashtag check")
    val answer = search.freeLocalsAt(hooks.patch, guard, 1, targets = listOf(past), highest = 255).single()
    return SearchEdit(SearchLookup.POSTS, search, guard, hooks.gate(answer), past)
}

/**
 * One branch reaches the request, and its other side is Telegram's way past: it lowers the count
 * chat search sets when a search starts, tells the tab whether anything is still waited for, and
 * returns. The hook sits where that branch lands, so it reads the registers the way past reads.
 */
private fun messagesEdit(hooks: ChatSearchHooks, search: Method, messages: MutableMethod): SearchEdit {
    val body = messages.instructions()
    val request = body.indices.filter { body[it].opcode == Opcode.NEW_INSTANCE && body[it].reference() == GLOBAL_MESSAGES }
        .one("global message search request", hooks::refuse)
    val flow = ControlFlow.of(messages)
    val branch = flow.into(request).one("way to the global message search request", hooks::refuse)
    val settle = branch + 1
    hooks.shape(settle < request && flow.normal[branch].toSet() == setOf(settle, request) && body[request - 1].opcode == Opcode.RETURN_VOID,
        "global message search lost the way past its request")
    val waiting = body[settle].field()
    val started = search.instructions().filter { it.opcode == Opcode.IPUT }.mapNotNull { it.field() }
    hooks.shape(body[settle].opcode == Opcode.IGET && waiting != null && waiting.origDefiningClass == messages.origDefiningClass &&
        waiting.origType == "I" && waiting in started && (settle until request).any { body[it].opcode in LOWERS } &&
        (settle until request).any { body[it].opcode == Opcode.IPUT && body[it].field() == waiting } &&
        (settle until request).none { body[it].call()?.origName == "sendRequest" },
        "the way past the global message search no longer lowers the waiting count")
    val answer = messages.freeLocalsAt(hooks.patch, request, 1, targets = listOf(settle), highest = 255).single()
    return SearchEdit(SearchLookup.MESSAGES, messages, request, hooks.gate(answer), settle)
}

/**
 * For an empty box the method clears what it found and returns; `if-eqz` skips that for any text
 * and goes on to the request. The hook sits where that skip lands and goes back to the clearing.
 */
private fun forumEdit(hooks: ChatSearchHooks, forum: MutableMethod): SearchEdit {
    val body = forum.instructions()
    val request = body.indices.filter { body[it].opcode == Opcode.NEW_INSTANCE && body[it].reference() == CHAT_MESSAGES }
        .one("forum message search request", hooks::refuse)
    val flow = ControlFlow.of(forum)
    val branch = (0 until request).filter { body[it].opcode == Opcode.IF_EQZ && clearsAndReturns(body, flow, it, request) }
        .one("forum message search's empty box exit", hooks::refuse)
    val on = flow.normal[branch].first { it != branch + 1 }
    hooks.shape(flow.into(on) == listOf(branch) && !reaches(forum, request, on),
        "forum message search has a way to its request around the empty box check")
    val answer = forum.freeLocalsAt(hooks.patch, on, 1, targets = listOf(branch + 1), highest = 255).single()
    return SearchEdit(SearchLookup.FORUM, forum, on, hooks.gate(answer), branch + 1)
}

/** The `if-eqz` at [at] falls into a straight run that clears a list and returns, and branches to the instruction after that return. */
private fun clearsAndReturns(body: List<Instruction>, flow: ControlFlow, at: Int, request: Int): Boolean {
    val on = flow.normal[at].filter { it != at + 1 }.singleOrNull() ?: return false
    val end = (at + 1 until body.size).firstOrNull { body[it].opcode == Opcode.RETURN_VOID } ?: return false
    return on == end + 1 && on <= request && (at + 1 until end).all { flow.normal[it] == listOf(it + 1) } &&
        (at + 1 until end).any { body[it].call()?.let { call -> call.origDefiningClass == ARRAY_LIST && call.origName == "clear" } == true }
}

/**
 * Chat search's second step [step] and its call to the username helper [helper] at [call], which
 * passes the text in [text]. The step read that text at [loaded] from [field] of the object in [owner].
 */
private class HelperCall(val step: MutableMethod, val call: Int, val helper: MethodReference, val text: Int, val loaded: Int,
                         val owner: Int, val field: FieldReference)

/**
 * Chat search's second step, a runnable, is the one method outside the adapter that starts both
 * message searches, and it asks the helper for usernames first. The hook swaps the text it passes.
 * Chat search itself passes the helper no text for an empty box, so that's a call Telegram makes.
 */
private fun BytecodePatchContext.usernameCall(
    hooks: ChatSearchHooks,
    adapter: String,
    search: Method,
    messages: Method,
    forum: Method,
): HelperCall {
    val steps = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.origType == adapter || classDef.origType.startsWith("Lapp/hushtelegram/extension/")) return@classDefForEach
        classDef.methods.filterTo(steps) { method -> method.instructions().let { body ->
            body.any { it.runs(adapter, messages) } && body.any { it.runs(adapter, forum) } } }
    }
    val found = steps.one("chat search's second step", hooks::refuse)
    val step = tgMutableClassDefBy(found.definingClass).methods.single { it.sameSignature(found) }
    val body = step.instructions()
    val call = body.indices.filter { body[it].call()?.let { lookup -> lookup.params() == HELPER && lookup.origReturnType == "V" } == true }
        .one("username lookup", hooks::refuse)
    val helper = body[call].call()!!
    hooks.shape(tgClassDefByOrNull(helper.definingClass)?.methods?.any {
        it.origName == helper.origName && it.params() == HELPER && it.constructs(USERNAMES) } == true,
        "the username helper no longer builds its own request")
    val own = search.instructions()
    hooks.shape(own.indices.any { at -> own[at].call() == helper && own[at].namedRegisters().getOrNull(1)?.let { text ->
        (at - 1 downTo 0).firstOrNull { text in own[it].writes() }?.let { write ->
            own[write].opcode == Opcode.CONST_4 && (own[write] as NarrowLiteralInstruction).narrowLiteral == 0 } } == true },
        "chat search no longer clears the username helper by passing it no text")
    val text = body[call].namedRegisters().getOrNull(1)
    var loaded = text?.let { register -> (call - 1 downTo 0).firstOrNull { register in body[it].writes() } }
    // Another patch's swap may already sit in between, an extension call taking the text and handing it back.
    while (text != null && loaded != null && loaded >= 1 && body[loaded].opcode == Opcode.MOVE_RESULT_OBJECT &&
        body[loaded].namedRegisters() == listOf(text) && body[loaded - 1].swaps(text)) {
        loaded = (loaded - 2 downTo 0).firstOrNull { text in body[it].writes() }
    }
    val flow = ControlFlow.of(step)
    // Read from the runnable's own String field and passed straight on, and nothing reads the register afterwards.
    hooks.shape(text != null && text <= 15 && loaded != null && body[loaded].opcode == Opcode.IGET_OBJECT &&
        body[loaded].field()?.origType == STRING && (loaded + 1..call).all { flow.into(it) == listOf(it - 1) } &&
        text !in RegisterLiveness.of(step).liveInto(call + 1), "the username lookup's text can't be swapped where it's passed")
    return HelperCall(step, call, helper, text!!, loaded!!, body[loaded].namedRegisters()[1], body[loaded].field()!!)
}

/**
 * Right after the username lookup, which got no text, the runtime hands the same registers to the
 * helper again with the text read back from where the step got it. Its phone match needs no server,
 * and the runtime turns the username lookup off for that call. The text register is free there, as
 * the swap already needs, so reading the text back into it costs nothing.
 *
 * The helper tells chat search nothing about a phone match, and chat search's own update for the
 * phone's results came before this step, so when the runtime matched, the step's chat search is told
 * its list changed. That's RecyclerView's redraw, which the pager's chat search overrides to scroll
 * back up once per search and settle its progress line. Neither is the helper's answer, and neither
 * writes the count of answers chat search waits for, so that count stays as it was. The owner and
 * text registers must differ, or reading the text back would leave nothing to read chat search from.
 */
private fun BytecodePatchContext.phonesEdit(hooks: ChatSearchHooks, found: HelperCall, adapter: String): SearchEdit {
    val step = found.step
    val body = step.instructions()
    val after = found.call + 1
    val passed = body[found.call].namedRegisters()
    val first = passed.firstOrNull() ?: hooks.refuse("the username lookup passes nothing")
    val owner = tgClassDefByOrNull(found.helper.definingClass)
    val lookup = owner?.methods?.singleOrNull { it.origName == found.helper.origName && it.params() == HELPER && it.origReturnType == "V" }
    // The runtime's lookUp stub calls it from another package.
    hooks.shape(owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags) && !AccessFlags.INTERFACE.isSet(owner.accessFlags) &&
        lookup != null && AccessFlags.PUBLIC.isSet(lookup.accessFlags) && !AccessFlags.STATIC.isSet(lookup.accessFlags),
        "the username helper's lookup can't be called from the runtime")
    hooks.shape(body[found.call].opcode == Opcode.INVOKE_VIRTUAL_RANGE &&
        passed == (first until first + PHONE_MATCH_REGISTERS).toList() && passed[1] == found.text,
        "the username lookup isn't passed one run of registers")
    val flow = ControlFlow.of(step)
    hooks.shape(body.getOrNull(after) != null && body[after].opcode !in MOVE_RESULTS && flow.into(after) == listOf(found.call) &&
        found.owner <= 15 && found.owner != found.text && (found.loaded + 1..found.call).none { found.owner in body[it].writes() },
        "the username lookup's text can't be read back after it")
    // The text came from the step's own field, and the step holds chat search beside it.
    val held = tgClassDefByOrNull(step.definingClass)?.fields
        ?.filter { it.origType == adapter && !AccessFlags.STATIC.isSet(it.accessFlags) }.orEmpty()
    hooks.shape(found.field.origDefiningClass == step.origDefiningClass && held.size == 1,
        "the username lookup's step no longer holds chat search")
    val shown = listChanged(hooks, adapter)
    return SearchEdit(SearchLookup.PHONES, step, after, listOf(
        "iget-object v${found.text}, v${found.owner}, ${found.field}",
        "invoke-static/range {v$first .. v${first + PHONE_MATCH_REGISTERS - 1}}, ${hooks.phones}",
        "move-result v${found.text}",
        "if-eqz v${found.text}, :hush_phones_shown",
        "iget-object v${found.text}, v${found.owner}, ${step.definingClass}->${held.single().name}:$adapter",
        "invoke-virtual {v${found.text}}, $shown",
        ":hush_phones_shown",
        "nop",
    ).joinToString("\n"))
}

/**
 * RecyclerView's adapter, the first of chat search's superclasses past Object, tells its list that
 * everything changed with its one method that takes nothing: it hands the change to the observable
 * it keeps. Telegram renames both, so they're found by that shape.
 */
private fun BytecodePatchContext.listChanged(hooks: ChatSearchHooks, adapter: String): String {
    var type = adapter
    val seen = mutableSetOf<String>()
    while (seen.add(type)) {
        val superclass = tgClassDefByOrNull(type)?.superclass ?: hooks.refuse("chat search's list adapter is missing")
        if (superclass == OBJECT) break
        type = superclass
    }
    val top = tgClassDefByOrNull(type)
    hooks.shape(top != null && type != adapter && AccessFlags.PUBLIC.isSet(top.accessFlags), "chat search's list adapter is missing")
    val observable = top!!.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && tgClassDefByOrNull(it.type)?.origSuperclass == OBSERVABLE }
        .one("the list adapter's observable", hooks::refuse)
    val notify = top.methods.filter { it.origName != "<init>" && it.parameterTypes.isEmpty() && it.origReturnType == "V" &&
        !AccessFlags.STATIC.isSet(it.accessFlags) }.one("the list adapter's redraw", hooks::refuse)
    val body = notify.instructions()
    val told = body.getOrNull(1)?.call()
    hooks.shape(AccessFlags.PUBLIC.isSet(notify.accessFlags) && body.size == 3 && body[0].opcode == Opcode.IGET_OBJECT &&
        body[0].field()?.let { it.origDefiningClass == top.origType && it.origName == observable.origName && it.origType == observable.origType } == true &&
        body[1].opcode == Opcode.INVOKE_VIRTUAL && told?.origDefiningClass == observable.origType && told.parameterTypes.isEmpty() &&
        told.origReturnType == "V" && body[2].opcode == Opcode.RETURN_VOID,
        "the list adapter's redraw no longer just tells its observable")
    return "${top.origType}->${notify.origName}()V"
}

/** The pager starts each tab's search for the page on screen, the Chats tab's chat search among them, and sets the line under "No results". */
private fun BytecodePatchContext.searchPager(hooks: ChatSearchHooks, adapter: String, search: Method): MutableMethod {
    val pagers = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.origType == adapter || classDef.origType.startsWith("Lapp/hushtelegram/extension/")) return@classDefForEach
        classDef.methods.filterTo(pagers) { method -> method.instructions().let { body ->
            body.any { it.runs(adapter, search) } && body.any { it.loadsInt() && it.reference() == NO_RESULT_LINE } } }
    }
    val found = pagers.one("search pager", hooks::refuse)
    return tgMutableClassDefBy(found.definingClass).methods.single { it.sameSignature(found) }
}

/** The pager formats the line under "No results" and sets it; the hook rewrites it in between. */
private fun emptyLineEdit(hooks: ChatSearchHooks, pager: MutableMethod): SearchEdit {
    val body = pager.instructions()
    val line = body.indices.filter { body[it].loadsInt() && body[it].reference() == NO_RESULT_LINE }
        .one("no results line", hooks::refuse)
    val format = (line + 1..minOf(line + 4, body.lastIndex)).firstOrNull { body[it].call()?.let { call ->
        call.origDefiningClass == LOCALE && call.origName == "formatString" && call.origReturnType == STRING } == true }
    hooks.shape(format != null && body.getOrNull(format + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT, "the no results line is formatted another way")
    val text = body[format!! + 1].namedRegisters().single()
    val set = format + 2
    hooks.shape(body.getOrNull(set)?.call()?.let { it.origName == "setText" && it.params() == listOf(CHAR_SEQUENCE) } == true &&
        body[set].namedRegisters().getOrNull(1) == text && text <= 15 && ControlFlow.of(pager).into(set) == listOf(set - 1) &&
        text !in RegisterLiveness.of(pager).liveInto(set + 1), "the no results line is set another way")
    return SearchEdit(SearchLookup.EMPTY_LINE, pager, set, "invoke-static {v$text}, ${hooks.emptyText}\nmove-result-object v$text")
}

/**
 * The Channels and Apps tabs are pages the pager searches itself. It puts the text in the tab's own
 * field, reads it back and asks whether it's empty: `if-eqz` either falls into Telegram's empty box
 * path, which clears the tab's lists, marks nothing as loading, has no more to load and shows the
 * tab's empty view, or goes on to post the tab's delayed search. Each tab is told apart by the
 * account search its class builds from that field, for channels or for bots. The hook sits where a
 * typed text lands and takes the empty box path, so the search is never posted.
 */
private fun BytecodePatchContext.tabEdit(hooks: ChatSearchHooks, pager: MutableMethod, lookup: SearchLookup, flag: String): SearchEdit {
    val what = if (lookup == SearchLookup.CHANNELS) "the Channels tab" else "the Apps tab"
    val body = pager.instructions()
    val branch = body.indices.filter { at -> emptyCheck(body, at)?.let { field -> searches(field, flag) } == true }
        .one("$what's empty box check", hooks::refuse)
    val tab = emptyCheck(body, branch)!!.definingClass
    val flow = ControlFlow.of(pager)
    val empty = branch + 1
    val on = flow.normal[branch].filter { it != empty }.one("$what's way to its search", hooks::refuse)
    val post = (on until body.size).firstOrNull { body[it].call()?.let { call ->
        call.origDefiningClass == UTILITIES && call.origName == "runOnUIThread" && call.params() == listOf(RUNNABLE, "J") } == true }
    hooks.shape(on > empty && flow.into(on) == listOf(branch) && post != null && !reaches(pager, post, on),
        "$what posts its search another way")
    // Telegram's empty box path: it clears the tab and marks it as having nothing to load, and starts nothing.
    hooks.shape((empty until on).none { body[it].call()?.let { call -> call.origDefiningClass == UTILITIES ||
        call.origDefiningClass == CONNECTIONS } == true } &&
        (empty until on).any { body[it].opcode == Opcode.IPUT_BOOLEAN && body[it].field()?.origDefiningClass == tab } &&
        (empty until on).any { body[it].call()?.let { call -> call.origDefiningClass == ARRAY_LIST && call.origName == "clear" } == true },
        "$what lost its empty box path")
    val answer = pager.freeLocalsAt(hooks.patch, on, 1, targets = listOf(empty), highest = 255).single()
    return SearchEdit(lookup, pager, on, hooks.gate(answer), empty)
}

/** The String field that's read and tested by `iget-object`, `TextUtils.isEmpty`, `move-result` and the `if-eqz` at [at]. */
private fun emptyCheck(body: List<Instruction>, at: Int): FieldReference? {
    if (at < 3 || body[at].opcode != Opcode.IF_EQZ) return null
    val (load, test, result) = Triple(body[at - 3], body[at - 2], body[at - 1])
    val field = load.field()?.takeIf { load.opcode == Opcode.IGET_OBJECT && it.origType == STRING } ?: return null
    val read = load.namedRegisters()[0]
    return field.takeIf { test.opcode == Opcode.INVOKE_STATIC && test.namedRegisters() == listOf(read) &&
        test.call()?.let { call -> call.origDefiningClass == TEXT_UTILS && call.origName == "isEmpty" } == true &&
        result.opcode == Opcode.MOVE_RESULT && result.namedRegisters() == body[at].namedRegisters() }
}

/** Whether [field]'s class has a search that puts it in a global message search and a [flag] account search. */
private fun BytecodePatchContext.searches(field: FieldReference, flag: String): Boolean =
    tgClassDefByOrNull(field.definingClass)?.methods?.any { method -> method.instructions().let { body ->
        fun carries(target: String) = body.indices.any { at -> body[at].opcode == Opcode.IPUT_OBJECT && body[at].reference() == target &&
            (at - 1 downTo 0).firstOrNull { body[at].namedRegisters()[0] in body[it].writes() }?.let { load ->
                body[load].opcode == Opcode.IGET_OBJECT && body[load].reference() == field.origString() } == true }
        body.any { it.opcode == Opcode.IPUT_BOOLEAN && it.reference() == "$USERNAMES->$flag:Z" } &&
            carries("$GLOBAL_MESSAGES->q:$STRING") && carries("$USERNAMES->q:$STRING")
    } } == true

/**
 * The Chats tab with a chat or date filter and each media tab show the filtered search view, a list
 * of messages its delayed runnable asks Telegram for, and the pager starts its search with the text.
 * The Chats tab's view is a field of the pager and a media tab's is the page itself, cast. The hook
 * skips the call for typed text, so the view keeps what it showed; nothing in it spins until a search starts.
 */
private fun BytecodePatchContext.filteredEdit(hooks: ChatSearchHooks, pager: MutableMethod, lookup: SearchLookup): SearchEdit {
    val body = pager.instructions()
    val calls = body.indices.filter { at -> body[at].call()?.let { call -> call.origReturnType == "V" && call.params().let { taken ->
        taken.size == 8 && taken.take(4).all { it == "J" } && taken.drop(5) == listOf("Z", STRING, "Z") } } == true }
    hooks.shape(calls.size == 2 && calls.map { body[it].call().toString() }.distinct().size == 1,
        "the pager no longer starts the filtered search twice")
    val filtered = body[calls.first()].call()!!
    val search = tgClassDefByOrNull(filtered.definingClass)?.methods?.singleOrNull { it.origName == filtered.origName &&
        it.params() == filtered.params() && it.origReturnType == "V" }
    hooks.shape(search != null && search.instructions().let { own -> own.indices.any { at -> own[at].opcode == Opcode.NEW_INSTANCE &&
        own[at].reference()?.let { type -> tgClassDefByOrNull(type)?.methods?.any { it.origName == "run" && it.parameterTypes.isEmpty() &&
            it.constructs(GLOBAL_MESSAGES) } } == true && own.drop(at + 1).any { post -> post.call()?.let { call ->
                call.origDefiningClass == UTILITIES && call.origName == "runOnUIThread" } == true } } },
        "the filtered search no longer posts a message search")
    val kind = if (lookup == SearchLookup.CHAT_FILTERS) Opcode.IGET_OBJECT else Opcode.CHECK_CAST
    val call = calls.filter { at -> body[at].namedRegisters().firstOrNull()?.let { view ->
        (at - 1 downTo 0).firstOrNull { view in body[it].writes() }?.let { body[it].opcode == kind &&
            (body[it].field()?.type ?: body[it].reference()) == filtered.origDefiningClass } } == true }
        .one("${lookup.name.lowercase()} filtered search", hooks::refuse)
    val passed = body[call].namedRegisters()
    val text = passed.getOrNull(1 + filtered.params().take(FILTERED_TEXT).sumOf { if (it == "J" || it == "D") 2 else 1 })
    val after = call + 1
    hooks.shape(body[call].opcode == Opcode.INVOKE_VIRTUAL_RANGE && text != null && filtered.params()[FILTERED_TEXT] == STRING &&
        body.getOrNull(after) != null && body[after].opcode !in MOVE_RESULTS && ControlFlow.of(pager).normal[call] == listOf(after),
        "the filtered search's text can't be read where it's passed")
    val answer = pager.freeLocalsAt(hooks.patch, call, 1, targets = listOf(after), highest = 255).single()
    return SearchEdit(lookup, pager, call, hooks.textGate(text!!, answer), after)
}

/** The runtime's calls [lookups] need: keep() for every skip, sent() for usernames, emptyText() for the empty line, keepsText() for filtered searches and phones() with its lookUp stub for the phone match. */
private fun BytecodePatchContext.requireSearchRuntime(hooks: ChatSearchHooks, lookups: Set<SearchLookup>) {
    val owner = tgClassDefByOrNull(hooks.runtime)
    hooks.shape(owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags), "no public search runtime")
    val needed = listOfNotNull(
        Triple("keep", emptyList<String>(), "Z").takeIf { lookups.any { it in SKIPS } },
        Triple("sent", listOf(STRING), STRING).takeIf { SearchLookup.USERNAMES in lookups },
        Triple("emptyText", listOf(STRING), STRING).takeIf { SearchLookup.EMPTY_LINE in lookups },
        Triple("keepsText", listOf(STRING), "Z").takeIf { lookups.any { it in TEXT_SKIPS } },
        Triple("phones", PHONE_MATCH, "Z").takeIf { SearchLookup.PHONES in lookups },
        Triple("lookUp", PHONE_MATCH, "V").takeIf { SearchLookup.PHONES in lookups },
    )
    for ((name, parameters, result) in needed) {
        hooks.shape(owner!!.methods.count { it.origName == name && it.params() == parameters && it.origReturnType == result &&
            AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
            !AccessFlags.NATIVE.isSet(it.accessFlags) && !AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.implementation != null } == 1,
            "no callable public static runtime $name")
    }
    // The stub is written over by name, so no other method may share it.
    hooks.shape(SearchLookup.PHONES !in lookups || owner!!.methods.count { it.origName == "lookUp" } == 1, "the runtime's lookUp stub is overloaded")
}

/** Whether [target] can be reached from the method's start, thrown or not, without running [avoiding]. */
private fun reaches(method: Method, target: Int, avoiding: Int): Boolean {
    val flow = ControlFlow.of(method)
    val seen = BitSet()
    val pending = ArrayDeque<Int>()
    pending += 0
    while (pending.isNotEmpty()) {
        val index = pending.removeFirst()
        if (index == avoiding || seen[index]) continue
        seen.set(index)
        pending += flow.normal[index]
        pending += flow.exceptional[index]
    }
    return seen[target]
}

/** Every instruction that can run right before [index], by a fall-through, a branch or a throw. */
private fun ControlFlow.into(index: Int): List<Int> = instructions.indices.filter { index in normal[it] || index in exceptional[it] }

private fun Method.params(): List<String> = origParameterTypes
private fun MethodReference.params(): List<String> = origParameterTypes
private fun Method.sameSignature(other: Method) = name == other.name && returnType == other.returnType && params() == other.params()
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Method.constructs(type: String) = instructions().any { it.opcode == Opcode.NEW_INSTANCE && it.reference() == type }
private fun Instruction.reference(): String? = origRef()
private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference
/** A static extension call that takes the String in [text] alone and answers a String. */
private fun Instruction.swaps(text: Int) = opcode == Opcode.INVOKE_STATIC && namedRegisters() == listOf(text) &&
    call()?.let { it.origDefiningClass.startsWith("Lapp/hushtelegram/extension/") && it.params() == listOf(STRING) && it.origReturnType == STRING } == true
private fun Instruction.runs(adapter: String, method: Method) =
    call()?.let { it.origDefiningClass == adapter && it.origName == method.origName && it.params() == method.params() } == true
/** The registers an instruction sets: the first named one for writes, both halves for a wide one. */
private fun Instruction.writes(): Set<Int> {
    if (!opcode.setsRegister()) return emptySet()
    val first = namedRegisters().firstOrNull() ?: return emptySet()
    return if (opcode.setsWideRegister()) setOf(first, first + 1) else setOf(first)
}
