/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.translate

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
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
class HideTranslateBarFixtureTest {
    @Test fun `the chat screen's two reads ask the runtime and message translation stays Telegram's`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val sites = context.resolveTranslateBar()
            assertEquals("$name: the top bar and the menu", 2, sites.size)
            val screen = sites.first().method.definingClass
            val panel = panel(sites)
            val updater = updater(sites)
            val always = listOf(barTap(context, build), barClose(context, build), barLabel(context, build))
            val changed = sites.map { key(it.method) }.toSet() + key(pinnedDecision(context, screen)) + key(resumeOf(context, screen)) + always.map(::key)
            val old = sites.associate { key(it.method) to ImmutableMethod.of(it.method) }
            val untouched = hostState(build, context, changed)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideTranslateBarPatch.execute(context) })

            for (site in sites) {
                val stock = old.getValue(key(site.method))
                val before = stock.controlBody()
                val after = site.method.controlBody()
                assertEquals(Opcode.INVOKE_STATIC, after[site.index].opcode)
                assertEquals("$TRANSLATE_BAR->hidden(Ljava/lang/Object;J)Z", after[site.index].controlRef())
                assertEquals("$name: the controller and the chat id", before[site.index].namedRegisters(), after[site.index].namedRegisters())
                assertEquals(BAR_HIDDEN, before[site.index].controlRef())
                // Always show translate bar adds its question to the top bar and swaps the menu's offer.
                val landing = if (site === panel) panelLanding(stock, site.index) else -1
                val added = if (site === panel) landing..landing + 2 else IntRange.EMPTY
                val swapped = setOf(site.index) + if (site === updater) before.indices.filter { before[it].controlRef() == BAR_OFFERED } else emptyList()
                assertEquals("$name: every other instruction, branch and handler", shape(stock, IntRange.EMPTY, landing, swapped), shape(site.method, added, landing, swapped))
            }
            // Message translation and the controller itself keep Telegram's answer.
            assertEquals("$name: every other method, MessageObject's included", untouched, hostState(build, context, changed))
            val readers = hosts(build).flatMap { it.methods }.filter { m -> m.controlBody().any { it.controlRef() == BAR_HIDDEN } }
                .map { it.origDefiningClass }.toSet()
            assertTrue("$name: message translation still asks", MESSAGE_OBJECT in readers && TRANSLATE_CONTROLLER in readers)

            for ((stub, target) in listOf("stockHidden" to BAR_HIDDEN, "translating" to TRANSLATING, "stockOffered" to BAR_OFFERED, "available" to BAR_AVAILABLE)) {
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
            val changes: List<Pair<String, (BytecodePatchContext, List<TranslateBarSite>) -> Unit>> = listOf(
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
                "missing always shown flag" to { c, _ -> c.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == "alwaysTranslateBar" } },
            )
            val missingHooks: List<Pair<String, (BytecodePatchContext, List<TranslateBarSite>) -> Unit>> = listOf("alwaysShown", "offered", "barTapped", "barClosed",
                "barTranslating", "stockOffered", "available", "hideDialog", "chatController", "chatDialog", "controllerOwner", "encrypted").map { hook ->
                "missing $hook" to { c, _ -> c.tgMutableClassDefBy(TRANSLATE_BAR).methods.removeAll { it.origName == hook } }
            }
            val mutations = changes + missingHooks
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
            // Plus Messenger loads its closed pin key between the read and the test.
            val head = stockBody.indices.single { at -> stockBody[at].fieldType() == MESSAGE_OBJECT &&
                stockBody[at].controlField()?.definingClass == screen &&
                (if (stockBody[at + 1].controlString() != null) at + 2 else at + 1).let { test ->
                    stockBody[test].opcode == Opcode.IF_EQZ && stockFlow.normal[test].first() == info } }

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
                "no thread check comes first" to { body, m -> val info = body.indices.single { body.chatInfoAt(it) }
                    val at = (info - 1 downTo 0).first { body[it].fieldType() == MESSAGE_OBJECT }
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

            // The settings closing over a chat that never left the front runs the same decision.
            val stub = context.tgMutableClassDefBy(TRANSLATE_BAR).methods.single { it.origName == "decidePinnedBar" }
            val stubBody = stub.controlBody()
            assertEquals(name, listOf(Opcode.CHECK_CAST, Opcode.CONST_4, Opcode.CONST_4, Opcode.INVOKE_VIRTUAL, Opcode.RETURN), stubBody.map { it.opcode })
            assertEquals("$name: the screen", decision.definingClass, (stubBody[0] as ReferenceInstruction).reference.toString())
            assertEquals("$name: animated", 1L, (stubBody[1] as WideLiteralInstruction).wideLiteral)
            assertEquals("$name: from its first step", 0L, (stubBody[2] as WideLiteralInstruction).wideLiteral)
            assertEquals("$name: the decision", decisionRef, (stubBody[3] as ReferenceInstruction).reference.toString())
            assertEquals(name, listOf(2) + decision.parameterTypes.map { if (it.toString() == "Z") 0 else 1 }, stubBody[3].namedRegisters())
            assertEquals("$name: answers yes", listOf(0), stubBody[4].namedRegisters())
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

    @Test fun `the top bar asks the runtime only after Telegram said no`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val panel = panel(context.resolveTranslateBar())
            val stock = ImmutableMethod.of(panel.method)
            val stockBody = stock.controlBody()
            val ask = panel.index
            val landing = panelLanding(stock, ask)
            val answer = stockBody[ask + 3].namedRegisters().single()
            val chat = stockBody[ask - 2].namedRegisters().single()
            assertEquals("$name: Telegram's no", listOf(answer), stockBody[landing - 1].namedRegisters())

            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideTranslateBarPatch.execute(context) })
            val body = panel.method.controlBody()
            assertEquals("$name: asked once", listOf(landing + 1), body.indices.filter { body[it].controlRef() == ALWAYS_HOOK })
            assertEquals(listOf(Opcode.IF_NEZ, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT), (landing..landing + 2).map { body[it].opcode })
            assertEquals("$name: Telegram's answer is read first", listOf(answer), body[landing].namedRegisters())
            assertEquals("$name: the chat screen", listOf(chat), body[landing + 1].namedRegisters())
            assertEquals("$name: the runtime's answer takes its place", listOf(answer), body[landing + 2].namedRegisters())
            val flow = ControlFlow.of(panel.method)
            assertEquals("$name: Telegram's yes goes to the hook", listOf(landing), flow.normal[ask + 4])
            assertEquals("$name: Telegram's no goes to the hook", listOf(landing), flow.normal[landing - 1])
            assertEquals("$name: a yes skips the question", setOf(landing + 1, landing + 3), flow.normal[landing].toSet())
            assertEquals(listOf(landing + 3), flow.normal[landing + 2])
            assertTrue("$name: no handler", (landing..landing + 2).all { flow.exceptional[it].isEmpty() })
            assertEquals(1L, flag(context, "alwaysTranslateBar"))
        }
    }

    @Test fun `the menu's offer and the bar's label ask the runtime with Telegram's registers`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val updater = updater(context.resolveTranslateBar()).method
            val label = barLabel(context, build)
            val cases = listOf(Triple(updater, BAR_OFFERED, OFFERED_HOOK), Triple(label, TRANSLATING, LABEL_HOOK)).map { (method, target, hook) ->
                val stock = ImmutableMethod.of(method)
                val at = stock.controlBody().indices.single { stock.controlBody()[it].controlRef() == target }
                listOf(method, stock, at, hook)
            }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideTranslateBarPatch.execute(context) })
            for ((method, stock, at, hook) in cases) {
                method as MutableMethod; stock as Method; at as Int
                val body = method.controlBody()
                assertEquals("$name: $hook", hook, body[at].controlRef())
                assertEquals(Opcode.INVOKE_STATIC, body[at].opcode)
                assertEquals("$name: the controller and the chat id", stock.controlBody()[at].namedRegisters(), body[at].namedRegisters())
            }
            val labelStock = cases[1]
            assertEquals("$name: the label's other instructions", shape(labelStock[1] as Method, IntRange.EMPTY, -1, setOf(labelStock[2] as Int)),
                shape(label, IntRange.EMPTY, -1, setOf(labelStock[2] as Int)))
        }
    }

    @Test fun `the bar's tap and close ask the runtime before Telegram's own code`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val screen = context.resolveTranslateBar().first().method.definingClass
            val tap = barTap(context, build)
            val close = barClose(context, build)
            val stockTap = ImmutableMethod.of(tap)
            val stockClose = ImmutableMethod.of(close)
            val tapAt = chatLoad(stockTap.controlBody(), screen)
            val closeAt = chatLoad(stockClose.controlBody(), screen)
            val tapChat = (stockTap.controlBody()[tapAt] as TwoRegisterInstruction).registerA
            val closeChat = (stockClose.controlBody()[closeAt] as TwoRegisterInstruction).registerA
            val scratch = stockTap.controlBody()[tapAt + 2].namedRegisters().single()
            assertEquals("$name: Telegram's next read overwrites the answer", Opcode.MOVE_RESULT_OBJECT, stockTap.controlBody()[tapAt + 2].opcode)

            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideTranslateBarPatch.execute(context) })
            val body = tap.controlBody()
            val hook = tapAt + 1..tapAt + 4
            assertEquals(listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID), hook.map { body[it].opcode })
            assertEquals(TAPPED_HOOK, body[tapAt + 1].controlRef())
            assertEquals("$name: the chat screen", listOf(tapChat), body[tapAt + 1].namedRegisters())
            assertEquals(listOf(scratch), body[tapAt + 2].namedRegisters())
            assertEquals(listOf(scratch), body[tapAt + 3].namedRegisters())
            val flow = ControlFlow.of(tap)
            assertEquals("$name: a no runs Telegram's tap", setOf(tapAt + 4, tapAt + 5), flow.normal[tapAt + 3].toSet())
            assertEquals("$name: Telegram's tap, whole", shape(stockTap, IntRange.EMPTY, tapAt + 1), shape(tap, hook, tapAt + 1))

            val closed = close.controlBody()
            assertEquals(Opcode.INVOKE_STATIC_RANGE, closed[closeAt + 1].opcode)
            assertEquals(CLOSED_HOOK, closed[closeAt + 1].controlRef())
            assertEquals("$name: the chat screen", listOf(closeChat), closed[closeAt + 1].namedRegisters())
            assertEquals("$name: Telegram's close, whole", shape(stockClose, IntRange.EMPTY, closeAt + 1), shape(close, closeAt + 1..closeAt + 1, closeAt + 1))
        }
    }

    @Test fun `the always shown bar's stubs reach Telegram`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideTranslateBarPatch.execute(context) })
            fun calls(stub: String) = context.tgMutableClassDefBy(TRANSLATE_BAR).methods.single { it.origName == stub }.controlBody()
                .mapNotNull { it.controlRef() }.filter { "->" in it }.map { it.substringAfter("->") }
            assertEquals(listOf("setHideTranslateDialog(JZZ)V"), calls("hideDialog"))
            assertEquals(listOf("getCurrentAccount()I", "getInstance(I)$MESSAGES", "getTranslateController()$TRANSLATE_CONTROLLER"), calls("chatController"))
            assertEquals(listOf("getUserConfig()$USER_CONFIG", "getClientUserId()J"), calls("controllerOwner"))
            assertEquals(listOf("isEncryptedDialog(J)Z"), calls("encrypted"))
            assertTrue("${build.name}: the chat screen's own id getter", calls("chatDialog").single().endsWith("()J"))
        }
    }

    @Test fun `a bar built another way leaves the switch out and everything else lands`() {
        for (build in Fixtures.declaredBuilds()) {
            val cases: List<Pair<String, (BytecodePatchContext, List<TranslateBarSite>) -> Unit>> = listOf(
                "the top bar's yes is built another way" to { _, s -> val p = panel(s)
                    p.method.replaceInstruction(p.index + 3, "const/16 v${p.method.controlBody()[p.index + 3].namedRegisters().single()}, 0x1") },
                "the tap no longer counts" to { c, _ -> dropCounter(barTap(c, build)) },
                "the close no longer counts" to { c, _ -> dropCounter(barClose(c, build)) },
                "the label no longer asks" to { c, _ -> val m = barLabel(c, build)
                    m.replaceInstruction(m.controlBody().indexOfFirst { it.controlRef() == TRANSLATING }, "nop") },
                "the menu no longer offers" to { _, s -> val m = updater(s).method
                    m.replaceInstruction(m.controlBody().indexOfFirst { it.controlRef() == BAR_OFFERED }, "nop") },
            )
            for ((case, change) in cases) {
                val c = context(build)
                val sites = c.resolveTranslateBar()
                change(c, sites)
                val warnings = PatchLogCapture.warnings { hideTranslateBarPatch.execute(c) }
                assertEquals("${build.name}: $case: $warnings", 1, warnings.size)
                assertTrue(warnings.single(), warnings.single().startsWith("Hide translate bar: ") &&
                    warnings.single().endsWith("The patch goes on without the Always show translate bar switch."))
                assertEquals("${build.name}: $case", 0L, flag(c, "alwaysTranslateBar"))
                assertEquals("${build.name}: $case", 1L, flag(c, "hideTranslateBar"))
                assertEquals("${build.name}: $case", 1L, flag(c, "hidePinnedBar"))
                assertTrue(sites.all { it.method.controlBody()[it.index].controlRef() == "$TRANSLATE_BAR->hidden(Ljava/lang/Object;J)Z" })
                val hooks = setOf(ALWAYS_HOOK, OFFERED_HOOK, TAPPED_HOOK, CLOSED_HOOK, LABEL_HOOK)
                assertTrue("${build.name}: $case adds no hook", hosts(build).flatMap { c.tgMutableClassDefBy(it.type).methods }
                    .none { m -> m.controlBody().any { it.controlRef() in hooks } })
            }
        }
    }

    private fun dropCounter(method: MutableMethod) {
        val at = method.controlBody().indexOfFirst { it.controlString() == BAR_COUNTER }
        method.replaceInstruction(at, "const-string v${method.controlBody()[at].namedRegisters().single()}, \"another_count\"")
    }

    private fun panel(sites: List<TranslateBarSite>) = sites.single { it.method.parameterTypes.size == 1 }
    private fun updater(sites: List<TranslateBarSite>) = sites.single { it.method.parameterTypes.isEmpty() }
    /** Where Telegram's yes and no meet: the jump after its yes goes there. */
    private fun panelLanding(stock: Method, ask: Int) = ControlFlow.of(stock).normal[ask + 4].single()

    private fun hostMethods(c: BytecodePatchContext, build: File) = hosts(build).flatMap { c.tgMutableClassDefBy(it.type).methods }
    private fun barClicks(c: BytecodePatchContext, build: File) = hostMethods(c, build).filter { m ->
        m.name == "onClick" && m.parameterTypes.map(CharSequence::toString) == listOf(VIEW) && m.controlBody().any { it.controlString() == BAR_COUNTER }
    }
    private fun barTap(c: BytecodePatchContext, build: File) = barClicks(c, build).single { m -> m.controlBody().any { it.controlRef() == BAR_TOGGLE } }
    private fun barClose(c: BytecodePatchContext, build: File) = barClicks(c, build).single { m -> m.controlBody().none { it.controlRef() == BAR_TOGGLE } }
    private fun barLabel(c: BytecodePatchContext, build: File) = hostMethods(c, build).single { m ->
        m.parameterTypes.isEmpty() && m.returnType == "V" && m.controlBody().map { it.controlRef() }.let { TRANSLATING in it && BAR_TARGET in it }
    }
    /** The read of the chat screen nearest in front of the count key. */
    private fun chatLoad(body: List<Instruction>, screen: String) = (body.indexOfFirst { it.controlString() == BAR_COUNTER } - 1 downTo 0)
        .first { body[it].opcode == Opcode.IGET_OBJECT && body[it].controlField()?.type == screen }

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
     * instruction the hook went in front of matches the same branch onto the hook. The instructions
     * at [swapped], calls a hook took over, keep their place and aren't compared.
     */
    private fun shape(method: Method, hook: IntRange, landing: Int, swapped: Set<Int> = emptySet()): List<List<Any?>> {
        val body = method.controlBody()
        val flow = ControlFlow.of(method)
        val kept = body.indices.filter { it !in hook && body[it].opcode != Opcode.NOP }
        val place = kept.withIndex().associate { (at, index) -> index to at }
        fun at(target: Int): Any = if (target in hook || target == landing) "the hook" else place[target]
            ?: "a nop before ${kept.firstOrNull { it > target }?.let { place[it] } ?: "the end"}"
        return kept.filter { it !in swapped }.map { i ->
            val instruction = body[i]
            val opcode = if (instruction.opcode == Opcode.GOTO_16 || instruction.opcode == Opcode.GOTO_32) Opcode.GOTO else instruction.opcode
            listOf(opcode, instruction.namedRegisters(), instruction.origRef(), (instruction as? WideLiteralInstruction)?.wideLiteral,
                (instruction as? SwitchPayload)?.switchElements?.map { it.key }, flow.normal[i].map(::at), flow.exceptional[i].map(::at))
        }
    }

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + (hosts(build) + reach(build)).distinctBy { it.type })
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

    /** Every class that asks whether a chat's translate bar is hidden, the bar's own listeners and label, and the controller. */
    private fun loadHosts(build: File): List<ClassDef> {
        val readers = FixtureDex.classesWhere(build, { true }) { method ->
            val body = method.controlBody()
            body.any { it.controlRef() == BAR_HIDDEN } ||
                method.name == "onClick" && method.parameterTypes.map(CharSequence::toString) == listOf(VIEW) && body.any { it.controlString() == BAR_COUNTER } ||
                method.parameterTypes.isEmpty() && method.returnType == "V" && body.map { it.controlRef() }.let { TRANSLATING in it && BAR_TARGET in it }
        }
        return (readers + FixtureDex.classes(build, setOf(TRANSLATE_CONTROLLER, MESSAGE_OBJECT)).values)
            .associateBy { it.type }.values.map(ImmutableClassDef::of)
    }

    /** What the stubs call and the verifier walks: the hosts' base classes and Telegram's account classes. Never edited. */
    private fun reach(build: File): List<ClassDef> {
        val identity = FixtureDex.inputIdentity(build)
        return REACH[identity]?.get() ?: loadReach(build).also {
            if (REACH.size >= 2) REACH.clear()
            REACH[identity] = SoftReference(it)
        }
    }

    private fun loadReach(build: File): List<ClassDef> {
        val found = FixtureDex.classes(build, setOf(MESSAGES, USER_CONFIG, DIALOG_OBJECT, BASE_CONTROLLER)).values.toMutableList()
        val known = hosts(build).map { it.type }.toMutableSet()
        var next = (hosts(build) + found).mapNotNull { it.superclass }.filter { it.startsWith("Lorg/telegram/") }.toSet() - known
        while (next.isNotEmpty()) {
            val loaded = FixtureDex.classes(build, next).values
            found += loaded
            known += next
            next = loaded.mapNotNull { it.superclass }.filter { it.startsWith("Lorg/telegram/") }.toSet() - known
        }
        return found.distinctBy { it.type }.map(ImmutableClassDef::of)
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
        private const val ALWAYS_HOOK = "$TRANSLATE_BAR->alwaysShown(Ljava/lang/Object;)Z"
        private const val OFFERED_HOOK = "$TRANSLATE_BAR->offered(Ljava/lang/Object;J)Z"
        private const val TAPPED_HOOK = "$TRANSLATE_BAR->barTapped(Ljava/lang/Object;)Z"
        private const val CLOSED_HOOK = "$TRANSLATE_BAR->barClosed(Ljava/lang/Object;)V"
        private const val LABEL_HOOK = "$TRANSLATE_BAR->barTranslating(Ljava/lang/Object;J)Z"
        private const val BAR_OFFERED = "$TRANSLATE_CONTROLLER->isDialogTranslatable(J)Z"
        private const val BAR_AVAILABLE = "$TRANSLATE_CONTROLLER->isFeatureAvailable(J)Z"
        private const val BAR_TOGGLE = "$TRANSLATE_CONTROLLER->toggleTranslatingDialog(JZ)Z"
        private const val BAR_TARGET = "$TRANSLATE_CONTROLLER->getDialogTranslateTo(J)Ljava/lang/String;"
        private const val BAR_COUNTER = "dialog_show_translate_count"
        private const val VIEW = "Landroid/view/View;"
        private const val MESSAGES = "Lorg/telegram/messenger/MessagesController;"
        private const val USER_CONFIG = "Lorg/telegram/messenger/UserConfig;"
        private const val DIALOG_OBJECT = "Lorg/telegram/messenger/DialogObject;"
        private const val BASE_CONTROLLER = "Lorg/telegram/messenger/BaseController;"
        private val HOSTS = mutableMapOf<String, SoftReference<List<ClassDef>>>()
        private val REACH = mutableMapOf<String, SoftReference<List<ClassDef>>>()
        @AfterClass @JvmStatic fun releaseFixtures() { HOSTS.clear(); REACH.clear() }
    }
}
