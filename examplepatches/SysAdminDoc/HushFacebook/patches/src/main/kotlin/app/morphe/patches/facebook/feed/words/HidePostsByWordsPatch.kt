/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.words

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.feed.BASE_MODEL_WITH_TREE
import app.morphe.patches.facebook.feed.GRAPHQL_STORY
import app.morphe.patches.facebook.feed.TREE_JNI
import app.morphe.patches.facebook.feed.fillStoryModelStub
import app.morphe.patches.facebook.feed.hasPublicTypeTag
import app.morphe.patches.facebook.feed.hook.feedFilterHookPatch
import app.morphe.patches.facebook.feed.resolveStatic
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

/** The extension class that reads a post's text, and the two accessors this patch fills in. */
internal const val POST_TEXT = "$EXTENSION_PACKAGE/feed/PostText;"
internal const val MESSAGE_STUB = "message"
internal const val ATTACHED_STORY_STUB = "attachedStory"

internal const val PATCH = "Hide posts by words"

/**
 * Hides feed posts whose own text holds a word or phrase the person listed, unless it also holds
 * one from their keep list.
 *
 * The rule runs in the shared feed guard like every other feed rule, so `addNewEdgeToCollection`
 * still carries one Hushfacebook guard. What this patch adds there are the two reads the guard
 * can't make by name: GraphQLStory's accessors of its message and of the post a share wraps, which
 * Redex renames every build. Each is found by the two schema keys it loads (see PostTextAnchors.kt)
 * and written into a stub on `PostText`, which answers a marker until then. The message accessor is
 * also held to GraphQLStory's own toString, which labels its text "message.text" and reads it as
 * the field `text`; the extension reads the same field through the kept `getCachedString(int)`.
 *
 * The lists live in Hushfacebook's settings on the phone. Nothing here reads the text until the
 * switch is on and the hide list has a phrase in it, and nothing of the text or the phrases goes
 * into a log, the diagnostic report or a request.
 */
@Suppress("unused")
val hidePostsByWordsPatch = bytecodePatch(
    name = "Hide posts by words",
    description = "Hides feed posts whose text has a word or phrase you list, unless it also has one from " +
        "your keep list. Hushfacebook never sends your words anywhere. The switch starts off, so turn it on " +
        "and add words in Hushfacebook's settings.",
    default = true,
) {
    category("Feed")
    dependsOn(settingsPatch)
    dependsOn(feedFilterHookPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val story = classDefBy(GRAPHQL_STORY)
        val message = messageAccessor(story)
        val attached = attachedStoryAccessors(story).singleOrNull() ?: throw PatchException(
            "$PATCH: GraphQLStory has ${attachedStoryAccessors(story).size} accessors of $ATTACHED_STORY_FIELD " +
                "as $STORY_TYPE, expected one",
        )

        // The extension reads the text and the model's type tag through these, by reflection.
        if (!hasPublicStringReader(classDefBy(BASE_MODEL_WITH_TREE))) {
            throw PatchException("$PATCH: BaseModelWithTree has no public getCachedString(int)")
        }
        if (!hasPublicTypeTag(classDefBy(TREE_JNI))) {
            throw PatchException("$PATCH: TreeJNI has no public int mTypeTag")
        }

        fillStoryModelStub(POST_TEXT, MESSAGE_STUB, message)
        fillStoryModelStub(POST_TEXT, ATTACHED_STORY_STUB, attached)
        enableStatus("postWords")
    }
}

/**
 * GraphQLStory's one accessor of its message, held to the kept model class it answers and to
 * Facebook's own reading of it in toString. If toString stops calling it "message.text" or stops
 * reading the `text` field of it, the words may have moved, and a rule that guesses could hide the
 * wrong posts, so the patch stops.
 */
private fun BytecodePatchContext.messageAccessor(story: ClassDef): Method {
    val accessors = messageAccessors(story)
    val accessor = accessors.singleOrNull() ?: throw PatchException(
        "$PATCH: GraphQLStory has ${accessors.size} accessors of $MESSAGE_FIELD as $TEXT_WITH_ENTITIES_TYPE, " +
            "expected one: ${accessors.joinToString { it.name }}",
    )
    if (accessor.returnType != GRAPHQL_TEXT_WITH_ENTITIES) {
        throw PatchException("$PATCH: GraphQLStory.${accessor.name}() answers ${accessor.returnType}, not GraphQLTextWithEntities")
    }
    val textModel = classDefByOrNull(GRAPHQL_TEXT_WITH_ENTITIES)
        ?: throw PatchException("$PATCH: GraphQLTextWithEntities is gone")
    if (!answersTextType(textModel)) {
        throw PatchException("$PATCH: GraphQLTextWithEntities no longer answers $TEXT_WITH_ENTITIES_TYPE as its type")
    }

    val toString = storyToString(story) ?: throw PatchException("$PATCH: GraphQLStory has no toString()")
    val readers = messageTextReaders(toString, accessor).mapNotNull { call ->
        classDefByOrNull(call.definingClass)?.let { resolveStatic(it, call) }
    }
    if (readers.none(::readsTextField)) {
        throw PatchException(
            "$PATCH: GraphQLStory.toString() no longer reads \"$MESSAGE_TEXT_LABEL\" as the $TEXT_FIELD of " +
                "${accessor.name}()",
        )
    }
    return accessor
}
