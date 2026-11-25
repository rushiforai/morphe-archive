package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotNull
import kotlin.test.assertNull

private const val NL_SCREEN = "Lcom/facebook/presence/note/ui/creation/NotesCreationFragment;"
private const val NL_COMPOSER = "LX/Tuo;"
private const val NL_FILTER = "LX/V5I;"
private const val NL_HOOK_SIZE = 2

internal const val SYNTHETIC_LONGER_NOTES = "$NL_SCREEN->A0F(LX/TlM;$NL_SCREEN)V"

private class NlRegisters(val limit: Int = 0, val composer: Int = 1, val filter: Int = 7)

/** The part of the state method that fills the note composer, as 587 writes it. */
private fun nlBody(
    composer: String = NL_COMPOSER,
    number: Int = 0x3c,
    r: NlRegisters = NlRegisters(),
    load: String = "const/16 v${r.limit}, 0x${number.toString(16)}",
    start: String = "",
    afterLoad: String = "",
    beforeFilter: String = "",
    filterOwner: Int = r.composer,
    filterType: String = "Landroid/text/InputFilter;",
) = """
    $start
    const/4 v${r.filter}, 0x0
    check-cast v${r.filter}, $NL_FILTER
    $load
    const/16 v2, 0x11
    new-instance v${r.composer}, $composer
    invoke-direct {v${r.composer}}, LX/1F6;-><init>()V
    $afterLoad
    iput v${r.limit}, v${r.composer}, $composer->A01:I
    iput-object v11, v${r.composer}, $composer->A0I:Ljava/lang/String;
    const/4 v${r.limit}, 0x0
    iput-object v${r.limit}, v${r.composer}, $composer->A0H:Ljava/lang/String;
    $beforeFilter
    iput-object v${r.filter}, v$filterOwner, $composer->A02:$filterType
    return-void
""".trimIndent()

private fun nlMethod(body: String = nlBody(), id: String = SYNTHETIC_LONGER_NOTES) =
    fixtureMethod(id, body, registers = 16, flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)

/** The hook as the stock build writes it. */
internal fun longerNotesFixture(): List<MutableClass> = listOf(fixtureClass(NL_SCREEN, listOf(nlMethod())))

private fun MutableMethod.nlCode() = implementation!!.instructions.toList()

private fun Instruction.nlReference() = (this as? ReferenceInstruction)?.reference?.toString()

private fun Instruction.nlArguments() = (this as FiveRegisterInstruction).let {
    listOf(it.registerC, it.registerD, it.registerE, it.registerF, it.registerG).take(it.registerCount)
}

/** What an instruction does, with every goto counted alike because an insert can widen one. */
private fun Instruction.nlKind(): List<Any?> = listOf(
    if (opcode == Opcode.GOTO_16 || opcode == Opcode.GOTO_32) Opcode.GOTO else opcode,
    (this as? NarrowLiteralInstruction)?.narrowLiteral,
    nlReference(),
)

private fun List<Instruction>.nlStoreAt() = indexOfFirst { it.opcode == Opcode.IPUT }

class LongerNotesTest {
    private fun hook(method: MutableMethod) = injectControl(LONGER_NOTES, mapOf(LONGER_NOTES to listOf(method)))

    @Test fun theFinderAndItsMirrorTakeTheStockHook() {
        assertEquals(setOf(SYNTHETIC_LONGER_NOTES), mirroredControls(longerNotesFixture()).getValue(LONGER_NOTES).map { it.hookId() }.toSet())
    }

    @Test fun theLimitPassesThroughTheExtensionRightBeforeTheComposerStoresIt() {
        val method = nlMethod()
        val at = method.nlCode().nlStoreAt()
        hook(method)
        val code = method.nlCode()
        assertEquals(LONGER_NOTES_CALL, code[at].nlReference())
        assertEquals(listOf(7, 0), code[at].nlArguments())
        assertEquals(Opcode.MOVE_RESULT, code[at + 1].opcode)
        assertEquals(0, (code[at + 1] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IPUT, code[at + NL_HOOK_SIZE].opcode)
        assertEquals("$NL_COMPOSER->A01:I", code[at + NL_HOOK_SIZE].nlReference())
    }

    @Test fun everyStockInstructionStaysInOrder() {
        val method = nlMethod()
        val before = method.nlCode()
        val at = before.nlStoreAt()
        hook(method)
        val code = method.nlCode()
        assertEquals(before.size + NL_HOOK_SIZE, code.size)
        assertEquals(before.map { it.nlKind() }, (code.take(at) + code.drop(at + NL_HOOK_SIZE)).map { it.nlKind() })
    }

    @Test fun theHookUsesTheRegistersTheStockCodeUses() {
        val method = nlMethod(nlBody(r = NlRegisters(limit = 3, composer = 4, filter = 9)))
        val at = method.nlCode().nlStoreAt()
        hook(method)
        val code = method.nlCode()
        assertEquals(listOf(9, 3), code[at].nlArguments())
        assertEquals(3, (code[at + 1] as OneRegisterInstruction).registerA)
    }

    @Test fun theComposerIsRecognizedUnderEveryBuildsName() {
        for (composer in listOf("LX/KuZ;", "LX/Tum;", "LX/LF6;")) assertNotNull(nlMethod(nlBody(composer = composer)).noteLimitSite(), composer)
    }

    @Test fun onlyTheShapeOfTheNoteScreenIsTaken() {
        val refused = mapOf(
            "another class" to nlMethod(id = SYNTHETIC_LONGER_NOTES.replaceFirst(NL_SCREEN, "LX/Other;")),
            "another number" to nlMethod(nlBody(number = 0x50)),
            "a number that isn't a constant" to nlMethod(nlBody(load = "move v0, v13")),
            "the filter register rewritten after the number is stored" to nlMethod(nlBody(beforeFilter = "const/4 v7, 0x0")),
            "the composer register rewritten after the number is stored" to nlMethod(nlBody(beforeFilter = "new-instance v1, LX/Other;")),
            "the filter stored in another object" to nlMethod(nlBody(filterOwner = 2)),
            "a field that isn't the text filter" to nlMethod(nlBody(filterType = "Ljava/lang/Object;")),
            "a jump landing on the stored number" to nlMethod(nlBody(start = "if-eqz v2, :store", afterLoad = ":store")),
            "a branch between the constant and the filter" to nlMethod(nlBody(afterLoad = "if-eqz v2, :next\n:next")),
        )
        for ((why, method) in refused) assertNull(method.noteLimitSite(), why)
        assertNotNull(nlMethod().noteLimitSite())
    }

    @Test fun aChangedScreenRefusesTheSwitchBeforeAnyEdit() {
        val bad = nlMethod(nlBody(number = 0x50))
        val before = bad.nlCode()
        assertFailsWith<PatchException> { hook(bad) }
        assertEquals(before, bad.nlCode())
    }

    @Test fun twoMethodsWithTheShapeLeaveTheSwitchWithoutAHook() {
        val second = nlMethod(id = SYNTHETIC_LONGER_NOTES.replace("->A0F(", "->A0G("))
        assertEquals(emptyList(), findLongerNotes(listOf(fixtureClass(NL_SCREEN, listOf(nlMethod(), second)))))
    }
}
