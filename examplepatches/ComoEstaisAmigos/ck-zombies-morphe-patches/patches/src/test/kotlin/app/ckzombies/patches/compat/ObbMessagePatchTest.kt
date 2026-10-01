package app.ckzombies.patches.compat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

class ObbMessagePatchTest {
    private val obbCheck = "Lapp/ckzombies/extension/ObbCheck;"
    private val centeredText = "Lapp/ckzombies/extension/CenteredText;"

    private fun method(
        definingClass: String,
        name: String,
        params: List<String>,
        returnType: String,
        registers: Int,
        static: Boolean,
        smali: String,
    ): MutableMethod = ImmutableMethod(
        definingClass, name, params.map { ImmutableMethodParameter(it, null, null) }, returnType,
        AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0), null, null,
        MutableMethodImplementation(registers),
    ).toMutable().apply { addInstructionsWithLabels(0, smali) }

    // Glu's newState has 12 locals: this is v12 and the state v13. Every state change jumps back
    // to the const/4 v1, -0x1 after the copy of this into v0.
    private fun newState(smali: String = LOOP) =
        method(DOWNLOAD_VIEW, "newState", listOf("I"), "V", 14, false, smali)

    // GluTextArea.draw has 8 locals: this is v8 and the canvas v9.
    private fun draw(smali: String = DRAW) =
        method(TEXT_AREA, "draw", listOf("Landroid/graphics/Canvas;"), "V", 10, false, smali)

    private fun findInDir(smali: String = FIND) =
        method(DOWNLOAD_MANAGER, "findGPKFileInDir", listOf("Ljava/io/File;", "Z"), "Ljava/io/File;", 4, true, smali)

    private fun Instruction.reference() = (this as ReferenceInstruction).reference
    private fun Instruction.call() = (reference() as MethodReference).let { "${it.definingClass}->${it.name}" }
    private fun Instruction.target() = (this as BuilderOffsetInstruction).target.location.index
    private fun MutableMethod.code() = implementation!!.instructions.toList()

    private fun isLoopConst(it: Instruction) = it.opcode == Opcode.CONST_4 &&
        (it as OneRegisterInstruction).registerA == 1 && (it as NarrowLiteralInstruction).narrowLiteral == -1

    // routeMissingObb

    @Test
    fun `the hook sits where every state change lands and ends with the loop's own first instruction`() {
        val method = newState()
        routeMissingObb(method)
        val code = method.code()

        val head = code.single { it.opcode == Opcode.GOTO }.target()
        assertEquals("Lcom/glu/platform/android/resdl/ResDL;->getContext", code[head].call(),
            "the goto back lands on the hook, not after it")

        val hook = code.subList(head, code.indexOfFirst(::isLoopConst) + 1)
        assertEquals(
            listOf(
                Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT,
                Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT,
                Opcode.IF_EQZ, Opcode.IPUT_OBJECT, Opcode.CONST_4, Opcode.IF_NE, Opcode.SPUT_BOOLEAN, Opcode.CONST_4,
            ),
            hook.map { it.opcode },
        )
        assertEquals("$DOWNLOAD_MANAGER->getSpecialFileSize", hook[2].call())
        assertEquals("$obbCheck->route", hook[4].call())
        assertEquals(13, (hook[5] as OneRegisterInstruction).registerA, "route() writes the state, p1")
        assertEquals("m_downloadError", (hook[9].reference() as FieldReference).name)
        assertEquals(1, (hook[10] as NarrowLiteralInstruction).narrowLiteral, "state 1, the check")
        assertEquals("DO_NOT_UNPACK_GPK", (hook[12].reference() as FieldReference).name)
        assertEquals(Opcode.IF_NE, code[head + hook.size].opcode, "Glu's if-ne p1, v1 follows")
    }

    @Test
    fun `the skips inside the hook land inside the hook`() {
        val method = newState()
        routeMissingObb(method)
        val code = method.code()
        val head = code.single { it.opcode == Opcode.GOTO }.target()
        val end = code.indexOfFirst(::isLoopConst)
        val skips = (head until end).filter { code[it].opcode == Opcode.IF_EQZ || code[it].opcode == Opcode.IF_NE }
        assertEquals(2, skips.size)
        assertEquals(Opcode.CONST_4, code[code[skips[0]].target()].opcode, "no message: on to the flag")
        assertEquals(end, code[skips[1]].target(), "not the check: on to Glu's own loop head")
    }

    @Test
    fun `a newState without that loop head is refused`() {
        val noHead = newState(
            """
                move-object v0, p0
                const/4 v1, 0x0
                return-void
            """,
        )
        assertFailsWith<PatchException> { routeMissingObb(noHead) }
    }

    @Test
    fun `a loop head nothing jumps back to is refused`() {
        val straight = newState(
            """
                move-object v0, p0
                const/4 v1, -0x1
                if-ne p1, v1, :cont
                return-void
                :cont
                return-void
            """,
        )
        assertFailsWith<PatchException> { routeMissingObb(straight) }
    }

    @Test
    fun `v0 must hold this`() {
        assertFailsWith<PatchException> { routeMissingObb(newState(LOOP.replace("move-object v0, p0", "const/4 v0, 0x0"))) }
    }

    // exitOnlyOnErrorPage

    @Test
    fun `the error page calls exitOnly right after laying out, with the view`() {
        val method = newState()
        exitOnlyOnErrorPage(method)
        val code = method.code()
        val layout = code.indexOfFirst { it.opcode == Opcode.INVOKE_DIRECT_RANGE }
        assertEquals("$obbCheck->exitOnly", code[layout + 1].call())
        assertEquals(0, (code[layout + 1] as FiveRegisterInstruction).registerC, "v0 is the view")
        assertEquals(Opcode.RETURN_VOID, code[layout + 2].opcode)
    }

    @Test
    fun `an error page without a createPromptLayout call is refused`() {
        val odd = newState(LOOP.replace(LAYOUT_CALL, "nop"))
        assertFailsWith<PatchException> { exitOnlyOnErrorPage(odd) }
    }

    // centerTextArea

    @Test
    fun `draw asks CenteredText for the first line and restores the canvas where it returns`() {
        val method = draw()
        centerTextArea(method)
        val code = method.code()
        val middle = code.indexOfFirst { it.opcode == Opcode.INT_TO_FLOAT }
        assertEquals(
            listOf(Opcode.IGET, Opcode.IGET, Opcode.SUB_INT_2ADDR, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT),
            code.subList(middle + 1, middle + 6).map { it.opcode },
        )
        assertEquals("$centeredText->begin", code[middle + 4].call())
        assertEquals(listOf(9, 2, 3, 4, 5), (code[middle + 4] as FiveRegisterInstruction).let {
            listOf(it.registerC, it.registerD, it.registerE, it.registerF, it.registerG)
        }, "canvas, line height, lines, middle, area height")
        assertEquals(4, (code[middle + 5] as OneRegisterInstruction).registerA, "the first line replaces the middle")

        val exit = code.single { it.opcode == Opcode.IF_GE }.target()
        assertEquals("$centeredText->end", code[exit].call(), "the loop's exit lands on end()")
        assertEquals(Opcode.RETURN_VOID, code[exit + 1].opcode)
    }

    @Test
    fun `a draw with other registers is refused`() {
        assertFailsWith<PatchException> { centerTextArea(draw(DRAW.replace("move-result v2", "move-result v7"))) }
    }

    // keepMismatchedFiles

    @Test
    fun `the wrong-size delete becomes a nop and nothing else changes`() {
        val method = findInDir()
        val before = method.code().map { it.opcode }
        keepMismatchedFiles(method)
        val after = method.code().map { it.opcode }
        assertEquals(before.map { if (it == Opcode.INVOKE_VIRTUAL) Opcode.NOP else it }, after)
        assertTrue(Opcode.INVOKE_VIRTUAL in before)
    }

    @Test
    fun `a delete whose result is used, or two of them, are refused`() {
        val delete = "invoke-virtual {p0}, Ljava/io/File;->delete()Z"
        assertFailsWith<PatchException> { keepMismatchedFiles(findInDir(FIND.replace(delete, "$delete\nmove-result v0"))) }
        assertFailsWith<PatchException> { keepMismatchedFiles(findInDir(FIND.replace("goto :next", "$delete\ngoto :next"))) }
    }

    private companion object {
        const val LAYOUT_CALL = "invoke-direct/range {v0 .. v5}, Lcom/glu/platform/android/resdl/ResFileDownloadView;->" +
            "createPromptLayout(Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;)V"

        const val LOOP = """
            const/4 v11, 0x5
            move-object v0, p0
            :goto_0
            const/4 v1, -0x1
            if-ne p1, v1, :cond_0
            return-void
            :cond_0
            const/16 v1, 0x9
            if-ne p1, v1, :other
            iget-object v1, v0, Lcom/glu/platform/android/resdl/ResFileDownloadView;->m_downloadError:Ljava/lang/String;
            const/4 v2, 0x6
            const-string v3, "Retry"
            const/4 v4, 0x7
            const-string v5, "Exit"
            $LAYOUT_CALL
            return-void
            :other
            const/4 p1, 0x2
            goto :goto_0
        """

        const val DRAW = """
            iget-object v0, p0, $TEXT_AREA->m_paint:Landroid/graphics/Paint;
            invoke-virtual {v0}, Landroid/graphics/Paint;->getTextSize()F
            move-result v2
            iget-object v0, p0, $TEXT_AREA->m_wrappedText:Ljava/util/Vector;
            invoke-virtual {v0}, Ljava/util/Vector;->size()I
            move-result v3
            iget v0, p0, $TEXT_AREA->m_y:I
            int-to-float v4, v0
            const/4 v0, 0x0
            move v1, v0
            :goto_0
            if-ge v1, v3, :cond_0
            add-int/lit8 v1, v1, 0x1
            goto :goto_0
            :cond_0
            return-void
        """

        const val FIND = """
            const/4 v0, 0x0
            :next
            if-eqz p1, :done
            invoke-virtual {p0}, Ljava/io/File;->delete()Z
            goto :next
            :done
            return-object v0
        """
    }
}
