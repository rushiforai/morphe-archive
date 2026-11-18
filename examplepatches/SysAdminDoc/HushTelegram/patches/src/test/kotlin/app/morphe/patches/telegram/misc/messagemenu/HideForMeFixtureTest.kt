/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.blocked.BLOCKED_TYPE
import app.morphe.patches.telegram.misc.blocked.MESSAGE_OBJECT
import app.morphe.patches.telegram.misc.blocked.MIGRATE_TO
import app.morphe.patches.telegram.misc.blocked.PEERS
import app.morphe.patches.telegram.misc.blocked.TL_MESSAGE
import app.morphe.patches.telegram.misc.blocked.hideBlockedInGroupsPatch
import app.morphe.patches.telegram.misc.blocked.resolveOpenChatTypeReads
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.keywords.FILTER_TYPE
import app.morphe.patches.telegram.misc.keywords.hideByKeywordPatch
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.notifications.NOTIFICATIONS
import app.morphe.patches.telegram.misc.notifications.runsNotificationsLambda
import app.morphe.util.namedRegisters
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

private const val NOTIFICATION_CENTER = "Lorg/telegram/messenger/NotificationCenter;"

/** Hide for me: its hook at the open chat's three type tests, beside the other two patches' hooks, and the stubs that reach Telegram. */
class HideForMeFixtureTest {
    @Test fun `the hidden list answers each type test and the stubs reach Telegram's own`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + MessageMenuFixtureTest().hosts(build))
            assertEquals("$name: ${context.resolveHideForMe().missing}", null, context.resolveHideForMe().missing)
            val sites = context.resolveOpenChatTypeReads()
            assertEquals("$name: one load test, two new-message tests", listOf(1, 2), sites.map { it.second.size }.sorted())
            val old = sites.map { ImmutableMethod.of(it.first) }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageMenuPatch.execute(context) })

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
                    assertEquals(Opcode.INVOKE_STATIC, after[i + shift + 1].opcode)
                    assertEquals(HIDDEN_TYPE, after[i + shift + 1].controlRef())
                    assertEquals("$name: the message and its type", listOf(message, type), after[i + shift + 1].namedRegisters())
                    assertEquals(Opcode.MOVE_RESULT, after[i + shift + 2].opcode)
                    assertEquals(listOf(type), after[i + shift + 2].namedRegisters())
                    assertEquals("$name: Telegram's own skip follows", Opcode.IF_LTZ, after[i + shift + 3].opcode)
                    shift += 2
                }
            }

            val stub = { n: String -> context.tgMutableClassDefBy(HIDDEN_MESSAGES).methods.single { it.origName == n }.controlBody().mapNotNull { it.controlRef() } }
            assertEquals("$name: scheduled, then a quick reply", listOf("$MESSAGE_OBJECT->scheduled:Z", "$MESSAGE_OBJECT->isQuickReply()Z"),
                stub("apart").filter { it.startsWith("$MESSAGE_OBJECT->") })
            assertTrue("$MESSAGE_OBJECT->isLiveLocation()Z" in stub("live"))
            assertEquals("$name: the chat's own deleted notice", listOf("$NOTIFICATION_CENTER->getInstance(I)$NOTIFICATION_CENTER",
                "$MESSAGE_OBJECT->getChannelId($TL_MESSAGE)J", "$NOTIFICATION_CENTER->messagesDeleted:I",
                "$NOTIFICATION_CENTER->postNotificationName(I[Ljava/lang/Object;)V"),
                stub("vanish").filter { it.startsWith(NOTIFICATION_CENTER) || it.startsWith("$MESSAGE_OBJECT->get") })
            assertEquals("Lorg/telegram/messenger/R\$drawable;->msg_archive_hide:I", stub("icon").first())
            for (flag in listOf("hideForMe", "messageMenuRepeat")) {
                val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.controlBody()
                assertEquals("$name: $flag", 1L, (status.first() as WideLiteralInstruction).wideLiteral)
            }
        }
    }

    @Test fun `Hide for me, Hide blocked users and the filters all answer every test in any order`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = stackHosts(build)
            for (menuFirst in listOf(true, false)) {
                val name = "${build.name} menu first=$menuFirst"
                val context = PatchContexts.of(ExtensionDex.classes() + hosts)
                val sites = context.resolveOpenChatTypeReads()
                val others = listOf(hideBlockedInGroupsPatch, hideByKeywordPatch)
                for (patch in if (menuFirst) listOf(messageMenuPatch) + others else others + messageMenuPatch) {
                    assertEquals("$name: ${patch.name} finds the tests past the others' hooks", emptyList<String>(),
                        PatchLogCapture.warnings { patch.execute(context) })
                }

                val hooks = setOf(HIDDEN_TYPE, BLOCKED_TYPE, FILTER_TYPE)
                var tests = 0
                for ((method, _) in sites) {
                    val body = method.controlBody()
                    for (at in body.indices) {
                        if (body[at].opcode != Opcode.IGET || body[at].controlRef() != "$MESSAGE_OBJECT->type:I") continue
                        if (body.getOrNull(at + 1)?.controlRef() !in hooks) continue
                        tests++
                        assertEquals(name, hooks, setOf(body[at + 1].controlRef(), body[at + 3].controlRef(), body[at + 5].controlRef()))
                        assertEquals("$name: the last patch's hook answers first", if (menuFirst) FILTER_TYPE else HIDDEN_TYPE, body[at + 1].controlRef())
                        assertEquals("$name: Telegram's own skip follows all three", Opcode.IF_LTZ, body[at + 7].opcode)
                    }
                }
                assertEquals("$name: three tests, each with all three hooks", 3, tests)
            }
        }
    }

    @Test fun `a build missing the deleted notice leaves Hide for me out and the menu goes on`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            // The menu's own tools post through the notice center, so only the one notice goes.
            val hosts = MessageMenuFixtureTest().hosts(build)
            val center = PatchContexts.of(ExtensionDex.classes() + hosts).tgMutableClassDefBy(NOTIFICATION_CENTER)
            val notice = center.fields.single { it.origName == "messagesDeleted" }.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts.map { if (it.type == center.type) withoutField(it, notice) else it })
            assertTrue("$name: ${context.resolveHideForMe().missing}", context.resolveHideForMe().missing != null)
            val warnings = PatchLogCapture.warnings { messageMenuPatch.execute(context) }
            assertEquals("$name: $warnings", 1, warnings.size)
            assertTrue(warnings.single(), "goes on without Hide for me" in warnings.single())
            for ((method, _) in context.resolveOpenChatTypeReads()) {
                assertTrue("$name: no hook in the chat", method.controlBody().none { it.controlRef() == HIDDEN_TYPE })
            }
            val flag = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "hideForMe" }.controlBody()
            assertTrue("$name: the build flag stays off", (flag.first() as? WideLiteralInstruction)?.wideLiteral != 1L)
            val menu = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "messageMenuRepeat" }.controlBody()
            assertEquals(1L, (menu.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    /** [owner] without its field [name], still read through its build's name table. */
    private fun withoutField(owner: ClassDef, name: String): ClassDef {
        val copy = ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
            owner.annotations, owner.fields.filter { it.name != name }, owner.methods)
        return if (owner is FixtureDex.FixtureClassDef) FixtureDex.FixtureClassDef(owner.versionCode, copy) else copy
    }

    /** The menu's classes plus what Hide blocked users reads beyond them: the blocked list and the notification loop. */
    private fun stackHosts(build: File): List<ClassDef> {
        val menu = MessageMenuFixtureTest().hosts(build)
        val blocked = setOf(MESSAGE_OBJECT, "Lorg/telegram/messenger/MessagesController;", PEERS, TL_MESSAGE, NOTIFICATIONS)
        val more = FixtureDex.classesWhere(build, { true }) { m ->
            m.origDefiningClass in blocked || m.runsNotificationsLambda() || m.controlBody().any { it.opcode == Opcode.INSTANCE_OF && it.controlRef() == MIGRATE_TO }
        }.map(ImmutableClassDef::of)
        return (menu + more).distinctBy { it.type }
    }
}

/** What Hide for me needs beside the menu's own classes: Telegram's notice center and the chat screen holding the type tests. */
internal fun hideForMeHosts(build: File, base: List<ClassDef>): List<ClassDef> {
    val found = FixtureDex.classes(build, setOf(NOTIFICATION_CENTER)).values + FixtureDex.classesWhere(build, { true }) { m ->
        m.controlBody().any { it.opcode == Opcode.INSTANCE_OF && it.controlRef() == MIGRATE_TO }
    }
    return found.filter { cls -> base.none { it.type == cls.type } }.distinctBy { it.type }.map(ImmutableClassDef::of)
}
