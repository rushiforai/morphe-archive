/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.words

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.facebook.feed.BASE_MODEL_WITH_TREE
import app.morphe.patches.facebook.feed.fillStoryModelStub
import app.morphe.patches.facebook.feed.isStoryModelAccessor
import app.morphe.patches.facebook.feed.treeFieldKey
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/*
 * Where the reaction ceiling reads a post's reactions, found by kept names only (read from 577, 580
 * and 581, 2026-10-07). The obfuscated names in these comments are for reviewers; the code never
 * writes one down.
 *
 * - GraphQLStory's accessor of its feedback: the one public accessor that asks `getCachedModel` for
 *   the key of `feedback` (-191501435) as the type tagged `Feedback` (-1096498488) and answers the
 *   kept class GraphQLFeedback. Named BPr() in 581, BOx() in 580 and BQl() in 577; Redex also gives
 *   it the name of the interface method it implements, which is why nothing here uses a name.
 * - GraphQLFeedback's accessor of its reactors: the one public accessor of that class that asks
 *   `getCachedModel` for the key of `reactors` (-867503855), A02() on all three, answering a renamed
 *   connection model (LX/40F in 581, LX/3zh in 580, LX/3zW in 577).
 * - The count is that model's `count` (94851343) read with BaseModelWithTree's kept public
 *   `getCachedInt(int)`. Facebook's own reading of the count under a post does exactly this: a static
 *   helper taking a GraphQLFeedback calls the reactors accessor, loads the key of `count` and calls
 *   `getCachedInt` (LX/2lH.A02 in 581, LX/2dd.A02 in 580, LX/2lU.A02 in 577), and a dozen feed
 *   components call that helper.
 */

/** The extension class that reads a post's reactions, and its two stubs. */
internal const val POST_REACTIONS = "$EXTENSION_PACKAGE/feed/PostReactions;"
internal const val FEEDBACK_STUB = "feedback"
internal const val REACTORS_STUB = "reactors"

internal const val GRAPHQL_FEEDBACK = "Lcom/facebook/graphql/model/GraphQLFeedback;"
internal const val FEEDBACK_FIELD = "feedback"
internal const val FEEDBACK_TYPE = "Feedback"
internal const val REACTORS_FIELD = "reactors"
internal const val COUNT_FIELD = "count"

/** The two accessors a post's reactions are read through. */
internal class ReactionAccessors(val feedback: Method, val reactors: Method)

/**
 * GraphQLStory's accessors of its feedback: the model of GraphQL type `Feedback` under the field
 * `feedback`, answered as the kept GraphQLFeedback class. The patch wants exactly one.
 */
internal fun feedbackAccessors(story: ClassDef): List<Method> = story.methods.filter {
    it.returnType == GRAPHQL_FEEDBACK && isStoryModelAccessor(it, FEEDBACK_FIELD, FEEDBACK_TYPE)
}

/**
 * Whether [method] is GraphQLFeedback's accessor of its reactors: public, no arguments, an object
 * out, and a body that asks `getCachedModel` for the key of `reactors`.
 */
internal fun isReactorsAccessor(method: Method): Boolean {
    if (method.definingClass != GRAPHQL_FEEDBACK || method.parameterTypes.isNotEmpty()) return false
    if (!AccessFlags.PUBLIC.isSet(method.accessFlags) || AccessFlags.STATIC.isSet(method.accessFlags)) return false
    if (method.returnType.length < 3 || !method.returnType.startsWith("L")) return false
    val body = method.implementation?.instructions?.toList().orEmpty()
    return body.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == treeFieldKey(REACTORS_FIELD) } &&
        body.any {
            val call = (it as? ReferenceInstruction)?.reference as? MethodReference
            call?.definingClass == BASE_MODEL_WITH_TREE && call.name == "getCachedModel" &&
                call.parameterTypes.map { type -> type.toString() } == listOf("I", "Ljava/lang/Class;", "I")
        }
}

/** GraphQLFeedback's accessors of its reactors. The patch wants exactly one. */
internal fun reactorsAccessors(feedback: ClassDef): List<Method> = feedback.methods.filter(::isReactorsAccessor)

/** Whether [treeModel] has the public `getCachedInt(int)` the extension reads the count with. */
internal fun hasPublicIntReader(treeModel: ClassDef): Boolean = treeModel.methods.any {
    it.name == "getCachedInt" && it.returnType == "I" && it.parameterTypes.map { p -> p.toString() } == listOf("I") &&
        AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
}

/**
 * Both accessors the reaction ceiling reads through, with the int reader checked. Throws when either
 * is missing or doubled, or the reader is gone, before anything is filled in.
 */
internal fun BytecodePatchContext.findReactionAccessors(story: ClassDef): ReactionAccessors {
    val feedbacks = feedbackAccessors(story)
    val feedback = feedbacks.singleOrNull() ?: throw PatchException(
        "$PATCH: GraphQLStory has ${feedbacks.size} accessors of $FEEDBACK_FIELD as $FEEDBACK_TYPE, expected one: " +
            feedbacks.joinToString { it.name },
    )
    val feedbackClass = classDefByOrNull(GRAPHQL_FEEDBACK) ?: throw PatchException("$PATCH: GraphQLFeedback is gone")
    val reactorLists = reactorsAccessors(feedbackClass)
    val reactors = reactorLists.singleOrNull() ?: throw PatchException(
        "$PATCH: GraphQLFeedback has ${reactorLists.size} accessors of $REACTORS_FIELD, expected one: " +
            reactorLists.joinToString { it.name },
    )
    val treeModel = classDefByOrNull(BASE_MODEL_WITH_TREE) ?: throw PatchException("$PATCH: BaseModelWithTree is gone")
    if (!hasPublicIntReader(treeModel)) throw PatchException("$PATCH: BaseModelWithTree has no public getCachedInt(int)")
    return ReactionAccessors(feedback, reactors)
}

/** Fills in PostReactions' two stubs with the accessors [findReactionAccessors] found. */
internal fun BytecodePatchContext.fillReactionStubs(found: ReactionAccessors) {
    fillStoryModelStub(POST_REACTIONS, FEEDBACK_STUB, found.feedback)
    fillStoryModelStub(POST_REACTIONS, REACTORS_STUB, found.reactors)
}
