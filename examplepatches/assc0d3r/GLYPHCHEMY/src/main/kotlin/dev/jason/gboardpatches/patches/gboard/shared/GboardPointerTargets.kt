package dev.jason.gboardpatches.patches.gboard.shared

import app.morphe.patcher.patch.BytecodePatchContext
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings

/**
 * The members the pointer-owner family rewrites on one release.
 *
 * 18.8.0 keeps the whole contract - the owner still takes `(SoftKeyView, FFJI)` with 21 registers,
 * its finish still dispatches exactly one gesture and the pre-reset still follows the finish - but
 * renames every class and member: the owner is `Lagyw;` instead of `Lqck;`, the finish `t` instead
 * of `r`, the cancel `u` instead of `s`, the reset `E` instead of `C`, the pre-reset `ad` instead
 * of `ac`, and the gesture dispatcher the finish calls is `Lagyx;->f`. The update-target-view
 * method moved from `F` to `H`. Only the names differ, so the contract checks stay version
 * independent and this table is the whole port.
 */
internal data class GboardPointerTargets(
    val pointerOwner: GboardMethodTarget,
    val pointerFinish: GboardMethodTarget,
    val pointerPreReset: GboardMethodTarget,
    val pointerCancel: GboardMethodTarget,
    val pointerReset: GboardMethodTarget,
    /** Owner of the `f(...)` the finish invokes to hand the gesture to the delegate. */
    val finishDispatchOwner: String,
    val finishDispatchParameters: List<String>,
    val finishDispatchReturnType: String,
    /** Method on the owner that receives `(MotionEvent, I)` to retarget the active view. */
    val updateTargetViewName: String,
)

/**
 * Chooses by what the APK actually declares, not by the version the generated projection was built
 * for: a projection only ever describes one release, and applying the family to another build has
 * to fall through to the audited table instead of resolving names that are not there.
 */
internal fun gboardPointerTargets(context: BytecodePatchContext): GboardPointerTargets =
    selectReleaseTargets(
        context = context,
        projection = ::projectedPointerTargets,
        probe = GboardPointerTargets::pointerOwner,
        audited = GBOARD_POINTER_18_8,
    )

/**
 * Reads the generated projection at call time rather than at class-init time, so a build that does
 * not select a pointer feature can still load this file.
 */
private fun projectedPointerTargets() = GboardPointerTargets(
    pointerOwner = GboardVersionBindings.pointerOwner,
    pointerFinish = GboardVersionBindings.pointerFinish,
    pointerPreReset = GboardVersionBindings.pointerPreReset,
    pointerCancel = GboardVersionBindings.pointerCancel,
    pointerReset = GboardVersionBindings.pointerReset,
    // The dispatcher drops the stock event enum and action parameter for a renamed pair on every
    // release, so it is stated per release while the signature comes from the projection.
    finishDispatchOwner = when (GboardVersionBindings.targetVersion) {
        "18.5.4" -> "Lqio;"
        "18.6.3" -> "Lqcl;"
        else -> "Lpvj;"
    },
    finishDispatchParameters = GboardVersionBindings.gestureDispatch.parameterTypes,
    finishDispatchReturnType = GboardVersionBindings.gestureDispatch.returnType,
    updateTargetViewName = "F",
)

private const val SOFT_KEY_VIEW = "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;"
private const val SOFT_KEY_DEF = "Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;"

private val GBOARD_POINTER_18_8 = GboardPointerTargets(
    pointerOwner = GboardMethodTarget(
        classType = "Lagyw;",
        name = "D",
        parameterTypes = listOf(SOFT_KEY_VIEW, "F", "F", "J", "I"),
        returnType = "V",
    ),
    pointerFinish = GboardMethodTarget(
        classType = "Lagyw;",
        name = "t",
        parameterTypes = listOf("J", "I"),
        returnType = "V",
    ),
    pointerPreReset = GboardMethodTarget(
        classType = "Lagyw;",
        name = "ad",
        parameterTypes = emptyList(),
        returnType = "V",
    ),
    pointerCancel = GboardMethodTarget(
        classType = "Lagyw;",
        name = "u",
        parameterTypes = listOf("J"),
        returnType = "V",
    ),
    pointerReset = GboardMethodTarget(
        classType = "Lagyw;",
        name = "E",
        parameterTypes = emptyList(),
        returnType = "V",
    ),
    finishDispatchOwner = "Lagyx;",
    finishDispatchParameters = listOf(
        "Lagyw;",
        "Lagkl;",
        "Lagmb;",
        SOFT_KEY_DEF,
        "J",
        "Z",
        "Z",
        "I",
        "Z",
        "J",
        "I",
    ),
    finishDispatchReturnType = "V",
    updateTargetViewName = "H",
)
