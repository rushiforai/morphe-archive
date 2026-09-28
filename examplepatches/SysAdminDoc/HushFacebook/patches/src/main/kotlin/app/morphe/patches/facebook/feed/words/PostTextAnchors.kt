/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.words

import app.morphe.patches.facebook.feed.BASE_MODEL_WITH_TREE
import app.morphe.patches.facebook.feed.GRAPHQL_STORY
import app.morphe.patches.facebook.feed.storyModelAccessors
import app.morphe.patches.facebook.feed.treeFieldKey
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** Kept name. The model of a piece of GraphQL text: the words, and the links and tags in them. */
internal const val GRAPHQL_TEXT_WITH_ENTITIES = "Lcom/facebook/graphql/model/GraphQLTextWithEntities;"

/**
 * The GraphQL names behind a post's own text, keyed the way StoryModels.kt describes.
 *
 * Read from 577 and 580 (2026-09-27): GraphQLStory has one zero-argument method that asks
 * `getCachedModel` for the field keyed `message` (0x38eb0007) as the type tagged `TextWithEntities`
 * (0xdb1d8904), answering GraphQLTextWithEntities: `A07()` in 580 and `A06()` in 577. Its five
 * neighbours of the same type load other keys (title, suffix, display_explanation and two more).
 * GraphQLStory.toString, a kept method, calls it, labels what it reads "message.text", and reads
 * that with a static helper (`LX/18a;->A0n` in 580, `LX/19u;->A0r` in 577) that is
 * `getCachedString("text".hashCode())` (0x36452d), the same helper GraphQLTextWithEntities' own
 * String getter calls. The words are the author's own: Facebook's translation of a post is another
 * field (`translated_message`), and none of the header text Facebook writes in the reader's
 * language ("shared a memory") is in it.
 */
internal const val MESSAGE_FIELD = "message"
internal const val TEXT_WITH_ENTITIES_TYPE = "TextWithEntities"
internal const val TEXT_FIELD = "text"

/**
 * The post a share wraps, keyed the same way: `attached_story` (0x92300e9a) as `Story`
 * (0xdfba89a6), `A04()` in 580 and `A03()` in 577. It's the getter the video menu already asks for
 * a shared post's video. A shared post's own words are in its message, the sharer's in the outer
 * one, so the rule reads both.
 */
internal const val ATTACHED_STORY_FIELD = "attached_story"
internal const val STORY_TYPE = "Story"

/** Kept literal. The label GraphQLStory.toString gives the text of its message. */
internal const val MESSAGE_TEXT_LABEL = "message.text"

private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Instruction.methodReference(): MethodReference? =
    (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.string(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.literal(): Int? = (this as? NarrowLiteralInstruction)?.narrowLiteral

/** Every accessor [story] declares of its message. The patch wants exactly one. */
internal fun messageAccessors(story: ClassDef): List<Method> =
    storyModelAccessors(story, MESSAGE_FIELD, TEXT_WITH_ENTITIES_TYPE)

/** Every accessor [story] declares of the post a share wraps. The patch wants exactly one. */
internal fun attachedStoryAccessors(story: ClassDef): List<Method> =
    storyModelAccessors(story, ATTACHED_STORY_FIELD, STORY_TYPE)

/** GraphQLStory's own `toString()`, or null when it has none. */
internal fun storyToString(story: ClassDef): Method? = story.methods.singleOrNull {
    it.name == "toString" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;" &&
        !AccessFlags.STATIC.isSet(it.accessFlags)
}

/**
 * The static readers [toString] hands the model from [accessor] to, right after it loads the label
 * [MESSAGE_TEXT_LABEL]: the call of [accessor], then within a few instructions the label, then a
 * static `(BaseModelWithTree)String` call. That is how Facebook's own debug text names what the
 * accessor answers.
 */
internal fun messageTextReaders(toString: Method, accessor: Method): List<MethodReference> {
    val body = toString.body()
    val found = mutableListOf<MethodReference>()
    for (index in body.indices) {
        val call = body[index].methodReference() ?: continue
        if (call.definingClass != GRAPHQL_STORY || call.name != accessor.name ||
            call.returnType != accessor.returnType || call.parameterTypes.isNotEmpty()
        ) continue
        val after = body.subList(index + 1, minOf(body.size, index + 7))
        val label = after.indexOfFirst { it.string() == MESSAGE_TEXT_LABEL }
        if (label < 0) continue
        after.drop(label + 1).firstNotNullOfOrNull { instruction ->
            instruction.methodReference()?.takeIf {
                instruction.opcode.name.startsWith("invoke-static") && it.returnType == "Ljava/lang/String;" &&
                    it.parameterTypes.map { type -> type.toString() } == listOf(BASE_MODEL_WITH_TREE)
            }
        }?.let(found::add)
    }
    return found
}

/**
 * Whether [reader] reads the field [TEXT_FIELD] of the model it's handed: it loads the key and calls
 * `getCachedString(int)`, the reader the extension calls by reflection.
 */
internal fun readsTextField(reader: Method): Boolean {
    val body = reader.body()
    val loaded = body.indexOfFirst { it.literal() == treeFieldKey(TEXT_FIELD) }
    return loaded >= 0 && body.drop(loaded + 1).any {
        val call = it.methodReference() ?: return@any false
        call.definingClass == BASE_MODEL_WITH_TREE && call.name == "getCachedString" &&
            call.returnType == "Ljava/lang/String;" && call.parameterTypes.map { type -> type.toString() } == listOf("I")
    }
}

/** Whether [treeModel] has the public `getCachedString(int)` the extension reads a post's text with. */
internal fun hasPublicStringReader(treeModel: ClassDef): Boolean = treeModel.methods.any {
    it.name == "getCachedString" && it.returnType == "Ljava/lang/String;" &&
        it.parameterTypes.map { p -> p.toString() } == listOf("I") &&
        AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
}

/** Whether [textModel]'s `getTypeName()` answers [TEXT_WITH_ENTITIES_TYPE], the type its tag is made from. */
internal fun answersTextType(textModel: ClassDef): Boolean = textModel.methods.any { method ->
    method.name == "getTypeName" && method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/String;" &&
        method.body().any { it.string() == TEXT_WITH_ENTITIES_TYPE }
}
