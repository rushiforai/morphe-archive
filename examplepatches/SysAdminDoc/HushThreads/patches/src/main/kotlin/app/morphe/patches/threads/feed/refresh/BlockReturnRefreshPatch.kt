/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0), whose patch of the same name answers Facebook's
 * return checks. Threads' checks were found by reading 449 and 448 (2026-10-02), and carried to
 * 450's reshaped warm-start check and two-key threshold by reading it (2026-10-06).
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
import app.morphe.patches.threads.feed.reaching
import app.morphe.patches.threads.feed.writes
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.localRegisterCount
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.settingsPatch
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
    description = "Keeps your place in your feed when you leave Threads and come back within ten minutes. Pulling " +
        "down to refresh still loads new posts. Good if you hate losing the post you were reading. Starts" +
        " off. Turn it on in HushThreads settings > Feed.",
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
 * The warm-start check's answer is a boolean: 1 when the time away reaches the threshold, 0 when it
 * logs [TOO_SHORT], then stored into the decision it hands back. Every other path stores a constant
 * false.
 */
internal fun Method.warmStartSite(): WarmStartSite {
    val body = implementation!!.instructions.toList()
    val answer = warmStartAnswer()
    val register = answer.register
    val store = (answer.storeFrom until body.size).firstOrNull {
        body[it].opcode == Opcode.IPUT_BOOLEAN && (body[it] as TwoRegisterInstruction).registerA == register
    } ?: throw PatchException("$PATCH: the warm-start answer v$register is never stored")
    if ((answer.storeFrom until store).any { body[it].writes(register) }) {
        throw PatchException("$PATCH: the warm-start answer v$register is overwritten before it is stored")
    }
    return WarmStartSite(register, store)
}

/**
 * Where the warm-start check compares the time away with its threshold, the register its answer
 * sits in, and where the search for that answer's store starts.
 */
internal data class WarmStartAnswer(val compare: Int, val register: Int, val storeFrom: Int)

/**
 * 450 sets the answer to 0 early on, branches to the [TOO_SHORT] log when the time away is short
 * and sets the 1 otherwise, and the log jumps back to where the two sides meet before the store.
 */
internal fun Method.warmStartAnswer(): WarmStartAnswer {
    val body = implementation!!.instructions.toList()
    val logged = body.indices.filter { body[it].getReference<StringReference>()?.string == TOO_SHORT }
        .singleOrPatchException("$PATCH: the warm-start check's \"$TOO_SHORT\" log")
    return jumpingFalse(body, logged)
        ?: throw PatchException("$PATCH: no comparison with the server threshold right above the warm-start check's false")
}

/**
 * cmp-long, an if-ltz on it to a block that runs straight into the log and then jumps back to just
 * past the true, which sits right after the if-ltz. The answer has to be false on every path to the
 * comparison, since the short side never sets it.
 */
private fun Method.jumpingFalse(body: List<Instruction>, logged: Int): WarmStartAnswer? {
    val address = IntArray(body.size + 1)
    for (index in body.indices) address[index + 1] = address[index] + body[index].codeUnits
    fun target(index: Int) = address.indexOf(address[index] + (body[index] as OffsetInstruction).codeOffset)
    fun leaves(index: Int) = body[index] is OffsetInstruction || !body[index].opcode.canContinue()
    val compare = body.indices.filter { at ->
        body[at].opcode == Opcode.CMP_LONG && body.getOrNull(at + 1)?.opcode == Opcode.IF_LTZ &&
            (body[at + 1] as OneRegisterInstruction).registerA == (body[at] as ThreeRegisterInstruction).registerA &&
            target(at + 1).let { it in 0..logged && (it until logged).none(::leaves) }
    }.singleOrNull() ?: return null
    val one = compare + 2
    if (!body.literal(one, 1)) return null
    val register = (body[one] as OneRegisterInstruction).registerA
    val end = (logged until body.size).first(::leaves)
    if (body[end].opcode !in GOTOS || target(end) != one + 1) {
        throw PatchException("$PATCH: the warm-start check's \"$TOO_SHORT\" log doesn't go back to its answer")
    }
    if ((target(compare + 1) until end).any { body[it].writes(register) }) {
        throw PatchException("$PATCH: the warm-start answer v$register is overwritten around \"$TOO_SHORT\"")
    }
    val zeroes = reachingWrites(compare, setOf(register))
    if (zeroes.isNullOrEmpty() || zeroes.any { !body.literal(it, 0) }) {
        throw PatchException("$PATCH: the warm-start answer v$register isn't false on every path to its comparison")
    }
    return WarmStartAnswer(compare, register, one + 1)
}

private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)

private fun List<Instruction>.literal(index: Int, value: Int) = getOrNull(index)?.let {
    it.opcode == Opcode.CONST_4 && (it as NarrowLiteralInstruction).narrowLiteral == value
} == true

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

/**
 * A server threshold: the MobileConfig getter asked for a long, and the keys it is asked for. 450
 * asks a second key first when an experiment is on, and falls back to the first.
 */
internal data class Threshold(val getter: String, val keys: Set<Long>) {
    override fun toString() = "$getter for ${keys.sorted().joinToString { "0x${it.toString(16)}" }}"
}

/**
 * The threshold the warm-start check compares the time away with: the long its getter answered,
 * held second by the comparison that decides the answer. 450 loads each of its two keys next to its
 * own call. Each key is still traced over every path to its call, since 449 and 448 loaded theirs
 * well above it, on the far side of two branches.
 */
internal fun Method.warmStartThreshold(): Threshold =
    thresholdAt(implementation!!.instructions.toList(), warmStartAnswer().compare)
        ?: throw PatchException("$PATCH: the warm-start check's threshold isn't one MobileConfig key on every path to its getter")

/**
 * After the warm-start check skips its reload, For you compares the time away with the same server
 * [threshold]: cmp-long of the time away against the same getter's answer for the same keys, a true,
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
 * What the cmp-long at [compare] holds second, when on every path it is the long one (J)J getter
 * answered, and each call to that getter loads one key on every path to it. Null for anything else.
 */
private fun Method.thresholdAt(body: List<Instruction>, compare: Int): Threshold? {
    val calls = thresholdCalls(compare)?.takeIf { it.isNotEmpty() } ?: return null
    val getter = calls.map { call -> body[call].getReference<MethodReference>()!!.let { "${it.definingClass}->${it.name}(J)J" } }
        .distinct().singleOrNull() ?: return null
    val keys = calls.map { call ->
        // The key is the call's last argument, a register pair.
        val arguments = when (val invoke = body[call]) {
            is FiveRegisterInstruction ->
                listOf(invoke.registerC, invoke.registerD, invoke.registerE, invoke.registerF, invoke.registerG).take(invoke.registerCount)
            is RegisterRangeInstruction -> (invoke.startRegister until invoke.startRegister + invoke.registerCount).toList()
            else -> return null
        }
        val key = arguments.getOrNull(arguments.size - 2) ?: return null
        reachingWideLiterals(call, key)?.singleOrNull() ?: return null
    }
    return Threshold(getter, keys.toSet())
}

/**
 * The (J)J calls whose answer the cmp-long at [compare] holds second, over every path to it, in
 * order. Null when a path gets that long any other way or reaches the method's entry first.
 */
internal fun Method.thresholdCalls(compare: Int): List<Int>? {
    val body = implementation!!.instructions.toList()
    val register = (body[compare] as ThreeRegisterInstruction).registerC
    return reachingWrites(compare, setOf(register, register + 1))?.sorted()?.map { at ->
        if (at == 0 || body[at].opcode != Opcode.MOVE_RESULT_WIDE || (body[at] as OneRegisterInstruction).registerA != register) return null
        val getter = body[at - 1].getReference<MethodReference>() ?: return null
        if (getter.returnType != "J" || getter.parameterTypes.map { it.toString() } != listOf("J")) return null
        at - 1
    }
}

private val CONST_WIDES = setOf(Opcode.CONST_WIDE, Opcode.CONST_WIDE_16, Opcode.CONST_WIDE_32, Opcode.CONST_WIDE_HIGH16)

/**
 * The literals of the const-wides whose value the pair at [register] still holds when the
 * instruction at [index] runs, over every path there, handlers included. Null when a path writes
 * either half any other way or reaches the method's entry first.
 */
private fun Method.reachingWideLiterals(index: Int, register: Int): Set<Long>? {
    val body = implementation!!.instructions.toList()
    return reachingWrites(index, setOf(register, register + 1))?.map { at ->
        val instruction = body[at]
        if (instruction.opcode !in CONST_WIDES || (instruction as OneRegisterInstruction).registerA != register) return null
        (instruction as WideLiteralInstruction).wideLiteral
    }?.toSet()
}

/** The writes to [registers] that reach [index], or null when a path from the method's entry writes none of them. */
private fun Method.reachingWrites(index: Int, registers: Set<Int>): Set<Int>? =
    reaching(index, registers).takeUnless { it.fromEntry }?.writes

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
