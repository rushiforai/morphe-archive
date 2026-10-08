/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.notifications

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

/** The four mention swaps in NotificationsController, the stubs and the runtime. */
class IgnoreMutedMentionsFixtureTest {
    private val hostTypes = setOf(NOTIFICATIONS, MESSAGE_OBJECT, "Lorg/telegram/messenger/MessagesController;")

    @Test fun `every mention swap asks the extension with the same message`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { m -> m.definingClass in hostTypes }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val sites = context.resolveIgnoreMutedMentions()
            assertEquals("$name: new, loaded twice and shown", listOf("lambda\$processLoadedUnreadMessages", "lambda\$processNewMessages", "showOrUpdateNotification"),
                sites.map { it.first.name.substringBeforeLast('$').substringBefore("(") }.sorted())
            assertEquals("$name: four swaps", 4, sites.sumOf { it.second.size })
            val old = sites.map { ImmutableMethod.of(it.first) }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { ignoreMutedMentionsPatch.execute(context) })

            sites.forEachIndexed { s, (method, indices) ->
                val before = old[s].controlBody()
                val after = method.controlBody()
                assertEquals("$name: replaced in place", before.size, after.size)
                for (i in before.indices) {
                    if (i in indices) {
                        assertEquals(if (before[i].opcode == Opcode.INVOKE_VIRTUAL) Opcode.INVOKE_STATIC else Opcode.INVOKE_STATIC_RANGE, after[i].opcode)
                        assertEquals(NOTIFY_DIALOG, after[i].controlRef())
                        assertEquals("$name: the same message", before[i].namedRegisters(), after[i].namedRegisters())
                        assertEquals(FROM_CHAT, before[i].controlRef())
                        assertEquals(Opcode.MOVE_RESULT_WIDE, after[i + 1].opcode)
                    } else {
                        assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), (before[i] as? ReferenceInstruction)?.reference?.toString()),
                            listOf(after[i].opcode, after[i].namedRegisters(), (after[i] as? ReferenceInstruction)?.reference?.toString()))
                    }
                }
            }
            // One swap is a range call on both builds, so both forms are covered.
            assertTrue("$name: a range swap", old.withIndex().any { (s, m) -> sites[s].second.any { m.controlBody()[it].opcode == Opcode.INVOKE_VIRTUAL_RANGE } })

            val stub = { n: String -> context.mutableClassDefBy(MUTED_MENTIONS).methods.single { it.name == n }.controlBody().map { it.controlRef() } }
            assertTrue(FROM_CHAT in stub("sender"))
            assertTrue("$MESSAGE_OBJECT->getDialogId()J" in stub("chat"))
            assertTrue(DIALOG_MUTED in stub("muted"))
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "ignoreMutedMentions" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }
}
