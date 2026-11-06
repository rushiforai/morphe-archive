package dev.twitchpatches.patches.twitch.ads

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.*
import org.junit.Test

class ChannelSkinHooksTest {
    @Test fun bannerKeepsAllOriginalArgumentsBeforeFilteringPresentation() {
        verifyCapture(listOf(Any(), Any(), Any(), Any(), Any()))
    }

    @Test fun headerKeepsOriginalSponsorshipStateAndNullableMetadataForRestoration() {
        verifyCapture(listOf(Any(), Any(), null, Any()))
    }

    private fun verifyCapture(arguments: List<Any?>) {
        val original = ImmutableMethod("Lsynthetic/SkinView;", "render",
            arguments.map { ImmutableMethodParameter("Ljava/lang/Object;", null, null) }, "V",
            AccessFlags.PUBLIC.value, null, null, null)
        val wrapper = channelSkinCapture(original)
        val code = requireNotNull(wrapper.implementation)
        val owner = Any()
        val parameterStart = code.registerCount - arguments.size - 1
        val objects = mutableMapOf<Int, Any?>(parameterStart to owner)
        arguments.forEachIndexed { index, value -> objects[parameterStart + index + 1] = value }
        val numbers = mutableMapOf<Int, Int>()
        val arrays = mutableMapOf<Int, MutableList<Any?>>()
        var saved: List<Any?>? = null
        var renders = 0
        for (instruction in code.instructions) {
            when (instruction.opcode) {
                Opcode.CONST_4 -> numbers[(instruction as OneRegisterInstruction).registerA] =
                    (instruction as NarrowLiteralInstruction).narrowLiteral
                Opcode.NEW_ARRAY -> {
                    val registers = instruction as TwoRegisterInstruction
                    arrays[registers.registerA] = MutableList(numbers.getValue(registers.registerB)) { null }
                }
                Opcode.APUT_OBJECT -> {
                    val registers = instruction as ThreeRegisterInstruction
                    arrays.getValue(registers.registerB)[numbers.getValue(registers.registerC)] = objects[registers.registerA]
                }
                Opcode.IPUT_OBJECT -> {
                    val registers = instruction as TwoRegisterInstruction
                    assertSame(owner, objects[registers.registerB])
                    saved = arrays.getValue(registers.registerA).toList()
                }
                Opcode.INVOKE_STATIC -> {
                    val registers = instruction as FiveRegisterInstruction
                    assertEquals(1, registers.registerCount)
                    assertSame(owner, objects[registers.registerC])
                    assertTrue((instruction as ReferenceInstruction).reference.toString().endsWith("->capture(Ljava/lang/Object;)V"))
                    assertNotNull("Arguments must be saved before applying the display policy", saved)
                    renders++
                }
                Opcode.RETURN_VOID -> Unit
                else -> fail("Unexpected capture instruction: ${instruction.opcode}")
            }
        }
        assertEquals(1, renders)
        val savedArguments = requireNotNull(saved)
        assertEquals(arguments.size, savedArguments.size)
        arguments.forEachIndexed { index, value -> assertSame(value, savedArguments[index]) }
    }
}
