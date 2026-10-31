package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val INSTANTS_BUTTON = "instants_button"

/**
 * The two events the chat list logs when it attaches the Instants button: once before it inflates the button's view,
 * once after, with whether a view was already there. Messenger calls the button a "corner peek", since it slides in at
 * the bottom right corner of the chat list, and it keeps both names on every build.
 */
internal const val CORNER_PEEK_ATTACH = "qs_corner_peek_attach"
internal const val CORNER_PEEK_ATTACHED = "qs_corner_peek_attached"

private fun Method.strings() = implementation?.instructions
    ?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }?.toSet().orEmpty()

/**
 * The step that attaches the Instants button to the chat list: static and void, handed the chat list fragment it's
 * declared on, it inflates the button's view from its stub, builds the controller that slides it in and out with the
 * list, and logs both events. The fragment's layout pass, its scroll listener and its resume coroutine all go through
 * it, and none of them logs the events itself, so the events pick out the one method.
 */
internal fun Method.isInstantsButtonAttach(): Boolean {
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "V") return false
    if (parameterTypes.size != 1 || parameterTypes.single().toString() != definingClass) return false
    val strings = strings()
    return CORNER_PEEK_ATTACH in strings && CORNER_PEEK_ATTACHED in strings
}

/** The view that holds the chat-head stack, which the Instants button under the heads joins. */
internal const val CHAT_HEADS_FULL_VIEW = "Lcom/facebook/messaging/chatheads/view/stacks/ChatHeadsFullView;"

/** The surface name the chat heads log the Instants button's impression under. */
internal const val QUICKSNAP = "quicksnap"

/**
 * The step that adds the Instants button under the chat-head stack: static and void, handed the chat-head controller
 * it's declared on, it gives up unless the stack's full view is there, builds the button with its count of unseen
 * Instants, adds it to the stack and logs the impression as "quicksnap". The chat-head service's Instants listener and
 * the controller's refresh both go through it, and neither logs the impression itself.
 */
internal fun Method.isChatHeadInstantsButton(): Boolean {
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "V") return false
    if (parameterTypes.size != 1 || parameterTypes.single().toString() != definingClass) return false
    val code = implementation?.instructions ?: return false
    return QUICKSNAP in strings() &&
        code.any { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.type == CHAT_HEADS_FULL_VIEW }
}

internal fun findInstantsButton(classes: Iterable<ClassDef>): List<Method> =
    classes.flatMap { it.methods }.filter { it.isInstantsButtonAttach() || it.isChatHeadInstantsButton() }

internal fun MutableMethod.validateInstantsButton() {
    if (!isInstantsButtonAttach() && !isChatHeadInstantsButton()) {
        throw PatchException("Messenger controls: ${hookId()} isn't a step that adds an Instants button")
    }
    validateSwitch()
}

/**
 * While the switch is on both steps return before they build anything, so neither the chat list nor the chat heads show
 * an Instants button. Every later call returns the same way, since the chat list keeps asking until a button is attached
 * and the chat heads ask again each time the count of unseen Instants changes. Off, Pause and safe mode run Messenger's
 * own steps, buttons and all.
 */
internal fun MutableMethod.injectInstantsButton() {
    validateInstantsButton()
    injectSwitch("$SETTINGS->hideInstantsButton()Z", "0x0")
}
