package dev.jason.gboardpatches.patches.gboard.features.immersive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val EXTENSION_CLASS = "Lapp/immersivekeyboard/extension/EmojiKeyPosition;"

internal val gboardEmojiKeyOnRightPatch = bytecodePatch(
    description = "Moves the dedicated emoji key from the left of the spacebar to just left of " +
        "the enter / search key.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    extendWith(IMMERSIVE_KEYBOARD_EXTENSION)

    execute {
        // Gboard's bottom row layouts put this key before the spacebar. Reorder it at runtime once
        // a keyboard has been laid out. The parameter registers are reused right after the super
        // call, so hook directly behind it.
        InputViewDispatchDrawFingerprint.let { fingerprint ->
            fingerprint.method.addInstructions(
                fingerprint.instructionMatches.first().index + 1,
                "invoke-static { p0 }, $EXTENSION_CLASS->attach(Landroid/view/View;)V",
            )
        }
    }
}
