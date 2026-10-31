/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.drafts

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patches.telegram.ads.GET_SPONSORED_PEERS
import app.morphe.patches.telegram.ads.hideAdsPatch
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import app.morphe.util.RegisterLiveness
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
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.util.concurrent.ConcurrentHashMap

private const val CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
private const val VIDEO_ADS = "Lorg/telegram/messenger/video/VideoAds;"
private const val SEARCH_ADS = "Lapp/hushtelegram/extension/telegram/ads/Ads;->skipSearchAds()Z"
private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
private val LOWERS = setOf(Opcode.SUB_INT_2ADDR, Opcode.SUB_INT, Opcode.ADD_INT_LIT8)
private const val SEARCH_PHONES = "$LOCAL_SEARCH->phones(Ljava/lang/Object;Ljava/lang/String;ZZZZZJZIIJLjava/lang/Runnable;)Z"
private const val POST = "Lorg/telegram/messenger/AndroidUtilities;->runOnUIThread(Ljava/lang/Runnable;J)V"
/** The filtered search view's search: a chat, three more numbers, a filter, a switch, the text and whether to clear. */
private val FILTERED = listOf("J", "J", "J", "J", "Z", "Ljava/lang/String;", "Z")
private val TABS = mapOf(SearchLookup.CHANNELS to "broadcasts", SearchLookup.APPS to "bots")
private val FILTERS = setOf(SearchLookup.CHAT_FILTERS, SearchLookup.MEDIA_TABS)

/** Main search on the pinned builds: where each lookup leaves, and the way past it that Telegram already has. */
class LocalSearchFixtureTest {
    @Test fun `every search lookup takes Telegram's own way past its request`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + localSearchHosts(build))
            val site = context.resolveLocalSearch()
            assertEquals("$name: one hook per lookup and one for the empty line", SearchLookup.entries, site.edits.map { it.lookup })
            val methods = site.edits.map { it.method }.distinctBy { System.identityHashCode(it) }
            assertEquals("$name: chat search, the second step and the pager hold several hooks, the rest one each", 5, methods.size)
            val pager = site.edits.single { it.lookup == SearchLookup.EMPTY_LINE }.method
            assertTrue("$name: every other tab's hook is the pager's",
                site.edits.filter { it.lookup in TABS.keys + FILTERS }.all { it.method === pager })
            val usernames = site.edits.single { it.lookup == SearchLookup.USERNAMES }
            assertTrue("$name: the phone match is the second step's", site.edits.single { it.lookup == SearchLookup.PHONES }.method === usernames.method)
            // Chat search's list redraw is RecyclerView's adapter's, the last of its superclasses before Object.
            val adapter = site.edits.single { it.lookup == SearchLookup.SPONSORED }.method.definingClass
            val hosts = localSearchHosts(build).associateBy { it.type }
            val adapterTop = generateSequence(adapter) { type -> hosts[type]?.superclass?.takeIf { it != "Ljava/lang/Object;" } }.last()
            assertTrue("$name: chat search is RecyclerView's adapter's subclass", adapterTop != adapter)
            val helper = usernames.method.body()[usernames.index].call()!!
            assertEquals("$name: the lookUp stub calls the helper on what it's handed",
                "check-cast p0, ${helper.definingClass}\ninvoke-virtual/range {p0 .. p14}, $helper\nreturn-void", site.lookUp)
            val stock = methods.associate { System.identityHashCode(it) to ImmutableMethod.of(it) }
            // The count of answers chat search waits for, read first on global message search's way past.
            val waiting = site.edits.single { it.lookup == SearchLookup.MESSAGES }.let { it.method.body()[it.jump!!].ref() }

            site.rehearse()
            for (method in methods) assertEquals("$name: the rehearsal leaves ${method.name} alone",
                stock.getValue(System.identityHashCode(method)).body().map(::searchOperands), method.body().map(::searchOperands))
            site.apply()

            for (method in methods) {
                val own = site.edits.filter { it.method === method }.sortedBy { it.index }
                val old = stock.getValue(System.identityHashCode(method))
                val before = old.body()
                val after = method.body()
                fun size(edit: SearchEdit) = when {
                    edit.lookup == SearchLookup.PHONES -> 7
                    edit.jump == null -> 2
                    else -> 3
                }
                fun moved(index: Int) = index + own.filter { it.index <= index }.sumOf { size(it) }
                fun hookAt(edit: SearchEdit) = edit.index + own.filter { it.index < edit.index }.sumOf { size(it) }
                val hooks = own.flatMap { edit -> hookAt(edit) until hookAt(edit) + size(edit) }.toSet()
                // A hook with an odd number of code units moves a switch table off its four byte line, and
                // the assembler pads it with a nop, so a nop right in front of a table is padding on either side.
                fun padding(body: List<Instruction>, index: Int) = body[index].opcode == Opcode.NOP &&
                    body.getOrNull(index + 1)?.opcode?.format?.isPayloadFormat == true
                assertEquals("$name: ${method.name} keeps every instruction it had",
                    before.indices.filter { !padding(before, it) }.map { searchOperands(before[it]) },
                    after.indices.filter { it !in hooks && !padding(after, it) }.map { searchOperands(after[it]) })
                val oldFlow = ControlFlow.of(old)
                val flow = ControlFlow.of(method)
                val live = RegisterLiveness.of(old)
                for (edit in own) {
                    val what = "$name: ${edit.lookup}"
                    val at = hookAt(edit)
                    if (edit.lookup == SearchLookup.PHONES) {
                        // Right after the username lookup, the runtime gets what that call got, with the text read back.
                        val call = usernames.index
                        val passed = before[call].namedRegisters()
                        val text = passed[1]
                        val load = (call - 1 downTo 0).first { text in before[it].namedRegisters().take(1) && before[it].opcode.setsRegister() }
                        assertEquals("$what sits right after the username lookup", call + 1, edit.index)
                        assertEquals("$what is handed the lookup's own registers", (passed.first()..passed.first() + 14).toList(), passed)
                        assertEquals("$what reads the text back from where the step got it",
                            listOf(Opcode.IGET_OBJECT, before[load].namedRegisters(), before[load].ref()), searchOperands(after[at]))
                        assertEquals("$what hands the runtime what the lookup got",
                            listOf(Opcode.INVOKE_STATIC_RANGE, passed, SEARCH_PHONES), searchOperands(after[at + 1]))
                        assertEquals("$what takes the runtime's answer into the text register",
                            listOf(Opcode.MOVE_RESULT, listOf(text), null), searchOperands(after[at + 2]))
                        assertEquals("$what goes past the redraw when nothing matched", Opcode.IF_EQZ, after[at + 3].opcode)
                        assertEquals(listOf(text), after[at + 3].namedRegisters())
                        assertEquals(setOf(at + 4, at + 6), flow.normal[at + 3].toSet())
                        val held = (after[at + 4] as ReferenceInstruction).reference as FieldReference
                        assertEquals("$what reads chat search from the object the step read",
                            listOf(Opcode.IGET_OBJECT, listOf(text, before[load].namedRegisters()[1])), searchOperands(after[at + 4]).take(2))
                        assertEquals("$what reads the step's own chat search", listOf(before[load].ref()!!.substringBefore("->"), adapter),
                            listOf(held.definingClass, held.type))
                        val redraw = after[at + 5].call()!!
                        assertEquals("$what has chat search's list redraw", listOf(Opcode.INVOKE_VIRTUAL, listOf(text)),
                            searchOperands(after[at + 5]).take(2))
                        assertEquals(listOf(adapterTop, emptyList<String>(), "V"),
                            listOf(redraw.definingClass, redraw.parameterTypes.map(CharSequence::toString), redraw.returnType))
                        // The pager's chat search overrides the redraw to scroll back up and settle its progress line.
                        // No override, there or in any other subclass, changes the count chat search waits for.
                        val overrides = redrawOverrides(build, adapter, redraw.name)
                        assertTrue("$what: the pager's chat search overrides the redraw", overrides.isNotEmpty())
                        for (override in overrides) assertTrue("$what: ${override.definingClass} leaves the waiting count alone",
                            override.body().none { it.opcode == Opcode.IPUT && it.ref() == waiting })
                        assertEquals(Opcode.NOP, after[at + 6].opcode)
                        assertEquals("$what goes on to Telegram's next instruction", searchOperands(before[edit.index]), searchOperands(after[at + 7]))
                        assertFalse("$what reads the text into a register nothing reads afterwards", text in live.liveInto(edit.index))
                        assertEquals("$what reads from the object the step read", before[load].namedRegisters()[1],
                            after[at].namedRegisters()[1])
                        assertTrue("$what's object still holds it", (load + 1..call).none { before[it].opcode.setsRegister() &&
                            before[it].namedRegisters().firstOrNull() == before[load].namedRegisters()[1] })
                        continue
                    }
                    if (edit.jump == null) {
                        val hook = if (edit.lookup == SearchLookup.USERNAMES) SEARCH_SENT else SEARCH_EMPTY_TEXT
                        val text = after[at].namedRegisters().single()
                        assertEquals("$what asks the runtime", listOf(Opcode.INVOKE_STATIC, listOf(text), hook), searchOperands(after[at]))
                        assertEquals("$what takes its answer", listOf(Opcode.MOVE_RESULT_OBJECT, listOf(text), null), searchOperands(after[at + 1]))
                        assertEquals("$what goes on to Telegram's own call", searchOperands(before[edit.index]), searchOperands(after[at + 2]))
                        assertEquals("$what hands that call the answer", text, after[at + 2].namedRegisters()[1])
                        assertFalse("$what swaps a register nothing reads afterwards", text in live.liveInto(edit.index + 1))
                        continue
                    }
                    val jump = edit.jump
                    val request = requestOf(edit, before) { type -> context.classDefByOrNull(type) }
                    val answer = after[at + 1].namedRegisters().single()
                    if (edit.lookup in FILTERS) assertEquals("$what hands the runtime the text",
                        listOf(Opcode.INVOKE_STATIC_RANGE, listOf(before[edit.index].namedRegisters()[11]), SEARCH_KEEPS_TEXT), searchOperands(after[at]))
                    else assertEquals("$what asks the runtime", listOf(Opcode.INVOKE_STATIC, emptyList<Int>(), SEARCH_KEEP), searchOperands(after[at]))
                    assertEquals("$what takes its answer", listOf(Opcode.MOVE_RESULT, Opcode.IF_NEZ), after.subList(at + 1, at + 3).map { it.opcode })
                    assertEquals("$what branches on that answer", listOf(answer), after[at + 2].namedRegisters())
                    assertEquals("$what goes Telegram's way past on yes and on to the request on no",
                        setOf(at + 3, moved(jump)), flow.normal[at + 2].toSet())
                    assertFalse("$what borrows a register nothing reads", answer in live.liveInto(edit.index) || answer in live.liveInto(jump))
                    assertTrue("$what was reachable before", request in reach(oldFlow, 0, -1))
                    assertFalse("$what is only reached through the hook", moved(request) in reach(flow, 0, at))
                    assertFalse("$what's way past never builds the request", request in reach(oldFlow, jump, -1))
                    // A filtered search is skipped outright: it returns nothing, so the pager just goes on.
                    if (edit.lookup in FILTERS) assertEquals("$what goes on right after the search", edit.index + 1, jump)
                    else assertTrue("$what's way past is one Telegram takes", jump in reach(oldFlow, 0, request))
                    when (edit.lookup) {
                        // Too short a text leaves no sponsored text behind, and so does a kept search.
                        SearchLookup.SPONSORED -> assertEquals("$what clears the text it last asked about", Opcode.IPUT_OBJECT to "Ljava/lang/String;",
                            before[jump].opcode to (before[jump] as ReferenceInstruction).reference.let { (it as FieldReference).type })
                        SearchLookup.POSTS -> assertEquals("$what returns", Opcode.RETURN_VOID, before[jump].opcode)
                        // One answer fewer to wait for, and the tab is told whether any is left.
                        SearchLookup.MESSAGES -> {
                            val way = before.subList(jump, request)
                            val count = (way.first() as ReferenceInstruction).reference
                            assertEquals("$what reads the waiting count", Opcode.IGET, way.first().opcode)
                            assertTrue("$what lowers it", way.any { it.opcode in LOWERS } &&
                                way.any { it.opcode == Opcode.IPUT && (it as ReferenceInstruction).reference == count })
                            assertTrue("$what tells the tab", way.any { it.call()?.let { call ->
                                call.parameterTypes.map(CharSequence::toString) == listOf("Z", "Z") && call.returnType == "V" } == true })
                            assertEquals("$what returns", Opcode.RETURN_VOID, way.last().opcode)
                        }
                        // An empty box drops what an earlier forum search found.
                        SearchLookup.FORUM -> {
                            val way = before.subList(jump, edit.index)
                            assertTrue("$what clears its results", way.count { it.ref() == "Ljava/util/ArrayList;->clear()V" } >= 1)
                            assertEquals("$what returns", Opcode.RETURN_VOID, way.last().opcode)
                        }
                        // The tab's empty box: its text checked, then its lists cleared, nothing left to load and nothing posted.
                        SearchLookup.CHANNELS, SearchLookup.APPS -> {
                            val check = jump - 1
                            val field = (before[check - 3] as ReferenceInstruction).reference as FieldReference
                            assertEquals("$what's tab text check", listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ),
                                before.subList(check - 3, check + 1).map { it.opcode })
                            assertEquals("$what's check sends a typed text to the hook", setOf(jump, edit.index), oldFlow.normal[check].toSet())
                            assertTrue("$what's tab asks for ${TABS.getValue(edit.lookup)} accounts",
                                context.classDefByOrNull(field.definingClass)!!.methods.any { method -> method.body().any {
                                    it.opcode == Opcode.IPUT_BOOLEAN && it.ref() == "$USERNAMES->${TABS.getValue(edit.lookup)}:Z" } })
                            val way = before.subList(jump, edit.index)
                            assertTrue("$what clears the tab", way.any { it.ref() == "Ljava/util/ArrayList;->clear()V" })
                            assertTrue("$what leaves nothing loading or to load", way.count { it.opcode == Opcode.IPUT_BOOLEAN &&
                                (it as ReferenceInstruction).reference.let { ref -> (ref as FieldReference).definingClass == field.definingClass } } >= 3)
                            assertTrue("$what posts nothing", way.none { it.ref() == POST })
                        }
                        // The pager's own filtered view for a filtered Chats tab, the page itself for a media tab.
                        else -> {
                            val call = before[edit.index].call()!!
                            assertEquals("$what is the filtered search view's search", FILTERED,
                                call.parameterTypes.map(CharSequence::toString).filterIndexed { at, _ -> at != 4 })
                            val view = before[edit.index].namedRegisters()[0]
                            val source = (edit.index - 1 downTo 0).first { before[it].opcode.setsRegister() && before[it].namedRegisters()[0] == view }
                            assertEquals("$what's view", if (edit.lookup == SearchLookup.CHAT_FILTERS) Opcode.IGET_OBJECT else Opcode.CHECK_CAST,
                                before[source].opcode)
                        }
                    }
                }
            }
        }
    }

    @Test fun `Hide ads and local search hook chat search in either order`() {
        for (build in Fixtures.declaredBuilds()) {
            for (adsFirst in listOf(true, false)) {
                val where = "${build.name}, Hide ads ${if (adsFirst) "first" else "second"}"
                val context = PatchContexts.of((ExtensionDex.classes() + localSearchHosts(build) +
                    FixtureDex.classes(build, setOf(CONTROLLER, VIDEO_ADS)).values).distinctBy { it.type })
                val search = context.resolveLocalSearch().edits.first { it.lookup == SearchLookup.SPONSORED }.method
                fun ads() = assertEquals("$where: Hide ads has nothing to warn about", emptyList<String>(),
                    PatchLogCapture.warnings { hideAdsPatch.execute(context) })
                if (adsFirst) ads()
                context.resolveLocalSearch().apply()
                if (!adsFirst) ads()

                val body = search.body()
                val keeps = body.indices.filter { body[it].ref() == SEARCH_KEEP }
                val skip = body.indices.single { body[it].ref() == SEARCH_ADS }
                val request = body.indices.single { body[it].opcode == Opcode.NEW_INSTANCE && body[it].ref() == GET_SPONSORED_PEERS }
                assertEquals("$where: the sponsored and the posts hook", 2, keeps.size)
                assertTrue("$where: local search asks before the text check, Hide ads right at the request",
                    keeps.first() < skip && skip == request - 3)
                val flow = ControlFlow.of(search)
                assertFalse("$where: the request is behind local search", request in reach(flow, 0, keeps.first()))
                assertFalse("$where: and behind Hide ads", request in reach(flow, 0, skip))
                for (flag in listOf("hideAds", "searchAds")) {
                    val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.body()
                    assertEquals("$where: $flag", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
                }
            }
        }
    }

    @Test fun `the census has one chat search, one second step and one pager, and a helper other screens share`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val search = FixtureDex.methodsWhere(build, { true }) { it.builds(GET_SPONSORED_PEERS) }.single()
            val adapter = search.definingClass
            val messages = FixtureDex.methodsWhere(build, { true }) { it.definingClass == adapter && it.builds(GLOBAL_MESSAGES) }.single()
            val forum = FixtureDex.methodsWhere(build, { true }) { it.definingClass == adapter && it.builds(CHAT_MESSAGES) }.single()
            val steps = FixtureDex.methodsWhere(build, { true }) { it.definingClass != adapter && it.runs(adapter, messages) && it.runs(adapter, forum) }
            assertEquals("$name: only a runnable outside chat search starts both message searches", listOf("run"), steps.map { it.name })
            val helper = steps.single().body().mapNotNull { it.call() }.single { it.parameterTypes.size == 12 }
            // One pass over the app for the three things left to count.
            val wide = FixtureDex.methodsWhere(build, { true }) { method -> method.body().any {
                it.ref() == NO_RESULT_LINE || it.call() == helper || (it.opcode == Opcode.NEW_INSTANCE && it.ref() == PUBLIC_POSTS) } }
            val pagers = wide.filter { method -> method.body().any { it.ref() == NO_RESULT_LINE } }
            assertEquals("$name: one method writes the no results line", 1, pagers.size)
            assertTrue("$name: and it's the one that starts chat search", pagers.single().runs(adapter, search))
            // The filtered search view searches for other screens too, so only the pager's two calls are hooked.
            val filtered = pagers.single().body().mapNotNull { it.call() }.filter { call ->
                call.parameterTypes.map(CharSequence::toString).filterIndexed { at, _ -> at != 4 } == FILTERED }
            assertEquals("$name: the pager starts the filtered search for a filtered Chats tab and for a media tab", 2, filtered.size)
            val others = FixtureDex.methodsWhere(build, { true }) { method -> method.body().any { it.call() == filtered.first() } }
            assertTrue("$name: and other screens start it too: ${others.map { it.definingClass }}",
                others.map { it.definingClass }.toSet().size > 2)
            // Contact pickers and other screens look usernames up through the same helper, so only chat search's call is hooked.
            val callers = wide.filter { method -> method.body().any { it.call() == helper } }
            assertTrue("$name: the helper is shared: ${callers.map { it.definingClass }}", callers.map { it.definingClass }.toSet().size > 2)
            assertEquals("$name: chat search calls it once itself, with no text", 1, callers.count { it.definingClass == adapter && it.name == search.name })
            // Public posts under a hashtag are asked for by the runnable chat search posts, and by other screens of their own.
            val posters = wide.filter { it.builds(PUBLIC_POSTS) }
            val made = search.body().filter { it.opcode == Opcode.NEW_INSTANCE }.mapNotNull { it.ref() }
            assertEquals("$name: one runnable of chat search's asks for public posts", 1, posters.count { it.name == "run" && it.definingClass in made })
        }
    }
}

/** A change to chat search and the reason the patch gives for refusing it. */
internal val SEARCH_CHANGES = listOf(
    "sponsored check gone" to "sponsored search no longer checks the text it sends",
    "posts check gone" to "public posts no longer start behind the hashtag check",
    "waiting count kept" to "no longer lowers the waiting count",
    "forum exit gone" to "forum message search's empty box exit",
    "text read again" to "can't be swapped where it's passed",
    "second chat search" to "chat search has 2 matches",
    "line set later" to "the no results line is set another way",
    "helper never cleared" to "no longer clears the username helper by passing it no text",
    "channel check gone" to "the Channels tab's empty box check has 0 matches",
    "app tab keeps its list" to "the Apps tab lost its empty box path",
    "third filtered search" to "the pager no longer starts the filtered search twice",
    "phone text's owner reused" to "the username lookup's text can't be read back after it",
    "phone text read over its owner" to "the username lookup's text can't be read back after it",
)

/** Makes one of [SEARCH_CHANGES] in the methods [site] found. */
internal fun changeSearch(change: String, site: LocalSearchSite) {
    fun edit(lookup: SearchLookup) = site.edits.single { it.lookup == lookup }
    when (change) {
        "sponsored check gone" -> edit(SearchLookup.SPONSORED).let { it.method.replaceInstruction(it.index, "nop") }
        "posts check gone" -> edit(SearchLookup.POSTS).let { it.method.replaceInstruction(it.index, "nop") }
        "waiting count kept" -> edit(SearchLookup.MESSAGES).let { hook ->
            val body = hook.method.body()
            hook.method.replaceInstruction((hook.jump!! until hook.index).first { body[it].opcode == Opcode.IPUT }, "nop")
        }
        "forum exit gone" -> edit(SearchLookup.FORUM).let { hook ->
            val body = hook.method.body()
            hook.method.replaceInstruction((hook.jump!! until hook.index).first { body[it].opcode == Opcode.RETURN_VOID }, "nop")
        }
        "text read again" -> edit(SearchLookup.USERNAMES).let { hook ->
            val text = hook.method.body()[hook.index].namedRegisters()[1]
            hook.method.addInstructions(hook.index + 1, "invoke-static {v$text}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z")
        }
        "second chat search" -> edit(SearchLookup.FORUM).method.addInstructions(0, "new-instance v0, $GET_SPONSORED_PEERS")
        "line set later" -> edit(SearchLookup.EMPTY_LINE).let { it.method.addInstructions(it.index, "nop") }
        // The empty box hands the helper the text instead of nothing, so passing nothing is no longer a call Telegram makes.
        "helper never cleared" -> {
            val search = edit(SearchLookup.SPONSORED).method
            val helper = edit(SearchLookup.USERNAMES).let { it.method.body()[it.index].call() }
            val body = search.body()
            val call = body.indices.single { body[it].call() == helper }
            val text = body[call].namedRegisters()[1]
            val write = (call - 1 downTo 0).first { body[it].opcode.setsRegister() && body[it].namedRegisters().first() == text }
            assertEquals(Opcode.CONST_4, body[write].opcode)
            search.replaceInstruction(write, "move-object/from16 v$text, p2")
        }
        "channel check gone" -> edit(SearchLookup.CHANNELS).let { it.method.replaceInstruction(it.jump!! - 1, "nop") }
        "app tab keeps its list" -> edit(SearchLookup.APPS).let { hook ->
            val body = hook.method.body()
            hook.method.replaceInstruction((hook.jump!! until hook.index).single { body[it].ref() == "Ljava/util/ArrayList;->clear()V" }, "nop")
        }
        "third filtered search" -> edit(SearchLookup.MEDIA_TABS).let { hook ->
            val call = hook.method.body()[hook.index]
            hook.method.addInstructions(0, "invoke-virtual/range {v0 .. v12}, ${call.call()}")
        }
        // The object the step read the text from is overwritten before the lookup, so the text can't be read back.
        "phone text's owner reused" -> edit(SearchLookup.PHONES).let { hook ->
            val body = hook.method.body()
            val text = body[hook.index - 1].namedRegisters()[1]
            val load = (hook.index - 2 downTo 0).first { body[it].opcode == Opcode.IGET_OBJECT && body[it].namedRegisters()[0] == text }
            hook.method.addInstructions(load + 1, "const/4 v${body[load].namedRegisters()[1]}, 0x0")
        }
        // The step reads the text over the object it read it from, so nothing holds that object afterwards.
        "phone text read over its owner" -> edit(SearchLookup.PHONES).let { hook ->
            val body = hook.method.body()
            val text = body[hook.index - 1].namedRegisters()[1]
            val load = (hook.index - 2 downTo 0).first { body[it].opcode == Opcode.IGET_OBJECT && body[it].namedRegisters()[0] == text }
            hook.method.replaceInstruction(load, "iget-object v$text, v$text, ${body[load].ref()}")
        }
        else -> error("unknown search change $change")
    }
}

private val HOSTS = ConcurrentHashMap<String, List<ClassDef>>()

/**
 * Chat search, the runnable that is its second step, the pager that starts it, and what those
 * build or call: the public posts runnable and the username helper among them. From the pager, the
 * classes whose text it reads (the Channels and Apps tabs among them), the filtered search view and
 * the runnables that view's search posts.
 */
internal fun localSearchHosts(build: File): List<ClassDef> = HOSTS.getOrPut(build.path) {
    val adapter = FixtureDex.classesWhere(build, { true }) { it.builds(GET_SPONSORED_PEERS) }.single()
    val search = adapter.methods.single { it.builds(GET_SPONSORED_PEERS) }
    val messages = adapter.methods.single { it.builds(GLOBAL_MESSAGES) }
    val forum = adapter.methods.single { it.builds(CHAT_MESSAGES) }
    val users = FixtureDex.classesWhere(build, { true }) { method -> method.definingClass != adapter.type &&
        ((method.runs(adapter.type, messages) && method.runs(adapter.type, forum)) ||
            (method.runs(adapter.type, search) && method.body().any { it.ref() == NO_RESULT_LINE })) }
    val pager = users.flatMap { it.methods }.single { method -> method.body().any { it.ref() == NO_RESULT_LINE } }
    val texts = pager.body().filter { it.opcode == Opcode.IGET_OBJECT }
        .mapNotNull { ((it as ReferenceInstruction).reference as FieldReference).takeIf { field -> field.type == "Ljava/lang/String;" } }
        .map { it.definingClass }
    val filtered = pager.body().mapNotNull { it.call() }.filter { it.parameterTypes.size == 8 }
    val views = FixtureDex.classes(build, filtered.map { it.definingClass }.toSet()).values
    val posted = views.flatMap { it.methods }.filter { method -> filtered.any { it.name == method.name &&
        it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString) } }
        .flatMap { it.body() }.filter { it.opcode == Opcode.NEW_INSTANCE }.mapNotNull { it.ref() }
    val named = search.body().filter { it.opcode == Opcode.NEW_INSTANCE }.mapNotNull { it.ref() } +
        users.flatMap { it.methods }.flatMap { it.body() }.mapNotNull { it.call() }.filter { it.parameterTypes.size == 12 }.map { it.definingClass } +
        texts + posted
    // Chat search's superclasses up to RecyclerView's adapter, whose redraw the phone match calls, and the observable it keeps.
    val supers = mutableListOf<ClassDef>()
    var above = adapter.superclass
    while (above != null && above != "Ljava/lang/Object;") {
        val next = FixtureDex.classes(build, setOf(above)).values.singleOrNull() ?: break
        supers += next
        above = next.superclass
    }
    val observed = FixtureDex.classes(build, supers.lastOrNull()?.fields?.map { it.type }?.toSet().orEmpty()).values
    (listOf(adapter) + users + views + supers + observed + FixtureDex.classes(build, named.toSet()).values)
        .distinctBy { it.type }.map(ImmutableClassDef::of)
}

/**
 * Where [edit]'s request is built or started in its method's stock [body]: a request a Chats tab
 * lookup builds, the search a tab posts, or the filtered search itself. [classOf] finds the public
 * posts runnable by what its run() builds.
 */
private fun requestOf(edit: SearchEdit, body: List<Instruction>, classOf: (String) -> ClassDef?): Int = when (edit.lookup) {
    SearchLookup.CHANNELS, SearchLookup.APPS -> (edit.index until body.size).first { body[it].ref() == POST }
    SearchLookup.CHAT_FILTERS, SearchLookup.MEDIA_TABS -> edit.index
    else -> body.indices.single { at ->
        body[at].opcode == Opcode.NEW_INSTANCE && when (edit.lookup) {
            SearchLookup.SPONSORED -> body[at].ref() == GET_SPONSORED_PEERS
            SearchLookup.MESSAGES -> body[at].ref() == GLOBAL_MESSAGES
            SearchLookup.FORUM -> body[at].ref() == CHAT_MESSAGES
            SearchLookup.POSTS -> classOf(body[at].ref()!!)?.methods?.any { it.name == "run" && it.builds(PUBLIC_POSTS) } == true
            else -> error("${edit.lookup} has no request")
        }
    }
}

/** Every instruction reachable from [from], thrown or not, without running [blocked]. */
private fun reach(flow: ControlFlow, from: Int, blocked: Int): Set<Int> {
    val found = mutableSetOf<Int>()
    val pending = ArrayDeque<Int>()
    pending.add(from)
    while (pending.isNotEmpty()) {
        val index = pending.removeFirst()
        if (index == blocked || !found.add(index)) continue
        pending.addAll(flow.normal[index])
        pending.addAll(flow.exceptional[index])
    }
    return found
}

private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.ref(): String? = (this as? ReferenceInstruction)?.reference?.toString()
private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Method.builds(type: String) = body().any { it.opcode == Opcode.NEW_INSTANCE && it.ref() == type }
private fun Method.runs(owner: String, method: Method) = body().any { it.call()?.let { call -> call.definingClass == owner &&
    call.name == method.name && call.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString) } == true }
/** An instruction's opcode, registers and reference; a goto that grew to reach past a hook still counts as that goto. */
private fun searchOperands(instruction: Instruction): List<Any?> =
    listOf(if (instruction.opcode in GOTOS) Opcode.GOTO else instruction.opcode, instruction.namedRegisters(), instruction.ref())

/** Every method of chat search's subclasses, at any depth, that overrides the list redraw [name]. */
private fun redrawOverrides(build: File, adapter: String, name: String): List<Method> {
    val parents = mutableMapOf<String, String?>()
    FixtureDex.forEach(build) { dex -> for (c in dex.classes) parents[c.type] = c.superclass }
    val below = parents.keys.filter { type -> generateSequence(parents[type]) { parents[it] }.any { it == adapter } }
    return FixtureDex.classes(build, below.toSet()).values.flatMap { it.methods }
        .filter { it.name == name && it.parameterTypes.isEmpty() && it.returnType == "V" && it.implementation != null }
}