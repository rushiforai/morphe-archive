package app.morphe.jadx.eval

import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNull

class SmaliInstructionLocatorTest {
    private val smali = """
        ###### Class a.Outer (a.Outer)
        .class public La/Outer;
        .super Ljava/lang/Object;

        .method public run()V
            .registers 2

            const/4 v0, 0x0

            return-void
        .end method


        ###### Class a.Outer.Inner (a.Outer${'$'}Inner)
        .class public La/Outer${'$'}Inner;
        .super Ljava/lang/Object;

        .method public run()V
            .registers 3
            .annotation build La/Keep;
                value = "not-an-instruction"
            .end annotation

            .line 12
            const-string v0, "first"

            :cond_0
            if-eqz v0, :cond_0

            packed-switch v0, :pswitch_data_0

            return-void

            :pswitch_data_0
            .packed-switch 0x0
                :cond_0
            .end packed-switch
        .end method
    """.trimIndent()

    private fun match(definingClass: String, vararg instructions: Pair<Int, String>) = FingerprintMatch(
        definingClass,
        "run()V",
        firstInstructionIndex = null,
        lastInstructionIndex = null,
        instructions.map { (index, opcode) -> MatchedInstruction(index, opcode) },
    )

    private fun String.lineAt(position: Int) = substring(position).substringBefore('\n').trim()

    @Test
    fun `finds instructions and skips directive blocks`() {
        val match = match(
            "La/Outer\$Inner;",
            0 to "CONST_STRING",
            1 to "IF_EQZ",
            3 to "RETURN_VOID",
        )

        val lines = findInstructionPositions(smali, match)!!.map { smali.lineAt(it) }

        assertEquals(listOf("const-string v0, \"first\"", "if-eqz v0, :cond_0", "return-void"), lines)
    }

    @Test
    fun `positions are correct with windows line endings`() {
        val windowsSmali = smali.replace("\n", "\r\n")
        val match = match("La/Outer\$Inner;", 0 to "CONST_STRING", 3 to "RETURN_VOID")

        val lines = findInstructionPositions(windowsSmali, match)!!.map { windowsSmali.lineAt(it) }

        assertEquals(listOf("const-string v0, \"first\"", "return-void"), lines)
    }

    @Test
    fun `uses the method of the matched class`() {
        val match = match("La/Outer;", 1 to "RETURN_VOID")

        val lines = findInstructionPositions(smali, match)!!.map { smali.lineAt(it) }

        assertEquals(listOf("return-void"), lines)
    }

    @Test
    fun `line with a different opcode is not returned`() {
        assertEquals(emptyList(), findInstructionPositions(smali, match("La/Outer;", 1 to "CONST_4")))
    }

    @Test
    fun `missing method returns null`() {
        assertNull(findInstructionPositions(smali, match("La/Other;", 0 to "CONST_4")))
    }
}
