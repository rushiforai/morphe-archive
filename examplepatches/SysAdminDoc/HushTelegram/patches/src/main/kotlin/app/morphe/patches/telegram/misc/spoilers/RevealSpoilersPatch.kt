/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.spoilers

import app.morphe.util.names.origDescriptor
import app.morphe.util.names.origString
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireLocals
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.messagemenu.landingOf
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.call
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val SPOILERS = "$EXTENSION_PACKAGE/misc/Spoilers;"
internal const val MESSAGE_OBJECT = "Lorg/telegram/messenger/MessageObject;"
internal const val HAS_MEDIA_SPOILERS = "$MESSAGE_OBJECT->hasMediaSpoilers()Z"
internal const val TEXT_BLOCKS = "Lorg/telegram/messenger/MessageObject\$TextLayoutBlocks;"
internal const val SPOILERS_REVEALED = "$MESSAGE_OBJECT->isSpoilersRevealed:Z"
private const val SEND_PARAMS = "Lorg/telegram/messenger/SendMessagesHelper\$SendMessageParams;"
private const val SEND_SPOILER = "$SEND_PARAMS->hasMediaSpoilers:Z"
private const val BLURRED = "$MESSAGE_OBJECT->needDrawBluredPreview()Z"
private const val SENSITIVE = "$MESSAGE_OBJECT->isHiddenSensitive()Z"
private const val PAID_PREVIEW = "$MESSAGE_OBJECT->hasExtendedMediaPreview()Z"
private const val FORCE_PREVIEW = "Lorg/telegram/messenger/ImageReceiver;->setForcePreview(Z)V"
private const val MEDIA_EXISTS = "$MESSAGE_OBJECT->mediaExists:Z"
private const val DOWNLOADS = "Lorg/telegram/messenger/DownloadController;"
private const val CAN_DOWNLOAD = "$DOWNLOADS->canDownloadMedia($MESSAGE_OBJECT)Z"
private const val IS_LOADING = "Lorg/telegram/messenger/FileLoader;->isLoadingFile(Ljava/lang/String;)Z"
private val ASKS_BLURRED = setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)
private val JUMPS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
internal val ADD = listOf("Landroid/view/View;", "Landroid/text/Layout;", "I", "I", "Ljava/util/Stack;", "Ljava/util/List;")
private val ADD_CORE = listOf("Landroid/view/View;", "Landroid/text/Layout;", "I", "I", "Landroid/text/Spanned;", "Ljava/util/Stack;",
    "Ljava/util/List;", "Ljava/util/ArrayList;")

/** What Telegram's media check reads: the sender's spoiler, and the view-once and sensitive checks that stay. */
private val MEDIA_CHECK = setOf(
    "$MESSAGE_OBJECT->isRepostPreview:Z",
    "$MESSAGE_OBJECT->messageOwner:Lorg/telegram/tgnet/TLRPC\$Message;",
    "Lorg/telegram/tgnet/TLRPC\$Message;->media:Lorg/telegram/tgnet/TLRPC\$MessageMedia;",
    "Lorg/telegram/tgnet/TLRPC\$MessageMedia;->spoiler:Z",
    BLURRED,
    SENSITIVE,
)

/** The classes whose media check feeds what goes out: sending, retrying and notifications. */
internal val ASKS_TELEGRAM = setOf(
    "Lorg/telegram/messenger/SendMessagesHelper;",
    "Lorg/telegram/messenger/NotificationsController;",
    "Lorg/telegram/ui/Components/ChatActivityEnterView;",
)

@Suppress("unused")
val revealSpoilersPatch = bytecodePatch(
    name = "Reveal spoilers",
    description = "Shows spoiler text, photos and videos without the cover, so you don't have to tap. View-once media, " +
        "sensitive content and login codes stay covered. Starts off. Turn it on in HushTelegram settings > " +
        "Conversations.",
    default = true,
) {
    category("Conversations")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveRevealSpoilers()
        val timed = resolveTimedBlur()
        // Assembled on copies first, so a refusal leaves the app untouched.
        site.insertText(MutableMethod(ImmutableMethod.of(site.textCovers)))
        (site.media + timed.sites).groupBy { it.method }.forEach { (method, sites) ->
            val copy = MutableMethod(ImmutableMethod.of(method))
            sites.forEach { it.replace(copy) }
        }
        writeStub(SPOILERS, "spoilerSpan", 2, """
            instance-of v0, p0, ${site.span.definingClass}
            if-eqz v0, :hush_no
            check-cast p0, ${site.span.definingClass}
            invoke-virtual {p0}, ${site.span}
            move-result v0
            :hush_no
            return v0
        """)
        writeStub(SPOILERS, "stockMediaCovered", 1, """
            check-cast p0, $MESSAGE_OBJECT
            invoke-virtual {p0}, $HAS_MEDIA_SPOILERS
            move-result p0
            return p0
        """)
        writeStub(SPOILERS, "keptCovered", 2, """
            check-cast p0, $MESSAGE_OBJECT
            invoke-virtual {p0}, $BLURRED
            move-result v0
            if-nez v0, :hush_kept
            invoke-virtual {p0}, $SENSITIVE
            move-result v0
            :hush_kept
            return v0
        """)
        // Without its checks timedPreview keeps answering false, so the switch can do nothing.
        if (timed.missing == null) {
            writeStub(SPOILERS, "stockLoadsPhoto", 3, """
                check-cast p0, $DOWNLOADS
                check-cast p1, $MESSAGE_OBJECT
                invoke-virtual {p0, p1}, $CAN_DOWNLOAD
                move-result v0
                return v0
            """)
            writeStub(SPOILERS, "stockBlurred", 1, """
                check-cast p0, $MESSAGE_OBJECT
                invoke-virtual {p0}, $BLURRED
                move-result p0
                return p0
            """)
            writeStub(SPOILERS, "timedPreview", 2, """
                check-cast p0, $MESSAGE_OBJECT
                invoke-virtual {p0}, $BLURRED
                move-result v0
                if-eqz v0, :hush_no
                invoke-virtual {p0}, $PAID_PREVIEW
                move-result v0
                if-nez v0, :hush_kept
                invoke-virtual {p0}, $SENSITIVE
                move-result v0
                if-nez v0, :hush_kept
                const/4 v0, 0x1
                return v0
                :hush_kept
                const/4 v0, 0x0
                :hush_no
                return v0
            """)
        }
        site.insertText(site.textCovers)
        site.media.forEach { it.replace(it.method) }
        enableStatus("revealSpoilers")
        if (timed.missing == null) {
            timed.sites.forEach { it.replace(it.method) }
            enableCapability("revealTimedMedia")
        } else {
            patchLog.warning("Reveal spoilers: ${timed.missing}. The patch goes on without showing view-once and timed media unblurred.")
        }
        applyChatReveal()
    }
}

/** The chat's menu items and quotes opening on search hits, each recorded only when it went in. */
internal fun BytecodePatchContext.applyChatReveal() {
    val parts = insertChatReveal()
    if (parts.menu) enableCapability("chatRevealMenu")
    if (parts.searchHits) enableCapability("searchHitQuotes")
}

/** One media check at instruction [index] of [method], a place that draws a message, answered by the runtime's [asks]. */
internal class MediaSpoilerSite(
    val method: MutableMethod,
    val index: Int,
    private val asks: String = "mediaCovered",
    private val params: String = "Ljava/lang/Object;",
) {
    /** The same register, the message, goes to the extension instead. */
    fun replace(target: MutableMethod) {
        val call = target.getInstruction(index)
        val registers = call.namedRegisters()
        val hook = "$SPOILERS->$asks($params)Z"
        target.replaceInstruction(index, if (call.opcode == Opcode.INVOKE_VIRTUAL_RANGE) {
            "invoke-static/range {v${registers.first()} .. v${registers.last()}}, $hook"
        } else {
            "invoke-static {${registers.joinToString { "v$it" }}}, $hook"
        })
    }
}

/**
 * [textCovers] is SpoilerEffect's method that covers the spoiler spans of a piece of text, which
 * every text cover goes through, [span] is the span check it makes, and [media] are the media checks
 * of the places that draw a message.
 */
internal class RevealSpoilersSite(val textCovers: MutableMethod, val span: MethodReference, val media: List<MediaSpoilerSite>) {
    /** The view and the text go to the extension first, and an answer of true leaves the text uncovered. */
    fun insertText(target: MutableMethod) {
        target.requireLocals("Reveal spoilers", 2)
        target.addInstructionsWithLabels(0, """
            move-object/from16 v0, p0
            move-object/from16 v1, p4
            invoke-static {v0, v1}, $SPOILERS->skipTextCovers(Landroid/view/View;Landroid/text/Spanned;)Z
            move-result v0
            if-eqz v0, :hush_stock
            return-void
        """, ExternalLabel("hush_stock", target.getInstruction(0)))
    }
}

/**
 * Text: a message lays its text out in MessageObject.TextLayoutBlocks, which covers the spoilers,
 * unless they're revealed, through a SpoilerEffect method that hands the text to the one that does
 * the work. Every other text cover, in the chat list, replies, quotes and Instant View, calls one
 * of the two. Media: MessageObject.hasMediaSpoilers answers for the sender's spoiler, view-once
 * media and sensitive content alike, so the places that draw a message ask the extension, which
 * asks Telegram and then the view-once and sensitive checks again. Sending, retrying and
 * notifications keep asking Telegram, and no other class may put the answer in a message being sent.
 */
internal fun BytecodePatchContext.resolveRevealSpoilers(): RevealSpoilersSite {
    requireStatusMethod("revealSpoilers")
    controlHook(SPOILERS, "skipTextCovers", listOf("Landroid/view/View;", "Landroid/text/Spanned;"), "Z")
    controlHook(SPOILERS, "mediaCovered", listOf("Ljava/lang/Object;"), "Z")
    controlHook(SPOILERS, "spoilerSpan", listOf("Ljava/lang/Object;"), "Z")
    controlHook(SPOILERS, "stockMediaCovered", listOf("Ljava/lang/Object;"), "Z")
    controlHook(SPOILERS, "keptCovered", listOf("Ljava/lang/Object;"), "Z")
    requireStatusMethod("revealTimedMedia")
    controlHook(SPOILERS, "blurred", listOf("Ljava/lang/Object;"), "Z")
    controlHook(SPOILERS, "stockBlurred", listOf("Ljava/lang/Object;"), "Z")
    controlHook(SPOILERS, "timedPreview", listOf("Ljava/lang/Object;"), "Z")
    controlHook(SPOILERS, "loadsPhoto", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "Z")
    controlHook(SPOILERS, "stockLoadsPhoto", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "Z")

    // Text.
    val blocks = tgMutableClassDefByOrNull(TEXT_BLOCKS)
    controlShape(blocks != null, "MessageObject.TextLayoutBlocks is missing")
    val layout = blocks!!.methods.filter { it.origName == "<init>" && it.origParameterTypes.firstOrNull() == MESSAGE_OBJECT }
        .controlSingle("text layout constructor").controlBody()
    val revealed = layout.indexOfFirst { it.controlRef() == SPOILERS_REVEALED }
    controlShape(revealed >= 0, "the text layout no longer checks whether spoilers are revealed")
    val add = layout.drop(revealed).mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        .firstOrNull { it.origParameterTypes == ADD && it.origReturnType == "V" }
    controlShape(add != null, "the text layout no longer covers spoilers after checking")
    val effect = tgMutableClassDefByOrNull(add!!.definingClass)
    controlShape(effect != null && AccessFlags.PUBLIC.isSet(effect.accessFlags), "SpoilerEffect ${add.definingClass} is missing")
    val textCovers = effect!!.methods.filter { it.origParameterTypes == ADD_CORE && it.origReturnType == "V" }
        .controlSingle("SpoilerEffect's text cover")
    controlShape(AccessFlags.STATIC.isSet(textCovers.accessFlags), "SpoilerEffect's text cover is no longer static")
    val covers = textCovers.controlBody()
    val spanType = covers.mapNotNull { (it as? ReferenceInstruction)?.takeIf { i -> i.opcode == Opcode.CONST_CLASS }?.reference as? TypeReference }
        .controlSingle("span type the text cover looks for").type
    val span = covers.filter { it.opcode == Opcode.INVOKE_VIRTUAL }.mapNotNull { (it as ReferenceInstruction).reference as? MethodReference }
        .filter { it.origDefiningClass == spanType }.controlSingle("spoiler check the text cover makes")
    controlShape(span.parameterTypes.isEmpty() && span.origReturnType == "Z", "the text cover's span check isn't a yes or no")
    val spanClass = tgMutableClassDefByOrNull(spanType)
    val spanMethod = spanClass?.methods?.singleOrNull { it.origName == span.origName && it.parameterTypes.isEmpty() && it.origReturnType == "Z" }
    controlShape(spanClass != null && AccessFlags.PUBLIC.isSet(spanClass.accessFlags) && spanMethod != null &&
        AccessFlags.PUBLIC.isSet(spanMethod.accessFlags) && !AccessFlags.STATIC.isSet(spanMethod.accessFlags),
        "the spoiler span check isn't public")
    val handsOver = effect.methods.singleOrNull { key(it) == add.origString() }
    controlShape(handsOver != null && handsOver.controlBody().any { it.controlRef() == key(textCovers) },
        "SpoilerEffect's spoiler cover no longer does its work in one place")

    // Media.
    val message = tgMutableClassDefByOrNull(MESSAGE_OBJECT)
    controlShape(message != null, "MessageObject is missing")
    val check = message!!.methods.filter { key(it) == HAS_MEDIA_SPOILERS }.controlSingle("media spoiler check")
    controlShape(AccessFlags.PUBLIC.isSet(check.accessFlags) && !AccessFlags.STATIC.isSet(check.accessFlags), "the media spoiler check isn't public")
    controlShape(check.controlBody().mapNotNull { it.controlRef() }.toSet() == MEDIA_CHECK,
        "the media spoiler check reads something new, which may be a cover that has to stay")
    for (kept in listOf(BLURRED, SENSITIVE)) {
        val method = message.methods.singleOrNull { key(it) == kept }
        controlShape(method != null && AccessFlags.PUBLIC.isSet(method.accessFlags) && !AccessFlags.STATIC.isSet(method.accessFlags),
            "${kept.substringAfter("->")} isn't a public MessageObject method")
    }

    val found = mutableListOf<Triple<String, String, Int>>()
    forEachClassMentioning(Mention.reference(SEND_SPOILER) or Mention.reference(HAS_MEDIA_SPOILERS)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/") || cls.origType == MESSAGE_OBJECT) return@forEachClassMentioning
        val outgoing = cls.origType in ASKS_TELEGRAM || cls.origType == SEND_PARAMS
        cls.methods.forEach { method ->
            method.controlBody().forEachIndexed { index, instruction ->
                val ref = instruction.controlRef()
                if (ref == SEND_SPOILER && instruction.opcode == Opcode.IPUT_BOOLEAN) {
                    controlShape(outgoing, "${cls.type} puts a media spoiler in a message being sent")
                }
                if (ref == HAS_MEDIA_SPOILERS && !outgoing) found += Triple(cls.type, signature(method), index)
            }
        }
    }
    controlShape(found.isNotEmpty(), "nothing draws media spoilers any more")
    val media = found.map { (type, signature, index) ->
        val method = tgMutableClassDefBy(type).methods.single { signature(it) == signature }
        val body = method.controlBody()
        controlShape(body[index].opcode in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE) && body.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT,
            "$type no longer reads the media spoiler answer in ${method.name}")
        MediaSpoilerSite(method, index)
    }
    return RevealSpoilersSite(textCovers, span, media)
}

/** The chat bubble's checks that keep view-once and timed media blurred, or why this build has none. */
internal class TimedBlurPlan(val missing: String?, val sites: List<MediaSpoilerSite>)

/**
 * The chat bubble decides on the dark blur with three needDrawBluredPreview checks in a row, and a
 * fourth tells its image to stay on the thumbnail. A photo also only loads in full when it's on the
 * device or the download rules allow it, which they don't for timed media, so that check is answered
 * too. Only these go to the runtime: needDrawBluredPreview also makes a tap open the timed viewer,
 * which refuses a message it answers false for.
 */
internal fun BytecodePatchContext.resolveTimedBlur(): TimedBlurPlan {
    fun missing(why: String) = TimedBlurPlan(why, emptyList())
    val paid = tgMutableClassDefByOrNull(MESSAGE_OBJECT)?.methods?.singleOrNull { key(it) == PAID_PREVIEW }
    if (paid == null || !AccessFlags.PUBLIC.isSet(paid.accessFlags) || AccessFlags.STATIC.isSet(paid.accessFlags)) {
        return missing("the paid media check isn't a public MessageObject method")
    }
    val found = classDefsMentioning(Mention.reference(BLURRED)).flatMap { cls ->
        cls.methods.mapNotNull { method -> method.timedBlurIndexes()?.let { method to it } }
    }
    val (method, indexes) = found.singleOrNull() ?: return missing("the chat bubble's blur check moved (found ${found.size})")
    val gate = method.fullPhotoGate() ?: return missing("the chat bubble's full photo check moved")
    val target = tgMutableClassDefBy(method.definingClass).methods.single { it.toString() == method.toString() }
    return TimedBlurPlan(null, listOf(MediaSpoilerSite(target, gate, "loadsPhoto", "Ljava/lang/Object;Ljava/lang/Object;")) +
        indexes.map { MediaSpoilerSite(target, it, "blurred") })
}

/**
 * Two checks jump straight to getFancyBlurFilter when the answer is true, one in front of them leads
 * to the first, and one goes straight into ImageReceiver.setForcePreview. Their indexes, the leading
 * one first and the preview last, or null when this isn't that method.
 */
private fun Method.timedBlurIndexes(): List<Int>? {
    val code = controlBody()
    fun asks(at: Int) = code[at].opcode in ASKS_BLURRED && code[at].controlRef() == BLURRED && code.getOrNull(at + 1)?.opcode == Opcode.MOVE_RESULT
    fun tests(at: Int, opcode: Opcode): Boolean {
        val test = code.getOrNull(at + 2) ?: return false
        return test.opcode == opcode && (test as OneRegisterInstruction).registerA == (code[at + 1] as OneRegisterInstruction).registerA
    }
    val checks = code.indices.filter(::asks)
    if (checks.size < 3) return null
    val guards = checks.filter { at -> tests(at, Opcode.IF_NEZ) && code.landingOf(at + 2)?.let { code[it].picksBlurFilter() } == true }
    if (guards.size != 2) return null
    val leads = (checks - guards.toSet()).filter { at ->
        tests(at, Opcode.IF_NEZ) && code.landingOf(at + 2) == guards[0] ||
            tests(at, Opcode.IF_EQZ) && code.getOrNull(at + 3)?.opcode in JUMPS && code.landingOf(at + 3) == guards[0]
    }
    val preview = checks.singleOrNull { at ->
        code.getOrNull(at + 2)?.controlRef() == FORCE_PREVIEW &&
            code[at + 2].namedRegisters().last() == (code[at + 1] as OneRegisterInstruction).registerA
    } ?: return null
    return listOf(leads.singleOrNull() ?: return null) + guards + preview
}

/** The download check of the plain photo branch: after the check for the file, before the one for a running download. */
private fun Method.fullPhotoGate(): Int? {
    val code = controlBody()
    return code.indices.filter { at ->
        code[at].controlRef() == CAN_DOWNLOAD && code.getOrNull(at + 1)?.opcode == Opcode.MOVE_RESULT &&
            (maxOf(0, at - 12) until at).any { code[it].controlRef() == MEDIA_EXISTS && code[it + 1].opcode == Opcode.IF_NEZ } &&
            (at + 2..minOf(at + 12, code.lastIndex)).any { code[it].controlRef() == IS_LOADING }
    }.singleOrNull()
}

private fun Instruction.picksBlurFilter() = call()?.let {
    it.name == "getFancyBlurFilter" && it.parameterTypes.isEmpty() && it.returnType == "Landroid/graphics/ColorMatrixColorFilter;"
} == true

private fun signature(method: Method) = "${method.origName}${method.origDescriptor}"
private fun key(method: Method) = "${method.origDefiningClass}->${signature(method)}"
