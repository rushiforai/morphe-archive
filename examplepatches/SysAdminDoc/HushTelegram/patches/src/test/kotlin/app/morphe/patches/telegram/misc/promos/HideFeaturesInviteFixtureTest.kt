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
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
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
    private val walletGate = "$COMMERCE->showWalletRow(Z)Z"

    @Test fun `the Features row and the Contacts invite rows go through the extension, beside the commerce rows`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val anchors = FixtureDex.classesWhere(build, { true }) { m ->
                m.controlBody().any { it.controlRef() == FEATURES_LABEL || it.controlRef() == INVITE_ICON }
            }
            val bases = FixtureDex.classes(build, anchors.mapNotNull { it.superclass }.toSet()).values
            // Settings' list view and its adapter, both reached from Settings' onResume.
            val listTypes = anchors.flatMap { it.methods }.filter { it.name == "onResume" }.flatMap { it.controlBody() }
                .mapNotNull { it.controlField() }.flatMap { listOf(it.definingClass, it.type) }.filter { it.startsWith("L") }.toSet()
            val hosts = (anchors + bases + FixtureDex.classes(build, listTypes).values).distinctBy { it.type }
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

                // Hide commerce asks before the Wallet row's availability check (two instructions per
                // gate); everything else either patch does is a replacement in place.
                fun gates(body: List<Instruction>) = body.indices.filter { body[it].controlRef() == walletGate }.flatMap { listOf(it, it + 1) }
                fun withoutGates(body: List<Instruction>) = gates(body).toSet().let { drop -> body.filterIndexed { i, _ -> i !in drop } }
                assertEquals("$name: both Wallet gates", 4, gates(site.settings.controlBody()).size)
                val append = site.append - gates(old[0].controlBody()).count { it < site.append }
                val settingsBefore = withoutGates(old[0].controlBody())
                // The one added instruction: the builder hands its Settings screen over before anything else.
                val shown = site.settings.controlBody().first()
                assertEquals("$name: Settings shown first", LIST_SHOWN, shown.controlRef())
                assertEquals(Opcode.INVOKE_STATIC_RANGE, shown.opcode)
                assertEquals(listOf(site.settings.parameterRegisterNumber(0)), shown.namedRegisters())
                assertEquals("$name: listShown once", 1, site.settings.controlBody().count { it.controlRef() == LIST_SHOWN })
                val settingsAfter = withoutGates(site.settings.controlBody()).drop(1)
                assertEquals("$name: replaced in place", settingsBefore.size, settingsAfter.size)
                assertEquals(APPEND, settingsBefore[append].controlRef())
                assertEquals(Opcode.INVOKE_STATIC, settingsAfter[append].opcode)
                assertEquals(ADD_FEATURES, settingsAfter[append].controlRef())
                assertEquals("$name: the list and the row", settingsBefore[append].namedRegisters(), settingsAfter[append].namedRegisters())
                assertEquals("$name: the five commerce rows stay commerce's", 5, settingsAfter.count { it.controlRef() == commerceRow })
                for (i in settingsBefore.indices) {
                    if (i == append || settingsAfter[i].controlRef() == commerceRow) continue
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
                val rebuild = context.mutableClassDefBy(FEATURES_INVITE).methods.single { it.name == "rebuildList" }.controlBody()
                assertTrue("$name: only Settings", rebuild.first().opcode == Opcode.INSTANCE_OF && rebuild.first().controlRef() == site.settingsType)
                assertEquals("$name: list view, then its adapter", listOf(site.listField, site.adapterField),
                    rebuild.filter { it.opcode == Opcode.IGET_OBJECT }.map { it.controlRef() })
                assertTrue(site.listField.startsWith("${site.settingsType}->"))
                assertEquals("$name: the adapter's update, asked to animate", listOf(site.update),
                    rebuild.filter { it.opcode == Opcode.INVOKE_VIRTUAL }.map { it.controlRef() })
                assertTrue("$name: an update Settings itself makes", hosts.single { it.type == site.settingsType }.methods
                    .any { m -> m.controlBody().any { it.opcode == Opcode.INVOKE_VIRTUAL && it.controlRef() == site.update } })
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
