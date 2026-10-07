/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

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
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Test

/** The chat list's folder tab counter and the runtime. */
class HideFolderCountersFixtureTest {
    @Test fun `the extension answers first and a no counts the way Telegram does`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { m ->
                m.returnType == "I" && m.controlBody().map { it.controlRef() }.let { MAIN_UNREAD in it && FILTER_UNREAD in it }
            }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val counter = context.resolveHideFolderCounters()
            val old = ImmutableMethod.of(counter)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hideFolderCountersPatch.execute(context) })

            val before = old.controlBody()
            val after = counter.controlBody()
            assertEquals("$name: five instructions", before.size + 5, after.size)
            assertEquals("$FOLDER_TABS->countersHidden()Z", after[0].controlRef())
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN), after.take(5).map { it.opcode })
            assertEquals(listOf(0), after[1].namedRegisters())
            assertEquals("$name: a no runs the stock count", listOf(3, 5), ControlFlow.of(counter).normal[2].sorted())
            for (i in before.indices) {
                assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), (before[i] as? ReferenceInstruction)?.reference?.toString()),
                    listOf(after[i + 5].opcode, after[i + 5].namedRegisters(), (after[i + 5] as? ReferenceInstruction)?.reference?.toString()))
            }
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideFolderCounters" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }
}
