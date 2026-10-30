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
    fun deadFrom(start: Int, register: Int) {
        val pending = ArrayDeque<Int>().apply { add(start) }
        val seen = mutableSetOf<Int>()
        while (pending.isNotEmpty()) {
            val i = pending.removeFirst()
            if (!seen.add(i)) continue
            readRequire(!code[i].readReads(register))
            pending.addAll(exceptionalSuccessors(i))
            if (!code[i].readWrites(register)) pending.addAll(normalSuccessors(i))
        }
    }
}

/**
 * Where the dispatcher's pieces sit in the supported body: the composer and account copies, the thread's null default
 * (its if-eqz, getter and result follow it), the null path's copy and the dispatch.
 */
internal class ReplyReadShape(
    /** The exact body sizes the seam is known at. */
    val sizes: Set<Int>, val composer: Int, val session: Int, val nullThread: Int, val absent: Int, val dispatch: Int,
    /** The register the composer copy lives in, and how many instructions before the dispatch the thread is staged into v12. */
    val composerReg: Int = 20, val stage: Int = 2,
)

/**
 * Messenger 585's dispatcher, 397 instructions on arm64 and 393 on the 32-bit builds, with the seam at the same indices
 * in both. The composer is copied to v19 and the staging sits four before the dispatch.
 */
internal val REPLY_READ_SHAPE = ReplyReadShape(sizes = setOf(393, 397), composer = 10, session = 20, nullThread = 26, absent = 71, dispatch = 233, composerReg = 19, stage = 4)

/** The exact 585 staging seam. The thread survives in v12 until the account is staged there for dispatch. */
internal fun MutableMethod.validateReplyRead(): Int {
    readRequire(isReplyReadDispatch() && implementation!!.registerCount == 35)
    val flow = ReadFlow(this)
    val c = flow.code
    val shape = REPLY_READ_SHAPE
    readRequire(c.size in shape.sizes)
    val d = shape.dispatch
    val s = d - shape.stage
    val cr = shape.composerReg
    val n = shape.nullThread
    val absent = shape.absent
    // Insertion can extend a try ending at the old next instruction over the new throwing callback.
    readRequire((s - 3..d + 1).none { flow.protected(it) }, "unprotected send seam")
    fun move(i: Int, a: Int, b: Int, op: Opcode) = c[i].opcode == op && (c[i] as? TwoRegisterInstruction)?.let { it.registerA == a && it.registerB == b } == true
    readRequire(move(4, 7, parameterRegister(11), Opcode.MOVE_OBJECT_FROM16) && move(shape.composer, cr, parameterRegister(4), Opcode.MOVE_OBJECT_FROM16))
    readRequire(move(shape.session, 10, parameterRegister(0), Opcode.MOVE_OBJECT_FROM16))
    val getter = c[n + 2].readRef() as? MethodReference
    readRequire(c[n + 2].opcode == Opcode.INVOKE_INTERFACE_RANGE && c[n + 2].readArgs() == listOf(parameterRegister(7)), "thread provider argument")
    readRequire(getter?.definingClass == parameterTypes[7].toString() && getter.parameterTypes.isEmpty() && getter.returnType == THREAD_KEY_TYPE, "typed thread getter")
    readRequire(c[n + 3].opcode == Opcode.MOVE_RESULT_OBJECT && (c[n + 3] as OneRegisterInstruction).registerA == 12, "thread result")
    readRequire(flow.definitionsAt(shape.session, parameterRegister(0)) == setOf(-1) && flow.definitionsAt(4, parameterRegister(11)) == setOf(-1) &&
        flow.definitionsAt(shape.composer, parameterRegister(4)) == setOf(-1) && flow.definitionsAt(n + 2, parameterRegister(7)) == setOf(-1) &&
        flow.definitionsAt(d, 10) == setOf(shape.session) && flow.definitionsAt(d, cr) == setOf(shape.composer) && flow.definitionsAt(d, 7) == setOf(4))
    readRequire(flow.definitionsAt(s, 12) == setOf(n + 3, absent) && flow.definitionsAt(absent, 5) == setOf(n) && move(absent, 12, 5, Opcode.MOVE_OBJECT) &&
        c[n].opcode == Opcode.CONST_4 && (c[n] as OneRegisterInstruction).registerA == 5 && (c[n] as NarrowLiteralInstruction).narrowLiteral == 0 &&
        c[n + 1].opcode == Opcode.IF_EQZ && (c[n + 1] as OneRegisterInstruction).registerA == parameterRegister(7) && c.branchTarget(n + 1) == absent)
    readRequire(c.indices.none { i -> i != n + 1 && flow.successors(i).contains(absent) } && jumpTargets().none { it in n..n + 3 } &&
        !flow.reaches(0, absent, setOf(n)))
    readRequire(move(s - 1, 11, cr, Opcode.MOVE_OBJECT_FROM16))
    readRequire(move(s, 12, 10, Opcode.MOVE_OBJECT) && (s + 1 until d).count { move(it, 15, 0, Opcode.MOVE_OBJECT) } == 1)
    val dispatch = c[d].readRef() as? MethodReference
    readRequire(c[d].opcode == Opcode.INVOKE_INTERFACE_RANGE && c[d].readArgs() == (11..16).toList() &&
        dispatch?.definingClass == parameterTypes[4].toString() && dispatch.returnType == "V" && dispatch.parameterTypes.size == 5 &&
        dispatch.parameterTypes[0] == FB_USER_SESSION && dispatch.parameterTypes.takeLast(2) == listOf("Ljava/lang/String;", "Ljava/lang/String;"))
    readRequire(jumpTargets().none { it in s..d + 1 } && listOf(4, shape.composer, shape.session).none { flow.reaches(0, d, setOf(it)) } &&
        !flow.reaches(0, s, setOf(n + 3, absent)))
    flow.deadFrom(s, parameterRegister(13))
    flow.deadFrom(d + 1, 0)
    flow.deadFrom(d + 1, 1)
    return d
}

internal fun MutableMethod.injectReplyRead() {
    val dispatch = validateReplyRead()
    // Insert backwards so both indices refer to the unmodified stock method.
    addInstructions(dispatch + 1, """
        move-object v0, v10
        move-object/from16 v1, p13
        invoke-static {v0, v1}, $SETTINGS->noteMessageSent(Ljava/lang/Object;Ljava/lang/Object;)V
    """.trimIndent())
    addInstructions(dispatch - REPLY_READ_SHAPE.stage, "move-object/16 p13, v12")
}
