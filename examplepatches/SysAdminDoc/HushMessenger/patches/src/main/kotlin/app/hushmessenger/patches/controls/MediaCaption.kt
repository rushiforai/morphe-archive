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
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
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
 * words that already went, what the helper calls, and the fragment's media send it calls.
 */
internal class MediaCaptionSite(val at: Int, val fragment: Int, val sent: Int, val calls: MediaCaptionCalls, val mediaSend: String)

/**
 * #236: the second hook of the switch, in the compose fragment's send of a photo or video that comes back from
 * Messenger's editor (Edit on a photo above the message box, or the camera). That send hands the media straight to the
 * fragment's media send and never reads the composer, so the words typed before opening the editor stayed in the box.
 */
internal const val MEDIA_CAPTION_EDITOR = "media_caption_editor"

/** The one string the editor's send loads, for a kind of media it doesn't know. */
private const val EDITOR_SEND_MARK = "Unknown media resource type being sent from Camera"

private const val EDITOR_MESSAGE = "Lcom/facebook/messaging/model/messages/Message;"

/** The static helper the editor's send calls before its media send. */
internal const val MEDIA_CAPTION_EDITOR_HELPER = "hushCaptionForEditor"

/** The kind the editor's send gives a sticker made in the camera, which isn't a photo, so its words stay put. */
internal const val EDITOR_STICKER = "sticker"

/** The editor's media send: where it is, and the registers holding the fragment and the kind of media. */
internal class MediaCaptionEditorSite(val at: Int, val fragment: Int, val kind: Int, val mediaSend: String)

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
        "${mapField!!.definingClass}->${mapField.name}:${mapField.type}"), mediaSend.id())
}

/**
 * The editor's send, as Messenger 588 writes it:
 *
 *     ...the message's first media, and its kind as a string ("image", "video" or "sticker") in vKind
 *     move-object vFragment, p0
 *     invoke-static/range {...}, mediaSend(..., fragment, ..., kind, media list)
 *     return-void
 *
 * The media send is the same one the composer's send uses for a plain photo. The hook goes right before it, so the
 * words go out only once the media is known and on its way.
 */
internal fun Method.mediaCaptionEditorSite(): MediaCaptionEditorSite? {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "V" || parameterTypes.map { it.toString() } != listOf(EDITOR_MESSAGE)) return null
    val code = code()
    if (code.none { it.opcode in CAPTION_STRINGS && it.string() == EDITOR_SEND_MARK }) return null
    val sends = code.indices.filter { at ->
        val sent = code[at].method()
        (code[at].opcode == Opcode.INVOKE_STATIC || code[at].opcode == Opcode.INVOKE_STATIC_RANGE) && sent != null &&
            sent.definingClass == definingClass && sent.returnType == "V" && sent.shape().lastOrNull() == "Ljava/util/List;"
    }
    val at = sends.singleOrNull() ?: return null
    val send = code[at].method()!!
    val shape = send.shape()
    // One fragment and one kind among the arguments, and nothing wide, so each argument has one register.
    if (shape.count { it == definingClass } != 1 || shape.count { it == CAPTION_STRING } != 1 || shape.any { it == "J" || it == "D" }) return null
    val registers = code[at].captionRegisters()
    if (registers.size != shape.size) return null
    val fragment = registers[shape.indexOf(definingClass)]
    val kind = registers[shape.indexOf(CAPTION_STRING)]
    // The fragment handed over is this one: p0, or a copy of p0 made in the straight run up to the send.
    val self = (implementation?.registerCount ?: return null) - 2
    val targets = jumpTargets()
    if (fragment != self) {
        val copyAt = (at - 1 downTo 0).firstOrNull { code[it].captionWrites(fragment) } ?: return null
        val copy = code[copyAt]
        if (copy.opcode != Opcode.MOVE_OBJECT && copy.opcode != Opcode.MOVE_OBJECT_FROM16) return null
        if ((copy as TwoRegisterInstruction).registerB != self) return null
        if ((copyAt + 1..at).any { it in targets }) return null
    }
    if ((0 until at).any { code[it].captionWrites(self) }) return null
    // The send ends with it.
    if (code.getOrNull(at + 1)?.opcode != Opcode.RETURN_VOID) return null
    // The helper's call goes in front of the media send, so nothing may branch onto it, and it uses the four-bit form.
    if (at in targets || fragment > 15 || kind > 15) return null
    return MediaCaptionEditorSite(at, fragment, kind, send.id())
}

/**
 * The composer view the fragment's reader of the typed text reads first and refuses when it's gone
 * (`iget-object vView, p0, field` and then `if-eqz vView`). An activity result can come back before the view does.
 */
internal fun Method.composerViewField(): String? {
    val code = code()
    val self = (implementation?.registerCount ?: return null) - 1
    if (AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.isNotEmpty()) return null
    val read = code.firstOrNull() ?: return null
    val field = (read as? ReferenceInstruction)?.reference as? FieldReference ?: return null
    if (read.opcode != Opcode.IGET_OBJECT || (read as TwoRegisterInstruction).registerB != self || field.definingClass != definingClass) return null
    val view = (read as OneRegisterInstruction).registerA
    val check = (1 until minOf(code.size, 4)).firstOrNull { code[it].opcode == Opcode.IF_EQZ && (code[it] as OneRegisterInstruction).registerA == view }
        ?: return null
    if ((1 until check).any { code[it].captionWrites(view) || code[it] is OffsetInstruction }) return null
    return "${field.definingClass}->${field.name}:${field.type}"
}

/**
 * The editor's send in each compose fragment whose composer send [findMediaCaption] found, calling the same media
 * send, in a fragment whose reader of the typed text checks for the composer view first.
 */
internal fun findMediaCaptionEditor(classes: Iterable<ClassDef>, sends: List<Method>): List<Method> {
    val sites = sends.mapNotNull { send -> send.mediaCaptionSite()?.let { send.definingClass to it } }.toMap()
    return classes.filter { it.type in sites }.flatMap { host ->
        val site = sites.getValue(host.type)
        if (host.methods.singleOrNull { it.hookId() == site.calls.typedText }?.composerViewField() == null) return@flatMap emptyList<Method>()
        host.methods.filter { it.mediaCaptionEditorSite()?.mediaSend == site.mediaSend }
    }
}

internal fun MutableMethod.validateMediaCaptionEditor(): MediaCaptionEditorSite =
    mediaCaptionEditorSite() ?: mediaCaptionChanged("no media send at the end of the editor's send in ${hookId()}")

/** Right before the editor's media send, the helper gets the fragment and the kind of media. */
internal fun MutableMethod.injectMediaCaptionEditor() {
    val site = validateMediaCaptionEditor()
    addInstructions(site.at,
        "invoke-static {v${site.fragment}, v${site.kind}}, $definingClass->$MEDIA_CAPTION_EDITOR_HELPER($definingClass$CAPTION_STRING)V")
}

/**
 * The static helper the editor's send calls with the fragment and the kind of media. With the composer view there and
 * anything but a sticker, it hands the fragment to [mediaCaptionHelper] with the flag down, which sends the words when
 * the switch is on and something is typed. Messenger's text send clears the box as it always does.
 */
internal fun mediaCaptionEditorHelper(host: String, composerView: String): MutableMethod {
    val parameters = listOf(host, CAPTION_STRING).map { ImmutableMethodParameter(it, null, null) }
    // p0 is the fragment, p1 the kind of media.
    return MutableMethod(ImmutableMethod(host, MEDIA_CAPTION_EDITOR_HELPER, parameters, "V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, ImmutableMethodImplementation(3, emptyList(), null, null)))
        .apply {
            addInstructionsWithLabels(0, """
                iget-object v0, p0, $composerView
                if-eqz v0, :done
                const-string v0, "$EDITOR_STICKER"
                invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-nez v0, :done
                const/4 v0, 0x0
                invoke-static {p0, v0}, $host->$MEDIA_CAPTION_HELPER(${host}I)I
                :done
                return-void
            """.trimIndent())
        }
}

/**
 * #236: two more of the switch's hooks, for a photo or video Messenger's editor sends to the chat by itself. A chat in a
 * bubble opens the editor in a task of its own, and Android hands no result back across tasks, so the editor sends the
 * media straight to the chat ("thread_view") and the compose fragment's editor send never runs. The chat's opening of
 * the editor hands the chat fragment to the extension, and the editor's own send hands it the message's media right
 * before it goes, so the extension can send the chat's words first through [mediaCaptionEditorHelper].
 */
internal const val MEDIA_CAPTION_CHAT = "media_caption_chat"

internal const val MEDIA_CAPTION_DIRECT = "media_caption_direct"

private const val CAPTION_EXTENSION = "Lapp/hushmessenger/extension/EditorCaption;"

internal const val EDITOR_OPENING_CALL = "$CAPTION_EXTENSION->editorOpening(Ljava/lang/Object;)V"

internal const val EDITOR_SENDING_CALL = "$CAPTION_EXTENSION->editorSending(Ljava/util/List;)V"

/** Where the editor's own send says the media goes: the chat that opened it. */
private const val CAPTION_DIRECT_PLACE = "thread_view"

/** The flags MontageComposerActivity's intent gets for a chat in a bubble: a new task, cleared to the top. */
private const val CAPTION_OWN_TASK = 0x14000000

private val CAPTION_DIRECT_SHAPE = listOf("Landroid/os/Bundle;", EDITOR_MESSAGE, NAVIGATION_TRIGGER)

/** What ends a straight run of code, other than a branch that leaves it. */
private val CAPTION_RUN_ENDS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32, Opcode.RETURN_VOID, Opcode.RETURN,
    Opcode.RETURN_OBJECT, Opcode.RETURN_WIDE, Opcode.THROW, Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH)

private fun FieldReference.captionId() = "$definingClass->$name:$type"

/**
 * The chat fragment's opening of Messenger's editor, as 588 writes it: an instance method taking the chat's thread key,
 * the editor's parameter builder and the trigger, which sets the builder's flag for a chat in a bubble
 * (`iput-boolean vInBubble, vBuilder, MontageComposerFragmentParams$Builder->...:Z`). The hook goes at its entry.
 */
internal fun Method.mediaCaptionChatSite(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "V" || implementation == null) return false
    val shape = parameterTypes.map { it.toString() }
    if (listOf(THREAD_KEY_TYPE, EDITOR_BUILDER, NAVIGATION_TRIGGER).any { type -> shape.count { it == type } != 1 }) return false
    return code().any { insn ->
        insn.opcode == Opcode.IPUT_BOOLEAN && ((insn as ReferenceInstruction).reference as? FieldReference)?.definingClass == EDITOR_BUILDER
    }
}

/**
 * The opening of the editor in each chat fragment that holds a compose fragment whose editor send [findMediaCaptionEditor]
 * found. The extension finds that compose fragment again by the field's type, through the helper the switch adds to it.
 */
internal fun findMediaCaptionChat(classes: Iterable<ClassDef>, editors: List<Method>): List<Method> {
    val composers = editors.map { it.definingClass }.toSet()
    if (composers.isEmpty()) return emptyList()
    return classes.filter { chat -> chat.instanceFields.any { it.type in composers } }
        .flatMap { chat -> chat.methods.filter { it.mediaCaptionChatSite() } }
}

internal fun Method.editorOpeningHooked(): Boolean = code().any { it.method()?.id() == EDITOR_OPENING_CALL }

internal fun MutableMethod.validateMediaCaptionChat() {
    if (!editorOpeningHooked() && !mediaCaptionChatSite()) mediaCaptionChanged("no opening of the editor in ${hookId()}")
}

/** At the entry, the chat fragment goes to the extension, which keeps the one that opened the editor last. */
internal fun MutableMethod.injectMediaCaptionChat() {
    validateMediaCaptionChat()
    if (editorOpeningHooked()) return
    addInstructions(0, "invoke-static/range {p0 .. p0}, $EDITOR_OPENING_CALL")
}

/**
 * The editor's own send to the chat: where the hook goes, the register it may use for the media list (the place
 * string's, which is written right after), the message the send takes, the message's media list the block checks, and
 * the editor parameters' flag the block starts with.
 */
internal class MediaCaptionDirectSite(val at: Int, val media: Int, val message: Int, val mediaList: String, val flag: String)

/**
 * The editor's send, as Messenger 588 writes it (`LX/PaT;->EqH` on 347617503):
 *
 *     iget-boolean vFlag, vParams, MontageComposerFragmentParams->A0V:Z     (a chat in a bubble)
 *     if-eqz vFlag, :result
 *     ...the editor's session and trigger, each leaving for the result when it's missing
 *     iget-object vList, vMessage, Message->A1L:ImmutableList
 *     if-eqz vList, :done
 *     ...the list isn't empty, the chat's send queue, the trigger and the kind of send
 *     const-string vPlace, "thread_view"                <- at
 *     invoke-virtual {vQueue, vKind, vMessage, vTrigger, vPlace}, send(LX/...;Message;NavigationTrigger;String)
 *
 * Nothing lands anywhere from the flag's branch to the send, so the hook in front of the string runs exactly when the
 * editor sends by itself. The message comes from the register the send itself takes, never from the parameter.
 */
internal fun Method.mediaCaptionDirectSite(): MediaCaptionDirectSite? {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "V" || parameterTypes.map { it.toString() } != CAPTION_DIRECT_SHAPE) return null
    val code = code()
    val at = code.indices.singleOrNull { code[it].opcode in CAPTION_STRINGS && code[it].string() == CAPTION_DIRECT_PLACE } ?: return null
    val call = code.getOrNull(at + 1) ?: return null
    val sent = call.method() ?: return null
    if (call.opcode != Opcode.INVOKE_VIRTUAL && call.opcode != Opcode.INVOKE_VIRTUAL_RANGE) return null
    val shape = sent.shape()
    if (shape.size != 4 || shape[1] != EDITOR_MESSAGE || shape[2] != NAVIGATION_TRIGGER || shape[3] != CAPTION_STRING) return null
    val registers = call.captionRegisters()
    val media = (code[at] as OneRegisterInstruction).registerA
    if (registers.size != 5 || registers[4] != media) return null
    val message = registers[2]
    // Back to the flag the block starts with, past nothing but the block's own checks.
    val guard = (at - 1 downTo 1).firstOrNull { i ->
        if (code[i].opcode in CAPTION_RUN_ENDS) return null
        val read = code[i - 1]
        val field = (read as? ReferenceInstruction)?.reference as? FieldReference
        code[i].opcode == Opcode.IF_EQZ && read.opcode == Opcode.IGET_BOOLEAN && field?.definingClass == MONTAGE_PARAMS &&
            (read as OneRegisterInstruction).registerA == (code[i] as OneRegisterInstruction).registerA
    } ?: return null
    val flag = ((code[guard - 1] as ReferenceInstruction).reference as FieldReference).captionId()
    val targets = jumpTargets()
    if ((guard + 1..at + 1).any { it in targets }) return null
    // The block's one read of the message's media, null-checked, from the message the send takes.
    val read = (guard + 1 until at).singleOrNull { i ->
        val field = (code[i] as? ReferenceInstruction)?.reference as? FieldReference
        code[i].opcode == Opcode.IGET_OBJECT && (code[i] as TwoRegisterInstruction).registerB == message &&
            field?.definingClass == EDITOR_MESSAGE && field.type == IMMUTABLE_LIST
    } ?: return null
    val list = (code[read] as OneRegisterInstruction).registerA
    val check = code[read + 1]
    if (check.opcode != Opcode.IF_EQZ || (check as OneRegisterInstruction).registerA != list) return null
    if ((read + 1 until at).any { code[it].captionWrites(message) }) return null
    // The hook's read and call use the four-bit form.
    if (media > 15 || message > 15 || media == message) return null
    return MediaCaptionDirectSite(at, media, message, ((code[read] as ReferenceInstruction).reference as FieldReference).captionId(), flag)
}

/**
 * The flag MontageComposerActivity's intent builder reads before it gives the editor a task of its own, or null: its one
 * boolean of the editor's parameters, in the one static (Context, parameters, trigger) builder that loads those flags.
 */
internal fun editorOwnTaskFlag(classes: Iterable<ClassDef>): String? {
    val activity = classes.firstOrNull { it.type == MONTAGE_ACTIVITY } ?: return null
    val builder = activity.methods.singleOrNull {
        AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Landroid/content/Intent;" &&
            it.parameterTypes.map { type -> type.toString() } == listOf("Landroid/content/Context;", MONTAGE_PARAMS, NAVIGATION_TRIGGER)
    } ?: return null
    val code = builder.code()
    if (code.none { it is NarrowLiteralInstruction && it.narrowLiteral == CAPTION_OWN_TASK }) return null
    return code.filter { it.opcode == Opcode.IGET_BOOLEAN }
        .mapNotNull { (it as ReferenceInstruction).reference as? FieldReference }
        .filter { it.definingClass == MONTAGE_PARAMS }.map { it.captionId() }.distinct().singleOrNull()
}

/** The editor's own send to the chat, behind the same flag that gives the editor a task of its own. */
internal fun findMediaCaptionDirect(classes: Iterable<ClassDef>): List<Method> {
    val flag = editorOwnTaskFlag(classes) ?: return emptyList()
    return classes.flatMap { it.methods }.filter { it.mediaCaptionDirectSite()?.flag == flag }
}

internal fun Method.editorSendingHooked(): Boolean = code().any { it.method()?.id() == EDITOR_SENDING_CALL }

internal fun MutableMethod.validateMediaCaptionDirect() {
    if (!editorSendingHooked() && mediaCaptionDirectSite() == null)
        mediaCaptionChanged("no send of its own to the chat in the editor's send ${hookId()}")
}

/** In front of the editor's own send to the chat, the extension gets the media of the message that send takes. */
internal fun MutableMethod.injectMediaCaptionDirect() {
    validateMediaCaptionDirect()
    if (editorSendingHooked()) return
    val site = mediaCaptionDirectSite()!!
    addInstructions(site.at, """
        iget-object v${site.media}, v${site.message}, ${site.mediaList}
        invoke-static {v${site.media}}, $EDITOR_SENDING_CALL
    """.trimIndent())
}

/**
 * #236: the switch's hook for the editor a chat opens from the "Attachment 1 of 1 selected" chip over the gallery tray.
 * Its Send hands the edited photo back to the compose fragment as an activity result, and the fragment sends the
 * result's message through its general message send without reading the composer, so the words stayed in the box. The
 * hook hands that message's kind of media to the editor helper right before the send.
 */
internal const val MEDIA_CAPTION_RESULT = "media_caption_result"

/** The extension's kind of media for the result's message: "image", "video" or "sticker", as the editor's send names them. */
internal const val RESULT_KIND_CALL = "$CAPTION_EXTENSION->resultKind(Ljava/lang/Object;)Ljava/lang/String;"

/** The extra the editor's result carries its message in. */
private const val RESULT_MESSAGE_EXTRA = "extra_message"

private const val PARCELABLE_EXTRA = "Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;"

private val ACTIVITY_RESULT_SHAPE = listOf("I", "I", "Landroid/content/Intent;")

/**
 * The editor result's send: where the hook goes (the send's `sget-object`), the registers of the fragment and the
 * message the send takes, and the `sget-object`'s own register, which it writes right after the hook.
 */
internal class MediaCaptionResultSite(val at: Int, val fragment: Int, val message: Int, val scratch: Int)

/**
 * The compose fragment's activity result for the editor, as Messenger 588 writes it (`LX/7pp;->onActivityResult` on
 * 347617503, request code 0x1cd0, and `LX/7sp;` with `A23` on the 497 family):
 *
 *     const-string/jumbo vKey, "extra_message"                         (a branch lands here)
 *     invoke-virtual {vIntent, vKey}, Intent->getParcelableExtra(String)
 *     move-result-object vMessage
 *     if-eqz vMessage, :throw
 *     check-cast vMessage, Message
 *     sget-object vScratch, LX/5GM;->A0x:LX/5GM;                       <- at
 *     invoke-virtual {vFragment, vScratch, vMessage}, LX/7pp;->A22(LX/5GM;Message)V
 *     return-void
 *
 * A22 is the fragment's general message send, which the text send ends in too, so the hook goes in front of this one
 * call of it. Nothing lands from the read to the return, and no try covers it. The registers are the send's own; the
 * site is found whatever they are, and [validateMediaCaptionResult] refuses the ones the hook's calls can't reach.
 */
internal fun Method.mediaCaptionResultSite(): MediaCaptionResultSite? {
    if (AccessFlags.STATIC.isSet(accessFlags) || name != "onActivityResult" || returnType != "V" ||
        parameterTypes.map { it.toString() } != ACTIVITY_RESULT_SHAPE) return null
    val code = code()
    val key = code.indices.singleOrNull { code[it].opcode in CAPTION_STRINGS && code[it].string() == RESULT_MESSAGE_EXTRA } ?: return null
    if (key + 7 >= code.size) return null
    val read = code[key + 1]
    if ((read.opcode != Opcode.INVOKE_VIRTUAL && read.opcode != Opcode.INVOKE_VIRTUAL_RANGE) || read.method()?.id() != PARCELABLE_EXTRA) return null
    if (read.captionRegisters().getOrNull(1) != (code[key] as OneRegisterInstruction).registerA) return null
    if (code[key + 2].opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val message = (code[key + 2] as OneRegisterInstruction).registerA
    val check = code[key + 3]
    if (check.opcode != Opcode.IF_EQZ || (check as OneRegisterInstruction).registerA != message) return null
    val cast = code[key + 4]
    if (cast.opcode != Opcode.CHECK_CAST || (cast as OneRegisterInstruction).registerA != message ||
        (cast as ReferenceInstruction).reference.toString() != EDITOR_MESSAGE) return null
    val at = key + 5
    val kind = (code[at] as? ReferenceInstruction)?.reference as? FieldReference
    if (code[at].opcode != Opcode.SGET_OBJECT || kind == null) return null
    val scratch = (code[at] as OneRegisterInstruction).registerA
    val call = code[at + 1]
    val sent = call.method() ?: return null
    if (call.opcode != Opcode.INVOKE_VIRTUAL && call.opcode != Opcode.INVOKE_VIRTUAL_RANGE) return null
    if (sent.definingClass != definingClass || sent.returnType != "V" || sent.shape() != listOf(kind.type, EDITOR_MESSAGE)) return null
    val registers = call.captionRegisters()
    if (registers.size != 3 || registers[1] != scratch || registers[2] != message || registers.distinct().size != 3) return null
    if (code[at + 2].opcode != Opcode.RETURN_VOID) return null
    val targets = jumpTargets()
    if ((key + 1..at + 2).any { it in targets }) return null
    // The helper's send can throw, and a handler would see the hook's registers.
    val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    if (implementation!!.tryBlocks.any { block -> (key..at + 2).any { addresses[it] - block.startCodeAddress in 0 until block.codeUnitCount } })
        return null
    return MediaCaptionResultSite(at, registers[0], message, scratch)
}

/** The editor result's send in each compose fragment whose editor send [findMediaCaptionEditor] found. */
internal fun findMediaCaptionResult(classes: Iterable<ClassDef>, editors: List<Method>): List<Method> {
    val composers = editors.map { it.definingClass }.toSet()
    return classes.filter { it.type in composers }.flatMap { host -> host.methods.filter { it.mediaCaptionResultSite() != null } }
}

internal fun Method.resultKindHooked(): Boolean = code().any { it.method()?.id() == RESULT_KIND_CALL }

/** The site, or null once the hook is in. The hook's plain calls reach v15, so a fragment or free register past it is refused. */
internal fun MutableMethod.validateMediaCaptionResult(): MediaCaptionResultSite? {
    if (resultKindHooked()) return null
    val site = mediaCaptionResultSite() ?: mediaCaptionChanged("no send of the editor's result in ${hookId()}")
    if (site.fragment > 15 || site.scratch > 15)
        mediaCaptionChanged("the editor's result send in ${hookId()} keeps the fragment in v${site.fragment} and its free register in " +
            "v${site.scratch}, past the v15 the helper's call can take")
    return site
}

/**
 * Right before the result's send, the extension reads the message's kind of media into the send's free register, and
 * the editor helper gets the fragment and that kind, so the words go first for anything but a sticker.
 */
internal fun MutableMethod.injectMediaCaptionResult() {
    val site = validateMediaCaptionResult() ?: return
    val kind = if (site.message > 15) "invoke-static/range {v${site.message} .. v${site.message}}, $RESULT_KIND_CALL"
        else "invoke-static {v${site.message}}, $RESULT_KIND_CALL"
    addInstructions(site.at, """
        $kind
        move-result-object v${site.scratch}
        invoke-static {v${site.fragment}, v${site.scratch}}, $definingClass->$MEDIA_CAPTION_EDITOR_HELPER($definingClass$CAPTION_STRING)V
    """.trimIndent())
}

/**
 * #236: the switch's hooks for the editor the chip opens, the way Messenger 588 runs it on the phone. The chip belongs to
 * the msys composer's attachment preview plugin, which opens the editor on an EditAttachmentEvent. The editor's Send comes
 * back to the composer's camera plugin as an activity result, and the batch send it builds (`LX/732;->invoke` on
 * 347617503, `LX/76A;` on the 497 family) hands the photo to the media send without reading the box, so the words stayed
 * behind. The plugin's handler gives the extension the composer's event bus and the holder of its typed text when the chip
 * opens the editor. At the batch send's entry a helper asks the extension whether that composer's words go first, and if
 * so posts the same SendTextEvent the composer's send button posts, on the same bus, so the composer's text plugin sends
 * the words and clears the box before the photo is handed over.
 */
internal const val MEDIA_CAPTION_CHIP = "media_caption_chip"

internal const val MEDIA_CAPTION_CHIP_SEND = "media_caption_chip_send"

private const val COMPOSER_CAPABILITIES = "Lcom/facebook/xapp/messaging/capability/vector/Capabilities;"

private const val EDIT_ATTACHMENT_EVENT = "Lcom/facebook/xapp/messaging/composer/attachmentpreview/events/EditAttachmentEvent;"

private const val REMOVE_ATTACHMENT_EVENT = "Lcom/facebook/xapp/messaging/composer/attachmentpreview/events/RemoveAttachmentEvent;"

internal const val SEND_TEXT_EVENT = "Lcom/facebook/xapp/messaging/composer/text/event/SendTextEvent;"

/** SendTextEvent's Kotlin constructor: text, trigger, mentions, extras, the mask of the ones left to their defaults, time. */
internal const val SEND_TEXT_EVENT_INIT = "$SEND_TEXT_EVENT-><init>(Ljava/lang/CharSequence;Ljava/lang/String;Ljava/util/List;Ljava/util/Map;IJ)V"

/**
 * The mask the composer's send button hands SendTextEvent: every argument but the time left to its default, so the text
 * plugin reads the box itself and sends it from the text tab.
 */
internal const val SEND_BUTTON_DEFAULTS = 0x3e

internal const val CHIP_OPENING_CALL = "$CAPTION_EXTENSION->chipOpening(Ljava/lang/Object;Ljava/lang/Object;)V"

internal const val CHIP_SENDING_CALL = "$CAPTION_EXTENSION->chipSending(Ljava/lang/Object;Ljava/util/List;)Z"

/** The static helper the plugin's handler calls at its entry with its own arguments. */
internal const val MEDIA_CAPTION_CHIP_HELPER = "hushCaptionChip"

/** The static helper the batch send calls at its entry with itself. */
internal const val MEDIA_CAPTION_CHIP_SEND_HELPER = "hushCaptionChipSend"

private const val CAPTION_LIST = "Ljava/util/List;"

/** Whether the class is an interface that declares the composer's `getText()`, which the extension calls by that name. */
internal fun ClassDef.declaresTypedText(): Boolean = AccessFlags.INTERFACE.isSet(accessFlags) &&
    methods.any { it.name == "getText" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/CharSequence;" }

/** The plugin's one instance field holding the composer's typed text, as `class->name:type`, or null. */
internal fun ClassDef.chipTextField(classOf: (String) -> ClassDef?): String? =
    instanceFields.filter { classOf(it.type)?.declaresTypedText() == true }.singleOrNull()?.captionId()

private fun Instruction.isStaticCall() = opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE

/**
 * The attachment preview plugin's event handler, as 588 writes it (`LX/B6i;->Diu` on 347617503): an instance method
 * taking (Capabilities, the composer's state, the composer's bus, ComposerEvent) that checks for an EditAttachmentEvent and
 * hands it with the bus to one static opening of the editor. The hook goes at its entry and passes the handler's own
 * arguments on as a range, so it reads them before anything is written. Answers the bus's type.
 */
internal fun Method.mediaCaptionChipSite(): String? {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "V" || implementation == null) return null
    val shape = parameterTypes.map { it.toString() }
    if (shape.size != 4 || shape[0] != COMPOSER_CAPABILITIES || shape[3] != COMPOSER_EVENT) return null
    val bus = shape[2]
    val code = code()
    if (code.none { it.opcode == Opcode.INSTANCE_OF && (it as ReferenceInstruction).reference.toString() == EDIT_ATTACHMENT_EVENT }) return null
    val opens = code.filter { it.isStaticCall() }.mapNotNull { it.method() }
        .filter { EDIT_ATTACHMENT_EVENT in it.shape() && bus in it.shape() }.distinctBy { it.id() }
    if (opens.size != 1) return null
    // The helper's call goes in front of the first instruction, so nothing may branch onto it.
    if (0 in jumpTargets()) return null
    return bus
}

/** The handler in each plugin class that holds the composer's typed text. */
internal fun findMediaCaptionChip(classes: Iterable<ClassDef>): List<Method> {
    val byType = classes.associateBy { it.type }
    return classes.filter { it.chipTextField { type -> byType[type] } != null }
        .flatMap { host -> host.methods.filter { it.mediaCaptionChipSite() != null } }
}

/** The batch send: its own fields holding the composer's bus and the media, the bus's type, and the bus post it uses. */
internal class MediaCaptionChipSendSite(val bus: String, val media: String, val busType: String, val post: String)

/**
 * The batch send of the editor's result, as 588 writes it (`LX/732;->invoke` on 347617503): a lambda's `invoke()` that
 * reads its captured bus and media list, hands the media to one static media send taking the bus, two lists and a map,
 * and then posts a RemoveAttachmentEvent for each photo through one static bus post (bus, ComposerEvent). The hook goes at
 * its entry, ahead of the media send.
 */
internal fun Method.mediaCaptionChipSendSite(): MediaCaptionChipSendSite? {
    if (AccessFlags.STATIC.isSet(accessFlags) || name != "invoke" || parameterTypes.isNotEmpty() ||
        returnType != "Ljava/lang/Object;" || implementation == null) return null
    val code = code()
    if (code.none { it.opcode == Opcode.NEW_INSTANCE && (it as ReferenceInstruction).reference.toString() == REMOVE_ATTACHMENT_EVENT }) return null
    val calls = code.filter { it.isStaticCall() }.mapNotNull { it.method() }.filter { it.returnType == "V" }
    val post = calls.filter { it.shape().size == 2 && it.shape()[1] == COMPOSER_EVENT }.distinctBy { it.id() }.singleOrNull() ?: return null
    val busType = post.shape()[0]
    val sends = calls.filter { send -> busType in send.shape() && send.shape().count { it == CAPTION_LIST } >= 2 && "Ljava/util/Map;" in send.shape() }
    if (sends.distinctBy { it.id() }.size != 1) return null
    val own = code.filter { it.opcode == Opcode.IGET_OBJECT }.mapNotNull { (it as ReferenceInstruction).reference as? FieldReference }
        .filter { it.definingClass == definingClass }.distinctBy { it.captionId() }
    val bus = own.singleOrNull { it.type == busType } ?: return null
    val media = own.singleOrNull { it.type == CAPTION_LIST } ?: return null
    if (0 in jumpTargets()) return null
    return MediaCaptionChipSendSite(bus.captionId(), media.captionId(), busType, post.id())
}

/**
 * The batch send on the bus of a handler [findMediaCaptionChip] found, in a build whose SendTextEvent has the constructor
 * the helper calls.
 */
internal fun findMediaCaptionChipSend(classes: Iterable<ClassDef>, chips: List<Method>): List<Method> {
    val buses = chips.mapNotNull { it.mediaCaptionChipSite() }.toSet()
    if (buses.isEmpty()) return emptyList()
    if (classes.none { it.type == SEND_TEXT_EVENT && it.methods.any { m -> m.hookId() == SEND_TEXT_EVENT_INIT } }) return emptyList()
    return classes.flatMap { cls -> cls.methods.filter { it.name == "invoke" && it.mediaCaptionChipSendSite()?.busType in buses } }
}

private fun Method.firstCall() = code().firstOrNull()?.takeIf { it.opcode == Opcode.INVOKE_STATIC_RANGE }?.method()

internal fun Method.chipOpeningHooked(): Boolean = firstCall()?.let { it.definingClass == definingClass && it.name == MEDIA_CAPTION_CHIP_HELPER } == true

internal fun Method.chipSendingHooked(): Boolean = firstCall()?.let { it.definingClass == definingClass && it.name == MEDIA_CAPTION_CHIP_SEND_HELPER } == true

internal fun MutableMethod.validateMediaCaptionChip() {
    if (!chipOpeningHooked() && mediaCaptionChipSite() == null) mediaCaptionChanged("no opening of the editor from the attachment chip in ${hookId()}")
}

/** At the entry, the handler's own arguments go to the chip helper. */
internal fun MutableMethod.injectMediaCaptionChip() {
    validateMediaCaptionChip()
    if (chipOpeningHooked()) return
    addInstructions(0, "invoke-static/range {p0 .. p4}, $definingClass->$MEDIA_CAPTION_CHIP_HELPER($definingClass${parameterTypes.joinToString("")})V")
}

internal fun MutableMethod.validateMediaCaptionChipSend() {
    if (!chipSendingHooked() && mediaCaptionChipSendSite() == null) mediaCaptionChanged("no batch send of the editor's result in ${hookId()}")
}

/** At the entry, the batch send hands itself to the chip send helper. */
internal fun MutableMethod.injectMediaCaptionChipSend() {
    validateMediaCaptionChipSend()
    if (chipSendingHooked()) return
    addInstructions(0, "invoke-static/range {p0 .. p0}, $definingClass->$MEDIA_CAPTION_CHIP_SEND_HELPER($definingClass)V")
}

/**
 * The static helper the plugin's handler calls with its own arguments. For an EditAttachmentEvent, the chip opening the
 * editor, it hands the extension the composer's bus and the holder of its typed text. Every other event goes by.
 */
internal fun mediaCaptionChipHelper(host: String, shape: List<String>, text: String): MutableMethod {
    val parameters = (listOf(host) + shape).map { ImmutableMethodParameter(it, null, null) }
    // p0 is the plugin, p3 the composer's bus and p4 the event.
    return MutableMethod(ImmutableMethod(host, MEDIA_CAPTION_CHIP_HELPER, parameters, "V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, ImmutableMethodImplementation(6, emptyList(), null, null)))
        .apply {
            addInstructionsWithLabels(0, """
                instance-of v0, p4, $EDIT_ATTACHMENT_EVENT
                if-eqz v0, :done
                iget-object v0, p0, $text
                invoke-static {p3, v0}, $CHIP_OPENING_CALL
                :done
                return-void
            """.trimIndent())
        }
}

/**
 * The static helper the batch send calls with itself. When the extension says the words go first (the chip on this bus
 * opened the editor, the switch is on, the media is a photo or video and something is typed), it posts what the
 * composer's send button posts: a SendTextEvent with no text of its own, the button's defaults and System.nanoTime(),
 * through the bus post the batch send uses. The text plugin then reads the box, sends the words and clears it.
 */
internal fun mediaCaptionChipSendHelper(host: String, site: MediaCaptionChipSendSite): MutableMethod {
    val parameters = listOf(ImmutableMethodParameter(host, null, null))
    // p0 is the batch send (v9). The event's constructor takes v1 to v8: the event, text, trigger, mentions, extras,
    // the mask and the time.
    return MutableMethod(ImmutableMethod(host, MEDIA_CAPTION_CHIP_SEND_HELPER, parameters, "V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, ImmutableMethodImplementation(10, emptyList(), null, null)))
        .apply {
            addInstructionsWithLabels(0, """
                iget-object v0, p0, ${site.bus}
                iget-object v1, p0, ${site.media}
                invoke-static {v0, v1}, $CHIP_SENDING_CALL
                move-result v1
                if-eqz v1, :done
                invoke-static {}, Ljava/lang/System;->nanoTime()J
                move-result-wide v7
                const/16 v6, 0x${SEND_BUTTON_DEFAULTS.toString(16)}
                const/4 v2, 0x0
                move-object v3, v2
                move-object v4, v2
                move-object v5, v2
                new-instance v1, $SEND_TEXT_EVENT
                invoke-direct/range {v1 .. v8}, $SEND_TEXT_EVENT_INIT
                invoke-static {v0, v1}, ${site.post}
                :done
                return-void
            """.trimIndent())
        }
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

/** Whether the compose fragment can take [mediaCaptionHelper], or the helper named [name]. */
internal fun ClassDef.checkMediaCaptionHelper(name: String = MEDIA_CAPTION_HELPER) {
    if (methods.any { it.name == name })
        throw PatchException("Messenger controls: $type already has $name")
}

/** Adds [mediaCaptionHelper] or [mediaCaptionEditorHelper] to the compose fragment once [checkMediaCaptionHelper] passed. */
internal fun MutableClass.addMediaCaptionHelper(helper: MutableMethod) {
    checkMediaCaptionHelper(helper.name)
    methods.add(helper)
    directMethods.add(helper)
}
