package dev.utaa.linimal.patches.features.font

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNull

class CustomFontPatchTest {
    private fun booleanValue(register: Int) = ImmutableInstruction35c(
        Opcode.INVOKE_VIRTUAL, 1, register, 0, 0, 0, 0,
        ImmutableMethodReference("Ljava/lang/Boolean;", "booleanValue", emptyList<String>(), "Z"),
    )

    private fun registerCallbacks(application: Int, callbacks: Int) = ImmutableInstruction35c(
        Opcode.INVOKE_VIRTUAL, 2, application, callbacks, 0, 0, 0,
        ImmutableMethodReference(
            "Landroid/app/Application;",
            "registerActivityLifecycleCallbacks",
            listOf("Landroid/app/Application\$ActivityLifecycleCallbacks;"),
            "V",
        ),
    )

    private val nop = ImmutableInstruction10x(Opcode.NOP)

    /**
     * LINE 26.16.0 の `fo8.q$a.invokeSuspend` の 002e〜003f に相当する形。
     * index 2 の `if-eqz v4` が、結果が false のときに登録を飛ばす分岐です（address 4 から +6 で index 5、address 10 へ飛ぶ）。
     */
    private fun referenceShape(skipOffset: Int = 6, register: Instruction = registerCallbacks(0, 4)): List<Instruction> =
        listOf(
            booleanValue(5),
            ImmutableInstruction11x(Opcode.MOVE_RESULT, 4),
            ImmutableInstruction21t(Opcode.IF_EQZ, 4, skipOffset),
            nop,
            register,
            ImmutableInstruction11x(Opcode.RETURN_OBJECT, 4),
        )

    @Test
    fun `the theme decision is routed through the hook before the branch`() {
        assertEquals(ThemeGateInjection(insertionIndex = 2, resultRegister = 4), themeGateInjection(referenceShape()))
    }

    @Test
    fun `the branch must skip the registration of the theme applier`() {
        // 登録が分岐の飛び先より後ろにある（結果が false でも登録される）形は対象外です。
        assertNull(themeGateInjection(referenceShape(skipOffset = 3)))
        assertNull(themeGateInjection(referenceShape(register = nop)))
    }

    @Test
    fun `a branch target at the insertion point is rejected`() {
        assertNull(themeGateInjection(referenceShape(), handlerAddresses = setOf(4)))
    }

    @Test
    fun `two candidate branches are rejected`() {
        assertNull(themeGateInjection(referenceShape() + referenceShape()))
    }

    @Test
    fun `open file uses the first local register for the hook result`() {
        // LINE 26.16.0 の openFile は registers 4・ins 3（this, Uri, String）。
        assertEquals(
            OpenFileInjection(uriRegister = 2, resultRegister = 0),
            openFileInjection(isStatic = false, registerCount = 4, parameterCount = 2),
        )
    }

    @Test
    fun `open file without a spare register or with another signature is left unchanged`() {
        assertNull(openFileInjection(isStatic = false, registerCount = 3, parameterCount = 2))
        assertNull(openFileInjection(isStatic = true, registerCount = 4, parameterCount = 2))
        assertNull(openFileInjection(isStatic = false, registerCount = 4, parameterCount = 1))
    }
}
