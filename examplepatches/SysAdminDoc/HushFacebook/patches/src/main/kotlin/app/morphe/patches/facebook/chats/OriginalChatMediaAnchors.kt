/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 * Ported from https://github.com/SysAdminDoc/HushMessenger (its original photo and original video controls)
 */
package app.morphe.patches.facebook.chats

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.requireLocals
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Where a chat inside Facebook shrinks a photo or a video before it goes out, read from 577, 580
 * and 581. Those chats use Messenger's media stack, and its transcoder keeps its name:
 * `com.facebook.msys.mci.transcoder.DefaultMediaTranscoder`.
 *
 * Photos: `transcodeImage` and `transcodeImageAsync` keep their names too. Both take the photo's
 * path, a target width and height, an options string and an extras map, and the async one a
 * completion callback whose `success` and `failure` keep their names. They re-encode every photo,
 * HD or not.
 *
 * Videos: the transcoder asks `extractMimeTypeAndCheckCanSkipVideoTranscoding` (the Kotlin name
 * stays, and the build with the two trailing ints is the one with a body) whether the file can go
 * out as it is. For a video with a bitrate target it compares the file's size with
 * `bitrate * duration / 8000 + slack` and only a smaller file may skip the re-encode (581
 * `LX/MUh;->A09` is the size, `A08` the duration). The `cmp-long` before that `if-ltz` is the one
 * size check; the checks for edits, the Messenger size cap and the forced transcode stay. The
 * method's first parameter is the video's `file://` address (the transcoder's private worker hands
 * on the input it checked for that scheme), which the hook passes on so the extension can read the
 * file's tags before it lets the video skip the re-encode.
 */
internal const val ORIGINAL_MEDIA_PATCH = "Send chat photos and videos at original quality"

private const val ORIGINAL_MEDIA = "$EXTENSION_PACKAGE/chats/OriginalChatMedia;"
internal const val PHOTO_HOOK = "$ORIGINAL_MEDIA->photo(Ljava/lang/String;DDLjava/lang/String;Ljava/util/Map;)[B"
internal const val PHOTO_ASYNC_HOOK =
    "$ORIGINAL_MEDIA->photoAsync(Ljava/lang/String;DDLjava/lang/String;Ljava/util/Map;Ljava/lang/Object;)Z"
internal const val VIDEO_HOOK = "$ORIGINAL_MEDIA->videoPassthrough(IJLjava/lang/String;)I"

internal const val MEDIA_TRANSCODER = "Lcom/facebook/msys/mci/transcoder/DefaultMediaTranscoder;"
internal const val IMAGE_CALLBACK = "Lcom/facebook/msys/mci/TranscodeImageCompletionCallback;"
internal const val IMAGE_PARAMETERS = "Ljava/lang/String;DDLjava/lang/String;Ljava/util/Map;"
internal const val VIDEO_CHECK = "extractMimeTypeAndCheckCanSkipVideoTranscoding"

/** The note the video transcoder writes on its passthrough branch; it shows this is the video path. */
internal const val VIDEO_PASSTHROUGH_MARK = "mci_video_passthrough"

private fun refuse(detail: String): Nothing = throw PatchException("$ORIGINAL_MEDIA_PATCH: $detail")

/** The three places found, and where the video hook goes. [sizeCheck] is the cmp-long's index. */
internal class OriginalMediaAnchors(
    val photo: Method,
    val photoAsync: Method,
    val video: Method,
    val sizeCheck: Int,
)

private fun List<CharSequence>.names() = map(CharSequence::toString)

internal fun isPhotoTranscode(method: Method) =
    method.name == "transcodeImage" && method.returnType == "[B" && !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.parameterTypes.names().joinToString("") == IMAGE_PARAMETERS && method.implementation != null

internal fun isPhotoTranscodeAsync(method: Method) =
    method.name == "transcodeImageAsync" && method.returnType == "V" && !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.parameterTypes.names().joinToString("") == IMAGE_PARAMETERS + IMAGE_CALLBACK &&
        method.implementation != null

/**
 * The size check's own method: the 10-parameter build of the skip question, whose last two
 * parameters are ints and whose eighth is the long size cap.
 */
internal fun isVideoSkipCheck(method: Method): Boolean {
    if (method.name != VIDEO_CHECK || method.implementation == null || AccessFlags.STATIC.isSet(method.accessFlags)) {
        return false
    }
    val types = method.parameterTypes.names()
    return types.size == 10 && types[0] == "Ljava/lang/String;" && types[3] == "Landroid/net/Uri;" &&
        types[7] == "J" && types[8] == "I" && types[9] == "I"
}

private fun Instruction.wide() = (this as? WideLiteralInstruction)?.wideLiteral
private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference

/** The indexes some branch in [code] lands on. */
internal fun jumpTargets(code: List<Instruction>): Set<Int> {
    var address = 0
    val addresses = code.map { val at = address; address += it.codeUnits; at }
    return code.indices.mapNotNull { at ->
        val branch = code[at] as? OffsetInstruction ?: return@mapNotNull null
        addresses.indexOf(addresses[at] + branch.codeOffset).takeIf { it >= 0 }
    }.toSet()
}

/**
 * The index of the size check, or a refusal naming what moved:
 *
 *     iget-wide vSize, vInfo, <info>->size:J
 *     int-to-long vLimit, vBitrate
 *     iget-wide vT, vInfo, <info>->duration:J
 *     mul-long/2addr vLimit, vT
 *     const-wide/16 vT, 8000
 *     div-long/2addr vLimit, vT
 *     mul-int/lit16 vT, vSlack, 1000
 *     int-to-long vT, vT
 *     add-long/2addr vLimit, vT
 *     cmp-long vR, vSize, vLimit     <- returned
 *     if-ltz vR, :may_skip
 *
 * The hook gets vR and the size pair after the compare, so the size pair and vR have to be v15 or
 * below for a plain invoke, vR must not be one of the size's registers, and nothing may jump onto
 * the if. It gets the video's address too, from the first parameter ([videoSourceRegister]).
 */
internal fun Method.videoSizeCheck(): Int {
    val code = implementation?.instructions?.toList() ?: refuse("$name has no code")
    val sites = (9 until code.size - 1).filter { c ->
        code[c].opcode == Opcode.CMP_LONG && code[c + 1].opcode == Opcode.IF_LTZ &&
            code[c - 1].opcode == Opcode.ADD_LONG_2ADDR && code[c - 2].opcode == Opcode.INT_TO_LONG &&
            code[c - 3].opcode == Opcode.MUL_INT_LIT16 && code[c - 3].wide() == 1000L &&
            code[c - 4].opcode == Opcode.DIV_LONG_2ADDR &&
            code[c - 5].opcode == Opcode.CONST_WIDE_16 && code[c - 5].wide() == 8000L
    }
    val c = sites.singleOrNull() ?: refuse("expected one video size check in $name, found ${sites.size}")
    fun two(at: Int) = code[at] as? TwoRegisterInstruction ?: refuse("no registers at $at in $name")
    val cmp = code[c] as ThreeRegisterInstruction
    val result = cmp.registerA
    val size = cmp.registerB
    val limit = cmp.registerC
    val add = two(c - 1)
    val widen = two(c - 2)
    val slack = two(c - 3)
    val div = two(c - 4)
    val mul = two(c - 6)
    val duration = two(c - 7)
    val bitrate = two(c - 8)
    val bytes = two(c - 9)
    val temp = (code[c - 5] as OneRegisterInstruction).registerA
    if (code[c - 6].opcode != Opcode.MUL_LONG_2ADDR || code[c - 7].opcode != Opcode.IGET_WIDE ||
        code[c - 8].opcode != Opcode.INT_TO_LONG || code[c - 9].opcode != Opcode.IGET_WIDE) {
        refuse("the limit arithmetic in $name changed")
    }
    if (add.registerA != limit || add.registerB != temp || widen.registerA != temp || widen.registerB != temp ||
        slack.registerA != temp || div.registerA != limit || div.registerB != temp || mul.registerA != limit ||
        mul.registerB != duration.registerA || bitrate.registerA != limit || bytes.registerA != size ||
        duration.registerB != bytes.registerB) {
        refuse("the registers of the limit in $name changed")
    }
    val sizeField = code[c - 9].field() ?: refuse("no size field in $name")
    val durationField = code[c - 7].field() ?: refuse("no duration field in $name")
    if (sizeField.type != "J" || durationField.type != "J" || sizeField.name == durationField.name ||
        sizeField.definingClass != durationField.definingClass) {
        refuse("the size and duration reads in $name changed")
    }
    // Nothing between the size read and the compare may overwrite the size pair.
    for (at in c - 8 until c) {
        val written = (code[at] as? OneRegisterInstruction)?.registerA ?: continue
        if (written == size || written == size + 1 || written + 1 == size) refuse("$name reuses the size register")
    }
    if ((code[c + 1] as OneRegisterInstruction).registerA != result) refuse("the branch in $name reads another register")
    if (c + 1 in jumpTargets(code)) refuse("the branch in $name is a jump target")
    if (result > 15 || size + 1 > 15 || result == size || result == size + 1) {
        refuse("the registers in $name are out of range")
    }
    return c
}

/**
 * The register of the method's first parameter, the video's `file://` address, which the size
 * check's hook passes on. A plain invoke names it, so it has to be v15 or below, and nothing in the
 * method may write over it before the hook reads it. On 577, 580 and 581 it's v9 of 20 registers.
 */
internal fun Method.videoSourceRegister(): Int {
    val code = implementation?.instructions?.toList() ?: refuse("$name has no code")
    if (parameterTypes.firstOrNull()?.toString() != "Ljava/lang/String;") refuse("$name no longer takes the address first")
    val width = 1 + parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    val source = implementation!!.registerCount - width + 1
    if (source > 15) refuse("the address in $name is out of range")
    for (instruction in code) {
        if (!instruction.opcode.setsRegister()) continue
        val written = (instruction as? OneRegisterInstruction)?.registerA ?: continue
        if (written == source || (instruction.opcode.setsWideRegister() && written + 1 == source)) {
            refuse("$name writes over the address")
        }
    }
    return source
}

/**
 * Finds all three places before anything changes. Refuses unless the transcoder is there once,
 * with one of each photo method, one video size check, and the passthrough note somewhere in it.
 */
internal fun BytecodePatchContext.findOriginalMediaAnchors(): OriginalMediaAnchors {
    val transcoders = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        if (classDef.type == MEDIA_TRANSCODER && !classDef.type.startsWith(EXTENSION_CLASSES)) transcoders += classDef
    }
    val transcoder = transcoders.singleOrNull() ?: refuse("expected one $MEDIA_TRANSCODER, found ${transcoders.size}")
    return transcoderAnchors(transcoder)
}

/** The anchors inside one transcoder class. */
internal fun transcoderAnchors(transcoder: ClassDef): OriginalMediaAnchors {
    fun <T> one(what: String, found: List<T>): T =
        found.singleOrNull() ?: refuse("expected one $what in ${transcoder.type}, found ${found.size}")
    val photo = one("transcodeImage", transcoder.methods.filter(::isPhotoTranscode))
    val photoAsync = one("transcodeImageAsync", transcoder.methods.filter(::isPhotoTranscodeAsync))
    val video = one("$VIDEO_CHECK with a body", transcoder.methods.filter(::isVideoSkipCheck))
    if (transcoder.methods.none { holdsString(it, VIDEO_PASSTHROUGH_MARK) }) {
        refuse("${transcoder.type} no longer writes \"$VIDEO_PASSTHROUGH_MARK\"")
    }
    val sizeCheck = video.videoSizeCheck()
    video.videoSourceRegister()
    return OriginalMediaAnchors(photo, photoAsync, video, sizeCheck)
}

/**
 * Hands the photo's arguments to the extension first. A byte array back means the photo goes out
 * as it is, null means the stock re-encode runs. The arguments sit in one run of parameter
 * registers that can be past v15, hence the range call.
 */
internal fun MutableMethod.hookPhoto() {
    requireLocals(ORIGINAL_MEDIA_PATCH, 1)
    addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p1 .. p7 }, $PHOTO_HOOK
            move-result-object v0
            if-eqz v0, :stock
            return-object v0
        """,
        ExternalLabel("stock", getInstruction(0)),
    )
}

/** The async version: true means the extension owns the callback and the method returns at once. */
internal fun MutableMethod.hookPhotoAsync() {
    requireLocals(ORIGINAL_MEDIA_PATCH, 1)
    addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p1 .. p8 }, $PHOTO_ASYNC_HOOK
            move-result v0
            if-eqz v0, :stock
            return-void
        """,
        ExternalLabel("stock", getInstruction(0)),
    )
}

/**
 * Hands the compare's answer, the file size and the video's address to the extension, which may
 * turn a re-encode into a pass.
 */
internal fun MutableMethod.hookVideoSizeCheck(index: Int) {
    val cmp = implementation!!.instructions.elementAt(index) as ThreeRegisterInstruction
    val result = cmp.registerA
    val size = cmp.registerB
    val source = videoSourceRegister()
    addInstructions(
        index + 1,
        """
            invoke-static { v$result, v$size, v${size + 1}, v$source }, $VIDEO_HOOK
            move-result v$result
        """,
    )
}

/** Puts the three hooks in. */
internal fun BytecodePatchContext.hookOriginalMedia(anchors: OriginalMediaAnchors) {
    val transcoder = mutableClassDefBy(MEDIA_TRANSCODER)
    transcoder.findMutableMethodOf(anchors.photo).hookPhoto()
    transcoder.findMutableMethodOf(anchors.photoAsync).hookPhotoAsync()
    transcoder.findMutableMethodOf(anchors.video).hookVideoSizeCheck(anchors.sizeCheck)
}
