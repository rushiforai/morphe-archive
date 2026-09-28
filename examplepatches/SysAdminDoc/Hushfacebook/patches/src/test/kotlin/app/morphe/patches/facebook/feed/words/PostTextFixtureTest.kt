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
import app.morphe.patches.facebook.feed.hasPublicTypeTag
import app.morphe.patches.facebook.feed.resolveStatic
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * A post's text accessor on every declared Facebook build, found the way Hide posts by words finds
 * it: GraphQLStory's one accessor of `message` as TextWithEntities, which its own toString labels
 * "message.text" and reads as the field `text` through `getCachedString`, and its one accessor of
 * `attached_story`. The patch is then run on each build's classes and the extension's stubs, and
 * each stub has to call the accessor found. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR
 * and skips without it.
 */
class PostTextFixtureTest {
    private val kept = setOf(GRAPHQL_STORY, GRAPHQL_TEXT_WITH_ENTITIES, BASE_MODEL_WITH_TREE, TREE_JNI)

    /** The static `(BaseModelWithTree)String` helpers [toString] calls, by reference. */
    private fun staticStringReaders(toString: Method): List<MethodReference> =
        toString.implementation!!.instructions.mapNotNull { instruction ->
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
            call.takeIf {
                instruction.opcode == Opcode.INVOKE_STATIC && it.returnType == "Ljava/lang/String;" &&
                    it.parameterTypes.map { type -> type.toString() } == listOf(BASE_MODEL_WITH_TREE)
            }
        }.distinct()

    @Test
    fun `every declared build has one message accessor, the one toString reads as message text`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableMapOf<String, String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val classes = FixtureDex.classes(bundle, kept)
                fun kept(type: String): ClassDef = classes[type] ?: throw AssertionError("${bundle.name} has no $type")
                val story = kept(GRAPHQL_STORY)

                val messages = messageAccessors(story)
                assertEquals("${bundle.name}: ${messages.map { it.name }}", 1, messages.size)
                val message = messages.single()
                assertEquals("${bundle.name}: what the message accessor answers", GRAPHQL_TEXT_WITH_ENTITIES, message.returnType)
                assertTrue("${bundle.name}: GraphQLTextWithEntities doesn't answer $TEXT_WITH_ENTITIES_TYPE",
                    answersTextType(kept(GRAPHQL_TEXT_WITH_ENTITIES)))

                val toString = storyToString(story) ?: throw AssertionError("${bundle.name}: GraphQLStory has no toString()")
                val readers = messageTextReaders(toString, message)
                assertEquals("${bundle.name}: the readers toString hands the message to", 1, readers.size)
                val helpers = staticStringReaders(toString)
                val owners = FixtureDex.classes(bundle, helpers.map { it.definingClass }.toSet())
                fun resolved(call: MethodReference) = owners[call.definingClass]?.let { resolveStatic(it, call) }
                    ?: throw AssertionError("${bundle.name}: $call is not a static method in the APK")
                assertTrue("${bundle.name}: toString doesn't read the $TEXT_FIELD of the message",
                    readsTextField(resolved(readers.single())))

                // The controls: toString's other string helpers (the id, the cache id, an actor's
                // name) read other fields, and no other TextWithEntities accessor of the story is the
                // one toString calls "message.text".
                val others = helpers.filter { it != readers.single() }
                assertTrue("${bundle.name}: toString has no other string helper to hold this against", others.size >= 2)
                for (other in others) {
                    assertFalse("${bundle.name}: $other reads $TEXT_FIELD too", readsTextField(resolved(other)))
                }
                val siblings = story.methods.filter {
                    it.name != message.name && it.parameterTypes.isEmpty() && it.returnType == message.returnType
                }
                assertTrue("${bundle.name}: no other accessor of TextWithEntities to hold this against", siblings.size >= 3)
                for (sibling in siblings) {
                    assertTrue("${bundle.name}: toString calls ${sibling.name}() message text too",
                        messageTextReaders(toString, sibling).isEmpty())
                }

                val attached = attachedStoryAccessors(story)
                assertEquals("${bundle.name}: ${attached.map { it.name }}", 1, attached.size)
                assertEquals("${bundle.name}: what the attached story accessor answers", GRAPHQL_STORY, attached.single().returnType)

                assertTrue("${bundle.name}: no public BaseModelWithTree.getCachedString(int)",
                    hasPublicStringReader(kept(BASE_MODEL_WITH_TREE)))
                assertTrue("${bundle.name}: no public TreeJNI.mTypeTag", hasPublicTypeTag(kept(TREE_JNI)))

                // The patch on this build's classes: each stub calls the accessor found above.
                val context = PatchContexts.of(classes.values + owners.values + ExtensionDex.classDef(POST_TEXT) +
                    ExtensionDex.classDef(SETTINGS_STATUS))
                hidePostsByWordsPatch.execute(context)
                val stubs = context.mutableClassDefBy(POST_TEXT).methods
                for ((stub, accessor) in listOf(MESSAGE_STUB to message, ATTACHED_STORY_STUB to attached.single())) {
                    val body = stubs.single { it.name == stub }.implementation!!.instructions.toList()
                    assertEquals("${bundle.name}: $stub's first instruction", Opcode.CHECK_CAST, body[0].opcode)
                    val call = (body[1] as ReferenceInstruction).reference as MethodReference
                    assertEquals("${bundle.name}: what $stub calls", "$GRAPHQL_STORY->${accessor.name}()${accessor.returnType}",
                        "${call.definingClass}->${call.name}(${call.parameterTypes.joinToString("")})${call.returnType}")
                    assertEquals(Opcode.RETURN_OBJECT, body[3].opcode)
                }
                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "postWords" }
                val answer = status.implementation!!.instructions.first()
                assertEquals("${bundle.name}: postWords() answers true", listOf(Opcode.CONST_4, 1),
                    listOf(answer.opcode, (answer as NarrowLiteralInstruction).narrowLiteral))

                checked[version] = "${message.name}() and ${attached.single().name}()"
            }
        }
        assertEquals("a declared build went unchecked: $checked", versions, checked.keys)
    }
}
