/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0), whose patch of the same name answers Facebook's
 * return checks. Threads' checks were found by reading 449 and 448 (2026-10-02).
 */
package app.morphe.patches.threads.feed.refresh

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.localRegisterCount
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PATCH = "Block background-return feed refresh"
internal const val RETURN_REFRESH = "$EXTENSION_PACKAGE/feed/ReturnRefresh;"

/** The activity every Threads screen lives in. A kept class: its name survives Redex. */
internal const val BARCELONA_ACTIVITY = "Lcom/instagram/barcelona/mainactivity/BarcelonaActivity;"

/** What the warm-start check logs when the time away is under Threads' threshold. */
internal const val TOO_SHORT = "background_time_too_short_for_hot_start_feed_refresh"

/** What the warm-start check logs first, the time away by the wall clock. */
internal const val WALL_CLOCK = "hot_start_wall_clock_bg_elapsed_ms"

/** What the reset to main feed logs when it resets, and the key it logs its answer under. */
internal const val RESET_TO_MAIN_FEED = "RESET_TO_MAIN_FEED"
internal const val RESET_TO_HOME_FEED = "reset_to_home_feed"

/** What BarcelonaActivity logs as it handles the hot-start decision. */
internal const val BADGE_DECISION = "badge_decision"

/**
 * Keeps the feed where it was after a short trip out of Threads.
 *
 * Coming back, Threads makes four calls. BarcelonaActivity's onStart asks a static method for a
 * hot-start decision, which can refresh For you in the background or badge the home tab, and asks
 * whether to reset to the main feed. The feed screen's warm-start check then compares the time away
 * with a server threshold and, past it, clears the cache, reloads every feed and scrolls to the top.
 * When it skips that, For you compares the time away with the same threshold again and, past it,
 * swaps in the posts it fetched while Threads was in the background. Each asks the extension, which
 * gives every check of one return the same answer: the hot-start decision answers null, its own
 * answer when no stop time was recorded; the reset answers false; the warm-start check stores false,
 * its own skip; the swap sees false, as after a short trip. Pull to refresh, a cold start and
 * returns from one Threads screen to another never reach these. Hushfacebook's ten-minute limit and
 * No time limit switch carry over.
 */
@Suppress("unused")
val blockReturnRefreshPatch = bytecodePatch(
    name = PATCH,
    description = "Keeps your place in the feed when you come back to Threads within ten minutes, or after any " +
        "time away with No time limit on. Pull to refresh and a fresh launch still load new posts.",
    default = false,
) {
    category("Feed")
    dependsOn(settingsPatch)
    dependsOn(threadsExtensionPatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        requireStatusMethod("returnRefresh")
        holdCachedPosts(holdWarmStart())
        holdResetToFeed()
        holdHotStart()
        enableStatus("returnRefresh")
    }
}

internal fun Method.holdsString(value: String): Boolean = implementation?.instructions?.any {
    it.getReference<StringReference>()?.string == value
} == true

private fun BytecodePatchContext.methodsHolding(vararg values: String, where: (Method) -> Boolean): List<Method> =
    classDefByStrings(values.first(), StringComparisonType.EQUALS).flatMap { it.methods }
        .filter { method -> values.all { method.holdsString(it) } && where(method) }
        .distinctBy { "${it.definingClass}->${it.name}${it.parameterTypes.joinToString("")}${it.returnType}" }

private fun BytecodePatchContext.mutable(method: Method): MutableMethod =
    mutableClassDefBy(method.definingClass).findMutableMethodOf(method)

/** The warm-start check: the register its refresh answer sits in, and where that answer is stored. */
internal data class WarmStartSite(val register: Int, val store: Int)

/**
 * The warm-start check's answer is a boolean set to 1 when the time away reaches the threshold and
 * to 0 right before it logs [TOO_SHORT], then stored into the decision it hands back. Every other
 * path stores a constant false.
 */
internal fun Method.warmStartSite(): WarmStartSite {
    val body = implementation!!.instructions.toList()
    val (logged, zero) = body.tooShortFalse()
    fun literal(index: Int, value: Int) = body[index].opcode == Opcode.CONST_4 &&
        (body[index] as NarrowLiteralInstruction).narrowLiteral == value
    val register = (body[zero] as OneRegisterInstruction).registerA
    fun writes(index: Int) = body[index].writes(register)
    if ((zero + 1 until logged).any(::writes)) {
        throw PatchException("$PATCH: the warm-start answer v$register is overwritten before \"$TOO_SHORT\" is logged")
    }
    // The true side: set within a few instructions before the false, on the branch that skips it.
    (zero - 1 downTo maxOf(0, zero - 4)).firstOrNull { literal(it, 1) && (body[it] as OneRegisterInstruction).registerA == register }
        ?: throw PatchException("$PATCH: no true answer in v$register before the warm-start check's false")
    val store = (logged + 1 until body.size).firstOrNull {
        body[it].opcode == Opcode.IPUT_BOOLEAN && (body[it] as TwoRegisterInstruction).registerA == register
    } ?: throw PatchException("$PATCH: the warm-start answer v$register is never stored")
    if ((logged + 1 until store).any(::writes)) {
        throw PatchException("$PATCH: the warm-start answer v$register is overwritten before it is stored")
    }
    return WarmStartSite(register, store)
}

/** Where the warm-start check logs [TOO_SHORT], and the false it sets right before that. */
private fun List<Instruction>.tooShortFalse(): Pair<Int, Int> {
    val logged = indices.filter { this[it].getReference<StringReference>()?.string == TOO_SHORT }
        .singleOrPatchException("$PATCH: the warm-start check's \"$TOO_SHORT\" log")
    val zero = (logged - 1 downTo 0).firstOrNull {
        this[it].opcode == Opcode.CONST_4 && (this[it] as NarrowLiteralInstruction).narrowLiteral == 0
    } ?: throw PatchException("$PATCH: no false before the warm-start check's \"$TOO_SHORT\" log")
    return logged to zero
}

private fun Instruction.writes(register: Int) = opcode.setsRegister() && (this as? OneRegisterInstruction)?.registerA.let {
    it == register || opcode.setsWideRegister() && it == register - 1
}

private fun BytecodePatchContext.holdWarmStart(): MutableMethod {
    val check = methodsHolding(TOO_SHORT, WALL_CLOCK) { it.parameterTypes.lastOrNull()?.toString() == "Z" }
        .singleOrPatchException("$PATCH: warm-start check holding \"$TOO_SHORT\" and \"$WALL_CLOCK\"")
        .let { mutable(it) }
    val site = check.warmStartSite()
    check.addInstructionsAtControlFlowLabel(
        site.store,
        """
            invoke-static/range { v${site.register} .. v${site.register} }, $RETURN_REFRESH->warmStart(Z)Z
            move-result v${site.register}
        """,
    )
    return check
}

/** For you's swap to the posts fetched in the background: the register holding its answer, and where that answer joins. */
internal data class CachedPostsSite(val method: Method, val register: Int, val join: Int) {
    override fun toString() = "${method.definingClass}->${method.name} v$register at $join"
}

/** A server threshold: the MobileConfig getter asked for a long, and the key it is asked for. */
internal data class Threshold(val getter: String, val key: Long) {
    override fun toString() = "$getter for 0x${key.toString(16)}"
}

/**
 * The threshold the warm-start check compares the time away with: cmp-long against the long its
 * getter answered, then the true, and the if-gez on that comparison over the false before
 * [TOO_SHORT]. 448 and 449 load the key well above the call, on the far side of two branches.
 */
internal fun Method.warmStartThreshold(): Threshold {
    val body = implementation!!.instructions.toList()
    val (_, zero) = body.tooShortFalse()
    val branch = zero - 1
    val compare = zero - 3
    if (compare < 0 || body[compare].opcode != Opcode.CMP_LONG || body[branch].opcode != Opcode.IF_GEZ ||
        (body[branch] as OneRegisterInstruction).registerA != (body[compare] as ThreeRegisterInstruction).registerA
    ) throw PatchException("$PATCH: no comparison with the server threshold right above the warm-start check's false")
    return thresholdAt(body, compare)
        ?: throw PatchException("$PATCH: the warm-start check's threshold isn't one MobileConfig key on every path to its getter")
}

/**
 * After the warm-start check skips its reload, For you compares the time away with the same server
 * [threshold]: cmp-long of the time away against the same getter's answer for the same key, a true,
 * an if-gez on that comparison over a false that falls straight into the join, and an if-eqz on that
 * answer a few instructions on, which guards the swap. The warm-start check's own comparison
 * branches past its log instead.
 */
internal fun Method.cachedPostsSites(threshold: Threshold): List<CachedPostsSite> {
    val body = implementation?.instructions?.toList() ?: return emptyList()
    val address = IntArray(body.size + 1)
    for (index in body.indices) address[index + 1] = address[index] + body[index].codeUnits
    fun literal(index: Int, value: Int) = body[index].opcode == Opcode.CONST_4 &&
        (body[index] as NarrowLiteralInstruction).narrowLiteral == value
    fun register(index: Int) = (body[index] as OneRegisterInstruction).registerA
    return (3 until body.size - 1).mapNotNull { zero ->
        val branch = zero - 1
        val compare = zero - 3
        if (!literal(zero, 0) || body[branch].opcode != Opcode.IF_GEZ || !literal(zero - 2, 1) ||
            body[compare].opcode != Opcode.CMP_LONG
        ) return@mapNotNull null
        val answer = register(zero)
        val join = zero + 1
        val comparison = body[compare] as ThreeRegisterInstruction
        // True when the time away (first) reaches the threshold (second), so the operands keep their order.
        if (register(zero - 2) != answer || register(branch) != comparison.registerA ||
            address[branch] + (body[branch] as OffsetInstruction).codeOffset != address[join] ||
            thresholdAt(body, compare) != threshold
        ) return@mapNotNull null
        val guard = (join until minOf(body.size, join + 6)).firstOrNull {
            body[it].opcode == Opcode.IF_EQZ && register(it) == answer
        }
        if (guard == null || (join until guard).any { body[it].writes(answer) }) return@mapNotNull null
        CachedPostsSite(this, answer, join)
    }
}

/**
 * What the cmp-long at [compare] holds second, when it is the long a (J)J getter answered right
 * above it for the one key every path to that call loads. Null for anything else.
 */
private fun Method.thresholdAt(body: List<Instruction>, compare: Int): Threshold? {
    val call = compare - 2
    if (call < 0 || body[compare - 1].opcode != Opcode.MOVE_RESULT_WIDE ||
        (body[compare - 1] as OneRegisterInstruction).registerA != (body[compare] as ThreeRegisterInstruction).registerC
    ) return null
    val getter = body[call].getReference<MethodReference>() ?: return null
    if (getter.returnType != "J" || getter.parameterTypes.map { it.toString() } != listOf("J")) return null
    // The key is the call's last argument, a register pair.
    val arguments = when (val invoke = body[call]) {
        is FiveRegisterInstruction ->
            listOf(invoke.registerC, invoke.registerD, invoke.registerE, invoke.registerF, invoke.registerG).take(invoke.registerCount)
        is RegisterRangeInstruction -> (invoke.startRegister until invoke.startRegister + invoke.registerCount).toList()
        else -> return null
    }
    val key = arguments.getOrNull(arguments.size - 2) ?: return null
    val keys = reachingWideLiterals(call, key)?.takeIf { it.size == 1 } ?: return null
    return Threshold("${getter.definingClass}->${getter.name}(J)J", keys.single())
}

private val CONST_WIDES = setOf(Opcode.CONST_WIDE, Opcode.CONST_WIDE_16, Opcode.CONST_WIDE_32, Opcode.CONST_WIDE_HIGH16)

/**
 * The literals of the const-wides whose value the pair at [register] still holds when the
 * instruction at [index] runs, over every path there, handlers included. Null when a path writes
 * either half any other way or reaches the method's entry first.
 */
private fun Method.reachingWideLiterals(index: Int, register: Int): Set<Long>? {
    val flow = ControlFlow.of(this)
    val into = Array(flow.instructions.size) { mutableListOf<Int>() }
    val thrownInto = Array(flow.instructions.size) { mutableListOf<Int>() }
    flow.normal.forEachIndexed { from, targets -> targets.forEach { into[it] += from } }
    flow.exceptional.forEachIndexed { from, targets -> targets.forEach { thrownInto[it] += from } }
    val literals = mutableSetOf<Long>()
    // Each instruction once as run and once as thrown: one that throws never writes its destination.
    val seen = mutableSetOf<Pair<Int, Boolean>>()
    val pending = ArrayDeque<Pair<Int, Boolean>>()
    fun before(at: Int): Boolean {
        if (at == 0) return false
        into[at].forEach { if (seen.add(it to false)) pending += it to false }
        thrownInto[at].forEach { if (seen.add(it to true)) pending += it to true }
        return true
    }
    if (!before(index)) return null
    while (pending.isNotEmpty()) {
        val (at, threw) = pending.removeFirst()
        val instruction = flow.instructions[at]
        if (!threw && (instruction.writes(register) || instruction.writes(register + 1))) {
            if (instruction.opcode !in CONST_WIDES || (instruction as OneRegisterInstruction).registerA != register) return null
            literals += (instruction as WideLiteralInstruction).wideLiteral
        } else if (!before(at)) {
            return null
        }
    }
    return literals
}

/**
 * 449 makes this comparison in the warm-start check's sibling that handles a skipped reload, and 448
 * later in the warm-start check itself. Either way it sits in the warm-start check's class.
 */
private fun BytecodePatchContext.holdCachedPosts(warm: MutableMethod) {
    val threshold = warm.warmStartThreshold()
    val site = mutableClassDefBy(warm.definingClass).methods.flatMap { it.cachedPostsSites(threshold) }
        .singleOrPatchException("$PATCH: For you's swap to posts fetched in the background, past the warm-start threshold")
    (site.method as MutableMethod).addInstructionsAtControlFlowLabel(
        site.join,
        """
            invoke-static/range { v${site.register} .. v${site.register} }, $RETURN_REFRESH->cachedPosts(Z)Z
            move-result v${site.register}
        """,
    )
}

private fun BytecodePatchContext.holdResetToFeed() {
    val reset = methodsHolding(RESET_TO_MAIN_FEED, RESET_TO_HOME_FEED) {
        it.definingClass == BARCELONA_ACTIVITY && it.returnType == "Z"
    }.singleOrPatchException("$PATCH: BarcelonaActivity's reset to main feed holding \"$RESET_TO_MAIN_FEED\"")
        .let { mutable(it) }
    val body = reset.implementation!!.instructions.toList()
    val answer = body.indices.filter { body[it].opcode == Opcode.RETURN }
        .singleOrPatchException("$PATCH: the reset to main feed's return")
    val register = (body[answer] as OneRegisterInstruction).registerA
    reset.addInstructionsAtControlFlowLabel(
        answer,
        """
            invoke-static/range { v$register .. v$register }, $RETURN_REFRESH->resetToFeed(Z)Z
            move-result v$register
        """,
    )
}

/**
 * The hot-start decision has no string of its own. BarcelonaActivity's handler of it is the one
 * method holding [BADGE_DECISION], and onStart makes the decision with one static call answering
 * the handler's parameter type, from the session's helper, the last surface and two times.
 */
private fun BytecodePatchContext.holdHotStart() {
    val handler = methodsHolding(BADGE_DECISION) {
        it.definingClass == BARCELONA_ACTIVITY && it.returnType == "V" && it.parameterTypes.size == 1
    }.singleOrPatchException("$PATCH: BarcelonaActivity's hot-start handler holding \"$BADGE_DECISION\"")
    val decisionType = handler.parameterTypes.single().toString()
    val onStart = mutableClassDefBy(BARCELONA_ACTIVITY).methods.filter { it.name == "onStart" && it.parameterTypes.isEmpty() }
        .singleOrPatchException("$PATCH: BarcelonaActivity.onStart")
    val decision = onStart.implementation!!.instructions.mapNotNull { instruction ->
        if (instruction.opcode != Opcode.INVOKE_STATIC && instruction.opcode != Opcode.INVOKE_STATIC_RANGE) return@mapNotNull null
        instruction.getReference<MethodReference>()?.takeIf {
            it.returnType == decisionType &&
                it.parameterTypes.map(CharSequence::toString).let { types ->
                    types.size == 4 && types[0].startsWith("L") && types[1] == "Ljava/lang/String;" && types[2] == "J" && types[3] == "J"
                }
        }
    }.distinctBy { it.toString() }.singleOrPatchException("$PATCH: onStart's static hot-start decision answering $decisionType")
    val method = mutableClassDefBy(decision.definingClass).findMutableMethodOf(decision)
    if (!AccessFlags.STATIC.isSet(method.accessFlags) || method.localRegisterCount() < 1) {
        throw PatchException("$PATCH: the hot-start decision $decision has no free local register at entry")
    }
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $RETURN_REFRESH->holdHotStart()Z
            move-result v0
            if-eqz v0, :decide
            const/4 v0, 0x0
            return-object v0
        """,
        ExternalLabel("decide", method.getInstruction(0)),
    )
}
