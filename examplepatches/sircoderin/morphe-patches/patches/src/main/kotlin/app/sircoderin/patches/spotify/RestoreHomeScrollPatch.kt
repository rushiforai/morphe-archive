package app.sircoderin.patches.spotify

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.patch.patch
import app.sircoderin.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val EXT = "Lapp/sircoderin/extension/spotify/HomeScrollRestore;"
private const val RECYCLER_VIEW = "Landroidx/recyclerview/widget/RecyclerView;"
private const val BUNDLE = "Landroid/os/Bundle;"
private const val LIST = "Ljava/util/List;"

/**
 * After scrolling the Home feed down, opening an album and pressing Back, the feed stayed blank, and a naive fix
 * (forcing the saved row count to 0) opens Home at the top instead.
 *
 * On restore, the Home page reads the saved row count (`bundle.getInt("viewDataHoldersSize", 0)`) and only hands rows
 * to the adapter once `savedCount - 5 <= readyRows.size()`. Rows become ready top-down as the visible range moves,
 * and only about 16 are ready right after Back, so a deep scroll deadlocks with a blank page.
 *
 * This hooks these places (all found from bytecode, nothing hardcoded to obfuscated names):
 * - after the `getInt`: hide the list, return 0 so rows show immediately, scroll down to make the runtime ready more
 *   rows, and once the saved top section exists, scroll it back to its saved offset;
 * - at the start of the page-update handler: tell the extension about every update (the ready-rows list), which also
 *   lets it keep the on-screen section in place when an update reorders rows;
 * - in the Home loop starter: on a restored start (`kjc0.t(true)`), always use the cache-only load strategy
 *   (RESTORE_OR_REVALIDATE), so the network revalidation does not replace the restored list a few seconds later;
 * - in `serialize()`: note the top section and its offset when Home is left;
 * - in the carousel constructor: Spotify keeps each carousel's scroll state in a map keyed by section id, but creates
 *   that map per view, so it is lost when Home's view is rebuilt on Back. Use one process-wide map instead;
 * - bridges: the extension's `HomeListBridge` placeholders are given real bodies. `childPosition` calls
 *   `LayoutManager.getPosition(View)` (the static call inside `LinearLayoutManager.findFirstVisibleItemPosition`);
 *   `scrollToPositionWithOffset` loads the RecyclerView's layout manager (the only RecyclerView field of that type),
 *   and if it is a `LinearLayoutManager` calls its `scrollToPositionWithOffset`, found by its exact opcode shape;
 * - `RecyclerView.onInterceptTouchEvent` (framework override): passes touches to the extension so a finger on the
 *   list ends any position hold.
 */
@Suppress("unused")
val restoreHomeScrollPatch = patch(
    name = "Restore Home scroll position",
    description = "Fixes the Home feed staying blank when you go back to it after scrolling down and opening " +
        "an album, and restores the vertical and carousel scroll positions. On Back, Home is shown from cache " +
        "instead of being reloaded a few seconds later; use \"Home pull to refresh\" to refresh it. Also keeps " +
        "the row you are looking at in place when Spotify swaps in fresh Home content while you scroll.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    extendWith("extensions/extension.mpe")

    execute {
        hookRestore()
        hookSerialize()
        hookLoadStrategy()
        hookCarouselStates()
        hookListBridges()
    }
}

private fun Instruction.fieldRef(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.typeRef(): TypeReference? = (this as? ReferenceInstruction)?.reference as? TypeReference

/** First field reference in [instructions] with type RecyclerView, optionally restricted to [owner]. */
private fun findRecyclerViewField(instructions: List<Instruction>, owner: String?): FieldReference =
    instructions.firstNotNullOfOrNull {
        it.fieldRef()?.takeIf { f -> f.type == RECYCLER_VIEW && (owner == null || f.definingClass == owner) }
    } ?: error("RecyclerView field not found")

private fun fieldSmali(f: FieldReference) = "${f.definingClass}->${f.name}:${f.type}"

private fun hookRestore() {
    val method = ViewDataHoldersSizeRestoreFingerprint.method
    val instructions = method.implementation!!.instructions.toList()
    val getIntIndex = ViewDataHoldersSizeRestoreFingerprint.instructionMatches.last().index

    val getInt = instructions[getIntIndex] as? FiveRegisterInstruction
        ?: error("getInt call is not a 35c invoke")
    val bundleRegister = getInt.registerC
    // The getInt name argument (`const-string vN, "viewDataHoldersSize"`) is dead right after the call: nothing
    // reads it again before it is overwritten, so it doubles as a scratch register for the RecyclerView.
    val scratch = getInt.registerD

    val moveResultIndex = getIntIndex + 1
    val moveResult = instructions[moveResultIndex]
    require(moveResult.opcode == Opcode.MOVE_RESULT) {
        "Expected move-result after getInt(\"viewDataHoldersSize\"), found ${moveResult.opcode}"
    }
    val savedRegister = (moveResult as OneRegisterInstruction).registerA

    // zu00 (Home page): the owner of the Bundle field that loads the getInt receiver.
    val homePage = (getIntIndex - 1 downTo 0).firstNotNullOfOrNull { i ->
        val ins = instructions[i]
        val f = ins.fieldRef()
        if (ins.opcode == Opcode.IGET_OBJECT && f != null && f.type == BUNDLE &&
            (ins as TwoRegisterInstruction).registerA == bundleRegister
        ) f.definingClass else null
    } ?: error("Bundle field feeding getInt not found")
    val recyclerField = findRecyclerViewField(instructions, homePage)

    // yzc0 (update): the owner of the List field read from p1 just before the first if-gt after getInt.
    val updateRegister = method.implementation!!.registerCount - 1 // p1 (the lambda's single argument)
    val ifGtIndex = (getIntIndex + 1 until instructions.size).first { instructions[it].opcode == Opcode.IF_GT }
    val update = (ifGtIndex - 1 downTo getIntIndex).firstNotNullOfOrNull { i ->
        val ins = instructions[i]
        val f = ins.fieldRef()
        if (ins.opcode == Opcode.IGET_OBJECT && f != null && f.type == LIST &&
            (ins as TwoRegisterInstruction).registerB == updateRegister
        ) f.definingClass else null
    } ?: error("Update List field read before if-gt not found")

    // Hook B (onEmission): after the first T0 load that follows `check-cast p1, update; check-cast pN, homePage`.
    val castIndex = instructions.indices.first { i ->
        instructions[i].typeRef()?.type == update && instructions[i].opcode == Opcode.CHECK_CAST &&
            instructions.getOrNull(i + 1)?.let { n ->
                n.opcode == Opcode.CHECK_CAST && n.typeRef()?.type == homePage
            } == true
    }
    val loadIndex = (castIndex + 2 until instructions.size).first { i ->
        instructions[i].opcode == Opcode.IGET_OBJECT && instructions[i].fieldRef().let {
            it != null && it.definingClass == homePage && it.name == recyclerField.name
        }
    }
    val listRegister = (instructions[loadIndex] as OneRegisterInstruction).registerA

    // Insert back to front (hook A is later in the method) so earlier indices stay valid.
    // Hook A (onRestore): replaces the saved count with the extension's decision.
    method.addInstructions(
        moveResultIndex + 1,
        """
            iget-object v$scratch, p0, ${fieldSmali(recyclerField)}
            invoke-static { v$scratch, v$bundleRegister, v$savedRegister }, $EXT->onRestore(Landroid/view/View;Landroid/os/Bundle;I)I
            move-result v$savedRegister
        """,
    )
    // Hook B (onEmission).
    method.addInstructions(
        loadIndex + 1,
        "invoke-static { v$listRegister, p1 }, $EXT->onEmission(Landroid/view/View;Ljava/lang/Object;)V",
    )
}

private fun hookSerialize() {
    val method = ViewDataHoldersSizeSerializeFingerprint.method
    val instructions = method.implementation!!.instructions.toList()
    val index = instructions.indexOfFirst {
        it.opcode == Opcode.IGET_OBJECT && it.fieldRef()?.type == RECYCLER_VIEW
    }
    require(index >= 0) { "RecyclerView load not found in serialize()" }
    val register = (instructions[index] as OneRegisterInstruction).registerA
    method.addInstructions(index + 1, "invoke-static { v$register }, $EXT->onSave(Landroid/view/View;)V")
}

/**
 * `kjc0.t(Z)`: returns RESTORE_OR_REVALIDATE only when `z && (flagA || flagB)`, otherwise CACHE_FIRST. CACHE_FIRST
 * (when online) triggers a follow-up REVALIDATE load whose result replaces the whole list. Make `t(true)` (the
 * restored start) always return RESTORE_OR_REVALIDATE; `t(false)` keeps its original behaviour.
 */
private fun hookLoadStrategy() {
    val called = HomeStartLoopFingerprint.instructionMatches.last().methodReference
    // Resolve the called method by its descriptor with a throwaway fingerprint.
    val strategyMethod = Fingerprint(
        definingClass = called.definingClass,
        name = called.name,
        returnType = called.returnType,
        parameters = called.parameterTypes.map { it.toString() },
    ).method
    val parameters = strategyMethod.parameterTypes
    require(parameters.size == 1 && parameters[0] == "Z" && strategyMethod.returnType.startsWith("L")) {
        "Unexpected load strategy method: $strategyMethod"
    }
    val instructions = strategyMethod.implementation!!.instructions.toList()
    val flagRegister = strategyMethod.implementation!!.registerCount - 1 // p1: the boolean argument
    // The strategy returned when the flag is true: the sget-object right after `if-eqz p1`.
    val ifIndex = instructions.indexOfFirst {
        it.opcode == Opcode.IF_EQZ && (it as OneRegisterInstruction).registerA == flagRegister
    }
    require(ifIndex >= 0) { "if-eqz on the boolean argument not found in the strategy method" }
    val sget = instructions[ifIndex + 1]
    val field = sget.fieldRef()
    require(sget.opcode == Opcode.SGET_OBJECT && field != null && field.type == strategyMethod.returnType) {
        "Expected the restore strategy constant after the boolean check"
    }
    val locals = strategyMethod.implementation!!.registerCount - 2 // minus `this` and the argument
    require(locals >= 1) { "No free local register in the strategy method" }

    strategyMethod.addInstructionsWithLabels(
        0,
        """
            if-eqz p1, :original
            sget-object v0, ${fieldSmali(field)}
            return-object v0
        """,
        ExternalLabel("original", strategyMethod.implementation!!.instructions.first()),
    )
}

/** Replaces the carousel's per-view state map (`new LinkedHashMap()`) with the extension's process-wide map. */
private fun hookCarouselStates() {
    val method = HomeCarouselConstructorFingerprint.method
    val instructions = method.implementation!!.instructions.toList()
    val newIndex = HomeCarouselConstructorFingerprint.instructionMatches.first().index
    val register = (instructions[newIndex] as OneRegisterInstruction).registerA
    val initIndex = (newIndex + 1 until instructions.size).first { i ->
        val ins = instructions[i]
        val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference
        ins.opcode == Opcode.INVOKE_DIRECT && ref?.definingClass == "Ljava/util/LinkedHashMap;" &&
            ref.name == "<init>" && ref.parameterTypes.isEmpty() &&
            (ins as FiveRegisterInstruction).registerC == register
    }
    method.addInstructions(
        initIndex + 1,
        """
            invoke-static { }, $EXT->carouselStates()Ljava/util/LinkedHashMap;
            move-result-object v$register
        """,
    )
}

/** Replaces the whole body of [method] with [smali] (which must return on every path). */
private fun replaceBody(method: MutableMethod, smali: String) {
    method.removeInstructions(0, method.implementation!!.instructions.count())
    method.addInstructionsWithLabels(0, smali)
}

private fun Fingerprint.single(what: String): MutableMethod {
    val matches = matchAll()
    check(matches.size == 1) { "$what: expected exactly one match, found ${matches.size}" }
    return matches.single().method
}

private fun hookListBridges() {
    // RecyclerView.onInterceptTouchEvent -> extension, first thing.
    val touch = RecyclerViewInterceptTouchFingerprint.single("RecyclerView.onInterceptTouchEvent")
    val recyclerView = RecyclerViewInterceptTouchFingerprint.classDef

    // LayoutManager.getPosition(View): the static call in findFirstVisibleItemPosition.
    val findFirst = FindFirstVisibleItemPositionFingerprint.single("LinearLayoutManager.findFirstVisibleItemPosition")
    val getPosition = getPositionCall(findFirst) ?: error("getPosition(View) call not found")
    val layoutManagerClass = getPosition.definingClass

    // The RecyclerView field holding the layout manager.
    val layoutFields = recyclerView.instanceFields.filter { it.type == layoutManagerClass }
    check(layoutFields.size == 1) {
        "Expected exactly one $layoutManagerClass field on RecyclerView, found ${layoutFields.map { it.name }}"
    }
    val layoutField = layoutFields.single()

    val scroll = ScrollToPositionWithOffsetFingerprint.single("LinearLayoutManager.scrollToPositionWithOffset")

    replaceBody(
        ChildPositionBridgeFingerprint.single("HomeListBridge.childPosition"),
        """
            invoke-static { p0 }, ${getPosition.definingClass}->${getPosition.name}(Landroid/view/View;)I
            move-result p0
            return p0
        """,
    )
    // Registers: p0 list, p1 position, p2 offset, p3 unused (the stub's scratch parameter).
    replaceBody(
        ScrollBridgeFingerprint.single("HomeListBridge.scrollToPositionWithOffset"),
        """
            check-cast p0, $RECYCLER_VIEW
            iget-object p0, p0, ${recyclerView.type}->${layoutField.name}:${layoutField.type}
            instance-of p3, p0, ${scroll.definingClass}
            if-eqz p3, :not_linear
            check-cast p0, ${scroll.definingClass}
            invoke-virtual { p0, p1, p2 }, ${scroll.definingClass}->${scroll.name}(II)V
            const/4 p3, 0x1
            return p3
            :not_linear
            const/4 p3, 0x0
            return p3
        """,
    )
    touch.addInstructions(
        0,
        "invoke-static { p0, p1 }, $EXT->onListTouch(Landroid/view/View;Landroid/view/MotionEvent;)V",
    )
}
