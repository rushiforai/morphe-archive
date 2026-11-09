/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.voice

import app.morphe.util.names.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origDescriptor
import app.morphe.util.names.origName
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val PLAYBACK_POSITION = "$EXTENSION_PACKAGE/misc/PlaybackPosition;"
internal const val VIDEO_SECONDS = "$PLAYBACK_POSITION->videoSeconds(I)I"
internal const val VIDEO_SECONDS_LONG = "$PLAYBACK_POSITION->videoSecondsLong(J)J"
internal const val AUDIO_SECONDS = "$PLAYBACK_POSITION->audioSeconds(D)D"
private const val SAVED_POSITIONS = "media_saved_pos"
private const val PHOTO_VIEWER_TYPE = "Lorg/telegram/ui/PhotoViewer;"
private const val MESSAGE_TYPE = "Lorg/telegram/messenger/MessageObject;"
private const val MEDIA_CONTROLLER_TYPE = "Lorg/telegram/messenger/MediaController;"
private const val MESSAGE_PROGRESS = "getVideoSavedProgress()F"
private const val CACHED_PROGRESS = "$MESSAGE_TYPE->cachedSavedTimestamp:Ljava/lang/Float;"
private const val PLAY_WITH_SOUND = "playMessage(${MESSAGE_TYPE}Z)Z"
/** 13.2 folds playMessage(MessageObject, false), which nothing calls with true, into the one-argument play. */
private const val PLAY_FOLDED = "playMessage($MESSAGE_TYPE)Z"
private const val TWO_MINUTES = 120L
private const val FIVE_MINUTES = 300L
private const val FIVE_MINUTES_AS_DOUBLE = 0x4072c00000000000L
private const val TEN_MINUTES_AS_DOUBLE = 0x4082c00000000000L

/** One length Telegram compares against, loaded at [index] of [signature] in [type], and the hook that answers instead. */
internal class PositionEdit(val type: String, val signature: String, val index: Int, val hook: String, val wide: Boolean)

/**
 * The places Telegram decides a video, voice message or song is long enough to remember, or
 * [missing], why this build can't have the switch. Each is a length loaded into a register right
 * before it's compared, so the hook answers in that same register and the comparison stays Telegram's.
 */
internal class PlaybackPositionSites(val edits: List<PositionEdit>, val missing: String?) {
    /** The same edits on copies, so a smali problem refuses before the app is touched. */
    fun rehearse(context: BytecodePatchContext) {
        for (list in edits.groupBy { it.type + it.signature }.values) {
            insert(MutableMethod(ImmutableMethod.of(methodOf(context, list.first()))), list)
        }
    }

    fun apply(context: BytecodePatchContext) {
        for (list in edits.groupBy { it.type + it.signature }.values) insert(methodOf(context, list.first()), list)
    }

    private fun methodOf(context: BytecodePatchContext, edit: PositionEdit) =
        context.tgMutableClassDefBy(edit.type).methods.single { it.toString() == edit.signature }

    /** Highest index first, so an insertion never moves one still waiting. */
    private fun insert(target: MutableMethod, list: List<PositionEdit>) {
        for (edit in list.sortedByDescending { it.index }) {
            val first = target.controlBody()[edit.index].namedRegisters().single()
            val last = if (edit.wide) first + 1 else first
            val call = if (last > 15) "invoke-static/range {v$first .. v$last}" else
                "invoke-static {${(first..last).joinToString { "v$it" }}}"
            target.addInstructions(edit.index + 1, "$call, ${edit.hook}\n${if (edit.wide) "move-result-wide" else "move-result"} v$first")
        }
    }
}

internal fun BytecodePatchContext.resolvePlaybackPosition(): PlaybackPositionSites {
    requireStatusMethod("playbackPosition")
    controlHook(PLAYBACK_POSITION, "videoSeconds", listOf("I"), "I")
    controlHook(PLAYBACK_POSITION, "videoSecondsLong", listOf("J"), "J")
    controlHook(PLAYBACK_POSITION, "audioSeconds", listOf("D"), "D")
    fun missing(why: String) = PlaybackPositionSites(emptyList(), why)

    val message = tgMutableClassDefByOrNull(MESSAGE_TYPE) ?: return missing("MessageObject is missing")
    val viewer = tgMutableClassDefByOrNull(PHOTO_VIEWER_TYPE) ?: return missing("the video viewer is missing")
    val player = tgMutableClassDefByOrNull(MEDIA_CONTROLLER_TYPE) ?: return missing("MediaController is missing")
    fun Method.remembers() = controlBody().any { it.controlString() == SAVED_POSITIONS }
    fun MutableMethod.shape() = "$origName$origDescriptor"

    /** Indices of [literal] loads in [method], by one of [loads], that the very next instruction compares in the same register. */
    fun sites(method: Method, literal: Long, loads: Set<Opcode>, compares: Set<Opcode>): List<Int> {
        val body = method.controlBody()
        return body.indices.filter { i ->
            val load = body[i]
            val value = (load as? WideLiteralInstruction)?.wideLiteral ?: (load as? NarrowLiteralInstruction)?.narrowLiteral?.toLong()
            load.opcode in loads && value == literal && body.getOrNull(i + 1)?.let { next ->
                next.opcode in compares && load.namedRegisters().single() in next.namedRegisters()
            } == true
        }
    }

    val edits = mutableListOf<PositionEdit>()
    val ints = setOf(Opcode.CONST_16, Opcode.CONST)
    val longs = setOf(Opcode.CONST_WIDE_16, Opcode.CONST_WIDE_32)
    val ifs = setOf(Opcode.IF_LT, Opcode.IF_GE)
    // MessageObject's own reader, which 13.2 inlines into the bubble that draws the bar: the one
    // place that reads a saved position and caches it on the message.
    fun Method.caches() = controlBody().any { it.opcode == Opcode.IPUT_OBJECT && it.controlRef() == CACHED_PROGRESS }
    val progress = message.methods.filter { it.shape() == MESSAGE_PROGRESS }.map { message.type to it.toString() }.ifEmpty {
        val inlined = mutableListOf<Pair<String, String>>()
        forEachClassMentioning(Mention.string(SAVED_POSITIONS) and Mention.reference(CACHED_PROGRESS)) { cls ->
            if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
            cls.methods.filter { it.remembers() && it.caches() && sites(it, TWO_MINUTES, ints, ifs).isNotEmpty() }.forEach { inlined += cls.type to it.toString() }
        }
        inlined
    }
    val reader = progress.singleOrNull()?.let { (type, signature) -> tgMutableClassDefBy(type).methods.single { it.toString() == signature } }
    if (reader == null || !reader.remembers()) return missing("a video's saved position is no longer read in one place")
    val read = sites(reader, TWO_MINUTES, ints, ifs)
    if (read.size != 1) return missing("a video's saved position no longer waits for two minutes in one place (${read.size})")
    edits += PositionEdit(progress.single().first, reader.toString(), read.single(), VIDEO_SECONDS, false)

    val viewerInts = mutableListOf<Pair<MutableMethod, Int>>()
    val viewerLongs = mutableListOf<Pair<MutableMethod, Int>>()
    for (method in viewer.methods.filter { it.remembers() }) {
        sites(method, FIVE_MINUTES, ints, ifs).forEach { viewerInts += method to it }
        sites(method, FIVE_MINUTES, longs, setOf(Opcode.CMP_LONG)).forEach { viewerLongs += method to it }
    }
    if (viewerInts.size != 1 || viewerLongs.size != 1) {
        return missing("the video viewer no longer saves a position after five minutes in two places (${viewerInts.size}, ${viewerLongs.size})")
    }
    edits += PositionEdit(viewer.type, viewerInts.single().first.toString(), viewerInts.single().second, VIDEO_SECONDS, false)
    edits += PositionEdit(viewer.type, viewerLongs.single().first.toString(), viewerLongs.single().second, VIDEO_SECONDS_LONG, true)

    val play = player.methods.filter { (it.shape() == PLAY_WITH_SOUND || it.shape() == PLAY_FOLDED) && it.remembers() }
    if (play.size != 1) return missing("MediaController no longer has one play method that saves positions (${play.size})")
    val doubles = setOf(Opcode.CMPL_DOUBLE, Opcode.CMPG_DOUBLE)
    for ((literal, minutes) in listOf(FIVE_MINUTES_AS_DOUBLE to "five", TEN_MINUTES_AS_DOUBLE to "ten")) {
        val found = sites(play.single(), literal, setOf(Opcode.CONST_WIDE), doubles)
        if (found.size != 1) return missing("the player no longer waits for $minutes minutes in one place (${found.size})")
        edits += PositionEdit(player.type, play.single().toString(), found.single(), AUDIO_SECONDS, true)
    }
    return PlaybackPositionSites(edits, null)
}
