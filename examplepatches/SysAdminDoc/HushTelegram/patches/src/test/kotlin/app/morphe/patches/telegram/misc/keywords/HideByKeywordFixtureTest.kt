/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.keywords

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.blocked.BLOCKED_TYPE
import app.morphe.patches.telegram.misc.blocked.MESSAGE_OBJECT
import app.morphe.patches.telegram.misc.blocked.MIGRATE_TO
import app.morphe.patches.telegram.misc.blocked.PEERS
import app.morphe.patches.telegram.misc.blocked.POST
import app.morphe.patches.telegram.misc.blocked.TL_MESSAGE
import app.morphe.patches.telegram.misc.blocked.hideBlockedInGroupsPatch
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.notifications.NOTIFICATIONS
import app.morphe.patches.telegram.misc.notifications.runsNotificationsLambda
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy

/** The open chat's three type tests, shared with Hide blocked users, the stubs and the runtime. */
class HideByKeywordFixtureTest {
    private val hostTypes = setOf(MESSAGE_OBJECT, "Lorg/telegram/messenger/MessagesController;", PEERS, TL_MESSAGE, NOTIFICATIONS)

    @Test fun `the filters answer each type test before the open chat skips a message`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val sites = context.resolveHideByKeyword()
            assertEquals("$name: one load test, two new-message tests", listOf(1, 2), sites.map { it.second.size }.sorted())
            val old = sites.map { ImmutableMethod.of(it.first) }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideByKeywordPatch.execute(context) })

            sites.forEachIndexed { s, (method, reads) ->
                val before = old[s].controlBody()
                val after = method.controlBody()
                assertEquals("$name: two instructions a test", before.size + 2 * reads.size, after.size)
                var shift = 0
                for (i in before.indices) {
                    assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), before[i].controlRef()),
                        listOf(after[i + shift].opcode, after[i + shift].namedRegisters(), after[i + shift].controlRef()))
                    if (i !in reads) continue
                    val (type, message) = before[i].namedRegisters()
                    assertEquals(FILTER_TYPE, after[i + shift + 1].controlRef())
                    assertEquals("$name: the message and its type", listOf(message, type), after[i + shift + 1].namedRegisters())
                    assertEquals(Opcode.MOVE_RESULT, after[i + shift + 2].opcode)
                    assertEquals(listOf(type), after[i + shift + 2].namedRegisters())
                    assertEquals("$name: Telegram's own skip follows", Opcode.IF_LTZ, after[i + shift + 3].opcode)
                    shift += 2
                }
            }

            val stub = { n: String -> context.tgMutableClassDefBy(MESSAGE_FILTERS).methods.single { it.origName == n }.controlBody().map { it.controlRef() } }
            assertTrue("$MESSAGE_OBJECT->getDialogId()J" in stub("chat"))
            assertTrue("$MESSAGE_OBJECT->isOut()Z" in stub("out"))
            assertTrue(POST in stub("post"))
            assertTrue(TEXT in stub("text"))
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "hideByKeyword" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `Hide blocked users and the filters both answer every test in either order`() {
        for (build in Fixtures.declaredBuilds()) {
            for (blockedFirst in listOf(true, false)) {
                val name = "${build.name} blocked first=$blockedFirst"
                val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
                val sites = context.resolveHideByKeyword()
                val first = if (blockedFirst) hideBlockedInGroupsPatch else hideByKeywordPatch
                val second = if (blockedFirst) hideByKeywordPatch else hideBlockedInGroupsPatch
                assertEquals(emptyList<String>(), PatchLogCapture.warnings { first.execute(context) })
                assertEquals("$name: the second patch finds the tests past the first's hook", emptyList<String>(),
                    PatchLogCapture.warnings { second.execute(context) })

                var tests = 0
                for ((method, _) in sites) {
                    val body = method.controlBody()
                    for (at in body.indices) {
                        if (body[at].opcode != Opcode.IGET || body[at].controlRef() != "$MESSAGE_OBJECT->type:I") continue
                        if (body.getOrNull(at + 1)?.controlRef() !in setOf(FILTER_TYPE, BLOCKED_TYPE)) continue
                        tests++
                        // The second patch's hook sits right after the read, so it answers first.
                        assertEquals(name, if (blockedFirst) listOf(FILTER_TYPE, BLOCKED_TYPE) else listOf(BLOCKED_TYPE, FILTER_TYPE),
                            listOf(body[at + 1].controlRef(), body[at + 3].controlRef()))
                        assertEquals("$name: Telegram's own skip follows both", Opcode.IF_LTZ, body[at + 5].opcode)
                    }
                }
                assertEquals("$name: three tests, each with both hooks", 3, tests)
            }
        }
    }

    /** MessageObject, the controller, the blocked list, a message's own fields and the chat screen. */
    private fun hosts(build: File) = FixtureDex.classesWhere(build, { true }) { m ->
        m.origDefiningClass in hostTypes || m.runsNotificationsLambda() || m.controlBody().any { it.opcode == Opcode.INSTANCE_OF && it.controlRef() == MIGRATE_TO }
    }.map(ImmutableClassDef::of)
}
