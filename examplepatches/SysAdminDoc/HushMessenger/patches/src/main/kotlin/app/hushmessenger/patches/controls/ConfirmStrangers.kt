package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * #207: Ask before messaging people you don't know. The compose fragment's send is where a tap on Send and the
 * keyboard's Enter both start, for typed words and for the photos and videos waiting in the composer. A gate at its
 * top hands the extension the fragment's chat view parameters, which hold the thread key, the other person and the
 * messages loaded so far. When the extension holds the send it returns there, before the send reads the composer, so
 * the words stay in the box and nothing is marked or logged. Otherwise the send runs as Messenger wrote it.
 */
internal const val CONFIRM_STRANGERS = "confirm_strangers"

/** The extension method the gate calls, with the chat view parameters as an Object. */
internal const val STRANGER_SEND_CALL = "Lapp/hushmessenger/extension/StrangerSend;->holdStrangerSend(Ljava/lang/Object;)Z"

/** The trace mark the compose fragment's send sets as its very first step. */
private const val STRANGER_SEND_MARK = "ComposeFragment.onSendClicked"

private const val STRANGER_USER = "Lcom/facebook/user/model/User;"

private const val STRANGER_MESSAGES = "Lcom/facebook/messaging/model/messages/MessagesCollection;"

/** Where the gate goes: the register it borrows, the fragment's own register, and the field holding the chat view's parameters. */
internal class ConfirmStrangersSite(val scratch: Int, val fragment: Int, val params: FieldReference)

private fun Instruction.strangerField() = (this as? ReferenceInstruction)?.reference as? FieldReference

/**
 * The compose fragment's send, as every 588 build writes it:
 *
 *     const-string v1, "ComposeFragment.onSendClicked"     (first, and nothing branches onto it)
 *     ...
 *     iget-object vP, p0, Fragment->params:Params
 *     if-eqz vP, :no_thread
 *     iget-object vK, vP, Params->key:ThreadKey
 *
 * Static and void, handed the fragment it's declared on. The register the trace mark loads is about to be written, so
 * the gate borrows it. The parameters field is the one the send reads its thread key from, straight off the fragment.
 */
internal fun Method.confirmStrangersSite(): ConfirmStrangersSite? {
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "V") return null
    if (parameterTypes.map { it.toString() } != listOf(definingClass)) return null
    val implementation = implementation ?: return null
    val code = implementation.instructions.toList()
    val mark = code.firstOrNull() ?: return null
    if (mark.opcode != Opcode.CONST_STRING || ((mark as ReferenceInstruction).reference as? StringReference)?.string != STRANGER_SEND_MARK) return null
    val fragment = implementation.registerCount - 1
    val scratch = (mark as OneRegisterInstruction).registerA
    // The gate uses the four-bit forms for its scratch register, and must leave the fragment's register alone.
    if (scratch > 15 || scratch == fragment) return null
    if (0 in jumpTargets()) return null
    val params = code.indices.mapNotNull { at ->
        val read = code[at]
        val field = read.strangerField() ?: return@mapNotNull null
        if (read.opcode != Opcode.IGET_OBJECT || field.definingClass != definingClass || !field.type.startsWith("L")) return@mapNotNull null
        if ((read as TwoRegisterInstruction).registerB != fragment) return@mapNotNull null
        val holder = read.registerA
        val keyRead = (at + 1..minOf(at + 2, code.lastIndex)).map { code[it] }.firstOrNull { next ->
            val key = next.strangerField()
            next.opcode == Opcode.IGET_OBJECT && key?.type == THREAD_KEY_TYPE && key.definingClass == field.type &&
                (next as TwoRegisterInstruction).registerB == holder
        }
        field.takeIf { keyRead != null }
    }.distinctBy { "${it.definingClass}->${it.name}:${it.type}" }.singleOrNull() ?: return null
    return ConfirmStrangersSite(scratch, fragment, params)
}

/** Whether the gate is already in: the send calls the extension's check. */
internal fun Method.hasConfirmStrangersGate() = implementation?.instructions?.any {
    it.opcode == Opcode.INVOKE_STATIC && ((it as ReferenceInstruction).reference as? MethodReference)?.let { called ->
        "${called.definingClass}->${called.name}(${called.parameterTypes.joinToString("")})${called.returnType}"
    } == STRANGER_SEND_CALL
} == true

/** Whether the chat view's parameters carry what the extension reads: the thread key, the other person and the loaded messages. */
private fun ClassDef.holdsStrangerChat(): Boolean {
    val types = fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }.map { it.type }
    return types.count { it == THREAD_KEY_TYPE } == 1 && types.count { it == STRANGER_USER } == 1 &&
        types.count { it == STRANGER_MESSAGES } == 1
}

/** The compose fragment's send on the stock builds. scripts/compat/Media.java's confirmStrangers mirrors it. */
internal fun findConfirmStrangers(classes: Iterable<ClassDef>): List<Method> {
    val sends = classes.flatMap { it.methods }.mapNotNull { method -> method.confirmStrangersSite()?.let { method to it.params.type } }
    if (sends.isEmpty()) return emptyList()
    val holders = sends.map { it.second }.toSet()
    val known = classes.filter { it.type in holders && it.holdsStrangerChat() }.map { it.type }.toSet()
    return sends.filter { it.second in known }.map { it.first }
}

/** Checks the send's stock shape, or the gate this control put in, before anything changes. */
internal fun MutableMethod.validateConfirmStrangers() {
    if (!hasConfirmStrangersGate() && confirmStrangersSite() == null) {
        throw PatchException("Messenger controls: ${hookId()} isn't the compose fragment's send")
    }
}

/**
 * The gate at the top of the send. It reads the fragment's parameters at entry, into the register the trace mark is
 * about to load, and asks the extension. A held send returns right there. Otherwise it goes on at the trace mark, so
 * Messenger's send runs as written. A second pass finds the gate and leaves it alone.
 */
internal fun MutableMethod.injectConfirmStrangers() {
    validateConfirmStrangers()
    if (hasConfirmStrangersGate()) return
    val site = confirmStrangersSite()!!
    val params = site.params
    addInstructionsWithLabels(0, """
        move-object/from16 v${site.scratch}, v${site.fragment}
        iget-object v${site.scratch}, v${site.scratch}, ${params.definingClass}->${params.name}:${params.type}
        invoke-static {v${site.scratch}}, $STRANGER_SEND_CALL
        move-result v${site.scratch}
        if-eqz v${site.scratch}, :stock_behavior
        return-void
    """.trimIndent(), ExternalLabel("stock_behavior", getInstruction(0)))
}
