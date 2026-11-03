package dev.utaa.linimal.patches.features.lineai

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNull

class LineAiImageSideMenuPatchTest {
    private fun instructions(moveRegister: Int = 7, branchRegister: Int = 7) = listOf(
        ImmutableInstruction10x(Opcode.NOP),
        ImmutableInstruction11x(Opcode.MOVE_RESULT, moveRegister),
        ImmutableInstruction21t(Opcode.IF_EQZ, branchRegister, 8),
        ImmutableInstruction10x(Opcode.NOP),
        ImmutableInstruction10x(Opcode.RETURN_VOID),
    )

    @Test
    fun `判定結果の直後の分岐の前へ注入する`() {
        assertEquals(LineAiImageSideMenuShape(2, 7), lineAiImageSideMenuShape(instructions(), 0))
    }

    @Test
    fun `別の register を分岐する形は拒否する`() {
        assertNull(lineAiImageSideMenuShape(instructions(branchRegister = 8), 0))
    }

    @Test
    fun `非 range invoke で渡せない register は拒否する`() {
        assertNull(lineAiImageSideMenuShape(instructions(moveRegister = 16, branchRegister = 16), 0))
    }

    @Test
    fun `注入位置が例外 handler の先頭なら拒否する`() {
        assertNull(lineAiImageSideMenuShape(instructions(), 0, setOf(2)))
    }
}
