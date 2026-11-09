/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.deleted

import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.liveAcrossInjection
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.parameterRegister
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

internal const val KEEP_TIMED_MEDIA = "$EXTENSION_PACKAGE/misc/KeepTimedMedia;"
internal const val TIMED_DIALOG_OBJECT = "Lorg/telegram/messenger/DialogObject;"
private const val TIMED_OBJECT = "Ljava/lang/Object;"
/** What a chat calls when timed media opens: it tells the server and starts the timer. */
internal const val TIMED_OPENED = "$MESSAGES_CONTROLLER->markMessageAsRead2(JILorg/telegram/tgnet/TLRPC\$InputChannel;IJZ)V"
/** What a chat calls when view-once media opens, with the expired mark it sets right after. */
internal const val TIMED_SHOW_ONCE = "$MESSAGES_CONTROLLER->createDeleteShowOnceTask(JI)J"
/** The same call on 13.2, where R8 put the message ID ahead of the chat. */
private const val TIMED_SHOW_ONCE_IDS_FIRST = "$MESSAGES_CONTROLLER->createDeleteShowOnceTask(IJ)J"
internal val TIMED_SHOW_ONCE_CALLS = setOf(TIMED_SHOW_ONCE, TIMED_SHOW_ONCE_IDS_FIRST)
internal const val TIMED_FORCE_EXPIRED = "$MESSAGE_OBJECT->forceExpired:Z"
private const val TIMED_IS_OUT = "$MESSAGE_OBJECT->isOut()Z"
private const val TIMED_IS_SECRET_MEDIA = "$MESSAGE_OBJECT->isSecretMedia()Z"
private const val TIMED_OWNER = "$MESSAGE_OBJECT->messageOwner:Lorg/telegram/tgnet/TLRPC\$Message;"
private const val TIMED_DIALOG_ID = "$MESSAGE_OBJECT->getDialogId()J"
private const val TIMED_IS_ENCRYPTED = "$TIMED_DIALOG_OBJECT->isEncryptedDialog(J)Z"
internal const val TIMED_HOLD = "$KEEP_TIMED_MEDIA->hold(Ljava/lang/Object;)Z"
internal const val TIMED_KEEP_STORED = "$KEEP_TIMED_MEDIA->keepStored(J)Z"
/** What emptying a chat's expired media reads back first, the start of a query R8 builds piece by piece. */
internal const val TIMED_EMPTY_QUERY = "SELECT data, mid, date, uid, custom_params FROM messages_v2 WHERE mid IN ("

/**
 * One place Telegram starts, expires or wipes timed media, asked first. [parameter] is the message,
 * or the chat ID when [stored]. A yes returns what the method returns for media with no timer:
 * nothing, or null.
 */
internal open class TimedMediaSite(val method: MutableMethod, val what: String, private val parameter: String, private val stored: Boolean) {
    open fun insert(target: MutableMethod) {
        val ask = if (stored) {
            val high = "p" + (parameter.removePrefix("p").toInt() + 1)
            "invoke-static/range {$parameter .. $high}, $TIMED_KEEP_STORED"
        } else {
            "move-object/from16 v0, $parameter\ninvoke-static {v0}, $TIMED_HOLD"
        }
        val answer = if (target.origReturnType == "V") "return-void" else "const/4 v0, 0x0\nreturn-object v0"
        target.addInstructionsWithLabels(0, """
            $ask
            move-result v0
            if-eqz v0, :hush_stock
            $answer
        """, ExternalLabel("hush_stock", target.getInstruction(0)))
    }
}

/** The four places, or why this build can't have Keep view-once and timed media. */
internal class KeepTimedMediaPlan(val sites: List<TimedMediaSite>, val missing: String?)

private class TimedMediaUnbuilt(why: String) : Exception(why)

private fun timedNeed(ok: Boolean, why: String) {
    if (!ok) throw TimedMediaUnbuilt(why)
}

/**
 * The runtime's questions and where they go: the chat's timed media opening, its view-once
 * expiring, a voice or video message marked played, and storage emptying expired media. The
 * runtime missing refuses the patch. Telegram's side missing leaves the switch out and the rest of
 * Keep deleted messages in.
 */
internal fun BytecodePatchContext.resolveKeepTimedMedia(): KeepTimedMediaPlan {
    requireStatusMethod("keepTimedMedia")
    controlHook(KEEP_TIMED_MEDIA, "hold", listOf(TIMED_OBJECT), "Z")
    controlHook(KEEP_TIMED_MEDIA, "keepStored", listOf("J"), "Z")
    controlHook(KEEP_TIMED_MEDIA, "receivedTimedMedia", listOf(TIMED_OBJECT), "Z")
    controlHook(KEEP_TIMED_MEDIA, "secretChat", listOf(TIMED_OBJECT), "Z")
    controlHook(KEEP_TIMED_MEDIA, "secretDialog", listOf("J"), "Z")
    return try {
        for (reference in listOf(TIMED_IS_OUT, TIMED_IS_SECRET_MEDIA, TIMED_DIALOG_ID, TIMED_OWNER)) requireReachable(reference, false)
        requireReachable(TIMED_IS_ENCRYPTED, true)
        KeepTimedMediaPlan(listOf(opener(), expirer(), contentRead(), emptyMedia()), null)
    } catch (missing: TimedMediaUnbuilt) {
        KeepTimedMediaPlan(emptyList(), missing.message)
    } catch (missing: PatchException) {
        KeepTimedMediaPlan(emptyList(), missing.message)
    }
}

/** Puts every hook in, on copies first so a refusal leaves the app untouched, then writes the stubs. */
internal fun BytecodePatchContext.applyKeepTimedMedia(plan: KeepTimedMediaPlan) {
    for (site in plan.sites) site.insert(MutableMethod(ImmutableMethod.of(site.method)))
    for (site in plan.sites) site.insert(site.method)
    writeStub(KEEP_TIMED_MEDIA, "receivedTimedMedia", 2, """
        check-cast p0, $MESSAGE_OBJECT
        invoke-virtual {p0}, $TIMED_IS_OUT
        move-result v0
        if-nez v0, :hush_no
        invoke-virtual {p0}, $TIMED_IS_SECRET_MEDIA
        move-result v0
        return v0
        :hush_no
        const/4 v0, 0x0
        return v0
    """)
    // A message that can't say which chat it's in counts as a secret chat's.
    writeStub(KEEP_TIMED_MEDIA, "secretChat", 3, """
        check-cast p0, $MESSAGE_OBJECT
        iget-object v0, p0, $TIMED_OWNER
        if-eqz v0, :hush_secret
        invoke-virtual {p0}, $TIMED_DIALOG_ID
        move-result-wide v0
        invoke-static {v0, v1}, $TIMED_IS_ENCRYPTED
        move-result v0
        return v0
        :hush_secret
        const/4 v0, 0x1
        return v0
    """)
    writeStub(KEEP_TIMED_MEDIA, "secretDialog", 3, """
        invoke-static {p0, p1}, $TIMED_IS_ENCRYPTED
        move-result v0
        return v0
    """)
}

private fun Method.refs() = controlBody().mapNotNull { it.controlRef() }.toSet()

private fun Method.takes(vararg types: String) = origParameterTypes == types.toList()

/** Throws unless [method] is still stock at its start and has a local for the answer. */
private fun ready(method: Method, what: String) {
    timedNeed(method.controlBody().none { it.controlRef()?.startsWith(KEEP_TIMED_MEDIA) == true }, "$what is already hooked")
    timedNeed(method.localRegisterCount() >= 1, "$what has no register for the answer")
}

/**
 * The chat's own reading of a message it shows, which starts timed media's timer once it opens:
 * an instance method taking the message and a flag, returning the timer's runnable or null, that
 * tells the server through [TIMED_OPENED] and checks [TIMED_IS_SECRET_MEDIA].
 */
private fun BytecodePatchContext.opener(): TimedMediaSite {
    val found = mutableListOf<Pair<String, String>>()
    forEachClassMentioning(Mention.reference(TIMED_OPENED) and Mention.reference(TIMED_IS_SECRET_MEDIA)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        for (m in cls.methods) {
            if (m.takes(MESSAGE_OBJECT, "Z") && m.origReturnType.startsWith("L") && !AccessFlags.STATIC.isSet(m.accessFlags) &&
                m.refs().let { TIMED_OPENED in it && TIMED_IS_SECRET_MEDIA in it }) found += cls.origType to m.name
        }
    }
    timedNeed(found.size == 1, "the chat's timed media opening is missing or ambiguous (${found.size} found)")
    val (type, name) = found.single()
    val method = tgMutableClassDefBy(type).methods.single { it.name == name && it.takes(MESSAGE_OBJECT, "Z") }
    ready(method, "the chat's timed media opening")
    return TimedMediaSite(method, "timed media opening", method.parameterRegister(0), stored = false)
}

/**
 * The chat's expiring of view-once media as its viewer opens: a static method outside
 * MessagesController that takes the chat and the message, queues [TIMED_SHOW_ONCE], sets
 * [TIMED_FORCE_EXPIRED], and returns the viewer's close action or null.
 */
private fun BytecodePatchContext.expirer(): TimedMediaSite {
    val found = mutableListOf<Pair<String, String>>()
    forEachClassMentioning(Mention.anyReference(TIMED_SHOW_ONCE_CALLS) and Mention.reference(TIMED_FORCE_EXPIRED)) { cls ->
        if (cls.origType == MESSAGES_CONTROLLER || cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        for (m in cls.methods) {
            if (m.origParameterTypes.count { it == MESSAGE_OBJECT } == 1 && m.origReturnType.startsWith("L") &&
                m.refs().let { refs -> TIMED_SHOW_ONCE_CALLS.any { it in refs } && TIMED_FORCE_EXPIRED in refs }) found += cls.origType to m.toString()
        }
    }
    timedNeed(found.size == 1, "the chat's view-once expiry is missing or ambiguous (${found.size} found)")
    val (type, signature) = found.single()
    val method = tgMutableClassDefBy(type).methods.single { it.toString() == signature }
    ready(method, "the chat's view-once expiry")
    return TimedMediaSite(method, "view-once expiry", method.parameterRegister(method.origParameterTypes.indexOf(MESSAGE_OBJECT)),
        stored = false)
}

/** MessagesController's marking a voice or video message played, which also tells the server. */
private fun BytecodePatchContext.contentRead(): TimedMediaSite {
    val method = tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.filter {
        it.origName == "markMessageContentAsRead" && it.takes(MESSAGE_OBJECT) && it.origReturnType == "V" && !AccessFlags.STATIC.isSet(it.accessFlags)
    }
    timedNeed(method.size == 1, "MessagesController.markMessageContentAsRead is missing or ambiguous")
    ready(method.single(), "the played mark")
    return TimedMediaSite(method.single(), "played mark", method.single().parameterRegister(0), stored = false)
}

/**
 * The stored media emptying's arm of a merged runnable, asked at the arm's own start with the chat
 * ID the runnable holds in [chat]. [holder] and [pair] are locals nothing reads there: the runnable
 * goes in [holder], the chat ID in [pair] and the one above it, and the answer in [holder].
 */
private class TimedEmptyingArm(method: MutableMethod, private val start: Int, private val chat: String, private val holder: Int,
                               private val pair: Int) : TimedMediaSite(method, "stored media emptying", "p0", stored = true) {
    override fun insert(target: MutableMethod) {
        target.addInstructionsAtControlFlowLabel(start, """
            move-object/from16 v$holder, p0
            iget-wide v$pair, v$holder, $chat
            invoke-static/range {v$pair .. v${pair + 1}}, $TIMED_KEEP_STORED
            move-result v$holder
            if-eqz v$holder, :hush_stock
            return-void
        """, ExternalLabel("hush_stock", target.getInstruction(start)))
    }
}

/**
 * MessagesStorage's emptying of expired timed media from a chat's stored messages. 13.2's R8 inlines
 * emptyMessagesMedia(long, ArrayList) into each of its callers, so what's left of it is the runnable
 * it posts: one arm of a merged lambda's run(), the arm that reads [TIMED_EMPTY_QUERY] back first.
 * The hook goes at that arm's start, where the switch lands, and a yes leaves the media in place.
 */
private fun BytecodePatchContext.emptyMedia(): TimedMediaSite {
    val found = mutableListOf<String>()
    forEachClassMentioning(Mention.string(TIMED_EMPTY_QUERY)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        if (cls.methods.any { it.isRun() && it.controlBody().any { i -> i.controlString() == TIMED_EMPTY_QUERY } }) found += cls.origType
    }
    timedNeed(found.size == 1, "the stored media emptying is missing or ambiguous (${found.size} found)")
    val runnable = tgMutableClassDefBy(found.single())
    val method = runnable.methods.single { it.isRun() }
    ready(method, "the stored media emptying")
    val chat = runnable.fields.filter { it.type == "J" && !AccessFlags.STATIC.isSet(it.accessFlags) }
    timedNeed(chat.size == 1, "the stored media emptying's runnable holds ${chat.size} long fields, not one chat ID")
    val body = method.controlBody()
    val query = body.indexOfFirst { it.controlString() == TIMED_EMPTY_QUERY }
    val switches = body.indices.filter { body[it].opcode == Opcode.PACKED_SWITCH || body[it].opcode == Opcode.SPARSE_SWITCH }
    timedNeed(switches.size == 1, "the stored media emptying's runnable has ${switches.size} switches, not one")
    val flow = ControlFlow.of(method)
    val start = flow.normal[switches.single()].filter { it in (switches.single() + 1)..query }.maxOrNull()
    timedNeed(start != null, "the stored media emptying isn't an arm of its runnable's switch")
    // Straight on from the arm's start to the query, and nothing else jumps in between.
    timedNeed((start!! until query).all { body[it] !is OffsetInstruction && body[it].opcode.canContinue() } &&
        body.indices.none { from -> from !in start until query && (flow.normal[from] + flow.exceptional[from]).any { it in start + 1..query } },
        "the stored media emptying's arm doesn't run straight to its query")
    val free = (0 until minOf(method.localRegisterCount(), 16)).toSet() - method.liveAcrossInjection(start)
    val pair = free.sorted().firstOrNull { it + 1 in free }
    val holder = free.sorted().firstOrNull { pair != null && it != pair && it != pair + 1 }
    timedNeed(pair != null && holder != null, "the stored media emptying's arm has no three free locals for the question")
    return TimedEmptyingArm(method, start, "${runnable.type}->${chat.single().name}:J", holder!!, pair!!)
}

private fun Method.isRun() = name == "run" && parameterTypes.isEmpty() && returnType == "V" && !AccessFlags.STATIC.isSet(accessFlags)
