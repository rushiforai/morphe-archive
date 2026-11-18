/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.translate

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.PlusPending
import app.morphe.util.names.origRef
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.ControlFlow
import app.morphe.util.RegisterLiveness
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.AfterClass
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.lang.ref.SoftReference
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origString
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

/** TranslateController, MessageObject, the chat screen, and the runtime. */
@PlusPending
class HideTranslateBarFixtureTest {
    @Test fun `the chat screen's two reads ask the runtime and message translation stays Telegram's`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val sites = context.resolveTranslateBar()
            assertEquals("$name: the top bar and the menu", 2, sites.size)
            val screen = sites.first().method.definingClass
            val changed = sites.map { key(it.method) }.toSet() + key(pinnedDecision(context, screen)) + key(resumeOf(context, screen))
            val old = sites.associate { key(it.method) to ImmutableMethod.of(it.method) }
            val untouched = hostState(build, context, changed)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideTranslateBarPatch.execute(context) })

            for (site in sites) {
                val before = old.getValue(key(site.method)).controlBody()
                val after = site.method.controlBody()
                assertEquals("$name: same length", before.size, after.size)
                assertEquals(Opcode.INVOKE_STATIC, after[site.index].opcode)
                assertEquals("$TRANSLATE_BAR->hidden(Ljava/lang/Object;J)Z", after[site.index].controlRef())
                assertEquals("$name: the controller and the chat id", before[site.index].namedRegisters(), after[site.index].namedRegisters())
                assertEquals(BAR_HIDDEN, before[site.index].controlRef())
                for (i in before.indices) if (i != site.index) assertEquals("$name: stock operand $i", before[i].operand(), after[i].operand())
                val a = ControlFlow.of(old.getValue(key(site.method)))
                val b = ControlFlow.of(site.method)
                assertEquals("$name: same paths", a.normal.toList(), b.normal.toList())
                assertEquals("$name: same handlers", a.exceptional.toList(), b.exceptional.toList())
            }
            // Message translation and the controller itself keep Telegram's answer.
            assertEquals("$name: every other method, MessageObject's included", untouched, hostState(build, context, changed))
            val readers = hosts(build).flatMap { it.methods }.filter { m -> m.controlBody().any { it.controlRef() == BAR_HIDDEN } }
                .map { it.origDefiningClass }.toSet()
            assertTrue("$name: message translation still asks", MESSAGE_OBJECT in readers && TRANSLATE_CONTROLLER in readers)

            for ((stub, target) in listOf("stockHidden" to BAR_HIDDEN, "translating" to TRANSLATING)) {
                val body = context.tgMutableClassDefBy(TRANSLATE_BAR).methods.single { it.origName == stub }.controlBody()
                assertEquals(listOf(Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.RETURN), body.map { it.opcode })
                assertEquals(target, body[1].controlRef())
            }
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "hideTranslateBar" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a changed screen or runtime refuses before any method changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val mutations: List<Pair<String, (BytecodePatchContext, List<TranslateBarSite>) -> Unit>> = listOf(
                "the answer isn't read" to { _, s -> s.first().method.replaceInstruction(s.first().index + 1, "nop") },
                "no read left" to { _, s -> s.forEach { it.method.replaceInstruction(it.index, "nop") } },
                "translating check private" to { c, _ -> val m = c.tgMutableClassDefBy(TRANSLATE_CONTROLLER).methods.single { it.origString() == TRANSLATING }
                    m.accessFlags = m.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing build flag" to { c, _ -> c.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == "hideTranslateBar" } },
                "private hidden hook" to { c, _ -> val h = c.tgMutableClassDefBy(TRANSLATE_BAR).methods.single { it.origName == "hidden" }
                    h.accessFlags = h.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing stock stub" to { c, _ -> c.tgMutableClassDefBy(TRANSLATE_BAR).methods.removeAll { it.origName == "stockHidden" } },
                "missing pinned bar hook" to { c, _ -> c.tgMutableClassDefBy(TRANSLATE_BAR).methods.removeAll { it.origName == "pinnedBarHidden" } },
                "missing pinned bar return hook" to { c, _ -> c.tgMutableClassDefBy(TRANSLATE_BAR).methods.removeAll { it.origName == "pinnedBarChanged" } },
                "missing pinned bar flag" to { c, _ -> c.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == "hidePinnedBar" } },
            )
            for ((case, change) in mutations) {
                val c = context(build)
                change(c, c.resolveTranslateBar())
                val before = completeState(build, c)
                assertThrows("${build.name}: $case", PatchException::class.java) { hideTranslateBarPatch.execute(c) }
                assertEquals("${build.name}: $case preserves every method, path and build fact", before, completeState(build, c))
            }
        }
    }

    @Test fun `the pinned message bar asks the runtime first and a yes takes Telegram's own hide path`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val screen = context.resolveTranslateBar().first().method.definingClass
            val stock = ImmutableMethod.of(pinnedDecision(context, screen))
            val stockBody = stock.controlBody()
            val stockFlow = ControlFlow.of(stock)
            val info = stockBody.indices.single { stockBody.chatInfoAt(it) }
            // Telegram's no-info branch is its hide path: the screen's hide, then the chat laid out again.
            val hide = stockFlow.normal[info + 3].first()
            // The first check asks whether this is a comment thread, and a plain chat goes on to the info.
            val head = stockBody.indices.single { at -> stockBody[at].fieldType() == MESSAGE_OBJECT &&
                stockBody[at].controlField()?.definingClass == screen && stockBody[at + 1].opcode == Opcode.IF_EQZ &&
                stockFlow.normal[at + 1].first() == info }

            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideTranslateBarPatch.execute(context) })
            val changed = pinnedDecision(context, screen)
            val body = changed.controlBody()
            assertEquals("$name: asked once, ahead of the thread check", listOf(head), body.indices.filter { body[it].controlRef() == PINNED_HOOK })
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ), (head..head + 2).map { body[it].opcode })
            val scratch = (stockBody[head] as TwoRegisterInstruction).registerA
            assertEquals("$name: the answer lands in the register the thread check loads next", listOf(scratch), body[head + 1].namedRegisters())
            assertEquals(listOf(scratch), body[head + 2].namedRegisters())
            val flow = ControlFlow.of(changed)
            val moved = stockToChanged(stock, changed, head until head + 3)
            assertEquals("$name: a yes hides the bar, a no runs Telegram's checks", listOf(moved.getValue(hide), moved.getValue(head)), flow.normal[head + 2])
            assertEquals("$name: the hook sits where the thread check did", stockFlow.exceptional[head].map { moved[it] }, flow.exceptional[head])
            assertEquals("$name: every stock instruction, branch and handler", shape(stock, IntRange.EMPTY, head), shape(changed, head until head + 3, head))
            assertEquals("$name: handlers", stock.implementation!!.tryBlocks.map { b -> b.exceptionHandlers.map { it.exceptionType } },
                changed.implementation!!.tryBlocks.map { b -> b.exceptionHandlers.map { it.exceptionType } })

            assertEquals(1L, flag(context, "hidePinnedBar"))
            assertEquals(1L, flag(context, "hideTranslateBar"))
        }
    }

    @Test fun `a pinned message bar decided another way stays Telegram's and the translate bar still lands`() {
        for (build in Fixtures.declaredBuilds()) {
            val cases: List<Pair<String, (List<Instruction>, MutableMethod) -> Unit>> = listOf(
                "the closed pin is read elsewhere" to { body, m -> body.indices.filter { body[it].controlString() == "pin_" }
                    .forEach { m.replaceInstruction(it, "const-string v${body[it].namedRegisters().first()}, \"pinned_\"") } },
                "the user's info isn't asked" to { body, m -> val at = body.indices.single { body.chatInfoAt(it) } + 2
                    m.replaceInstruction(at, "const/16 v${body[at].namedRegisters().first()}, 0x0") },
                "the hide path returns at once" to { body, m -> m.replaceInstruction(ControlFlow.of(m).normal[body.indices.single { body.chatInfoAt(it) } + 3].first(), "return-void") },
                "no thread check comes first" to { body, m -> val at = body.indices.single { body.chatInfoAt(it) } - 4
                    m.replaceInstruction(at, "const/16 v${body[at].namedRegisters().first()}, 0x0") },
            )
            for ((case, change) in cases) {
                val c = context(build)
                val sites = c.resolveTranslateBar()
                val decision = pinnedDecision(c, sites.first().method.definingClass)
                change(decision.controlBody(), decision)
                val before = decision.state()
                val warnings = PatchLogCapture.warnings { hideTranslateBarPatch.execute(c) }
                assertEquals("${build.name}: $case: $warnings", 1, warnings.size)
                assertTrue(warnings.single(), warnings.single().startsWith("Hide translate bar: ") &&
                    warnings.single().endsWith("The patch goes on without the pinned message bar switch."))
                assertEquals("${build.name}: $case keeps the decision", before, decision.state())
                assertTrue(c.tgMutableClassDefBy(sites.first().method.definingClass).methods.none { m -> m.controlBody().any { it.controlRef() == PINNED_HOOK } })
                assertEquals("${build.name}: $case", 0L, flag(c, "hidePinnedBar"))
                assertEquals("${build.name}: $case", 1L, flag(c, "hideTranslateBar"))
                assertTrue(sites.all { it.method.controlBody()[it.index].controlRef() == "$TRANSLATE_BAR->hidden(Ljava/lang/Object;J)Z" })
            }
        }
    }

    @Test fun `a chat coming back to the front decides on its pinned bar again when the answer changed`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val screen = context.resolveTranslateBar().first().method.definingClass
            val decision = pinnedDecision(context, screen)
            val decisionRef = "${decision.definingClass}->${decision.name}(${decision.parameterTypes.joinToString("")})V"
            val stock = ImmutableMethod.of(resumeOf(context, screen))
            val stockBody = stock.controlBody()
            val at = stockBody.indices.single { stockBody[it].opcode == Opcode.INVOKE_SUPER &&
                stockBody[it].controlRef()?.endsWith("->onResume()V") == true } + 1
            val live = RegisterLiveness.of(stock).liveInto(at)

            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideTranslateBarPatch.execute(context) })
            val changed = resumeOf(context, screen)
            val body = changed.controlBody()
            assertEquals("$name: asked once, right after the super call", listOf(at + 1), body.indices.filter { body[it].controlRef() == CHANGED_HOOK })
            assertEquals(listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.CONST_4,
                Opcode.INVOKE_VIRTUAL), (at until at + 7).map { body[it].opcode })
            val (copy, from) = body[at].namedRegisters()
            assertEquals("$name: the screen itself", stock.implementation!!.registerCount - 1, from)
            assertEquals(listOf(copy), body[at + 1].namedRegisters())
            val answer = body[at + 2].namedRegisters().single()
            assertEquals(listOf(answer), body[at + 3].namedRegisters())
            assertEquals(listOf(answer), body[at + 4].namedRegisters())
            assertEquals("$name: animated", 1L, (body[at + 4] as WideLiteralInstruction).wideLiteral)
            val zero = body[at + 5].namedRegisters().single()
            assertEquals("$name: from its first step", 0L, (body[at + 5] as WideLiteralInstruction).wideLiteral)
            assertEquals("$name: three registers nothing reads", 3, setOf(copy, answer, zero).size)
            assertTrue("$name: nothing Telegram reads is overwritten ($live)", listOf(copy, answer, zero).none { it in live })
            assertEquals("$name: the decision", decisionRef, (body[at + 6] as ReferenceInstruction).reference.toString())
            assertEquals(listOf(copy) + decision.parameterTypes.map { if (it.toString() == "Z") answer else zero }, body[at + 6].namedRegisters())
            val flow = ControlFlow.of(changed)
            assertEquals("$name: an unchanged answer goes straight on", setOf(at + 4, at + 7), flow.normal[at + 3].toSet())
            assertEquals(listOf(at + 7), flow.normal[at + 6])
            assertTrue("$name: no handler", (at until at + 7).all { flow.exceptional[it].isEmpty() })
            assertEquals("$name: every stock instruction, branch and handler", shape(stock, IntRange.EMPTY, at), shape(changed, at until at + 7, at))
            assertEquals(1L, flag(context, "hidePinnedBar"))
        }
    }

    @Test fun `a chat screen that resumes another way keeps the switch for the next chat opened`() {
        for (build in Fixtures.declaredBuilds()) {
            val cases: List<Pair<String, (List<Instruction>, MutableMethod) -> Unit>> = listOf(
                "no super call" to { body, m -> m.replaceInstruction(body.indices.single { body[it].opcode == Opcode.INVOKE_SUPER &&
                    body[it].controlRef()?.endsWith("->onResume()V") == true }, "nop") },
                "the screen's register written first" to { _, m -> m.replaceInstruction(0, "const/16 v${m.implementation!!.registerCount - 1}, 0x0") },
            )
            for ((case, change) in cases) {
                val c = context(build)
                val screen = c.resolveTranslateBar().first().method.definingClass
                val resume = resumeOf(c, screen)
                change(resume.controlBody(), resume)
                val before = resume.state()
                val warnings = PatchLogCapture.warnings { hideTranslateBarPatch.execute(c) }
                assertEquals("${build.name}: $case: $warnings", 1, warnings.size)
                assertTrue(warnings.single(), warnings.single().startsWith("Hide translate bar: ") &&
                    warnings.single().endsWith("A chat left open keeps its pinned message bar until it's opened again."))
                assertEquals("${build.name}: $case keeps onResume", before, resume.state())
                assertTrue("${build.name}: $case still hides", pinnedDecision(c, screen).controlBody().any { it.controlRef() == PINNED_HOOK })
                assertEquals("${build.name}: $case", 1L, flag(c, "hidePinnedBar"))
            }
        }
    }

    private fun resumeOf(c: BytecodePatchContext, screen: String) = c.tgMutableClassDefBy(screen).methods.single {
        it.origName == "onResume" && it.parameterTypes.isEmpty() && it.returnType == "V"
    }

    /** The screen method that reads the closed pin and checks the chat's and user's info: where the pinned bar is decided. */
    private fun pinnedDecision(c: BytecodePatchContext, screen: String) = c.tgMutableClassDefBy(screen).methods.single { m ->
        val body = m.controlBody()
        body.any { it.controlString() == "pin_" } && body.indices.any { body.chatInfoAt(it) }
    }
    private fun List<Instruction>.chatInfoAt(at: Int) = at + 3 < size && this[at].fieldType() == CHAT_FULL &&
        this[at + 1].opcode == Opcode.IF_NEZ && this[at + 2].fieldType() == USER_FULL && this[at + 3].opcode == Opcode.IF_EQZ
    /** The type an object read loads, as Telegram's source names it: R8 renames MessageObject in some builds. */
    private fun Instruction.fieldType() = if (opcode == Opcode.IGET_OBJECT) controlField()?.origType else null
    private fun flag(c: BytecodePatchContext, name: String) =
        (c.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.controlBody().first() as WideLiteralInstruction).wideLiteral

    /** Each stock instruction's place in [changed], the hook at [hook] and the NOPs of payload alignment left out. */
    private fun stockToChanged(stock: Method, changed: Method, hook: IntRange): Map<Int, Int> {
        val a = stock.controlBody().let { b -> b.indices.filter { b[it].opcode != Opcode.NOP } }
        val b = changed.controlBody().let { c -> c.indices.filter { it !in hook && c[it].opcode != Opcode.NOP } }
        assertEquals("the same stock instructions", a.size, b.size)
        return a.zip(b).toMap()
    }

    /**
     * The body outside [hook], NOPs left out: operands, branches and handlers, GOTO_16 and GOTO_32 read
     * as GOTO. A branch onto [landing] or into the hook reads as the hook, so a stock branch onto the
     * instruction the hook went in front of matches the same branch onto the hook.
     */
    private fun shape(method: Method, hook: IntRange, landing: Int): List<List<Any?>> {
        val body = method.controlBody()
        val flow = ControlFlow.of(method)
        val kept = body.indices.filter { it !in hook && body[it].opcode != Opcode.NOP }
        val place = kept.withIndex().associate { (at, index) -> index to at }
        fun at(target: Int): Any = if (target in hook || target == landing) "the hook" else place[target]
            ?: "a nop before ${kept.firstOrNull { it > target }?.let { place[it] } ?: "the end"}"
        return kept.map { i ->
            val instruction = body[i]
            val opcode = if (instruction.opcode == Opcode.GOTO_16 || instruction.opcode == Opcode.GOTO_32) Opcode.GOTO else instruction.opcode
            listOf(opcode, instruction.namedRegisters(), instruction.origRef(), (instruction as? WideLiteralInstruction)?.wideLiteral,
                (instruction as? SwitchPayload)?.switchElements?.map { it.key }, flow.normal[i].map(::at), flow.exceptional[i].map(::at))
        }
    }

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + hosts(build))
    private fun completeState(build: File, c: BytecodePatchContext) = (hosts(build).map { it.type } + listOf(TRANSLATE_BAR, SETTINGS_STATUS))
        .filter { c.tgClassDefByOrNull(it) != null }.associateWith { type -> c.tgMutableClassDefBy(type).let { cls ->
            listOf(cls.accessFlags, cls.methods.map { key(it) to it.state() }) } }
    private fun hostState(build: File, c: BytecodePatchContext, except: Set<String>) = hosts(build)
        .flatMap { c.tgMutableClassDefBy(it.type).methods }.filter { key(it) !in except }.associate { key(it) to it.state() }

    private fun hosts(build: File): List<ClassDef> {
        val identity = FixtureDex.inputIdentity(build)
        return HOSTS[identity]?.get() ?: loadHosts(build).also {
            if (HOSTS.size >= 2) HOSTS.clear()
            HOSTS[identity] = SoftReference(it)
        }
    }

    /** Every class that asks whether a chat's translate bar is hidden, and the controller. */
    private fun loadHosts(build: File): List<ClassDef> {
        val readers = FixtureDex.classesWhere(build, { true }) { method -> method.controlBody().any { it.controlRef() == BAR_HIDDEN } }
        return (readers + FixtureDex.classes(build, setOf(TRANSLATE_CONTROLLER, MESSAGE_OBJECT)).values)
            .associateBy { it.type }.values.map(ImmutableClassDef::of)
    }

    private fun Method.state(): List<Any?> {
        val body = controlBody(); val flow = if (body.isEmpty()) null else ControlFlow.of(this)
        return listOf(accessFlags, implementation?.registerCount, body.map { it.operand() }, body.map { listOf(it.codeUnits, (it as? OffsetInstruction)?.codeOffset) },
            flow?.normal?.toList(), flow?.exceptional?.toList())
    }
    private fun Instruction.operand() = listOf(opcode, namedRegisters(), origRef(),
        (this as? WideLiteralInstruction)?.wideLiteral)
    private fun key(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"

    companion object {
        /** Spelled out, so the test reads the same on a tree that doesn't have the hook yet. */
        private const val PINNED_HOOK = "$TRANSLATE_BAR->pinnedBarHidden()Z"
        private const val CHANGED_HOOK = "$TRANSLATE_BAR->pinnedBarChanged(Ljava/lang/Object;)Z"
        private const val CHAT_FULL = "Lorg/telegram/tgnet/TLRPC\$ChatFull;"
        private const val USER_FULL = "Lorg/telegram/tgnet/TLRPC\$UserFull;"
        private val HOSTS = mutableMapOf<String, SoftReference<List<ClassDef>>>()
        @AfterClass @JvmStatic fun releaseFixtures() { HOSTS.clear() }
    }
}
