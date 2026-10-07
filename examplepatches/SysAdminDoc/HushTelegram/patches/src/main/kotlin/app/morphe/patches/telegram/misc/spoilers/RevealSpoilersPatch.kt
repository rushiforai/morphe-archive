/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.spoilers

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireLocals
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val SPOILERS = "$EXTENSION_PACKAGE/misc/Spoilers;"
internal const val MESSAGE_OBJECT = "Lorg/telegram/messenger/MessageObject;"
internal const val HAS_MEDIA_SPOILERS = "$MESSAGE_OBJECT->hasMediaSpoilers()Z"
private const val TEXT_BLOCKS = "Lorg/telegram/messenger/MessageObject\$TextLayoutBlocks;"
private const val SPOILERS_REVEALED = "$MESSAGE_OBJECT->isSpoilersRevealed:Z"
private const val SEND_PARAMS = "Lorg/telegram/messenger/SendMessagesHelper\$SendMessageParams;"
private const val SEND_SPOILER = "$SEND_PARAMS->hasMediaSpoilers:Z"
private const val BLURRED = "$MESSAGE_OBJECT->needDrawBluredPreview()Z"
private const val SENSITIVE = "$MESSAGE_OBJECT->isHiddenSensitive()Z"
private val ADD = listOf("Landroid/view/View;", "Landroid/text/Layout;", "I", "I", "Ljava/util/Stack;", "Ljava/util/List;")
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
    description = "Adds a switch, off by default, that shows spoiler text, photos and videos without the cover. View-once media, sensitive content and login codes stay covered.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveRevealSpoilers()
        // Assembled on copies first, so a refusal leaves the app untouched.
        site.insertText(MutableMethod(ImmutableMethod.of(site.textCovers)))
        site.media.groupBy { it.method }.forEach { (method, sites) ->
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
        site.insertText(site.textCovers)
        site.media.forEach { it.replace(it.method) }
        enableStatus("revealSpoilers")
    }
}

/** One media check at instruction [index] of [method], a place that draws a message. */
internal class MediaSpoilerSite(val method: MutableMethod, val index: Int) {
    /** The same register, the message, goes to the extension instead. */
    fun replace(target: MutableMethod) {
        val call = target.getInstruction(index)
        val registers = call.namedRegisters()
        val hook = "$SPOILERS->mediaCovered(Ljava/lang/Object;)Z"
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

    // Text.
    val blocks = mutableClassDefByOrNull(TEXT_BLOCKS)
    controlShape(blocks != null, "MessageObject.TextLayoutBlocks is missing")
    val layout = blocks!!.methods.filter { it.name == "<init>" && it.parameterTypes.firstOrNull()?.toString() == MESSAGE_OBJECT }
        .controlSingle("text layout constructor").controlBody()
    val revealed = layout.indexOfFirst { it.controlRef() == SPOILERS_REVEALED }
    controlShape(revealed >= 0, "the text layout no longer checks whether spoilers are revealed")
    val add = layout.drop(revealed).mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        .firstOrNull { it.parameterTypes.map(CharSequence::toString) == ADD && it.returnType == "V" }
    controlShape(add != null, "the text layout no longer covers spoilers after checking")
    val effect = mutableClassDefByOrNull(add!!.definingClass)
    controlShape(effect != null && AccessFlags.PUBLIC.isSet(effect.accessFlags), "SpoilerEffect ${add.definingClass} is missing")
    val textCovers = effect!!.methods.filter { it.parameterTypes.map(CharSequence::toString) == ADD_CORE && it.returnType == "V" }
        .controlSingle("SpoilerEffect's text cover")
    controlShape(AccessFlags.STATIC.isSet(textCovers.accessFlags), "SpoilerEffect's text cover is no longer static")
    val covers = textCovers.controlBody()
    val spanType = covers.mapNotNull { (it as? ReferenceInstruction)?.takeIf { i -> i.opcode == Opcode.CONST_CLASS }?.reference as? TypeReference }
        .controlSingle("span type the text cover looks for").type
    val span = covers.filter { it.opcode == Opcode.INVOKE_VIRTUAL }.mapNotNull { (it as ReferenceInstruction).reference as? MethodReference }
        .filter { it.definingClass == spanType }.controlSingle("spoiler check the text cover makes")
    controlShape(span.parameterTypes.isEmpty() && span.returnType == "Z", "the text cover's span check isn't a yes or no")
    val spanClass = mutableClassDefByOrNull(spanType)
    val spanMethod = spanClass?.methods?.singleOrNull { it.name == span.name && it.parameterTypes.isEmpty() && it.returnType == "Z" }
    controlShape(spanClass != null && AccessFlags.PUBLIC.isSet(spanClass.accessFlags) && spanMethod != null &&
        AccessFlags.PUBLIC.isSet(spanMethod.accessFlags) && !AccessFlags.STATIC.isSet(spanMethod.accessFlags),
        "the spoiler span check isn't public")
    val handsOver = effect.methods.singleOrNull { key(it) == add.toString() }
    controlShape(handsOver != null && handsOver.controlBody().any { it.controlRef() == key(textCovers) },
        "SpoilerEffect's spoiler cover no longer does its work in one place")

    // Media.
    val message = mutableClassDefByOrNull(MESSAGE_OBJECT)
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
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/") || cls.type == MESSAGE_OBJECT) return@classDefForEach
        val outgoing = cls.type in ASKS_TELEGRAM || cls.type == SEND_PARAMS
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
        val method = mutableClassDefBy(type).methods.single { signature(it) == signature }
        val body = method.controlBody()
        controlShape(body[index].opcode in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE) && body.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT,
            "$type no longer reads the media spoiler answer in ${method.name}")
        MediaSpoilerSite(method, index)
    }
    return RevealSpoilersSite(textCovers, span, media)
}

private fun signature(method: Method) = "${method.name}${method.parameterTypes.joinToString("", "(", ")")}${method.returnType}"
private fun key(method: Method) = "${method.definingClass}->${signature(method)}"
