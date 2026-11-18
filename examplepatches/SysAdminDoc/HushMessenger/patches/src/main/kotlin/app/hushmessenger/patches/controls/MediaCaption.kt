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
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/**
 * Where the words you typed land when you send them with a photo or a video. Messenger builds the media messages
 * first and only then sends the text, so the caption always arrives under the picture. This sends the text on its
 * own first, with the same mentions and the same send parameters, and hands the media send an empty caption, so the
 * words sit above the picture instead.
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
 * The media send's caption, as the send method holds it: where the parameter object is built, the registers holding
 * the fragment, the mentions, the send parameters and the typed text, and the fragment's own text send, which takes
 * all four plus a list of messages.
 */
internal class MediaCaptionSite(
    val at: Int,
    val fragment: Int,
    val mentions: Int,
    val params: Int,
    val text: Int,
    val textSend: String,
)

private fun mediaCaptionChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the composer's send changed ($detail)")

private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.type() = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

private fun Instruction.method() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun MethodReference.shape() = parameterTypes.map { it.toString() }

/** The fragment's own text send: static, returns nothing, takes the fragment, mentions, parameters, text and a list. */
private fun Method.textSends(): List<MethodReference> = code()
    .filter { it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE }
    .mapNotNull { it.method() }
    .filter {
        it.definingClass == definingClass && it.returnType == "V" &&
            it.shape() == listOf(definingClass, IMMUTABLE_LIST, CAPTION_MAP, CAPTION_STRING, "Ljava/util/List;")
    }
    .distinctBy { "${it.name}(${it.shape().joinToString("")})" }

/**
 * Where the typed text goes into the media send's parameter object: a `new-instance` for a class built straight
 * after with the fragment, the mentions, the send parameters and the text. The text is the register the helper
 * replaces, so the object must be built by a plain `invoke-direct`, whose registers all fit the helper's call.
 */
internal fun Method.mediaCaptionSite(): MediaCaptionSite? {
    val code = code()
    if (code.none { it.opcode in CAPTION_STRINGS && it.string() == SEND_CLICKED }) return null
    val send = textSends().singleOrNull() ?: return null
    val sites = code.indices.mapNotNull { at ->
        if (code[at].opcode != Opcode.NEW_INSTANCE) return@mapNotNull null
        val built = code[at].type() ?: return@mapNotNull null
        val holder = (code[at] as OneRegisterInstruction).registerA
        val call = code.getOrNull(at + 1) ?: return@mapNotNull null
        if (call.opcode != Opcode.INVOKE_DIRECT || call !is FiveRegisterInstruction) return@mapNotNull null
        val ctor = call.method() ?: return@mapNotNull null
        if (ctor.definingClass != built || ctor.name != "<init>" || call.registerCount != 5) return@mapNotNull null
        if (ctor.shape() != listOf(definingClass, IMMUTABLE_LIST, CAPTION_MAP, CAPTION_STRING)) return@mapNotNull null
        if (call.registerC != holder) return@mapNotNull null
        // The text register is written over by the helper's answer, so it can't be the object being built.
        if (call.registerG == holder) return@mapNotNull null
        MediaCaptionSite(at, call.registerD, call.registerE, call.registerF, call.registerG,
            "${send.definingClass}->${send.name}(${send.shape().joinToString("")})V")
    }
    val site = sites.singleOrNull() ?: return null
    // The helper's call goes in front of the new-instance, so nothing may branch onto it.
    if (site.at in jumpTargets()) return null
    return site
}

/**
 * The one send that carries a caption. A build whose send no longer hands the text to the media parameters gets no
 * hook, and the switch shows as unavailable instead of moving a message somewhere it doesn't belong.
 */
internal fun findMediaCaption(classes: Iterable<ClassDef>): List<Method> =
    classes.flatMap { it.methods }.filter { it.mediaCaptionSite() != null }

internal fun MutableMethod.validateMediaCaption(): MediaCaptionSite =
    mediaCaptionSite() ?: mediaCaptionChanged("no caption handed to the media send in ${hookId()}")

/**
 * While the switch is on, the helper sends the typed words as their own message before the media parameters are
 * built, and the media send is left an empty caption, which is what a photo sent with nothing typed already carries.
 * Off, Pause and safe mode leave the text where Messenger puts it.
 */
internal fun MutableMethod.injectMediaCaption() {
    val site = validateMediaCaption()
    addInstructions(site.at, """
        invoke-static {v${site.fragment}, v${site.mentions}, v${site.params}, v${site.text}}, $definingClass->$MEDIA_CAPTION_HELPER($definingClass$IMMUTABLE_LIST$CAPTION_MAP$CAPTION_STRING)$CAPTION_STRING
        move-result-object v${site.text}
    """.trimIndent())
}

/**
 * The static helper the composer's send calls with the fragment, the mentions, the send parameters and the typed
 * text. With the switch on it sends the text by the fragment's own text send, with no media attached, and answers
 * with an empty caption so the picture goes out under it. Off, it answers with the text it was given.
 */
internal fun mediaCaptionHelper(host: String, textSend: String): MutableMethod {
    val parameters = listOf(host, IMMUTABLE_LIST, CAPTION_MAP, CAPTION_STRING).map { ImmutableMethodParameter(it, null, null) }
    // p0 is the fragment, p1 its mentions, p2 the send parameters, p3 the typed text.
    return MutableMethod(ImmutableMethod(host, MEDIA_CAPTION_HELPER, parameters, CAPTION_STRING,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, ImmutableMethodImplementation(6, emptyList(), null, null)))
        .apply {
            addInstructionsWithLabels(0, """
                invoke-static {p3}, $SETTINGS->captionBeforeMedia($CAPTION_STRING)Z
                move-result v0
                if-eqz v0, :stock_caption
                new-instance v1, Ljava/util/ArrayList;
                invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
                invoke-static {p0, p1, p2, p3, v1}, $textSend
                const-string p3, ""
                :stock_caption
                return-object p3
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
