package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal const val ORIGINAL_VIDEO = "original_video"
/**
 * Encrypted and regular chats hand every video to this transcoder's private worker. It reads the video, picks a target
 * bitrate and then decides between Messenger's own passthrough, which returns the original file, and a re-encode.
 */
internal const val VIDEO_TRANSCODE = "$MEDIA_TRANSCODER->A05(Lcom/facebook/msys/mci/TranscodeVideoCompletionCallback;" +
    "Lcom/facebook/msys/mci/VideoEdits;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V"
/** The performance annotation Messenger writes on its passthrough branch. */
internal const val VIDEO_PASSTHROUGH_MARK = "mci_video_passthrough"
private const val VIDEO_PASSTHROUGH_CALL = "$SETTINGS->videoPassthrough(IJ)I"

internal fun Method.isVideoTranscode(strings: Collection<String>) =
    definingClass == MEDIA_TRANSCODER && hookId() == VIDEO_TRANSCODE && !AccessFlags.STATIC.isSet(accessFlags) &&
        VIDEO_PASSTHROUGH_MARK in strings

private fun videoTranscodeChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the video passthrough check moved ($detail)")

private fun Instruction.wide() = (this as? WideLiteralInstruction)?.wideLiteral
private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference

/**
 * Index of the one size check that decides between Messenger's passthrough and a re-encode. 584 computes a limit from
 * the target bitrate and the duration, adds a fixed 5 MB margin and re-encodes on greater-or-equal, so a negative
 * compare result falls through to the original file:
 *
 *     iget-wide vSize, vMeta, <metadata>->bytes:J
 *     ...                    vLimit = target bitrate
 *     int-to-long vLimit, vLimit
 *     iget-wide vT, vMeta, <metadata>->durationMs:J
 *     mul-long/2addr vLimit, vT
 *     const-wide/16 vT, 8000
 *     div-long/2addr vLimit, vT
 *     const-wide/32 vT, 5000000
 *     add-long/2addr vLimit, vT
 *     cmp-long vR, vSize, vLimit     <- returned
 *     if-gez vR, :reencode
 *
 * 584.1 armv7 derives the margin from the target bitrate instead of using a fixed 5 MB:
 *
 *     const-wide/16 vT, 8000
 *     mul-int/lit16 vT, vTarget, 1000
 *     int-to-long vT, vT
 *     add-long/2addr vLimit, vT
 *     cmp-long vR, vSize, vLimit     <- returned
 *     if-ltz vR, :reencode
 *
 * A negative result keeps the original. The checks before it (trims, overlays, muting, the codec and Messenger's own
 * passthrough size cap) and the force-transcode option after it are left as they are.
 */
internal fun Method.videoPassthroughSite(): Int {
    val code = implementation?.instructions?.toList() ?: videoTranscodeChanged("no code")
    fun narrow(at: Int, value: Int) = (code[at] as? NarrowLiteralInstruction)?.narrowLiteral == value
    fun constantMargin(c: Int) = code[c + 1].opcode == Opcode.IF_GEZ &&
        code[c - 4].opcode == Opcode.CONST_WIDE_16 && code[c - 4].wide() == 8000L &&
        code[c - 2].opcode == Opcode.CONST_WIDE_32 && code[c - 2].wide() == 5_000_000L &&
        code[c - 3].opcode == Opcode.DIV_LONG_2ADDR && code[c - 5].opcode == Opcode.MUL_LONG_2ADDR
    fun configuredMargin(c: Int) = c >= 11 && code[c + 1].opcode == Opcode.IF_LTZ &&
        code[c - 6].opcode == Opcode.CONST_WIDE_16 && code[c - 6].wide() == 8000L &&
        narrow(c - 3, 1000) && code[c - 2].opcode == Opcode.INT_TO_LONG
    val sites = (9 until code.size - 1).filter { c -> code[c].opcode == Opcode.CMP_LONG &&
        (constantMargin(c) || configuredMargin(c)) }
    val c = sites.singleOrNull() ?: videoTranscodeChanged("${sites.size} size checks")
    val constant = constantMargin(c)
    val cmp = code[c] as ThreeRegisterInstruction
    val limit = cmp.registerC
    val size = cmp.registerB
    val result = cmp.registerA
    fun twoReg(at: Int, op: Opcode) = (code[at] as? TwoRegisterInstruction)?.takeIf { code[at].opcode == op }
        ?: videoTranscodeChanged("${code[at].opcode.name} at the limit")
    val add = twoReg(c - 1, Opcode.ADD_LONG_2ADDR)
    val div = twoReg(if (constant) c - 3 else c - 5, Opcode.DIV_LONG_2ADDR)
    val mul = twoReg(if (constant) c - 5 else c - 7, Opcode.MUL_LONG_2ADDR)
    val duration = twoReg(if (constant) c - 6 else c - 8, Opcode.IGET_WIDE)
    val widen = twoReg(if (constant) c - 7 else c - 9, Opcode.INT_TO_LONG)
    val bytes = twoReg(if (constant) c - 9 else c - 11, Opcode.IGET_WIDE)
    val temp = (code[if (constant) c - 2 else c - 6] as OneRegisterInstruction).registerA
    if (constant) {
        if ((code[c - 2] as OneRegisterInstruction).registerA != temp) videoTranscodeChanged("margin register")
    } else {
        val widenedMargin = twoReg(c - 2, Opcode.INT_TO_LONG)
        val margin = twoReg(c - 3, Opcode.MUL_INT_LIT16)
        if (widenedMargin.registerA != temp || widenedMargin.registerB != temp ||
            margin.registerA != temp || margin.registerB != temp) videoTranscodeChanged("margin arithmetic")
    }
    if (add.registerA != limit || add.registerB != temp || div.registerA != limit || div.registerB != temp ||
        mul.registerA != limit || mul.registerB != duration.registerA || widen.registerA != limit || widen.registerB != limit) {
        videoTranscodeChanged("limit arithmetic")
    }
    val bytesField = code[if (constant) c - 9 else c - 11].field() ?: videoTranscodeChanged("size field")
    val durationField = code[if (constant) c - 6 else c - 8].field() ?: videoTranscodeChanged("duration field")
    if (bytes.registerA != size || bytesField.type != "J" || durationField.type != "J" ||
        bytesField.definingClass != durationField.definingClass || bytesField.name == durationField.name ||
        bytes.registerB != duration.registerB) videoTranscodeChanged("metadata reads")
    // Nothing between the size read and the compare may write the size pair.
    for (at in (if (constant) c - 8 else c - 10) until c) {
        val written = (code[at] as? OneRegisterInstruction)?.registerA ?: continue
        if (written == size || written == size + 1 || written + 1 == size) videoTranscodeChanged("size register reused")
    }
    if ((code[c + 1] as OneRegisterInstruction).registerA != result) videoTranscodeChanged("branch register")
    if (c + 1 in jumpTargets()) videoTranscodeChanged("branch is a jump target")
    // The helper call is a plain invoke, so the result and the size pair stay at v15 or below.
    if (result > 15 || size + 1 > 15 || result == size || result == size + 1) videoTranscodeChanged("registers out of range")
    return c
}

internal fun MutableMethod.validateOriginalVideo(): Int {
    if (AccessFlags.STATIC.isSet(accessFlags) || hookId() != VIDEO_TRANSCODE) {
        throw PatchException("Messenger controls: unexpected video transcoder ${hookId()}")
    }
    return videoPassthroughSite()
}

/**
 * Hands the compare result and the file size to the extension right after the compare. Off, Pause, safe mode and a
 * file over Messenger's 25 MB upload size get the stock result back, so only the re-encode decision changes.
 */
internal fun MutableMethod.injectOriginalVideo() {
    val c = validateOriginalVideo()
    val cmp = implementation!!.instructions.elementAt(c) as ThreeRegisterInstruction
    val result = cmp.registerA
    val size = cmp.registerB
    addInstructions(c + 1, """
        invoke-static {v$result, v$size, v${size + 1}}, $VIDEO_PASSTHROUGH_CALL
        move-result v$result
    """.trimIndent())
}
