/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import org.junit.Assert.assertEquals
import org.junit.Test

/** The chat text selection's real canCopy check in every declared build. */
class CopySelectionFixtureTest {
    private fun operand(i: Instruction) = listOf(i.opcode, i.namedRegisters(), i.controlRef(), (i as? WideLiteralInstruction)?.wideLiteral)

    @Test fun `there is exactly one copy check and it asks the extension first then runs unchanged`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classesWhere(build, { true }) { it.isSelectionCanCopy() }
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val plan = context.resolveSelectionCopy()
            assertEquals("${build.name}: ${plan.missing}", null, plan.missing)
            val stock = classes.flatMap { it.methods }.single { it.isSelectionCanCopy() }
            val before = stock.controlBody()
            plan.apply()
            val patched = context.mutableClassDefBy(stock.definingClass).methods.single { it.toString() == stock.toString() }
            val after = patched.controlBody()
            assertEquals(Opcode.INVOKE_STATIC, after[0].opcode)
            assertEquals(SELECTION_COPY, after[0].controlRef())
            assertEquals(Opcode.MOVE_RESULT, after[1].opcode)
            assertEquals(Opcode.IF_EQZ, after[2].opcode)
            assertEquals(Opcode.CONST_4, after[3].opcode)
            assertEquals(Opcode.RETURN, after[4].opcode)
            assertEquals("${build.name}: stock code follows unchanged", before.map(::operand), after.drop(5).map(::operand))
        }
    }
}
