package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue

/**
 * A photo pasted into a chat goes into the chat's tray above the message box instead of straight out (#180). Messenger
 * hands a pasted photo to the keyboard's own content route, which sends it as it is: no preview, no caption, no HD, and
 * the server decides on its own whether it goes as a photo or as a sticker. The paste now takes the same route a pick
 * from the gallery takes, so the photo waits in the chat with its full size and Send is the person's to tap.
 */
internal const val PASTE_PHOTO = "paste_photo"

private const val TEXT_INPUT_VIEW = "Lcom/facebook/primitive/textinput/TextInputView;"
private const val INPUT_CONNECTION =
    "onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;"
private const val CONTENT_INFO = "Landroid/view/ContentInfo;"
private const val CLIP_DATA = "Landroid/content/ClipData;"
private const val PASTE = "Lapp/hushmessenger/extension/PastePhoto;"
internal const val PASTED_PHOTO_CALL = "$PASTE->pasted(Landroid/view/View;$CLIP_DATA)Z"
internal const val PASTE_CHAT_CALL = "$PASTE->chatShown(Ljava/lang/Object;Landroid/view/View;)V"
private const val CHAT_RESULT = "onActivityResult(IILandroid/content/Intent;)V"

/**
 * How a pasted photo reaches the chat, read at discovery: the listener the text input hands pasted content to, the
 * payload's clip inside it, the chat fragment's own view handover, and the result handler the extension hands the photo
 * to as if the gallery had just come back.
 */
internal data class PasteRoute(val listener: String, val clipField: String, val clipGetter: String, val chat: String,
    val result: String)

/** Set by [findPastePhoto] and cleared once the controls are in. */
internal var pasteRoute: PasteRoute? = null

private fun pasteChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the paste route moved ($detail)")

/** The listener's own method: one non-static (View, payload) -> payload, the way the content route declares it. */
private fun ClassDef.pasteListener(): Method? = methods.singleOrNull { method ->
    !AccessFlags.STATIC.isSet(method.accessFlags) && method.name != "<init>" &&
        method.parameterTypes.map { it.toString() }.let { it.size == 2 && it[0] == "Landroid/view/View;" && it[1] == method.returnType } &&
        method.implementation != null
}

/**
 * The payload type androidx wraps pasted content in: its own static maker from the platform's content, and the instance
 * method that hands the platform's back. Neither name survives Redex, so both are matched by shape.
 */
private fun ClassDef.isPastePayload(): Boolean =
    methods.any { AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == type &&
        it.parameterTypes.map { p -> p.toString() } == listOf(CONTENT_INFO) } &&
        methods.any { !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == CONTENT_INFO && it.parameterTypes.isEmpty() }

/** The clip read the listener opens with: the payload's own field and the interface call on it that hands back the clip. */
private fun Method.pasteClipRead(payload: String): Pair<FieldReference, String>? {
    val code = implementation?.instructions?.toList() ?: return null
    val register = parameterRegister(2)
    for (i in 0 until code.size - 1) {
        if (code[i].opcode != Opcode.IGET_OBJECT || (code[i] as TwoRegisterInstruction).registerB != register) continue
        val field = code[i].galleryField() ?: continue
        if (field.definingClass != payload) continue
        val got = (code[i] as TwoRegisterInstruction).registerA
        val call = code[i + 1]
        val getter = call.galleryMethod() ?: continue
        if (call.opcode != Opcode.INVOKE_INTERFACE || (call as FiveRegisterInstruction).registerCount != 1 ||
            call.registerC != got || getter.definingClass != field.type || getter.parameterTypes.isNotEmpty() ||
            getter.returnType != CLIP_DATA) continue
        return field to getter.toString()
    }
    return null
}

/** The listener's hook fits when it has a local for the clip and nothing reads that local before the hook writes it. */
private fun Method.pasteHooked(): Boolean {
    val code = implementation?.instructions?.toList() ?: return false
    // The hook reads the clip into the lowest local, hands the view and the clip over, and the invokes reach both.
    return parameterRegister(0) >= 1 && parameterRegister(2) <= 15 && code.galleryReach(0) != null && code.galleryFree(0, 0)
}

/**
 * The chat fragment's own result handler, the one the extension hands the pasted photo to. It counts only when its body
 * makes the composer's activity result event out of the result it was handed, which is what the photo goes in as.
 */
private fun ClassDef.pasteResult(): Method? = methods.singleOrNull { method ->
    method.hookId() == "$type->$CHAT_RESULT" && method.implementation?.instructions?.any { instruction ->
        instruction.opcode == Opcode.INVOKE_STATIC && instruction.galleryMethod()?.let { maker ->
            maker.returnType == ACTIVITY_RESULT_EVENT &&
                maker.parameterTypes.map { it.toString() } == listOf("Landroid/content/Intent;", "I", "I")
        } == true
    } == true
}

/**
 * The listener the chat's text input hands pasted content to, and the chat fragment's view handover, or none. The text
 * input builds the listener itself, so the listener is whichever class it makes that the content route's shape fits: a
 * weak reference to the view it was built for, and one method taking a view and androidx's payload. The route also needs
 * the chat fragment the pasted photo goes to, with the result handler the extension hands it to and the clip read the
 * hook takes the pasted photo from.
 */
internal fun findPastePhoto(classes: Iterable<ClassDef>): List<Method> {
    pasteRoute = null
    val all = classes.toList()
    val byType = all.associateBy { it.type }
    val input = byType[TEXT_INPUT_VIEW] ?: return emptyList()
    val create = input.methods.singleOrNull { it.hookId() == "$TEXT_INPUT_VIEW->$INPUT_CONNECTION" } ?: return emptyList()
    val body = create.implementation ?: return emptyList()
    val built = body.instructions.filter { it.opcode == Opcode.NEW_INSTANCE }
        .mapNotNull { it.galleryType() }.distinct().mapNotNull { byType[it] }
    val listeners = built.mapNotNull { cls ->
        if (cls.interfaces.size != 1 || cls.fields.singleOrNull()?.type != "Ljava/lang/ref/WeakReference;") return@mapNotNull null
        if (cls.methods.none { it.name == "<init>" && it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/ref/WeakReference;") }) {
            return@mapNotNull null
        }
        val listener = cls.pasteListener() ?: return@mapNotNull null
        val payload = byType[listener.returnType] ?: return@mapNotNull null
        if (!payload.isPastePayload()) return@mapNotNull null
        // A listener the hook can't take is no listener at all, so a changed build finds none instead of a hookless one.
        val read = listener.pasteClipRead(payload.type) ?: return@mapNotNull null
        if (!listener.pasteHooked()) return@mapNotNull null
        Triple(listener, read.first, read.second)
    }
    val (listener, clipField, clipGetter) = listeners.singleOrNull() ?: return emptyList()
    val chats = all.filter { cls ->
        (cls.fields.firstOrNull { it.name == "__redex_internal_original_name" }?.initialValue as? StringEncodedValue)
            ?.value == CHAT_FRAGMENT_NAME
    }
    val chat = chats.singleOrNull() ?: return emptyList()
    val view = chat.methods.singleOrNull { it.isChatJumpView() } ?: return emptyList()
    val result = chat.pasteResult() ?: return emptyList()
    pasteRoute = PasteRoute(listener.hookId(), clipField.toString(), clipGetter, view.hookId(), result.hookId())
    return listOf(listener, view)
}

internal fun MutableMethod.validatePastePhoto() {
    val route = pasteRoute ?: pasteChanged("no route")
    when (hookId()) {
        route.listener -> if (!pasteHooked()) pasteChanged("the pasted content listener's registers")
        route.chat -> validateChatJump()
        else -> throw PatchException("Messenger controls: unexpected paste hook ${hookId()}")
    }
}

/**
 * The chat fragment hands the extension itself and its view, and the listener asks the extension about every paste
 * before Messenger reads it. A photo the extension takes leaves the listener with nothing to send, since the extension
 * has already handed it to that chat's own result handler. Everything else, text and a paste with the switch off
 * included, gets Messenger's own handling.
 */
internal fun MutableMethod.injectPastePhoto() {
    validatePastePhoto()
    val route = pasteRoute!!
    if (hookId() == route.chat) {
        addInstructions(0, "invoke-static/range {p0 .. p1}, $PASTE_CHAT_CALL")
        return
    }
    addInstructionsWithLabels(0, """
        iget-object v0, p2, ${route.clipField}
        invoke-interface {v0}, ${route.clipGetter}
        move-result-object v0
        invoke-static {p1, v0}, $PASTED_PHOTO_CALL
        move-result v0
        if-eqz v0, :stock_paste
        const/4 v0, 0x0
        return-object v0
    """.trimIndent(), ExternalLabel("stock_paste", getInstruction(0)))
}
