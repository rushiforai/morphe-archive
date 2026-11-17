package app.template.patches.truecaller.layout

import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.addHevalSkip
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.requireNoBranchTargetAt
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.BuilderSwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val FEATURE = "truecaller.hide_inbox_cards"

// The key of the carousel's LazyColumn item (an Integer, so skipLazyListItem cannot be used).
private const val CAROUSEL_KEY = 1111111

// Calls of the lazy-list item helper inside the skipped carousel block (26.44.6: the one keyed item).
private const val EXPECTED_ITEM_CALLS = 1

// A Heval Controls feature: the Messages inbox builder jumps past the card carousel only while it
// is on (opt-in: off until the user turns it on in Patch settings). The builder runs whenever the
// list updates, so no restart is needed.
@Suppress("unused")
val hideInboxCardsPatch = truecallerControls.featurePatch(
    HevalFeature(
        id = FEATURE,
        name = "Hide inbox cards",
        description = "Hides the info and promo cards above the Messages inbox.",
        category = TruecallerControlsCategory.PROMOTIONS,
        default = false,
    ),
    default = false,
) {
    // 1. The inbox builder adds the card carousel (spacer, item keyed 1111111, spacer) behind
    // `if (banners filtered by the current filter and isCleared().isEmpty()) skip`: the last filter
    // of the fingerprint is that ArrayList.isEmpty() call, followed by move-result and if-nez.
    // While the feature is on, the builder jumps to the if-nez target, past the carousel. The
    // fraud onboarding, override category, filtering messages, sync state and mark-all-as-read
    // banners and the conversations are untouched.
    val fingerprint = InboxCardCarouselFingerprint
    val method = fingerprint.method
    val label = "${method.definingClass}->${method.name}"
    val instructions = (method.implementation ?: throw PatchException("$label has no implementation")).instructions.toList()

    val isEmpty = fingerprint.instructionMatches.last().index
    val call = (instructions[isEmpty] as? ReferenceInstruction)?.reference as? MethodReference
    if (instructions[isEmpty].opcode != Opcode.INVOKE_VIRTUAL || call?.definingClass != "Ljava/util/ArrayList;" || call.name != "isEmpty") {
        throw PatchException("$label: the carousel check is ${instructions[isEmpty].opcode} $call, expected ArrayList.isEmpty()")
    }
    val result = instructions.getOrNull(isEmpty + 1)
    val guard = isEmpty + 2
    val branch = instructions.getOrNull(guard)
    if (result?.opcode != Opcode.MOVE_RESULT || branch?.opcode != Opcode.IF_NEZ ||
        (result as OneRegisterInstruction).registerA != (branch as OneRegisterInstruction).registerA
    ) {
        throw PatchException("$label: isEmpty() is not followed by move-result and if-nez on its result (${result?.opcode}, ${branch?.opcode})")
    }
    val target = (branch as BuilderOffsetInstruction).target.location.index

    // 2. The branch skips exactly the carousel: forward, over the Integer key 1111111 and its
    // static void item call, with no other item key (const-string) in between.
    if (target <= guard + 1) throw PatchException("$label: the carousel guard does not jump forward")
    val between = guard + 1 until target
    val keys = between.filter { index ->
        val literal = instructions[index] as? NarrowLiteralInstruction
        literal != null && instructions[index].opcode in CONST_OPCODES && literal.narrowLiteral == CAROUSEL_KEY
    }
    val key = keys.singleOrNull()
        ?: throw PatchException("$label: the carousel guard skips ${keys.size} loads of the item key $CAROUSEL_KEY, expected one")
    val boxed = (instructions.getOrNull(key + 1) as? ReferenceInstruction)?.reference as? MethodReference
    if (boxed?.definingClass != "Ljava/lang/Integer;" || boxed.name != "valueOf") {
        throw PatchException("$label: the item key $CAROUSEL_KEY is not boxed with Integer.valueOf")
    }
    val boxedResult = instructions.getOrNull(key + 2)
    if (boxedResult?.opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException("$label: the boxed item key is not moved to a register (${boxedResult?.opcode})")
    }
    val keyRegister = (boxedResult as OneRegisterInstruction).registerA
    fun staticVoid(index: Int): MethodReference? {
        val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        return reference?.takeIf { instructions[index].opcode in STATIC_INVOKES && it.returnType == "V" }
    }
    fun arguments(index: Int): List<Int> = when (val instruction = instructions[index]) {
        is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD, instruction.registerE, instruction.registerF, instruction.registerG).take(instruction.registerCount)
        is RegisterRangeInstruction -> (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
        else -> emptyList()
    }
    val itemCall = (key + 3 until target).firstOrNull { staticVoid(it) != null }
        ?: throw PatchException("$label: no static void item call follows the item key before the guard target")
    if (keyRegister !in arguments(itemCall)) {
        throw PatchException("$label: the item call at $itemCall does not take the boxed key in v$keyRegister")
    }
    // The carousel is one keyed item: exactly one call of the item helper (26.44.6: tcp.n). The two
    // spacers around it are another static void helper (kk40.W) and are not counted.
    val itemHelper = staticVoid(itemCall)
    val itemCalls = between.count { staticVoid(it) == itemHelper }
    if (itemCalls != EXPECTED_ITEM_CALLS) {
        throw PatchException("$label: the carousel guard skips $itemCalls item helper calls, expected $EXPECTED_ITEM_CALLS")
    }
    if (between.any { instructions[it].opcode == Opcode.CONST_STRING || instructions[it].opcode == Opcode.CONST_STRING_JUMBO }) {
        throw PatchException("$label: the carousel guard also skips another keyed item (before $target)")
    }

    // 3. The carousel is reached only through its guard: no jump from outside lands inside it.
    val code = method.implementation!!
    val jumps = instructions.flatMapIndexed { index, instruction ->
        when (instruction) {
            is BuilderOffsetInstruction -> listOf(index to instruction.target.location.index)
            is BuilderSwitchPayload -> instruction.switchElements.map { index to it.target.location.index }
            else -> emptyList()
        }
    } + code.tryBlocks.flatMap { block -> block.exceptionHandlers.map { -1 to it.handler.location.index } }
    val bypass = jumps.filter { (from, to) -> to in between && from !in between }
    if (bypass.isNotEmpty()) {
        throw PatchException("$label: the carousel is also reached from ${bypass.map { it.first }}, not only through its guard")
    }

    method.requireNoBranchTargetAt(guard, "skipping the inbox card carousel")
    method.addHevalSkip(FEATURE, guard, target)
}

private val CONST_OPCODES = setOf(Opcode.CONST, Opcode.CONST_16, Opcode.CONST_HIGH16)
private val STATIC_INVOKES = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)
