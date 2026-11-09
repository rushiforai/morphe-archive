/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.sendas

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy

/** The message box's Send as updater, Telegram's peer types and the runtime. */
class HideSendAsFixtureTest {
    @Test fun `the extension gets who you'd post as and the decision before the button is built`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, setOf(ENTER_VIEW, PEER, PEER_USER)).values)
            val gate = context.resolveSendAsGate()
            assertNotEquals(gate.peer, gate.shown)
            val old = ImmutableMethod.of(gate.method)
            val before = old.controlBody()
            val oldFlow = ControlFlow.of(old)
            val ways = before.indices.filter { gate.index in oldFlow.normal[it] }
            assertTrue("$name: the decision is reached from both of its answers", ways.size >= 2)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideSendAsPatch.execute(context) })

            val after = gate.method.controlBody()
            assertEquals("$name: two instructions", before.size + 2, after.size)
            assertEquals(Opcode.INVOKE_STATIC, after[gate.index].opcode)
            assertEquals(SHOW_SEND_AS, after[gate.index].controlRef())
            assertEquals(listOf(gate.peer, gate.shown), after[gate.index].namedRegisters())
            assertEquals(Opcode.MOVE_RESULT, after[gate.index + 1].opcode)
            assertEquals(listOf(gate.shown), after[gate.index + 1].namedRegisters())
            // Every way into the decision now passes the extension first.
            val flow = ControlFlow.of(gate.method)
            for (way in ways) assertTrue("$name: $way", gate.index in flow.normal[way])
            for (i in before.indices) {
                val j = if (i < gate.index) i else i + 2
                assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), before[i].controlRef()),
                    listOf(after[j].opcode, after[j].namedRegisters(), after[j].controlRef()))
            }

            val stub = context.tgMutableClassDefBy(SEND_AS).methods.single { it.origName == "isUser" }.controlBody()
            assertEquals(listOf(Opcode.INSTANCE_OF, Opcode.RETURN), stub.map { it.opcode })
            assertEquals(PEER_USER, stub[0].controlRef())
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "hideSendAs" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }
}
