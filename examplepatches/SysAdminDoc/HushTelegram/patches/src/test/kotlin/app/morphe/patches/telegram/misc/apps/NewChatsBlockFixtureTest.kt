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
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.analytics.GHOST_MODE_DROP
import app.morphe.patches.telegram.misc.analytics.ghostModeHosts
import app.morphe.patches.telegram.misc.extension.CONNECTIONS_MANAGER
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SEND_REQUEST_GATE_SIZE
import app.morphe.patches.telegram.misc.extension.SEND_REQUEST_INTERNAL
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.extension.resolveSendRequestGate
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.numberOfParameterRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test
import java.io.File
import java.util.concurrent.ConcurrentHashMap

private const val PLAIN_POLL = "$MESSAGES_CONTROLLER->startShortPoll(${TL_CHAT}IZ)V"

/**
 * Block new channels and groups on the pinned builds: the join requests it drops are still there
 * under their names, the gate sits at the top of ConnectionsManager's one send, the chat screen
 * asks before it sets up a channel or supergroup you aren't in, and the topic list asks before it
 * loads a forum you aren't in. A build that has moved any of it leaves all three stock and says why.
 */
class NewChatsBlockFixtureTest {
    @Test fun `every join the block drops is a class each declared build still has under that name`() {
        val named = ExtensionDex.classes().single { it.type == NEW_CHATS_BLOCK }.methods.flatMap { it.body() }
            .mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
            .filter { it.startsWith("org.telegram.tgnet.") }
            .map { "L" + it.replace('.', '/') + ";" }.toSet()
        assertEquals("the extension's join requests", 6, named.size)
        for (build in Fixtures.declaredBuilds()) {
            assertEquals("${build.name}: every named join", named, FixtureDex.classes(build, named).keys)
        }
    }

    /** A dropped link lookup is answered by reflection, through the callback's run and the error type it takes. */
    @Test fun `each declared build's request callback still takes Telegram's error type, which the block can make and fill`() {
        val delegate = "Lorg/telegram/tgnet/RequestDelegate;"
        val error = "Lorg/telegram/tgnet/TLRPC\$TL_error;"
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val found = FixtureDex.classes(build, setOf(delegate, error))
            assertEquals("$where: both by name", setOf(delegate, error), found.keys)
            val runs = found.getValue(delegate).methods.filter { it.name == "run" }
            assertTrue("$where: RequestDelegate is an interface", AccessFlags.INTERFACE.isSet(found.getValue(delegate).accessFlags))
            assertEquals("$where: RequestDelegate's run", listOf(listOf("Lorg/telegram/tgnet/TLObject;", error)),
                runs.map { run -> run.parameterTypes.map { it.toString() } })
            val errorClass = found.getValue(error)
            assertTrue("$where: TL_error is public", AccessFlags.PUBLIC.isSet(errorClass.accessFlags))
            assertTrue("$where: TL_error()", errorClass.methods.any { it.name == "<init>" && it.parameterTypes.isEmpty() && AccessFlags.PUBLIC.isSet(it.accessFlags) })
            for ((name, type) in listOf("code" to "I", "text" to "Ljava/lang/String;")) {
                assertTrue("$where: TL_error.$name", errorClass.fields.any { it.name == name && it.type == type && AccessFlags.PUBLIC.isSet(it.accessFlags) })
            }
        }
    }

    @Test fun `the gate drops joins and both screens ask before a chat you aren't in opens`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val context = contextFor(build)
            val before = snapshot(context, build)
            val plan = context.resolveNewChatsBlock()
            assertNull("$where: ${plan.missing}", plan.missing)
            assertEquals("$where: the chat screen and the topic list", 2, plan.sites.size)
            assertEquals("$where: resolving edits nothing", before, snapshot(context, build))
            val (chat, topics) = plan.sites
            val sendStock = ImmutableMethod.of(send(context))
            val chatStock = ImmutableMethod.of(chat.method)
            val topicsStock = ImmutableMethod.of(topics.method)
            plan.apply()

            assertGate(where, sendStock, send(context), listOf(NEW_CHATS_BLOCK_DROP))
            assertChatCheck(where, chatStock, chat.method, chat.entry)
            assertTopicsCheck(where, topicsStock, topics.method)
        }
    }

    @Test fun `the whole of Hide popular apps blocks new chats with nothing to warn about`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val context = PatchContexts.of((ExtensionDex.classes() + popularAppsOwners(build) + myChatsSearchHosts(build) +
                nameFoldHosts(build) + newChatsHosts(build)).distinctBy { it.type })
            val sendStock = ImmutableMethod.of(send(context))
            assertEquals(where, emptyList<String>(), PatchLogCapture.warnings { hidePopularAppsPatch.execute(context) })
            assertGate(where, sendStock, send(context), listOf(NEW_CHATS_BLOCK_DROP))
            val asks = newChatsHosts(build).map { it.type }.filter { it != CONNECTIONS_MANAGER }.flatMap { type ->
                context.mutableClassDefBy(type).methods.filter { method -> method.body().any { it.ref() == NEW_CHATS_BLOCK_OPEN } }
            }
            assertEquals("$where: one check on each screen", 2, asks.size)
            assertTrue("$where: ${asks.map { it.name }}", asks.all { it.name == "onFragmentCreate" })
            assertEquals("$where: on two screens", 2, asks.map { it.definingClass }.toSet().size)
            for (method in asks) assertEquals("$where: ${method.definingClass} asks once", 1, method.body().count { it.ref() == NEW_CHATS_BLOCK_OPEN })
            assertFlag(context, "blockNewChats", true)
            assertFlag(context, "hidePopularApps", true)
        }
    }

    /** Ghost mode has its own gate on the same send. Either can go in first, and both still see every request. */
    @Test fun `Ghost mode's gate and the block's stack in either order`() {
        for (build in Fixtures.declaredBuilds()) for (ghostFirst in listOf(true, false)) {
            val where = "${build.name} ghost ${if (ghostFirst) "first" else "second"}"
            val context = contextFor(build)
            val sendStock = ImmutableMethod.of(send(context))
            fun ghost() {
                val gate = context.resolveSendRequestGate(GHOST_MODE_DROP)
                assertNull("$where: ${gate.missing}", gate.missing)
                gate.apply(GHOST_MODE_DROP)
            }
            fun block() {
                val plan = context.resolveNewChatsBlock()
                assertNull("$where: ${plan.missing}", plan.missing)
                plan.apply()
            }
            if (ghostFirst) { ghost(); block() } else { block(); ghost() }
            assertGate(where, sendStock, send(context),
                if (ghostFirst) listOf(NEW_CHATS_BLOCK_DROP, GHOST_MODE_DROP) else listOf(GHOST_MODE_DROP, NEW_CHATS_BLOCK_DROP))
        }
    }

    @Test fun `a build whose screens or send moved keeps all three stock and says why`() {
        class Case(val name: String, val reason: String, val hosts: (List<ClassDef>) -> List<ClassDef> = { it },
                   val change: ((BytecodePatchContext, NewChatsBlockPlan) -> Unit)? = null)
        val cases = listOf(
            Case("no ConnectionsManager", "ConnectionsManager is missing", hosts = { hosts -> hosts.filter { it.type != CONNECTIONS_MANAGER } }),
            Case("no ChatObject", "ChatObject no longer tells a chat you aren't in", hosts = { hosts -> hosts.filter { it.type != CHAT_OBJECT } }),
            // Play also watches a channel's linked group the visitor's way, so every such watch goes.
            Case("no visitor's watch", "0 chat screens watch a channel you aren't in, not one", change = { _, plan ->
                val method = plan.sites[0].method
                method.body().indices.filter { method.body()[it].isVisitorPoll() }.forEach { method.replaceInstruction(it, "nop") }
            }),
            Case("the visitor's watch gone from its way", "watches a chat you aren't in 0 times on its way there", change = { _, plan ->
                val method = plan.sites[0].method
                val visitor = method.body().indexOfFirst { it.isVisitorPoll() }
                val watch = method.body()[visitor].ref()
                method.replaceInstruction(visitor, "nop")
                // The same watch before the test keeps the screen findable, so the narrower reason shows.
                method.addInstructions(0, "invoke-virtual/range {v0 .. v4}, $watch")
            }),
            Case("a member stops watching", "a member's way through the chat screen no longer watches the chat", change = { _, plan ->
                val method = plan.sites[0].method
                val visitor = method.body().indexOfFirst { it.isVisitorPoll() }
                method.replaceInstruction(method.body().indices.first { it > visitor && method.body()[it].ref() == PLAIN_POLL }, "nop")
            }),
            // A branch onto the visitor's setup would skip the check, since its label stays on Telegram's instruction.
            Case("a jump to the visitor's setup", "something else jumps to where the chat screen sets up a chat you aren't in", change = { _, plan ->
                val site = plan.sites[0]
                site.method.addInstructionsWithLabels(0, "goto/16 :hush_in", ExternalLabel("hush_in", site.method.getInstruction(site.entry)))
            }),
            Case("a jump back to the topic list's start", "something jumps back to the start of the topic list", change = { _, plan ->
                val method = plan.sites[1].method
                val exit = method.body().indexOfFirst { it.opcode == Opcode.RETURN }
                method.addInstructionsWithLabels(exit, "goto/16 :hush_top", ExternalLabel("hush_top", method.getInstruction(0)))
            }),
            Case("the forum's id overwritten", "the topic list no longer loads its forum by the id it keeps", change = { _, plan ->
                val method = plan.sites[1].method
                val load = method.body().indexOfFirst { it.ref() == LOAD_FULL_CHAT }
                method.addInstructions(load, "const-wide/16 v${method.body()[load].namedRegisters()[1]}, 0x0")
            }),
        )
        for (build in Fixtures.declaredBuilds()) for (case in cases) {
            val where = "${build.name} ${case.name}"
            val context = PatchContexts.of((ExtensionDex.classes() + case.hosts(newChatsHosts(build))).distinctBy { it.type })
            // A change to a screen starts from where the stock build put it; a missing class is change enough.
            case.change?.let { change ->
                val found = context.resolveNewChatsBlock()
                assertNull("$where: stock first: ${found.missing}", found.missing)
                change(context, found)
            }
            val before = snapshot(context, build)
            val plan = context.resolveNewChatsBlock()
            assertTrue("$where: ${plan.missing}", plan.missing.orEmpty().contains(case.reason))
            assertTrue("$where: no site without its partners", plan.sites.isEmpty())
            plan.apply()
            assertEquals("$where: nothing is edited", before, snapshot(context, build))
        }
    }

    /** smali drops an instruction it can't build and only logs it; the rehearsal counts what went in. */
    @Test fun `a check that loses an instruction is caught by the rehearsal and the screen stays stock`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextFor(build)
            val topics = context.resolveNewChatsBlock().sites[1].method
            val stock = topics.operations()
            val site = NewChatOpenSite(topics, 0, 2) { "const/4 v0, 0x0\nconst/4 v16, 0x0" }
            val failed = site.rehearse()
            assertNotNull(build.name, failed)
            assertTrue("${build.name}: $failed", failed!!.contains("doesn't compile") && failed.contains("didn't compile whole"))
            assertEquals("${build.name}: the rehearsal works on a copy", stock, topics.operations())
        }
    }

    @Test fun `no runtime or status stub refuses before anything is edited`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = popularAppsOwners(build) + myChatsSearchHosts(build) + nameFoldHosts(build) + newChatsHosts(build)
            val withoutRuntime = PatchContexts.of((ExtensionDex.classes().filter { it.type != NEW_CHATS_BLOCK } + hosts).distinctBy { it.type })
            val stock = snapshot(withoutRuntime, build)
            val runtime = refusal(withoutRuntime)
            assertTrue(runtime, runtime.contains("NewChatsBlock") && runtime.contains("before editing"))
            assertEquals("${build.name}: nothing edited", stock, snapshot(withoutRuntime, build))
            assertFlag(withoutRuntime, "blockNewChats", false)
            assertFlag(withoutRuntime, "hidePopularApps", false)

            val withoutStub = PatchContexts.of((ExtensionDex.classes() + hosts).distinctBy { it.type })
            withoutStub.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == "blockNewChats" }
            val unstubbed = snapshot(withoutStub, build)
            val stub = refusal(withoutStub)
            assertTrue(stub, stub.contains("no boolean method blockNewChats()"))
            assertEquals("${build.name}: nothing edited", unstubbed, snapshot(withoutStub, build))
            assertFlag(withoutStub, "hidePopularApps", false)
        }
    }

    private fun contextFor(build: File) = PatchContexts.of((ExtensionDex.classes() + newChatsHosts(build)).distinctBy { it.type })

    private fun refusal(context: BytecodePatchContext): String = try {
        hidePopularAppsPatch.execute(context)
        fail("accepted")
        ""
    } catch (expected: PatchException) {
        expected.message.orEmpty()
    }

    /** What the block could edit, ConnectionsManager and the screens the fixture carries, by type. */
    private fun snapshot(context: BytecodePatchContext, build: File): Map<String, List<List<Any?>>> =
        newChatsHosts(build).map { it.type }.filter { it != CHAT_OBJECT && it != MESSAGES_CONTROLLER && context.classDefByOrNull(it) != null }
            .associateWith { type -> context.mutableClassDefBy(type).methods.map { it.operations() } }

    private fun assertFlag(context: BytecodePatchContext, name: String, expected: Boolean) {
        val body = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.body()
        assertEquals(name, if (expected) 1 else 0, (body[0] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, body[1].opcode)
    }

    private fun send(context: BytecodePatchContext): MutableMethod =
        context.mutableClassDefBy(CONNECTIONS_MANAGER).methods.single { it.name == SEND_REQUEST_INTERNAL }

    /**
     * [patched] opens with one gate per hook in [asks], in the order they ask, each handing the
     * request (p1) over, and the block its callback (p2) too, and returning when told to drop it, a
     * false answer going on to the next gate and then to the stock send, which is whole below them.
     */
    private fun assertGate(where: String, original: Method, patched: Method, asks: List<String>) {
        val after = patched.body()
        val p1 = patched.implementation!!.registerCount - patched.numberOfParameterRegisters + 1
        val flow = ControlFlow.of(patched)
        for ((at, hook) in asks.withIndex()) {
            val top = at * SEND_REQUEST_GATE_SIZE
            assertEquals("$where: gate $at asks", hook, after[top].ref())
            assertEquals("$where: gate $at hands it the request", if (hook == NEW_CHATS_BLOCK_DROP) listOf(p1, p1 + 1) else listOf(p1),
                after[top].namedRegisters())
            assertEquals("$where: gate $at", listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID),
                after.subList(top + 1, top + 4).map { it.opcode })
            assertEquals("$where: gate $at goes on or returns", setOf(top + 3, top + SEND_REQUEST_GATE_SIZE), flow.normal[top + 2].toSet())
        }
        val gates = asks.size * SEND_REQUEST_GATE_SIZE
        for (index in gates until after.size) {
            assertTrue("$where: $index branches into a gate", (flow.normal[index] + flow.exceptional[index]).none { it < gates })
        }
        assertEquals("$where: the stock send is whole", original.operations(), after.drop(gates).filter { it.opcode != Opcode.NOP }.map(::operation))
        assertEquals("$where: no register added", original.implementation!!.registerCount, patched.implementation!!.registerCount)
    }

    /**
     * The chat screen asks at [entry], where a visitor's setup started: a true answer returns false
     * from onFragmentCreate, a false one goes on to Telegram's setup. Only the instruction that led
     * there in stock leads to the check, and Telegram's setup is reached only through it.
     */
    private fun assertChatCheck(where: String, original: Method, patched: Method, entry: Int) {
        val after = patched.body()
        assertEquals("$where: chat screen check", listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_16,
            Opcode.RETURN, Opcode.NOP), after.subList(entry, entry + CHAT_OPEN_CHECK_SIZE + 1).map { it.opcode })
        assertEquals("$where: asks the block", NEW_CHATS_BLOCK_OPEN, after[entry].ref())
        val answer = after[entry + 1].namedRegisters().single()
        assertEquals("$where: one register throughout", List(3) { listOf(answer) },
            listOf(after[entry + 2].namedRegisters(), after[entry + 3].namedRegisters(), after[entry + 4].namedRegisters()))
        assertTrue("$where: v$answer is a local", answer < patched.implementation!!.registerCount - patched.numberOfParameterRegisters)
        assertEquals("$where: returns false", 0, (after[entry + 3] as NarrowLiteralInstruction).narrowLiteral)
        val flow = ControlFlow.of(patched)
        fun into(index: Int) = flow.normal.indices.filter { index in flow.normal[it] }.toSet() +
            flow.exceptional.indices.filter { index in flow.exceptional[it] }
        assertEquals("$where: only the stock way in reaches the check", setOf(entry - 1), into(entry))
        assertEquals("$where: no answer goes on", setOf(entry + 3, entry + CHAT_OPEN_CHECK_SIZE), flow.normal[entry + 2].toSet())
        assertEquals("$where: Telegram's setup is reached through the check", setOf(entry + CHAT_OPEN_CHECK_SIZE), into(entry + CHAT_OPEN_CHECK_SIZE + 1))
        val stock = original.body()
        assertEquals("$where: the visitor's setup follows", operation(stock[entry]), operation(after[entry + CHAT_OPEN_CHECK_SIZE + 1]))
        assertEquals("$where: the stock screen is whole", original.operations(),
            (after.take(entry) + after.drop(entry + CHAT_OPEN_CHECK_SIZE)).filter { it.opcode != Opcode.NOP }.map(::operation))
        assertEquals("$where: no register added", original.implementation!!.registerCount, patched.implementation!!.registerCount)
    }

    /**
     * The topic list asks first: it reads its own group by the id it keeps, through its own
     * MessagesController, and asks the block only for a loaded group that isn't a channel's direct
     * messages and that you aren't in. Every other answer goes on to the stock screen, whole below.
     */
    private fun assertTopicsCheck(where: String, original: Method, patched: Method) {
        val after = patched.body()
        val stock = original.body()
        assertEquals("$where: topic list check", listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT,
            Opcode.IGET_WIDE, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT,
            Opcode.IF_EQZ, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT,
            Opcode.IF_EQZ, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN, Opcode.NOP),
            after.take(TOPICS_OPEN_CHECK_SIZE + 1).map { it.opcode })
        val self = patched.implementation!!.registerCount - 1
        assertEquals("$where: works on this", listOf(3, self), after[0].namedRegisters())
        val controller = stock.first { it.opcode == Opcode.INVOKE_VIRTUAL && it.namedRegisters() == listOf(self) &&
            it.ref()?.contains("->getMessagesController()$MESSAGES_CONTROLLER") == true }.ref()
        assertEquals("$where: through the screen's own controller", controller, after[1].ref())
        val load = stock.indexOfFirst { it.ref() == LOAD_FULL_CHAT }
        val kept = stock.subList(0, load).last { it.opcode == Opcode.IGET_WIDE }
        assertEquals("$where: by the id the screen loads", (kept as ReferenceInstruction).reference.toString(), after[3].ref())
        assertEquals("$where: its own field", patched.definingClass, ((after[3] as ReferenceInstruction).reference as FieldReference).definingClass)
        assertEquals("$where: asks in order", listOf("Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;", GET_CHAT_BY_ID, IS_MONO_FORUM,
            IS_NOT_IN_CHAT, NEW_CHATS_BLOCK_OPEN), listOf(4, 6, 9, 12, 15).map { after[it].ref() })
        assertEquals("$where: returns false", 0, (after[18] as NarrowLiteralInstruction).narrowLiteral)
        val flow = ControlFlow.of(patched)
        val stockStart = TOPICS_OPEN_CHECK_SIZE
        for (test in listOf(8, 11, 14, 17)) {
            assertEquals("$where: $test goes on or opens stock", setOf(test + 1, stockStart), flow.normal[test].toSet())
        }
        for (index in stockStart + 1 until after.size) {
            assertTrue("$where: $index branches into the check", (flow.normal[index] + flow.exceptional[index]).none { it < stockStart })
        }
        assertEquals("$where: the stock screen is whole", original.operations(),
            after.drop(TOPICS_OPEN_CHECK_SIZE).filter { it.opcode != Opcode.NOP }.map(::operation))
        assertEquals("$where: no register added", original.implementation!!.registerCount, patched.implementation!!.registerCount)
    }

    private fun Instruction.isVisitorPoll() = ref()?.let { it.startsWith("$MESSAGES_CONTROLLER->startShortPoll(${TL_CHAT}IZ") && it != PLAIN_POLL } == true
    private fun Method.operations() = body().filter { it.opcode != Opcode.NOP }.map(::operation)
    private fun operation(instruction: Instruction): List<Any?> = listOf(instruction.opcode, instruction.ref(), instruction.namedRegisters(),
        (instruction as? NarrowLiteralInstruction)?.narrowLiteral)
}

private val NEW_CHATS_HOSTS = ConcurrentHashMap<String, List<ClassDef>>()

/**
 * What blocking new chats reads or edits on [build]: ConnectionsManager for the gate, the screens
 * that watch a chat as they open (the chat screen and the topic list among them), and the
 * MessagesController and ChatObject they ask.
 */
internal fun newChatsHosts(build: File): List<ClassDef> = NEW_CHATS_HOSTS.getOrPut(build.path) {
    val screens = FixtureDex.classesWhere(build, { true }) { method -> method.name == "onFragmentCreate" &&
        method.body().any { it.ref()?.startsWith("$MESSAGES_CONTROLLER->startShortPoll(") == true } }
    (ghostModeHosts(build) + screens + FixtureDex.classes(build, setOf(CHAT_OBJECT, MESSAGES_CONTROLLER)).values).distinctBy { it.type }
}

private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.ref() = (this as? ReferenceInstruction)?.reference?.toString()
