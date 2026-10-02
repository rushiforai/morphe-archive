package app.ckzombies.patches.screen

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

class ScreenFitPatchTest {
    private val screenFit = "Lapp/ckzombies/extension/ScreenFit;"

    private fun method(name: String, params: List<String>, registers: Int, smali: String): MutableMethod =
        ImmutableMethod(
            PLATFORM_ACTIVITY, name, params.map { ImmutableMethodParameter(it, null, null) }, "V",
            AccessFlags.PRIVATE.value, null, null, MutableMethodImplementation(registers),
        ).toMutable().apply { addInstructionsWithLabels(0, smali) }

    // Glu's touchBegan has 6 locals: this is v6, x v7, y v8 and the pointer id v9.
    private fun touch(name: String = "touchBegan", registers: Int = 10, smali: String = BEGAN) =
        method(name, listOf("I", "I", "I"), registers, smali)

    // Glu's iOnResDLDone has 25 locals, so this is v25; the view is built in v3.
    private fun build(smali: String = BUILD) = method("iOnResDLDone", emptyList(), 26, smali)

    private fun Instruction.call() = ((this as ReferenceInstruction).reference as MethodReference)
        .let { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
    private fun Instruction.argument() = (this as FiveRegisterInstruction).registerC
    private fun Instruction.result() = (this as OneRegisterInstruction).registerA
    private fun MutableMethod.code() = implementation!!.instructions.toList()

    // attachToMainView

    @Test
    fun `the view goes to ScreenFit right after it is stored, before it is added to the layout`() {
        val method = build()
        attachToMainView(method)
        val code = method.code()
        val store = code.indexOfFirst { it.opcode == Opcode.IPUT_OBJECT }
        assertEquals("$screenFit->attach(Landroid/view/SurfaceView;)V", code[store + 1].call())
        assertEquals(3, code[store + 1].argument(), "the register the view was built in")
        assertEquals(Opcode.INVOKE_VIRTUAL, code[store + 2].opcode, "Glu's addView follows")
        assertEquals(BUILD.trim().lines().size + 1, code.size, "nothing else changes")
    }

    @Test
    fun `an iOnResDLDone that stores no view, or two, is refused`() {
        val store = "iput-object v3, v0, $PLATFORM_ACTIVITY->m_MainView:Lcom/glu/platform/android/GluMainView;"
        assertFailsWith<PatchException> { attachToMainView(build(BUILD.replace(store, "nop"))) }
        assertFailsWith<PatchException> { attachToMainView(build(BUILD.replace(store, "$store\n$store"))) }
    }

    // scaleTouch

    @Test
    fun `a touch method scales its x and y in place before anything else`() {
        for (name in TOUCH_METHODS) {
            val method = touch(name)
            val before = method.code()
            scaleTouch(method)
            val code = method.code()
            assertEquals(
                listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT),
                code.take(4).map { it.opcode },
            )
            assertEquals("$screenFit->x(I)I", code[0].call())
            assertEquals(listOf(7, 7), listOf(code[0].argument(), code[1].result()), "x is p1")
            assertEquals("$screenFit->y(I)I", code[2].call())
            assertEquals(listOf(8, 8), listOf(code[2].argument(), code[3].result()), "y is p2")
            assertEquals(before, code.drop(4), "$name: Glu's own body follows unchanged")
        }
    }

    @Test
    fun `a touch method whose y is out of reach is refused`() {
        scaleTouch(touch(registers = 17, smali = "return-void")) // y in v15
        assertFailsWith<PatchException> { scaleTouch(touch(registers = 18, smali = "return-void")) }
    }

    // scaleMoveThreshold

    @Test
    fun `the drag threshold passes through ScreenFit between the read and the store`() {
        val method = touch()
        scaleMoveThreshold(method)
        val code = method.code()
        val read = code.indexOfFirst { it.opcode == Opcode.IGET }
        assertEquals("$screenFit->threshold(I)I", code[read + 1].call())
        assertEquals(listOf(1, 1), listOf(code[read + 1].argument(), code[read + 2].result()))
        assertEquals(Opcode.IPUT, code[read + 3].opcode, "the store into the tracker follows")
        assertEquals(BEGAN.trim().lines().size + 2, code.size, "nothing else changes")
    }

    @Test
    fun `both edits of touchBegan apply together in either order`() {
        val one = touch().also { scaleMoveThreshold(it); scaleTouch(it) }
        val other = touch().also { scaleTouch(it); scaleMoveThreshold(it) }
        assertEquals(one.code().map { it.opcode }, other.code().map { it.opcode })
        assertEquals(3, one.code().count { it.opcode == Opcode.INVOKE_STATIC })
    }

    @Test
    fun `a touchBegan that does not store the threshold straight away is refused`() {
        val store = "iput v1, v0, $TRACKER->m_MoveThreshold:I"
        assertFailsWith<PatchException> { scaleMoveThreshold(touch(smali = BEGAN.replace(store, "nop\n$store"))) }
        assertFailsWith<PatchException> { scaleMoveThreshold(touch(smali = BEGAN.replace(store, "iput v2, v0, $TRACKER->m_MoveThreshold:I"))) }
        assertFailsWith<PatchException> { scaleMoveThreshold(touch(smali = "return-void")) }
    }

    private companion object {
        const val TRACKER = "Lcom/glu/platform/android/GluPlatformActivity\$TouchTracker;"

        const val BEGAN = """
            const/4 v5, 0x1
            iput p1, v0, $TRACKER->m_X:I
            iput p2, v0, $TRACKER->m_Y:I
            iget v1, p0, $PLATFORM_ACTIVITY->TOUCH_MOVE_THRESHOLD:I
            iput v1, v0, $TRACKER->m_MoveThreshold:I
            return-void
        """

        const val BUILD = """
            new-instance v3, Lcom/glu/platform/android/GluMainView;
            move-object/from16 v0, p0
            iput-object v3, v0, $PLATFORM_ACTIVITY->m_MainView:Lcom/glu/platform/android/GluMainView;
            invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V
            return-void
        """
    }
}
