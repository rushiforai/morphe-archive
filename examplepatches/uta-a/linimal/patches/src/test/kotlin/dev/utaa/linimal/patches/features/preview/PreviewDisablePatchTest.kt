package dev.utaa.linimal.patches.features.preview

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableAnnotation
import com.android.tools.smali.dexlib2.immutable.ImmutableAnnotationElement
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

class PreviewDisablePatchTest {
    private fun metadata(c: String, m: String) = ImmutableAnnotation(
        1,
        "Ldt8/f;",
        setOf(
            ImmutableAnnotationElement("c", ImmutableStringEncodedValue(c)),
            ImmutableAnnotationElement("m", ImmutableStringEncodedValue(m)),
        ),
    )

    @Test
    fun `resolvePlan continuation is identified by debug metadata`() {
        val availability = "com.linecorp.line.chattab.ChatScrollPreviewAvailability"
        assertTrue(isResolvePlanMetadata(listOf(metadata(availability, "resolvePlan"))))
        assertFalse(isResolvePlanMetadata(listOf(metadata(availability, "other"))))
        assertFalse(isResolvePlanMetadata(listOf(metadata("com.example.Other", "resolvePlan"))))
    }

    private val resolvePlan = ImmutableMethodReference("Lowner;", "c", listOf("Ldt8/d;"), "Ljava/lang/Enum;")
    private val availability = ImmutableMethodReference("Lowner;", "a", emptyList(), "Z")

    private fun invoke(ref: ImmutableMethodReference, count: Int = 1): Instruction =
        ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, count, 0, 1, 0, 0, 0, ref)

    @Test
    fun `continuation must call exactly one resolvePlan`() {
        assertEquals(resolvePlan, resolvePlanCall(listOf(invoke(resolvePlan, 2))))
        assertNull(resolvePlanCall(listOf(invoke(resolvePlan, 2), invoke(resolvePlan, 2))))
        assertNull(resolvePlanCall(emptyList()))
    }

    @Test
    fun `resolvePlan must call exactly one owner boolean method`() {
        assertEquals("a", availabilityCallName(listOf(invoke(availability)), "Lowner;"))
        assertNull(availabilityCallName(listOf(invoke(availability)), "Lother;"))
        assertNull(availabilityCallName(listOf(invoke(availability), invoke(availability)), "Lowner;"))
        val other = ImmutableMethodReference("Lowner;", "x", emptyList(), "Z")
        assertNull(availabilityCallName(listOf(invoke(availability), invoke(other)), "Lowner;"))
    }

    private val field = ImmutableFieldReference("Lowner;", "c", "Lflag;")

    // 参照を読んだあと boolean を返す、verifier を通る形の元メソッド。
    private fun firstRead(dst: Int, src: Int): List<Instruction> = listOf(
        ImmutableInstruction22c(Opcode.IGET_OBJECT, dst, src, field),
        ImmutableInstruction11n(Opcode.CONST_4, dst, 0),
        ImmutableInstruction11x(Opcode.RETURN, dst),
    )

    @Test
    fun `first local overwritten from this is used for early return`() {
        // registers=5, ins=1 なので p0 は v4。
        assertEquals(0, availabilityInjectionRegister(firstRead(0, 4), registerCount = 5, insCount = 1))
    }

    @Test
    fun `parameter register, other receiver, and non-local registers are rejected`() {
        assertNull(availabilityInjectionRegister(firstRead(4, 4), registerCount = 5, insCount = 1))
        assertNull(availabilityInjectionRegister(firstRead(0, 3), registerCount = 5, insCount = 1))
        // registers=7, ins=2 なら p0=v5、p1=v6。p1 への書き込みは local ではない。
        assertNull(availabilityInjectionRegister(firstRead(6, 5), registerCount = 7, insCount = 2))
        val notRead = listOf(ImmutableInstruction11x(Opcode.RETURN, 0))
        assertNull(availabilityInjectionRegister(notRead, registerCount = 5, insCount = 1))
    }

    @Test
    fun `early return branches to the original first instruction`() {
        val original = ImmutableMethod(
            "Lowner;", "a", emptyList(), "Z",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null,
            ImmutableMethodImplementation(5, firstRead(0, 4), emptyList(), emptyList()),
        )
        val method = MutableMethod(original)
        injectPreviewDisable(method, 0)

        val code = method.implementation!!.instructions.toList()
        assertEquals(
            listOf(
                Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN,
                Opcode.IGET_OBJECT, Opcode.CONST_4, Opcode.RETURN,
            ),
            code.map { it.opcode },
        )
        val hook = (code[0] as ReferenceInstruction).reference as MethodReference
        assertEquals("Ldev/utaa/linimal/extension/features/PreviewDisableHooks;", hook.definingClass)
        assertEquals("shouldDisablePreview", hook.name)
        assertEquals(0, (code[1] as OneRegisterInstruction).registerA)
        // OFF のときは元の先頭命令（iget-object v0, v4）へ進み、公式の判定をそのまま実行します。
        assertEquals(code[5], (code[2] as BuilderOffsetInstruction).target.location.instruction)
        val originalRead = code[5] as com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
        assertEquals(0, originalRead.registerA)
        assertEquals(4, originalRead.registerB)
        assertEquals(5, method.implementation!!.registerCount)
    }
}
