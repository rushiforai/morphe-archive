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
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.tgMutableClassDefBy

/** The real reaction row and long-press menu builder of every declared build. */
class HideReactionsFixtureTest {
    private fun hosts(build: java.io.File): List<ClassDef> =
        FixtureDex.classesWhere(build, { true }) { method ->
            method.isRowSetter() || method.isMenuBuilder() || method.isSpokenBuilder() || method.isSelectionSetter() ||
                method.controlBody().any { it.controlString() == EMOJI_PACK_PLURAL }
        }

    // An insert can push a branch past a plain goto's reach, and dexlib2 widens it.
    private fun kind(i: Instruction) = if (i.opcode == Opcode.GOTO_16 || i.opcode == Opcode.GOTO_32) Opcode.GOTO else i.opcode

    private fun operand(i: Instruction) = listOf(kind(i), i.namedRegisters(), i.controlRef(), (i as? WideLiteralInstruction)?.wideLiteral)

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

    @Test fun `the row hands its unread flag to the hook at every return, and the reaction effect asks first`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = (hosts(build) + FixtureDex.classes(build, setOf(MESSAGE_OBJECT)).values).distinctBy { it.type }
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val rows = context.resolveReactionRows()
            val unread = context.resolveHiddenRowUnread()
            val effect = context.resolveReactionEffect()
            listOf(rows, unread, effect).forEach { assertEquals("${build.name}: ${it.missing}", null, it.missing) }
            val stock = classes.flatMap { it.methods }.single { it.isRowSetter() }
            val before = stock.controlBody()
            val flag = stock.unreadFlag()!!
            val field = "${flag.definingClass}->${flag.name}:Z"
            // Telegram's own flag: cleared before the message is read, then set from a recent reaction's unread bit.
            val firstWrite = before.indexOfFirst { it.opcode == Opcode.IPUT_BOOLEAN && it.controlRef() == field }
            assertTrue("${build.name}: cleared up front", firstWrite in 0 until before.indexOfFirst { it.controlRef() == PEER_REACTION_UNREAD })
            rows.apply()
            unread.apply()
            val patched = context.tgMutableClassDefBy(stock.definingClass).methods.single { it.toString() == stock.toString() }
            val after = patched.controlBody()
            val registers = stock.implementation!!.registerCount
            assertEquals("${build.name}: register count", registers, patched.implementation!!.registerCount)
            val hooks = after.indices.filter { after[it].controlRef() == "$DOUBLE_TAP_REACTIONS->unreadRow(I)Z" }
            assertEquals("${build.name}: one hook per return", before.count { it.opcode == Opcode.RETURN_VOID }, hooks.size)
            for (at in hooks) {
                assertEquals(listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_BOOLEAN, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IPUT_BOOLEAN, Opcode.RETURN_VOID),
                    after.subList(at - 2, at + 4).map { it.opcode })
                assertEquals("${build.name}: this", listOf(1, registers - 1 - stock.parameterTypes.size), after[at - 2].namedRegisters())
                assertEquals(listOf(0, 1), after[at - 1].namedRegisters())
                assertEquals(field, after[at - 1].controlRef())
                assertEquals(listOf(0), after[at].namedRegisters())
                assertEquals(listOf(0), after[at + 1].namedRegisters())
                assertEquals(listOf(0, 1), after[at + 2].namedRegisters())
                assertEquals(field, after[at + 2].controlRef())
            }
            // Every way into a return now passes the hook: only the hook's own write runs into one.
            val flow = ControlFlow.of(patched)
            for (i in after.indices) for (next in flow.normal[i]) {
                if (after[next].opcode == Opcode.RETURN_VOID) assertTrue("${build.name}: $i reaches a return past the hook", i == next - 1 && next - 3 in hooks)
            }
            val lead = if (stock.parameterTypes.size == 4) 3 else 6
            val kept = after.indices.filter { i -> i >= lead && hooks.none { i in it - 2..it + 2 } }.map { operand(after[it]) }
            assertEquals("${build.name}: stock code unchanged", before.map(::operand), kept)

            effect.apply()
            val random = context.tgMutableClassDefBy(MESSAGE_OBJECT).methods.single {
                it.origName == "getRandomUnreadReaction" && it.origParameterTypes.isEmpty()
            }
            val body = random.controlBody()
            assertEquals("$DOUBLE_TAP_REACTIONS->hideEffect()Z", body[0].controlRef())
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN_OBJECT), body.take(5).map { it.opcode })
            assertEquals("${build.name}: true answers null, false runs stock", setOf(3, 5), ControlFlow.of(random).normal[2].toSet())
            assertEquals(body[3].namedRegisters(), body[4].namedRegisters())
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
