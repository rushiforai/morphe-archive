/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.aidetected

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.GRAPHQL_STORY
import app.morphe.patches.facebook.feed.methodsHolding
import app.morphe.patches.facebook.feed.resolveStatic
import app.morphe.patches.shared.compat.AppCompatibilities
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

/** Kept field name. An attachment's own list of attachments, read as StoryAttachment models like the story's. */
private const val SUBATTACHMENTS_FIELD = "subattachments"

/**
 * The AI character side of Hide AI-detected posts, found in the Facebook builds the bundle
 * declares, the way the patch finds it: GraphQLStory's one accessor of its attachments,
 * GraphQLStoryAttachment's one accessor of its style_infos, and the one static finder the AI
 * character style's literal is handed to, public in a public class and walking style_infos by
 * getTypeName(). The compiled extension's holders of the literal are searched beside Facebook's,
 * as the patcher sees them. Each control passes the right owner and changes one thing, so only the
 * check under test can turn it away. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and
 * skips without it.
 */
class AiCharacterFixtureTest {
    @Test
    fun `every declared build has the attachments, their style list and one public style finder`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val extensionHolders = ExtensionDex.classes().flatMap { methodsHolding(it, AI_CHARACTER_STYLE) }
        assertTrue("the extension no longer holds \"$AI_CHARACTER_STYLE\", so the patcher's search no longer " +
            "meets it: drop extensionHolders here", extensionHolders.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val models = FixtureDex.classes(bundle, setOf(GRAPHQL_STORY, GRAPHQL_STORY_ATTACHMENT))
                val story = models[GRAPHQL_STORY] ?: throw AssertionError("${bundle.name} has no $GRAPHQL_STORY")
                val attachment = models[GRAPHQL_STORY_ATTACHMENT]
                    ?: throw AssertionError("${bundle.name} has no $GRAPHQL_STORY_ATTACHMENT")
                val attachmentLists = attachmentsAccessors(story)
                assertEquals("${bundle.name}: GraphQLStory's attachments accessors ${attachmentLists.map { it.name }}",
                    1, attachmentLists.size)
                val styleLists = styleInfosAccessors(attachment)
                assertEquals("${bundle.name}: GraphQLStoryAttachment's style_infos accessors ${styleLists.map { it.name }}",
                    1, styleLists.size)
                val styleInfos = styleLists.single()

                // The controls. The attachment's own list of attachments has the story's list's type
                // tag and element class under another key, so only the key check turns it away; the
                // story's list asked for under another type tag or element class leaves only those.
                val subattachments = attachment.methods.filter {
                    isModelListAccessor(it, GRAPHQL_STORY_ATTACHMENT, SUBATTACHMENTS_FIELD, ATTACHMENT_TYPE, GRAPHQL_STORY_ATTACHMENT)
                }
                assertEquals("${bundle.name}: GraphQLStoryAttachment's subattachments accessors ${subattachments.map { it.name }}",
                    1, subattachments.size)
                assertFalse("${bundle.name}: the subattachments accessor passes under the key of $ATTACHMENTS_FIELD",
                    isModelListAccessor(subattachments.single(), GRAPHQL_STORY_ATTACHMENT, ATTACHMENTS_FIELD,
                        ATTACHMENT_TYPE, GRAPHQL_STORY_ATTACHMENT))
                val storyList = attachmentLists.single()
                assertFalse("${bundle.name}: the story's attachments pass as $STYLE_INFO_TYPE models",
                    isModelListAccessor(storyList, GRAPHQL_STORY, ATTACHMENTS_FIELD, STYLE_INFO_TYPE))
                assertFalse("${bundle.name}: the story's attachments pass as read into GraphQLStory",
                    isModelListAccessor(storyList, GRAPHQL_STORY, ATTACHMENTS_FIELD, ATTACHMENT_TYPE, GRAPHQL_STORY))

                val holders = FixtureDex.classesHolding(bundle, AI_CHARACTER_STYLE)
                    .flatMap { methodsHolding(it, AI_CHARACTER_STYLE) }
                assertTrue("${bundle.name}: only ${holders.size} methods hold \"$AI_CHARACTER_STYLE\"", holders.size >= 2)
                val found = attributionFinder(holders + extensionHolders, AI_CHARACTER_STYLE)
                assertNull("${bundle.name}: ${found.problem}", found.problem)
                val finder = found.call!!
                val finderClass = FixtureDex.classes(bundle, setOf(finder.definingClass))[finder.definingClass]
                    ?: throw AssertionError("${bundle.name} has no ${finder.definingClass}")
                val method = resolveStatic(finderClass, finder)
                    ?: throw AssertionError("${bundle.name}: ${finder.definingClass} declares no static ${finder.name}")
                assertTrue("${bundle.name}: ${finder.definingClass}->${finder.name} isn't a public style finder over " +
                    "${styleInfos.name}()", isStyleFinder(method, finderClass, styleInfos))

                // The control: held to another of the attachment's lists, one it doesn't read, the
                // finder fails on the style_infos read alone.
                assertFalse("${bundle.name}: ${finder.name} passes as a finder over ${subattachments.single().name}()",
                    isStyleFinder(method, finderClass, subattachments.single()))
                checked += version
            }
        }
        assertEquals("a declared build went unchecked", versions.toSet(), checked)
    }
}
