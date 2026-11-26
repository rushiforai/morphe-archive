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
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * Mark as read stays on this phone, and Mark as unread reaching a chat that was read on this phone (#222). Both go
 * through the one service handler every Mark as read and Mark as unread in Messenger ends up in.
 */
internal const val MARK_READ_LOCALLY = "mark_read_locally"

/** What the "mark_threads" service operation carries. Every build keeps the class's name. */
internal const val MARK_THREADS_PARAMS = "Lcom/facebook/messaging/service/model/MarkThreadsParams;"
internal const val MARK_THREADS_RESULT = "Lcom/facebook/fbservice/service/OperationResult;"
/** The handler's mark as read, which is also what tells the other person, and its mark as unread. */
internal const val MARK_THREAD_READ_SHAPE = "(${THREAD_KEY_TYPE}Ljava/lang/Long;Lkotlin/jvm/functions/Function1;)V"
internal const val MARK_THREAD_UNREAD_SHAPE = "(${THREAD_KEY_TYPE}Lkotlin/jvm/functions/Function1;)V"
internal const val MARKED_READ_HERE = "$SETTINGS->markedReadHere(Ljava/lang/Object;)Z"
internal const val MARKED_UNREAD_HERE = "$SETTINGS->markedUnreadHere(Ljava/lang/Object;)V"

private fun Method.threadMarkCode() = implementation?.instructions?.toList().orEmpty()

/** The interface call [this] makes with a chat's key as its first argument, or null. */
private fun Instruction.threadMarkCall(): MethodReference? {
    if (opcode != Opcode.INVOKE_INTERFACE && opcode != Opcode.INVOKE_INTERFACE_RANGE) return null
    val call = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    return call.takeIf { it.parameterTypes.firstOrNull()?.toString() == THREAD_KEY_TYPE }
}

private fun MethodReference.threadMarkShape() = "(${parameterTypes.joinToString("")})$returnType"

private fun Instruction.threadMarkRegisters(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

/**
 * The service handler: a static method that answers an OperationResult, takes its argument as the mark_threads
 * parcel, and calls out with a chat's key exactly twice, on one interface: once to mark the chat read and once to
 * mark it unread.
 */
internal fun Method.isMarkThreadsHandler(): Boolean {
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != MARK_THREADS_RESULT) return false
    val code = threadMarkCode()
    val takesParcel = code.any {
        it.opcode == Opcode.CHECK_CAST && ((it as ReferenceInstruction).reference as? TypeReference)?.type == MARK_THREADS_PARAMS
    }
    if (!takesParcel) return false
    val calls = code.mapNotNull { it.threadMarkCall() }
    return calls.size == 2 && calls.map { it.definingClass }.toSet().size == 1 &&
        calls.map { it.threadMarkShape() }.toSet() == setOf(MARK_THREAD_READ_SHAPE, MARK_THREAD_UNREAD_SHAPE)
}

/** The one handler, or nothing when a build has none or more than one. scripts/compat/Extras.java's markReadLocally mirrors it. */
internal fun findMarkReadLocally(classes: Iterable<ClassDef>): List<Method> {
    val handlers = classes.flatMap { it.methods }.filter { it.isMarkThreadsHandler() }
    return if (handlers.size == 1) handlers else emptyList()
}

private fun threadMarkRequire(condition: Boolean, detail: String) {
    if (!condition) throw PatchException("Messenger controls: the mark as read handler changed ($detail)")
}

/** Where the two calls sit, the register each takes the chat's key in, and a register nothing reads after the read call. */
internal class MarkThreadsSite(val read: Int, val unread: Int, val readKey: Int, val unreadKey: Int, val scratch: Int)

/**
 * Nothing may jump onto either call, since the hooks go in right in front of them, and neither may sit in a try block.
 * The gate's answer needs a register the read call doesn't take and nothing reads from that call on.
 */
internal fun MutableMethod.validateMarkReadLocally(): MarkThreadsSite {
    threadMarkRequire(isMarkThreadsHandler(), "handler shape")
    val code = threadMarkCode()
    val read = code.indexOfFirst { it.threadMarkCall()?.threadMarkShape() == MARK_THREAD_READ_SHAPE }
    val unread = code.indexOfFirst { it.threadMarkCall()?.threadMarkShape() == MARK_THREAD_UNREAD_SHAPE }
    val targets = jumpTargets()
    threadMarkRequire(read !in targets && unread !in targets, "a jump onto a mark call")
    threadMarkRequire(read + 1 < code.size, "nothing after the read call")
    val flow = ReadFlow(this)
    threadMarkRequire(!flow.protected(read) && !flow.protected(unread), "a mark call in a try block")
    val readRegisters = code[read].threadMarkRegisters()
    val unreadRegisters = code[unread].threadMarkRegisters()
    threadMarkRequire(readRegisters.size == 4 && unreadRegisters.size == 3, "mark call registers")
    val scratch = (0 until implementation!!.registerCount).firstOrNull { it !in readRegisters && flow.deadAt(read, it) }
    threadMarkRequire(scratch != null, "no free register at the read call")
    return MarkThreadsSite(read, unread, readRegisters[1], unreadRegisters[1], scratch!!)
}

/**
 * In front of the read call the extension is asked whether the chat was marked read here instead, and a yes skips
 * the call, so nothing is sent. In front of the unread call it's told, so a chat read on this phone can turn unread.
 */
internal fun MutableMethod.injectMarkReadLocally() {
    val site = validateMarkReadLocally()
    val gate = {
        addInstructionsWithLabels(site.read, """
            invoke-static/range {v${site.readKey} .. v${site.readKey}}, $MARKED_READ_HERE
            move-result v${site.scratch}
            if-nez v${site.scratch}, :hush_read_here
        """.trimIndent(), ExternalLabel("hush_read_here", getInstruction(site.read + 1)))
    }
    val note = {
        addInstructions(site.unread, "invoke-static/range {v${site.unreadKey} .. v${site.unreadKey}}, $MARKED_UNREAD_HERE")
    }
    // The later call first, so the earlier index still points at its own call.
    if (site.read > site.unread) { gate(); note() } else { note(); gate() }
}
