/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.comments

import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/*
 * How Facebook picks the order of a post's comments, on the 577 and 580 builds.
 *
 * A comment sheet (the flyout a feed post, a video or a reel opens its comments in) gets its
 * comments from one GraphQL request, built from a FetchFeedbackParams, a class Redex keeps. Its
 * builder, a method that takes FetchFeedbackParams and the FbUserSession, turns the params' strings
 * into the request's variables, `feedback_id`, `focused_comment_id` and
 * `comment_rendering_intent_token` among them. The last one is the order, and it goes into the
 * request only when it isn't empty. The sheet's own FeedbackParams (kept too) calls it
 * commentRenderingIntentToken, and an ordinary sheet has none, so the request leaves the variable
 * out and Facebook's servers choose. Their answer names the order they chose
 * (`comment_rendering_instance.selected_intent.intent_token`), and the sheet's sort menu lists the
 * orders the post offers, each with its own `intent_token`.
 *
 * Picking an order in that menu runs the sheet's pick handler, the one method that takes the
 * FbUserSession and the picked token and fetches "UpdateCommentOrderType_FetchFeedbackQuery". It
 * copies the sheet's FeedbackParams with the picked token, and the copy's request goes out with it.
 * The sheet keeps its original params, though, so a refresh sends no order again, and reopening
 * the post starts over from Facebook's choice. That's the "Most relevant keeps coming back" people
 * report.
 *
 * A link to one comment (a notification about a reply, say) opens the sheet with a focused comment
 * id. Facebook's feedback controller keeps a separate request builder for that case, which puts the
 * comment's id into the request as `focused_comment_id`. A post's own page, where many
 * notifications land, is another request altogether (FetchSingleStoryParams), which carries the
 * order its link names, and this patch leaves it alone.
 *
 * The tokens are Facebook's own: RANKED_FILTERED_INTENT_V1 is Most relevant,
 * RECENT_ACTIVITY_INTENT_V1 is Newest and RANKED_UNFILTERED_CHRONOLOGICAL_REPLIES_INTENT_V1 is All
 * comments, the three facebook.com asks for too. Both builds carry all three among the default
 * values of their MobileConfig strings.
 *
 * So the patch changes the one place every such request passes: the params' constructor. First
 * thing there, the extension sees the order the request would carry, the post's feedback id and
 * the focused comment id, and answers the order to send. It keeps an order that's there (a pick in
 * the menu, a list that names its own, a restored request) and a link to a comment, and fills in
 * the chosen default only where Facebook's servers would have chosen. A second call, first thing
 * in the pick handler, tells the extension a pick is on its way, so the order picked for a post is
 * asked for again when that post's comments are fetched with none, until Facebook restarts.
 */
internal const val PATCH = "Default comment order"

/** The params of a comment sheet's request. Redex keeps the name. */
internal const val FETCH_FEEDBACK_PARAMS = "Lcom/facebook/api/ufiservices/common/FetchFeedbackParams;"

internal const val USER_SESSION = "Lcom/facebook/auth/usersession/FbUserSession;"
private const val STRING = "Ljava/lang/String;"

/** The request variables whose values the builder reads from the params, each a literal it keeps. */
internal const val ORDER_VARIABLE = "comment_rendering_intent_token"
internal const val FEEDBACK_ID_VARIABLE = "feedback_id"
internal const val FOCUSED_COMMENT_VARIABLE = "focused_comment_id"

/** The request a pick in the sheet's sort menu sends, which its pick handler names. */
internal const val PICK_QUERY = "UpdateCommentOrderType_FetchFeedbackQuery"

/** The extension's answer to the order a request would carry. */
internal const val REQUESTED_ORDER = "$EXTENSION_PACKAGE/comments/DefaultCommentOrder;->" +
    "requestedOrder(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;"

/** Tells the extension an order was picked in a comment sheet's menu. */
internal const val PICKED = "$EXTENSION_PACKAGE/comments/DefaultCommentOrder;->picked(Ljava/lang/String;)V"

/** How far above a variable's name the builder may read its value. Both builds read it 2 to 5 before. */
private const val READ_WINDOW = 6

/** The params' fields the builder turns into the order, the feedback id and the focused comment id. */
internal data class RequestFields(val order: String, val feedbackId: String, val focusedComment: String)

/** The constructor's registers that hold those three when it stores them. */
internal data class RequestRegisters(val order: Int, val feedbackId: Int, val focusedComment: Int)

private val Instruction.string: String?
    get() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private val Instruction.field: FieldReference?
    get() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun FieldReference.key() = "$definingClass->$name:$type"

/** Whether [instruction] can write [register], a wide write counting for both halves. */
private fun writes(instruction: Instruction, register: Int): Boolean {
    val opcode = instruction.opcode
    if (!opcode.setsRegister() || instruction !is OneRegisterInstruction) return false
    val first = instruction.registerA
    return first == register || (opcode.setsWideRegister() && first + 1 == register)
}

/**
 * The params' String field whose value the builder holds when it loads the variable's name at
 * [literal]: the nearest read of such a field in the few instructions above it, with nothing in
 * between writing the register it went to. Null when there's none.
 */
private fun fieldReadAbove(code: List<Instruction>, literal: Int): String? {
    for (index in literal - 1 downTo maxOf(0, literal - READ_WINDOW)) {
        val read = code[index]
        if (read.opcode != Opcode.IGET_OBJECT) continue
        val field = read.field ?: continue
        if (field.definingClass != FETCH_FEEDBACK_PARAMS || field.type != STRING) continue
        val register = (read as OneRegisterInstruction).registerA
        if (code.subList(index + 1, literal).any { writes(it, register) }) return null
        return field.key()
    }
    return null
}

/**
 * The fields [method] reads the order, the feedback id and the focused comment id from, when it's
 * the builder of a comment sheet's request. Null for any other method.
 *
 * The builder takes FetchFeedbackParams and loads each variable's name once, right after reading
 * the value from a String field of the params. The three fields differ.
 */
internal fun requestFields(method: Method): RequestFields? {
    if (method.parameterTypes.none { it.toString() == FETCH_FEEDBACK_PARAMS }) return null
    val code = method.implementation?.instructions?.toList() ?: return null
    fun readFor(variable: String): String? {
        val loads = code.indices.filter { code[it].string == variable }
        return loads.singleOrNull()?.let { fieldReadAbove(code, it) }
    }
    val order = readFor(ORDER_VARIABLE) ?: return null
    val feedbackId = readFor(FEEDBACK_ID_VARIABLE) ?: return null
    val focusedComment = readFor(FOCUSED_COMMENT_VARIABLE) ?: return null
    if (setOf(order, feedbackId, focusedComment).size != 3) return null
    return RequestFields(order, feedbackId, focusedComment)
}

/** The register past the locals, which holds `this` in an instance method. */
private fun Method.thisRegister(): Int {
    val parameters = parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    return implementation!!.registerCount - parameters - 1
}

/**
 * Where [constructor], one of the params' own, stores the three [fields]: the register each is
 * stored from, when it stores each once, into `this`, straight from one of its String parameters,
 * and nothing before the store writes that parameter's register. Null for any other method.
 */
internal fun requestRegisters(constructor: Method, fields: RequestFields): RequestRegisters? {
    if (constructor.name != "<init>" || constructor.definingClass != FETCH_FEEDBACK_PARAMS) return null
    if (AccessFlags.STATIC.isSet(constructor.accessFlags)) return null
    val code = constructor.implementation?.instructions?.toList() ?: return null
    val self = constructor.thisRegister()
    // The v number of each String parameter.
    val stringParameters = mutableSetOf<Int>()
    var next = self + 1
    for (type in constructor.parameterTypes) {
        if (type.toString() == STRING) stringParameters += next
        next += if (type.toString() == "J" || type.toString() == "D") 2 else 1
    }
    fun storedFrom(field: String): Int? {
        val stores = code.indices.filter { code[it].opcode == Opcode.IPUT_OBJECT && code[it].field?.key() == field }
        val store = stores.singleOrNull() ?: return null
        val instruction = code[store] as TwoRegisterInstruction
        if (instruction.registerB != self) return null
        val register = instruction.registerA
        if (register !in stringParameters) return null
        if (code.subList(0, store).any { writes(it, register) }) return null
        return register
    }
    val order = storedFrom(fields.order) ?: return null
    val feedbackId = storedFrom(fields.feedbackId) ?: return null
    val focusedComment = storedFrom(fields.focusedComment) ?: return null
    if (setOf(order, feedbackId, focusedComment).size != 3) return null
    return RequestRegisters(order, feedbackId, focusedComment)
}

/**
 * Whether [method] is a comment sheet's pick handler: an instance method returning nothing, taking
 * the FbUserSession and the picked token, that fetches [PICK_QUERY].
 */
internal fun isPickHandler(method: Method): Boolean =
    method.implementation != null && !AccessFlags.STATIC.isSet(method.accessFlags) &&
        !AccessFlags.ABSTRACT.isSet(method.accessFlags) && method.returnType == "V" &&
        method.parameterTypes.map { it.toString() } == listOf(USER_SESSION, STRING) &&
        holdsString(method, PICK_QUERY)
