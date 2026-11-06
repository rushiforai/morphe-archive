package app.revanced.patches.sudoku

import app.morphe.patcher.patch.bytecodePatch;
import app.revanced.util.returnEarly;
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions;

@Suppress("unused")
val adsPatch = bytecodePatch(
    name = "Disable ads",
) {
    compatibleWith("com.easybrain.sudoku.android"("6.22.0"));

    execute {
        initAdsFingerprint.method.returnEarly();
    }
}
