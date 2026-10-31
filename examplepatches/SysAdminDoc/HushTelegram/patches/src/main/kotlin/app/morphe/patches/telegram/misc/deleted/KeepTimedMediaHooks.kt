/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.deleted

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.parameterRegister
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val KEEP_TIMED_MEDIA = "$EXTENSION_PACKAGE/misc/KeepTimedMedia;"
internal const val TIMED_DIALOG_OBJECT = "Lorg/telegram/messenger/DialogObject;"
private const val TIMED_STORAGE = "Lorg/telegram/messenger/MessagesStorage;"
private const val TIMED_OBJECT = "Ljava/lang/Object;"
/** What a chat calls when timed media opens: it tells the server and starts the timer. */
internal const val TIMED_OPENED = "$MESSAGES_CONTROLLER->markMessageAsRead2(JILorg/telegram/tgnet/TLRPC\$InputChannel;IJZ)V"
/** What a chat calls when view-once media opens, with the expired mark it sets right after. */
internal const val TIMED_SHOW_ONCE = "$MESSAGES_CONTROLLER->createDeleteShowOnceTask(JI)J"
internal const val TIMED_FORCE_EXPIRED = "$MESSAGE_OBJECT->forceExpired:Z"
private const val TIMED_IS_OUT = "$MESSAGE_OBJECT->isOut()Z"
private const val TIMED_IS_SECRET_MEDIA = "$MESSAGE_OBJECT->isSecretMedia()Z"
private const val TIMED_OWNER = "$MESSAGE_OBJECT->messageOwner:Lorg/telegram/tgnet/TLRPC\$Message;"
private const val TIMED_DIALOG_ID = "$MESSAGE_OBJECT->getDialogId()J"
private const val TIMED_IS_ENCRYPTED = "$TIMED_DIALOG_OBJECT->isEncryptedDialog(J)Z"
internal const val TIMED_HOLD = "$KEEP_TIMED_MEDIA->hold(Ljava/lang/Object;)Z"
internal const val TIMED_KEEP_STORED = "$KEEP_TIMED_MEDIA->keepStored(J)Z"

/**
 * One place Telegram starts, expires or wipes timed media, asked first. [parameter] is the message,
 * or the chat ID when [stored]. A yes returns what the method returns for media with no timer:
 * nothing, or null.
 */
internal class TimedMediaSite(val method: MutableMethod, val what: String, private val parameter: String, private val stored: Boolean) {
    fun insert(target: MutableMethod) {
        val ask = if (stored) {
            val high = "p" + (parameter.removePrefix("p").toInt() + 1)
            "invoke-static/range {$parameter .. $high}, $TIMED_KEEP_STORED"
        } else {
            "move-object/from16 v0, $parameter\ninvoke-static {v0}, $TIMED_HOLD"
        }
        val answer = if (target.returnType == "V") "return-void" else "const/4 v0, 0x0\nreturn-object v0"
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

private fun Method.takes(vararg types: String) = parameterTypes.map(CharSequence::toString) == types.toList()

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
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        for (m in cls.methods) {
            if (m.takes(MESSAGE_OBJECT, "Z") && m.returnType.startsWith("L") && !AccessFlags.STATIC.isSet(m.accessFlags) &&
                m.refs().let { TIMED_OPENED in it && TIMED_IS_SECRET_MEDIA in it }) found += cls.type to m.name
        }
    }
    timedNeed(found.size == 1, "the chat's timed media opening is missing or ambiguous (${found.size} found)")
    val (type, name) = found.single()
    val method = mutableClassDefBy(type).methods.single { it.name == name && it.takes(MESSAGE_OBJECT, "Z") }
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
    forEachClassMentioning(Mention.reference(TIMED_SHOW_ONCE) and Mention.reference(TIMED_FORCE_EXPIRED)) { cls ->
        if (cls.type == MESSAGES_CONTROLLER || cls.type.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        for (m in cls.methods) {
            if (m.parameterTypes.count { it.toString() == MESSAGE_OBJECT } == 1 && m.returnType.startsWith("L") &&
                m.refs().let { TIMED_SHOW_ONCE in it && TIMED_FORCE_EXPIRED in it }) found += cls.type to m.toString()
        }
    }
    timedNeed(found.size == 1, "the chat's view-once expiry is missing or ambiguous (${found.size} found)")
    val (type, signature) = found.single()
    val method = mutableClassDefBy(type).methods.single { it.toString() == signature }
    ready(method, "the chat's view-once expiry")
    return TimedMediaSite(method, "view-once expiry", method.parameterRegister(method.parameterTypes.indexOfFirst { it.toString() == MESSAGE_OBJECT }),
        stored = false)
}

/** MessagesController's marking a voice or video message played, which also tells the server. */
private fun BytecodePatchContext.contentRead(): TimedMediaSite {
    val method = mutableClassDefBy(MESSAGES_CONTROLLER).methods.filter {
        it.name == "markMessageContentAsRead" && it.takes(MESSAGE_OBJECT) && it.returnType == "V" && !AccessFlags.STATIC.isSet(it.accessFlags)
    }
    timedNeed(method.size == 1, "MessagesController.markMessageContentAsRead is missing or ambiguous")
    ready(method.single(), "the played mark")
    return TimedMediaSite(method.single(), "played mark", method.single().parameterRegister(0), stored = false)
}

/** MessagesStorage's emptying of expired timed media from a chat's stored messages. */
private fun BytecodePatchContext.emptyMedia(): TimedMediaSite {
    val storage = mutableClassDefByOrNull(TIMED_STORAGE)
    timedNeed(storage != null, "MessagesStorage is missing")
    val method = storage!!.methods.filter {
        it.name == "emptyMessagesMedia" && it.takes("J", "Ljava/util/ArrayList;") && it.returnType == "V" && !AccessFlags.STATIC.isSet(it.accessFlags)
    }
    timedNeed(method.size == 1, "MessagesStorage.emptyMessagesMedia is missing or ambiguous")
    ready(method.single(), "the stored media emptying")
    return TimedMediaSite(method.single(), "stored media emptying", method.single().parameterRegister(0), stored = true)
}
