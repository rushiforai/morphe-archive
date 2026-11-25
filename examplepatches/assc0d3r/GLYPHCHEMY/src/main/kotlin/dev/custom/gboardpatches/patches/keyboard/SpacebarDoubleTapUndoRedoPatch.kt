package dev.custom.gboardpatches.patches.keyboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val KEYBOARD_VIEW = "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;"
private const val MOTION_EVENT = "Landroid/view/MotionEvent;"
private const val HELPER_CLASS = "Ldev/custom/gboardpatches/keyboard/SpacebarDoubleTapRuntime;"

/**
 * Double tap on the left half of the spacebar inserts a tab, the right half undoes the last edit.
 *
 * The tap is judged in `SoftKeyboardView.dispatchTouchEvent`, where Gboard hands touches to its
 * pointer system, so a recognised double tap is dropped before the keyboard commits a second
 * space. The receiver and the event are the only registers read, and the stock body is untouched:
 * one dispatch override carries both halves, so the runtime decides between tab and undo rather
 * than a second override being stacked on the same method.
 */
val spacebarDoubleTapUndoRedoPatch = bytecodePatch(
    name = "Spacebar double-tap tab/undo",
    description = "Double tap the left half of the spacebar to insert a tab, the right half to undo " +
        "the last edit.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "Gboard",
            packageName = "com.google.android.inputmethod.latin",
            targets = listOf(
                AppTarget(version = "18.6.3.1002251336-release-arm64-v8a"),
                AppTarget(version = "18.5.4.993608717-release-arm64-v8a"),
                AppTarget(version = null, isExperimental = true),
            ),
        ),
    )
    extendWith("colorwheel.dex")

    execute {
        val keyboardView = mutableClassDefByOrNull(KEYBOARD_VIEW)
            ?: error("Gboard keyboard view class not found.")

        val dispatch = keyboardView.methods.firstOrNull { method ->
            method.name == "dispatchTouchEvent" &&
                method.returnType == "Z" &&
                method.parameterTypes == listOf(MOTION_EVENT)
        } ?: error("Gboard keyboard touch dispatch not found.")

        // p0 is the keyboard view and p1 the event; the hook needs one spare local for the
        // helper's answer. Refusing loudly beats clobbering the event register.
        val implementation = dispatch.implementation ?: error("Gboard touch dispatch has no body.")
        val parameterRegisters = 2
        check(implementation.registerCount > parameterRegisters) {
            "Gboard touch dispatch keeps no local register for the spacebar hook " +
                "(registers=${implementation.registerCount})."
        }

        // The hook carries its own call inside the installed code, so a second run is a no-op
        // rather than a second override on the same method.
        if (!dispatch.callsSpacebarRuntime("maybeHandleTouch")) {
            dispatch.addInstructions(
                0,
                """
                    invoke-static {p0, p1}, $HELPER_CLASS->maybeHandleTouch(Landroid/view/ViewGroup;$MOTION_EVENT)Z
                    move-result v0
                    if-eqz v0, :jasondev_spacebar_forward
                    const/4 v0, 0x1
                    return v0
                    :jasondev_spacebar_forward
                """.trimIndent(),
            )
        }

        check(dispatch.callsSpacebarRuntime("maybeHandleTouch")) {
            "Gboard spacebar double-tap hook was not installed."
        }
    }
}

private fun MutableMethod.callsSpacebarRuntime(name: String): Boolean =
    implementation?.instructions?.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference != null && reference.definingClass == HELPER_CLASS && reference.name == name
    } == true
