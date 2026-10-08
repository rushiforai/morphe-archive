/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.promos

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.commerce.COMMERCE
import app.morphe.patches.telegram.misc.commerce.hideCommercePatch
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** Settings' Features append, the sectioned list's count and row lookups, the stub and the runtime. */
class HideFeaturesInviteFixtureTest {
    private val commerceRow = "$COMMERCE->addSettingsRow(Ljava/util/ArrayList;Ljava/lang/Object;)Z"

    @Test fun `the Features row and the Contacts invite rows go through the extension, beside the commerce rows`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val anchors = FixtureDex.classesWhere(build, { true }) { m ->
                m.controlBody().any { it.controlRef() == FEATURES_LABEL || it.controlRef() == INVITE_ICON }
            }
            val bases = FixtureDex.classes(build, anchors.mapNotNull { it.superclass }.toSet()).values
            val hosts = (anchors + bases).distinctBy { it.type }
            // Either patch may run first; they never touch the same instruction.
            for (commerceFirst in listOf(false, true)) {
                val context = PatchContexts.of(ExtensionDex.classes() + hosts)
                if (commerceFirst) PatchLogCapture.warnings { hideCommercePatch.execute(context) }
                val site = context.resolveFeaturesInvite()
                assertEquals("$name: the Contacts list extends the sectioned list", site.counter.definingClass,
                    hosts.single { it.type == site.adapter }.superclass)
                assertNotEquals(site.phonebook, site.inviteList)
                val old = listOf(site.settings, site.counter, site.rows).map { ImmutableMethod.of(it) }
                assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideFeaturesInvitePatch.execute(context) })
                if (!commerceFirst) PatchLogCapture.warnings { hideCommercePatch.execute(context) }

                val settingsBefore = old[0].controlBody()
                val settingsAfter = site.settings.controlBody()
                assertEquals("$name: replaced in place", settingsBefore.size, settingsAfter.size)
                assertEquals(APPEND, settingsBefore[site.append].controlRef())
                assertEquals(Opcode.INVOKE_STATIC, settingsAfter[site.append].opcode)
                assertEquals(ADD_FEATURES, settingsAfter[site.append].controlRef())
                assertEquals("$name: the list and the row", settingsBefore[site.append].namedRegisters(), settingsAfter[site.append].namedRegisters())
                assertEquals("$name: the five commerce rows stay commerce's", 5, settingsAfter.count { it.controlRef() == commerceRow })
                for (i in settingsBefore.indices) {
                    if (i == site.append || settingsAfter[i].controlRef() == commerceRow) continue
                    assertEquals("$name: Settings stock $i", facts(settingsBefore[i]), facts(settingsAfter[i]))
                }

                assertInserted("$name: count", old[1], site.counter, site.counted, SECTION_COUNT) { body ->
                    body[site.counted - 1].namedRegisters() + body[site.counted].namedRegisters()
                }
                assertInserted("$name: row", old[2], site.rows, site.row, SECTION_ROW) { body ->
                    body.single { it.controlRef() == "${site.counter.definingClass}->${site.counter.name}(I)I" }.namedRegisters() +
                        body[site.row].namedRegisters().first()
                }

                val stub = context.mutableClassDefBy(FEATURES_INVITE).methods.single { it.name == "inviteLayout" }.controlBody()
                assertTrue("$name: only the Contacts list", stub.first().opcode == Opcode.INSTANCE_OF && stub.first().controlRef() == site.adapter)
                for (field in listOf(site.phonebook, site.onlyUsers, site.inviteList)) {
                    assertTrue("$name: reads $field", stub.any { it.controlRef() == field })
                    assertTrue(field.startsWith("${site.adapter}->"))
                }
                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideFeaturesAndInvite" }.controlBody()
                assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
            }
        }
    }

    /** Two instructions after [at]: the extension call on [registers] and its answer back in the last one. */
    private fun assertInserted(what: String, old: Method, now: Method, at: Int, hook: String, registers: (List<Instruction>) -> List<Int>) {
        val before = old.controlBody()
        val after = now.controlBody()
        assertEquals("$what: two instructions", before.size + 2, after.size)
        val operands = registers(before)
        assertEquals(Opcode.INVOKE_STATIC, after[at + 1].opcode)
        assertEquals(hook, after[at + 1].controlRef())
        assertEquals("$what: the list, its section and Telegram's answer", operands, after[at + 1].namedRegisters())
        assertEquals(Opcode.MOVE_RESULT, after[at + 2].opcode)
        assertEquals(listOf(operands.last()), after[at + 2].namedRegisters())
        for (i in before.indices) {
            assertEquals("$what: stock $i", facts(before[i]), facts(after[if (i > at) i + 2 else i]))
        }
    }

    private fun facts(i: Instruction) = listOf(i.opcode, i.namedRegisters(), (i as? ReferenceInstruction)?.reference?.toString())
}
