package dev.jason.gboardpatches.patches.gboard.features.immersive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val EXTENSION_CLASS = "Lapp/immersivekeyboard/extension/BottomBarOpacity;"

internal val gboardTranslucentBottomBarPatch = bytecodePatch(
    description = "Makes the bar under the keyboard (behind the globe and close buttons) match " +
        "the keyboard's color, opacity and blur, for use with transparent themes such as " +
        "Frosted Glass.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    extendWith(IMMERSIVE_KEYBOARD_EXTENSION)

    execute {
        // Before Android 16 the strip is the window's navigation bar color. The same value is also
        // handed to InputView, so scale it once here, before it is read.
        ApplyNavigationBarColorFingerprint.let { fingerprint ->
            val readCurrentColor = fingerprint.instructionMatches[0].index
            val colorRegister = fingerprint.method.getInstruction<FiveRegisterInstruction>(
                fingerprint.instructionMatches[1].index,
            ).registerD
            fingerprint.method.addInstructions(
                readCurrentColor,
                """
                    invoke-static { p1, v$colorRegister }, $EXTENSION_CLASS->navigationBarColor(Landroid/view/Window;I)I
                    move-result v$colorRegister
                """,
            )
        }

        // On Android 16+ Gboard paints this strip itself, in an opaque theme color, in the bottom
        // padding of InputView. Replace that color with the keyboard's own color and opacity, and
        // blur behind the strip when Frosted Glass is on.
        InputViewOnDrawFingerprint.let { fingerprint ->
            val setColor = fingerprint.instructionMatches.first().index
            val colorRegister = fingerprint.method.getInstruction<FiveRegisterInstruction>(setColor).registerD
            fingerprint.method.addInstructions(
                setColor,
                """
                    invoke-static { p0, p1, v$colorRegister }, $EXTENSION_CLASS->stripColor(Landroid/view/View;Landroid/graphics/Canvas;I)I
                    move-result v$colorRegister
                """,
            )
        }

        // Once the keyboard has drawn, fix up its bottom corners where they meet the strip. The
        // parameter registers are reused right after the super call, so hook directly behind it.
        InputViewDispatchDrawFingerprint.let { fingerprint ->
            fingerprint.method.addInstructions(
                fingerprint.instructionMatches.first().index + 1,
                "invoke-static { p0, p1 }, " +
                    "$EXTENSION_CLASS->afterKeyboardDrawn(Landroid/view/View;Landroid/graphics/Canvas;)V",
            )
        }
    }
}
