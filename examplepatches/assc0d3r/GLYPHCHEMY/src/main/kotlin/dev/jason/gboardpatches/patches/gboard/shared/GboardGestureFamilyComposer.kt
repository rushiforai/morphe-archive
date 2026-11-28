package dev.jason.gboardpatches.patches.gboard.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import java.util.WeakHashMap

private const val TOP_ROW_HELPER_NAME = "jasondevDispatchWithTopRow"
private const val TOGGLE_HELPER_NAME = "jasondevDispatchOrToggle"
private const val LONG_PRESS_HELPER_NAME = "jasondevDispatchGlobeDrag"
private val GESTURE_HELPER_NAMES =
    setOf(LONG_PRESS_HELPER_NAME, TOP_ROW_HELPER_NAME, TOGGLE_HELPER_NAME)
private val GESTURE_HELPER_ACCESS_FLAGS = AccessFlags.PRIVATE.value or AccessFlags.FINAL.value
private val GESTURE_TARGET_ACCESS_FLAGS = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value
private val GESTURE_STOCK_FIELD_ACCESS_FLAGS = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value

internal enum class GboardGestureFamilyFeature {
    LONG_PRESS_QUICK_ACTIONS,
    TOP_ROW_SWIPE,
    ZHUYIN_TOGGLE,
}

private sealed interface GestureOperand {
    data object Receiver : GestureOperand
    data class Parameter(val index: Int) : GestureOperand
}

private enum class GboardGestureFamilyStage(
    val feature: GboardGestureFamilyFeature,
    val order: Int,
    val call: RuntimeCallId,
    val operands: List<GestureOperand>,
) {
    LONG_PRESS_QUICK_ACTIONS(
        feature = GboardGestureFamilyFeature.LONG_PRESS_QUICK_ACTIONS,
        order = 50,
        call = RuntimeCallId.LONG_PRESS_QUICK_ACTIONS_RUNTIME_MAYBE_HANDLE_GLOBE_GESTURE,
        operands = listOf(
            GestureOperand.Parameter(0),
            GestureOperand.Parameter(1),
            GestureOperand.Parameter(2),
            GestureOperand.Parameter(3),
        ),
    ),
    TOP_ROW_SWIPE(
        feature = GboardGestureFamilyFeature.TOP_ROW_SWIPE,
        order = 100,
        call = RuntimeCallId.TOP_ROW_SWIPE_RUNTIME_MAYBE_CONSUME_TOP_ROW_SWIPE,
        operands = listOf(
            GestureOperand.Receiver,
            GestureOperand.Parameter(0),
            GestureOperand.Parameter(1),
            GestureOperand.Parameter(3),
        ),
    ),
    QUICK_JS_TOP_ROW_PRESS(
        feature = GboardGestureFamilyFeature.TOP_ROW_SWIPE,
        order = 200,
        call = RuntimeCallId.TOP_ROW_SWIPE_RUNTIME_MAYBE_CONSUME_QUICK_JS_TOP_ROW_PRESS,
        operands = listOf(
            GestureOperand.Receiver,
            GestureOperand.Parameter(0),
            GestureOperand.Parameter(1),
            GestureOperand.Parameter(2),
            GestureOperand.Parameter(3),
        ),
    ),
    ZHUYIN_TOGGLE(
        feature = GboardGestureFamilyFeature.ZHUYIN_TOGGLE,
        order = 300,
        call = RuntimeCallId.ZHUYIN_TRADITIONAL_SIMPLIFIED_TOGGLE_RUNTIME_MAYBE_TOGGLE,
        operands = listOf(
            GestureOperand.Receiver,
            GestureOperand.Parameter(1),
            GestureOperand.Parameter(3),
        ),
    ),
}

internal fun interface GboardGestureFamilyTransformation {
    fun apply(
        ownerClass: MutableClass,
        selectedFeatures: Collection<GboardGestureFamilyFeature>,
        targets: GestureFamilyTargets,
    )
}

internal val gboardGestureFamilyTransformation = GboardGestureFamilyTransformation {
        ownerClass,
        features,
        targets,
    ->
    if (features.isEmpty()) return@GboardGestureFamilyTransformation
    val selected = features.toSet()
    check(selected.size == features.size) { "Duplicate Gesture-family feature intent" }

    val plan = GboardGestureFamilyTransformationPlan.preflight(ownerClass, selected, targets)
    plan.commit()
}

private val gboardGestureFamilyComposerPatch = bytecodePatch(
    description = "Compose selected Gboard gesture dispatch policies in one verified transformation.",
) {
    compatibleWith(gboardCompatibility18_8())
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute { }

    finalize {
        val selected = GboardGestureFamilyFeatureSelections.take(this)
        if (selected.isEmpty()) return@finalize
        val targets = gestureFamilyTargets(this)
        gboardGestureFamilyTransformation.apply(
            targets.dispatch.ownerClass(this),
            selected,
            targets,
        )
    }
}

internal fun gboardGestureFamilyFeaturePatch(
    description: String,
    feature: GboardGestureFamilyFeature,
) = bytecodePatch(description = description) {
    compatibleWith(gboardCompatibility18_8())
    dependsOn(gboardGestureFamilyComposerPatch)

    execute {
        GboardGestureFamilyFeatureSelections.add(this, feature)
    }
}

internal class GboardGestureFamilySelectionStore<K : Any> {
    private val selectedByContext = WeakHashMap<K, MutableSet<GboardGestureFamilyFeature>>()

    @Synchronized
    fun add(context: K, feature: GboardGestureFamilyFeature) {
        selectedByContext.getOrPut(context) { linkedSetOf() }.add(feature)
    }

    @Synchronized
    fun take(context: K): Collection<GboardGestureFamilyFeature> =
        selectedByContext.remove(context).orEmpty()
}

private object GboardGestureFamilyFeatureSelections {
    private val store = GboardGestureFamilySelectionStore<BytecodePatchContext>()

    fun add(context: BytecodePatchContext, feature: GboardGestureFamilyFeature) =
        store.add(context, feature)

    fun take(context: BytecodePatchContext): Collection<GboardGestureFamilyFeature> =
        store.take(context)
}

private data class GestureRegisterLayout(
    val parameterWordOffsets: List<Int>,
    val rangeRegisterCount: Int,
) {
    val rangeEndParameterRegister: Int get() = rangeRegisterCount - 1
    val helperRegisterCount: Int get() = rangeRegisterCount + 1

    fun render(operands: List<GestureOperand>): String = operands.joinToString(", ") { operand ->
        when (operand) {
            GestureOperand.Receiver -> "p0"
            is GestureOperand.Parameter -> "p${parameterWordOffsets[operand.index]}"
        }
    }

    companion object {
        fun from(binding: GboardMethodTarget): GestureRegisterLayout {
            var nextWord = 1
            val offsets = binding.parameterTypes.map { type ->
                nextWord.also { nextWord += type.registerWidth() }
            }
            return GestureRegisterLayout(offsets, nextWord)
        }
    }
}

private data class GboardGestureFamilyTransformationPlan(
    val ownerClass: MutableClass,
    val committedMethods: Set<MutableMethod>?,
) {
    fun commit() {
        val methods = committedMethods ?: return
        ownerClass.methods.clear()
        ownerClass.methods.addAll(methods)
    }

    companion object {
        fun preflight(
            ownerClass: MutableClass,
            selected: Set<GboardGestureFamilyFeature>,
            targets: GestureFamilyTargets,
        ): GboardGestureFamilyTransformationPlan {
            selected.verifyCanonicalGestureStages()
            val target = ownerClass.resolveGestureTargetForPreflight(targets)
            val layout = target.requireGestureTargetShape(targets)
            ownerClass.verifyGestureBindingRelations(targets)
            selected.verifyGestureRuntimeAbis(layout)

            if (ownerClass.hasAnyGestureFamilyState(target, targets)) {
                ownerClass.verifyExactGestureFamilyState(selected, layout, targets)
                return GboardGestureFamilyTransformationPlan(ownerClass, null)
            }

            target.requireSupportedGestureStock(targets)
            val candidate = MutableClass(ownerClass)
            candidate.applySelectedGestureFamily(selected, layout, targets)
            candidate.verifyExactGestureFamilyState(selected, layout, targets)

            val candidateTarget = targets.dispatch.resolve(candidate)
            val candidateHelpers = candidate.methods.filter { method ->
                method.name in GESTURE_HELPER_NAMES
            }
            val committed = LinkedHashSet(ownerClass.methods).apply {
                remove(target)
                removeAll { method -> method.name in GESTURE_HELPER_NAMES }
                add(MutableMethod(candidateTarget))
                candidateHelpers.mapTo(this) { method -> MutableMethod(method) }
            }
            return GboardGestureFamilyTransformationPlan(ownerClass, committed)
        }
    }
}

private fun MutableClass.resolveGestureTargetForPreflight(
    targets: GestureFamilyTargets,
): MutableMethod {
    val binding = targets.dispatch
    val exact = methods.filter(binding::matches)
    check(exact.size <= 1) { "Ambiguous gesture dispatch target: ${binding.reference}" }
    exact.singleOrNull()?.let { return it }

    val nearMisses = methods.filter { method ->
        method.definingClass == binding.ownerDescriptor && method.name == binding.name
    }
    check(nearMisses.isEmpty()) {
        val actual = nearMisses.joinToString { method ->
            "(${method.parameterTypes.joinToString("")})${method.returnType}"
        }
        "Gesture dispatch prototype drift: expected ${binding.reference}, found $actual"
    }
    error("Could not find ${binding.reference}")
}

private fun MutableMethod.requireGestureTargetShape(
    targets: GestureFamilyTargets,
): GestureRegisterLayout {
    val binding = targets.dispatch
    check(
        binding.matches(this) &&
            accessFlags == GESTURE_TARGET_ACCESS_FLAGS &&
            implementation != null
    ) {
        "Unexpected gesture dispatch target shape: $definingClass->$name"
    }
    val layout = GestureRegisterLayout.from(binding)
    check(implementation!!.registerCount == layout.rangeRegisterCount) {
        "Gesture dispatch register layout drift: expected ${layout.rangeRegisterCount}, " +
            "found ${implementation!!.registerCount}"
    }
    return layout
}

private fun MutableClass.verifyGestureBindingRelations(targets: GestureFamilyTargets) {
    val dispatch = targets.dispatch
    val field = targets.stockDelegateField
    val stock = targets.stockDispatch

    check(field.ownerDescriptor == dispatch.ownerDescriptor) {
        "Gesture stock field owner does not match gesture dispatch owner"
    }
    check(field.type == stock.ownerDescriptor) {
        "Gesture stock field type does not match stock dispatch owner"
    }
    check(stock.parameterTypes == dispatch.parameterTypes && stock.returnType == dispatch.returnType) {
        "Gesture stock dispatch prototype does not match gesture dispatch"
    }

    val exactFields = fields.filter(field::matches)
    check(
        exactFields.size == 1 &&
            exactFields.single().accessFlags == GESTURE_STOCK_FIELD_ACCESS_FLAGS
    ) { "Could not uniquely resolve exact instance field ${field.reference}" }
}

private fun Set<GboardGestureFamilyFeature>.verifyCanonicalGestureStages() {
    val orders = GboardGestureFamilyStage.entries.map(GboardGestureFamilyStage::order)
    check(orders.size == orders.distinct().size) { "Duplicate Gesture-family stage order" }
    check(
        GboardGestureFamilyStage.entries.map(GboardGestureFamilyStage::feature).toSet() ==
            GboardGestureFamilyFeature.entries.toSet()
    ) {
        "Incomplete Gesture-family feature inventory"
    }
    check(GboardGestureFamilyStage.entries.any { stage -> stage.feature in this }) {
        "Selected Gesture-family feature has no canonical stage"
    }
}

private fun Set<GboardGestureFamilyFeature>.verifyGestureRuntimeAbis(
    layout: GestureRegisterLayout,
) {
    selectedGestureStages().forEach { stage ->
        val abi = RuntimeAbiCatalog.abi(stage.call)
        check(
            abi.parameters == List(stage.operands.size) { "Ljava/lang/Object;" } &&
                abi.returnType == "Z"
        ) { "Unexpected Gesture Runtime ABI for ${stage.call}: ${abi.reference}" }
        emitGestureRuntimeCall(stage.call, layout.render(stage.operands))
    }
}

private fun Set<GboardGestureFamilyFeature>.selectedGestureStages():
    List<GboardGestureFamilyStage> =
    GboardGestureFamilyStage.entries
        .filter { stage -> stage.feature in this }
        .sortedBy(GboardGestureFamilyStage::order)

// 18.0.3, 18.5.4, 18.6.3 and 18.8.0 all compile the stock boundary to the same three-instruction
// forward (iget-object / invoke-interface-range / return-void), so the exact shape below is what
// decides support. A version allowlist here would reject a retargeted build whose gesture bindings
// already describe it.
private fun MutableMethod.requireSupportedGestureStock(targets: GestureFamilyTargets) {
    requireExactGestureStockShape(targets)
}

private fun MutableMethod.requireExactGestureStockShape(targets: GestureFamilyTargets) {
    val implementation = implementation
        ?: error("No instructions in the gesture dispatch target")
    val instructions = implementation.instructions
    val layout = GestureRegisterLayout.from(targets.dispatch)
    val fieldRead = instructions.getOrNull(0) as? TwoRegisterInstruction
    val field = (instructions.getOrNull(0) as? ReferenceInstruction)
        ?.reference as? FieldReference
    val dispatch = instructions.getOrNull(1) as? RegisterRangeInstruction
    val dispatchReference = (instructions.getOrNull(1) as? ReferenceInstruction)
        ?.reference as? MethodReference
    check(
        accessFlags == GESTURE_TARGET_ACCESS_FLAGS &&
            implementation.registerCount == layout.rangeRegisterCount &&
            instructions.size == 3 &&
            instructions[0].opcode == Opcode.IGET_OBJECT &&
            fieldRead != null && fieldRead.registerA == 0 && fieldRead.registerB == 0 &&
            field != null && targets.stockDelegateField.matches(field) &&
            instructions[1].opcode == Opcode.INVOKE_INTERFACE_RANGE &&
            dispatch != null && dispatch.startRegister == 0 &&
            dispatch.registerCount == layout.rangeRegisterCount &&
            dispatchReference != null &&
            targets.stockDispatch.matches(dispatchReference) &&
            instructions[2].opcode == Opcode.RETURN_VOID
    ) {
        "Gesture stock forwarding boundary drift in $definingClass->$name"
    }
}

private fun MutableClass.hasAnyGestureFamilyState(
    target: MutableMethod,
    targets: GestureFamilyTargets,
): Boolean =
    methods.any { method -> method.name in GESTURE_HELPER_NAMES } ||
        methods.any { method ->
            method.implementation?.instructions.orEmpty().any { instruction ->
                instruction.gestureRuntimeCallNearMatch() != null ||
                    instruction.gestureHelperCallName(targets) != null
            }
        } ||
        target.implementation!!.instructions.any { instruction ->
            instruction.gestureHelperCallName(targets) != null
        }

private fun MutableClass.applySelectedGestureFamily(
    selected: Set<GboardGestureFamilyFeature>,
    layout: GestureRegisterLayout,
    targets: GestureFamilyTargets,
) {
    if (GboardGestureFamilyFeature.ZHUYIN_TOGGLE in selected) {
        addGestureHelper(TOGGLE_HELPER_NAME, layout, renderToggleHelperBody(layout, targets), targets)
    }
    if (GboardGestureFamilyFeature.TOP_ROW_SWIPE in selected) {
        addGestureHelper(
            TOP_ROW_HELPER_NAME,
            layout,
            renderTopRowHelperBody(
                layout = layout,
                includeToggle = GboardGestureFamilyFeature.ZHUYIN_TOGGLE in selected,
                targets = targets,
            ),
            targets,
        )
    }
    if (GboardGestureFamilyFeature.LONG_PRESS_QUICK_ACTIONS in selected) {
        addGestureHelper(
            LONG_PRESS_HELPER_NAME,
            layout,
            renderLongPressHelperBody(selected, layout, targets),
            targets,
        )
    }

    val target = targets.dispatch.resolve(this)
    target.addInstructions(0, renderGestureOwnerWrapper(selected, layout, targets))
}

private fun renderLongPressHelperBody(
    selected: Set<GboardGestureFamilyFeature>,
    layout: GestureRegisterLayout,
    targets: GestureFamilyTargets,
): String {
    val stage = GboardGestureFamilyStage.LONG_PRESS_QUICK_ACTIONS
    val nextHelper = when {
        GboardGestureFamilyFeature.TOP_ROW_SWIPE in selected -> TOP_ROW_HELPER_NAME
        GboardGestureFamilyFeature.ZHUYIN_TOGGLE in selected -> TOGGLE_HELPER_NAME
        else -> null
    }
    val continuation = if (nextHelper == null) {
        renderStockGestureDispatch(layout, targets)
    } else {
        """
            invoke-direct/range {p0 .. p${layout.rangeEndParameterRegister}}, ${targets.dispatch.referenceNamed(nextHelper)}

            return-void
        """.trimIndent()
    }
    return """
        ${emitGestureRuntimeCall(stage.call, layout.render(stage.operands))}

        move-result v0

        if-nez v0, :cond_return

        $continuation

        :cond_return
        return-void
    """.trimIndent()
}

private fun MutableClass.addGestureHelper(
    name: String,
    layout: GestureRegisterLayout,
    body: String,
    targets: GestureFamilyTargets,
) {
    addHelperMethodIfMissing(
        name = name,
        parameterTypes = targets.dispatch.parameterTypes,
        returnType = targets.dispatch.returnType,
        accessFlags = GESTURE_HELPER_ACCESS_FLAGS,
        registerCount = layout.helperRegisterCount,
        body = body,
    )
}

private fun renderGestureOwnerWrapper(
    selected: Set<GboardGestureFamilyFeature>,
    layout: GestureRegisterLayout,
    targets: GestureFamilyTargets,
): String {
    val entryHelper = selected.entryHelperName()
    return """
        invoke-direct/range {p0 .. p${layout.rangeEndParameterRegister}}, ${targets.dispatch.referenceNamed(entryHelper)}

        return-void
    """.trimIndent()
}

private fun renderTopRowHelperBody(
    layout: GestureRegisterLayout,
    includeToggle: Boolean,
    targets: GestureFamilyTargets,
): String {
    val stages = GboardGestureFamilyStage.entries.filter { stage ->
        stage.feature == GboardGestureFamilyFeature.TOP_ROW_SWIPE
    }.sortedBy(GboardGestureFamilyStage::order)
    val swipe = stages[0]
    val quickJs = stages[1]
    val continuationLabel = if (includeToggle) ":cond_dispatch_or_toggle" else ":cond_dispatch_stock"
    val continuation = if (includeToggle) {
        """
            invoke-direct/range {p0 .. p${layout.rangeEndParameterRegister}}, ${targets.dispatch.referenceNamed(TOGGLE_HELPER_NAME)}

            return-void
        """.trimIndent()
    } else {
        renderStockGestureDispatch(layout, targets)
    }

    return """
        ${emitGestureRuntimeCall(swipe.call, layout.render(swipe.operands))}

        move-result v0

        if-nez v0, :cond_return

        ${emitGestureRuntimeCall(quickJs.call, layout.render(quickJs.operands))}

        move-result v0

        if-eqz v0, $continuationLabel

        :cond_return
        return-void

        $continuationLabel
        $continuation
    """.trimIndent()
}

private fun renderToggleHelperBody(
    layout: GestureRegisterLayout,
    targets: GestureFamilyTargets,
): String {
    val toggle = GboardGestureFamilyStage.entries.single { stage ->
        stage.feature == GboardGestureFamilyFeature.ZHUYIN_TOGGLE
    }
    return """
        ${emitGestureRuntimeCall(toggle.call, layout.render(toggle.operands))}

        move-result v0

        if-nez v0, :cond_return

        ${renderStockGestureDispatch(layout, targets, includeReturn = false)}

        :cond_return
        return-void
    """.trimIndent()
}

private fun renderStockGestureDispatch(
    layout: GestureRegisterLayout,
    targets: GestureFamilyTargets,
    includeReturn: Boolean = true,
): String = buildString {
    append("iget-object p0, p0, ")
        .append(targets.stockDelegateField.reference)
        .append("\n\n")
    append("invoke-interface/range {p0 .. p")
        .append(layout.rangeEndParameterRegister)
        .append("}, ")
        .append(targets.stockDispatch.reference)
    if (includeReturn) append("\n\nreturn-void")
}

private fun Set<GboardGestureFamilyFeature>.entryHelperName(): String =
    when {
        GboardGestureFamilyFeature.LONG_PRESS_QUICK_ACTIONS in this -> LONG_PRESS_HELPER_NAME
        GboardGestureFamilyFeature.TOP_ROW_SWIPE in this -> TOP_ROW_HELPER_NAME
        else -> TOGGLE_HELPER_NAME
    }

private fun MutableClass.verifyExactGestureFamilyState(
    selected: Set<GboardGestureFamilyFeature>,
    layout: GestureRegisterLayout,
    targets: GestureFamilyTargets,
) {
    val target = resolveGestureTargetForPreflight(targets)
    val expectedHelperNames = buildSet {
        if (GboardGestureFamilyFeature.LONG_PRESS_QUICK_ACTIONS in selected) {
            add(LONG_PRESS_HELPER_NAME)
        }
        if (GboardGestureFamilyFeature.TOP_ROW_SWIPE in selected) add(TOP_ROW_HELPER_NAME)
        if (GboardGestureFamilyFeature.ZHUYIN_TOGGLE in selected) add(TOGGLE_HELPER_NAME)
    }
    val actualHelpers = methods.filter { method -> method.name in GESTURE_HELPER_NAMES }
    check(actualHelpers.mapTo(linkedSetOf()) { method -> method.name } == expectedHelperNames) {
        "Gesture-family patched selection mismatch: expected $expectedHelperNames, " +
            "found ${actualHelpers.map { method -> method.name }}"
    }
    check(actualHelpers.size == expectedHelperNames.size) { "Duplicate Gesture-family helper" }
    actualHelpers.forEach { helper ->
        check(
            helper.parameterTypes == targets.dispatch.parameterTypes &&
                helper.returnType == targets.dispatch.returnType &&
                helper.accessFlags == GESTURE_HELPER_ACCESS_FLAGS &&
                helper.implementation?.registerCount == layout.helperRegisterCount
        ) { "Malformed Gesture-family helper ${helper.name}" }
    }

    target.requireExactGestureWrapper(selected, layout, targets)
    methods.filter { method -> method !== target && method.name !in GESTURE_HELPER_NAMES }
        .forEach { method ->
            check(
                method.implementation?.instructions.orEmpty().none { instruction ->
                    instruction.gestureRuntimeCallNearMatch() != null ||
                        instruction.gestureHelperCallName(targets) != null
                }
            ) { "Extraneous Gesture-family call outside managed target/helpers" }
        }

    val normalized = MutableClass(this)
    normalized.methods.removeAll { method -> method.name in GESTURE_HELPER_NAMES }
    val normalizedTarget = targets.dispatch.resolve(normalized)
    normalizedTarget.implementation!!.removeInstruction(1)
    normalizedTarget.implementation!!.removeInstruction(0)
    normalizedTarget.requireSupportedGestureStock(targets)
    check(
        normalized.methods.all { method ->
            method.implementation?.instructions.orEmpty().none { instruction ->
                instruction.gestureRuntimeCallNearMatch() != null ||
                    instruction.gestureHelperCallName(targets) != null
            }
        }
    ) { "Extraneous Gesture-family state after normalization" }

    val expected = MutableClass(normalized)
    expected.applySelectedGestureFamily(selected, layout, targets)
    val expectedTarget = targets.dispatch.resolve(expected)
    check(target.gboardStructuralFingerprint() == expectedTarget.gboardStructuralFingerprint()) {
        "Malformed Gesture-family target wrapper"
    }
    val expectedHelpers = expected.methods
        .filter { method -> method.name in GESTURE_HELPER_NAMES }
        .associate { method -> method.name to method.gboardStructuralFingerprint() }
    val actualHelperFingerprints = actualHelpers.associate { method ->
        method.name to method.gboardStructuralFingerprint()
    }
    check(actualHelperFingerprints == expectedHelpers) {
        "Malformed Gesture-family helper order, registers, or calls"
    }
}

private fun MutableMethod.requireExactGestureWrapper(
    selected: Set<GboardGestureFamilyFeature>,
    layout: GestureRegisterLayout,
    targets: GestureFamilyTargets,
) {
    val instructions = implementation!!.instructions
    check(instructions.size >= 2) { "Gesture-family wrapper is incomplete" }
    val invoke = instructions[0]
    val reference = (invoke as? ReferenceInstruction)?.reference as? MethodReference
    val range = invoke as? RegisterRangeInstruction
    val expectedStart = implementation!!.registerCount - layout.rangeRegisterCount
    check(
        invoke.opcode == Opcode.INVOKE_DIRECT_RANGE &&
            reference != null &&
            reference.definingClass == targets.dispatch.ownerDescriptor &&
            reference.name == selected.entryHelperName() &&
            reference.parameterTypes == targets.dispatch.parameterTypes &&
            reference.returnType == targets.dispatch.returnType &&
            range?.startRegister == expectedStart &&
            range.registerCount == layout.rangeRegisterCount &&
            instructions[1].opcode == Opcode.RETURN_VOID
    ) { "Malformed Gesture-family wrapper range, target, or return" }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction
    .gestureRuntimeCallNearMatch(): RuntimeCallId? {
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    return ALL_GESTURE_RUNTIME_CALLS.firstOrNull { call ->
        val abi = RuntimeAbiCatalog.abi(call)
        reference.definingClass == abi.owner && reference.name == abi.name
    }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction
    .gestureHelperCallName(targets: GestureFamilyTargets): String? {
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    return reference.name.takeIf { name ->
        reference.definingClass == targets.dispatch.ownerDescriptor &&
            name in GESTURE_HELPER_NAMES
    }
}

private fun String.registerWidth(): Int = when (this) {
    "J", "D" -> 2
    "V" -> error("Void is not a valid gesture parameter type")
    else -> 1
}

private fun emitGestureRuntimeCall(call: RuntimeCallId, registers: String): String {
    check(call in ALL_GESTURE_RUNTIME_CALLS) {
        "Runtime call $call does not belong to the Gesture family target"
    }
    return RuntimeCallEmitter.invoke(call, registers)
}

private val ALL_GESTURE_RUNTIME_CALLS = GboardGestureFamilyStage.entries
    .mapTo(linkedSetOf(), GboardGestureFamilyStage::call)
