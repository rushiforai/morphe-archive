/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.suggested.GROUPS_YOU_SHOULD_JOIN_TYPE
import app.morphe.patches.facebook.feed.suggested.PEOPLE_YOU_MAY_KNOW_TYPE
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The suggested groups type name, found in the Facebook builds the bundle declares the way the
 * "Hide suggested and promoted posts" patch finds it.
 *
 * Every declared build has to carry exactly one `getTypeName()` with a case for the tag of
 * "GroupsYouShouldJoinFeedUnit", on the model that answers People you may know, and that case has
 * to answer the name through its string table. The same model's friend requests case is the
 * control: same table, another answer. No `getTypeName()` holds the name as a literal of its own,
 * which is why the patch reads the tag's case. Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class SuggestedGroupsFixtureTest {
    private val friends = "FriendRequestsFeedUnit"

    private fun isTypeName(method: Method) =
        method.name == "getTypeName" && method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/String;"

    private fun switchesOn(method: Method, tag: Int) = method.implementation?.instructions?.any { payload ->
        payload is SwitchPayload && payload.switchElements.any { it.key == tag }
    } == true

    @Test
    fun `every declared build answers the suggested groups tag once, on the People you may know model`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val groupsTag = treeTypeTag(GROUPS_YOU_SHOULD_JOIN_TYPE)
        val checked = mutableMapOf<String, String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val tagged = mutableListOf<Method>()
                val literal = mutableListOf<Method>()
                FixtureDex.methodsWhere(bundle, { true }) { method ->
                    if (!isTypeName(method)) return@methodsWhere false
                    if (holdsString(method, GROUPS_YOU_SHOULD_JOIN_TYPE)) literal += method
                    switchesOn(method, groupsTag)
                }.let(tagged::addAll)
                assertEquals("${bundle.name}: getTypeName() methods holding the name as a literal", emptyList<Method>(), literal)
                assertEquals("${bundle.name}: getTypeName() methods with a case for $GROUPS_YOU_SHOULD_JOIN_TYPE",
                    1, tagged.size)
                val model = tagged.single()
                assertTrue("${bundle.name}: ${model.definingClass} isn't the People you may know model",
                    holdsString(model, PEOPLE_YOU_MAY_KNOW_TYPE))

                val tables = model.implementation!!.instructions.mapNotNull { instruction ->
                    if (instruction.opcode != Opcode.INVOKE_STATIC) return@mapNotNull null
                    (instruction as? ReferenceInstruction)?.reference as? MethodReference
                }.toSet()
                assertEquals("${bundle.name}: the string tables ${model.definingClass} asks", 1, tables.size)
                val owners = FixtureDex.classes(bundle, tables.map { it.definingClass }.toSet())
                val resolve = { call: MethodReference -> owners[call.definingClass]?.let { resolveStatic(it, call) } }

                assertTrue("${bundle.name}: ${model.definingClass} doesn't answer $GROUPS_YOU_SHOULD_JOIN_TYPE",
                    answersTaggedTypeName(model, GROUPS_YOU_SHOULD_JOIN_TYPE, resolve))
                // The control: the same table, asked for the friend requests tag, answers that name.
                val control = taggedTypeName(model, treeTypeTag(friends), resolve)
                assertEquals("${bundle.name}: the friend requests case", friends, control)
                assertNotEquals(GROUPS_YOU_SHOULD_JOIN_TYPE, control)
                checked[version] = "${model.definingClass}->getTypeName via ${tables.single()}"
            }
        }
        assertEquals("a declared build went unchecked: $checked", versions.toSet(), checked.keys)
    }
}
