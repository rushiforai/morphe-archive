/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.downloadspeed

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val MEDIA_QUALITY = "$EXTENSION_PACKAGE/misc/MediaQuality;"
internal const val HD_PHOTO_HOOK = "$MEDIA_QUALITY->hdPhoto(Z)Z"
internal const val VIDEO_LIMIT_HOOK = "$MEDIA_QUALITY->videoLimit(J)J"
internal const val MEDIA_EDIT_STATE = "Lorg/telegram/messenger/MediaController\$MediaEditState;"
internal const val PHOTO_VIEWER = "Lorg/telegram/ui/PhotoViewer;"
internal const val SEND_HELPER = "Lorg/telegram/messenger/SendMessagesHelper;"
internal const val VIDEO_EDITED_INFO = "Lorg/telegram/messenger/VideoEditedInfo;"
private const val SHARED_CONFIG = "Lorg/telegram/messenger/SharedConfig;"

/** 1000 MB, from which Telegram sends a video at its own size and bitrate. */
internal const val OWN_SIZE_VIDEO = 0x3e800000L

/** A value Telegram has just loaded into [register] at [index], which the extension gets to answer for. */
internal class QualitySite(val method: MutableMethod, val index: Int, val register: Int, val hook: String, wide: Boolean) {
    private val code = if (wide) "invoke-static/range {v$register .. v${register + 1}}, $hook\nmove-result-wide v$register"
        else "invoke-static/range {v$register .. v$register}, $hook\nmove-result v$register"

    fun insert(target: MutableMethod = method) = target.addInstructionsAtControlFlowLabel(index + 1, code)
}

/** The photo's HD fallback and both places that decide whether a video keeps its own size. */
internal class BestQualityPlan(val photo: QualitySite, val editor: QualitySite, val direct: QualitySite) {
    private val sites = listOf(photo, editor, direct)

    /** The same edits on copies, so a smali problem shows before the app is touched. */
    fun rehearse() = sites.forEach { it.insert(MutableMethod(ImmutableMethod.of(it.method))) }

    fun insert() = sites.forEach { it.insert() }
}

private fun Instruction.ownSizeLimit() = opcode == Opcode.CONST_WIDE_32 && (this as WideLiteralInstruction).wideLiteral == OWN_SIZE_VIDEO

/**
 * MediaEditState.isHighQuality answers a photo's own HD press, and without one the HD choice
 * Telegram remembers from the last press, read from SharedConfig. The read is where HD becomes the
 * default. Matched by shape, since the name table swaps that field with the live photo default.
 */
private fun BytecodePatchContext.photoDefault(): QualitySite {
    val owner = tgMutableClassDefByOrNull(MEDIA_EDIT_STATE)
    controlShape(owner != null, "Telegram's photo edit state is missing")
    val method = owner!!.methods.filter { it.origName == "isHighQuality" && it.origParameterTypes.isEmpty() && it.origReturnType == "Z" }
        .controlSingle("the photo HD check")
    val body = method.controlBody()
    val at = body.indices.filter { body[it].opcode == Opcode.SGET_BOOLEAN }.controlSingle("the remembered HD choice")
    val register = (body[at] as OneRegisterInstruction).registerA
    controlShape(body[at].controlRef()?.startsWith("$SHARED_CONFIG->") == true && body.getOrNull(at + 1)?.opcode == Opcode.RETURN &&
        (body[at + 1] as OneRegisterInstruction).registerA == register && body.take(at).any { it.opcode == Opcode.IF_NEZ },
        "the photo HD check no longer falls back to the remembered choice")
    return QualitySite(method, at, register, HD_PHOTO_HOOK, wide = false)
}

/** The 1000 MB load in [method], which the next instruction compares the video's size with. */
private fun videoLimitIn(method: MutableMethod, what: String): QualitySite {
    val body = method.controlBody()
    val at = body.indices.filter { body[it].ownSizeLimit() }.controlSingle("the own-size limit in $what")
    val register = (body[at] as OneRegisterInstruction).registerA
    val compare = body.getOrNull(at + 1)
    controlShape(register < 255 && compare?.opcode == Opcode.CMP_LONG && (compare as ThreeRegisterInstruction).registerC == register,
        "$what no longer compares the video's size with 1000 MB")
    return QualitySite(method, at, register, VIDEO_LIMIT_HOOK, wide = true)
}

/**
 * PhotoViewer.selectCompression picks the editor's starting quality, the top one for a file over
 * 1000 MB and the last one used otherwise. SendMessagesHelper.createCompressionSettings sizes a
 * video sent without the editor, and keeps a file of 1000 MB or more as it is.
 */
internal fun BytecodePatchContext.resolveBestQuality(): BestQualityPlan {
    requireStatusMethod("bestQualityMedia")
    controlHook(MEDIA_QUALITY, "hdPhoto", listOf("Z"), "Z")
    controlHook(MEDIA_QUALITY, "videoLimit", listOf("J"), "J")
    val photo = photoDefault()

    val viewer = tgMutableClassDefByOrNull(PHOTO_VIEWER)
    controlShape(viewer != null, "Telegram's photo viewer is missing")
    val select = viewer!!.methods.filter { method ->
        method.origReturnType == "I" && method.origParameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.controlBody().let { body -> body.any { it.ownSizeLimit() } && body.any { it.controlString() == "compress_video_" } }
    }.controlSingle("the editor's starting video quality")
    val editor = videoLimitIn(select, "the editor's starting video quality")

    val helper = tgMutableClassDefByOrNull(SEND_HELPER)
    controlShape(helper != null, "Telegram's message sender is missing")
    val settings = helper!!.methods.filter { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.origReturnType == VIDEO_EDITED_INFO &&
            method.origParameterTypes == listOf("J", "Ljava/lang/String;")
    }.controlSingle("the video compression settings")
    val direct = videoLimitIn(settings, "the video compression settings")
    controlShape(settings.controlBody().take(direct.index).any { it.controlRef() == "Ljava/io/File;->length()J" },
        "the video compression settings no longer read the file's size")
    return BestQualityPlan(photo, editor, direct)
}
