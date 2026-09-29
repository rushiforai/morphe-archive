/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.stories.seen

import app.morphe.patches.facebook.feed.holdsString
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/*
 * Where Facebook reports the stories you've viewed, on the 577 and 580 builds.
 *
 * The story viewer's seen helper (StoryViewerSeenHelper in its log lines) queues the id of each
 * story card you view. When you leave the viewer, it pauses, or the queue reaches a hundred, the
 * helper hands the queue to one sender. The sender builds one GraphQL mutation, DirectSeenMutation
 * (persisted query 157429340, root field direct_message_thread_update_seen_state, on both builds),
 * with the cards' ids in story_ids_list, and gives it to Facebook's GraphQL executor. That mutation
 * is what puts you on a story's viewer list. Replies and reactions go out as a mutation of their
 * own, from another class, and aren't touched.
 *
 * The helper counts a card as reported, in a set it keeps in memory, before it sends, and only the
 * send's failure callback takes the card back out. A send that never happens leaves the card
 * counted, so it isn't queued again until Facebook restarts. Facebook itself returns from the
 * sender without sending when the queue is empty.
 *
 * Redex renames the sender and its class every build (580's is LX/AqQ;->A00, 577's LX/A5o;->A00),
 * and the sender loads no string at all. Its class keeps the builder's name, getRequest, but a
 * name Facebook could drop isn't what the patch goes by. The sender is found through what it
 * builds: the one class whose constructor names the mutation and its root field, the one method
 * that creates that class and fills story_ids_list, and the one other method of that method's
 * class that calls it.
 */
internal const val PATCH = "View stories anonymously"

/** The mutation's name, which its query class's constructor loads. */
internal const val SEEN_MUTATION = "DirectSeenMutation"

/** The mutation's root field, loaded by the same constructor. */
internal const val SEEN_ROOT_FIELD = "direct_message_thread_update_seen_state"

/** The input field the request builder fills with the viewed cards' ids. */
internal const val STORY_IDS = "story_ids_list"

private const val SET = "Ljava/util/Set;"

/** Whether [classDef] is the seen mutation's query class: a constructor of it loads the name and the root field. */
internal fun isSeenMutation(classDef: ClassDef): Boolean =
    classDef.methods.any { it.name == "<init>" && holdsString(it, SEEN_MUTATION) && holdsString(it, SEEN_ROOT_FIELD) }

/**
 * Whether [method] builds the seen request: an instance method handing back an object that loads
 * [STORY_IDS] and creates an instance of [mutation], the query class [isSeenMutation] found.
 */
internal fun isRequestBuilder(method: Method, mutation: String): Boolean {
    if (AccessFlags.STATIC.isSet(method.accessFlags) || !method.returnType.startsWith("L")) return false
    if (!holdsString(method, STORY_IDS)) return false
    return method.implementation?.instructions?.any {
        it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == mutation
    } == true
}

private fun Method.key(): String = name + parameterTypes.joinToString("", "(", ")") + returnType

/** How many times [method] calls [target], a method of the same class. */
private fun callsTo(method: Method, target: Method): Int =
    method.implementation?.instructions?.count { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref != null && ref.definingClass == target.definingClass && ref.name == target.name &&
            ref.parameterTypes.map { it.toString() } == target.parameterTypes.map { it.toString() } &&
            ref.returnType == target.returnType
    } ?: 0

/**
 * The method in [owner] that sends the seen request, or null when [owner] isn't the sender's class:
 * [owner] has exactly one request builder for [mutation], exactly one other method of [owner]
 * calls it, and that caller is a void instance method taking the set of card ids and calling the
 * builder once.
 */
internal fun seenSender(owner: ClassDef, mutation: String): Method? {
    val builder = owner.methods.filter { isRequestBuilder(it, mutation) }.singleOrNull() ?: return null
    val callers = owner.methods.filter { it.key() != builder.key() && callsTo(it, builder) > 0 }
    val sender = callers.singleOrNull() ?: return null
    if (sender.returnType != "V" || AccessFlags.STATIC.isSet(sender.accessFlags) ||
        sender.parameterTypes.none { it.toString() == SET } || callsTo(sender, builder) != 1
    ) return null
    return sender
}
