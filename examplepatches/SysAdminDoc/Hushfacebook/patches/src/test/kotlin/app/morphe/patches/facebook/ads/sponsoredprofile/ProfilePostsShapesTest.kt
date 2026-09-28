/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredprofile

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The parts of Hide sponsored profile posts that need no Facebook build: which method is the
 * timeline story render, which field holds the unit, and the code the hook puts first in the
 * render method.
 */
class ProfilePostsShapesTest {
    private val component = "Lfixture/TimelineStory;"
    private val unitType = "Lfixture/FeedUnit;"
    private val context = "Lfixture/ComponentContext;"
    private val result = "Lfixture/Component;"

    private fun render(
        registers: Int = 8,
        static: Boolean = false,
        returnType: String = result,
        literals: List<String> = listOf(COMPONENT_NAME, ORGANIC_TEST_KEY, SPONSORED_TEST_KEY),
        readsUnit: Boolean = true,
    ): MutableMethod = MutableMethod(
        ImmutableMethod(
            component,
            "A1F",
            listOf(ImmutableMethodParameter(context, null, null)),
            returnType,
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or (if (static) AccessFlags.STATIC.value else 0),
            null,
            null,
            ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply {
        addInstructionsWithLabels(0, buildString {
            if (readsUnit) appendLine("iget-object v0, p0, $component->A03:$unitType")
            literals.forEach { appendLine("const-string v1, \"$it\"") }
            appendLine("const/4 v0, 0x0")
            appendLine(if (returnType == "V") "return-void" else "return-object v0")
        })
    }

    private fun field(name: String, type: String, static: Boolean = false) =
        ImmutableField(component, name, type, AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0), null, null, null)

    @Test
    fun `the render method holds both test tags and the component's name, and answers an object`() {
        assertTrue(isTimelineStoryRender(render()))
        // Negative controls: the organic tag or the name missing, static, and void.
        assertFalse(isTimelineStoryRender(render(literals = listOf(COMPONENT_NAME, SPONSORED_TEST_KEY))))
        assertFalse(isTimelineStoryRender(render(literals = listOf(ORGANIC_TEST_KEY, SPONSORED_TEST_KEY))))
        assertFalse(isTimelineStoryRender(render(static = true)))
        assertFalse(isTimelineStoryRender(render(returnType = "V")))
    }

    @Test
    fun `the unit field is the one instance field typed as an interface of GraphQLStory`() {
        val story = setOf(unitType, "Lfixture/Sponsorable;")
        val unit = field("A03", unitType)
        val owner = ImmutableClassDef(component, AccessFlags.PUBLIC.value, "Lfixture/Component;", null, null, null,
            listOf(field("A00", "I"), field("A01", "Lcom/facebook/auth/usersession/FbUserSession;"), unit,
                field("A09", unitType, static = true)), emptyList())
        assertEquals(listOf("A03"), unitFields(owner, story).map { it.name })
        // Two such fields is no one field.
        val twice = ImmutableClassDef(component, AccessFlags.PUBLIC.value, "Lfixture/Component;", null, null, null,
            listOf(unit, field("A04", "Lfixture/Sponsorable;")), emptyList())
        assertEquals(2, unitFields(twice, story).size)
        assertTrue(readsField(render(), unit))
        assertFalse(readsField(render(readsUnit = false), unit))
    }

    private fun MutableMethod.body(): List<Instruction> = implementation!!.instructions.toList()

    @Test
    fun `the render method asks the extension first and answers no component for an ad`() {
        val method = render()
        val own = method.body()
        method.skipSponsoredStories(field("A03", unitType))
        val body = method.body()
        // this is v6 of 8 registers: copied down into v0, which the unit is read into.
        val self = body[0] as TwoRegisterInstruction
        assertEquals(listOf(Opcode.MOVE_OBJECT_FROM16, 0, 6), listOf(body[0].opcode, self.registerA, self.registerB))
        assertEquals(Opcode.IGET_OBJECT, body[1].opcode)
        val read = body[1] as TwoRegisterInstruction
        assertEquals(listOf(0, 0), listOf(read.registerA, read.registerB))
        assertEquals("A03", ((body[1] as ReferenceInstruction).reference as FieldReference).name)
        val hook = (body[2] as ReferenceInstruction).reference as MethodReference
        assertEquals(HIDE, "${hook.definingClass}->${hook.name}(${hook.parameterTypes.joinToString("")})${hook.returnType}")
        assertEquals(Opcode.MOVE_RESULT, body[3].opcode)
        assertEquals(Opcode.IF_EQZ, body[4].opcode)
        assertEquals(Opcode.CONST_4, body[5].opcode)
        assertEquals("no component is null", 0, (body[5] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN_OBJECT, body[6].opcode)
        assertEquals(0, (body[6] as OneRegisterInstruction).registerA)
        // The branch lands on the render method's own first instruction, so none of it is skipped.
        assertEquals(own.size + 7, body.size)
        assertEquals(own.first().opcode, body[7].opcode)
        assertEquals(7, offsetTarget(body, 4))
    }

    @Test
    fun `a render method with no local, or a field of another class, stops the patch`() {
        val tight = render(registers = 2)
        val refusal = assertThrows(PatchException::class.java) { tight.skipSponsoredStories(field("A03", unitType)) }
        assertTrue(refusal.message, refusal.message!!.contains(PATCH))
        val other = ImmutableField("Lfixture/Other;", "A03", unitType, AccessFlags.PUBLIC.value, null, null, null)
        assertThrows(PatchException::class.java) { render().skipSponsoredStories(other) }
    }

    /** The instruction index a branch at [index] lands on. */
    private fun offsetTarget(instructions: List<Instruction>, index: Int): Int {
        val branch = instructions[index] as OffsetInstruction
        var address = 0
        val addresses = instructions.map { val at = address; address += it.codeUnits; at }
        return addresses.indexOf(addresses[index] + branch.codeOffset)
    }
}
