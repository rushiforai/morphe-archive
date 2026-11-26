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
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val HIDE_READ_RECEIPTS = "hide_read_receipts"
internal const val REPLY_READ = "reply_read"
internal const val CHAT_SEEN_JOB = "MARK_THREAD_AS_SEEN_JOB"
internal const val CHAT_SEEN_TRACE = "broadcast_message_seen_internal"
internal const val SEND_MESSAGE_EVENT = "Lcom/facebook/xapp/messaging/composer/send/event/SendMessageEvent;"

private fun Instruction.readRef() = (this as? ReferenceInstruction)?.reference
private fun Method.readCode() = implementation?.instructions?.toList().orEmpty()
private fun Method.stringLiterals() = readCode().mapNotNull { (it.readRef() as? StringReference)?.string }.toSet()
private fun Instruction.readArgs(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

/** Manual Mark as read routes use the separate read manager and remain untouched. */
internal fun Method.isChatSeenBroadcast() =
    AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" &&
        parameterTypes.map { it.toString() } == listOf(FB_USER_SESSION, definingClass, "Ljava/lang/String;") &&
        stringLiterals().containsAll(setOf(CHAT_SEEN_JOB, CHAT_SEEN_TRACE))

/** The common composer dispatcher, rather than the identity-free SendMessageEvent constructor. */
internal fun Method.isReplyReadDispatch() = AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" &&
    parameterTypes.size == 15 && parameterTypes[0] == FB_USER_SESSION && parameterTypes[11] == SEND_MESSAGE_EVENT &&
    stringLiterals().containsAll(setOf("AdapterSender", "meta_ai_invocation"))

internal fun findChatSeen(classes: Iterable<ClassDef>): List<Method> = classes.flatMap { it.methods }.filter { it.isChatSeenBroadcast() }
internal fun findReplyRead(classes: Iterable<ClassDef>): List<Method> = classes.flatMap { it.methods }.filter { it.isReplyReadDispatch() }

internal var readReceiptThreadFields: Map<String, String> = emptyMap()

/** Resolve the handler's immutable typed key from its constructor, never from its message-id String. */
internal fun resolveReadReceiptThreadFields(classes: Iterable<ClassDef>): Map<String, String> {
    val thread = classes.singleOrNull { it.type == THREAD_KEY_TYPE } ?: return emptyMap()
    if (!AccessFlags.FINAL.isSet(thread.accessFlags)) return emptyMap()
    val equality = thread.methods.singleOrNull { it.name == "equals" && it.parameterTypes == listOf("Ljava/lang/Object;") && it.returnType == "Z" }
        ?: return emptyMap()
    val compared = equality.readCode().mapNotNull { it.readRef() as? FieldReference }.filter { it.definingClass == THREAD_KEY_TYPE }
    if (compared.isEmpty() || compared.any { ref -> thread.fields.none { it.name == ref.name && it.type == ref.type && AccessFlags.FINAL.isSet(it.accessFlags) } }) return emptyMap()
    return classes.flatMap { owner ->
        owner.methods.filter { it.isChatSeenBroadcast() }.mapNotNull { seen ->
            val field = owner.fields.singleOrNull { it.type == THREAD_KEY_TYPE && AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.FINAL.isSet(it.accessFlags) }
                ?: return@mapNotNull null
            val ctor = owner.methods.singleOrNull { it.name == "<init>" && it.parameterTypes.take(2) == listOf(FB_USER_SESSION, THREAD_KEY_TYPE) && it.implementation != null }
                ?: return@mapNotNull null
            val stores = ctor.readCode().withIndex().filter { (_, insn) ->
                insn.opcode == Opcode.IPUT_OBJECT && (insn.readRef() as? FieldReference)?.let { it.definingClass == owner.type && it.name == field.name && it.type == field.type } == true
            }
            val store = stores.singleOrNull() ?: return@mapNotNull null
            val args = store.value as TwoRegisterInstruction
            if (args.registerA != ctor.parameterRegister(2) || args.registerB != ctor.parameterRegister(0) ||
                ctor.readCode().take(store.index).any { it.readWrites(args.registerA) || it.readWrites(args.registerB) }) return@mapNotNull null
            seen.hookId() to "${owner.type}->${field.name}:${field.type}"
        }
    }.toMap()
}

private fun readRequire(condition: Boolean, detail: String = "identity flow") {
    if (!condition) throw PatchException("Messenger controls: the account-scoped read receipt contract changed ($detail)")
}

internal fun MutableMethod.validateChatSeen() {
    readRequire(isChatSeenBroadcast() && readReceiptThreadFields.containsKey(hookId()) && parameterRegister(2) <= 15)
    validateSwitch()
}

/** The handler and message id go along, so a Seen held back can be sent later by the Mark as read button. */
internal fun MutableMethod.injectChatSeen() {
    validateChatSeen()
    addInstructionsWithLabels(0, """
        iget-object v0, p1, ${readReceiptThreadFields.getValue(hookId())}
        invoke-static {p0, v0, p1, p2}, $SETTINGS->hideChatSeen(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Z
        move-result v0
        if-eqz v0, :stock_read
        return-void
    """.trimIndent(), ExternalLabel("stock_read", getInstruction(0)))
}

internal fun Instruction.readWrites(register: Int) = opcode.setsRegister() && this is OneRegisterInstruction &&
    (registerA == register || (opcode.setsWideRegister() && registerA + 1 == register))

private fun Instruction.readReads(register: Int): Boolean {
    val name = opcode.toString()
    fun source(value: Int) = value == register || (("WIDE" in name || "LONG" in name || "DOUBLE" in name) && value + 1 == register)
    return when (this) {
        is FiveRegisterInstruction, is RegisterRangeInstruction -> readArgs().any(::source)
        is ThreeRegisterInstruction -> source(registerB) || source(registerC) || (!opcode.setsRegister() && source(registerA))
        is TwoRegisterInstruction -> source(registerB) || ((!opcode.setsRegister() || "2ADDR" in name) && source(registerA))
        is OneRegisterInstruction -> (!opcode.setsRegister() || opcode == Opcode.CHECK_CAST) && source(registerA)
        else -> false
    }
}

/** Include catch and switch edges when checking dominance and scratch liveness. */
internal class ReadFlow(method: Method) {
    val code = method.readCode()
    private val addresses = IntArray(code.size + 1).also { a -> for (i in code.indices) a[i + 1] = a[i] + code[i].codeUnits }
    private val indexAt = code.indices.associateBy { addresses[it] }
    private val tries = method.implementation!!.tryBlocks
    fun protected(index: Int) = tries.any { addresses[index] in it.startCodeAddress until it.startCodeAddress + it.codeUnitCount }
    private fun normalSuccessors(index: Int): Set<Int> = buildSet {
        val insn = code[index]
        if (insn is OffsetInstruction && insn.opcode != Opcode.FILL_ARRAY_DATA) {
            val landing = indexAt[addresses[index] + insn.codeOffset]
            readRequire(landing != null)
            if (insn.opcode == Opcode.PACKED_SWITCH || insn.opcode == Opcode.SPARSE_SWITCH) {
                val payload = code[landing!!] as? SwitchPayload
                readRequire(payload != null)
                payload!!.switchElements.forEach { element ->
                    val target = indexAt[addresses[index] + element.offset]
                    readRequire(target != null)
                    add(target!!)
                }
            } else add(landing!!)
        }
        if (insn.opcode.canContinue()) { readRequire(index + 1 < code.size); add(index + 1) }
    }
    private fun exceptionalSuccessors(index: Int): Set<Int> = buildSet {
        if (code[index].opcode.canThrow()) tries.filter { addresses[index] in it.startCodeAddress until it.startCodeAddress + it.codeUnitCount }.forEach { block ->
            block.exceptionHandlers.forEach { handler ->
                val target = indexAt[handler.handlerCodeAddress]
                readRequire(target != null)
                add(target!!)
            }
        }
    }
    fun successors(index: Int) = normalSuccessors(index) + exceptionalSuccessors(index)
    fun reaches(start: Int, target: Int, blocked: Set<Int>): Boolean {
        val pending = ArrayDeque<Int>().apply { add(start) }
        val seen = mutableSetOf<Int>()
        while (pending.isNotEmpty()) {
            val i = pending.removeFirst()
            if (i in blocked || !seen.add(i)) continue
            if (i == target) return true
            pending.addAll(successors(i))
        }
        return false
    }
    fun definitionsAt(target: Int, register: Int): Set<Int> {
        val pending = ArrayDeque<Pair<Int, Int>>().apply { add(0 to -1) }
        val seen = mutableSetOf<Pair<Int, Int>>()
        return buildSet {
            while (pending.isNotEmpty()) {
                val state = pending.removeFirst()
                if (!seen.add(state)) continue
                val (i, origin) = state
                if (i == target) add(origin)
                val next = if (code[i].readWrites(register)) i else origin
                normalSuccessors(i).forEach { pending.add(it to next) }
                exceptionalSuccessors(i).forEach { pending.add(it to origin) }
            }
        }
    }
    /** Whether nothing reads the register again from here on, down every path out of it, the exceptional ones too. */
    fun deadAt(start: Int, register: Int): Boolean {
        val pending = ArrayDeque<Int>().apply { add(start) }
        val seen = mutableSetOf<Int>()
        while (pending.isNotEmpty()) {
            val i = pending.removeFirst()
            if (!seen.add(i)) continue
            if (code[i].readReads(register)) return false
            pending.addAll(exceptionalSuccessors(i))
            if (!code[i].readWrites(register)) pending.addAll(normalSuccessors(i))
        }
        return true
    }

    fun deadFrom(start: Int, register: Int) = readRequire(deadAt(start, register))
}

/**
 * Where the dispatcher's pieces sit in the supported body, and the registers they live in. The event, composer and
 * account are copied out of p11, p4 and p0 near the top. The thread's null default comes next (its if-eqz, getter and
 * result follow it), and the null path copies that default into the thread's register. Just before the dispatch the
 * composer is staged into the first of its six registers, the account into the second, and the first String into the fifth.
 */
internal class ReplyReadShape(
    /** The exact body sizes the seam is known at, and the frame size. */
    val sizes: Set<Int>, val registers: Int,
    val event: Int, val eventReg: Int, val composer: Int, val composerReg: Int, val session: Int, val sessionReg: Int,
    val nullThread: Int, val nullReg: Int, val threadReg: Int, val absent: Int,
    /** The dispatch, the first of its six registers, how far before it the composer is staged, and where its first String comes from. */
    val dispatch: Int, val dispatchStart: Int, val stage: Int, val stringReg: Int,
)

/**
 * Messenger 588's dispatcher, 540 instructions in a 42-register frame. Its thread stays in v2 past the dispatch, so the
 * hook hands the account and the thread on straight after it. 587 staged the account over its thread (v12) just
 * before the dispatch, so its hook had to park the thread in p13 first.
 */
internal val REPLY_READ_SHAPE = ReplyReadShape(sizes = setOf(540), registers = 42, event = 4, eventReg = 5, composer = 10, composerReg = 26,
    session = 20, sessionReg = 4, nullThread = 27, nullReg = 18, threadReg = 2, absent = 158, dispatch = 347, dispatchStart = 12, stage = 5,
    stringReg = 23)

internal val REPLY_READ_SHAPES = listOf(REPLY_READ_SHAPE)

/** The known shape a dispatcher of this body size and frame has, or null. */
private fun MutableMethod.replyReadShape(size: Int) =
    REPLY_READ_SHAPES.singleOrNull { size in it.sizes && implementation?.registerCount == it.registers }

/**
 * The exact staging seam. The account and the thread are both still in their own registers when the dispatch returns,
 * and only the dispatch leads to the instruction after it.
 */
internal fun MutableMethod.validateReplyRead(): Int {
    readRequire(isReplyReadDispatch())
    val flow = ReadFlow(this)
    val c = flow.code
    val shape = replyReadShape(c.size) ?: throw PatchException("Messenger controls: the account-scoped read receipt contract changed (identity flow)")
    val d = shape.dispatch
    val staged = d - shape.stage
    val n = shape.nullThread
    val absent = shape.absent
    val thread = shape.threadReg
    val account = shape.sessionReg
    val first = shape.dispatchStart
    // Insertion can extend a try ending at the old next instruction over the new throwing callback.
    readRequire((staged - 3..d + 1).none { flow.protected(it) }, "unprotected send seam")
    readRequire(thread <= 15 && account <= 15 && thread != account, "thread and account registers")
    // A copy is a copy at whatever width its registers need.
    val copies = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)
    fun move(i: Int, a: Int, b: Int) = c[i].opcode in copies && (c[i] as? TwoRegisterInstruction)?.let { it.registerA == a && it.registerB == b } == true
    readRequire(move(shape.event, shape.eventReg, parameterRegister(11)) && move(shape.composer, shape.composerReg, parameterRegister(4)))
    readRequire(move(shape.session, account, parameterRegister(0)))
    val getter = c[n + 2].readRef() as? MethodReference
    readRequire(c[n + 2].opcode == Opcode.INVOKE_INTERFACE_RANGE && c[n + 2].readArgs() == listOf(parameterRegister(7)), "thread provider argument")
    readRequire(getter?.definingClass == parameterTypes[7].toString() && getter.parameterTypes.isEmpty() && getter.returnType == THREAD_KEY_TYPE, "typed thread getter")
    readRequire(c[n + 3].opcode == Opcode.MOVE_RESULT_OBJECT && (c[n + 3] as OneRegisterInstruction).registerA == thread, "thread result")
    readRequire(flow.definitionsAt(shape.session, parameterRegister(0)) == setOf(-1) && flow.definitionsAt(shape.event, parameterRegister(11)) == setOf(-1) &&
        flow.definitionsAt(shape.composer, parameterRegister(4)) == setOf(-1) && flow.definitionsAt(n + 2, parameterRegister(7)) == setOf(-1) &&
        flow.definitionsAt(d, account) == setOf(shape.session) && flow.definitionsAt(d, shape.composerReg) == setOf(shape.composer) &&
        flow.definitionsAt(d, shape.eventReg) == setOf(shape.event))
    val zero = c[n]
    readRequire(flow.definitionsAt(d, thread) == setOf(n + 3, absent) && flow.definitionsAt(absent, shape.nullReg) == setOf(n) &&
        move(absent, thread, shape.nullReg) && (zero.opcode == Opcode.CONST_4 || zero.opcode == Opcode.CONST_16) &&
        (zero as OneRegisterInstruction).registerA == shape.nullReg && (zero as NarrowLiteralInstruction).narrowLiteral == 0 &&
        c[n + 1].opcode == Opcode.IF_EQZ && (c[n + 1] as OneRegisterInstruction).registerA == parameterRegister(7) && c.branchTarget(n + 1) == absent)
    readRequire(c.indices.none { i -> i != n + 1 && flow.successors(i).contains(absent) } && jumpTargets().none { it in n..n + 3 } &&
        !flow.reaches(0, absent, setOf(n)))
    readRequire(move(staged, first, shape.composerReg) && move(staged + 1, first + 1, account) &&
        (staged + 2 until d).count { move(it, first + 4, shape.stringReg) } == 1)
    val dispatch = c[d].readRef() as? MethodReference
    readRequire(c[d].opcode == Opcode.INVOKE_INTERFACE_RANGE && c[d].readArgs() == (first..first + 5).toList() &&
        dispatch?.definingClass == parameterTypes[4].toString() && dispatch.returnType == "V" && dispatch.parameterTypes.size == 5 &&
        dispatch.parameterTypes[0] == FB_USER_SESSION && dispatch.parameterTypes.takeLast(2) == listOf("Ljava/lang/String;", "Ljava/lang/String;"))
    readRequire(flow.definitionsAt(d, first) == setOf(staged) && flow.definitionsAt(d, first + 1) == setOf(staged + 1))
    // Messenger's own branches may land on the composer's staging, never past it.
    readRequire(jumpTargets().none { it in staged + 1..d + 1 } && listOf(shape.event, shape.composer, shape.session).none { flow.reaches(0, d, setOf(it)) } &&
        !flow.reaches(0, staged, setOf(n + 3, absent)))
    return d
}

internal fun MutableMethod.injectReplyRead() {
    val dispatch = validateReplyRead()
    val shape = replyReadShape(readCode().size)!!
    addInstructions(dispatch + 1, "invoke-static {v${shape.sessionReg}, v${shape.threadReg}}, $SETTINGS->noteMessageSent(Ljava/lang/Object;Ljava/lang/Object;)V")
}

internal const val DELIVERY_RECEIPT = "delivery_receipt"
internal const val DELIVERY_RECEIPT_OP = "send_delivery_receipt_batch"
internal const val DELIVERY_RECEIPT_TAG = "DefaultSendDeliveryReceiptManager"
internal const val DELIVERY_RECEIPT_TOPIC = "/t_dr_batch"

/**
 * Delivered is sent from one batch manager, named by the op it publishes rather than by its obfuscated class. Its two
 * callers, the ordinary send and the retry task, both land here, so the one hook covers every Delivered Messenger
 * reports over this transport. Encrypted chats answer on their own msys path and are left alone.
 */
internal fun Method.isDeliveryReceiptSend() = !AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" &&
    parameterTypes.size == 4 && parameterTypes[0].toString() == FB_USER_SESSION &&
    stringLiterals().containsAll(setOf(DELIVERY_RECEIPT_OP, DELIVERY_RECEIPT_TAG, DELIVERY_RECEIPT_TOPIC))

internal fun findDeliveryReceipt(classes: Iterable<ClassDef>): List<Method> =
    classes.flatMap { it.methods }.filter { it.isDeliveryReceiptSend() }

/** Where the batch leaves its holder: the drain, the register it lands in, the clearing store and the empty check. */
private class DeliverySeam(val merge: Int, val batch: Int, val cleared: Int, val zero: Int, val gate: Int)

/**
 * The sender takes the lock, merges whatever is waiting with the batch it was handed, clears the holder and releases
 * the lock, then returns when the merge came back empty. Everything after that is this batch alone.
 *
 * The same merge runs a second time when the send fails and the batch goes back in the holder, so the call alone
 * doesn't name the seam. Only the drain clears the holder and gates on what came back, and only one place does.
 */
private fun Method.deliverySeam(): DeliverySeam? {
    val code = readCode()
    val merges = code.withIndex().filter { (_, insn) ->
        insn.opcode == Opcode.INVOKE_STATIC && (insn.readRef() as? MethodReference)?.let { ref ->
            val held = ref.returnType
            held.startsWith("L") && ref.parameterTypes.map { it.toString() } == listOf(held, held)
        } == true
    }.map { it.index }
    return merges.mapNotNull { merge ->
        val held = (code[merge].readRef() as MethodReference).returnType
        val moved = code.getOrNull(merge + 1)
        if (moved?.opcode != Opcode.MOVE_RESULT_OBJECT || (moved as OneRegisterInstruction).registerA > 15) return@mapNotNull null
        val cleared = code.withIndex().drop(merge + 2).firstOrNull { (_, insn) ->
            insn.opcode == Opcode.IPUT_OBJECT && (insn.readRef() as? FieldReference)?.type == held
        } ?: return@mapNotNull null
        if (code.getOrNull(cleared.index + 1)?.opcode != Opcode.MONITOR_EXIT) return@mapNotNull null
        val gate = cleared.index + 2
        val branch = code.getOrNull(gate) ?: return@mapNotNull null
        if (branch.opcode != Opcode.IF_EQZ || (branch as OneRegisterInstruction).registerA != moved.registerA) return@mapNotNull null
        DeliverySeam(merge, moved.registerA, cleared.index, (cleared.value as TwoRegisterInstruction).registerA, gate)
    }.singleOrNull()
}

/**
 * The seam one past the empty check. The batch is out of the holder and the lock is already released there, so an
 * early return drops these receipts instead of letting them pile up for the next send.
 */
internal fun MutableMethod.validateDeliveryReceipt(): Int {
    readRequire(isDeliveryReceiptSend(), "the batch payload moved out of ${hookId()}")
    val seam = deliverySeam()
    readRequire(seam != null, "no empty-batch return in ${hookId()}")
    val at = seam!!.gate + 1
    val flow = ReadFlow(this)
    val c = flow.code
    // The holder has to be cleared with a register a const zero proves zero on every path into the store.
    val zeroed = flow.definitionsAt(seam.cleared, seam.zero).singleOrNull() ?: -1
    readRequire(zeroed >= 0 && c[zeroed].opcode == Opcode.CONST_4 &&
        (c[zeroed] as NarrowLiteralInstruction).narrowLiteral == 0, "the batch holder isn't cleared")
    readRequire(flow.definitionsAt(at, seam.batch) == setOf(seam.merge + 1), "the batch reaches the send from elsewhere")
    // Insertion can stretch a try that ended at the old next instruction over the new throwing call, and the
    // handler past the monitor exit would release a monitor this thread no longer holds.
    readRequire((seam.gate..at).none { flow.protected(it) }, "the empty check sits inside a try")
    readRequire(at !in jumpTargets(), "a jump lands on the empty-batch exit")
    readRequire(!flow.reaches(0, at, setOf(seam.gate)), "the send is reachable without the empty check")
    val exit = c.branchTarget(seam.gate)
    readRequire(exit >= 0 && c[exit].opcode == Opcode.RETURN_VOID, "the empty-batch branch stopped being a bare return")
    flow.deadFrom(at, 0)
    validateSwitch()
    return at
}

internal fun MutableMethod.injectDeliveryReceipt() {
    val at = validateDeliveryReceipt()
    addInstructionsWithLabels(at, """
        invoke-static {}, $SETTINGS->hideDeliveryReceipts()Z
        move-result v0
        if-eqz v0, :stock_delivery
        return-void
    """.trimIndent(), ExternalLabel("stock_delivery", getInstruction(at)))
}
