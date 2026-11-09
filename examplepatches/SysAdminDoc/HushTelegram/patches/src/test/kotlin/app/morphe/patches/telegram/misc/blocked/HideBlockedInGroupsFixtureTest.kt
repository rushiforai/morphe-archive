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
import app.morphe.patches.telegram.misc.notifications.NOTIFICATIONS
import app.morphe.patches.telegram.misc.notifications.runsNotificationsLambda
import app.morphe.patches.telegram.misc.notifications.runsUnder
import app.morphe.util.branchTarget
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import app.morphe.util.names.origRef
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origDescriptor
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy

/** The open chat's three type tests, the new-message notification skip, the reply header check, the stubs and the runtime. */
class HideBlockedInGroupsFixtureTest {
    private val hostTypes = setOf(MESSAGE_OBJECT, "Lorg/telegram/messenger/MessagesController;", PEERS, "Lorg/telegram/tgnet/TLRPC\$Message;", NOTIFICATIONS)

    @Test fun `the extension answers each type test before the open chat skips a message`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { m ->
                m.origDefiningClass in hostTypes || m.runsNotificationsLambda() || m.controlBody().any { it.opcode == Opcode.INSTANCE_OF && it.controlRef() == MIGRATE_TO }
            }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val sites = context.resolveHideBlockedInGroups()
            assertEquals("$name: a page load and a new-message method", 2, sites.size)
            assertEquals("$name: one load test, two new-message tests", listOf(1, 2), sites.map { it.second.size }.sorted())
            assertEquals("$name: one chat screen", 1, sites.map { it.first.definingClass }.distinct().size)
            val old = sites.map { ImmutableMethod.of(it.first) }
            val (notify, answer) = context.resolveBlockedNotificationSkip()
            assertTrue("$name: the new-message loop", context.runsUnder(context.tgMutableClassDefBy(NOTIFICATIONS))(notify).any { it.contains("processNewMessages") })
            val oldNotify = ImmutableMethod.of(notify).controlBody()
            assertEquals(Opcode.MOVE_RESULT, oldNotify[answer].opcode)
            assertEquals(IMPORTED_FORWARD, oldNotify[answer - 1].controlRef())
            val (reply, yes) = context.resolveBlockedReplyQuote()
            assertEquals("$name: the message's own reply check", listOf(MESSAGE_OBJECT, VALID_REPLY),
                listOf(reply.origDefiningClass, "${reply.origName}${reply.origDescriptor}"))
            val oldReply = ImmutableMethod.of(reply).controlBody()
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideBlockedInGroupsPatch.execute(context) })

            val newReply = reply.controlBody()
            assertEquals("$name: five instructions before the reply header's yes", oldReply.size + 5, newReply.size)
            val (said) = oldReply[yes].namedRegisters()
            val self = reply.implementation!!.registerCount - 1
            assertEquals("$name: the reply goes to the extension", listOf(Opcode.INVOKE_STATIC, HIDE_REPLY, listOf(self)),
                listOf(newReply[yes].opcode, newReply[yes].controlRef(), newReply[yes].namedRegisters()))
            assertEquals(listOf(Opcode.MOVE_RESULT, listOf(said)), listOf(newReply[yes + 1].opcode, newReply[yes + 1].namedRegisters()))
            assertEquals(listOf(Opcode.IF_EQZ, listOf(said)), listOf(newReply[yes + 2].opcode, newReply[yes + 2].namedRegisters()))
            assertEquals("$name: a no from the extension goes on to Telegram's yes", yes + 5, newReply.branchTarget(yes + 2) { error(it) })
            assertEquals("$name: a yes answers no header", listOf(Opcode.CONST_4, listOf(said), 0),
                listOf(newReply[yes + 3].opcode, newReply[yes + 3].namedRegisters(), (newReply[yes + 3] as NarrowLiteralInstruction).narrowLiteral))
            assertEquals(listOf(Opcode.RETURN, listOf(said)), listOf(newReply[yes + 4].opcode, newReply[yes + 4].namedRegisters()))
            for (i in oldReply.indices) {
                val j = if (i < yes) i else i + 5
                assertEquals("$name: stock reply check $i", listOf(oldReply[i].opcode, oldReply[i].namedRegisters(), oldReply[i].controlRef()),
                    listOf(newReply[j].opcode, newReply[j].namedRegisters(), newReply[j].controlRef()))
            }

            val newNotify = notify.controlBody()
            assertEquals("$name: two instructions in the notification loop", oldNotify.size + 2, newNotify.size)
            val (message) = oldNotify[answer - 1].namedRegisters()
            val (skip) = oldNotify[answer].namedRegisters()
            assertEquals(SKIP_NOTIFICATION, newNotify[answer + 1].controlRef())
            assertEquals("$name: the message and Telegram's answer", listOf(message, skip), newNotify[answer + 1].namedRegisters())
            assertEquals(Opcode.MOVE_RESULT, newNotify[answer + 2].opcode)
            assertEquals(listOf(skip), newNotify[answer + 2].namedRegisters())
            assertEquals("$name: Telegram's own skip follows", listOf(Opcode.IF_NEZ, listOf(skip)),
                listOf(newNotify[answer + 3].opcode, newNotify[answer + 3].namedRegisters()))
            for (i in oldNotify.indices) {
                val j = if (i <= answer) i else i + 2
                assertEquals("$name: stock notification $i", listOf(oldNotify[i].opcode, oldNotify[i].controlRef()),
                    listOf(newNotify[j].opcode, newNotify[j].controlRef()))
            }

            sites.forEachIndexed { s, (method, reads) ->
                val before = old[s].controlBody()
                val after = method.controlBody()
                assertEquals("$name: two instructions a test", before.size + 2 * reads.size, after.size)
                var shift = 0
                for (i in before.indices) {
                    assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), before[i].origRef()),
                        listOf(after[i + shift].opcode, after[i + shift].namedRegisters(), after[i + shift].origRef()))
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

            val stub = { n: String -> context.tgMutableClassDefBy(BLOCKED_SENDERS).methods.single { it.origName == n }.controlBody().map { it.controlRef() } }
            assertTrue("$MESSAGE_OBJECT->getDialogId()J" in stub("chat"))
            assertTrue("$MESSAGE_OBJECT->getFromChatId()J" in stub("sender"))
            assertTrue(POST in stub("post"))
            assertTrue(REPLY_MESSAGE in stub("quoted"))
            assertTrue(BLOCKED_PEERS in stub("blocked"))
            assertTrue("$PEERS->indexOfKey(J)I" in stub("blocked"))
            assertEquals("$name: the next page only when the list isn't complete or loading", listOf(BLOCKED_END, BLOCKED_LOADING, BLOCKED_PAGE),
                stub("loadMoreBlocked").filter { it in setOf(BLOCKED_END, BLOCKED_LOADING, BLOCKED_PAGE) })
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "hideBlockedInGroups" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }
}
