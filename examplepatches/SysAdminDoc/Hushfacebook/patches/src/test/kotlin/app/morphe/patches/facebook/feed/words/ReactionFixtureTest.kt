/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.words

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.BASE_MODEL_WITH_TREE
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.GRAPHQL_STORY
import app.morphe.patches.facebook.feed.TREE_JNI
import app.morphe.patches.facebook.feed.aidetected.GRAPHQL_STORY_ATTACHMENT
import app.morphe.patches.facebook.feed.treeFieldKey
import app.morphe.patches.facebook.feed.treeTypeTag
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The reaction ceiling's two accessors on every declared Facebook build, found the way Hide posts by
 * words finds them: GraphQLStory's one accessor of `feedback` as Feedback, answering the kept class
 * GraphQLFeedback, and that class's one accessor of `reactors`. BaseModelWithTree must have the
 * public `getCachedInt(int)` the count is read with. The patch is then run on each build's classes
 * and the extension's stubs, and each stub has to call the accessor found with the object it was
 * handed. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class ReactionFixtureTest {
    private val kept = setOf(
        GRAPHQL_STORY, GRAPHQL_STORY_ATTACHMENT, GRAPHQL_TEXT_WITH_ENTITIES, GRAPHQL_FEEDBACK, BASE_MODEL_WITH_TREE, TREE_JNI,
    )

    @Test
    fun `the schema keys are the ones read from the builds`() {
        assertEquals(-191501435, treeFieldKey(FEEDBACK_FIELD))
        assertEquals(-867503855, treeFieldKey(REACTORS_FIELD))
        assertEquals(94851343, treeFieldKey(COUNT_FIELD))
        assertEquals(-1096498488, treeTypeTag(FEEDBACK_TYPE))
    }

    @Test
    fun `every declared build has one feedback and one reactors accessor, and the patch fills both stubs`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableMapOf<String, String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val classes = FixtureDex.classes(bundle, kept)
                fun kept(type: String): ClassDef = classes[type] ?: throw AssertionError("${bundle.name} has no $type")
                val story = kept(GRAPHQL_STORY)

                val feedbacks = feedbackAccessors(story)
                assertEquals("${bundle.name}: ${feedbacks.map { it.name }}", 1, feedbacks.size)
                val feedback = feedbacks.single()
                val reactorLists = reactorsAccessors(kept(GRAPHQL_FEEDBACK))
                assertEquals("${bundle.name}: ${reactorLists.map { it.name }}", 1, reactorLists.size)
                val reactors = reactorLists.single()
                assertTrue("${bundle.name}: no public getCachedInt(int)", hasPublicIntReader(kept(BASE_MODEL_WITH_TREE)))

                // Facebook's own reading of the count agrees: a static helper taking a GraphQLFeedback calls the
                // reactors accessor, loads the key of `count` and reads it with getCachedInt. Found by that shape.
                val helpers = FixtureDex.methodsWhere(bundle, { dex -> dex.stringSection.any { it == GRAPHQL_FEEDBACK } }) { method ->
                    readsReactorCount(method, reactors)
                }
                assertTrue("${bundle.name}: no helper reads the count the way the extension does", helpers.isNotEmpty())

                // The patch needs the helpers toString reads the message with, as Hide posts by words' own test loads them.
                val message = messageAccessors(story).single()
                val toString = storyToString(story) ?: throw AssertionError("${bundle.name}: GraphQLStory has no toString()")
                val readers = FixtureDex.classes(bundle, messageTextReaders(toString, message).map { it.definingClass }.toSet())

                val context = PatchContexts.of(
                    classes.values + readers.values + ExtensionDex.classDef(POST_TEXT) + ExtensionDex.classDef(POST_SOURCES) +
                        ExtensionDex.classDef(POST_TYPES) + ExtensionDex.classDef(POST_REACTIONS) +
                        ExtensionDex.classDef(SETTINGS_STATUS),
                )
                hidePostsByWordsPatch.execute(context)
                for ((stub, accessor) in listOf(FEEDBACK_STUB to feedback, REACTORS_STUB to reactors)) {
                    val stubMethod = context.mutableClassDefBy(POST_REACTIONS).methods.single { it.name == stub }
                    val body = stubMethod.implementation!!.instructions.toList()
                    assertEquals("${bundle.name}: $stub's first instruction", Opcode.CHECK_CAST, body[0].opcode)
                    val call = (body[1] as ReferenceInstruction).reference as MethodReference
                    assertEquals(
                        "${bundle.name}: what $stub calls", describe(accessor),
                        "${call.definingClass}->${call.name}(${call.parameterTypes.joinToString("")})${call.returnType}",
                    )
                    val parameter = stubMethod.implementation!!.registerCount - 1
                    assertEquals(
                        "${bundle.name}: $stub calls the accessor on what it was handed", parameter,
                        (body[1] as Instruction35c).registerC,
                    )
                    assertEquals(Opcode.RETURN_OBJECT, body[3].opcode)
                }

                checked[version] = "${feedback.name}() then ${reactors.name}()"
            }
        }
        assertEquals("a declared build went unchecked: $checked", versions, checked.keys)
    }

    /** Whether [method] is a static (GraphQLFeedback)I that calls [reactors], loads the count key and calls getCachedInt. */
    private fun readsReactorCount(method: Method, reactors: Method): Boolean {
        if (method.parameterTypes.map { it.toString() } != listOf(GRAPHQL_FEEDBACK) || method.returnType != "I") return false
        val body = method.implementation?.instructions?.toList().orEmpty()
        val calls = body.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        return calls.any {
            it.definingClass == GRAPHQL_FEEDBACK && it.name == reactors.name && it.returnType == reactors.returnType &&
                it.parameterTypes.isEmpty()
        } && body.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == treeFieldKey(COUNT_FIELD) } &&
            calls.any {
                it.definingClass == BASE_MODEL_WITH_TREE && it.name == "getCachedInt" &&
                    it.parameterTypes.map { type -> type.toString() } == listOf("I") && it.returnType == "I"
            }
    }

    private fun describe(method: Method) =
        "${method.definingClass}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}"
}
