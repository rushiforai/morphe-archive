package app.xiondigital.patches.tandem.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

/**
 * Replaces a method's whole body with a single `return-void`.
 *
 * `MutableMethod.implementation!!.instructions` looks mutable — the patcher's own
 * `MutableMethod.instructions` extension even types it as `MutableList<BuilderInstruction>` — but
 * dexlib2's `MutableMethodImplementation.getInstructions()` returns a read-only `AbstractList` view
 * over the real (private) instruction list:
 *
 * ```java
 * public List<BuilderInstruction> getInstructions() {
 *     ...
 *     return new AbstractList<BuilderInstruction>() { ... };   // no clear(), no remove()
 * }
 * ```
 *
 * So `instructions.clear()` throws `UnsupportedOperationException` at patch time:
 *
 * ```
 * java.lang.UnsupportedOperationException
 *   at java.base/java.util.AbstractList.remove(...)
 *   at java.base/java.util.AbstractList$Itr.remove(...)
 *   at java.base/java.util.AbstractList.removeRange(...)
 *   at java.base/java.util.AbstractList.clear(...)
 * ```
 *
 * Mutating instructions has to go through the implementation's own `removeInstruction` /
 * `addInstruction`, which operate on the real list — that is what the `removeInstructions` and
 * `addInstructions` extensions delegate to.
 */
internal fun MutableMethod.replaceBodyWithReturnVoid() {
    val instructionCount = implementation?.instructions?.size ?: return

    if (instructionCount > 0) removeInstructions(instructionCount)
    addInstructions(0, "return-void")
}

/**
 * Replaces a method's whole body with `finish()` followed by `return-void`.
 *
 * For activities that exist only to show a dialog: closing them in `onStart()` leaves whatever is
 * underneath untouched, whereas an empty body would leave an invisible window on screen that never
 * finishes.
 */
internal fun MutableMethod.replaceBodyWithFinish() {
    val instructionCount = implementation?.instructions?.size ?: return

    if (instructionCount > 0) removeInstructions(instructionCount)
    addInstructions(
        0,
        """
            invoke-virtual {p0}, Landroid/app/Activity;->finish()V
            return-void
        """,
    )
}
