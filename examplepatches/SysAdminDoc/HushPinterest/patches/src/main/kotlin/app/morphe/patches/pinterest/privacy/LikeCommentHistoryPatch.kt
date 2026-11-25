/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.privacy

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.parameterRegisterNumber
import app.morphe.patches.pinterest.misc.extension.patchLog
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireParameterIntact
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.pinterest.ui.instructions
import app.morphe.patches.pinterest.ui.one
import app.morphe.patches.pinterest.ui.passed
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Annotation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue

private const val PATCH = "Like and comment history"
private const val STRING = "Ljava/lang/String;"

internal const val ACTIVITY_HISTORY = "$EXTENSION_PACKAGE/privacy/ActivityHistory;"
internal const val LIKE_SENT_HOOK = "$ACTIVITY_HISTORY->likeSent(Ljava/lang/Object;Ljava/lang/String;I)V"
internal const val LIKE_REMOVED_HOOK = "$ACTIVITY_HISTORY->likeRemoved(Ljava/lang/String;)V"
internal const val COMMENT_POSTED_HOOK = "$ACTIVITY_HISTORY->commentPosted(Ljava/lang/String;Ljava/lang/String;)V"
internal const val REPLY_POSTED_HOOK = "$ACTIVITY_HISTORY->replyPosted(Ljava/lang/String;Ljava/lang/String;)V"

/** Pinterest's API path for a reaction on a pin. A POST there sends one and a DELETE takes it back. */
internal const val REACT_PATH = "pins/{pinUid}/react/"

/** Pinterest's API paths that post a comment: on a pin, on a "did it" photo, and a reply to a comment. */
internal const val PIN_COMMENT_PATH = "aggregated_pin_data/{aggregatedPinDataId}/comment/"
internal const val DID_IT_COMMENT_PATH = "did_it/{didItId}/comments/"
internal const val REPLY_PATH = "aggregated_comments/{aggregatedCommentId}/reply/"
internal val COMMENT_POST_PATHS = setOf(PIN_COMMENT_PATH, DID_IT_COMMENT_PATH, REPLY_PATH)

/** The names Pinterest's API gives the request values the hooks read, which stay because the server reads them. */
private const val PIN_UID = "pinUid"
private const val REACTION_TYPE = "reaction_type"
private const val PIN_FIELD = "pin"
private const val TEXT_FIELD = "text"

private val HISTORY_CALLS = setOf(Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE)
private val OBJECT_MOVES = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)

/**
 * One of Pinterest's API methods the hooks follow: [path] is its address, [pin] the declared
 * parameter carrying the pin's id, and [extra] the reaction type for a reaction sent, the text for
 * a comment, or null for a reaction taken back.
 */
internal class HistoryEndpoint(val method: Method, val path: String, val pin: Int, val extra: Int?)

/** The reactions sent, the reactions taken back and the comment posts found among Pinterest's API interfaces. */
internal class HistoryEndpoints(
    val react: List<HistoryEndpoint>,
    val unreact: List<HistoryEndpoint>,
    val comments: List<HistoryEndpoint>,
) {
    fun all() = react + unreact + comments
}

/** A call to [endpoint] at instruction [at] of [method]. */
internal class HistorySite(val method: Method, val at: Int, val endpoint: HistoryEndpoint) {
    /** The register the call passes declared parameter [parameter] of the endpoint in, read off the call itself. */
    fun argument(parameter: Int): Int {
        val slot = 1 + endpoint.method.parameterTypes.take(parameter).sumOf { historySlots(it) }
        return method.instructions()[at].passed()[slot]
    }
}

/** How many registers a value of [type] takes: two for a long or a double. */
internal fun historySlots(type: CharSequence): Int = if (type.toString() == "J" || type.toString() == "D") 2 else 1

/** The one call that sends a reaction and the one that takes it back, and which of the first method's parameters is the pin. */
internal class LikeSites(val react: HistorySite, val unreact: HistorySite, val model: Int)

/** Code for in front of instruction [at] of [method], one smali instruction a line. */
internal class HistoryInsert(val method: Method, val at: Int, val lines: List<String>)

/** An annotation's `value` when it's a string: an API path on a method, a request value's name on a parameter. */
private fun Annotation.historyValue(): String? =
    elements.firstOrNull { it.name == "value" }?.let { (it.value as? StringEncodedValue)?.value }

/**
 * Pinterest's API methods for reactions and comment posts, read off the annotations its network
 * library keeps on them: the path on the method and each request value's name on its parameter.
 * Both survive obfuscation, since the server reads them.
 */
internal fun BytecodePatchContext.historyEndpoints(): HistoryEndpoints {
    val react = mutableListOf<HistoryEndpoint>()
    val unreact = mutableListOf<HistoryEndpoint>()
    val comments = mutableListOf<HistoryEndpoint>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT) || !AccessFlags.INTERFACE.isSet(owner.accessFlags)) return@classDefForEach
        for (method in owner.methods) {
            val path = method.annotations.mapNotNull { it.historyValue() }
                .firstOrNull { it == REACT_PATH || it in COMMENT_POST_PATHS } ?: continue
            val names = method.parameters.map { parameter -> parameter.annotations.firstNotNullOfOrNull { it.historyValue() } }
            val types = method.parameterTypes.map { it.toString() }
            val named = { name: String, type: String -> names.indices.singleOrNull { names[it] == name && types[it] == type } }
            if (path == REACT_PATH) {
                val pin = named(PIN_UID, STRING) ?: continue
                val type = named(REACTION_TYPE, "I")
                if (type != null) react += HistoryEndpoint(method, path, pin, type)
                else if (REACTION_TYPE !in names) unreact += HistoryEndpoint(method, path, pin, null)
            } else {
                val pin = named(PIN_FIELD, STRING) ?: continue
                val text = named(TEXT_FIELD, STRING) ?: continue
                comments += HistoryEndpoint(method, path, pin, text)
            }
        }
    }
    return HistoryEndpoints(react, unreact, comments)
}

/** Every call outside the extension to one of [endpoints]. */
internal fun BytecodePatchContext.historySites(endpoints: List<HistoryEndpoint>): List<HistorySite> {
    val byIdentity = endpoints.associateBy { it.method.identity() }
    val sites = mutableListOf<HistorySite>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        for (method in owner.methods) {
            val body = method.implementation?.instructions ?: continue
            for ((at, instruction) in body.withIndex()) {
                if (instruction.opcode !in HISTORY_CALLS) continue
                val called = (instruction as ReferenceInstruction).reference as? MethodReference ?: continue
                val endpoint = byIdentity[called.identity()] ?: continue
                sites += HistorySite(method, at, endpoint)
            }
        }
    }
    return sites
}

/**
 * The calls the like hooks go in front of. Pinterest sends a reaction from one place and takes it
 * back from one place (14.45.0: both in the method that turns a reaction request into an API call).
 */
internal fun likeSites(endpoints: HistoryEndpoints, sites: List<HistorySite>): LikeSites {
    val react = endpoints.react.one("$PATCH: the API call that sends a reaction on a pin")
    val unreact = endpoints.unreact.one("$PATCH: the API call that takes a reaction back")
    val sent = sites.filter { it.endpoint === react }.one("$PATCH: the place Pinterest sends a reaction")
    val taken = sites.filter { it.endpoint === unreact }.one("$PATCH: the place Pinterest takes a reaction back")
    return LikeSites(sent, taken, sent.method.pinModelParameter())
}

/**
 * The declared parameter that holds the pin model the reaction is for: the one the method copies
 * into a local and casts there, among its first few instructions. 14.45.0 copies the request and
 * the model that way and casts only the model to Pinterest's pin class.
 */
private fun Method.pinModelParameter(): Int {
    val body = instructions()
    return parameterTypes.indices.filter { index ->
        val register = parameterRegisterNumber(index)
        (0 until minOf(4, body.size - 1)).any { at ->
            val copy = body[at] as? TwoRegisterInstruction
            val cast = body[at + 1]
            copy != null && copy.opcode in OBJECT_MOVES && copy.registerB == register &&
                cast.opcode == Opcode.CHECK_CAST && (cast as OneRegisterInstruction).registerA == copy.registerA
        }
    }.one("$PATCH: the pin model the reaction is sent for")
}

/**
 * In front of the reaction sent, the pin model, the pin's id and the reaction type go to the
 * extension. The model arrives as a parameter, which Pinterest leaves alone up to the call, so the
 * hook copies it into a free local first. In front of the reaction taken back goes the pin's id.
 */
internal fun likeInserts(sites: LikeSites): List<HistoryInsert> {
    val sent = sites.react
    val pin = sent.argument(sent.endpoint.pin)
    val type = sent.argument(sent.endpoint.extra ?: throw PatchException("$PATCH: the reaction call has no type"))
    if (pin > 15 || type > 15) {
        throw PatchException("$PATCH: the reaction's pin (v$pin) and type (v$type) are out of a call's reach")
    }
    sent.method.requireParameterIntact("$PATCH: the pin model", sites.model, listOf(sent.at))
    val model = sent.method.parameterRegisterNumber(sites.model)
    val scratch = sent.method.freeLocalsAt("$PATCH: the pin model", sent.at, 1, reads = listOf(pin, type)).single()
    val taken = sites.unreact
    val unliked = taken.argument(taken.endpoint.pin)
    return listOf(
        HistoryInsert(sent.method, sent.at, listOf(
            "move-object/from16 v$scratch, v$model",
            "invoke-static { v$scratch, v$pin, v$type }, $LIKE_SENT_HOOK",
        )),
        HistoryInsert(taken.method, taken.at, listOf("invoke-static/range { v$unliked .. v$unliked }, $LIKE_REMOVED_HOOK")),
    )
}

/**
 * In front of each comment and reply post, the pin's id and the text go to the extension. A comment
 * on a pin has to be among them, or Pinterest posts comments some way this patch doesn't know.
 */
internal fun commentInserts(sites: List<HistorySite>): List<HistoryInsert> {
    if (sites.none { it.endpoint.path == PIN_COMMENT_PATH }) {
        throw PatchException("$PATCH: nothing calls Pinterest's API to comment on a pin")
    }
    return sites.map { site ->
        val pin = site.argument(site.endpoint.pin)
        val text = site.argument(site.endpoint.extra ?: throw PatchException("$PATCH: a comment call has no text"))
        val hook = if (site.endpoint.path == REPLY_PATH) REPLY_POSTED_HOOK else COMMENT_POSTED_HOOK
        val call = when {
            pin <= 15 && text <= 15 -> "invoke-static { v$pin, v$text }, $hook"
            text == pin + 1 -> "invoke-static/range { v$pin .. v$text }, $hook"
            else -> throw PatchException(
                "$PATCH: a comment's pin (v$pin) and text (v$text) in ${site.method.definingClass}->${site.method.name} " +
                    "are out of a call's reach",
            )
        }
        HistoryInsert(site.method, site.at, listOf(call))
    }
}

/** Throws unless the extension has each hook as a public static method Pinterest's code can call. */
private fun BytecodePatchContext.requireHistoryHooks() {
    val owner = classDefByOrNull(ACTIVITY_HISTORY) ?: throw PatchException("$PATCH: the extension has no $ACTIVITY_HISTORY")
    for (hook in listOf(LIKE_SENT_HOOK, LIKE_REMOVED_HOOK, COMMENT_POSTED_HOOK, REPLY_POSTED_HOOK)) {
        val method = owner.methods.singleOrNull { it.identity() == hook }
        if (method == null || !AccessFlags.PUBLIC.isSet(method.accessFlags) || !AccessFlags.STATIC.isSet(method.accessFlags)) {
            throw PatchException("$PATCH: no callable hook $hook")
        }
    }
}

private fun BytecodePatchContext.historyMutable(method: Method): MutableMethod =
    mutableClassDefBy(method.definingClass).methods.single {
        it.name == method.name && it.returnType == method.returnType &&
            it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
    }

/**
 * Keeps a list on the phone of the pins you like and the comments and replies you post (#48).
 * Pinterest has no such list of its own. Hooks in front of its API calls for a reaction sent, a
 * reaction taken back, a comment and a reply hand the extension what each sends, and the extension
 * notes it while the switch is on. Likes and comments go in apart, so a build where one of them
 * moved still gets the other.
 */
@Suppress("unused")
val likeCommentHistoryPatch = bytecodePatch(
    name = PATCH,
    description = "Keeps a list on your phone of the pins you like and the comments and replies you post. Find it " +
        "under Your likes and comments in HushPinterest settings > Privacy, where you can show only likes or only " +
        "comments and tap one to open its pin. Unliking a pin takes it off the list. Starts off. Turn it on in " +
        "HushPinterest settings > Privacy.",
) {
    category("Privacy")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("likeCommentHistory")
        requireStatusMethod("likeHistory")
        requireStatusMethod("commentHistory")
        requireHistoryHooks()
        val endpoints = historyEndpoints()
        val sites = historySites(endpoints.all())
        val reasons = mutableListOf<String>()
        // Each part is found and checked whole before anything changes, so a part left out leaves no trace.
        val likes = try {
            likeInserts(likeSites(endpoints, sites))
        } catch (missing: PatchException) {
            reasons += "likes left out (${missing.message})"
            null
        }
        val comments = try {
            commentInserts(sites.filter { site -> endpoints.comments.any { it === site.endpoint } })
        } catch (missing: PatchException) {
            reasons += "comments left out (${missing.message})"
            null
        }
        if (likes == null && comments == null) {
            throw PatchException("$PATCH: this Pinterest build has neither part. ${reasons.joinToString("; ")}")
        }
        reasons.forEach { patchLog.warning("$PATCH: $it. The patch goes on with the other part.") }

        val inserts = (likes ?: emptyList()) + (comments ?: emptyList())
        for (group in inserts.groupBy { it.method.identity() }.values) {
            val method = historyMutable(group.first().method)
            // From the last instruction up, so each index still names the stock instruction it was read at.
            for (insert in group.sortedByDescending { it.at }) {
                method.addInstructionsAtControlFlowLabel(insert.at, insert.lines.joinToString("\n"))
            }
        }
        if (likes != null) enableCapability("likeHistory")
        if (comments != null) enableCapability("commentHistory")
        enableStatus("likeCommentHistory")
    }
}
