/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.junit.Assert.assertEquals
import org.junit.Test

/**
 * The reads of a colour resource, sent to the extension so light mode can have back what route two
 * wrote black over (the Video tab's bottom bar), and route two's table of what each black stands for.
 */
class ColourCallRerouteTest {
    private val theme = "Landroid/content/res/Resources\$Theme;"

    private fun method(registers: Int, smali: String): MutableMethod = MutableMethod(
        ImmutableMethod(
            "Lfixture/Bar;", "colours", emptyList(), "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, smali) }

    private fun MutableMethod.body(): List<Instruction> = implementation!!.instructions.toList()

    /** Each call's opcode, target and registers. */
    private fun MutableMethod.calls(): List<Triple<Opcode, String, List<Int>>> = body().mapNotNull { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference?.toString() ?: return@mapNotNull null
        val registers = when (instruction) {
            is RegisterRangeInstruction -> (0 until instruction.registerCount).map { instruction.startRegister + it }
            is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD, instruction.registerE)
                .take(instruction.registerCount)
            else -> return@mapNotNull null
        }
        Triple(instruction.opcode, reference, registers)
    }

    private val reads = """
        invoke-virtual { v1, v2 }, $CONTEXT_GET_COLOR
        move-result v0
        invoke-virtual { v3, v2 }, $RESOURCES_GET_COLOR
        move-result v0
        invoke-virtual { v3, v2, v4 }, $RESOURCES_GET_THEMED_COLOR
        move-result v0
        invoke-virtual/range { v4 .. v6 }, $TYPED_ARRAY_GET_COLOR
        move-result v0
        invoke-static { v5 }, $PARSE_COLOR
        move-result v0
        return-void
    """

    @Test
    fun `each read of a colour resource goes to AMOLED's stand-in on the same registers`() {
        val method = method(7, reads)
        val counts = AMOLED_COLOUR_CALLS.keys.associateWith { 0 }.toMutableMap()
        method.rerouteColourCalls(AMOLED_COLOUR_CALLS, counts)

        val amoled = "Lapp/morphe/extension/facebook/theme/AmoledTheme;"
        assertEquals(
            listOf(
                Triple(Opcode.INVOKE_STATIC, "$amoled->getColor(Landroid/content/Context;I)I", listOf(1, 2)),
                Triple(Opcode.INVOKE_STATIC, "$amoled->getColor(Landroid/content/res/Resources;I)I", listOf(3, 2)),
                Triple(Opcode.INVOKE_STATIC, "$amoled->getColor(Landroid/content/res/Resources;I${theme})I", listOf(3, 2, 4)),
                Triple(Opcode.INVOKE_STATIC_RANGE, "$amoled->getColor(Landroid/content/res/TypedArray;II)I", listOf(4, 5, 6)),
                Triple(Opcode.INVOKE_STATIC, PARSE_COLOR_DARK, listOf(5)),
            ),
            method.calls(),
        )
        assertEquals(AMOLED_COLOUR_CALLS.keys.associateWith { 1 }, counts)
    }

    /**
     * Material You takes over AMOLED's stand-ins when AMOLED went first, and the framework's own
     * calls without AMOLED. The theme attribute read stays AMOLED's: Material You leaves Facebook's
     * default colours as they are, so there is nothing for it to give back.
     */
    @Test
    fun `Material You takes over AMOLED's stand-ins, or the framework's calls without AMOLED`() {
        val you = "Lapp/morphe/extension/facebook/theme/MaterialYouTheme;"
        val expected = listOf(
            Triple(Opcode.INVOKE_STATIC, "$you->getColor(Landroid/content/Context;I)I", listOf(1, 2)),
            Triple(Opcode.INVOKE_STATIC, "$you->getColor(Landroid/content/res/Resources;I)I", listOf(3, 2)),
            Triple(Opcode.INVOKE_STATIC, "$you->getColor(Landroid/content/res/Resources;I${theme})I", listOf(3, 2, 4)),
        )
        val parse = Triple(Opcode.INVOKE_STATIC, "$you->parseColor(Ljava/lang/String;)I", listOf(5))

        val both = method(7, reads)
        both.rerouteColourCalls(AMOLED_COLOUR_CALLS, mutableMapOf<String, Int>().withDefault { 0 })
        both.rerouteColourCalls(YOU_COLOUR_CALLS, mutableMapOf<String, Int>().withDefault { 0 })
        val attribute = Triple(Opcode.INVOKE_STATIC_RANGE, AMOLED_COLOUR_CALLS.getValue(TYPED_ARRAY_GET_COLOR), listOf(4, 5, 6))
        assertEquals(expected + attribute + parse, both.calls())

        val alone = method(7, reads)
        alone.rerouteColourCalls(YOU_COLOUR_CALLS, mutableMapOf<String, Int>().withDefault { 0 })
        val untouched = Triple(Opcode.INVOKE_VIRTUAL_RANGE, TYPED_ARRAY_GET_COLOR, listOf(4, 5, 6))
        assertEquals(expected + untouched + parse, alone.calls())
    }

    /**
     * A colour resource read as a drawable, the way Litho draws the feed's composer row (issue #37),
     * goes to Material You's stand-in on the same registers, with AMOLED in the build or not: AMOLED
     * leaves the call alone, since its route two wrote black into the resource itself.
     */
    @Test
    fun `a drawable read goes to Material You's stand-in, and AMOLED leaves it`() {
        val smali = """
            invoke-virtual { v1, v2 }, $CONTEXT_GET_DRAWABLE
            move-result-object v0
            return-void
        """
        val stand = Triple(Opcode.INVOKE_STATIC,
            "Lapp/morphe/extension/facebook/theme/MaterialYouTheme;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;",
            listOf(1, 2))

        val both = method(3, smali)
        val amoled = AMOLED_COLOUR_CALLS.keys.associateWith { 0 }.toMutableMap()
        both.rerouteColourCalls(AMOLED_COLOUR_CALLS, amoled)
        assertEquals(AMOLED_COLOUR_CALLS.keys.associateWith { 0 }, amoled)
        val counts = YOU_COLOUR_CALLS.keys.associateWith { 0 }.toMutableMap()
        both.rerouteColourCalls(YOU_COLOUR_CALLS, counts)
        assertEquals(listOf(stand), both.calls())
        assertEquals(1, counts.getValue(CONTEXT_GET_DRAWABLE))

        val alone = method(3, smali)
        alone.rerouteColourCalls(YOU_COLOUR_CALLS, mutableMapOf<String, Int>().withDefault { 0 })
        assertEquals(listOf(stand), alone.calls())
    }

    /**
     * The controls: a super call inside an override would come back to the override from the
     * extension and never end, and another class's getColor is no colour resource.
     */
    @Test
    fun `a super call and another class's getColor stay as they are`() {
        val smali = """
            invoke-super { v1, v2 }, $CONTEXT_GET_COLOR
            move-result v0
            invoke-virtual { v1, v2 }, Lfixture/Palette;->getColor(I)I
            move-result v0
            return-void
        """
        val method = method(3, smali)
        val before = method.calls()
        val counts = AMOLED_COLOUR_CALLS.keys.associateWith { 0 }.toMutableMap()
        method.rerouteColourCalls(AMOLED_COLOUR_CALLS, counts)
        assertEquals(before, method.calls())
        assertEquals(AMOLED_COLOUR_CALLS.keys.associateWith { 0 }, counts)
    }

    /**
     * Route two's table: what a black it wrote stands for, by resource id. The Video tab's #252728 is
     * in; a colour it also blackened at night is out, since there a black could be the night one; a
     * colour pointing at one that's in is in; black is out, and so is a name with no id.
     */
    @Test
    fun `route two's table holds what each black stands for`() {
        val ids = mapOf("color_0x7f0601f4" to 0x7f0601f4L, "color_0x7f060149" to 0x7f060149L,
            "color_0x7f060002" to 0x7f060002L, "color_0x7f060032" to 0x7f060032L, "color_0x7f060013" to 0x7f060013L)
        val table = routeTwoTable(
            rewritten = mapOf(
                "color_0x7f0601f4" to 0xFF252728.toInt(),
                "color_0x7f060149" to 0xFF080809.toInt(),
                "color_0x7f060002" to 0xFF242526.toInt(),
                "color_0x7f060013" to 0xFF000000.toInt(),
                "unknown" to 0xFF101011.toInt(),
            ),
            rewrittenAtNight = setOf("color_0x7f060002"),
            references = mapOf("color_0x7f060032" to "color_0x7f0601f4", "color_0x7f060099" to "color_0x7f060002"),
        ) { ids[it] }
        assertEquals("7f060032=ff252728;7f060149=ff080809;7f0601f4=ff252728", table)
    }

    /**
     * Facebook strips its colour names, and the patcher's id table only knows the names an APK
     * carries. The decoder names such a colour after its id, which is where route two reads it.
     */
    @Test
    fun `a colour Facebook stripped the name of is found by the name the decoder gives it`() {
        assertEquals(0x7f0601f4L, decodedColourId("color_0x7f0601f4"))
        assertEquals("a name of Facebook's own", null, decodedColourId("fds_surface_background"))
        assertEquals("another type's", null, decodedColourId("dimen_0x7f070012"))
        assertEquals("a partial id", null, decodedColourId("color_0x7f06"))
    }
}
