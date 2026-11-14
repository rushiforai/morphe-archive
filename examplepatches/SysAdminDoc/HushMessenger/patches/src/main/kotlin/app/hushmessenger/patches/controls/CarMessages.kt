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
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
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

/**
 * The message notification builds its car extender only when a server flag says so, right before it logs
 * add_android_auto_extension. Accounts with the flag off never get a car bundle, so the extender's hook above never runs
 * for them and Android Auto shows nothing (#75 again on 586). The flag is as 587 numbers it (586 read 0x0081027700011858).
 */
internal const val CAR_EXTENSION_GATE = "car_extension_gate"
internal const val CAR_EXTENSION_FLAG = 0x0081027600011849L
internal const val CAR_EXTENSION_STEP = "add_android_auto_extension"
internal const val CAR_EXTENSION_CALL = "Lapp/hushmessenger/extension/CarMessages;->carExtension(Z)Z"

private const val CAR_MOBILE_CONFIG = "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;"

/** Where the flag's answer lands: the move-result right before the branch that skips the car extender, and its register. */
internal class CarGate(val index: Int, val flag: Int)

/**
 * const-wide the flag's id, the config's (J)Z read, move-result, then if-eqz on that result straight over the
 * add_android_auto_extension step. 587 reads it through a static (Object, long)Z helper right after the id; 586
 * cast the config and called its getter. Nothing may jump to the branch, since the answer is rewritten between the
 * move-result and it. Null when the method isn't the gate or the shape changed.
 */
internal fun Method.carExtensionGate(): CarGate? {
    val code = implementation?.instructions?.toList() ?: return null
    val carExtensionStep = StringMatch(CAR_EXTENSION_STEP)
    val step = code.indices.filter { carExtensionStep.matches((code[it] as? ReferenceInstruction)?.reference) }.singleOrNull()
    if (step == null || step < 5) return null
    val branch = code[step - 1] as? OneRegisterInstruction ?: return null
    val result = code[step - 2] as? OneRegisterInstruction ?: return null
    val read = code[step - 3] as? FiveRegisterInstruction ?: return null
    if (code[step - 1].opcode != Opcode.IF_EQZ || code[step - 2].opcode != Opcode.MOVE_RESULT || branch.registerA != result.registerA) return null
    val getter = (read as ReferenceInstruction).reference as? MethodReference ?: return null
    if (read.registerCount != 3 || getter.returnType != "Z") return null
    val helper = code[step - 3].opcode == Opcode.INVOKE_STATIC && getter.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;", "J")
    val config = code[step - 3].opcode == Opcode.INVOKE_INTERFACE && getter.definingClass == CAR_MOBILE_CONFIG &&
        getter.parameterTypes.map { it.toString() } == listOf("J") && code[step - 4].opcode == Opcode.CHECK_CAST
    if (!helper && !config) return null
    val id = code[if (helper) step - 4 else step - 5]
    if (id.opcode != Opcode.CONST_WIDE || (id as WideLiteralInstruction).wideLiteral != CAR_EXTENSION_FLAG || (id as OneRegisterInstruction).registerA != read.registerD) return null
    if (step - 1 in jumpTargets() || result.registerA > 0xff) return null
    return CarGate(step - 2, result.registerA)
}

/** The app's only method that logs add_android_auto_extension, when its flag check has that shape. */
internal fun findCarExtensionGate(classes: Iterable<ClassDef>): List<Method> {
    val carExtensionStep = StringMatch(CAR_EXTENSION_STEP)
    val steps = classes.flatMap { cls ->
        cls.methods.filter { method ->
            method.implementation?.instructions?.any { carExtensionStep.matches((it as? ReferenceInstruction)?.reference) } == true
        }
    }
    val gate = steps.singleOrNull() ?: return emptyList()
    return if (gate.carExtensionGate() != null) listOf(gate) else emptyList()
}

internal fun MutableMethod.validateCarExtensionGate(): CarGate =
    carExtensionGate() ?: carMessagesChanged("no Android Auto flag check in ${hookId()}")

/** The flag's answer goes through the extension, which says yes while the switch is on and passes it along otherwise. */
internal fun MutableMethod.injectCarExtensionGate() {
    val gate = validateCarExtensionGate()
    addInstructions(gate.index + 1, """
        invoke-static/range {v${gate.flag} .. v${gate.flag}}, $CAR_EXTENSION_CALL
        move-result v${gate.flag}
    """.trimIndent())
}
