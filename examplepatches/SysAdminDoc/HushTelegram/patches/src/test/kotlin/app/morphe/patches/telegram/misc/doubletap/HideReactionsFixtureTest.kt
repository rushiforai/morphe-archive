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
import app.morphe.util.names.tgMutableClassDefBy

/** The real reaction row and long-press menu builder of every declared build. */
class HideReactionsFixtureTest {
    private fun hosts(build: java.io.File): List<ClassDef> =
        FixtureDex.classesWhere(build, { true }) { method ->
            method.isRowSetter() || method.isMenuBuilder() || method.isSpokenBuilder() || method.isSelectionSetter() ||
                method.controlBody().any { it.controlString() == EMOJI_PACK_PLURAL }
        }

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
            val patched = context.tgMutableClassDefBy(stock.definingClass).methods.single { it.toString() == stock.toString() }
            val after = patched.controlBody()
            val registers = stock.implementation!!.registerCount
            assertEquals("${build.name}: register count", registers, patched.implementation!!.registerCount)
            // 13.2 dropped the small flag, so its hook moves the message and the tag flag down and passes a clear small flag.
            val lead = if (stock.parameterTypes.size == 4) 0 else 3
            if (lead == 3) {
                assertEquals(listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_FROM16, Opcode.CONST_4), after.take(3).map { it.opcode })
                assertEquals("${build.name}: the message", listOf(0, registers - 3), after[0].namedRegisters())
                assertEquals("${build.name}: the tag flag", listOf(1, registers - 2), after[1].namedRegisters())
                assertEquals("${build.name}: the small flag", 0L, (after[2] as WideLiteralInstruction).wideLiteral)
                assertEquals("${build.name}: message, small, tag", listOf(0, 2, 1), after[3].namedRegisters())
            } else {
                assertEquals(Opcode.INVOKE_STATIC_RANGE, after[0].opcode)
            }
            assertEquals(listOf(Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST), after.drop(lead + 1).take(2).map { it.opcode })
            assertEquals("$DOUBLE_TAP_REACTIONS->rows(Ljava/lang/Object;ZZ)Ljava/lang/Object;", after[lead].controlRef())
            assertEquals(MESSAGE_OBJECT, after[lead + 2].controlRef())
            assertEquals("${build.name}: the message comes back in its own register", listOf(registers - stock.parameterTypes.size), after[lead + 1].namedRegisters())
            assertEquals(after[lead + 1].namedRegisters(), after[lead + 2].namedRegisters())
            assertEquals("${build.name}: stock code follows unchanged", before.map(::operand), after.drop(lead + 3).map(::operand))
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
            val patched = context.tgMutableClassDefBy(stock.definingClass).methods.single { it.toString() == stock.toString() }
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
            val patched = context.tgMutableClassDefBy(stock.definingClass).methods.single { it.toString() == stock.toString() }
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

    @Test fun `the selection bubble's one setter gets its list through the hook`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val plan = context.resolveReactionSelection()
            assertEquals("${build.name}: ${plan.missing}", null, plan.missing)
            val stock = classes.flatMap { it.methods }.single { it.isSelectionSetter() }
            val before = stock.controlBody()
            plan.apply()
            val patched = context.tgMutableClassDefBy(stock.definingClass).methods.single { it.toString() == stock.toString() }
            val after = patched.controlBody()
            assertEquals("${build.name}: register count", stock.implementation!!.registerCount, patched.implementation!!.registerCount)
            assertEquals(listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT_OBJECT), after.take(2).map { it.opcode })
            assertEquals("$DOUBLE_TAP_REACTIONS->selection(Ljava/util/List;)Ljava/util/List;", after[0].controlRef())
            assertEquals("${build.name}: the hook reads and rewrites p1", after[0].namedRegisters().toSet(), after[1].namedRegisters().toSet())
            assertEquals("${build.name}: stock code unchanged", before.map(::operand), after.drop(2).map(::operand))
        }
    }

    @Test fun `the emoji pack line's premium test goes through the hook, whichever hook lands first`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val picker = context.resolveReactionPicker()
            val plan = context.resolveEmojiPackNote()
            assertEquals("${build.name}: ${plan.missing}", null, plan.missing)
            val stock = classes.flatMap { it.methods }.single { it.isMenuBuilder() }
            val stockBody = stock.controlBody()
            val stockAt = stockBody.indexOfLast { it.controlRef() == PREMIUM_BLOCKED }
            picker.apply()
            plan.apply()
            val patched = context.tgMutableClassDefBy(stock.definingClass).methods.single { it.toString() == stock.toString() }
            val after = patched.controlBody()
            assertEquals("${build.name}: register count", stock.implementation!!.registerCount, patched.implementation!!.registerCount)
            val at = after.indexOfFirst { it.controlRef() == "$DOUBLE_TAP_REACTIONS->packNote(I)Z" }
            assertTrue("${build.name}: hook inserted", at > 0)
            assertEquals("${build.name}: right after the premium test's result", PREMIUM_BLOCKED, after[at - 2].controlRef())
            assertEquals(Opcode.MOVE_RESULT, after[at - 1].opcode)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, after[at].opcode)
            assertEquals(Opcode.MOVE_RESULT, after[at + 1].opcode)
            assertEquals(Opcode.IF_NEZ, after[at + 2].opcode)
            val register = after[at - 1].namedRegisters().first()
            listOf(at, at + 1, at + 2).forEach { assertEquals("${build.name}: one register", register, after[it].namedRegisters().first()) }
            assertEquals("${build.name}: stock's last premium test is the line's", stockBody[stockAt + 2].opcode, after[at + 2].opcode)
            val skip = ControlFlow.of(patched).normal[at + 2].max()
            val button = classes.flatMap { it.methods }.first { m -> m.controlBody().any { it.controlString() == EMOJI_PACK_PLURAL } }.definingClass
            val made = after.indexOfFirst { it.opcode == Opcode.NEW_INSTANCE && it.controlRef() == button }
            assertTrue("${build.name}: the skip passes the line", at + 2 < made && made < skip)
        }
    }
}
