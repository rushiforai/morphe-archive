/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.apps

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.drafts.ChatSearchHooks
import app.morphe.patches.telegram.misc.drafts.LocalSearchSite
import app.morphe.patches.telegram.misc.drafts.PHONE_MATCH_REGISTERS
import app.morphe.patches.telegram.misc.drafts.PUBLIC_POSTS as PUBLIC_POSTS_REQUEST
import app.morphe.patches.telegram.misc.drafts.SearchLookup
import app.morphe.patches.telegram.misc.drafts.resolveChatSearch
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.one
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference

private const val PATCH = "Hide popular apps"
internal const val MY_CHATS_SEARCH = "$EXTENSION_PACKAGE/misc/MyChatsSearch;"
internal const val DROP_PUBLIC_TABS = "$MY_CHATS_SEARCH->dropPublicTabs(Ljava/util/ArrayList;)V"
internal const val DOWNLOADS_AT = "$MY_CHATS_SEARCH->downloadsAt(Ljava/lang/Object;I)I"
internal const val KEEP_HASHTAG = "$MY_CHATS_SEARCH->keepHashtag(Ljava/lang/Object;Ljava/lang/String;I)Z"
internal const val END_PUBLIC_POSTS = "$MY_CHATS_SEARCH->endPublicPosts(Ljava/lang/Object;II)V"
internal const val DROP_PUBLIC_RESULTS = "$MY_CHATS_SEARCH->dropPublicResults(Ljava/lang/Object;)V"
/** Telegram's hashtag search, behind the tabs a hashtag opens in a chat. Its names are kept. */
internal const val HASHTAG_SEARCH = "Lorg/telegram/messenger/HashtagSearchController;"
internal const val HASHTAG_RESULT = "Lorg/telegram/messenger/HashtagSearchController\$SearchResult;"
/** What a search for accounts by name answers, wherever it was asked. */
internal const val CONTACTS_FOUND = "Lorg/telegram/tgnet/TLRPC\$TL_contacts_found;"
/** Public stories under a hashtag, or in a place a story names. */
internal const val PUBLIC_STORIES = "Lorg/telegram/tgnet/tl/TL_stories\$TL_stories_searchPosts;"
internal const val MESSAGES_CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
internal const val CHAT_OBJECT = "Lorg/telegram/messenger/ChatObject;"
internal const val TL_USER = "Lorg/telegram/tgnet/TLRPC\$User;"
internal const val TL_CHAT = "Lorg/telegram/tgnet/TLRPC\$Chat;"
internal const val TL_PEER = "Lorg/telegram/tgnet/TLRPC\$Peer;"
private const val TL_OBJECT = "Lorg/telegram/tgnet/TLObject;"
private const val NOTIFICATIONS = "Lorg/telegram/messenger/NotificationCenter;"
private const val TITLES = "Lorg/telegram/messenger/R\$string;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"
private const val STRING = "Ljava/lang/String;"
/** An account search answer's lists, in the order the runtime's foundLists stub hands them over. */
internal val FOUND_LISTS = listOf("my_results", "results", "users", "chats")
private val CONSTS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST)
/** Every way out of a method. dexlib2's `Opcode.name` is the smali mnemonic, so these are listed rather than matched by name. */
private val EXITS = setOf(Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.THROW)

/**
 * The chat search lookups this patch hooks: the public ones, and the phone number match the username
 * lookup's empty box skips. Messages in your chats are left to Telegram.
 */
internal val MY_CHATS_LOOKUPS = setOf(SearchLookup.SPONSORED, SearchLookup.POSTS, SearchLookup.USERNAMES, SearchLookup.PHONES)
internal val MY_CHATS_HOOKS = ChatSearchHooks(PATCH, MY_CHATS_SEARCH)

/** Search's tabs that matter here, by the string each one's title reads. */
internal enum class SearchTab(val title: String, val publicTab: Boolean) {
    CHANNELS("ChannelsTab", true),
    APPS("AppsTab", true),
    POSTS("SearchPosts", true),
    PUBLIC_POSTS("PublicPostsTabs", true),
    DOWNLOADS("DownloadsTabs", false),
}

/**
 * Search's tab row. [update] clears [list] and fills it again, one [item] per tab, ending at [end];
 * an item's [type] field holds the number [types] gives its tab. The [pager] holds the row's adapter
 * in [adapter], and says whether the public posts tab is open in [expanded].
 */
internal class TabRow(
    val update: MutableMethod,
    val end: Int,
    val list: FieldReference,
    val item: String,
    val type: FieldReference,
    val types: Map<SearchTab, Int>,
    val pager: String,
    val adapter: FieldReference,
    val expanded: FieldReference,
)

/** The Downloads shortcut: [call] in [method] opens [pager]'s tab number [position], counted on Telegram's own row. */
internal class DownloadsShortcut(val method: MutableMethod, val call: Int, val pager: Int, val position: Int)

/**
 * A hashtag's searches. [search] starts one, with the tag in [hashtag], the screen's number in
 * [guid] and the search's kind in [kind], all registers; [myMessages] is the kind that looks only
 * through your own messages.
 */
internal class HashtagPosts(
    val search: MutableMethod,
    val self: Int,
    val hashtag: Int,
    val guid: Int,
    val kind: Int,
    val myMessages: Int,
)

/** Where an account search's answer has been read: [read] ends at [end], with the answer in [self]. */
internal class FoundRead(val read: MutableMethod, val end: Int, val self: Int)

/** The public stories search, which answers whether it started loading a page. */
internal class StoriesSearch(val method: MutableMethod)

internal class MyChatsSearchSites(
    val chat: LocalSearchSite,
    val tabs: TabRow,
    val downloads: DownloadsShortcut,
    val hashtag: HashtagPosts,
    val found: FoundRead,
    val stories: StoriesSearch,
) {
    /** Every hook, on the methods themselves or on what [into] makes of each. */
    fun apply(into: (MutableMethod) -> MutableMethod = { it }) {
        chat.apply(into)

        val update = into(tabs.update)
        val list = tabs.update.freeLocalsAt(PATCH, tabs.end, 1, highest = 15).single()
        update.addInstructionsAtControlFlowLabel(tabs.end, """
            iget-object v$list, v${tabs.update.localRegisterCount()}, ${tabs.list}
            invoke-static {v$list}, $DROP_PUBLIC_TABS
        """.trimIndent())

        into(downloads.method).addInstructionsAtControlFlowLabel(downloads.call, """
            invoke-static {v${downloads.pager}, v${downloads.position}}, $DOWNLOADS_AT
            move-result v${downloads.position}
        """.trimIndent())

        val search = into(hashtag.search)
        search.addInstructionsWithLabels(0, """
            const v0, ${hashtag.myMessages}
            if-eq v${hashtag.kind}, v0, :hush_keep
            invoke-static {v${hashtag.self}, v${hashtag.hashtag}, v${hashtag.kind}}, $KEEP_HASHTAG
            move-result v0
            if-nez v0, :hush_keep
            invoke-static {v${hashtag.self}, v${hashtag.guid}, v${hashtag.kind}}, $END_PUBLIC_POSTS
            return-void
        """.trimIndent(), ExternalLabel("hush_keep", search.getInstruction(0)))

        into(found.read).addInstructionsAtControlFlowLabel(found.end, "invoke-static {v${found.self}}, $DROP_PUBLIC_RESULTS")

        val stories = into(this.stories.method)
        stories.addInstructionsWithLabels(0, """
            invoke-static {}, ${MY_CHATS_HOOKS.keep}
            move-result v0
            if-eqz v0, :hush_keep
            const/4 v0, 0x0
            return v0
        """.trimIndent(), ExternalLabel("hush_keep", stories.getInstruction(0)))
    }

    /** The same hooks on copies, so a smali or register problem refuses before the app is touched. */
    fun rehearse() = apply { MutableMethod(ImmutableMethod.of(it)) }
}

/** The runtime's stubs, from what [sites] found. On their own nothing calls them. */
internal fun BytecodePatchContext.writeMyChatsSearchStubs(sites: MyChatsSearchSites) {
    val tabs = sites.tabs
    // Whether an object is a tab item whose type is one of [kinds].
    fun predicate(kinds: Collection<SearchTab>) = (listOf(
        "instance-of v0, p0, ${tabs.item}",
        "if-eqz v0, :hush_no",
        "check-cast p0, ${tabs.item}",
        "iget v0, p0, ${tabs.type}",
    ) + kinds.flatMap { listOf("const v1, ${tabs.types.getValue(it)}", "if-eq v0, v1, :hush_yes") } + listOf(
        ":hush_no",
        "const/4 v0, 0x0",
        "return v0",
        ":hush_yes",
        "const/4 v0, 0x1",
        "return v0",
    )).joinToString("\n")
    sites.chat.lookUp?.let { writeStub(MY_CHATS_SEARCH, "lookUp", PHONE_MATCH_REGISTERS, it) }
    writeStub(MY_CHATS_SEARCH, "publicTab", 3, predicate(SearchTab.entries.filter { it.publicTab }))
    writeStub(MY_CHATS_SEARCH, "downloadsTab", 3, predicate(listOf(SearchTab.DOWNLOADS)))
    writeStub(MY_CHATS_SEARCH, "tabs", 2, """
        check-cast p0, ${tabs.pager}
        iget-object v0, p0, ${tabs.adapter}
        iget-object v0, v0, ${tabs.list}
        return-object v0
    """.trimIndent())
    // The hashtag search's results for that kind cleared, done, and the screens told: what Telegram
    // does for a channel name it can't find.
    writeStub(MY_CHATS_SEARCH, "finishPublicPosts", 5, """
        check-cast p0, $HASHTAG_SEARCH
        invoke-virtual {p0, p1}, $HASHTAG_SEARCH->getSearchResult(I)$HASHTAG_RESULT
        move-result-object v0
        invoke-virtual {v0}, $HASHTAG_RESULT->clear()V
        const/4 v1, 0x0
        iput-boolean v1, v0, $HASHTAG_RESULT->loading:Z
        const/4 v1, 0x1
        iput-boolean v1, v0, $HASHTAG_RESULT->endReached:Z
        iget v0, p0, $HASHTAG_SEARCH->currentAccount:I
        invoke-static {v0}, $NOTIFICATIONS->getInstance(I)$NOTIFICATIONS
        move-result-object v0
        sget v1, $NOTIFICATIONS->hashtagSearchUpdated:I
        invoke-virtual {v0, v1, p2}, $NOTIFICATIONS->postNotificationName(I[Ljava/lang/Object;)V
        return-void
    """.trimIndent())
    // The tag a hashtag search of that kind last asked for, which Telegram carries on with when it's handed none.
    writeStub(MY_CHATS_SEARCH, "lastHashtag", 3, """
        check-cast p0, $HASHTAG_SEARCH
        invoke-virtual {p0, p1}, $HASHTAG_SEARCH->getSearchResult(I)$HASHTAG_RESULT
        move-result-object v0
        iget-object v0, v0, $HASHTAG_RESULT->lastHashtag:$STRING
        return-object v0
    """.trimIndent())
    // Whether a name is an account or a chat you're in that this phone already knows, as the hashtag
    // search itself looks it up, so a known one never needs a lookup on Telegram's server.
    writeStub(MY_CHATS_SEARCH, "ownChat", 4, """
        check-cast p0, $HASHTAG_SEARCH
        iget v0, p0, $HASHTAG_SEARCH->currentAccount:I
        invoke-static {v0}, $MESSAGES_CONTROLLER->getInstance(I)$MESSAGES_CONTROLLER
        move-result-object v0
        invoke-virtual {v0, p1}, $MESSAGES_CONTROLLER->getUserOrChat($STRING)$TL_OBJECT
        move-result-object v0
        instance-of v1, v0, $TL_USER
        if-nez v1, :hush_yes
        instance-of v1, v0, $TL_CHAT
        if-eqz v1, :hush_no
        check-cast v0, $TL_CHAT
        invoke-static {v0}, $CHAT_OBJECT->isNotInChat($TL_CHAT)Z
        move-result v1
        if-nez v1, :hush_no
        :hush_yes
        const/4 v0, 0x1
        return v0
        :hush_no
        const/4 v0, 0x0
        return v0
    """.trimIndent())
    // An account search answer's four lists, in FOUND_LISTS order.
    writeStub(MY_CHATS_SEARCH, "foundLists", 4, (listOf(
        "check-cast p0, $CONTACTS_FOUND",
        "const/4 v0, 0x${FOUND_LISTS.size}",
        "new-array v0, v0, [$ARRAY_LIST",
    ) + FOUND_LISTS.flatMapIndexed { at, name -> listOf(
        "const/4 v1, 0x$at",
        "iget-object v2, p0, $CONTACTS_FOUND->$name:$ARRAY_LIST",
        "aput-object v2, v0, v1",
    ) } + "return-object v0").joinToString("\n"))
    // One number for an account, a chat or a peer naming either: an account's id, or a chat's id below zero.
    writeStub(MY_CHATS_SEARCH, "peerKey", 6, """
        instance-of v0, p0, $TL_USER
        if-eqz v0, :hush_chat
        check-cast p0, $TL_USER
        iget-wide v0, p0, $TL_USER->id:J
        return-wide v0
        :hush_chat
        instance-of v0, p0, $TL_CHAT
        if-eqz v0, :hush_peer
        check-cast p0, $TL_CHAT
        iget-wide v0, p0, $TL_CHAT->id:J
        neg-long v0, v0
        return-wide v0
        :hush_peer
        instance-of v0, p0, $TL_PEER
        if-eqz v0, :hush_none
        check-cast p0, $TL_PEER
        const-wide/16 v2, 0x0
        iget-wide v0, p0, $TL_PEER->user_id:J
        cmp-long v4, v0, v2
        if-nez v4, :hush_account
        iget-wide v0, p0, $TL_PEER->chat_id:J
        cmp-long v4, v0, v2
        if-nez v4, :hush_group
        iget-wide v0, p0, $TL_PEER->channel_id:J
        :hush_group
        neg-long v0, v0
        :hush_account
        return-wide v0
        :hush_none
        const-wide/16 v0, 0x0
        return-wide v0
    """.trimIndent())
}

/**
 * Search only my chats, found before anything is edited:
 *
 * - the Chats tab's public lookups, the same places Keep searches on this phone hooks: sponsored
 *   accounts and public posts take the skip Telegram has for text that doesn't need them, and the
 *   username helper gets no text, as for an empty box, then runs its "+" phone number match again
 *   with the text and no username lookup;
 * - the tab row, which drops its public tabs right after it's built, so every count, title and page
 *   Telegram reads from it afterwards agrees;
 * - the Downloads shortcut, which opens a fixed place on Telegram's own row and goes where Downloads
 *   now is instead;
 * - a hashtag's searches past your own messages, which end with nothing found, the way Telegram ends
 *   one for a channel name it can't find, unless the tag names an account or a chat you're in;
 * - every answer to a search for accounts by name, which keeps only what's yours, whichever screen
 *   asked: New Message, contact and forward pickers, adding members, gift and giveaway pickers;
 * - the public stories search, which answers that there's nothing to load.
 */
internal fun BytecodePatchContext.resolveMyChatsSearch(): MyChatsSearchSites {
    requireRuntime()
    val chat = resolveChatSearch(MY_CHATS_HOOKS, MY_CHATS_LOOKUPS)
    val tabs = resolveTabRow()
    val downloads = resolveDownloadsShortcut(tabs)
    val hashtag = resolveHashtagPosts()
    val found = resolveFoundRead()
    val stories = resolveStoriesSearch()
    val own = listOf(tabs.update, downloads.method, hashtag.search, found.read, stories.method)
    shape(own.indices.all { at -> own.drop(at + 1).none { it === own[at] } } &&
        own.none { method -> chat.edits.any { it.method === method } }, "two search hooks share a method")
    return MyChatsSearchSites(chat, tabs, downloads, hashtag, found, stories)
}

/**
 * The tab row's titles name each tab once, behind a check of the item's type against a number, and
 * the one method that names all five is the row's adapter. Its update builds the row afresh.
 */
private fun BytecodePatchContext.resolveTabRow(): TabRow {
    val titled = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/hushtelegram/extension/")) return@classDefForEach
        classDef.methods.filterTo(titled) { method -> method.instructions().let { body ->
            SearchTab.entries.all { tab -> body.any { it.readsTitle(tab.title) } } } }
    }
    val titles = titled.one("search tab titles", ::refuse)
    val adapter = titles.definingClass
    val body = titles.instructions()
    val found = SearchTab.entries.associateWith { tab ->
        val read = body.indices.filter { body[it].readsTitle(tab.title) }.one("${tab.title} title", ::refuse)
        // check-cast item; iget type; const number; if-ne type, number; then the title.
        val branch = body.getOrNull(read - 1)
        val number = body.getOrNull(read - 2)
        val field = body.getOrNull(read - 3)
        val cast = body.getOrNull(read - 4)
        if (branch == null || number == null || field == null || cast == null || branch.opcode != Opcode.IF_NE ||
            number.opcode !in CONSTS || number !is NarrowLiteralInstruction || field.opcode != Opcode.IGET ||
            cast.opcode != Opcode.CHECK_CAST ||
            branch.namedRegisters().toSet() != setOf(field.namedRegisters()[0], number.namedRegisters()[0]) ||
            field.namedRegisters()[1] != cast.namedRegisters()[0]) refuse("the ${tab.title} tab is no longer told apart by its type")
        Triple(cast.typeRef()!!, field.field()!!, number.narrowLiteral)
    }
    val item = found.values.map { it.first }.distinct().one("tab item class", ::refuse)
    val type = found.values.map { it.second }.distinct().one("tab type field", ::refuse)
    val types = found.mapValues { it.value.third }
    shape(type.definingClass == item && type.type == "I" && types.values.toSet().size == types.size,
        "the tabs no longer each have a type of their own")
    val itemClass = classDefByOrNull(item)
    shape(itemClass != null && itemClass.isPublic() && itemClass.fields.any { it.name == type.name && it.type == "I" &&
        AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) },
        "a tab's type can't be read from outside its class")

    // The row itself: the adapter's one ArrayList field, which the titles read.
    val list = body.mapNotNull { instruction -> instruction.field()?.takeIf {
        instruction.opcode == Opcode.IGET_OBJECT && it.definingClass == adapter && it.type == ARRAY_LIST } }.distinct()
        .one("tab list", ::refuse)
    val adapterClass = mutableClassDefBy(adapter)
    shape(adapterClass.isPublic() && adapterClass.fields.any { it.name == list.name && it.type == ARRAY_LIST &&
        AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) },
        "the tab list can't be read from outside its adapter")
    val update = adapterClass.methods.filter { method -> !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.parameterTypes.isEmpty() && method.returnType == "V" && method.instructions().let { code ->
            code.any { it.opcode == Opcode.IGET_OBJECT && it.field() == list } &&
                code.any { it.call()?.let { call -> call.definingClass == ARRAY_LIST && call.name == "clear" } == true } &&
                code.any { it.opcode == Opcode.NEW_INSTANCE && it.typeRef() == item } } }
        .one("tab row update", ::refuse)
    val code = update.instructions()
    val built = code.indices.mapNotNull { at -> code.builtTab(at, item)?.let { it to at } }
    val at = types.mapValues { (tab, number) -> built.filter { it.first == number }.map { it.second }
        .one("${tab.title} tab in the row", ::refuse) }
    val returns = code.indices.filter { code[it].opcode in EXITS }
    shape(returns.size == 1 && code[returns.single()].opcode == Opcode.RETURN_VOID, "the tab row update no longer ends in one place")
    val end = returns.single()
    shape(at.values.all { it < end }, "a tab is added after the tab row update ends")
    shape(update.localRegisterCount() <= 15, "the tab row update keeps its adapter where the hook can't read it")
    try {
        update.requireThisIntact("the tab row update", listOf(end))
    } catch (changed: PatchException) {
        refuse(changed.message.orEmpty())
    }

    // The public posts tab is added only while it's open, behind the pager's own flag: the branch
    // falls into building and adding it, and its other side lands past that add.
    val posts = at.getValue(SearchTab.PUBLIC_POSTS)
    val made = (posts downTo 0).firstOrNull { code[it].opcode == Opcode.NEW_INSTANCE && code[it].typeRef() == item }
    val guard = made?.let { (it - 1 downTo 0).firstOrNull { code[it].opcode == Opcode.IF_EQZ } }
    val flag = guard?.let { code.getOrNull(it - 1) }
    val added = (posts until code.size).firstOrNull { code[it].isAdd() }
    val skip = guard?.let { ControlFlow.of(update).normal[it].filter { next -> next != it + 1 } }
    shape(guard != null && flag?.opcode == Opcode.IGET_BOOLEAN && flag.namedRegisters()[0] == code[guard].namedRegisters().single() &&
        made == guard + 1 && added != null && skip?.singleOrNull()?.let { it > added } == true,
        "the public posts tab is no longer added only while it's open")
    val expanded = flag!!.field()!!
    val pager = expanded.definingClass
    val pagerClass = classDefByOrNull(pager)
    val holder = pagerClass?.fields?.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == adapter }.orEmpty()
        .one("pager's tab adapter", ::refuse)
    shape(pagerClass!!.isPublic() && AccessFlags.PUBLIC.isSet(holder.accessFlags) &&
        pagerClass.fields.any { it.name == expanded.name && it.type == "Z" }, "the pager's tab adapter can't be read from outside it")
    return TabRow(update, end, list, item, type, types, pager, ImmutableFieldReference(pager, holder.name, holder.type), expanded)
}

/**
 * The Downloads shortcut opens search on the pager's tab number five, or six with the public posts
 * tab open: Telegram's flag plus a number. That number is how many tabs come before Downloads on the
 * row, which the hook checks before it trusts the place.
 */
private fun BytecodePatchContext.resolveDownloadsShortcut(tabs: TabRow): DownloadsShortcut {
    val code = tabs.update.instructions()
    val downloads = code.indices.single { code.builtTab(it, tabs.item) == tabs.types.getValue(SearchTab.DOWNLOADS) }
    // Every tab added before Downloads is always there, but public posts, which the flag counts.
    val before = code.indices.count { it < downloads && code[it].isAdd() } - 1

    val sites = mutableListOf<Pair<Method, Int>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/hushtelegram/extension/")) return@classDefForEach
        for (method in classDef.methods) {
            val body = method.instructions()
            for (at in 0 until body.size - 2) {
                if (body[at].opcode == Opcode.IGET_BOOLEAN && body[at].field() == tabs.expanded &&
                    body[at + 1].opcode == Opcode.ADD_INT_LIT8 && body[at + 2].call()?.name == "setPosition") sites += method to at
            }
        }
    }
    val (found, read) = sites.one("Downloads shortcut", ::refuse)
    val method = mutableClassDefBy(found.definingClass).methods.single { it.sameSignature(found) }
    val body = method.instructions()
    val (position, pager) = body[read].namedRegisters()
    val add = body[read + 1]
    val call = body[read + 2]
    val flow = ControlFlow.of(method)
    shape(add.namedRegisters() == listOf(position, position) && (add as NarrowLiteralInstruction).narrowLiteral == before &&
        call.opcode == Opcode.INVOKE_VIRTUAL && call.call()?.let { it.definingClass == tabs.pager && it.params() == listOf("I") &&
            it.returnType == "V" } == true && call.namedRegisters() == listOf(pager, position) &&
        flow.into(read + 1) == listOf(read) && flow.into(read + 2) == listOf(read + 1) && pager <= 15 && position <= 15,
        "the Downloads shortcut no longer opens the Downloads tab by its place on the row")
    return DownloadsShortcut(method, read + 2, pager, position)
}

/**
 * Telegram's hashtag search picks a list of results by the search's kind first thing. One kind looks
 * through your own messages; the others ask for public posts, or for the posts of the channel a tag
 * like `#tag@channel` names, which it looks up on Telegram's server when this phone doesn't know it.
 */
private fun BytecodePatchContext.resolveHashtagPosts(): HashtagPosts {
    val controller = classDefByOrNull(HASHTAG_SEARCH) ?: refuse("no hashtag search")
    val search = mutableClassDefBy(HASHTAG_SEARCH).methods.filter { it.name == "searchHashtag" &&
        it.params() == listOf(STRING, "I", "I", "I") && it.returnType == "V" && !AccessFlags.STATIC.isSet(it.accessFlags) }
        .one("hashtag search", ::refuse)
    shape(search.instructions().any { it.opcode == Opcode.NEW_INSTANCE && it.typeRef() == PUBLIC_POSTS_REQUEST },
        "the hashtag search no longer asks for public posts")
    val pick = controller.methods.filter { it.name == "getSearchResult" && it.params() == listOf("I") &&
        it.returnType == HASHTAG_RESULT && it.isCallable() }.one("hashtag result picker", ::refuse)
    val picks = pick.instructions()
    val kind = pick.parameterRegisterNumber(0)
    // const number; if-ne kind, number; then that kind's list.
    fun kindOf(results: String): Int {
        val at = picks.indices.filter { picks[it].opcode == Opcode.IGET_OBJECT && picks[it].field()?.let { field ->
            field.definingClass == HASHTAG_SEARCH && field.name == results } == true }.one("$results results", ::refuse)
        val branch = picks.getOrNull(at - 1)
        val number = picks.getOrNull(at - 2)
        if (branch == null || number == null || branch.opcode != Opcode.IF_NE || number.opcode !in CONSTS ||
            number !is NarrowLiteralInstruction || branch.namedRegisters().toSet() != setOf(kind, number.namedRegisters()[0])) {
            refuse("the hashtag result picker no longer picks $results by kind")
        }
        return number.narrowLiteral
    }
    val myMessages = kindOf("myMessagesSearch")
    shape(listOf(myMessages, kindOf("channelPostsSearch"), kindOf("localPostsSearch")).toSet().size == 3,
        "the hashtag result picker no longer keeps your messages apart from posts")

    val self = search.localRegisterCount()
    val hashtag = search.parameterRegisterNumber(0)
    val guid = search.parameterRegisterNumber(1)
    val asked = search.parameterRegisterNumber(2)
    val first = search.instructions().firstOrNull()
    shape(first?.call()?.let { it.definingClass == HASHTAG_SEARCH && it.name == "getSearchResult" } == true &&
        first.namedRegisters() == listOf(self, asked), "the hashtag search no longer starts by picking its results by kind")
    // The hook borrows v0, which holds nothing before the method's first instruction, and passes this,
    // the tag, the screen and the kind.
    shape(self >= 1 && listOf(hashtag, guid, asked).all { it <= 15 }, "the hashtag search keeps its registers where the hook can't use them")

    // What the runtime's lastHashtag and ownChat stubs read, so each must be public.
    val messages = classDefByOrNull(MESSAGES_CONTROLLER)
    val chats = classDefByOrNull(CHAT_OBJECT)
    shape(classDefByOrNull(HASHTAG_RESULT)?.hasField("lastHashtag", STRING, static = false) == true &&
        messages != null && messages.isPublic() && chats != null && chats.isPublic() &&
        messages.methods.any { it.name == "getInstance" && it.params() == listOf("I") && it.returnType == MESSAGES_CONTROLLER &&
            it.isPublicStatic() } &&
        messages.methods.any { it.name == "getUserOrChat" && it.params() == listOf(STRING) && it.returnType == TL_OBJECT && it.isCallable() } &&
        chats.methods.any { it.name == "isNotInChat" && it.params() == listOf(TL_CHAT) && it.returnType == "Z" && it.isPublicStatic() } &&
        listOf(TL_USER, TL_CHAT).all { classDefByOrNull(it)?.isPublic() == true },
        "the hashtag search can't tell your own chats from outside it")

    // What the finish reads and writes from the extension, so each must be public.
    val result = classDefByOrNull(HASHTAG_RESULT)
    val notifications = classDefByOrNull(NOTIFICATIONS)
    shape(controller.isPublic() && result != null && result.isPublic() && notifications != null && notifications.isPublic() &&
        controller.hasField("currentAccount", "I", static = false) &&
        result.hasField("loading", "Z", static = false) && result.hasField("endReached", "Z", static = false) &&
        result.methods.any { it.name == "clear" && it.parameterTypes.isEmpty() && it.returnType == "V" && it.isCallable() } &&
        notifications.hasField("hashtagSearchUpdated", "I", static = true) &&
        notifications.methods.any { it.name == "getInstance" && it.params() == listOf("I") && it.returnType == NOTIFICATIONS &&
            AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) } &&
        notifications.methods.any { it.name == "postNotificationName" && it.params() == listOf("I", "[Ljava/lang/Object;") &&
            it.returnType == "V" && it.isCallable() },
        "the hashtag search can't be finished from outside it")
    return HashtagPosts(search, self, hashtag, guid, asked, myMessages)
}

/**
 * Every search for accounts by name, from chat search, New Message, a contact, forward, member, gift
 * or giveaway picker, or a search tab, gets its answer read by the answer's own readParams. That
 * fills four lists, your own matches and everyone else's plus the accounts and chats both name, and
 * ends in one place, where the hook hands the answer over before any screen sees it.
 */
private fun BytecodePatchContext.resolveFoundRead(): FoundRead {
    val found = classDefByOrNull(CONTACTS_FOUND) ?: refuse("no account search answer")
    shape(found.isPublic() && FOUND_LISTS.all { name -> found.hasField(name, ARRAY_LIST, static = false) },
        "the account search answer's lists can't be read from outside it")
    val read = mutableClassDefBy(CONTACTS_FOUND).methods.filter { it.name == "readParams" && it.parameterTypes.size == 2 &&
        it.returnType == "V" && !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null }
        .one("account search answer reader", ::refuse)
    val body = read.instructions()
    val exits = body.indices.filter { body[it].opcode in EXITS }
    shape(exits.size == 1 && body[exits.single()].opcode == Opcode.RETURN_VOID, "the account search answer reader no longer ends in one place")
    val end = exits.single()
    val self = read.localRegisterCount()
    shape(FOUND_LISTS.all { name -> (0 until end).any { at -> body[at].opcode == Opcode.IPUT_OBJECT &&
        body[at].field()?.let { it.definingClass == CONTACTS_FOUND && it.name == name } == true &&
        body[at].namedRegisters().getOrNull(1) == self } },
        "the account search answer reader no longer fills its four lists")
    shape(self <= 15, "the account search answer reader keeps itself where the hook can't read it")
    try {
        read.requireThisIntact("the account search answer reader", listOf(end))
    } catch (changed: PatchException) {
        refuse(changed.message.orEmpty())
    }
    // What the runtime's peerKey stub reads, so each must be public.
    val user = classDefByOrNull(TL_USER)
    val chat = classDefByOrNull(TL_CHAT)
    val peer = classDefByOrNull(TL_PEER)
    shape(user != null && user.isPublic() && user.hasField("id", "J", static = false) &&
        chat != null && chat.isPublic() && chat.hasField("id", "J", static = false) &&
        peer != null && peer.isPublic() && listOf("user_id", "chat_id", "channel_id").all { peer.hasField(it, "J", static = false) },
        "an account search answer's accounts and chats can't be told apart from outside them")
    return FoundRead(read, end, self)
}

/**
 * Public stories under a hashtag load a page at a time through the one method that builds their
 * request. It answers whether it started loading, and its first lines answer no when there's nothing
 * more to load, which is the answer the hook gives.
 */
private fun BytecodePatchContext.resolveStoriesSearch(): StoriesSearch {
    val builders = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/hushtelegram/extension/")) return@classDefForEach
        classDef.methods.filterTo(builders) { method -> method.instructions().any {
            it.opcode == Opcode.NEW_INSTANCE && it.typeRef() == PUBLIC_STORIES } }
    }
    val found = builders.one("public stories search", ::refuse)
    val method = mutableClassDefBy(found.definingClass).methods.single { it.sameSignature(found) }
    val body = method.instructions()
    val request = body.indices.first { body[it].opcode == Opcode.NEW_INSTANCE && body[it].typeRef() == PUBLIC_STORIES }
    // const/4 vX, 0x0; return vX, ahead of the request.
    val none = (1 until request).any { at -> body[at].opcode == Opcode.RETURN && body[at - 1].opcode in CONSTS &&
        (body[at - 1] as NarrowLiteralInstruction).narrowLiteral == 0 && body[at - 1].namedRegisters() == body[at].namedRegisters() }
    shape(method.returnType == "Z" && !AccessFlags.STATIC.isSet(method.accessFlags) && none,
        "the public stories search no longer answers no when there's nothing to load")
    // The hook borrows v0, which holds nothing before the method's first instruction.
    shape(method.localRegisterCount() >= 1, "the public stories search has no register the hook can borrow")
    return StoriesSearch(method)
}

private fun BytecodePatchContext.requireRuntime() {
    val owner = classDefByOrNull(MY_CHATS_SEARCH)
    shape(owner != null && owner.isPublic(), "no public search only my chats runtime")
    val needed = listOf(
        Triple("dropPublicTabs", listOf(ARRAY_LIST), "V"),
        Triple("downloadsAt", listOf("Ljava/lang/Object;", "I"), "I"),
        Triple("keepHashtag", listOf("Ljava/lang/Object;", STRING, "I"), "Z"),
        Triple("endPublicPosts", listOf("Ljava/lang/Object;", "I", "I"), "V"),
        Triple("dropPublicResults", listOf("Ljava/lang/Object;"), "V"),
        Triple("publicTab", listOf("Ljava/lang/Object;"), "Z"),
        Triple("downloadsTab", listOf("Ljava/lang/Object;"), "Z"),
        Triple("tabs", listOf("Ljava/lang/Object;"), ARRAY_LIST),
        Triple("finishPublicPosts", listOf("Ljava/lang/Object;", "I", "[Ljava/lang/Object;"), "V"),
        Triple("lastHashtag", listOf("Ljava/lang/Object;", "I"), STRING),
        Triple("ownChat", listOf("Ljava/lang/Object;", STRING), "Z"),
        Triple("foundLists", listOf("Ljava/lang/Object;"), "[$ARRAY_LIST"),
        Triple("peerKey", listOf("Ljava/lang/Object;"), "J"),
    )
    for ((name, parameters, result) in needed) {
        shape(owner!!.methods.count { it.name == name && it.params() == parameters && it.returnType == result &&
            AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
            !AccessFlags.NATIVE.isSet(it.accessFlags) && !AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.implementation != null } == 1 &&
            owner.methods.count { it.name == name && AccessFlags.STATIC.isSet(it.accessFlags) } == 1,
            "no callable public static runtime $name")
    }
}

/**
 * The number a tab item is built with, when instruction [at] is the `<init>(I)` of a new [item] and
 * the last write before it to the number's register is a constant.
 */
private fun List<Instruction>.builtTab(at: Int, item: String): Int? {
    val init = this[at].call() ?: return null
    if (this[at].opcode != Opcode.INVOKE_DIRECT || init.definingClass != item || init.name != "<init>" || init.params() != listOf("I")) {
        return null
    }
    val number = this[at].namedRegisters().getOrNull(1) ?: return null
    val write = (at - 1 downTo 0).firstOrNull { number in this[it].writes() } ?: return null
    return (this[write] as? NarrowLiteralInstruction)?.takeIf { this[write].opcode in CONSTS }?.narrowLiteral
}

private fun Instruction.isAdd() =
    call()?.let { it.definingClass == ARRAY_LIST && it.name == "add" && it.params() == listOf("Ljava/lang/Object;") } == true

/** Every instruction that can run right before [index], by a fall-through, a branch or a throw. */
private fun ControlFlow.into(index: Int): List<Int> = instructions.indices.filter { index in normal[it] || index in exceptional[it] }

private fun refuse(reason: String): Nothing =
    throw PatchException("$PATCH: $reason; refuses changed search geometry before editing")
private fun shape(valid: Boolean, reason: String) {
    if (!valid) refuse(reason)
}
private fun ClassDef.isPublic() = AccessFlags.PUBLIC.isSet(accessFlags)
private fun Method.isCallable() = AccessFlags.PUBLIC.isSet(accessFlags) && !AccessFlags.STATIC.isSet(accessFlags) &&
    !AccessFlags.ABSTRACT.isSet(accessFlags)
private fun Method.isPublicStatic() = AccessFlags.PUBLIC.isSet(accessFlags) && AccessFlags.STATIC.isSet(accessFlags)
private fun ClassDef.hasField(name: String, type: String, static: Boolean) = fields.any { it.name == name && it.type == type &&
    AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == static }
private fun Method.params(): List<String> = parameterTypes.map { it.toString() }
private fun MethodReference.params(): List<String> = parameterTypes.map { it.toString() }
private fun Method.sameSignature(other: Method) = name == other.name && returnType == other.returnType && params() == other.params()
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Instruction.typeRef(): String? = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type
private fun Instruction.readsTitle(name: String) = opcode == Opcode.SGET && field()?.let { it.definingClass == TITLES && it.name == name } == true
/** The registers an instruction sets: the first named one for writes, both halves for a wide one. */
private fun Instruction.writes(): Set<Int> {
    if (!opcode.setsRegister()) return emptySet()
    val first = namedRegisters().firstOrNull() ?: return emptySet()
    return if (opcode.setsWideRegister()) setOf(first, first + 1) else setOf(first)
}
