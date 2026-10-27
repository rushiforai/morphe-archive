import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.assertThrows

/** These tests check the verifier itself, using deliberately incorrect instruction sequences. */
class SmokeTestAssertionsTest {
    private fun method(smali: String, returnType: String = "I"): MutableMethod =
        MutableMethod(
            ImmutableMethod(
                "Lprobe/ReturnValue;", "value", emptyList(), returnType,
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
                ImmutableMethodImplementation(
                    4, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), null, null,
                ),
            ),
        ).apply { addInstructions(0, smali) }

    @Test
    fun `integer assertion accepts each narrow constant encoding`() {
        for (constant in listOf("const/4 v2, 0x1", "const/16 v2, 0x1", "const v2, 0x1")) {
            assertReturnsInt(method("$constant\nreturn v2"), 1, constant)
        }
        assertReturnsInt(method("const/high16 v2, 0x10000\nreturn v2"), 65536, "high16")
    }

    @Test
    fun `integer assertion rejects arithmetic with the same literal`() {
        assertThrows<AssertionError> {
            assertReturnsInt(method("add-int/lit8 v0, v1, 0x1\nreturn v0"), 1, "arithmetic")
        }
    }

    @Test
    fun `integer assertion rejects returning a different register`() {
        assertThrows<AssertionError> {
            assertReturnsInt(method("const/4 v0, 0x1\nreturn v1"), 1, "wrong register")
        }
    }

    private fun assertCall(smali: String) = assertReturnsMethodCall(
        method(smali, "Ljava/lang/Object;"), "Lprobe/Factory;", "create", "factory",
    )

    @Test
    fun `call assertion accepts the captured invocation result`() {
        assertCall("invoke-static {}, Lprobe/Factory;->create()Ljava/lang/Object;\nmove-result-object v2\nreturn-object v2")
    }

    @Test
    fun `call assertion rejects a discarded invocation result`() {
        assertThrows<AssertionError> {
            assertCall("invoke-static {}, Lprobe/Factory;->create()Ljava/lang/Object;\nconst/4 v2, 0x0\nreturn-object v2")
        }
    }

    @Test
    fun `call assertion rejects returning a different register`() {
        assertThrows<AssertionError> {
            assertCall("invoke-static {}, Lprobe/Factory;->create()Ljava/lang/Object;\nmove-result-object v2\nreturn-object v1")
        }
    }

    @Test
    fun `call assertion rejects a method reference that is never invoked`() {
        assertThrows<AssertionError> {
            assertCall("const-method-type v0, ()Ljava/lang/Object;\nmove-result-object v2\nreturn-object v2")
        }
    }
}

