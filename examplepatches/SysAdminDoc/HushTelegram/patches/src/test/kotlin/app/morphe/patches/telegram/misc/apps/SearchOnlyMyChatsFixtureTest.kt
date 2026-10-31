/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.apps

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.drafts.ChatSearchHooks
import app.morphe.patches.telegram.misc.drafts.LOCAL_SEARCH
import app.morphe.patches.telegram.misc.drafts.SEARCH_CHANGES
import app.morphe.patches.telegram.misc.drafts.SEARCH_KEEP
import app.morphe.patches.telegram.misc.drafts.SEARCH_SENT
import app.morphe.patches.telegram.misc.drafts.SearchLookup
import app.morphe.patches.telegram.misc.drafts.changeSearch
import app.morphe.patches.telegram.misc.drafts.localSearchHosts
import app.morphe.patches.telegram.misc.drafts.resolveChatSearch
import app.morphe.patches.telegram.misc.drafts.resolveLocalSearch
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test
import java.io.File
import java.util.concurrent.ConcurrentHashMap

private const val CHANNELS_POSTS = "Lorg/telegram/tgnet/TLRPC\$TL_channels_searchPosts;"
private const val TITLES = "Lorg/telegram/messenger/R\$string;"
private const val NOTIFICATIONS = "Lorg/telegram/messenger/NotificationCenter;"
private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
private val LOCAL_PHONES = ChatSearchHooks("Disable draft link previews", LOCAL_SEARCH).phones

/**
 * Search only my chats on the pinned builds: the tab row, the Downloads shortcut, a hashtag's searches,
 * the Chats tab's public lookups, every account search answer and the public stories search.
 */
class SearchOnlyMyChatsFixtureTest {
    @Test fun `each public part of search takes its own way out and the rest of search stays stock`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of((ExtensionDex.classes() + myChatsSearchHosts(build)).distinctBy { it.type })
            val sites = context.resolveMyChatsSearch()
            assertEquals("$name: the Chats tab's public lookups, the phone match and none of its message searches",
                listOf(SearchLookup.SPONSORED, SearchLookup.POSTS, SearchLookup.USERNAMES, SearchLookup.PHONES), sites.chat.edits.map { it.lookup })
            // Telegram's own numbers for its tabs, as the titles read them.
            assertEquals("$name: tab numbers", mapOf(SearchTab.CHANNELS to 1, SearchTab.APPS to 4, SearchTab.POSTS to 6,
                SearchTab.PUBLIC_POSTS to 5, SearchTab.DOWNLOADS to 2), sites.tabs.types)
            assertEquals("$name: the hashtag search that looks only through your own messages", 1, sites.hashtag.myMessages)

            val methods = (sites.chat.edits.map { it.method } + listOf(sites.tabs.update, sites.downloads.method, sites.hashtag.search,
                sites.found.read, sites.stories.method)).distinctBy { System.identityHashCode(it) }
            val stock = methods.associate { System.identityHashCode(it) to ImmutableMethod.of(it) }
            sites.rehearse()
            for (method in methods) assertEquals("$name: the rehearsal leaves ${method.name} alone",
                stock.getValue(System.identityHashCode(method)).body().map(::operands), method.body().map(::operands))
            context.writeMyChatsSearchStubs(sites)
            sites.apply()

            // Right after the username lookup, which got no text, the runtime's phone match gets what it got with the text read back.
            val phones = sites.chat.edits.single { it.lookup == SearchLookup.PHONES }
            assertTrue("$name: the phone match is the second step's",
                phones.method === sites.chat.edits.single { it.lookup == SearchLookup.USERNAMES }.method)
            val step = phones.method.body()
            val helper = step.indices.single { step[it].call()?.parameterTypes?.size == 12 }
            val passed = step[helper].namedRegisters()
            val text = passed[1]
            val readBack = step[helper + 1]
            assertEquals("$name: the text is read back into its register", listOf(Opcode.IGET_OBJECT, text),
                listOf(readBack.opcode, readBack.namedRegisters()[0]))
            val loaded = (helper - 1 downTo 0).first { step[it].opcode == Opcode.IGET_OBJECT && step[it].namedRegisters()[0] == text }
            assertEquals("$name: from where the step got it", operands(step[loaded]), operands(readBack))
            assertEquals("$name: the runtime gets what the lookup got", listOf(Opcode.INVOKE_STATIC_RANGE, passed, MY_CHATS_HOOKS.phones),
                operands(step[helper + 2]))
            assertEquals("$name: and on a match has the tab redraw", listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.IGET_OBJECT,
                Opcode.INVOKE_VIRTUAL, Opcode.NOP), step.subList(helper + 3, helper + 8).map { it.opcode })
            assertEquals("$name: the lookUp stub calls the helper on what it's handed",
                listOf(Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL_RANGE, Opcode.RETURN_VOID),
                context.mutableClassDefBy(MY_CHATS_SEARCH).methods.single { it.name == "lookUp" }.body().map { it.opcode })
            assertEquals("$name: the stub's call is the helper's lookup", step[helper].ref(),
                context.mutableClassDefBy(MY_CHATS_SEARCH).methods.single { it.name == "lookUp" }.body()[1].ref())

            // The tab row: every way to its end now passes the runtime its list first.
            val update = sites.tabs.update
            val row = stock.getValue(System.identityHashCode(update)).body()
            val rowAfter = update.body()
            val end = sites.tabs.end
            assertEquals("$name: the row keeps every instruction it had", row.map(::operands),
                rowAfter.indices.filter { it !in end until end + 2 }.map { operands(rowAfter[it]) })
            assertEquals("$name: the row's list goes to the runtime", listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.RETURN_VOID),
                rowAfter.subList(end, end + 3).map { it.opcode })
            assertEquals("$name: it's the row's own list", sites.tabs.list.toString(), rowAfter[end].ref())
            assertEquals("$name: read from the adapter", update.implementation!!.registerCount - 1, rowAfter[end].namedRegisters()[1])
            assertEquals("$name: and handed over", listOf(rowAfter[end].namedRegisters()[0]), rowAfter[end + 1].namedRegisters())
            assertEquals("$name: to dropPublicTabs", DROP_PUBLIC_TABS, rowAfter[end + 1].ref())
            val stockInto = ControlFlow.of(stock.getValue(System.identityHashCode(update))).let { flow ->
                flow.instructions.indices.filter { end in flow.normal[it] } }
            val into = ControlFlow.of(update).let { flow -> flow.instructions.indices.filter { end in flow.normal[it] } }
            assertEquals("$name: every way to the row's end reaches the hook", stockInto.size, into.size)
            assertTrue("$name: the row ends more than one way, so the jumps were moved too", stockInto.size > 1)

            // The Downloads shortcut asks where Downloads is, between Telegram's count and the call.
            val shortcut = sites.downloads
            val call = shortcut.call
            val opens = shortcut.method.body()
            val flag = opens[call - 2]
            assertEquals("$name: Telegram's count", listOf(Opcode.IGET_BOOLEAN, Opcode.ADD_INT_LIT8),
                listOf(flag.opcode, opens[call - 1].opcode))
            assertEquals("$name: tabs before Downloads", 5, (opens[call - 1] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals("$name: the count's flag is the pager's public posts flag", sites.tabs.expanded, (flag as ReferenceInstruction).reference)
            assertEquals("$name: the runtime gets the pager and Telegram's place", listOf(shortcut.pager, shortcut.position), opens[call].namedRegisters())
            assertEquals("$name: downloadsAt", DOWNLOADS_AT, opens[call].ref())
            assertEquals("$name: its answer replaces the place", listOf(Opcode.MOVE_RESULT, listOf(shortcut.position), null), operands(opens[call + 1]))
            assertEquals("$name: and the call opens it", listOf("setPosition", listOf(shortcut.pager, shortcut.position)),
                listOf(opens[call + 2].call()?.name, opens[call + 2].namedRegisters()))

            // A hashtag's search past your own messages asks first, and ends there on no.
            val search = sites.hashtag.search
            val hashtag = search.body()
            val stockHashtag = stock.getValue(System.identityHashCode(search)).body()
            assertEquals("$name: hashtag gate", listOf(Opcode.CONST, Opcode.IF_EQ, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ,
                Opcode.INVOKE_STATIC, Opcode.RETURN_VOID), hashtag.take(7).map { it.opcode })
            assertEquals("$name: your own messages' kind", 1, (hashtag[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals("$name: compared with the kind asked for", setOf(0, sites.hashtag.kind), hashtag[1].namedRegisters().toSet())
            assertEquals("$name: asks keepHashtag", KEEP_HASHTAG, hashtag[2].ref())
            assertEquals("$name: with the controller, the tag and the kind",
                listOf(sites.hashtag.self, sites.hashtag.hashtag, sites.hashtag.kind), hashtag[2].namedRegisters())
            assertEquals("$name: the tag is the first argument", search.implementation!!.registerCount - 4, sites.hashtag.hashtag)
            assertEquals("$name: ends through endPublicPosts", END_PUBLIC_POSTS, hashtag[5].ref())
            assertEquals("$name: with the controller, the screen and the kind",
                listOf(sites.hashtag.self, sites.hashtag.guid, sites.hashtag.kind), hashtag[5].namedRegisters())
            assertEquals("$name: the stock search follows untouched", stockHashtag.map(::operands), hashtag.drop(7).map(::operands))
            val flow = ControlFlow.of(search)
            assertEquals("$name: your own messages go to the stock search", setOf(2, 7), flow.normal[1].toSet())
            assertEquals("$name: a yes goes to the stock search", setOf(5, 7), flow.normal[4].toSet())
            assertTrue("$name: the public posts request is still the stock search's",
                hashtag.drop(7).any { it.opcode == Opcode.NEW_INSTANCE && it.ref() == CHANNELS_POSTS })

            // Every account search answer hands itself over once all four lists are read, right before its reader returns.
            val read = sites.found.read
            val answer = read.body()
            val stockAnswer = stock.getValue(System.identityHashCode(read)).body()
            val found = sites.found.end
            assertEquals("$name: the answer is the reader's own", read.implementation!!.registerCount - 3, sites.found.self)
            assertEquals("$name: the reader keeps every instruction it had", stockAnswer.map(::operands),
                answer.indices.filter { it != found }.map { operands(answer[it]) })
            assertEquals("$name: the answer goes to dropPublicResults, then the reader returns",
                listOf(listOf(Opcode.INVOKE_STATIC, listOf(sites.found.self), DROP_PUBLIC_RESULTS), listOf(Opcode.RETURN_VOID, emptyList<Int>(), null)),
                answer.subList(found, found + 2).map(::operands))
            assertEquals("$name: the only way out of the reader", listOf(found + 1), answer.indices.filter { answer[it].opcode == Opcode.RETURN_VOID })
            assertEquals("$name: all four lists are read in first", FOUND_LISTS.toSet(), answer.take(found)
                .filter { it.opcode == Opcode.IPUT_OBJECT && it.namedRegisters()[1] == sites.found.self }
                .map { ((it as ReferenceInstruction).reference as FieldReference).name }.toSet())

            // The public stories search answers no, as for nothing more to load, before building its request.
            val stories = sites.stories.method
            val page = stories.body()
            val stockPage = stock.getValue(System.identityHashCode(stories)).body()
            assertEquals("$name: public stories gate", listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4,
                Opcode.RETURN), page.take(5).map { it.opcode })
            assertEquals("$name: asks keep", MY_CHATS_HOOKS.keep, page[0].ref())
            assertEquals("$name: answers no", 0, (page[3] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals("$name: the answer is the one it returns", page[3].namedRegisters(), page[4].namedRegisters())
            assertEquals("$name: the stock search follows untouched", stockPage.map(::operands), page.drop(5).map(::operands))
            assertEquals("$name: a no goes to the stock search", setOf(3, 5), ControlFlow.of(stories).normal[2].toSet())
            assertTrue("$name: it's the search that asks for public stories",
                page.drop(5).any { it.opcode == Opcode.NEW_INSTANCE && it.ref() == PUBLIC_STORIES })

            // The stubs read what was found.
            val runtime = context.mutableClassDefBy(MY_CHATS_SEARCH)
            fun stub(name: String) = runtime.methods.single { it.name == name }.body()
            fun literals(body: List<Instruction>) = body.filter { it.opcode == Opcode.CONST }.map { (it as NarrowLiteralInstruction).narrowLiteral }.toSet()
            assertEquals("$name: public tabs", setOf(1, 4, 6, 5), literals(stub("publicTab")))
            assertEquals("$name: Downloads", setOf(2), literals(stub("downloadsTab")))
            for (predicate in listOf("publicTab", "downloadsTab")) {
                val body = stub(predicate)
                assertTrue("$name: $predicate checks the item's class", body.any { it.opcode == Opcode.INSTANCE_OF && it.ref() == sites.tabs.item })
                assertTrue("$name: $predicate reads its type", body.any { it.opcode == Opcode.IGET && it.ref() == sites.tabs.type.toString() })
            }
            assertEquals("$name: the row from the pager", listOf(sites.tabs.adapter.toString(), sites.tabs.list.toString()),
                stub("tabs").filter { it.opcode == Opcode.IGET_OBJECT }.map { it.ref() })
            val finish = stub("finishPublicPosts").mapNotNull { it.ref() }
            for (part in listOf("$HASHTAG_SEARCH->getSearchResult(I)$HASHTAG_RESULT", "$HASHTAG_RESULT->clear()V",
                "$HASHTAG_RESULT->loading:Z", "$HASHTAG_RESULT->endReached:Z", "$NOTIFICATIONS->hashtagSearchUpdated:I",
                "$NOTIFICATIONS->postNotificationName(I[Ljava/lang/Object;)V")) {
                assertTrue("$name: the finish uses $part", part in finish)
            }
            assertEquals("$name: the last tag of that kind", listOf(HASHTAG_SEARCH, "$HASHTAG_SEARCH->getSearchResult(I)$HASHTAG_RESULT",
                "$HASHTAG_RESULT->lastHashtag:Ljava/lang/String;"), stub("lastHashtag").mapNotNull { it.ref() })
            val own = stub("ownChat").mapNotNull { it.ref() }
            for (part in listOf("$MESSAGES_CONTROLLER->getUserOrChat(Ljava/lang/String;)Lorg/telegram/tgnet/TLObject;", TL_USER, TL_CHAT,
                "$CHAT_OBJECT->isNotInChat($TL_CHAT)Z")) {
                assertTrue("$name: a chat of yours is judged with $part", part in own)
            }
            assertEquals("$name: the answer's lists, in order", FOUND_LISTS.map { "$CONTACTS_FOUND->$it:Ljava/util/ArrayList;" },
                stub("foundLists").filter { it.opcode == Opcode.IGET_OBJECT }.map { it.ref() })
            assertEquals("$name: ids for an account, a chat and a peer", listOf("$TL_USER->id:J", "$TL_CHAT->id:J",
                "$TL_PEER->user_id:J", "$TL_PEER->chat_id:J", "$TL_PEER->channel_id:J"),
                stub("peerKey").filter { it.opcode == Opcode.IGET_WIDE }.map { it.ref() })
        }
    }

    @Test fun `the whole patch goes in without a warning and says so in its build facts`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextFor(build)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hidePopularAppsPatch.execute(context) })
            for (flag in listOf("hidePopularApps", "myChatsSearch", "nameFold", "blockNewChats")) {
                assertEquals("${build.name}: $flag", 1, statusOf(context, flag))
            }
        }
    }

    @Test fun `Keep searches on this phone and Search only my chats hook chat search in either order`() {
        for (build in Fixtures.declaredBuilds()) {
            for (localFirst in listOf(true, false)) {
                val where = "${build.name}, Keep searches on this phone ${if (localFirst) "first" else "second"}"
                val context = PatchContexts.of((ExtensionDex.classes() + localSearchHosts(build)).distinctBy { it.type })
                val search = context.resolveLocalSearch().edits.first { it.lookup == SearchLookup.SPONSORED }.method
                val step = context.resolveLocalSearch().edits.first { it.lookup == SearchLookup.USERNAMES }.method
                fun mine() = context.resolveChatSearch(MY_CHATS_HOOKS, MY_CHATS_LOOKUPS).apply()
                if (!localFirst) mine()
                context.resolveLocalSearch().apply()
                if (localFirst) mine()

                val body = search.body()
                val local = body.indices.filter { body[it].ref() == SEARCH_KEEP }
                val own = body.indices.filter { body[it].ref() == MY_CHATS_HOOKS.keep }
                assertEquals("$where: both ask in front of the sponsored and the posts checks", listOf(2, 2), listOf(local.size, own.size))
                val flow = ControlFlow.of(search)
                for (at in local + own) {
                    assertEquals("$where: each answer is checked", Opcode.IF_NEZ, body[at + 2].opcode)
                    assertEquals("$where: and its no goes on", listOf(at + 3), flow.normal[at + 2].filter { it == at + 3 })
                }

                // The username helper gets the text through both swaps, so either can clear it.
                val code = step.body()
                val helper = code.indices.single { code[it].call()?.parameterTypes?.size == 12 }
                val text = code[helper].namedRegisters()[1]
                val swaps = listOf(code[helper - 4], code[helper - 2]).map { it.ref() }.toSet()
                assertEquals("$where: both swaps sit right before the helper", setOf(SEARCH_SENT, MY_CHATS_HOOKS.sent), swaps)
                for (at in listOf(helper - 4, helper - 2)) {
                    assertEquals("$where: a swap takes the text", listOf(text), code[at].namedRegisters())
                    assertEquals("$where: and hands it back", listOf(Opcode.MOVE_RESULT_OBJECT, listOf(text), null), operands(code[at + 1]))
                }
                val loaded = (helper - 5 downTo 0).first { code[it].opcode.setsRegister() && code[it].namedRegisters().firstOrNull() == text }
                assertEquals("$where: the text is the runnable's own", Opcode.IGET_OBJECT, code[loaded].opcode)

                // After it, each runtime's phone match, either of which reads the text back and runs it again.
                val matches = code.indices.filter { code[it].ref() in setOf(LOCAL_PHONES, MY_CHATS_HOOKS.phones) }
                assertEquals("$where: both phone matches follow the helper, one after the other", listOf(helper + 2, helper + 9), matches)
                assertEquals(setOf(LOCAL_PHONES, MY_CHATS_HOOKS.phones), matches.map { code[it].ref() }.toSet())
                for (at in matches) {
                    assertEquals("$where: a match reads the text back first", operands(code[loaded]), operands(code[at - 1]))
                    assertEquals("$where: and is handed the lookup's registers", code[helper].namedRegisters(), code[at].namedRegisters())
                    assertEquals("$where: then redraws on a match", listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.IGET_OBJECT,
                        Opcode.INVOKE_VIRTUAL, Opcode.NOP), code.subList(at + 1, at + 6).map { it.opcode })
                    assertEquals("$where: a miss goes past the redraw", setOf(at + 3, at + 5), ControlFlow.of(step).normal[at + 2].toSet())
                }
            }
        }
    }

    @Test fun `changed search geometry refuses the whole patch before any partial mutation`() {
        val changes: List<Triple<String, String, (BytecodePatchContext, MyChatsSearchSites) -> Unit>> = listOf(
            // The Apps tab's title reads another string, so no method names all five tabs.
            Triple("a public tab's title gone", "search tab titles has 0 matches") { context, sites ->
                val apps = "$TITLES->AppsTab:I"
                val title = context.mutableClassDefBy(sites.tabs.update.definingClass).methods.single { method ->
                    method.body().any { it.opcode == Opcode.SGET && it.ref() == apps } }
                val body = title.body()
                val at = body.indices.single { body[it].opcode == Opcode.SGET && body[it].ref() == apps }
                title.replaceInstruction(at, "sget v${body[at].namedRegisters()[0]}, $TITLES->SearchAppsPopular:I")
            },
            Triple("Downloads counted from another place", "no longer opens the Downloads tab by its place on the row") { _, sites ->
                val at = sites.downloads.call - 1
                val register = sites.downloads.method.body()[at].namedRegisters()[0]
                sites.downloads.method.replaceInstruction(at, "add-int/lit8 v$register, v$register, 0x4")
            },
            Triple("public posts tab always added", "the public posts tab is no longer added only while it's open") { _, sites ->
                val code = sites.tabs.update.body()
                val posts = code.indices.first { at -> code[at].opcode == Opcode.CONST_4 &&
                    (code[at] as NarrowLiteralInstruction).narrowLiteral == 5 && code.getOrNull(at + 1)?.call()?.name == "<init>" }
                val guard = (posts downTo 0).first { code[it].opcode == Opcode.IF_EQZ }
                sites.tabs.update.replaceInstruction(guard, "nop")
            },
            Triple("hashtag kind picked later", "no longer starts by picking its results by kind") { _, sites ->
                sites.hashtag.search.addInstructions(0, "nop")
            },
            Triple("row ends twice", "the tab row update no longer ends in one place") { _, sites ->
                sites.tabs.update.addInstructions(0, "return-void")
            },
            Triple("account answer ends twice", "the account search answer reader no longer ends in one place") { _, sites ->
                sites.found.read.addInstructions(0, "return-void")
            },
            Triple("account answer leaves a list unread", "the account search answer reader no longer fills its four lists") { _, sites ->
                val code = sites.found.read.body()
                val users = code.indices.single { code[it].opcode == Opcode.IPUT_OBJECT && code[it].ref()?.contains("->users:") == true }
                sites.found.read.replaceInstruction(users, "nop")
            },
            Triple("second public stories search", "public stories search has 2 matches") { _, sites ->
                sites.found.read.addInstructions(0, "new-instance v0, $PUBLIC_STORIES")
            },
            Triple("public stories always load", "the public stories search no longer answers no when there's nothing to load") { _, sites ->
                val code = sites.stories.method.body()
                val none = code.indices.first { at -> code[at].opcode == Opcode.CONST_4 &&
                    (code[at] as NarrowLiteralInstruction).narrowLiteral == 0 && code.getOrNull(at + 1)?.opcode == Opcode.RETURN }
                sites.stories.method.replaceInstruction(none, "const/4 v${code[none].namedRegisters()[0]}, 0x1")
            },
        )
        for (build in Fixtures.declaredBuilds()) {
            for ((case, reason, change) in changes) {
                val context = contextFor(build)
                change(context, context.resolveMyChatsSearch())
                assertRefusedUntouched(build, case, reason, context)
            }
            // The Chats tab's own checks, shared with Keep searches on this phone, refuse this patch too.
            val shared = setOf("sponsored check gone", "posts check gone", "text read again", "second chat search", "helper never cleared",
                "phone text's owner reused", "phone text read over its owner")
            for ((case, reason) in SEARCH_CHANGES.filter { it.first in shared }) {
                val context = contextFor(build)
                changeSearch(case, context.resolveLocalSearch())
                assertRefusedUntouched(build, case, reason, context)
            }
            assertRefusedUntouched(build, "no runtime", "no public search only my chats runtime", contextFor(build, runtime = false))
        }
    }

    @Test fun `the census has one tab row, one Downloads shortcut, one hashtag search, one account answer reader and one public stories search`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val titled = FixtureDex.methodsWhere(build, { true }) { method -> method.body().let { body ->
                SearchTab.entries.all { tab -> body.any { it.opcode == Opcode.SGET && it.ref() == "$TITLES->${tab.title}:I" } } } }
            assertEquals("$name: one method names all five tabs", 1, titled.size)
            val shortcuts = FixtureDex.methodsWhere(build, { true }) { method -> method.body().let { body ->
                body.indices.any { at -> at + 2 < body.size && body[at].opcode == Opcode.IGET_BOOLEAN &&
                    body[at + 1].opcode == Opcode.ADD_INT_LIT8 && body[at + 2].call()?.name == "setPosition" } } }
            assertEquals("$name: one place opens search at a counted tab", 1, shortcuts.size)
            val posts = FixtureDex.methodsWhere(build, { true }) { method -> method.body().any {
                it.opcode == Opcode.NEW_INSTANCE && it.ref() == CHANNELS_POSTS } }
            assertTrue("$name: the hashtag search asks for public posts: ${posts.map { it.definingClass }}",
                posts.any { it.definingClass == HASHTAG_SEARCH && it.name == "searchHashtag" })
            // Every account search answer is read by the one reader, whichever screen asked.
            val readers = FixtureDex.methodsWhere(build, { true }) { method -> method.definingClass == CONTACTS_FOUND && method.name == "readParams" }
            assertEquals("$name: one account search answer reader", 1, readers.size)
            val stories = FixtureDex.methodsWhere(build, { true }) { method -> method.body().any {
                it.opcode == Opcode.NEW_INSTANCE && it.ref() == PUBLIC_STORIES } }
            assertEquals("$name: one public stories search: ${stories.map { it.definingClass }}", 1, stories.size)
        }
    }

    private fun assertRefusedUntouched(file: File, case: String, reason: String, context: BytecodePatchContext) {
        val build = file.name
        val hosts = (myChatsSearchHosts(file) + popularAppsOwners(file)).map { it.type }.distinct()
        val before = hosts.associateWith { type -> context.mutableClassDefBy(type).methods.map { it.body().map(::operation) } }
        try {
            hidePopularAppsPatch.execute(context)
            fail("$build: $case was accepted")
        } catch (expected: PatchException) {
            val message = expected.message.orEmpty()
            assertTrue("$build: $case: $message", message.contains("before editing"))
            assertTrue("$build: $case refused for its own reason: $message", message.contains(reason))
        }
        for (type in hosts) assertEquals("$build: $case doesn't partly mutate $type", before.getValue(type),
            context.mutableClassDefBy(type).methods.map { it.body().map(::operation) })
        for (flag in listOf("hidePopularApps", "myChatsSearch")) {
            assertEquals("$build: $case leaves $flag false", 0, statusOf(context, flag))
        }
    }

    private fun statusOf(context: BytecodePatchContext, flag: String) =
        (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.body()[0] as NarrowLiteralInstruction).narrowLiteral

    private fun contextFor(build: File, runtime: Boolean = true): BytecodePatchContext {
        val extension = ExtensionDex.classes().filter { runtime || it.type != MY_CHATS_SEARCH }
        return PatchContexts.of((extension + popularAppsOwners(build) + myChatsSearchHosts(build) + nameFoldHosts(build) +
            newChatsHosts(build)).distinctBy { it.type })
    }
}

private val HOSTS = ConcurrentHashMap<String, List<ClassDef>>()
private val OWNERS = ConcurrentHashMap<String, List<ClassDef>>()

/** Hide popular apps' own loader and Apps tab. */
internal fun popularAppsOwners(build: File): List<ClassDef> = OWNERS.getOrPut(build.path) {
    FixtureDex.classesWhere(build, { true }) { method ->
        method.body().any { (it.opcode == Opcode.NEW_INSTANCE && it.ref() == GET_POPULAR_APP_BOTS) ||
            (it.opcode == Opcode.SGET && it.ref() == "$TITLES->SearchAppsPopular:I") }
    }
}

private fun Method.namesEveryTab() = body().let { body ->
    SearchTab.entries.all { tab -> body.any { it.opcode == Opcode.SGET && it.ref() == "$TITLES->${tab.title}:I" } } }

/**
 * Everything Search only my chats reads or edits: chat search and what it builds or calls, the tab
 * row's adapter with its items and pager, the screen that opens Downloads, Telegram's hashtag search
 * with its results and the notification center it posts to, the account search answer with the
 * accounts, chats and peers it lists, the lookup that tells your chats apart, and the public stories search.
 */
internal fun myChatsSearchHosts(build: File): List<ClassDef> = HOSTS.getOrPut(build.path) {
    val found = FixtureDex.classesWhere(build, { true }) { method -> method.namesEveryTab() || method.body().let { body ->
        body.indices.any { at -> at + 2 < body.size && body[at].opcode == Opcode.IGET_BOOLEAN &&
            body[at + 1].opcode == Opcode.ADD_INT_LIT8 && body[at + 2].call()?.name == "setPosition" } ||
            body.any { it.opcode == Opcode.NEW_INSTANCE && it.ref() == PUBLIC_STORIES } } }
    // The adapter's tab items and the pager whose flag it reads.
    val adapter = found.single { classDef -> classDef.methods.any { it.namesEveryTab() } }
    val named = adapter.methods.flatMap { method -> method.body().mapNotNull { instruction ->
        when (instruction.opcode) {
            Opcode.CHECK_CAST -> instruction.ref()
            Opcode.IGET_BOOLEAN -> ((instruction as ReferenceInstruction).reference as FieldReference).definingClass
            else -> null
        } } }
    val kept = FixtureDex.classes(build, named.toSet() + setOf(HASHTAG_SEARCH, HASHTAG_RESULT, NOTIFICATIONS, CONTACTS_FOUND,
        MESSAGES_CONTROLLER, CHAT_OBJECT, TL_USER, TL_CHAT, TL_PEER)).values
    (localSearchHosts(build) + found + kept).distinctBy { it.type }.map(ImmutableClassDef::of)
}

private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.ref(): String? = (this as? ReferenceInstruction)?.reference?.toString()
private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun operation(instruction: Instruction) = instruction.opcode to instruction.ref()
/** An instruction's opcode, registers and reference; a goto that grew to reach past a hook still counts as that goto. */
private fun operands(instruction: Instruction): List<Any?> =
    listOf(if (instruction.opcode in GOTOS) Opcode.GOTO else instruction.opcode, instruction.namedRegisters(), instruction.ref())
