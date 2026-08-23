package dev.jason.gboardpatches.patches.gboard.shared

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import java.util.WeakHashMap

internal fun interface GboardPointerOwnerTransformation {
    fun apply(
        context: GboardPointerOwnerTransformationContext,
        selectedFeatures: Collection<GboardPointerOwnerFeatureSpec>,
    )
}

internal enum class GboardPointerOwnerFeature {
    ENGLISH_QWERTY,
    LONG_PRESS_QUICK_ACTIONS,
    TOP_ROW_SWIPE,
    ZHUYIN_SLIDE,
}

internal data class GboardPointerOwnerFeatureSpec(
    val feature: GboardPointerOwnerFeature,
    val transformation: GboardPointerOwnerTransformationAdapter,
)

internal fun interface GboardPointerOwnerTransformationAdapter {
    fun apply(context: GboardPointerOwnerTransformationContext)
}

internal val gboardPointerOwnerTransformation = GboardPointerOwnerTransformation { context, specs ->
    val selected = specs.associateBy { spec -> spec.feature }
    check(selected.size == specs.size) { "Duplicate pointer-owner feature intent" }
    if (context.hasAnyTransformationState()) {
        context.verifyCompleteTransformation(selected.keys)
        return@GboardPointerOwnerTransformation
    }
    selected.values.sortedBy { spec -> spec.feature.ordinal }.forEach { spec ->
        spec.transformation.apply(context)
    }
    context.verifyCompleteTransformation(selected.keys)
}

private val gboardPointerOwnerComposerPatch = bytecodePatch(
    description = "Compose the 17.7.7 pointer-owner feature transformations in a verified order.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute { }

    finalize {
        val selected = GboardPointerOwnerFeatureSelections.take(this)
        if (selected.isEmpty()) return@finalize
        gboardPointerOwnerTransformation.apply(
            GboardPointerOwnerTransformationContext.from(this),
            selected,
        )
    }
}

internal fun gboardPointerOwnerFeaturePatch(
    description: String,
    spec: GboardPointerOwnerFeatureSpec,
) = bytecodePatch(description = description) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPointerOwnerComposerPatch)

    execute {
        GboardPointerOwnerFeatureSelections.add(this, spec)
    }
}

private object GboardPointerOwnerFeatureSelections {
    private val selectedByContext = WeakHashMap<
        BytecodePatchContext,
        MutableMap<GboardPointerOwnerFeature, GboardPointerOwnerFeatureSpec>
    >()

    @Synchronized
    fun add(context: BytecodePatchContext, spec: GboardPointerOwnerFeatureSpec) {
        val selected = selectedByContext.getOrPut(context) { linkedMapOf() }
        val existing = selected.putIfAbsent(spec.feature, spec)
        check(existing == null || existing == spec) {
            "Conflicting pointer-owner feature spec for ${spec.feature}"
        }
    }

    @Synchronized
    fun take(context: BytecodePatchContext): Collection<GboardPointerOwnerFeatureSpec> =
        selectedByContext.remove(context)?.values.orEmpty()
}

internal class GboardPointerOwnerTransformationContext private constructor(
    val ownerClass: MutableClass,
    pointerOwnerMethod: MutableMethod,
) {
    var pointerOwnerMethod: MutableMethod = pointerOwnerMethod
        private set

    val pointerFinishMethod: MutableMethod by lazy {
        ownerClass.findMethod(
            name = "r",
            returnType = "V",
            parameterTypes = listOf("J", "I"),
        )
    }
    val pointerCancelMethod: MutableMethod by lazy {
        GboardVersionBindings.pointerCancel.resolve(ownerClass)
    }
    val pointerResetMethod: MutableMethod by lazy {
        GboardVersionBindings.pointerReset.resolve(ownerClass)
    }

    fun replacePointerOwnerMethod(replacement: MutableMethod) {
        if (replacement === pointerOwnerMethod) return
        check(ownerClass.methods.remove(pointerOwnerMethod) && ownerClass.methods.add(replacement)) {
            "Could not replace expanded pointer owner method"
        }
        pointerOwnerMethod = replacement
    }

    companion object {
        fun from(context: BytecodePatchContext): GboardPointerOwnerTransformationContext =
            from(GboardVersionBindings.pointerOwner.ownerClass(context))

        fun from(ownerClass: MutableClass): GboardPointerOwnerTransformationContext =
            GboardPointerOwnerTransformationContext(
                ownerClass = ownerClass,
                pointerOwnerMethod = GboardVersionBindings.pointerOwner.resolve(ownerClass),
            )
    }
}

private fun MutableClass.findMethod(
    name: String,
    returnType: String,
    parameterTypes: List<String>,
): MutableMethod = methods.firstOrNull { method ->
    method.name == name && method.returnType == returnType && method.parameterTypes == parameterTypes
} ?: error("Could not find $type->$name(${parameterTypes.joinToString("")})$returnType")

private fun GboardPointerOwnerTransformationContext.hasAnyTransformationState(): Boolean =
    ownerClass.fields.any { field -> field.name == ENGLISH_ANCHOR_FIELD_NAME } ||
        ownerClass.methods.any { method -> method.name in ENGLISH_HELPER_METHOD_NAMES } ||
        ownerClass.methods.any { method ->
            ALL_TRANSFORMATION_CALLS.any { descriptor -> method.countCalls(descriptor) > 0 }
        }

private fun GboardPointerOwnerTransformationContext.verifyCompleteTransformation(
    selected: Set<GboardPointerOwnerFeature>,
) {
    val hasLongPress = GboardPointerOwnerFeature.LONG_PRESS_QUICK_ACTIONS in selected
    val expectedRegisterCount = if (hasLongPress) {
        GboardPointerOwner1777RegisterContract.expandedRegisterCount
    } else {
        GboardPointerOwner1777RegisterContract.stockRegisterCount
    }
    check(pointerOwnerMethod.implementation?.registerCount == expectedRegisterCount) {
        "Incomplete 17.7.7 pointer-owner transformation: unexpected register count"
    }
    val hasEnglish = GboardPointerOwnerFeature.ENGLISH_QWERTY in selected
    val expectedEnglishMemberCount = if (hasEnglish) 1 else 0
    check(ownerClass.fields.count { field -> field.name == ENGLISH_ANCHOR_FIELD_NAME } ==
        expectedEnglishMemberCount &&
        ownerClass.fields.count { field ->
            field.name == ENGLISH_ANCHOR_FIELD_NAME &&
                field.type == SOFT_KEY_VIEW_TYPE &&
                field.accessFlags == AccessFlags.PRIVATE.value
        } == expectedEnglishMemberCount) {
        "Incomplete 17.7.7 pointer-owner transformation: English anchor field"
    }
    ENGLISH_HELPER_METHODS.forEach { helper ->
        val matching = ownerClass.methods.filter { method ->
            method.name == helper.name &&
                method.parameterTypes == helper.parameterTypes &&
                method.returnType == helper.returnType
        }
        check(ownerClass.methods.count { method -> method.name == helper.name } ==
            expectedEnglishMemberCount && matching.size == expectedEnglishMemberCount) {
            "Incomplete 17.7.7 pointer-owner transformation: English helper ${helper.name}"
        }
        if (hasEnglish) {
            val method = matching.single()
            check(method.accessFlags == helper.accessFlags) {
                "Malformed 17.7.7 English helper access flags: ${helper.name}"
            }
            check(method.gboardStructuralFingerprint() == helper.fingerprint) {
                "Malformed 17.7.7 English helper implementation: ${helper.name}"
            }
        }
    }
    verifyPointerOwnerCalls(selected)
    if (hasLongPress) verifyLongPressEntryCopies()
    verifyCleanupCalls(selected)
}

private fun GboardPointerOwnerTransformationContext.verifyLongPressEntryCopies() {
    val instructions = pointerOwnerMethod.implementation!!.instructions
    val expected = listOf(
        Triple(Opcode.MOVE_OBJECT_FROM16, 14, 21),
        Triple(Opcode.MOVE_OBJECT_FROM16, 15, 22),
        Triple(Opcode.MOVE_FROM16, 16, 23),
        Triple(Opcode.MOVE_FROM16, 17, 24),
        Triple(Opcode.MOVE_WIDE_FROM16, 18, 25),
        Triple(Opcode.MOVE_FROM16, 20, 27),
    )
    check(expected.withIndex().all { (index, copy) ->
        val instruction = instructions.getOrNull(index) as? TwoRegisterInstruction
            ?: return@all false
        instruction.opcode == copy.first &&
            instruction.registerA == copy.second &&
            instruction.registerB == copy.third
    }) { "Malformed 17.7.7 Long-press pointer-owner entry copies" }
}

private fun GboardPointerOwnerTransformationContext.verifyPointerOwnerCalls(
    selected: Set<GboardPointerOwnerFeature>,
) {
    val ownerCalls = pointerOwnerMethod.transformationCallIndices()
    val expectedCallCounts = mapOf(
        ENGLISH_OWNER_CALL to if (GboardPointerOwnerFeature.ENGLISH_QWERTY in selected) 1 else 0,
        LONG_PRESS_OWNER_CALL to if (GboardPointerOwnerFeature.LONG_PRESS_QUICK_ACTIONS in selected) {
            1 + if (GboardPointerOwnerFeature.ENGLISH_QWERTY in selected) 1 else 0
        } else 0,
        TOP_ROW_OWNER_CALL to if (GboardPointerOwnerFeature.TOP_ROW_SWIPE in selected) 1 else 0,
        ZHUYIN_OWNER_CALL to if (GboardPointerOwnerFeature.ZHUYIN_SLIDE in selected) 1 else 0,
    )
    expectedCallCounts.forEach { (descriptor, count) ->
        check(ownerCalls.count { (_, actual) -> actual == descriptor } == count) {
            "Malformed 17.7.7 pointer-owner call count for ${descriptor.render()}"
        }
    }
    val rIndex = pointerOwnerMethod.indexOfFirstMethodCall("Lpbl;", "r", "V", listOf("J", "I"))
    val acIndex = pointerOwnerMethod.indexOfFirstMethodCall("Lpbl;", "ac", "V", emptyList())
    check(rIndex >= 0 && acIndex > rIndex) { "Malformed 17.7.7 pointer-owner anchors" }
    val englishIndex = ownerCalls.singleIndexOrNull(ENGLISH_OWNER_CALL)
    val zhuyinIndex = ownerCalls.singleIndexOrNull(ZHUYIN_OWNER_CALL)
    check(englishIndex == null || englishIndex < rIndex)
    check(zhuyinIndex == null || zhuyinIndex < rIndex)
    check(englishIndex == null || zhuyinIndex == null || englishIndex < zhuyinIndex)
    val topRowIndex = ownerCalls.singleIndexOrNull(TOP_ROW_OWNER_CALL)
    check(topRowIndex == null || topRowIndex == acIndex + 1)
    ownerCalls.filter { (_, descriptor) -> descriptor == LONG_PRESS_OWNER_CALL }
        .forEach { (index, _) ->
            check(pointerOwnerMethod.implementation!!.instructions[index] is RegisterRangeInstruction)
            val invoke = pointerOwnerMethod.implementation!!.instructions[index] as RegisterRangeInstruction
            check(invoke.startRegister == GboardPointerOwner1777RegisterContract.expandedP0Register)
            check(invoke.registerCount == 2)
            check(pointerOwnerMethod.implementation!!.instructions[index + 1].opcode == Opcode.RETURN_VOID)
        }
    listOfNotNull(englishIndex, zhuyinIndex, topRowIndex).forEach { index ->
        val invoke = pointerOwnerMethod.implementation!!.instructions[index] as FiveRegisterInstruction
        val expected = when (index) {
            topRowIndex -> listOf(14, 15, 3, 0, 1)
            else -> listOf(14, 15, 0, 1)
        }
        check(invoke.registers() == expected) { "Malformed pointer-owner register wiring" }
    }
}

private fun GboardPointerOwnerTransformationContext.verifyCleanupCalls(
    selected: Set<GboardPointerOwnerFeature>,
) {
    val hasEnglish = GboardPointerOwnerFeature.ENGLISH_QWERTY in selected
    val hasTopRow = GboardPointerOwnerFeature.TOP_ROW_SWIPE in selected
    val hasZhuyin = GboardPointerOwnerFeature.ZHUYIN_SLIDE in selected
    val allMethods = ownerClass.methods
    check(allMethods.sumOf { method -> method.countCalls(TOP_ROW_FINISH_CALL) } ==
        if (hasTopRow) pointerFinishMethod.returnInstructionIndices().size else 0)
    if (hasTopRow) {
        pointerFinishMethod.verifyCallImmediatelyBeforeReturns(TOP_ROW_FINISH_CALL)
    }
    mapOf(
        ENGLISH_CLEAR_CALL to hasEnglish,
        ZHUYIN_CLEAR_CALL to hasZhuyin,
    ).forEach { (descriptor, enabled) ->
        check(allMethods.sumOf { method -> method.countCalls(descriptor) } == if (enabled) 2 else 0)
    }
    check(allMethods.sumOf { method -> method.countCalls(TOP_ROW_CLEAR_CALL) } == if (hasTopRow) {
        pointerCancelMethod.returnInstructionIndices().size + 1
    } else 0)
    if (!hasEnglish && !hasTopRow && !hasZhuyin) return

    if (hasTopRow) {
        pointerCancelMethod.verifyCallImmediatelyBeforeReturns(TOP_ROW_CLEAR_CALL)
    }
    val expectedCancelEntry = buildList {
        if (hasZhuyin) add(ZHUYIN_CLEAR_CALL)
        if (hasEnglish) add(ENGLISH_CLEAR_CALL)
    }
    val expectedCancelOrder = buildList {
        if (hasZhuyin) add(ZHUYIN_CLEAR_CALL)
        if (hasEnglish) add(ENGLISH_CLEAR_CALL)
        if (hasTopRow) add(TOP_ROW_CLEAR_CALL)
    }
    val expectedResetOrder = buildList {
        if (hasZhuyin) add(ZHUYIN_CLEAR_CALL)
        if (hasTopRow) add(TOP_ROW_CLEAR_CALL)
        if (hasEnglish) add(ENGLISH_CLEAR_CALL)
    }
    pointerCancelMethod.verifyEntryCalls(expectedCancelEntry)
    pointerResetMethod.verifyEntryCalls(expectedResetOrder)
    check(pointerCancelMethod.transformationCallIndices().map { it.second } == expectedCancelOrder)
    check(pointerResetMethod.transformationCallIndices().map { it.second } == expectedResetOrder)
}

private fun MutableMethod.verifyCallImmediatelyBeforeReturns(descriptor: MethodCall) {
    val instructions = implementation!!.instructions
    check(returnInstructionIndices().all { returnIndex ->
        instructions.getOrNull(returnIndex - 1).methodReference()?.matches(descriptor) == true
    }) {
        "Cleanup ${descriptor.render()} must immediately precede every return in $definingClass->$name"
    }
}

private fun MutableMethod.verifyEntryCalls(expected: List<MethodCall>) {
    val instructions = implementation!!.instructions
    check(expected.withIndex().all { (index, descriptor) ->
        instructions.getOrNull(index).methodReference()?.matches(descriptor) == true
    }) { "Malformed entry cleanup placement in $definingClass->$name" }
}

private fun MutableMethod.countCalls(descriptor: MethodCall): Int =
    implementation?.instructions.orEmpty().count { instruction ->
        instruction.methodReference()?.matches(descriptor) == true
    }

private fun MutableMethod.transformationCallIndices(): List<Pair<Int, MethodCall>> =
    implementation?.instructions.orEmpty().mapIndexedNotNull { index, instruction ->
        val reference = instruction.methodReference() ?: return@mapIndexedNotNull null
        val descriptor = ALL_TRANSFORMATION_CALLS.firstOrNull(reference::matches)
            ?: return@mapIndexedNotNull null
        index to descriptor
    }

private fun List<Pair<Int, MethodCall>>.singleIndexOrNull(descriptor: MethodCall): Int? =
    singleOrNull { (_, actual) -> actual == descriptor }?.first

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction?.methodReference(): MethodReference? =
    (this as? ReferenceInstruction)?.reference as? MethodReference

private fun FiveRegisterInstruction.registers(): List<Int> =
    listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)

private const val ENGLISH_ANCHOR_FIELD_NAME = "jasondevEnglishAnchorKey"
private const val SOFT_KEY_VIEW_TYPE =
    "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;"
private data class HelperDescriptor(
    val name: String,
    val parameterTypes: List<String>,
    val returnType: String,
    val accessFlags: Int,
    val fingerprint: String,
)
private val ENGLISH_HELPER_METHODS = setOf(
    HelperDescriptor(
        "jasondevShouldSuppressEnglishRetarget",
        listOf(SOFT_KEY_VIEW_TYPE, "F", "F"),
        "Z",
        AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
        "2d4ec6779cadad86dd904db283be5a318e2fb5beb22a2f2d098d39c0281ff63a",
    ),
    HelperDescriptor(
        "jasondevClearEnglishAnchor",
        emptyList(),
        "V",
        AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
        "953e39f265272452101a14d0bbc75a180c751eeefaef91912ea33cfd756366e7",
    ),
)
private val ENGLISH_HELPER_METHOD_NAMES = ENGLISH_HELPER_METHODS.mapTo(mutableSetOf()) { it.name }

private data class MethodCall(
    val definingClass: String,
    val name: String,
    val parameterTypes: List<String>,
    val returnType: String,
) {
    fun render(): String = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
}

private fun RuntimeCallId.methodCall(): MethodCall = RuntimeAbiCatalog.abi(this).let { abi ->
    MethodCall(abi.owner, abi.name, abi.parameters, abi.returnType)
}

private fun MethodReference.matches(call: MethodCall): Boolean =
    definingClass == call.definingClass &&
        name == call.name &&
        parameterTypes == call.parameterTypes &&
        returnType == call.returnType

private val ENGLISH_OWNER_CALL = MethodCall(
    "Lpbl;",
    "jasondevShouldSuppressEnglishRetarget",
    listOf(SOFT_KEY_VIEW_TYPE, "F", "F"),
    "Z",
)
private val LONG_PRESS_OWNER_CALL =
    RuntimeCallId.LONG_PRESS_QUICK_ACTIONS_RUNTIME_MAYBE_ENSURE_LONG_PRESS_SCHEDULED.methodCall()
private val TOP_ROW_OWNER_CALL =
    RuntimeCallId.TOP_ROW_SWIPE_RUNTIME_MAYBE_ARM_AND_RESOLVE_TOP_ROW_OWNER.methodCall()
private val ZHUYIN_OWNER_CALL =
    RuntimeCallId.ZHUYIN_SLIDE_RUNTIME_MAYBE_CAPTURE_AND_SHOULD_SUPPRESS_RETARGET.methodCall()
private val ENGLISH_CLEAR_CALL = MethodCall(
    "Lpbl;",
    "jasondevClearEnglishAnchor",
    emptyList(),
    "V",
)
private val TOP_ROW_CLEAR_CALL = RuntimeCallId.TOP_ROW_SWIPE_RUNTIME_CLEAR_SWIPE_SESSION.methodCall()
private val TOP_ROW_FINISH_CALL = RuntimeCallId.TOP_ROW_SWIPE_RUNTIME_FINISH_SWIPE_SESSION.methodCall()
private val ZHUYIN_CLEAR_CALL = RuntimeCallId.ZHUYIN_SLIDE_RUNTIME_CLEAR_POINTER_STATE.methodCall()
private val ALL_TRANSFORMATION_CALLS = listOf(
    ENGLISH_OWNER_CALL,
    LONG_PRESS_OWNER_CALL,
    TOP_ROW_OWNER_CALL,
    ZHUYIN_OWNER_CALL,
    ENGLISH_CLEAR_CALL,
    TOP_ROW_CLEAR_CALL,
    TOP_ROW_FINISH_CALL,
    ZHUYIN_CLEAR_CALL,
)
