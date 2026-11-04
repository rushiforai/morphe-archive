package dev.utaa.linimal.patches.features.googleauth

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

class GoogleSignInRoutingPatchTest {
    @Test
    fun `the package getter must return only the GMS package and stay overridable`() {
        assertTrue(isGmsPackageGetter(constantString(GMS_PACKAGE_NAME)))
        assertFalse(isGmsPackageGetter(constantString("app.revanced.android.gms")))
        assertFalse(isGmsPackageGetter(constantString(GMS_PACKAGE_NAME,
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)))
    }

    @Test
    fun `the dynamic lookup getter is the boolean read right after package and action`() {
        val base = classOf(method("connect", "V", listOf(
            call("E", "Ljava/lang/String;"), call("D", "Ljava/lang/String;"), call("F", "Z"),
            ImmutableInstruction10x(Opcode.RETURN_VOID))))
        assertEquals("F", dynamicLookupName(base, "E", "D"))
        assertNull(dynamicLookupName(base, "E", "X"))
        assertNull(dynamicLookupName(base, null, "D"))
    }

    @Test
    fun `only a constant and its return can be wrapped`() {
        assertTrue(returnsConstant(constantString(IDENTITY_SIGN_IN_ACTION), Opcode.CONST_STRING))
        val flag = method("F", "Z", listOf(ImmutableInstruction11n(Opcode.CONST_4, 0, 1),
            ImmutableInstruction11x(Opcode.RETURN, 0)))
        assertTrue(returnsConstant(flag, Opcode.CONST_4))
        val other = method("F", "Z", listOf(ImmutableInstruction11n(Opcode.CONST_4, 0, 1),
            ImmutableInstruction11x(Opcode.RETURN, 1)))
        assertFalse(returnsConstant(other, Opcode.CONST_4))
    }

    @Test
    fun `the account setter must store exactly one Account and one name on itself`() {
        val owner = BASE
        fun put(type: String, name: String) = com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c(
            Opcode.IPUT_OBJECT, 0, 1, com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference(owner, name, type))
        val setter = ImmutableMethod(owner, "c", listOf(com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter(
            "Ljava/lang/String;", null, null)), "V", AccessFlags.PUBLIC.value, null, null,
            ImmutableMethodImplementation(3, listOf(put("Landroid/accounts/Account;", "e"), put("Ljava/lang/String;", "d"),
                ImmutableInstruction10x(Opcode.RETURN_VOID)), emptyList(), emptyList()))
        assertEquals("$owner->e:Landroid/accounts/Account;" to "$owner->d:Ljava/lang/String;", selectedAccountFields(setter))
        val ambiguous = ImmutableMethod(owner, "c", setter.parameters, "V", AccessFlags.PUBLIC.value, null, null,
            ImmutableMethodImplementation(3, listOf(put("Ljava/lang/String;", "d"), put("Ljava/lang/String;", "f"),
                ImmutableInstruction10x(Opcode.RETURN_VOID)), emptyList(), emptyList()))
        assertNull(selectedAccountFields(ambiguous))
    }

    private fun constantString(value: String, flags: Int = AccessFlags.PUBLIC.value) = method("E", "Ljava/lang/String;",
        listOf(ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(value)),
            ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)), flags)

    private fun call(name: String, result: String): Instruction =
        ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 1, 0, 0, 0, 0,
            ImmutableMethodReference(BASE, name, emptyList(), result))

    private fun method(name: String, result: String, body: List<Instruction>, flags: Int = AccessFlags.PUBLIC.value) =
        ImmutableMethod(BASE, name, emptyList(), result, flags, null, null,
            ImmutableMethodImplementation(2, body, emptyList(), emptyList()))

    private fun classOf(vararg methods: ImmutableMethod) = ImmutableClassDef(BASE, AccessFlags.PUBLIC.value,
        "Ljava/lang/Object;", null, null, null, null, methods.toList())

    private companion object {
        const val BASE = "Lrenamed/client;"
    }
}
