package dev.srwi.gintype.patches.gboard.features.thicctopbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import dev.srwi.gintype.patches.gboard.shared.addHelperMethodIfMissing
import dev.srwi.gintype.patches.gboard.shared.findBasicMotionEventHandlerFireKeyDataMethod
import dev.srwi.gintype.patches.gboard.shared.findSoftKeyboardViewTargetHeightMethod
import dev.srwi.gintype.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.srwi.gintype.patches.gboard.shared.instructionIndices
import dev.srwi.gintype.patches.gboard.shared.isMethodReference
import dev.srwi.gintype.patches.gboard.shared.mutableClass
import dev.srwi.gintype.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.srwi.gintype.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.srwi.gintype.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.srwi.gintype.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardThiccTopBarBytecodePatch = bytecodePatch(
    description = "Injects the Thicc Top Bar hook into LatinFixedCountCandidatesHolderView.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val holderClass = mutableClass(LATIN_FIXED_COUNT_CANDIDATES_HOLDER_VIEW_CLASS)

        // Resilient append-candidates lookup: match by name 'D' or parameter signature (List, ArrayList) -> void
        val appendMethod = holderClass.methods.firstOrNull {
            it.name == APPEND_CANDIDATES_METHOD_NAME &&
                it.returnType == APPEND_CANDIDATES_RETURN_TYPE &&
                it.parameterTypes == listOf("Ljava/util/List;", "Ljava/util/ArrayList;")
        } ?: holderClass.methods.firstOrNull {
            it.returnType == APPEND_CANDIDATES_RETURN_TYPE &&
                it.parameterTypes == listOf("Ljava/util/List;", "Ljava/util/ArrayList;")
        } ?: error("Could not find append candidates method in $LATIN_FIXED_COUNT_CANDIDATES_HOLDER_VIEW_CLASS")

        appendMethod.applyMatrixSuggestionsAppendDelegate()

        // Resilient clear-candidates lookup: match by name 'l' or non-static clear signature () -> void
        val clearMethod = holderClass.methods.firstOrNull {
            (it.accessFlags and AccessFlags.STATIC.value) == 0 &&
                it.name == CLEAR_CANDIDATES_METHOD_NAME &&
                it.returnType == CLEAR_CANDIDATES_RETURN_TYPE &&
                it.parameterTypes.isEmpty()
        } ?: holderClass.methods.firstOrNull {
            (it.accessFlags and AccessFlags.STATIC.value) == 0 &&
                it.returnType == CLEAR_CANDIDATES_RETURN_TYPE &&
                it.parameterTypes.isEmpty() &&
                !it.name.startsWith("<") &&
                it.name != "onDetachedFromWindow" &&
                it.name != "onAttachedToWindow"
        } ?: error("Could not find clear candidates method in $LATIN_FIXED_COUNT_CANDIDATES_HOLDER_VIEW_CLASS")

        clearMethod.applyMatrixSuggestionsClearDelegate()

        val softKeyboardViewClass = mutableClass(SOFT_KEYBOARD_VIEW_CLASS)
        val onFinishInflateMethod = softKeyboardViewClass.methods.firstOrNull {
            it.name == "onFinishInflate" &&
                it.returnType == "V" &&
                it.parameterTypes.isEmpty()
        } ?: throw PatchException(
            "Could not find onFinishInflate() in $SOFT_KEYBOARD_VIEW_CLASS",
        )
        onFinishInflateMethod.applySoftKeyboardViewInflateDelegate()

        val dispatchTouchMethod = softKeyboardViewClass.methods.firstOrNull {
            it.name == "dispatchTouchEvent" &&
                it.returnType == "Z" &&
                it.parameterTypes == listOf("Landroid/view/MotionEvent;")
        } ?: throw PatchException(
            "Could not find dispatchTouchEvent(MotionEvent) in $SOFT_KEYBOARD_VIEW_CLASS",
        )
        dispatchTouchMethod.applySoftKeyboardViewTouchDelegate()

        val basicHandlerClass = mutableClass(BASIC_MOTION_EVENT_HANDLER_CLASS)
        val fireKeyDataMethod = findBasicMotionEventHandlerFireKeyDataMethod(basicHandlerClass)
        fireKeyDataMethod.applyKeyDataDispatchedDelegate()

        softKeyboardViewClass.applyHeaderTargetHeightWrapper()
    }
}

internal fun MutableMethod.applyMatrixSuggestionsAppendDelegate() {
    val abi = RuntimeAbiCatalog.abi(
        RuntimeCallId.THICC_TOP_BAR_RUNTIME_ON_CANDIDATES_UPDATED,
    )
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val existing = instructions.count { it.isMethodReference(abi.reference) }
    if (existing > 0) {
        check(existing == 1 && instructions.first().isMethodReference(abi.reference)) {
            "Malformed matrix suggestions append delegate in $definingClass->$name"
        }
        return
    }
    addInstructions(
        0,
        RuntimeCallEmitter.invoke(
            RuntimeCallId.THICC_TOP_BAR_RUNTIME_ON_CANDIDATES_UPDATED,
            "p0 .. p1",
        ),
    )
}

internal fun MutableMethod.applyMatrixSuggestionsClearDelegate() {
    val abi = RuntimeAbiCatalog.abi(
        RuntimeCallId.THICC_TOP_BAR_RUNTIME_ON_CANDIDATES_CLEARED,
    )
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val existing = instructions.count { it.isMethodReference(abi.reference) }
    if (existing > 0) {
        check(existing == 1) {
            "Malformed matrix suggestions clear delegate in $definingClass->$name"
        }
        return
    }
    addInstructions(
        0,
        RuntimeCallEmitter.invoke(
            RuntimeCallId.THICC_TOP_BAR_RUNTIME_ON_CANDIDATES_CLEARED,
            "p0",
        ),
    )
}

internal fun MutableMethod.applySoftKeyboardViewInflateDelegate() {
    val abi = RuntimeAbiCatalog.abi(
        RuntimeCallId.THICC_TOP_BAR_RUNTIME_ON_SOFT_KEYBOARD_VIEW_INFLATED,
    )
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val returnIndices = instructionIndices("RETURN_VOID")
    check(returnIndices.isNotEmpty()) {
        "No return-void instruction in $definingClass->$name"
    }
    val existing = instructions.count { it.isMethodReference(abi.reference) }
    if (existing > 0) {
        check(existing == returnIndices.size) {
            "Expected $definingClass->$name to match ${returnIndices.size} return hooks, found $existing"
        }
        return
    }
    val invokeSmali = RuntimeCallEmitter.invoke(
        RuntimeCallId.THICC_TOP_BAR_RUNTIME_ON_SOFT_KEYBOARD_VIEW_INFLATED,
        "p0",
    )
    returnIndices.asReversed().forEach { retIdx ->
        addInstructions(retIdx, invokeSmali)
    }
}

internal fun MutableMethod.applySoftKeyboardViewTouchDelegate() {
    val abi = RuntimeAbiCatalog.abi(
        RuntimeCallId.THICC_TOP_BAR_RUNTIME_ON_KEYBOARD_TOUCH_EVENT,
    )
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val existing = instructions.count { it.isMethodReference(abi.reference) }
    if (existing > 0) {
        check(existing == 1) {
            "Malformed SoftKeyboardView touch delegate in $definingClass->$name"
        }
        return
    }
    addInstructions(
        0,
        RuntimeCallEmitter.invoke(
            RuntimeCallId.THICC_TOP_BAR_RUNTIME_ON_KEYBOARD_TOUCH_EVENT,
            "p0, p1",
        ),
    )
}

internal fun MutableMethod.applyKeyDataDispatchedDelegate() {
    val abi = RuntimeAbiCatalog.abi(
        RuntimeCallId.THICC_TOP_BAR_RUNTIME_ON_KEY_DATA_DISPATCHED,
    )
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val existing = instructions.count { it.isMethodReference(abi.reference) }
    if (existing > 0) {
        return
    }
    addInstructions(
        0,
        RuntimeCallEmitter.invoke(
            RuntimeCallId.THICC_TOP_BAR_RUNTIME_ON_KEY_DATA_DISPATCHED,
            "",
        ),
    )
}

internal fun MutableClass.applyHeaderTargetHeightWrapper() {
    val scaleAbi = RuntimeAbiCatalog.abi(
        RuntimeCallId.THICC_TOP_BAR_RUNTIME_SCALE_HEADER_TARGET_HEIGHT,
    )
    val targetMethod = findSoftKeyboardViewTargetHeightMethod(this)

    val existingHelper = methods.any { it.name == ORIG_TARGET_HEIGHT_HELPER_NAME }
    val existingScaleCalls = targetMethod.implementation?.instructions
        ?.count { it.isMethodReference(scaleAbi.reference) }
        ?: 0
    if (existingHelper || existingScaleCalls > 0) {
        check(existingHelper && existingScaleCalls == 1) {
            "Expected $type->${targetMethod.name}()I to be wrapped once"
        }
        return
    }

    val origImpl = targetMethod.implementation
        ?: throw PatchException("No instructions in ${targetMethod.definingClass}->${targetMethod.name}")
    methods.add(
        MutableMethod(
            ImmutableMethod(
                type,
                ORIG_TARGET_HEIGHT_HELPER_NAME,
                emptyList(),
                "I",
                AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
                targetMethod.annotations,
                null,
                ImmutableMethodImplementation.of(origImpl),
            ),
        ),
    )

    val origAccessFlags = targetMethod.accessFlags
    val origName = targetMethod.name
    val origAnnotations = targetMethod.annotations
    methods.remove(targetMethod)
    val scaleInvokeSmali = RuntimeCallEmitter.invoke(
        RuntimeCallId.THICC_TOP_BAR_RUNTIME_SCALE_HEADER_TARGET_HEIGHT,
        "p0, v0",
    )
    addHelperMethodIfMissing(
        name = origName,
        parameterTypes = emptyList(),
        returnType = "I",
        accessFlags = origAccessFlags,
        registerCount = 2,
        annotations = origAnnotations,
        body = """
            invoke-direct {p0}, $type->$ORIG_TARGET_HEIGHT_HELPER_NAME()I
            move-result v0
            $scaleInvokeSmali
            move-result v0
            return v0
        """.trimIndent(),
    )
}

private const val LATIN_FIXED_COUNT_CANDIDATES_HOLDER_VIEW_CLASS =
    "Lcom/google/android/apps/inputmethod/latin/keyboard/widget/LatinFixedCountCandidatesHolderView;"
private const val APPEND_CANDIDATES_METHOD_NAME = "D"
private const val APPEND_CANDIDATES_RETURN_TYPE = "V"
private const val CLEAR_CANDIDATES_METHOD_NAME = "l"
private const val CLEAR_CANDIDATES_RETURN_TYPE = "V"
private const val SOFT_KEYBOARD_VIEW_CLASS =
    "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;"
private const val BASIC_MOTION_EVENT_HANDLER_CLASS =
    "Lcom/google/android/libraries/inputmethod/motioneventhandler/BasicMotionEventHandler;"
private const val ORIG_TARGET_HEIGHT_HELPER_NAME = "gboardPatchesOriginalTargetHeight"
