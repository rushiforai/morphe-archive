/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.doubletap

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** The real reaction row and long-press menu builder of every declared build. */
class HideReactionsFixtureTest {
    private fun hosts(build: java.io.File): List<ClassDef> =
        FixtureDex.classesWhere(build, { true }) { it.isRowSetter() || it.isMenuBuilder() || it.isSpokenBuilder() }

    private fun operand(i: Instruction) = listOf(i.opcode, i.namedRegisters(), i.controlRef(), (i as? WideLiteralInstruction)?.wideLiteral)

    @Test fun `the row setter gets its message through the hook and keeps every stock instruction`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val plan = context.resolveReactionRows()
            assertEquals("${build.name}: ${plan.missing}", null, plan.missing)
            val stock = classes.flatMap { it.methods }.single { it.isRowSetter() }
            val before = stock.controlBody()
            plan.apply()
            val patched = context.mutableClassDefBy(stock.definingClass).methods.single { it.toString() == stock.toString() }
            val after = patched.controlBody()
            assertEquals("${build.name}: register count", stock.implementation!!.registerCount, patched.implementation!!.registerCount)
            assertEquals(listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST), after.take(3).map { it.opcode })
            assertEquals("$DOUBLE_TAP_REACTIONS->rows(Ljava/lang/Object;ZZ)Ljava/lang/Object;", after[0].controlRef())
            assertEquals(MESSAGE_OBJECT, after[2].controlRef())
            assertEquals(after[1].namedRegisters(), after[2].namedRegisters())
            assertEquals("${build.name}: stock code follows unchanged", before.map(::operand), after.drop(3).map(::operand))
        }
    }

    @Test fun `the menu builder filters its one reactions-available register where both paths merge`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val plan = context.resolveReactionPicker()
            assertEquals("${build.name}: ${plan.missing}", null, plan.missing)
            val stock = classes.flatMap { it.methods }.single { it.isMenuBuilder() }
            val before = stock.controlBody()
            plan.apply()
            val patched = context.mutableClassDefBy(stock.definingClass).methods.single { it.toString() == stock.toString() }
            val after = patched.controlBody()
            val at = after.indexOfFirst { it.controlRef() == "$DOUBLE_TAP_REACTIONS->picker(Z)Z" }
            assertTrue("${build.name}: hook inserted", at > 0)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, after[at].opcode)
            assertEquals(Opcode.MOVE_RESULT, after[at + 1].opcode)
            assertEquals("${build.name}: the hook reads and rewrites one register", after[at].namedRegisters().toSet(), after[at + 1].namedRegisters().toSet())
            assertEquals("${build.name}: stock code unchanged", before.map(::operand), (after.take(at) + after.drop(at + 2)).map(::operand))
            val flow = ControlFlow.of(patched)
            // The 1 path jumps to the hook and the 0 path falls into it.
            assertTrue(after[at - 2].opcode in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32))
            assertEquals(listOf(at), flow.normal[at - 2])
            assertEquals(listOf(at), flow.normal[at - 1])
        }
    }

    @Test fun `TalkBack's reaction text reads the stored reactions through the hook before its one null test`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val plan = context.resolveReactionSpeech()
            assertEquals("${build.name}: ${plan.missing}", null, plan.missing)
            val stock = classes.flatMap { it.methods }.single { it.isSpokenBuilder() }
            val before = stock.controlBody().filter { it.opcode != Opcode.NOP }
            plan.apply()
            val patched = context.mutableClassDefBy(stock.definingClass).methods.single { it.toString() == stock.toString() }
            val after = patched.controlBody().filter { it.opcode != Opcode.NOP }
            assertEquals("${build.name}: register count", stock.implementation!!.registerCount, patched.implementation!!.registerCount)
            val at = after.indexOfFirst { it.controlRef() == "$DOUBLE_TAP_REACTIONS->spoken(Ljava/lang/Object;)Ljava/lang/Object;" }
            assertTrue("${build.name}: hook inserted", at > 0)
            assertEquals("${build.name}: right after the first read", after.indexOfFirst { it.controlRef() == STORED_REACTIONS }, at - 1)
            assertEquals(listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST, Opcode.IF_EQZ),
                after.subList(at, at + 4).map { it.opcode })
            assertEquals("Lorg/telegram/tgnet/TLRPC\$TL_messageReactions;", after[at + 2].controlRef())
            val register = after[at - 1].namedRegisters().first()
            listOf(at, at + 1, at + 2, at + 3).forEach { assertEquals("${build.name}: one register", register, after[it].namedRegisters().first()) }
            assertEquals("${build.name}: stock code unchanged", before.map(::operand), (after.take(at) + after.drop(at + 3)).map(::operand))
            // The null test still skips every reaction string when the hook answers null.
            val body = patched.controlBody()
            val test = body.indexOfFirst { it.controlRef() == after[at].controlRef() } + 3
            assertEquals(Opcode.IF_EQZ, body[test].opcode)
            val skip = ControlFlow.of(patched).normal[test].max()
            assertTrue("${build.name}: skip passes the reaction text", body.indexOfLast { it.controlString() == REACTED_WITH } < skip)
        }
    }
}
