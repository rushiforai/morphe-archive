/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.chatlist

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Disable chat swipe actions"
internal const val CHAT_SWIPE = "$EXTENSION_PACKAGE/misc/ChatSwipe;"
private const val SHARED_CONFIG = "Lorg/telegram/messenger/SharedConfig;"
private const val RECYCLER_VIEW = "Landroidx/recyclerview/widget/RecyclerView;"

/** ItemTouchHelper.LEFT, the only direction a chat row swipes. */
private const val LEFT = 4

@Suppress("unused")
val disableChatSwipePatch = bytecodePatch(
    name = PATCH,
    description = "Stops a sideways swipe on a chat from archiving, muting, pinning, deleting or marking it read, so a " +
        "slip can't change a chat. Press and hold still has every action. Starts off. Turn it on in " +
        "HushTelegram settings > Chats.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("disableChatSwipe")
        val site = resolveChatSwipeSite()
        site.apply()
        enableStatus("disableChatSwipe")
    }
}

/**
 * The chat list swipe controller's getMovementFlags. [entry] is where its swipe branch has passed
 * every check that answers no movement: from there the only way out is the swipe's own return,
 * after the row is marked sliding. [swipeReturn] is that return.
 */
internal class ChatSwipeSite(val method: MutableMethod, val entry: Int, val sliding: Int, val swipeReturn: Int)

internal fun BytecodePatchContext.resolveChatSwipeSite(): ChatSwipeSite {
    requireRuntimeHook()
    val candidates = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/hushtelegram/extension/")) return@classDefForEach
        classDef.methods.filterTo(candidates) { method ->
            !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "I" &&
                method.parameterTypes.size == 2 && method.parameterTypes[0].toString() == RECYCLER_VIEW &&
                method.instructions().let { body ->
                    body.any { it.call()?.let { call -> call.definingClass == SHARED_CONFIG && call.name == "getChatSwipeAction" } == true } &&
                        body.any { it.call()?.let { call -> call.name == "setSliding" && call.returnType == "V" &&
                            call.parameterTypes.map(CharSequence::toString) == listOf("Z") } == true }
                }
        }
    }
    val found = candidates.one("chat list getMovementFlags")
    val method = mutableClassDefBy(found.definingClass).methods.single {
        it.name == found.name && it.parameterTypes.map(CharSequence::toString) == found.parameterTypes.map(CharSequence::toString) &&
            it.returnType == found.returnType
    }
    val body = method.instructions()

    // The swipe: the row is marked sliding, then the method returns makeMovementFlags(0, LEFT).
    val sliding = body.indices.filter { body[it].call()?.name == "setSliding" }.one("setSliding call")
    val flags = body.getOrNull(sliding + 1)?.call()
    shape(body.getOrNull(sliding + 1)?.opcode == Opcode.INVOKE_STATIC && flags != null && flags.returnType == "I" &&
        flags.parameterTypes.map(CharSequence::toString) == listOf("I", "I") &&
        body.getOrNull(sliding + 2)?.opcode == Opcode.MOVE_RESULT && body.getOrNull(sliding + 3)?.opcode == Opcode.RETURN &&
        body[sliding + 2].namedRegisters() == body[sliding + 3].namedRegisters(),
        "the row marked sliding no longer returns its movement flags")
    val swipeReturn = sliding + 3
    // The reorder drag of a pinned chat returns the same kind of flags on its own path.
    shape(body.count { instruction -> instruction.call()?.let { it.definingClass == flags!!.definingClass && it.name == flags.name } == true } == 2,
        "getMovementFlags no longer has exactly a drag and a swipe")

    val entry = swipeBranchEntry(method, swipeReturn)
    shape(entry < sliding, "the swipe branch starts after the row is marked sliding")
    // The swipe's direction is set inside the branch, before any branching, to LEFT.
    val direction = body[sliding + 1].namedRegisters()[1]
    val directionWrites = (entry until sliding).filter { direction in body[it].writes() }
    shape(directionWrites.size == 1 && body[directionWrites[0]].opcode == Opcode.CONST_4 &&
        (body[directionWrites[0]] as NarrowLiteralInstruction).narrowLiteral == LEFT &&
        (entry until directionWrites[0]).all { at -> body[at].opcode.canContinue() && !body[at].opcode.isBranch() },
        "the swipe no longer moves the row left")
    return ChatSwipeSite(method, entry, sliding, swipeReturn)
}

/**
 * The one instruction through which every path enters the part of the method that can only end
 * in [swipeReturn]. Everything before it can still answer no movement, so returning 0 there is an
 * answer Telegram already gives, and nothing has been marked sliding yet.
 */
private fun swipeBranchEntry(method: Method, swipeReturn: Int): Int {
    val body = method.instructions()
    val flow = ControlFlow.of(method)
    val predecessors = Array(body.size) { mutableListOf<Int>() }
    for (index in body.indices) for (next in flow.normal[index] + flow.exceptional[index]) predecessors[next] += index
    val otherExits = body.indices.filter { it != swipeReturn && body[it].opcode.let { op ->
        op == Opcode.RETURN || op == Opcode.RETURN_VOID || op == Opcode.RETURN_WIDE || op == Opcode.RETURN_OBJECT || op == Opcode.THROW } }
    val canLeaveElsewhere = BooleanArray(body.size)
    val pending = ArrayDeque(otherExits)
    otherExits.forEach { canLeaveElsewhere[it] = true }
    while (pending.isNotEmpty()) {
        for (previous in predecessors[pending.removeFirst()]) {
            if (!canLeaveElsewhere[previous]) {
                canLeaveElsewhere[previous] = true
                pending += previous
            }
        }
    }
    val reached = BooleanArray(body.size)
    val walk = ArrayDeque(listOf(0))
    reached[0] = true
    while (walk.isNotEmpty()) {
        val index = walk.removeFirst()
        for (next in flow.normal[index] + flow.exceptional[index]) {
            if (!reached[next]) {
                reached[next] = true
                walk += next
            }
        }
    }
    val region = body.indices.filter { reached[it] && !canLeaveElsewhere[it] }
    shape(swipeReturn in region, "the swipe return isn't reached")
    val entries = region.filter { at -> predecessors[at].any { canLeaveElsewhere[it] } }
    return entries.one("swipe branch entry")
}

private fun ChatSwipeSite.apply() {
    val answer = method.freeLocalsAt(PATCH, entry, 1, highest = 15).single()
    method.addInstructionsAtControlFlowLabel(entry, """
        invoke-static {}, $CHAT_SWIPE->keepRowStill()Z
        move-result v$answer
        if-eqz v$answer, :hush_stock
        const/4 v$answer, 0x0
        return v$answer
        :hush_stock
        nop
    """.trimIndent())
}

private fun BytecodePatchContext.requireRuntimeHook() {
    val owner = classDefByOrNull(CHAT_SWIPE)
    shape(owner != null && AccessFlags.PUBLIC.isSet(owner.accessFlags), "no public chat swipe runtime")
    shape(owner!!.methods.count { it.name == "keepRowStill" && it.parameterTypes.isEmpty() && it.returnType == "Z" &&
        AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
        !AccessFlags.NATIVE.isSet(it.accessFlags) && !AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
        it.implementation?.instructions?.any { instruction -> !instruction.opcode.format.isPayloadFormat } == true } == 1,
        "no callable public static runtime keepRowStill")
}

private val BRANCHES = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32, Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH,
    Opcode.IF_EQ, Opcode.IF_NE, Opcode.IF_LT, Opcode.IF_GE, Opcode.IF_GT, Opcode.IF_LE,
    Opcode.IF_EQZ, Opcode.IF_NEZ, Opcode.IF_LTZ, Opcode.IF_GEZ, Opcode.IF_GTZ, Opcode.IF_LEZ)
private fun Opcode.isBranch() = this in BRANCHES
private fun Instruction.writes(): Set<Int> {
    if (!opcode.setsRegister()) return emptySet()
    val first = namedRegisters().firstOrNull() ?: return emptySet()
    return if (opcode.setsWideRegister()) setOf(first, first + 1) else setOf(first)
}
private fun refuse(reason: String): Nothing =
    throw PatchException("$PATCH: $reason; refuses changed chat list swipe geometry before editing")
private fun shape(valid: Boolean, reason: String) {
    if (!valid) refuse(reason)
}
private fun <T> List<T>.one(what: String): T {
    shape(size == 1, "$what has $size matches")
    return single()
}
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
