/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.blocked

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** The open chat's three type tests, the stubs and the runtime. */
class HideBlockedInGroupsFixtureTest {
    private val hostTypes = setOf(MESSAGE_OBJECT, "Lorg/telegram/messenger/MessagesController;", PEERS, "Lorg/telegram/tgnet/TLRPC\$Message;")

    @Test fun `the extension answers each type test before the open chat skips a message`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { m ->
                m.definingClass in hostTypes || m.controlBody().any { it.opcode == Opcode.INSTANCE_OF && it.controlRef() == MIGRATE_TO }
            }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val sites = context.resolveHideBlockedInGroups()
            assertEquals("$name: a page load and a new-message method", 2, sites.size)
            assertEquals("$name: one load test, two new-message tests", listOf(1, 2), sites.map { it.second.size }.sorted())
            assertEquals("$name: one chat screen", 1, sites.map { it.first.definingClass }.distinct().size)
            val old = sites.map { ImmutableMethod.of(it.first) }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideBlockedInGroupsPatch.execute(context) })

            sites.forEachIndexed { s, (method, reads) ->
                val before = old[s].controlBody()
                val after = method.controlBody()
                assertEquals("$name: two instructions a test", before.size + 2 * reads.size, after.size)
                var shift = 0
                for (i in before.indices) {
                    assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), (before[i] as? ReferenceInstruction)?.reference?.toString()),
                        listOf(after[i + shift].opcode, after[i + shift].namedRegisters(), (after[i + shift] as? ReferenceInstruction)?.reference?.toString()))
                    if (i !in reads) continue
                    val (type, message) = before[i].namedRegisters()
                    assertEquals(Opcode.INVOKE_STATIC, after[i + shift + 1].opcode)
                    assertEquals(BLOCKED_TYPE, after[i + shift + 1].controlRef())
                    assertEquals("$name: the message and its type", listOf(message, type), after[i + shift + 1].namedRegisters())
                    assertEquals(Opcode.MOVE_RESULT, after[i + shift + 2].opcode)
                    assertEquals(listOf(type), after[i + shift + 2].namedRegisters())
                    assertEquals("$name: Telegram's own skip follows", Opcode.IF_LTZ, after[i + shift + 3].opcode)
                    shift += 2
                }
            }

            val stub = { n: String -> context.mutableClassDefBy(BLOCKED_SENDERS).methods.single { it.name == n }.controlBody().map { it.controlRef() } }
            assertTrue("$MESSAGE_OBJECT->getDialogId()J" in stub("chat"))
            assertTrue("$MESSAGE_OBJECT->getFromChatId()J" in stub("sender"))
            assertTrue(POST in stub("post"))
            assertTrue(BLOCKED_PEERS in stub("blocked"))
            assertTrue("$PEERS->indexOfKey(J)I" in stub("blocked"))
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideBlockedInGroups" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }
}
