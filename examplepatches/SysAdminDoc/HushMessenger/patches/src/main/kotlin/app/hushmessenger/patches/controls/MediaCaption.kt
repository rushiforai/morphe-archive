package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/**
 * #195, #236: where the words you typed land when you send them with a photo or a video. On a plain send Messenger
 * hands the media to its media send first and only then sends the composer's text as a message of its own, so the
 * words come in under the picture whenever the media is ready first. This sends the text first, by the fragment's own
 * text send with the same arguments Messenger gives it, and then raises the flag Messenger keeps for a send whose
 * words already went out with the media: with it up, the rest of the send skips the second text send and clears the
 * composer the way that send does.
 *
 * Messenger only attaches the words to the media itself when the mentions ask for it, like a question to Meta AI
 * about the photo. That send keeps its words with the picture, so its branch is left alone.
 */
internal const val MEDIA_CAPTION = "media_caption"

/** The send the compose fragment marks before it reads the composer. */
private const val SEND_CLICKED = "ComposeFragment.onSendClicked"

private const val CAPTION_MAP = "Lcom/google/common/collect/ImmutableMap;"

private const val CAPTION_STRING = "Ljava/lang/String;"

/** The static helper this control adds to the compose fragment. */
internal const val MEDIA_CAPTION_HELPER = "hushCaptionFirst"

private val CAPTION_STRINGS = setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO)

/**
 * What the helper calls, read from the stock text send: the fragment's text send, the fragment's own reader of the
 * typed text, and the empty map Messenger hands the text send.
 */
internal data class MediaCaptionCalls(val textSend: String, val typedText: String, val emptyMap: String)

/**
 * The plain media send in the composer's send: where it starts, the registers holding the fragment and the flag for
 * words that already went, and what the helper calls.
 */
internal class MediaCaptionSite(val at: Int, val fragment: Int, val sent: Int, val calls: MediaCaptionCalls)

private fun mediaCaptionChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the composer's send changed ($detail)")

private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.method() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun MethodReference.shape() = parameterTypes.map { it.toString() }

private fun MethodReference.id() = "$definingClass->$name(${shape().joinToString("")})$returnType"

private fun Instruction.captionRegisters(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

private fun Instruction.captionWrites(register: Int) =
    opcode.setsRegister() && this is OneRegisterInstruction && registerA == register

/** The last instruction in front of [before], after [after], that writes [register]. */
private fun List<Instruction>.lastCaptionWrite(register: Int, after: Int, before: Int): Instruction? =
    (before - 1 downTo after + 1).map { this[it] }.firstOrNull { it.captionWrites(register) }

/** The fragment's own text send: static, returns nothing, takes the fragment, mentions, parameters, text and a list. */
private fun Method.textSends(): List<MethodReference> = code()
    .filter { it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE }
    .mapNotNull { it.method() }
    .filter {
        it.definingClass == definingClass && it.returnType == "V" &&
            it.shape() == listOf(definingClass, IMMUTABLE_LIST, CAPTION_MAP, CAPTION_STRING, "Ljava/util/List;")
    }
    .distinctBy { it.id() }

/**
 * The send's tail, as Messenger 587 and 588 write it:
 *
 *     if-nez vEmpty, :flag            (no media left: straight to the flag)
 *     ...media send(fragment, ..., media list)
 *     :flag
 *     if-eqz vSent, :check            (words still in the composer)
 *     goto :clear
 *     :check
 *     invoke-virtual {fragment}, nothingToSend()Z
 *     move-result vNothing
 *     if-nez vNothing, :done
 *     ...a fresh list, the empty map, null mentions and text
 *     invoke-static {fragment, null, map, null, list}, textSend
 *
 * The hook goes where the media send starts, so the words are on their way before any media is handed over.
 */
internal fun Method.mediaCaptionSite(): MediaCaptionSite? {
    val code = code()
    if (code.none { it.opcode in CAPTION_STRINGS && it.string() == SEND_CLICKED }) return null
    val send = textSends().singleOrNull() ?: return null
    val sendAt = code.indices.singleOrNull { code[it].method()?.id() == send.id() } ?: return null
    val call = code[sendAt] as? FiveRegisterInstruction ?: return null
    if (call.opcode != Opcode.INVOKE_STATIC || call.registerCount != 5) return null
    val fragment = call.registerC
    // In front of it, the question whether there's anything to send as text, skipped past when the answer is no.
    val check = (sendAt - 3 downTo 0).firstOrNull { at ->
        val ask = code[at]
        val asked = ask.method()
        ask.opcode == Opcode.INVOKE_VIRTUAL && asked != null && asked.definingClass == definingClass &&
            asked.parameterTypes.isEmpty() && asked.returnType == "Z" && ask.captionRegisters() == listOf(fragment)
    } ?: return null
    val answer = code[check + 1]
    val skip = code[check + 2]
    if (answer.opcode != Opcode.MOVE_RESULT || skip.opcode != Opcode.IF_NEZ) return null
    if ((answer as OneRegisterInstruction).registerA != (skip as OneRegisterInstruction).registerA) return null
    // From there to the send, only the send's own arguments: no branch, and the stock values for each.
    if ((check + 3 until sendAt).any { code[it] is OffsetInstruction }) return null
    if (call.registerD != call.registerF) return null
    val nothing = code.lastCaptionWrite(call.registerD, check + 2, sendAt)
    if (nothing?.opcode != Opcode.CONST_4 || (nothing as NarrowLiteralInstruction).narrowLiteral != 0) return null
    val map = code.lastCaptionWrite(call.registerE, check + 2, sendAt)
    val mapField = (map as? ReferenceInstruction)?.reference as? FieldReference
    if (map?.opcode != Opcode.SGET_OBJECT || mapField?.type != CAPTION_MAP) return null
    if (code.lastCaptionWrite(call.registerG, check + 2, sendAt)?.opcode != Opcode.MOVE_RESULT_OBJECT) return null
    // The flag: the one branch onto the question, taken while the words are still in the composer, with the jump
    // that clears the composer right after it.
    val flagAt = code.indices.singleOrNull { code[it].opcode == Opcode.IF_EQZ && code.branchTarget(it) == check } ?: return null
    val sent = (code[flagAt] as OneRegisterInstruction).registerA
    if (code.getOrNull(flagAt + 1)?.opcode !in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)) return null
    // Right before the flag, the plain media send: a static send of the fragment's own that takes the fragment and
    // ends with the media list.
    val media = code.getOrNull(flagAt - 1) ?: return null
    val mediaSend = media.method() ?: return null
    if (media.opcode != Opcode.INVOKE_STATIC && media.opcode != Opcode.INVOKE_STATIC_RANGE) return null
    if (mediaSend.definingClass != definingClass || mediaSend.returnType != "V" || mediaSend.shape().lastOrNull() != "Ljava/util/List;") return null
    if (fragment !in media.captionRegisters()) return null
    // And the one branch past it, taken with no media left. The media send's block starts right after that branch.
    val guard = code.indices.singleOrNull { code[it].opcode == Opcode.IF_NEZ && code.branchTarget(it) == flagAt } ?: return null
    val at = guard + 1
    if (at > flagAt - 1) return null
    if ((at until flagAt).any { code[it] is OffsetInstruction || code[it].captionWrites(sent) || code[it].captionWrites(fragment) }) return null
    // The helper's call goes in front of the block's first instruction, so nothing may branch onto it.
    if (at in jumpTargets()) return null
    // The helper's call uses the four-bit form.
    if (fragment > 15 || sent > 15) return null
    // The fragment's own reader of the typed text, which the words-with-the-media branch uses too.
    val reader = code.mapNotNull { insn -> insn.method()?.takeIf { insn.opcode == Opcode.INVOKE_DIRECT } }
        .filter { it.definingClass == definingClass && it.parameterTypes.isEmpty() && it.returnType == CAPTION_STRING }
        .distinctBy { it.id() }.singleOrNull() ?: return null
    return MediaCaptionSite(at, fragment, sent, MediaCaptionCalls(send.id(), reader.id(),
        "${mapField!!.definingClass}->${mapField.name}:${mapField.type}"))
}

/**
 * The one send whose words go out after its media. A build whose send no longer reads like that gets no hook, and the
 * switch shows as unavailable instead of moving a message somewhere it doesn't belong.
 */
internal fun findMediaCaption(classes: Iterable<ClassDef>): List<Method> =
    classes.flatMap { it.methods }.filter { it.mediaCaptionSite() != null }

internal fun MutableMethod.validateMediaCaption(): MediaCaptionSite =
    mediaCaptionSite() ?: mediaCaptionChanged("no plain media send ahead of the text send in ${hookId()}")

/**
 * Right before the media send, the helper gets the fragment and the flag, sends the words when the switch is on, and
 * hands the flag back raised. Off, Pause and safe mode, nothing typed, or a send whose words already went with the
 * media get the flag back as it was.
 */
internal fun MutableMethod.injectMediaCaption() {
    val site = validateMediaCaption()
    addInstructions(site.at, """
        invoke-static {v${site.fragment}, v${site.sent}}, $definingClass->$MEDIA_CAPTION_HELPER(${definingClass}I)I
        move-result v${site.sent}
    """.trimIndent())
}

/**
 * The static helper the composer's send calls with the fragment and the flag for words that already went. With the
 * switch on and something typed, it sends the text the way the stock text send does, with no mentions or text handed
 * in so the send reads both from the composer, and answers 1. Otherwise it answers with the flag it was given.
 */
internal fun mediaCaptionHelper(host: String, calls: MediaCaptionCalls): MutableMethod {
    val parameters = listOf(host, "I").map { ImmutableMethodParameter(it, null, null) }
    // p0 is the fragment, p1 the flag.
    return MutableMethod(ImmutableMethod(host, MEDIA_CAPTION_HELPER, parameters, "I",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, ImmutableMethodImplementation(5, emptyList(), null, null)))
        .apply {
            addInstructionsWithLabels(0, """
                if-nez p1, :as_is
                invoke-direct {p0}, ${calls.typedText}
                move-result-object v0
                invoke-static {v0}, $SETTINGS->captionBeforeMedia($CAPTION_STRING)Z
                move-result v0
                if-eqz v0, :as_is
                const/4 v0, 0x0
                sget-object v1, ${calls.emptyMap}
                new-instance v2, Ljava/util/ArrayList;
                invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V
                invoke-static {p0, v0, v1, v0, v2}, ${calls.textSend}
                const/4 p1, 0x1
                :as_is
                return p1
            """.trimIndent())
        }
}

/** Whether the compose fragment can take [mediaCaptionHelper]. */
internal fun ClassDef.checkMediaCaptionHelper() {
    if (methods.any { it.name == MEDIA_CAPTION_HELPER })
        throw PatchException("Messenger controls: $type already has $MEDIA_CAPTION_HELPER")
}

/** Adds [mediaCaptionHelper] to the compose fragment once [checkMediaCaptionHelper] passed. */
internal fun MutableClass.addMediaCaptionHelper(helper: MutableMethod) {
    checkMediaCaptionHelper()
    methods.add(helper)
    directMethods.add(helper)
}
