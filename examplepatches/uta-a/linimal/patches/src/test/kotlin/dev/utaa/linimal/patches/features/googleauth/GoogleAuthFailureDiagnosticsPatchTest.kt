package dev.utaa.linimal.patches.features.googleauth

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction12x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

/** 診断の hook を、値を読み終えた直後の、分岐先ではない位置に入れることを検証します。 */
class GoogleAuthFailureDiagnosticsPatchTest {
    private companion object {
        const val HOOKS = "Ldev/utaa/linimal/extension/features/googleauth/GoogleAuthRoutingHooks;"
    }

    @Test
    fun `the token error hook goes right after the error string is read`() {
        val body = listOf(
            constString(0, "tokenDetails"),
            constString(0, TOKEN_ERROR_KEY),
            getString(bundle = 9, key = 0),
            ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
            constString(1, "userRecoveryIntent"),
        )

        assertEquals(InjectionSite(index = 4, register = 0), tokenErrorSite(body))
    }

    /** LINE 26.16.0 では getString が BaseBundle のメソッドとして参照されています。 */
    @Test
    fun `getString referenced through BaseBundle is accepted`() {
        val body = listOf(
            constString(0, TOKEN_ERROR_KEY),
            getString(bundle = 9, key = 0, owner = "Landroid/os/BaseBundle;"),
            ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
        )

        assertEquals(InjectionSite(index = 3, register = 0), tokenErrorSite(body))
    }

    @Test
    fun `the error string must be read with Bundle getString`() {
        val body = listOf(
            constString(0, TOKEN_ERROR_KEY),
            ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 9, 0, 0, 0, 0,
                ImmutableMethodReference("Landroid/content/Intent;", "getStringExtra",
                    listOf("Ljava/lang/String;"), "Ljava/lang/String;")),
            ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
        )

        assertNull(tokenErrorSite(body))
    }

    @Test
    fun `an ambiguous token response is not patched`() {
        val read = listOf(
            constString(0, TOKEN_ERROR_KEY),
            getString(bundle = 9, key = 0),
            ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
        )

        assertNull(tokenErrorSite(read + read))
    }

    @Test
    fun `the bind failure hook receives the message and the component`() {
        val body = listOf(
            ImmutableInstruction10x(Opcode.NOP),
            constString(4, BIND_FAILED_MESSAGE),
            ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, 4, 0, 0, 0, 0,
                ImmutableMethodReference("Loy8/z;", "a", listOf("Ljava/lang/String;"), "V")),
        )

        assertEquals(InjectionSite(index = 2, register = 4), bindFailureSite(body, componentRegister = 5))
    }

    /** range invoke に渡すため、メッセージの次の register が ComponentName でなければ注入しません。 */
    @Test
    fun `the message must sit right before the component register`() {
        val body = listOf(constString(3, BIND_FAILED_MESSAGE))

        assertNull(bindFailureSite(body, componentRegister = 5))
        assertNull(bindFailureSite(emptyList(), componentRegister = 5))
    }

    @Test
    fun `a rewritten component register is detected`() {
        val untouched = listOf(constString(4, BIND_FAILED_MESSAGE), ImmutableInstruction10x(Opcode.RETURN_VOID))
        val rewritten = untouched + ImmutableInstruction12x(Opcode.MOVE_OBJECT, 5, 4)

        assertFalse(writesRegister(untouched, 5))
        assertTrue(writesRegister(rewritten, 5))
    }

    /** 先に適用された bind 先の差し替え hook の結果は、差し替えた ComponentName なので書き換えとして数えません。 */
    @Test
    fun `the routing hook result is not counted as a rewrite`() {
        val routed = listOf(
            ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 4, 2,
                ImmutableMethodReference(HOOKS, "authServiceComponent",
                    listOf("Landroid/content/Context;", "Landroid/content/ComponentName;"),
                    "Landroid/content/ComponentName;")),
            ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 5),
        )

        assertTrue(writesRegister(routed, 5))
        assertFalse(writesRegister(routed, 5, ignoreResultOf = "authServiceComponent"))
        assertTrue(writesRegister(routed, 5, ignoreResultOf = "otherHook"))
    }

    private fun constString(register: Int, value: String): Instruction =
        ImmutableInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(value))

    private fun getString(bundle: Int, key: Int, owner: String = "Landroid/os/Bundle;"): Instruction =
        ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, bundle, key, 0, 0, 0,
            ImmutableMethodReference(owner, "getString",
                listOf("Ljava/lang/String;"), "Ljava/lang/String;"))
}
