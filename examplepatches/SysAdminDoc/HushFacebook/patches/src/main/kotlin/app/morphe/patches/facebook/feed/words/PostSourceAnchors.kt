/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.words

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.facebook.feed.GRAPHQL_STORY
import app.morphe.patches.facebook.feed.aidetected.ATTACHMENTS_FIELD
import app.morphe.patches.facebook.feed.aidetected.ATTACHMENT_TYPE
import app.morphe.patches.facebook.feed.aidetected.attachmentsAccessors
import app.morphe.patches.facebook.feed.aidetected.isModelListAccessor
import app.morphe.patches.facebook.feed.fillStoryModelStub
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

/** The extension class that reads who wrote a post and where its links go, and its two stubs. */
internal const val POST_SOURCES = "$EXTENSION_PACKAGE/feed/PostSources;"
internal const val ACTORS_STUB = "actors"
internal const val SOURCE_ATTACHMENTS_STUB = "attachments"

/**
 * The GraphQL names behind who wrote a post, keyed the way StoryModels.kt describes.
 *
 * Read from 581 (2026-10-06): GraphQLStory's `A0l()` asks `getCachedModelList` for `actors`
 * (0xab2f951e) as `Actor` (0x1cc84619), read as the renamed `LX/40F;`, so the patch finds it by the
 * two keys and not by the class. Its `A0m()` asks for `attachments` (0xd3f3cbb0) as `StoryAttachment`
 * (0x01658856), read as the kept GraphQLStoryAttachment, the accessor Hide AI character posts fills
 * in too. Facebook's own code reads an attachment's link as `getCachedString("url".hashCode())`
 * (0x1c56f, `AdStory.A1w`), and the extension reads that, and an actor's `id` and `name`, the same way.
 */
internal const val ACTORS_FIELD = "actors"
internal const val ACTOR_TYPE = "Actor"

/** Every accessor [story] declares of its authors. The patch wants exactly one. */
internal fun actorsAccessors(story: ClassDef): List<Method> =
    story.methods.filter { isModelListAccessor(it, GRAPHQL_STORY, ACTORS_FIELD, ACTOR_TYPE) }

/**
 * Fills in PostSources' two stubs with GraphQLStory's accessors of its authors and its attachments.
 * Either one missing or doubled throws, and nothing is filled in, so the rule keeps every post and
 * the report names the accessor it lacks.
 */
internal fun BytecodePatchContext.fillPostSourceStubs(story: ClassDef) {
    val actorLists = actorsAccessors(story)
    val actors = actorLists.singleOrNull() ?: throw PatchException(
        "$PATCH: GraphQLStory has ${actorLists.size} accessors of $ACTORS_FIELD as $ACTOR_TYPE, expected one: " +
            actorLists.joinToString { it.name },
    )
    val attachmentLists = attachmentsAccessors(story)
    val attachments = attachmentLists.singleOrNull() ?: throw PatchException(
        "$PATCH: GraphQLStory has ${attachmentLists.size} accessors of $ATTACHMENTS_FIELD as $ATTACHMENT_TYPE, " +
            "expected one: ${attachmentLists.joinToString { it.name }}",
    )
    fillStoryModelStub(POST_SOURCES, ACTORS_STUB, actors)
    fillStoryModelStub(POST_SOURCES, SOURCE_ATTACHMENTS_STUB, attachments)
}
