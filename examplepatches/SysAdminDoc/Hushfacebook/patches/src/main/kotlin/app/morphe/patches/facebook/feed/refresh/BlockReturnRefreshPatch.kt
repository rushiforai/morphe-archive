/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.refresh

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.requireLocals
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.ControlFlow
import app.morphe.util.findMutableMethodOf
import app.morphe.util.literalReads
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val CONTROLLER = "FeedRefreshTriggerController"
private const val ON_REFRESH = "onRefresh"
private const val SKIP = "$EXTENSION_PACKAGE/feed/ReturnRefresh;->skip()Z"

/** The warm-start check's trace name, which no other method of 580 or 577 loads. */
internal const val WARM_START_CHECK = "maybeRefreshForWarmStart"

/** What the warm-start check logs before it loads an empty feed, on its is-empty side. */
internal const val EMPTY_FEED_LOAD = "doHeadLoadOnEmptyFeed"
private const val HOLD_WARM_START = "$EXTENSION_PACKAGE/feed/ReturnRefresh;->holdWarmStart()Z"

/** What the warm-start check answers when it doesn't refresh; its callers take it as skipped. */
internal const val WARM_START_SKIPPED = 2

/** The two keys where Facebook's reset to feed writes down what it decided on a return. */
internal const val RESET_TO_FEED_OUTCOME = "r2f_log_outcome"
internal const val RESET_TO_FEED_DESTINATION = "r2f_log_destination"
private const val LOG_RESET_TO_FEED =
    "$EXTENSION_PACKAGE/feed/ReturnRefresh;->resetToFeed(Ljava/lang/String;Ljava/lang/String;)V"
private const val CONTEXT = "Landroid/content/Context;"
private const val STRING = "Ljava/lang/String;"

/** What the feed's teardown runnable logs, which no other method of 580 or 577 loads. */
internal const val LEFT_APP_TEARDOWN = "onUserLeftApp runnable"
private const val KEEP_FEED_WHILE_AWAY = "$EXTENSION_PACKAGE/feed/ReturnRefresh;->keepFeedWhileAway()Z"

/** NewsFeedFragment's foreground auto-scroll decision, which keeps its name, and its no-scroll answer. */
internal const val AUTO_SCROLL_DECISION = "decideForegroundAutoScroll"
internal const val NO_AUTO_SCROLL = "NONE"
private const val HOLD_AUTO_SCROLL = "$EXTENSION_PACKAGE/feed/ReturnRefresh;->holdAutoScroll()Z"

/**
 * Stops what Facebook does to the feed when it returns to view: the refresh FeedRefreshTriggerController
 * fires, the feed's warm-start check, which NewsFeedFragment's onResume reaches and which refreshes
 * a feed left alone for a few minutes, and NewsFeedFragment's foreground auto-scroll. Each asks the
 * extension, which gives every check of one return the same answer. The warm-start threshold also
 * times a runnable that tears the feed down while Facebook is away, so a return after it loads new
 * posts whatever the checks say. That's why the feed still reset after 6.5, 7 and 11 minutes while
 * the resume callback was held. The runnable asks first too, and does nothing while the switch is
 * on. Facebook's reset to feed only logs what it decided, for a debug log to say whether it ran.
 */
@Suppress("unused")
val blockReturnRefreshPatch = bytecodePatch(
    name = "Block background-return feed refresh",
    description = "Keeps your feed position when you return to Facebook within ten minutes, or " +
        "for any time away with No time limit on. Pull to refresh and a fresh launch still work.",
    default = false,
) {
    category("Feed")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val callbacks = classDefByStrings(CONTROLLER, StringComparisonType.EQUALS)
            .flatMap { it.methods.filter(::isReturnRefreshCallback) }
        val callback = callbacks.singleOrNull() ?: throw PatchException(
            "Expected one FeedRefreshTriggerController resume callback holding $ON_REFRESH, found ${callbacks.size}",
        )
        mutableClassDefBy(callback.definingClass).methods.first {
            it.name == callback.name && it.parameterTypes == callback.parameterTypes
        }.skipBriefReturnRefresh()

        val checks = classDefByStrings(WARM_START_CHECK, StringComparisonType.EQUALS)
            .flatMap { it.methods.filter(::isWarmStartCheck) }
        val check = checks.singleOrNull() ?: throw PatchException(
            "Expected one feed warm-start check holding $WARM_START_CHECK and $EMPTY_FEED_LOAD, found ${checks.size}",
        )
        mutableClassDefBy(check.definingClass).findMutableMethodOf(check).holdWarmStartOfAFeedWithStories()

        val logs = classDefByStrings(RESET_TO_FEED_OUTCOME, StringComparisonType.EQUALS)
            .flatMap { it.methods.filter(::isResetToFeedLog) }
        val log = logs.singleOrNull() ?: throw PatchException(
            "Expected one static (Context, String, String) reset-to-feed log holding $RESET_TO_FEED_OUTCOME " +
                "and $RESET_TO_FEED_DESTINATION, found ${logs.size}",
        )
        mutableClassDefBy(log.definingClass).findMutableMethodOf(log).logResetToFeedFirst()

        val teardowns = classDefByStrings(LEFT_APP_TEARDOWN, StringComparisonType.EQUALS)
            .flatMap { it.methods.filter(::isLeftAppTeardown) }
        val teardown = teardowns.singleOrNull() ?: throw PatchException(
            "Expected one feed teardown runnable holding \"$LEFT_APP_TEARDOWN\", found ${teardowns.size}",
        )
        mutableClassDefBy(teardown.definingClass).findMutableMethodOf(teardown).keepFeedWhileAwayFirst()

        val decisions = mutableListOf<Method>()
        classDefForEach { classDef -> decisions += classDef.methods.filter(::isAutoScrollDecision) }
        val decision = decisions.singleOrNull() ?: throw PatchException(
            "Expected one $AUTO_SCROLL_DECISION(long, boolean, long, long), found ${decisions.size}",
        )
        mutableClassDefBy(decision.definingClass).findMutableMethodOf(decision)
            .holdAutoScrollFirst(mutableClassDefBy(decision.returnType))
        enableStatus("returnRefresh")
    }
}

internal fun isReturnRefreshCallback(method: Method): Boolean =
    method.returnType == "V" && method.parameterTypes.size == 1 && method.implementation != null &&
        holdsString(method, CONTROLLER) && holdsString(method, ON_REFRESH)

/**
 * Whether [method] is the feed's warm-start check: an instance method answering an int, its last
 * parameter the caller's reason, that holds its trace name and the empty-feed load's. 580 takes a
 * threshold before the reason and 577 doesn't.
 */
internal fun isWarmStartCheck(method: Method): Boolean =
    !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "I" &&
        method.parameterTypes.lastOrNull()?.toString() == STRING && method.implementation != null &&
        holdsString(method, WARM_START_CHECK) && holdsString(method, EMPTY_FEED_LOAD)

/** Whether [method] is where the reset to feed writes down its outcome and destination. */
internal fun isResetToFeedLog(method: Method): Boolean =
    AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
        method.parameterTypes.map { it.toString() } == listOf(CONTEXT, STRING, STRING) &&
        method.implementation != null &&
        holdsString(method, RESET_TO_FEED_OUTCOME) && holdsString(method, RESET_TO_FEED_DESTINATION)

/**
 * The index of the move-result that takes the warm-start check's answer to "is the feed empty":
 * its first no-argument call of its own class answering a boolean. The answer is read once, by an
 * if-eqz that falls through to the empty-feed load, and nothing but that move-result leads to the
 * instruction after it. Throws naming what differs.
 */
internal fun emptyFeedAnswer(method: Method): Int {
    val what = "Block background-return feed refresh: ${method.definingClass}->${method.name}"
    val instructions = method.implementation?.instructions?.toList() ?: throw PatchException("$what has no body")
    val load = instructions.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == EMPTY_FEED_LOAD
    }
    val call = instructions.indexOfFirst { instruction ->
        val target = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_DIRECT && target != null && target.definingClass == method.definingClass &&
            target.parameterTypes.isEmpty() && target.returnType == "Z"
    }
    if (call < 0 || call > load) throw PatchException("$what asks no is-the-feed-empty question before $EMPTY_FEED_LOAD")
    val answer = call + 1
    val moveResult = instructions.getOrNull(answer)
    if (moveResult?.opcode != Opcode.MOVE_RESULT) throw PatchException("$what doesn't keep the is-empty answer")
    val register = (moveResult as OneRegisterInstruction).registerA
    val reads = method.literalReads(answer)
    val test = reads.singleOrNull()?.let { instructions[it] }
    if (test?.opcode != Opcode.IF_EQZ || (test as OneRegisterInstruction).registerA != register) {
        throw PatchException("$what reads the is-empty answer at ${reads.joinToString()}, expected one if-eqz")
    }
    val flow = ControlFlow.of(method)
    val testAt = reads.single()
    val nonEmpty = flow.normal[testAt].filter { it != testAt + 1 }
    if (nonEmpty.size != 1 || testAt + 1 > load || nonEmpty.single() <= load) {
        throw PatchException("$what doesn't load an empty feed on the is-empty side of its test")
    }
    val arrivals = flow.instructions.indices.filter { answer + 1 in flow.normal[it] || answer + 1 in flow.exceptional[it] }
    if (arrivals != listOf(answer)) {
        throw PatchException("$what reaches instruction ${answer + 1} from ${arrivals.joinToString()}, not only its move-result")
    }
    return answer
}

private fun MutableMethod.skipBriefReturnRefresh() {
    requireLocals("Block background-return feed refresh", 1)
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $SKIP
            move-result v0
            if-eqz v0, :keep
            return-void
        """,
        ExternalLabel("keep", getInstruction(0)),
    )
}

/**
 * Asks the extension right after the warm-start check learns the feed has stories, and answers
 * [WARM_START_SKIPPED], Facebook's own answer for a check that doesn't refresh, while it holds the
 * return. An empty feed goes on to Facebook's load without asking. The question borrows the
 * register the is-empty answer sits in: it's 0 whenever the question is asked, and 0 again, the
 * same false, whenever Facebook's code runs on, and nothing else reads it (see [emptyFeedAnswer]).
 */
internal fun MutableMethod.holdWarmStartOfAFeedWithStories() {
    val answer = emptyFeedAnswer(this)
    val empty = getInstruction<OneRegisterInstruction>(answer).registerA
    addInstructionsWithLabels(
        answer + 1,
        """
            if-nez v$empty, :facebook
            invoke-static { }, $HOLD_WARM_START
            move-result v$empty
            if-eqz v$empty, :facebook
            const/16 v$empty, $WARM_START_SKIPPED
            return v$empty
        """,
        ExternalLabel("facebook", getInstruction(answer + 1)),
    )
}

/** Whether [method] is the feed's teardown runnable: an instance run() that loads its log text. */
internal fun isLeftAppTeardown(method: Method): Boolean =
    !AccessFlags.STATIC.isSet(method.accessFlags) && method.name == "run" && method.returnType == "V" &&
        method.parameterTypes.isEmpty() && method.implementation != null && holdsString(method, LEFT_APP_TEARDOWN)

/** Whether [method] is the foreground auto-scroll decision: an instance (J, Z, J, J) answering an enum. */
internal fun isAutoScrollDecision(method: Method): Boolean =
    !AccessFlags.STATIC.isSet(method.accessFlags) && method.name == AUTO_SCROLL_DECISION &&
        method.returnType.startsWith("L") && method.implementation != null &&
        method.parameterTypes.map { it.toString() } == listOf("J", "Z", "J", "J")

/** The static field of [enum] its static initialiser stores [name]'s constant in, as a reference. */
internal fun enumConstant(enum: ClassDef, name: String): String? {
    val clinit = enum.methods.firstOrNull { it.name == "<clinit>" } ?: return null
    var last: String? = null
    for (instruction in clinit.implementation?.instructions?.toList().orEmpty()) {
        when (val reference = (instruction as? ReferenceInstruction)?.reference) {
            is StringReference -> last = reference.string
            is FieldReference -> if (instruction.opcode == Opcode.SPUT_OBJECT && reference.type == enum.type &&
                reference.definingClass == enum.type && last == name
            ) {
                return reference.toString()
            }
        }
    }
    return null
}

/**
 * The reference of the constant [decision] answers for no scroll: [enum]'s NONE, which it loads and
 * returns straight away. Throws naming what differs.
 */
internal fun noAutoScrollAnswer(decision: Method, enum: ClassDef): String {
    val what = "Block background-return feed refresh: ${decision.definingClass}->${decision.name}"
    val none = enumConstant(enum, NO_AUTO_SCROLL) ?: throw PatchException("$what: ${enum.type} has no $NO_AUTO_SCROLL")
    val body = decision.implementation?.instructions?.toList().orEmpty()
    val at = body.indexOfFirst {
        it.opcode == Opcode.SGET_OBJECT && (it as ReferenceInstruction).reference.toString() == none
    }
    val ret = body.getOrNull(at + 1)
    if (at < 0 || ret?.opcode != Opcode.RETURN_OBJECT ||
        (ret as OneRegisterInstruction).registerA != (body[at] as OneRegisterInstruction).registerA
    ) {
        throw PatchException("$what never answers $none")
    }
    return none
}

/**
 * Asks the extension first thing in the teardown runnable and returns without tearing the feed
 * down while the switch is on. The answer goes through v0: at index 0 no local holds anything yet.
 */
internal fun MutableMethod.keepFeedWhileAwayFirst() {
    requireLocals("Block background-return feed refresh", 1)
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $KEEP_FEED_WHILE_AWAY
            move-result v0
            if-eqz v0, :facebook
            return-void
        """,
        ExternalLabel("facebook", getInstruction(0)),
    )
}

/**
 * Asks the extension first thing in the auto-scroll decision and, while it holds the return, goes
 * to the decision's own NONE answer, skipping only its minute and second tests. The answer goes
 * through v0: at index 0 no local holds anything yet.
 */
internal fun MutableMethod.holdAutoScrollFirst(enum: ClassDef) {
    val none = noAutoScrollAnswer(this, enum)
    requireLocals("Block background-return feed refresh", 1)
    val at = implementation!!.instructions.indexOfFirst {
        it.opcode == Opcode.SGET_OBJECT && (it as ReferenceInstruction).reference.toString() == none
    }
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $HOLD_AUTO_SCROLL
            move-result v0
            if-nez v0, :none
        """,
        ExternalLabel("none", getInstruction(at)),
    )
}

/** Hands the reset to feed's outcome and destination, its two strings, to the extension's log first thing. */
internal fun MutableMethod.logResetToFeedFirst() {
    addInstructions(0, "invoke-static { p1, p2 }, $LOG_RESET_TO_FEED")
}
