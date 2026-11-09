/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.notifications

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.names.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test
import app.morphe.util.names.origRef
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy

/** The silent notification check, the stubs and the runtime. */
class SilenceNonContactsFixtureTest {
    private val hostTypes = setOf(NOTIFICATIONS, MESSAGE_OBJECT, TL_USER, "Lorg/telegram/messenger/MessagesController;")

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() +
        FixtureDex.classesWhere(build, { true }) { m -> m.origDefiningClass in hostTypes }.map(ImmutableClassDef::of))

    /** A goto an insert pushed out of reach grows to goto/16; it's still the same jump. */
    private fun Opcode.kind() = if (this == Opcode.GOTO_16 || this == Opcode.GOTO_32) Opcode.GOTO else this

    /** The code with each three-instruction hook taken out, for comparing with stock. */
    private fun withoutHooks(code: List<Instruction>): List<List<Any?>> {
        val skipped = code.indices.filter { code[it].controlRef() == SILENCED }.flatMap { listOf(it, it + 1, it + 2) }.toSet()
        return code.filterIndexed { i, it -> i !in skipped && it.opcode != Opcode.NOP }
            .map { listOf(it.opcode.kind(), it.namedRegisters(), it.origRef()) }
    }

    @Test fun `a message from a stranger counts as silent before Telegram's own check`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val hook = context.resolveSilenceNonContacts()
            // 13.2 inlines the check twice into showOrUpdateNotification.
            assertEquals("$name: both copies", 2, hook.checks.size)
            val old = ImmutableMethod.of(hook.method)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { silenceNonContactsPatch.execute(context) })

            val after = hook.method.controlBody()
            val flow = ControlFlow.of(hook.method)
            val copies = silentChecks(hook.method)
            assertEquals("$name: both copies still whole", 2, copies.size)
            for (copy in copies) {
                val at = copy.start - 3
                assertEquals("$name: in front of the copy", listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_NEZ),
                    after.subList(at, copy.start).map { it.opcode })
                assertEquals(SILENCED, after[at].controlRef())
                assertEquals("$name: the message", listOf(copy.message), after[at].namedRegisters())
                assertEquals("$name: the answer", listOf(copy.sender), after[at + 1].namedRegisters())
                assertEquals(listOf(copy.sender), after[at + 2].namedRegisters())
                assertTrue("$name: a stranger jumps to the check's silent answer", copy.silent in flow.normal[at + 2])
            }
            assertEquals("$name: one hook per copy", 2, after.count { it.controlRef() == SILENCED })
            assertEquals("$name: the rest is stock", withoutHooks(old.controlBody()), withoutHooks(after))

            val stub = { n: String -> context.tgMutableClassDefBy(NON_CONTACTS).methods.single { it.origName == n }.controlBody().map { it.controlRef() } }
            assertTrue("$MESSAGE_OBJECT->getDialogId()J" in stub("dialog"))
            assertTrue("Lorg/telegram/messenger/MessagesController;->getUser(Ljava/lang/Long;)$TL_USER" in stub("user"))
            for (flag in listOf("contact", "bot", "self")) assertTrue("$TL_USER->$flag:Z" in stub(flag))
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "silenceNonContacts" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a copy of the check that changed refuses before anything is edited`() {
        val context = context(Fixtures.declaredBuilds().first())
        val method = context.resolveSilenceNonContacts().method
        method.replaceInstruction(silentChecks(method).last().reaction, "nop")
        val untouched = method.controlBody().map { it.opcode to it.namedRegisters() }
        try {
            silenceNonContactsPatch.execute(context)
            fail("the patch went ahead")
        } catch (refused: PatchException) {
            assertTrue(refused.message, refused.message!!.contains("the silent notification check is missing, changed or in more than one place"))
        }
        assertEquals(untouched, method.controlBody().map { it.opcode to it.namedRegisters() })
        val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "silenceNonContacts" }.controlBody()
        assertEquals(0L, (status.first() as WideLiteralInstruction).wideLiteral)
    }
}
