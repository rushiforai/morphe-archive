/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.api

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.insertAtControlFlowLabel
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

/**
 * The sign-in screen's Test Backend checkbox on each declared build: the extension gets
 * isTestBackend()'s answer right before the screen tests it and hands its own back in the same
 * register, and the rest of the screen is Telegram's code unchanged.
 */
class TestServerSignInFixtureTest {
    @Test
    fun `the checkbox test asks the extension on each declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val check = context.resolveTestServerSignIn()
            val stock = ImmutableMethod.of(check.method)
            assertEquals("$name: no warning", emptyList<String>(), PatchLogCapture.warnings { testServerSignInPatch.execute(context) })

            val before = stock.controlBody()
            assertEquals("$name: the test reads isTestBackend()'s answer", listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ),
                listOf(before[check.test - 1].opcode, before[check.test].opcode))
            assertEquals("$name: that answer comes from isTestBackend()", IS_TEST_BACKEND, before[check.test - 2].controlRef())
            val expected = mutableListOf<List<Any?>>()
            for ((index, instruction) in before.withIndex()) {
                if (instruction.opcode == Opcode.NOP) continue
                if (index == check.test) {
                    expected += listOf(Opcode.INVOKE_STATIC_RANGE, TEST_SERVERS_SHOWN)
                    expected += listOf(Opcode.MOVE_RESULT, null)
                }
                expected += instruction.shape()
            }
            val after = check.method.controlBody().filter { it.opcode != Opcode.NOP }
            assertEquals("$name: hooked right before the test, stock otherwise", expected, after.map { it.shape() })

            val at = after.indexOfFirst { it.controlRef() == TEST_SERVERS_SHOWN }
            val call = after[at] as RegisterRangeInstruction
            assertEquals("$name: the call takes v${check.register}", listOf(check.register, 1), listOf(call.startRegister, call.registerCount))
            assertEquals("$name: the answer goes back to v${check.register}", check.register, (after[at + 1] as OneRegisterInstruction).registerA)
            assertEquals("$name: the stock test reads the answer", check.register, (after[at + 2] as OneRegisterInstruction).registerA)
            assertEquals("$name: right after isTestBackend()'s move-result", listOf(Opcode.MOVE_RESULT, IS_TEST_BACKEND),
                listOf(after[at - 1].opcode, after[at - 2].controlRef()))
            val flow = ControlFlow.of(check.method)
            assertTrue("$name: only the hook's move-result reaches the test",
                flow.normal.indices.none { it != check.test + 1 && check.test + 2 in flow.normal[it] })
            assertEquals("$name: switch reported", 1L, statusFact(context))
        }
    }

    @Test
    fun `a changed sign-in screen refuses before anything is edited`() {
        val changes = mapOf(
            "way in" to "something else jumps onto the Test Backend test",
            "answer" to "the Test Backend checkbox no longer waits on isTestBackend()",
            "sign-in check" to "the Test Backend checkbox is no longer kept to signing in",
        )
        for (build in Fixtures.declaredBuilds()) for ((change, why) in changes) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val check = context.resolveTestServerSignIn()
            val method = check.method
            val body = method.controlBody()
            when (change) {
                "way in" -> {
                    method.insertAtControlFlowLabel(check.test - 4, "goto/32 :hush_way_in", ExternalLabel("hush_way_in", body[check.test]))
                    assertTrue("the jump really lands on the test", check.test + 1 in ControlFlow.of(method).normal[check.test - 4])
                }
                "answer" -> method.replaceInstruction(check.test - 1, "const/16 v${check.register}, 0x1")
                "sign-in check" -> method.replaceInstruction((check.test + 1 until body.size).first { body[it].opcode == Opcode.IF_NEZ }, "nop")
            }
            val changed = method.controlBody().map { it.shape() }
            try {
                testServerSignInPatch.execute(context)
                fail("${build.name}: $change was accepted")
            } catch (expected: PatchException) {
                assertTrue("${build.name}: $change: ${expected.message}", expected.message.orEmpty().contains("$why (before editing)"))
            }
            assertEquals("${build.name}: $change leaves the screen alone", changed, method.controlBody().map { it.shape() })
            assertEquals("${build.name}: $change reports no switch", 0L, statusFact(context))
        }
    }

    @Test
    fun `Next asks the extension about the country code on each declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val check = context.resolveTestNumberCode()
            val stock = ImmutableMethod.of(check.method)
            testServerSignInPatch.execute(context)

            val before = stock.controlBody()
            val read = before[check.at - 1]
            assertEquals("$name: hooked right after the country state read", Opcode.IGET, read.opcode)
            assertEquals("$name: the read fills v${check.state}", check.state, (read as OneRegisterInstruction).registerA)
            val expected = mutableListOf<List<Any?>>()
            for ((index, instruction) in before.withIndex()) {
                if (instruction.opcode == Opcode.NOP) continue
                if (index == check.at) {
                    expected += listOf(Opcode.IGET_OBJECT, check.pageField)
                    expected += listOf(Opcode.IGET_BOOLEAN, check.testBoxField)
                    expected += listOf(Opcode.IF_EQZ, null)
                    expected += listOf(Opcode.IGET_OBJECT, check.codeField)
                    expected += listOf(Opcode.INVOKE_STATIC, TEST_SERVERS_COUNTRY_STATE)
                    expected += listOf(Opcode.MOVE_RESULT, null)
                }
                expected += instruction.shape()
            }
            val after = check.method.controlBody().filter { it.opcode != Opcode.NOP }
            assertEquals("$name: hooked after the read, stock otherwise", expected, after.map { it.shape() })

            val box = before.indices.single { before[it].controlRef() == IS_TEST_BACKEND && before.getOrNull(it + 3)?.controlRef() == check.testBoxField }
            assertEquals("$name: the flag is the one Telegram compares with isTestBackend()",
                listOf(check.pageField, check.testBoxField), listOf(before[box + 2].controlRef(), before[box + 3].controlRef()))
            val patched = check.method.controlBody()
            val page = patched[check.at] as TwoRegisterInstruction
            val flag = patched[check.at + 1] as TwoRegisterInstruction
            assertEquals("$name: the box's flag comes off the screen's page into the scratch register",
                listOf(check.scratch, check.screen, check.scratch, check.scratch), listOf(page.registerA, page.registerB, flag.registerA, flag.registerB))
            assertEquals("$name: the flag is what's tested", check.scratch, (patched[check.at + 2] as OneRegisterInstruction).registerA)
            assertEquals("$name: unticked goes straight to Telegram's own instruction",
                setOf(check.at + 3, check.at + 6), ControlFlow.of(check.method).normal[check.at + 2].toSet())
            assertEquals("$name: and that instruction is the stock one after the read", before[check.at].shape(), patched[check.at + 6].shape())

            val at = after.indexOfFirst { it.controlRef() == TEST_SERVERS_COUNTRY_STATE }
            val field = after[at - 1] as TwoRegisterInstruction
            assertEquals("$name: the code field comes off the screen into the register the next constant overwrites",
                listOf(check.scratch, check.screen), listOf(field.registerA, field.registerB))
            assertEquals("$name: the field is the one the number starts with", check.codeField, numberStart(before)?.controlRef())
            val call = after[at] as FiveRegisterInstruction
            assertEquals("$name: the call takes the state and the code field", listOf(2, check.state, check.scratch),
                listOf(call.registerCount, call.registerC, call.registerD))
            assertEquals("$name: the answer goes back to v${check.state}", check.state, (after[at + 1] as OneRegisterInstruction).registerA)
            assertEquals("$name: the scratch register is loaded again right after", check.scratch,
                (after[at + 2] as OneRegisterInstruction).registerA)
            val tests = after.indices.filter {
                it > at && after[it].opcode == Opcode.IF_NE && (after[it] as TwoRegisterInstruction).registerA == check.state
            }
            assertTrue("$name: both of Telegram's tests read the answer", tests.size >= 2 && tests[0] == at + 3)
            assertTrue("$name: the WrongCountry alert follows the second test",
                (tests[1] until after.size).take(8).any { after[it].controlRef() == WRONG_COUNTRY })
        }
    }

    @Test
    fun `a changed Next refuses before anything is edited`() {
        val changes = mapOf(
            "way in" to "something else jumps past Next's country state read",
            "state" to "the WrongCountry alert no longer waits on an unknown country code",
            "between" to "Next changes the country state before testing it again",
            "box" to "the Test Backend box's flag is missing or ambiguous",
        )
        for (build in Fixtures.declaredBuilds()) for ((change, why) in changes) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val check = context.resolveTestNumberCode()
            val method = check.method
            val body = method.controlBody()
            val wrong = body.indexOfFirst { it.controlRef() == WRONG_COUNTRY }
            val refusal = (wrong - 1 downTo 0).first { body[it].opcode == Opcode.IF_NE }
            val two = (refusal - 1 downTo 0).first {
                body[it].opcode == Opcode.CONST_4 && (body[it] as OneRegisterInstruction).registerA == (body[refusal] as TwoRegisterInstruction).registerB
            }
            when (change) {
                "way in" -> {
                    method.insertAtControlFlowLabel(check.at - 4, "goto/32 :hush_way_in", ExternalLabel("hush_way_in", body[check.at]))
                    assertTrue("the jump really lands past the read", check.at + 1 in ControlFlow.of(method).normal[check.at - 4])
                }
                "state" -> method.replaceInstruction(two, "const/4 v${(body[two] as OneRegisterInstruction).registerA}, 0x3")
                "between" -> method.replaceInstruction(two - 1, "const/4 v${check.state}, 0x0")
                "box" -> {
                    val flag = body.indices.single {
                        body[it].controlRef() == IS_TEST_BACKEND && body.getOrNull(it + 3)?.opcode == Opcode.IGET_BOOLEAN
                    } + 3
                    method.replaceInstruction(flag, "const/16 v${(body[flag] as OneRegisterInstruction).registerA}, 0x0")
                }
            }
            val changed = method.controlBody().map { it.shape() }
            try {
                testServerSignInPatch.execute(context)
                fail("${build.name}: $change was accepted")
            } catch (expected: PatchException) {
                assertTrue("${build.name}: $change: ${expected.message}", expected.message.orEmpty().contains("$why (before editing)"))
            }
            assertEquals("${build.name}: $change leaves Next alone", changed, method.controlBody().map { it.shape() })
            assertEquals("${build.name}: $change reports no switch", 0L, statusFact(context))
        }
    }

    /** The field read whose text the phone number starts with, after the WrongCountry alert. */
    private fun numberStart(body: List<Instruction>): Instruction? {
        val wrong = body.indexOfFirst { it.controlRef() == WRONG_COUNTRY }
        return (wrong + 1 until body.size - 1).firstOrNull { i ->
            body[i].opcode == Opcode.IGET_OBJECT && body[i + 1].controlRef() == "Landroid/widget/EditText;->getText()Landroid/text/Editable;"
        }?.let { body[it] }
    }

    /** Opcode and Telegram's name for what it touches, with a widened goto read as a goto. */
    private fun Instruction.shape(): List<Any?> = listOf(
        when (opcode) {
            Opcode.GOTO_16, Opcode.GOTO_32 -> Opcode.GOTO
            else -> opcode
        },
        origRef(),
    )

    private fun hosts(build: File): List<ClassDef> =
        FixtureDex.classesWhere(build, census, { true }) { method ->
            method.controlBody().any { it.controlRef() == DEBUG_TEST_BACKEND || it.controlRef() == WRONG_COUNTRY }
        }

    private fun statusFact(context: BytecodePatchContext): Long =
        (context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "testServerSignIn" }.controlBody().first()
            as WideLiteralInstruction).wideLiteral

    private companion object {
        val census = FixtureDex.ClassCensus()
    }
}
