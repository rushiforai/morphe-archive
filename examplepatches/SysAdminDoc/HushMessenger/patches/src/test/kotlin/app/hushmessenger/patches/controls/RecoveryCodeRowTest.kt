package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertTrue

private const val RC_HOST = "LX/Tur;"
private const val RC_STATE = "LX/TiW;"
private const val RC_LIST = "LX/Ja9;"
private const val RC_LABEL = "LX/2IW;->A0J(LX/5Qh;I)Ljava/lang/String;"
private const val RC_ADD = "$RC_HOST->A08(${RC_LIST}Ljava/lang/Object;Ljava/lang/String;I)V"
private const val RC_RESET_PIN = 0x7f1417a5
private const val RC_CREATE_PIN = 0x7f14179e
private const val RC_MORE_OPTIONS = 0x7f14176f
private const val RC_GENERATE = 0x7f1417a0
private const val RC_GENERATE_CODE = 0x2a
private const val RC_HOOK_SIZE = 8

internal const val SYNTHETIC_RECOVERY_CODE_ROW = "$RC_HOST->render(LX/27r;)LX/1F6;"

private class RcRegisters(val flag: Int = 2, val text: Int = 3, val list: Int = 0, val self: Int = 10, val owner: Int = 12)

/** One picked row as 587 writes it: the flag's side falls into the add, the else side sits later and jumps back to it. */
private fun rcPick(field: String, title: Int, code: Int, name: String, r: RcRegisters) = """
    iget-object v${r.flag}, v${r.self}, $RC_HOST->A01:$RC_STATE
    iget-boolean v${r.flag}, v${r.flag}, $RC_STATE->$field:Z
    if-eqz v${r.flag}, :else_$name
    const v${r.flag}, 0x${title.toString(16)}
    invoke-static {v${r.owner}, v${r.flag}}, $RC_LABEL
    move-result-object v${r.text}
    const/16 v${r.flag}, 0x${code.toString(16)}
    :add_$name
    invoke-static {v${r.list}, v${r.self}, v${r.text}, v${r.flag}}, $RC_ADD
""".trimIndent()

private fun rcElse(title: Int, code: Int, name: String, r: RcRegisters, backTo: String = name) = """
    :else_$name
    const v${r.flag}, 0x${title.toString(16)}
    invoke-static {v${r.owner}, v${r.flag}}, $RC_LABEL
    move-result-object v${r.text}
    const/16 v${r.flag}, 0x${code.toString(16)}
    goto/16 :add_$backTo
""".trimIndent()

/** The page's rows, cut down to the two picked ones, with the numbers of the arm64 builds unless a test says otherwise. */
private fun rcBody(
    createPin: Int = RC_CREATE_PIN,
    generate: Int = RC_GENERATE,
    generateCode: Int = RC_GENERATE_CODE,
    registers: RcRegisters = RcRegisters(),
    pinRow: Boolean = true,
    generateBackTo: String = "code",
) = buildString {
    if (pinRow) appendLine(rcPick("A07", RC_RESET_PIN, 0x2b, "pin", registers))
    appendLine(rcPick("A0A", RC_MORE_OPTIONS, 0x29, "code", registers))
    appendLine("const/4 v${registers.flag}, 0x0")
    appendLine("return-object v${registers.flag}")
    appendLine(rcElse(generate, generateCode, "code", registers, generateBackTo))
    if (pinRow) appendLine(rcElse(createPin, 0x2c, "pin", registers))
}

private fun rcMethod(body: String = rcBody(), id: String = SYNTHETIC_RECOVERY_CODE_ROW, flags: Int = AccessFlags.PUBLIC.value) =
    fixtureMethod(id, body, registers = 16, flags = flags)

/** The hook as the stock build writes it. */
internal fun recoveryCodeRowFixture(): List<MutableClass> = listOf(fixtureClass(RC_HOST, listOf(rcMethod())))

private fun MutableMethod.rcCode() = implementation!!.instructions.toList()

private fun Instruction.rcLiteral() = (this as? NarrowLiteralInstruction)?.narrowLiteral

private fun Instruction.rcReference() = (this as? ReferenceInstruction)?.reference?.toString()

private fun Instruction.rcArguments() = (this as FiveRegisterInstruction).let {
    listOf(it.registerC, it.registerD, it.registerE, it.registerF, it.registerG).take(it.registerCount)
}

/** What an instruction does, with every goto counted alike because an insert can widen one. */
private fun Instruction.rcKind(): List<Any?> = listOf(
    if (opcode == Opcode.GOTO_16 || opcode == Opcode.GOTO_32) Opcode.GOTO else opcode, rcLiteral(), rcReference(),
)

private fun List<Instruction>.rcAddress(index: Int) = take(index).sumOf { it.codeUnits }

class RecoveryCodeRowTest {
    private fun hook(method: MutableMethod) = injectControl(RECOVERY_CODE_ROW, mapOf(RECOVERY_CODE_ROW to listOf(method)))

    private fun firstAt(code: List<Instruction>, literal: Int) = code.indexOfFirst { it.rcLiteral() == literal }

    @Test fun theFinderAndItsMirrorTakeTheStockHook() {
        assertEquals(setOf(SYNTHETIC_RECOVERY_CODE_ROW), mirroredControls(recoveryCodeRowFixture()).getValue(RECOVERY_CODE_ROW).map { it.hookId() }.toSet())
    }

    @Test fun withTheSwitchOnTheCodeRowIsAddedRightBeforeMoreOptions() {
        val method = rcMethod()
        val before = method.rcCode()
        val at = firstAt(before, RC_MORE_OPTIONS)
        hook(method)
        val code = method.rcCode()
        assertEquals(before.size + RC_HOOK_SIZE, code.size)
        assertEquals(RECOVERY_CODE_ROW_CALL, code[at].rcReference())
        assertEquals(Opcode.MOVE_RESULT, code[at + 1].opcode)
        assertEquals(Opcode.IF_EQZ, code[at + 2].opcode)
        assertEquals(RC_GENERATE, code[at + 3].rcLiteral())
        assertEquals(RC_LABEL, code[at + 4].rcReference())
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[at + 5].opcode)
        assertEquals(RC_GENERATE_CODE, code[at + 6].rcLiteral())
        assertEquals(RC_ADD, code[at + 7].rcReference())
        assertEquals(RC_MORE_OPTIONS, code[at + RC_HOOK_SIZE].rcLiteral())
    }

    @Test fun withTheSwitchOffTheHookJumpsStraightToMoreOptions() {
        val method = rcMethod()
        val at = firstAt(method.rcCode(), RC_MORE_OPTIONS)
        hook(method)
        val code = method.rcCode()
        val skip = code[at + 2] as OffsetInstruction
        assertEquals(code.rcAddress(at + RC_HOOK_SIZE), code.rcAddress(at + 2) + skip.codeOffset)
    }

    @Test fun everyStockInstructionStaysInOrder() {
        val method = rcMethod()
        val before = method.rcCode()
        val at = firstAt(before, RC_MORE_OPTIONS)
        hook(method)
        val code = method.rcCode()
        assertEquals(before.map { it.rcKind() }, (code.take(at) + code.drop(at + RC_HOOK_SIZE)).map { it.rcKind() })
    }

    @Test fun theCreatePinRowIsLeftAlone() {
        val method = rcMethod()
        hook(method)
        val code = method.rcCode()
        assertEquals(1, code.count { it.rcLiteral() == RC_CREATE_PIN })
        assertEquals(2, code.count { it.rcLiteral() == RC_GENERATE })
        assertTrue(firstAt(code, RC_RESET_PIN) < code.indexOfFirst { it.rcReference() == RECOVERY_CODE_ROW_CALL })
    }

    @Test fun armv7sNumbersPickTheCodeRowAndNotCreatePin() {
        // On armv7 the number the other builds use for this row belongs to "Create PIN".
        val method = rcMethod(rcBody(createPin = RC_GENERATE, generate = 0x7f1417a2, generateCode = 0x95))
        val at = firstAt(method.rcCode(), RC_MORE_OPTIONS)
        hook(method)
        val code = method.rcCode()
        assertEquals(0x7f1417a2, code[at + 3].rcLiteral())
        assertEquals(0x95, code[at + 6].rcLiteral())
    }

    @Test fun theHookUsesTheRegistersTheStockRowUses() {
        val registers = RcRegisters(flag = 5, text = 6, list = 1, self = 9, owner = 11)
        val method = rcMethod(rcBody(registers = registers))
        val at = firstAt(method.rcCode(), RC_MORE_OPTIONS)
        hook(method)
        val code = method.rcCode()
        assertEquals(5, (code[at + 1] as OneRegisterInstruction).registerA)
        assertEquals(5, (code[at + 2] as OneRegisterInstruction).registerA)
        assertEquals(5, (code[at + 3] as OneRegisterInstruction).registerA)
        assertEquals(listOf(11, 5), code[at + 4].rcArguments())
        assertEquals(6, (code[at + 5] as OneRegisterInstruction).registerA)
        assertEquals(5, (code[at + 6] as OneRegisterInstruction).registerA)
        assertEquals(listOf(1, 9, 6, 5), code[at + 7].rcArguments())
    }

    @Test fun onlyTheShapeOfThisPageIsTaken() {
        val refused = mapOf(
            "no Create PIN row" to rcMethod(rcBody(pinRow = false)),
            "another title" to rcMethod(rcBody(generate = 0x7f141234)),
            "the two titles swapped" to rcMethod(rcBody(createPin = RC_GENERATE, generate = RC_CREATE_PIN)),
            "the else side adds another row" to rcMethod(rcBody(generateBackTo = "pin")),
            "another method name" to rcMethod(id = SYNTHETIC_RECOVERY_CODE_ROW.replace("->render(", "->build(")),
            "a static method" to rcMethod(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
            "no return value" to rcMethod(id = SYNTHETIC_RECOVERY_CODE_ROW.replace(")LX/1F6;", ")V")),
        )
        for ((why, method) in refused) assertNull(method.recoveryCodeSite(), why)
        assertNotNull(rcMethod().recoveryCodeSite())
    }

    @Test fun aChangedPageRefusesTheSwitchBeforeAnyEdit() {
        val bad = rcMethod(rcBody(generate = 0x7f141234))
        val before = bad.rcCode()
        assertFailsWith<PatchException> { hook(bad) }
        assertEquals(before, bad.rcCode())
    }

    @Test fun twoMethodsWithTheShapeLeaveTheSwitchWithoutAHook() {
        // A whole copy in a class of its own: the page reads its own fields, so the copy reads the copy's.
        val other = fixtureClass("LX/Tus;", listOf(rcMethod(body = rcBody().replace(RC_HOST, "LX/Tus;"),
            id = SYNTHETIC_RECOVERY_CODE_ROW.replace(RC_HOST, "LX/Tus;"))))
        assertEquals(emptyList(), findRecoveryCodeRow(recoveryCodeRowFixture() + other))
    }
}
