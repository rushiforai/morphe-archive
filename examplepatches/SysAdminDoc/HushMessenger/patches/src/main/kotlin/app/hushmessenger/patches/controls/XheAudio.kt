package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** Videos shared into Messenger whose only sound is xHE-AAC, which Messenger can't send. */
internal const val XHE_AUDIO = "xhe_audio"

/** The same fix for a video picked inside a chat, made where the video transcoder's worker takes its source (#57). */
internal const val XHE_TRANSCODE = "xhe_transcode"

/** The name Messenger gives the copy of an item shared into it. Only the share copy uses it. */
internal const val SHARE_MEDIA_NAME = "orca_share_media"

private const val FILE = "Ljava/io/File;"
private const val OPEN_COPY = "Ljava/io/FileOutputStream;-><init>(${FILE}Z)V"
private const val CLOSE_COPY = "Ljava/io/OutputStream;->close()V"
private const val FROM_FILE = "Landroid/net/Uri;->fromFile($FILE)Landroid/net/Uri;"
internal const val XHE_AUDIO_HELPER = "Lapp/hushmessenger/extension/XheAudio;->fixSharedFile($FILE)V"
private const val STRING = "Ljava/lang/String;"
internal const val XHE_TRANSCODE_HELPER = "Lapp/hushmessenger/extension/XheAudio;->transcodeSource($STRING)$STRING"

/** The transcoder worker's parameters: the callback, the edits, the source, a second path and the options. */
private val TRANSCODE_PARAMETERS = listOf("Lcom/facebook/msys/mci/TranscodeVideoCompletionCallback;",
    "Lcom/facebook/msys/mci/VideoEdits;", STRING, STRING, "Ljava/util/Map;")

private fun xheChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the shared video copy moved ($detail)")

private fun ReferenceInstruction.ref() = reference.toString()

/**
 * Index of the `Uri.fromFile` that points the new attachment at Messenger's finished copy of a shared item. The copy
 * ends like this:
 *
 *     invoke-direct {vOut, vFile, vAppend}, FileOutputStream-><init>(File, Z)V
 *     invoke-static {vIn, vOut}, <copy>(InputStream, OutputStream)V
 *     invoke-virtual {vOut}, OutputStream->close()V
 *     invoke-static {vFile}, Uri->fromFile(File)Uri             <- the helper goes in before this
 *
 * Null when the method has no such site, or more than one.
 */
internal fun Method.shareCopySite(): Int? {
    val code = implementation?.instructions?.toList() ?: return null
    val sites = (3 until code.size).filter { at ->
        val point = code[at] as? FiveRegisterInstruction
        val close = code[at - 1] as? FiveRegisterInstruction
        val copy = code[at - 2] as? FiveRegisterInstruction
        val open = code[at - 3] as? FiveRegisterInstruction
        val copier = (copy as? ReferenceInstruction)?.reference as? MethodReference
        point != null && close != null && copy != null && open != null && copier != null &&
            point.opcode == Opcode.INVOKE_STATIC && (point as ReferenceInstruction).ref() == FROM_FILE &&
            close.opcode == Opcode.INVOKE_VIRTUAL && (close as ReferenceInstruction).ref() == CLOSE_COPY &&
            copy.opcode == Opcode.INVOKE_STATIC && copier.returnType == "V" &&
            copier.parameterTypes.map { it.toString() } == listOf("Ljava/io/InputStream;", "Ljava/io/OutputStream;") &&
            open.opcode == Opcode.INVOKE_DIRECT && (open as ReferenceInstruction).ref() == OPEN_COPY &&
            open.registerD == point.registerC && open.registerC == close.registerC && copy.registerD == close.registerC
    }
    return sites.singleOrNull()
}

/**
 * A no-argument `call()`, or the static body Redex moves it into in some 584.1 arm64 builds (its one parameter is its
 * own class), that names its copies orca_share_media and ends one copy as [shareCopySite] reads it.
 */
internal fun Method.isShareCopy(): Boolean =
    returnType == "Ljava/lang/Object;" &&
        ((name == "call" && parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(accessFlags)) ||
            (AccessFlags.STATIC.isSet(accessFlags) && parameterTypes.map { it.toString() } == listOf(definingClass))) &&
        implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == SHARE_MEDIA_NAME } == true &&
        shareCopySite() != null

/** The one share copy, or none when more than one method looks like it. */
internal fun findXheAudio(classes: Iterable<ClassDef>): List<Method> =
    classes.flatMap { it.methods }.filter { it.isShareCopy() }.let { if (it.size == 1) it else emptyList() }

internal fun MutableMethod.validateXheAudio(): Int {
    if (!isShareCopy()) xheChanged("unexpected copy ${hookId()}")
    val site = shareCopySite()!!
    // Only the close may reach the finished copy, or a path could hand Messenger the file unchecked.
    if (site in jumpTargets()) xheChanged("a jump past the closed copy")
    return site
}

/**
 * Hands the extension the finished copy right after Messenger closes it, before anything reads it. With the switch
 * on, a video whose only sound is xHE-AAC gets that sound re-encoded to AAC-LC in the same file. Messenger reads the
 * file's size after this point, and its type and length don't change, so the attachment stays right. The helper
 * catches its own failures, so the share goes on with the copy as it was.
 */
internal fun MutableMethod.injectXheAudio() {
    val site = validateXheAudio()
    val file = (implementation!!.instructions.elementAt(site) as FiveRegisterInstruction).registerC
    addInstructions(site, "invoke-static/range {v$file .. v$file}, $XHE_AUDIO_HELPER")
}

private fun transcodeChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the video transcoder's source moved ($detail)")

/** The register holding the worker's source path on entry: parameters sit at the top, after `this`, the callback and the edits. */
internal fun Method.transcodeSourceRegister(): Int = implementation!!.registerCount - (TRANSCODE_PARAMETERS.size + 1) + 3

private val OBJECT_MOVES = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)

/** Every register [this] names. */
private fun Instruction.namedRegisters(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is ThreeRegisterInstruction -> listOf(registerA, registerB, registerC)
    is TwoRegisterInstruction -> listOf(registerA, registerB)
    is OneRegisterInstruction -> listOf(registerA)
    else -> emptyList()
}

/** Whether [this] overwrites [register] without reading it first, a wide pair included. */
private fun Instruction.writes(register: Int): Boolean {
    val target = (this as? OneRegisterInstruction)?.registerA ?: return false
    if (!opcode.setsRegister() || opcode.name.endsWith("/2addr")) return false
    return target == register || (opcode.setsWideRegister() && target + 1 == register)
}

/** Index of the first instruction that names the source register or overwrites it, or null when none does. */
internal fun Method.firstSourceUse(): Int? {
    val source = transcodeSourceRegister()
    return implementation?.instructions?.indexOfFirst { it.writes(source) || source in it.namedRegisters() }?.takeIf { it >= 0 }
}

/** Whether the source register, or a plain copy of it, goes into a static `(String)Uri` call: Messenger parsing its source. */
internal fun Method.parsesTranscodeSource(): Boolean {
    val code = implementation?.instructions?.toList() ?: return false
    val holders = mutableSetOf(transcodeSourceRegister())
    for (insn in code) {
        val called = (insn as? ReferenceInstruction)?.reference as? MethodReference
        if (called != null && insn.opcode.let { it == Opcode.INVOKE_STATIC || it == Opcode.INVOKE_STATIC_RANGE } &&
            called.parameterTypes.map { it.toString() } == listOf(STRING) && called.returnType == "Landroid/net/Uri;" &&
            insn.namedRegisters().singleOrNull() in holders) return true
        if (insn.opcode in OBJECT_MOVES && (insn as TwoRegisterInstruction).registerB in holders) {
            holders += insn.registerA
            continue
        }
        holders.removeAll { insn.writes(it) }
        if (holders.isEmpty()) return false
    }
    return false
}

internal fun MutableMethod.validateXheTranscode(): Int {
    if (AccessFlags.STATIC.isSet(accessFlags) || hookId() != VIDEO_TRANSCODE ||
        parameterTypes.map { it.toString() } != TRANSCODE_PARAMETERS) transcodeChanged("unexpected worker ${hookId()}")
    val code = implementation?.instructions?.toList() ?: transcodeChanged("no code")
    if (0 in jumpTargets()) transcodeChanged("a jump back to the start")
    val source = transcodeSourceRegister()
    if (source > 255) transcodeChanged("source register v$source")
    if (!parsesTranscodeSource()) transcodeChanged("the source isn't parsed into a Uri")
    firstSourceUse()?.let { if (code[it].writes(source)) transcodeChanged("the source is overwritten before it's read") }
    return source
}

/**
 * Hands the extension the worker's source path before anything reads it. With the switch on, a video whose only sound
 * is xHE-AAC comes back as the path of a copy in Messenger's cache with that sound re-encoded to AAC-LC, so both the
 * passthrough, which sends the source as it is, and a re-encode read the fixed copy. Any other video, a failure, Off
 * and Pause give the path back unchanged.
 */
internal fun MutableMethod.injectXheTranscode() {
    val source = validateXheTranscode()
    addInstructions(0, """
        invoke-static/range {v$source .. v$source}, $XHE_TRANSCODE_HELPER
        move-result-object v$source
    """.trimIndent())
}
