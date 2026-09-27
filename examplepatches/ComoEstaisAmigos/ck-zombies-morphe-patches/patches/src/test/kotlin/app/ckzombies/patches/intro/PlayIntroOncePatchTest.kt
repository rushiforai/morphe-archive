package app.ckzombies.patches.intro

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
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
import kotlin.test.assertSame

class PlayIntroOncePatchTest {
    private val intro = "Lapp/ckzombies/extension/IntroOnce;"

    /** A method of GluMovieActivity whose body is [body], with [registers] registers in all. */
    private fun method(
        name: String,
        registers: Int,
        vararg body: BuilderInstruction,
        params: List<String> = emptyList(),
    ): MutableMethod = ImmutableMethod(
        MOVIE_ACTIVITY, name, params.map { ImmutableMethodParameter(it, null, null) }, "V",
        AccessFlags.PUBLIC.value, null, null,
        MutableMethodImplementation(registers).apply { body.forEach { addInstruction(it) } },
    ).toMutable()

    // Glu's onCreate has six registers, so this is v4 and the Bundle v5; it ends storing an
    // extra into a field, then returns.
    private fun onCreate(registers: Int = 6, vararg body: BuilderInstruction = arrayOf(
        BuilderInstruction11n(Opcode.CONST_4, 0, 0),
        BuilderInstruction10x(Opcode.RETURN_VOID),
    )) = method("onCreate", registers, *body, params = listOf("Landroid/os/Bundle;"))

    private fun finish() = method(
        "finishMovieActivity", 3,
        BuilderInstruction11n(Opcode.CONST_4, 0, 0),
        BuilderInstruction10x(Opcode.RETURN_VOID),
    )

    private fun Instruction.call() = (this as ReferenceInstruction).reference as MethodReference
    private fun MethodReference.text() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    @Test
    fun `onCreate asks the extension last and finishes when the intro was seen`() {
        val onCreate = onCreate()
        val returnVoid = onCreate.implementation!!.instructions.last()
        playIntroOnce(onCreate, finish())

        val code = onCreate.implementation!!.instructions.toList()
        assertEquals(
            listOf(
                Opcode.CONST_4, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
                Opcode.INVOKE_DIRECT, Opcode.RETURN_VOID,
            ),
            code.map { it.opcode },
        )
        assertEquals("$intro->skip(Landroid/content/Context;)Z", code[1].call().text())
        assertEquals(4, (code[1] as FiveRegisterInstruction).registerC, "skip() is given this")
        assertEquals(0, (code[2] as OneRegisterInstruction).registerA)
        assertEquals(0, (code[3] as OneRegisterInstruction).registerA, "the branch tests the answer")
        // Not seen: jump straight to Glu's own return. Seen: finish, then fall into that return.
        assertSame(returnVoid, (code[3] as BuilderOffsetInstruction).target.location.instruction)
        assertEquals("$MOVIE_ACTIVITY->finishMovieActivity()V", code[4].call().text())
        assertEquals(4, (code[4] as FiveRegisterInstruction).registerC)
        assertSame(returnVoid, code[5])
    }

    @Test
    fun `finishMovieActivity marks the intro seen before anything else`() {
        val finish = finish()
        val original = finish.implementation!!.instructions.toList()
        playIntroOnce(onCreate(), finish)

        val code = finish.implementation!!.instructions.toList()
        assertEquals(Opcode.INVOKE_STATIC, code[0].opcode)
        assertEquals("$intro->markSeen(Landroid/content/Context;)V", code[0].call().text())
        assertEquals(2, (code[0] as FiveRegisterInstruction).registerC, "markSeen() is given this")
        assertEquals(original, code.drop(1), "Glu's own body follows unchanged")
    }

    @Test
    fun `an onCreate that does not end in return-void is refused`() {
        val odd = onCreate(6, BuilderInstruction10x(Opcode.RETURN_VOID), BuilderInstruction10x(Opcode.NOP))
        assertFailsWith<PatchException> { playIntroOnce(odd, finish()) }
    }

    @Test
    fun `an onCreate without a local register is refused`() {
        val tight = onCreate(2, BuilderInstruction10x(Opcode.RETURN_VOID))
        assertFailsWith<PatchException> { playIntroOnce(tight, finish()) }
    }
}
