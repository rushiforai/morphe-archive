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
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The kinds of post's two accessors on every declared Facebook build, found the way Hide posts by
 * words finds them: GraphQLStoryAttachment's one accessor of `style_list`, read as an enum that
 * builds every style the extension sorts by, and GraphQLStory's one accessor of
 * `text_format_metadata` as TextFormatMetadata. The patch is then run on each build's classes and
 * the extension's stubs, and each stub has to call the accessor found with the post it was handed.
 * Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class PostTypesFixtureTest {
    private val kept = setOf(GRAPHQL_STORY, GRAPHQL_STORY_ATTACHMENT, GRAPHQL_TEXT_WITH_ENTITIES, BASE_MODEL_WITH_TREE, TREE_JNI)

    @Test
    fun `every declared build has one style list and one text format accessor, and the patch fills both stubs`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableMapOf<String, String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val classes = FixtureDex.classes(bundle, kept)
                fun kept(type: String): ClassDef = classes[type] ?: throw AssertionError("${bundle.name} has no $type")
                val story = kept(GRAPHQL_STORY)

                val lists = styleListAccessors(kept(GRAPHQL_STORY_ATTACHMENT))
                assertEquals("${bundle.name}: ${lists.map { it.name }}", 1, lists.size)
                val styles = lists.single()
                val enumType = styleEnumType(styles) ?: throw AssertionError("${bundle.name}: ${styles.name}() loads no class")
                val styleEnum = FixtureDex.classes(bundle, setOf(enumType))[enumType]
                    ?: throw AssertionError("${bundle.name} has no $enumType")
                assertEquals("${bundle.name}: styles $enumType lacks", emptyList<String>(), missingStyles(styleEnum))

                val formats = textFormatAccessors(story)
                assertEquals("${bundle.name}: ${formats.map { it.name }}", 1, formats.size)
                val format = formats.single()

                // The patch needs the helpers toString reads the message with, as Hide posts by words' own test loads them.
                val message = messageAccessors(story).single()
                val toString = storyToString(story) ?: throw AssertionError("${bundle.name}: GraphQLStory has no toString()")
                val readers = FixtureDex.classes(bundle, messageTextReaders(toString, message).map { it.definingClass }.toSet())

                val context = PatchContexts.of(classes.values + styleEnum + readers.values + ExtensionDex.classDef(POST_TEXT) +
                    ExtensionDex.classDef(POST_SOURCES) + ExtensionDex.classDef(POST_TYPES) + ExtensionDex.classDef(SETTINGS_STATUS))
                hidePostsByWordsPatch.execute(context)
                for ((stub, accessor) in listOf(STYLE_LIST_STUB to styles, TEXT_FORMAT_STUB to format)) {
                    val body = context.mutableClassDefBy(POST_TYPES).methods.single { it.name == stub }
                        .implementation!!.instructions.toList()
                    assertEquals("${bundle.name}: $stub's first instruction", Opcode.CHECK_CAST, body[0].opcode)
                    val call = (body[1] as ReferenceInstruction).reference as MethodReference
                    assertEquals("${bundle.name}: what $stub calls", describe(accessor),
                        "${call.definingClass}->${call.name}(${call.parameterTypes.joinToString("")})${call.returnType}")
                    val stubMethod = context.mutableClassDefBy(POST_TYPES).methods.single { it.name == stub }
                    val parameter = stubMethod.implementation!!.registerCount - 1
                    assertEquals("${bundle.name}: $stub calls the accessor on what it was handed", parameter,
                        (body[1] as Instruction35c).registerC)
                    assertEquals(Opcode.RETURN_OBJECT, body[3].opcode)
                }

                checked[version] = "${styles.name}() as $enumType, ${format.name}()"
            }
        }
        assertEquals("a declared build went unchecked: $checked", versions, checked.keys)
    }

    private fun describe(method: Method) =
        "${method.definingClass}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}"
}
