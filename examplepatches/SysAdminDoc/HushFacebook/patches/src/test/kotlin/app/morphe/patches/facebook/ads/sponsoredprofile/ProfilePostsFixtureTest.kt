/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredprofile

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.GRAPHQL_STORY
import app.morphe.patches.facebook.feed.treeFieldKey
import app.morphe.patches.facebook.feed.treeTypeTag
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The anchors of Hide sponsored profile posts on every declared Facebook build, found the way the
 * patch finds them: one method holding the sponsored timeline tag, the timeline story component's
 * render method, which asks GraphQLStory's one sponsored_data accessor and reads the unit from one
 * field typed as GraphQLStory's first interface. The hook then goes first in it with v0.
 */
class ProfilePostsFixtureTest {
    /** Registers of the render method, per build: `this` sits in the one before its last. */
    private val expected = mapOf(
        AppCompatibilities.FACEBOOK_TARGET_VERSION to 35,
        AppCompatibilities.FACEBOOK_PREVIOUS_VERSION to 35,
    )

    private fun locals(method: Method): Int = method.implementation!!.registerCount - 1 - method.parameterTypes.size

    private fun literal(method: Method, value: Int) =
        method.implementation!!.instructions.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == value }

    @Test
    fun `each declared build has one timeline story render method reading sponsored_data`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertEquals("the declared builds", expected.keys, versions)
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val holders = FixtureDex.classesHolding(bundle, SPONSORED_TEST_KEY)
                assertEquals("${bundle.name}: classes holding the sponsored timeline tag", 1, holders.size)
                val component = holders.single()
                assertEquals("${bundle.name}: render methods", 1, component.methods.count(::isTimelineStoryRender))
                val story = FixtureDex.classes(bundle, setOf(GRAPHQL_STORY)).getValue(GRAPHQL_STORY)

                val context = PatchContexts.of(listOf(component, story))
                val found = with(context) { timelineStory() }
                assertEquals("${bundle.name}: the component", component.type, found.render.definingClass)
                // The unit field is typed as the first interface GraphQLStory declares.
                assertEquals("${bundle.name}: the unit field's type", story.interfaces.first(), found.unit.type)
                assertTrue(
                    "${bundle.name}: the accessor loads sponsored_data as SponsoredData",
                    literal(found.sponsoredData, treeFieldKey(SPONSORED_DATA_FIELD)) &&
                        literal(found.sponsoredData, treeTypeTag(SPONSORED_DATA_TYPE)),
                )
                assertEquals(0x1456568f, treeTypeTag(SPONSORED_DATA_TYPE))

                val render = with(context) { mutableClassDefBy(component.type) }.methods.single {
                    it.name == found.render.name && it.parameterTypes.size == found.render.parameterTypes.size &&
                        !AccessFlags.STATIC.isSet(it.accessFlags) && isTimelineStoryRender(it)
                }
                val registers = expected.getValue(version)
                assertEquals("${bundle.name}: render registers", registers, render.implementation!!.registerCount)
                assertTrue("${bundle.name}: the render method has no local", locals(render) >= 1)
                val first = render.implementation!!.instructions.first().opcode
                render.skipSponsoredStories(found.unit)

                val body = render.implementation!!.instructions.toList()
                val self = body[0] as TwoRegisterInstruction
                assertEquals(listOf(Opcode.MOVE_OBJECT_FROM16, 0, registers - 2), listOf(body[0].opcode, self.registerA, self.registerB))
                val read = (body[1] as ReferenceInstruction).reference as FieldReference
                assertEquals(found.unit.name, read.name)
                assertEquals(Opcode.IGET_OBJECT, body[1].opcode)
                val hook = (body[2] as ReferenceInstruction).reference as MethodReference
                assertEquals(HIDE, "${hook.definingClass}->${hook.name}(${hook.parameterTypes.joinToString("")})${hook.returnType}")
                assertEquals(Opcode.MOVE_RESULT, body[3].opcode)
                assertEquals(Opcode.IF_EQZ, body[4].opcode)
                assertEquals(Opcode.RETURN_OBJECT, body[6].opcode)
                assertEquals(0, (body[6] as OneRegisterInstruction).registerA)
                assertEquals("${bundle.name}: the render method's own code follows", first, body[7].opcode)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
