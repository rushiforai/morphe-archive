package dev.jason.gboardpatches.patches.gboard.features.immersive

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val FLOATING_WIDGET_CLASS = "Lapp/immersivekeyboard/extension/FloatingWidget;"

internal val gboardImmersiveKeyboardPatch = bytecodePatch(
    description = "Extends the keyboard under the camera cutout in landscape " +
        "instead of leaving an empty strip beside it.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    extendWith(IMMERSIVE_KEYBOARD_EXTENSION)

    execute {
        // Gboard ships its own edge-to-edge keyboard mode behind flags that default to false.
        // While they are off, its DisplayCutoutModule resets the keyboard window to
        // LAYOUT_IN_DISPLAY_CUTOUT_MODE_DEFAULT every time input starts, so setting the window
        // attribute from outside does not stick. Turn the built-in mode on instead.

        // Default the three cutout flags to true. With auto_edge_to_edge_keyboard on, Gboard also
        // pads the keys so none of them end up underneath the camera.
        DisplayCutoutFlagsFingerprint.let { fingerprint ->
            val firstFlagCall = fingerprint.instructionMatches[1].index
            val defaultRegister = fingerprint.method
                .getInstruction<FiveRegisterInstruction>(firstFlagCall).registerD
            fingerprint.method.addInstruction(firstFlagCall, "const/16 v$defaultRegister, 0x1")
        }

        // Keep the window extended even if a server-side flag value overrides the defaults.
        ShouldIgnoreDisplayCutoutFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // That mode makes the keyboard view fill the screen. With a hardware keyboard the view is
        // hidden and the window shrinks, so keep the floating keyboard switcher, which is still
        // placed for the full-screen view, inside the smaller window.
        FloatingPopupPositionFingerprint.let { fingerprint ->
            val setY = fingerprint.instructionMatches.last().index
            val container = fingerprint.method.getInstruction<FiveRegisterInstruction>(setY).registerC
            fingerprint.method.addInstruction(
                setY + 1,
                "invoke-static { v$container }, $FLOATING_WIDGET_CLASS->positioned(Landroid/view/View;)V",
            )
        }
    }
}
