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
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * AndroidX's CarExtender.extend, the one place a message notification's Android Auto bundle is written. Messenger
 * still fills only that old car bundle: the chat, the messages, a reply and a mark-as-read intent. Android Auto reads
 * a notification through its MessagingStyle path only when one of the actions is a mark-as-read action, and Messenger
 * has none, so Auto falls back to the old bundle (#75).
 */
internal const val CAR_MESSAGES = "car_messages"

/** NotificationCompat.CarExtender's keys: the bundle in the notification's extras and the chat inside it. */
internal const val CAR_EXTENSIONS = "android.car.EXTENSIONS"
internal const val CAR_CONVERSATION = "car_conversation"
internal const val CAR_MESSAGES_CALL = "Lapp/hushmessenger/extension/CarMessages;->markRead(Landroid/os/Bundle;)V"

private const val PUT_BUNDLE = "Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V"

private fun carMessagesChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the Android Auto car extender changed ($detail)")

private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

/** The car bundle's register when this stores it in the extras under android.car.EXTENSIONS loaded right before. */
private fun List<Instruction>.carBundleStored(index: Int): Int? {
    val put = this[index] as? FiveRegisterInstruction ?: return null
    if (put.opcode != Opcode.INVOKE_VIRTUAL || put.registerCount != 3) return null
    if (((put as ReferenceInstruction).reference as? MethodReference)?.toString() != PUT_BUNDLE) return null
    val key = getOrNull(index - 1) ?: return null
    if (key.string() != CAR_EXTENSIONS || (key as OneRegisterInstruction).registerA != put.registerD) return null
    return put.registerE
}

/** Where the call goes, right before the extender returns, and the register that still holds the car bundle there. */
internal class CarExtend(val index: Int, val car: Int)

/**
 * The extender's own extend: an instance method taking the builder, which writes the chat under car_conversation and
 * then stores the car bundle in the extras as its last step before return-void. Nothing jumps to that return, so every
 * way out passes the call. Null when the method isn't the extender or the shape changed.
 */
internal fun Method.carExtend(): CarExtend? {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "V" || parameterTypes.size != 1) return null
    val code = implementation?.instructions?.toList() ?: return null
    if (code.count { it.string() == CAR_CONVERSATION } != 1) return null
    val stored = code.indices.filter { code.carBundleStored(it) != null }.singleOrNull() ?: return null
    if (code.getOrNull(stored + 1)?.opcode != Opcode.RETURN_VOID || stored + 1 in jumpTargets()) return null
    return CarExtend(stored + 1, code.carBundleStored(stored)!!)
}

/** The app's only method that writes both car_conversation and android.car.EXTENSIONS, when it has that shape. */
internal fun findCarMessages(classes: Iterable<ClassDef>): List<Method> {
    val writers = classes.flatMap { cls ->
        cls.methods.filter { method ->
            val strings = method.implementation?.instructions?.mapNotNull { it.string() }.orEmpty()
            CAR_CONVERSATION in strings && CAR_EXTENSIONS in strings
        }
    }
    val writer = writers.singleOrNull() ?: return emptyList()
    return if (writer.carExtend() != null) listOf(writer) else emptyList()
}

internal fun MutableMethod.validateCarMessages(): CarExtend = carExtend() ?: carMessagesChanged("no car bundle store in ${hookId()}")

/**
 * Once the car bundle is in the extras, the extension adds Messenger's own mark-as-read intent from it as an invisible
 * mark-as-read action, the way NotificationCompat writes one. Android Auto then reads the notification through its
 * MessagingStyle path, with Messenger's visible Reply as the reply. Off, Pause and safe mode leave the bundle as it was.
 */
internal fun MutableMethod.injectCarMessages() {
    val extend = validateCarMessages()
    addInstructions(extend.index, "invoke-static/range {v${extend.car} .. v${extend.car}}, $CAR_MESSAGES_CALL")
}
