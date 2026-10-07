/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.aidetected

import app.morphe.patches.facebook.feed.BASE_MODEL_WITH_TREE
import app.morphe.patches.facebook.feed.GRAPHQL_STORY
import app.morphe.patches.facebook.feed.treeFieldKey
import app.morphe.patches.facebook.feed.treeTypeTag
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/*
 * Where Hide Meta AI in the feed's rule for posts carrying an AI character reads, found by kept
 * names only (read from 577, 580 and 581, 2026-10-06). The obfuscated names in these comments are
 * for reviewers; the code never writes one down.
 *
 * - An AI character is one of Meta's Creator AI and AI Studio characters ("embodiments"), which a
 *   post offers to chat with or call. Facebook's feed code asks whether an attachment carries one by
 *   handing the literal AiInteractiveEmbodimentAttachmentStyleInfo to one static finder taking the
 *   attachment and a type name (581 LX/2dD;->A05, 580 LX/2YR;->A05, 577 LX/2WB;->A05, each a public
 *   method of a public class), from 15 to 19 call sites, the attachment renderers among them. The
 *   finder walks the attachment's style_infos and answers the first whose TreeJNI.getTypeName() is
 *   the name, or null.
 * - The attachment's style_infos are its getCachedModelList of the key of "style_infos" as
 *   StoryAttachmentStyleInfo models (581 GraphQLStoryAttachment.A07), and the story's attachments are
 *   its getCachedModelList of the key of "attachments" as StoryAttachment models of the kept class
 *   GraphQLStoryAttachment (581 GraphQLStory.A0m).
 * - A model list is cached under its key with the class it was read as, so the extension reads both
 *   through Facebook's own accessor and finder, never with a class of its own.
 */

/** The extension class the rule lives in, and its two stubs this patch fills in. */
internal const val AI_CHARACTER_POSTS = "$EXTENSION_PACKAGE/feed/AiCharacterPosts;"
internal const val ATTACHMENTS_STUB = "attachments"
internal const val STYLE_INFO_STUB = "styleInfo"

/** Kept literal. The attachment style Facebook gives a post that carries an AI character. */
internal const val AI_CHARACTER_STYLE = "AiInteractiveEmbodimentAttachmentStyleInfo"

/** Kept name. A story's attachment model. */
internal const val GRAPHQL_STORY_ATTACHMENT = "Lcom/facebook/graphql/model/GraphQLStoryAttachment;"

internal const val ATTACHMENTS_FIELD = "attachments"
internal const val ATTACHMENT_TYPE = "StoryAttachment"
internal const val STYLE_INFOS_FIELD = "style_infos"
internal const val STYLE_INFO_TYPE = "StoryAttachmentStyleInfo"

private const val IMMUTABLE_LIST = "Lcom/google/common/collect/ImmutableList;"

private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private val Instruction.methodReference
    get() = (this as? ReferenceInstruction)?.reference as? MethodReference

/**
 * Whether [method] is [owner]'s accessor of the model list under [field], of GraphQL type [type]:
 * public, no arguments, an ImmutableList out, and a body that asks BaseModelWithTree's
 * `getCachedModelList` for that key as that type tag. With [elementClass], the class it reads them
 * as has to be that one.
 */
internal fun isModelListAccessor(
    method: Method,
    owner: String,
    field: String,
    type: String,
    elementClass: String? = null,
): Boolean {
    if (method.definingClass != owner || method.parameterTypes.isNotEmpty() || method.returnType != IMMUTABLE_LIST) {
        return false
    }
    if (!AccessFlags.PUBLIC.isSet(method.accessFlags) || AccessFlags.STATIC.isSet(method.accessFlags)) return false
    val body = method.body()
    val literals = body.mapNotNull { (it as? NarrowLiteralInstruction)?.narrowLiteral }
    if (treeFieldKey(field) !in literals || treeTypeTag(type) !in literals) return false
    if (elementClass != null && body.none {
            it.opcode == Opcode.CONST_CLASS && ((it as ReferenceInstruction).reference as? TypeReference)?.type == elementClass
        }
    ) {
        return false
    }
    return body.any {
        val call = it.methodReference
        call?.definingClass == BASE_MODEL_WITH_TREE && call.name == "getCachedModelList" &&
            call.parameterTypes.map { parameter -> parameter.toString() } == listOf("I", "Ljava/lang/Class;", "I")
    }
}

/** GraphQLStory's accessors of its attachments, read as GraphQLStoryAttachment. The patch wants exactly one. */
internal fun attachmentsAccessors(story: ClassDef): List<Method> = story.methods.filter {
    isModelListAccessor(it, GRAPHQL_STORY, ATTACHMENTS_FIELD, ATTACHMENT_TYPE, GRAPHQL_STORY_ATTACHMENT)
}

/** GraphQLStoryAttachment's accessors of its style_infos. The patch wants exactly one. */
internal fun styleInfosAccessors(attachment: ClassDef): List<Method> = attachment.methods.filter {
    isModelListAccessor(it, GRAPHQL_STORY_ATTACHMENT, STYLE_INFOS_FIELD, STYLE_INFO_TYPE)
}

/**
 * Whether [finder], declared by [finderClass], is Facebook's finder of an attachment's style: the
 * attribution finder's shape ([isAttributionFinder]) with GraphQLStoryAttachment first, public in a
 * public class so the extension may call it, and a body that reads [styleInfos].
 */
internal fun isStyleFinder(finder: Method, finderClass: ClassDef, styleInfos: Method): Boolean {
    if (!isAttributionFinder(finder)) return false
    if (finder.parameterTypes.first().toString() != GRAPHQL_STORY_ATTACHMENT) return false
    if (!AccessFlags.PUBLIC.isSet(finder.accessFlags) || !AccessFlags.PUBLIC.isSet(finderClass.accessFlags)) return false
    return finder.body().any {
        val call = it.methodReference
        call?.definingClass == GRAPHQL_STORY_ATTACHMENT && call.name == styleInfos.name &&
            call.parameterTypes.isEmpty() && call.returnType == styleInfos.returnType
    }
}
