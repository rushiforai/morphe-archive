/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.words

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.facebook.feed.BASE_MODEL_WITH_TREE
import app.morphe.patches.facebook.feed.aidetected.GRAPHQL_STORY_ATTACHMENT
import app.morphe.patches.facebook.feed.fillStoryModelStub
import app.morphe.patches.facebook.feed.storyModelAccessors
import app.morphe.patches.facebook.feed.treeFieldKey
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/*
 * Where Hide posts by words' kinds of post read, found by kept names only (read from 577, 580 and
 * 581, 2026-10-07). The obfuscated names in these comments are for reviewers; the code never
 * writes one down.
 *
 * - An attachment's styles: GraphQLStoryAttachment's one public accessor that loads the key of
 *   `style_list` (139866732) and reads it with BaseModelWithTree's `getCachedEnumList(int, Class,
 *   Enum)` as Facebook's attachment style enum (A08() on all three, the enum LX/2R3 in 581, LX/2Ic in
 *   580, LX/2Ft in 577). The enum is renamed, but its constants keep their names: PHOTO, ALBUM,
 *   VIDEO, VIDEO_INLINE, VIDEO_AUTOPLAY, SHARE, SHARE_LARGE_IMAGE and IMAGE_SHARE are in its static
 *   initialiser on all three, among 1,285 in 581.
 * - A story's text format: GraphQLStory's one accessor that asks `getCachedModel` for the key of
 *   `text_format_metadata` (-1071752347) as TextFormatMetadata (1670815897): A0h() in 581 and 577,
 *   A0i() in 580. Facebook's own check of a formatted text post (581 LX/2ds.A06) calls it and
 *   answers true when the model is there and `getCachedString` finds one of color,
 *   background_color, font_style, font_weight or text_align, the five keys the extension reads.
 */

/** The extension class that reads a post's kind, and its two stubs. */
internal const val POST_TYPES = "$EXTENSION_PACKAGE/feed/PostTypes;"
internal const val STYLE_LIST_STUB = "styleList"
internal const val TEXT_FORMAT_STUB = "textFormat"

internal const val STYLE_LIST_FIELD = "style_list"
internal const val TEXT_FORMAT_FIELD = "text_format_metadata"
internal const val TEXT_FORMAT_TYPE = "TextFormatMetadata"

/** The style constants PostTypes sorts posts by. The enum has to hold every one. */
internal val POST_TYPE_STYLES = listOf(
    "PHOTO", "ALBUM", "VIDEO", "VIDEO_INLINE", "VIDEO_AUTOPLAY", "SHARE", "SHARE_LARGE_IMAGE", "IMAGE_SHARE",
)

private const val IMMUTABLE_LIST = "Lcom/google/common/collect/ImmutableList;"
private const val ENUM = "Ljava/lang/Enum;"

/** The two accessors the kinds of post read through. */
internal class PostTypeAccessors(val styles: Method, val format: Method)

/**
 * Whether [method] is GraphQLStoryAttachment's accessor of its styles: public, no arguments, an
 * ImmutableList out, and a body that loads the key of `style_list` and reads it with
 * `getCachedEnumList`.
 */
internal fun isStyleListAccessor(method: Method): Boolean {
    if (method.definingClass != GRAPHQL_STORY_ATTACHMENT || method.parameterTypes.isNotEmpty()) return false
    if (method.returnType != IMMUTABLE_LIST) return false
    if (!AccessFlags.PUBLIC.isSet(method.accessFlags) || AccessFlags.STATIC.isSet(method.accessFlags)) return false
    val body = method.implementation?.instructions?.toList().orEmpty()
    if (body.none { (it as? NarrowLiteralInstruction)?.narrowLiteral == treeFieldKey(STYLE_LIST_FIELD) }) return false
    return body.any {
        val call = (it as? ReferenceInstruction)?.reference as? MethodReference
        call?.definingClass == BASE_MODEL_WITH_TREE && call.name == "getCachedEnumList" &&
            call.parameterTypes.map { type -> type.toString() } == listOf("I", "Ljava/lang/Class;", ENUM)
    }
}

/** GraphQLStoryAttachment's accessors of its styles. The patch wants exactly one. */
internal fun styleListAccessors(attachment: ClassDef): List<Method> = attachment.methods.filter(::isStyleListAccessor)

/** The enum class [accessor] reads the styles as: the class it loads, or null. */
internal fun styleEnumType(accessor: Method): String? =
    accessor.implementation?.instructions?.firstNotNullOfOrNull {
        if (it.opcode == Opcode.CONST_CLASS) ((it as ReferenceInstruction).reference as? TypeReference)?.type else null
    }

/** The [POST_TYPE_STYLES] [styleEnum] doesn't build in its static initialiser. Empty when it's the styles enum. */
internal fun missingStyles(styleEnum: ClassDef): List<String> {
    if (styleEnum.superclass != ENUM) return POST_TYPE_STYLES
    val names = styleEnum.methods.singleOrNull { it.name == "<clinit>" }?.implementation?.instructions
        ?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }?.toSet().orEmpty()
    return POST_TYPE_STYLES.filter { it !in names }
}

/** GraphQLStory's accessors of its text format. The patch wants exactly one. */
internal fun textFormatAccessors(story: ClassDef): List<Method> =
    storyModelAccessors(story, TEXT_FORMAT_FIELD, TEXT_FORMAT_TYPE)

/**
 * Both accessors the kinds of post read through, held to the enum the styles are read as. Throws
 * when either is missing or doubled, or the enum lacks a style the extension sorts by, before
 * anything is filled in.
 */
internal fun BytecodePatchContext.findPostTypeAccessors(story: ClassDef): PostTypeAccessors {
    val formats = textFormatAccessors(story)
    val format = formats.singleOrNull() ?: throw PatchException(
        "$PATCH: GraphQLStory has ${formats.size} accessors of $TEXT_FORMAT_FIELD as $TEXT_FORMAT_TYPE, expected one: " +
            formats.joinToString { it.name },
    )
    val attachment = classDefByOrNull(GRAPHQL_STORY_ATTACHMENT)
        ?: throw PatchException("$PATCH: GraphQLStoryAttachment is gone")
    val lists = styleListAccessors(attachment)
    val styles = lists.singleOrNull() ?: throw PatchException(
        "$PATCH: GraphQLStoryAttachment has ${lists.size} accessors of $STYLE_LIST_FIELD, expected one: " +
            lists.joinToString { it.name },
    )
    val enumType = styleEnumType(styles)
        ?: throw PatchException("$PATCH: GraphQLStoryAttachment.${styles.name}() names no style class")
    val styleEnum = classDefByOrNull(enumType)
        ?: throw PatchException("$PATCH: the attachment style class GraphQLStoryAttachment.${styles.name}() reads is gone")
    val missing = missingStyles(styleEnum)
    if (missing.isNotEmpty()) {
        throw PatchException("$PATCH: the attachment styles have no ${missing.joinToString()}")
    }
    return PostTypeAccessors(styles, format)
}

/** Fills in PostTypes' two stubs with the accessors [findPostTypeAccessors] found. */
internal fun BytecodePatchContext.fillPostTypeStubs(found: PostTypeAccessors) {
    fillStoryModelStub(POST_TYPES, STYLE_LIST_STUB, found.styles)
    fillStoryModelStub(POST_TYPES, TEXT_FORMAT_STUB, found.format)
}
