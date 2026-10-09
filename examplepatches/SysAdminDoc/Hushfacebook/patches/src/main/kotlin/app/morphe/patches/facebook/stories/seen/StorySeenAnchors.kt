/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.stories.seen

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.requireLocals
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
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
 *
 * Mark as seen (#88, read from 577, 580 and 581 on 2026-10-07). The sender has the same shape on
 * all three (581 LX/AR6;->A00): a callback, the FbUserSession, three strings, the map of bucket
 * filters, the set of card ids and the peek flag. The hook hands all of it to the extension and
 * sends the set it answers, which can be a new set of only the marked cards; a null still returns
 * before anything is built. The filters map may be null, since the builder skips
 * bucket_to_story_card_id_filters then.
 *
 * The seen helper (581 LX/AGC) is the one class loading "story_preview" that calls the sender. Its
 * static void (FbUserSession, StoryBucket, StoryCard, helper, boolean) method (A00 on all three)
 * runs for each card about to be counted as viewed, and reads the card's id through
 * StoryCard.getId(), a kept method. The hook goes first in it with the session, the bucket and the
 * card, so the button knows the card on screen. The extension's two stubs are filled to call the
 * sender and StoryCard.getId().
 *
 * The eye must follow the card on screen, which the helper doesn't promise: its caller skips the
 * counted method for some bucket types and some cards, and a late callback can count a card the
 * viewer has left. Facebook's story controllers share a base class whose onCardActivated method
 * (log strings "Received onCardActivated when not attached" and "Card object cannot be null", the
 * same method on 577, 580 and 581: 577 LX/CII;->A0I, 580 LX/CGa;->A0J, 581 LX/CGv;->A0I) checks its
 * state and stores the activated StoryCard in a field of its own class. The hook goes right after
 * that store and hands the card to the button, as a range over the register the store read.
 */
internal const val PATCH = "View stories anonymously"

/** The mutation's name, which its query class's constructor loads. */
internal const val SEEN_MUTATION = "DirectSeenMutation"

/** The mutation's root field, loaded by the same constructor. */
internal const val SEEN_ROOT_FIELD = "direct_message_thread_update_seen_state"

/** The input field the request builder fills with the viewed cards' ids. */
internal const val STORY_IDS = "story_ids_list"

private const val SET = "Ljava/util/Set;"

internal const val FB_USER_SESSION = "Lcom/facebook/auth/usersession/FbUserSession;"
internal const val STORY_BUCKET = "Lcom/facebook/stories/model/StoryBucket;"
internal const val STORY_CARD = "Lcom/facebook/stories/model/StoryCard;"
internal const val CARD_ID = "$STORY_CARD->getId()Ljava/lang/String;"

/** A literal the seen helper's flush loads; the helper is the one class loading it that calls the sender. */
internal const val SEEN_HELPER_LITERAL = "story_preview"

/** What the sender takes after its callback, the same on 577, 580 and 581. */
internal val SENDER_SHAPE = listOf(
    FB_USER_SESSION, "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/util/Map;", SET, "Z",
)

internal const val STORY_SEEN = "$EXTENSION_PACKAGE/stories/StorySeen;"
internal const val STORY_SEEN_BUTTON = "$EXTENSION_PACKAGE/stories/StorySeenButton;"
private const val SEND_ARGUMENTS =
    "Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;" +
        "Ljava/util/Map;Ljava/util/Set;Z"
internal const val TO_SEND = "$STORY_SEEN->toSend($SEND_ARGUMENTS)Ljava/util/Set;"
internal const val SEND_STUB = "send"
internal const val ON_CARD = "$STORY_SEEN_BUTTON->onCard(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V"
internal const val ON_ACTIVE = "$STORY_SEEN_BUTTON->onActive(Ljava/lang/Object;)V"
internal const val CARD_ID_STUB = "cardId"

/** Literals the controllers' onCardActivated method loads: its state check and its card check. */
internal const val ACTIVATE_STATE = "Received onCardActivated when not attached"
internal const val ACTIVATE_CARD = "Card object cannot be null"

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")

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

/** Whether [sender] takes a callback and then [SENDER_SHAPE], the arguments the hook hands over. */
internal fun hasSendShape(sender: Method): Boolean {
    val parameters = sender.parameterTypes.map { it.toString() }
    return parameters.size == SENDER_SHAPE.size + 1 && parameters.first().startsWith("L") &&
        parameters.drop(1) == SENDER_SHAPE
}

/** Whether [method] calls [target], a method of another class or its own. */
private fun calls(method: Method, target: Method): Boolean =
    method.implementation?.instructions?.any { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref != null && ref.definingClass == target.definingClass && ref.name == target.name &&
            ref.parameterTypes.map { it.toString() } == target.parameterTypes.map { it.toString() } &&
            ref.returnType == target.returnType
    } == true

/** The seen helper: the one class among [holders] (the classes loading [SEEN_HELPER_LITERAL]) with a method calling [sender]. */
internal fun seenHelper(holders: List<ClassDef>, sender: Method): ClassDef {
    val helpers = holders.filter { holder -> holder.methods.any { calls(it, sender) } }.distinctBy { it.type }
    return helpers.singleOrNull()
        ?: refuse("expected one class loading \"$SEEN_HELPER_LITERAL\" that calls the sender, found ${helpers.size}")
}

/** The seen helper's per-card method: its one static void (FbUserSession, StoryBucket, StoryCard, helper, boolean). */
internal fun cardSeen(helper: ClassDef): Method {
    val shape = listOf(FB_USER_SESSION, STORY_BUCKET, STORY_CARD, helper.type, "Z")
    val methods = helper.methods.filter {
        AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" && it.implementation != null &&
            it.parameterTypes.map { type -> type.toString() } == shape
    }
    return methods.singleOrNull() ?: refuse("expected one static per-card method in ${helper.type}, found ${methods.size}")
}

/**
 * First thing in the sender: hand the extension everything the sender was handed, and send the
 * set of card ids it answers in the set's place, or return without sending on null. When the
 * answer is a set of its own (only the marked cards), the card filters go as null too: Facebook
 * builds them from every card the viewer saw and writes them into the same report, so they'd
 * carry the held cards' ids along. Every argument goes as a range, since the sender's registers
 * run past v15, and the moves that reach p6 and p7 take the 16-bit forms for the same reason.
 */
internal fun MutableMethod.filterViews() {
    if (!hasSendShape(this)) {
        refuse("the sender $definingClass->$name doesn't take a callback and ${SENDER_SHAPE.joinToString("")}")
    }
    requireLocals(PATCH, 2)
    addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p8 }, $TO_SEND
            move-result-object v0
            if-nez v0, :answered
            return-void
            :answered
            move-object/from16 v1, p7
            if-eq v0, v1, :own
            const/4 v1, 0x0
            move-object/from16 p6, v1
            :own
            move-object/from16 p7, v0
        """,
    )
}

/** First thing in the helper's per-card method: tell the button which card is on screen, and with which session. */
internal fun MutableMethod.reportCard() {
    addInstructions(
        0,
        """
            invoke-static/range { p0 .. p2 }, $ON_CARD
        """,
    )
}

/** Whether [method] is the controllers' onCardActivated: an instance void taking two objects, with both literals. */
internal fun isCardActivation(method: Method): Boolean =
    !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" && method.parameterTypes.size == 2 &&
        holdsString(method, ACTIVATE_STATE) && holdsString(method, ACTIVATE_CARD)

/** The index of the store of the activated card in [method], an iput-object of a StoryCard into the method's own class, or -1. */
internal fun activeCardStore(method: Method): Int {
    val stores = method.implementation?.instructions?.withIndex()?.filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode == Opcode.IPUT_OBJECT && ref != null && ref.type == STORY_CARD &&
            ref.definingClass == method.definingClass
    }.orEmpty().toList()
    return stores.singleOrNull()?.index ?: -1
}

/** Right after the activated card is stored: hand the button the card, which the store's register still holds. */
internal fun MutableMethod.reportActive(store: Int) {
    val register = (getInstruction(store) as OneRegisterInstruction).registerA
    addInstructions(
        store + 1,
        """
            invoke-static/range { v$register .. v$register }, $ON_ACTIVE
        """,
    )
}

/** The extension's send stub calls [sender], whose class and callback type come from the sender itself. */
internal fun MutableMethod.fillSend(sender: Method) {
    val callback = sender.parameterTypes.first().toString()
    val call = "${sender.definingClass}->${sender.name}(${sender.parameterTypes.joinToString("")})V"
    addInstructions(
        0,
        """
            check-cast p0, ${sender.definingClass}
            check-cast p1, $callback
            check-cast p2, $FB_USER_SESSION
            invoke-virtual/range { p0 .. p8 }, $call
            return-void
        """,
    )
}

/** The extension's card id stub asks the card for the id the seen helper queues. */
internal fun MutableMethod.fillCardId() {
    addInstructions(
        0,
        """
            check-cast p0, $STORY_CARD
            invoke-virtual/range { p0 .. p0 }, $CARD_ID
            move-result-object p0
            return-object p0
        """,
    )
}
