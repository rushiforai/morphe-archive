/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.voice

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.util.ControlFlow
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstructions
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.origDescriptor
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origString
import app.morphe.util.names.origType
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val VOICE_SKIP = "$EXTENSION_PACKAGE/misc/VoiceSkip;"
internal const val VOICE_SKIP_NEXT = "$VOICE_SKIP->next(I)Z"
internal const val VOICE_SKIP_PREVIOUS = "$VOICE_SKIP->previous()Z"
internal const val VOICE_SKIP_ASKS = "$VOICE_SKIP->skips(Ljava/lang/Object;)Z"
internal const val VOICE_SKIP_ACTIONS = "$VOICE_SKIP->actions(J)J"
internal const val NEXT_SONG = "$MEDIA_CONTROLLER->playNextMessageWithoutOrder(Z)V"
internal const val PREVIOUS_SONG = "$MEDIA_CONTROLLER->playPreviousMessage()V"
internal const val MUSIC_SERVICE = "Lorg/telegram/messenger/MusicPlayerService;"
private const val SKIP_MESSAGE = "Lorg/telegram/messenger/MessageObject;"
private const val PLAYBACK_STATE = "Landroid/support/v4/media/session/PlaybackStateCompat;"
/** 13.2 makes it void; the names table maps it there. */
private const val SEEK_TO = "$MEDIA_CONTROLLER->seekToProgress(${SKIP_MESSAGE}F)Z"
private const val VOICE_QUEUE = "$MEDIA_CONTROLLER->voiceMessagesPlaylist:Ljava/util/ArrayList;"
private const val QUEUE_UNREAD = "$MEDIA_CONTROLLER->voiceMessagesPlaylistUnread:Z"
private const val PROGRESS_SECONDS = "$SKIP_MESSAGE->audioProgressSec:I"
private val SKIP_CALLS = setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)

/**
 * Where next and previous for voice messages go in, or [missing], why this build can't have the
 * switch: Telegram's song skips, which every next and previous button reaches; the music checks
 * its media session makes before it skips; and each place its music service sets the session's
 * buttons, right before the builder stores them.
 */
internal class VoiceSkipSites(
    val next: MutableMethod?,
    val previous: MutableMethod?,
    val gates: List<Pair<MutableMethod, List<Int>>>,
    val actions: List<Pair<MutableMethod, List<Int>>>,
    val missing: String?,
) {
    /** The same edits on copies, so a smali problem refuses before the app is touched. */
    fun rehearse() = edit { MutableMethod(ImmutableMethod.of(it)) }

    fun apply(context: BytecodePatchContext) {
        context.writeVoiceSkipStubs()
        edit { it }
    }

    private fun edit(target: (MutableMethod) -> MutableMethod) {
        skipFirst(target(next!!), "hush_next", parameter = true)
        skipFirst(target(previous!!), "hush_previous", parameter = false)
        gates.forEach { (method, indices) ->
            val copy = target(method)
            for (index in indices) {
                val message = copy.getInstruction(index).namedRegisters().single()
                copy.replaceInstruction(index, if (message > 15) "invoke-static/range {v$message .. v$message}, $VOICE_SKIP_ASKS"
                    else "invoke-static {v$message}, $VOICE_SKIP_ASKS")
            }
        }
        actions.forEach { (method, indices) ->
            val copy = target(method)
            // Highest index first, so an insertion never moves one still waiting.
            for (index in indices.sortedDescending()) {
                val value = copy.getInstruction(index).namedRegisters().first()
                copy.addInstructions(index, """
                    invoke-static/range {v$value .. v${value + 1}}, $VOICE_SKIP_ACTIONS
                    move-result-wide v$value
                """)
            }
        }
    }

    /** Borrows v0, which holds nothing before the method's first instruction, for the extension's answer. */
    private fun skipFirst(target: MutableMethod, label: String, parameter: Boolean) {
        val ask = if (parameter) {
            val byStop = target.parameterRegisterNumber(0)
            if (byStop > 15) "invoke-static/range {v$byStop .. v$byStop}, $VOICE_SKIP_NEXT" else "invoke-static {v$byStop}, $VOICE_SKIP_NEXT"
        } else {
            "invoke-static {}, $VOICE_SKIP_PREVIOUS"
        }
        target.addInstructionsWithLabels(0, """
            $ask
            move-result v0
            if-eqz v0, :$label
            return-void
        """.trimIndent(), ExternalLabel(label, target.getInstruction(0)))
    }

    companion object {
        fun missing(why: String) = VoiceSkipSites(null, null, emptyList(), emptyList(), why)
    }
}

/** The runtime's stubs: the player's message and queue, a message's traits, and the player's play, seek and queue. */
private fun BytecodePatchContext.writeVoiceSkipStubs() {
    val instance = "invoke-static {}, $MEDIA_CONTROLLER->getInstance()$MEDIA_CONTROLLER\nmove-result-object v0"
    writeStub(VOICE_SKIP, "playing", 1, """
        $instance
        ${resolvePlayingRead()}
        return-object v0
    """)
    writeStub(VOICE_SKIP, "queue", 1, """
        $instance
        iget-object v0, v0, $VOICE_QUEUE
        return-object v0
    """)
    writeStub(VOICE_SKIP, "unread", 1, """
        $instance
        iget-boolean v0, v0, $QUEUE_UNREAD
        return v0
    """)
    for ((name, check) in listOf("isMusic" to "isMusic()Z", "isVoice" to "isVoice()Z", "once" to "isVoiceOnce()Z", "id" to "getId()I")) {
        writeStub(VOICE_SKIP, name, 2, """
            check-cast p0, $SKIP_MESSAGE
            invoke-virtual {p0}, $SKIP_MESSAGE->$check
            move-result v0
            return v0
        """)
    }
    writeStub(VOICE_SKIP, "dialog", 3, """
        check-cast p0, $SKIP_MESSAGE
        invoke-virtual {p0}, $SKIP_MESSAGE->getDialogId()J
        move-result-wide v0
        return-wide v0
    """)
    writeStub(VOICE_SKIP, "seconds", 2, """
        check-cast p0, $SKIP_MESSAGE
        iget v0, p0, $PROGRESS_SECONDS
        return v0
    """)
    writeStub(VOICE_SKIP, "play", 2, """
        $instance
        check-cast p0, $SKIP_MESSAGE
        invoke-virtual {v0, p0}, $PLAY_MESSAGE_PLAIN
        return-void
    """)
    writeStub(VOICE_SKIP, "seekStart", 3, """
        $instance
        check-cast p0, $SKIP_MESSAGE
        const/4 v1, 0x0
        invoke-virtual {v0, p0, v1}, $SEEK_TO
        return-void
    """)
    writeStub(VOICE_SKIP, "requeue", 3, """
        $instance
        invoke-virtual {v0, p0, p1}, $SET_PLAYLIST
        return-void
    """)
}

/**
 * MediaController skips songs in playNextMessageWithoutOrder(boolean) and playPreviousMessage(),
 * which the notification, the lock screen, a car, headphones and the full player all reach. Its
 * media session only calls them for music, and its music service only offers the buttons for
 * music, as two constants R8 folded: one with next and previous, one without.
 */
internal fun BytecodePatchContext.resolveVoiceSkip(): VoiceSkipSites {
    requireStatusMethod("voiceSkip")
    controlHook(VOICE_SKIP, "next", listOf("I"), "Z")
    controlHook(VOICE_SKIP, "previous", emptyList(), "Z")
    controlHook(VOICE_SKIP, "skips", listOf("Ljava/lang/Object;"), "Z")
    controlHook(VOICE_SKIP, "actions", listOf("J"), "J")
    fun missing(why: String) = VoiceSkipSites.missing(why)

    val controller = tgMutableClassDefByOrNull(MEDIA_CONTROLLER) ?: return missing("MediaController is missing")
    val open = { flags: Int -> AccessFlags.PUBLIC.isSet(flags) && !AccessFlags.STATIC.isSet(flags) }
    fun member(wanted: String) = controller.methods.filter { "$MEDIA_CONTROLLER->${it.origName}${it.origDescriptor}" == wanted && open(it.accessFlags) }
    val next = member(NEXT_SONG).singleOrNull() ?: return missing("the player no longer skips songs in one place")
    val previous = member(PREVIOUS_SONG).singleOrNull() ?: return missing("the player no longer goes back a song in one place")
    for (skip in listOf(next, previous)) {
        val flow = ControlFlow.of(skip)
        if (flow.normal.any { 0 in it } || flow.exceptional.any { 0 in it }) return missing("something jumps back to the start of ${skip.origName}")
        if (skip.localRegisterCount() < 1) return missing("${skip.origName} has no register the hook can borrow")
    }
    if (member(PLAY_MESSAGE_PLAIN).size != 1 || member(SET_PLAYLIST).size != 1) return missing("the player no longer plays or queues a message")
    val seek = controller.methods.filter { open(it.accessFlags) && it.origName == "seekToProgress" &&
        it.origParameterTypes == listOf(SKIP_MESSAGE, "F") && it.returnType in setOf("Z", "V") }
    if (seek.size != 1) return missing("the player no longer seeks a message in one place (${seek.size})")
    if (listOf("voiceMessagesPlaylist" to "Ljava/util/ArrayList;", "voiceMessagesPlaylistUnread" to "Z").any { (name, type) ->
            controller.fields.none { it.origName == name && it.origType == type && open(it.accessFlags) } }) {
        return missing("the player no longer keeps its voice queue where the extension can read it")
    }
    val message = tgClassDefByOrNull(SKIP_MESSAGE) ?: return missing("MessageObject is missing")
    if (listOf("getId()I", "getDialogId()J").any { wanted -> message.methods.none { "${it.origName}${it.origDescriptor}" == wanted && open(it.accessFlags) } } ||
        message.fields.none { it.origName == "audioProgressSec" && it.origType == "I" && open(it.accessFlags) }) {
        return missing("a message no longer says its id, chat or how far it has played")
    }

    // The media session's next and previous: a music check, then the skip a few instructions on.
    val gates = mutableListOf<Pair<MutableMethod, List<Int>>>()
    var nextGates = 0
    var previousGates = 0
    for ((skip, isNext) in listOf(NEXT_SONG to true, PREVIOUS_SONG to false)) {
        forEachClassMentioning(Mention.reference(IS_MUSIC) and Mention.reference(skip)) { cls ->
            if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
            cls.methods.forEach { m ->
                val body = m.controlBody()
                val indices = body.indices.filter { i -> body[i].opcode in SKIP_CALLS && body[i].controlRef() == IS_MUSIC && skipsAfter(body, i, skip, isNext) }
                if (indices.isEmpty()) return@forEach
                val key = m.origString()
                gates += tgMutableClassDefBy(cls.type).methods.single { it.origString() == key } to indices
                if (isNext) nextGates += indices.size else previousGates += indices.size
            }
        }
    }
    if (nextGates == 0 || previousGates == 0) return missing("the media session no longer checks for music before it skips ($nextGates, $previousGates)")

    // The music service's buttons: the builder's setState(int, long, float), then its actions stored.
    val service = tgMutableClassDefByOrNull(MUSIC_SERVICE) ?: return missing("the music service is missing")
    val actions = mutableListOf<Pair<MutableMethod, List<Int>>>()
    for (method in service.methods) {
        val body = method.controlBody()
        val indices = body.indices.filter { i -> i > 0 && storesActions(body, i) }
        if (indices.isEmpty()) continue
        val flow = ControlFlow.of(method)
        if (indices.any { i -> flow.normal.withIndex().any { (from, to) -> from != i - 1 && i in to } || flow.exceptional.any { i in it } }) {
            return missing("something jumps between the music service's state and its buttons")
        }
        actions += method to indices
    }
    val notification = actions.any { (m, _) -> "${m.origName}${m.origDescriptor}" == "createNotification(${SKIP_MESSAGE}Z)V" }
    val update = actions.any { (m, _) -> "${m.origName}${m.origDescriptor}" == "updatePlaybackState(J)V" }
    if (!notification || !update) return missing("the music service no longer sets its buttons when it shows and updates the player ($notification, $update)")
    return VoiceSkipSites(next, previous, gates, actions, null)
}

/**
 * Whether a skip of [skip] follows the music check at [index] within a few instructions, and for
 * next, one asked for by a button (false), never the one a song ending asks for.
 */
private fun skipsAfter(body: List<Instruction>, index: Int, skip: String, isNext: Boolean): Boolean {
    val until = minOf(body.size, index + 8)
    for (at in index + 1 until until) {
        val insn = body[at]
        if (insn.opcode !in SKIP_CALLS || insn.controlRef() != skip) continue
        if (!isNext) return true
        val byStop = (insn as? Instruction35c)?.registerD ?: return false
        return (index + 1 until at).any { load ->
            body[load].opcode == Opcode.CONST_4 && body[load].namedRegisters().single() == byStop &&
                (body[load] as NarrowLiteralInstruction).narrowLiteral == 0
        }
    }
    return false
}

/** An iput-wide of the session state builder's actions right after its setState(int, long, float). */
private fun BytecodePatchContext.storesActions(body: List<Instruction>, index: Int): Boolean {
    val store = body[index]
    if (store.opcode != Opcode.IPUT_WIDE) return false
    val field = (store as ReferenceInstruction).reference as? FieldReference ?: return false
    if (field.type != "J") return false
    val setState = body[index - 1]
    if (setState.opcode != Opcode.INVOKE_VIRTUAL && setState.opcode != Opcode.INVOKE_VIRTUAL_RANGE) return false
    val call = setState.call() ?: return false
    if (call.definingClass != field.definingClass || call.parameterTypes.map { it.toString() } != listOf("I", "J", "F") || call.returnType != "V") return false
    val builder = tgClassDefByOrNull(call.definingClass) ?: return false
    return builder.methods.any { it.returnType == PLAYBACK_STATE && it.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(it.accessFlags) }
}
