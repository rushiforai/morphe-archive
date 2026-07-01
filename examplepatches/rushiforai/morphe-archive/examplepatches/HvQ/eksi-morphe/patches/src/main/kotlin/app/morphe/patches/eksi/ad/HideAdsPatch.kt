package app.morphe.patches.eksi.ad

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.eksi.shared.Constants.COMPATIBILITY_EKSI

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Removes Ekşi Sözlük ad placements and disables ad loading.",
) {
    compatibleWith(COMPATIBILITY_EKSI)

    execute {
        AdUnitIfNeededFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        AdViewLoaderFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        StartupAdLoaderFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void",
        )

        InitializeAdsOperationsFingerprint.method.addInstructions(
            0,
            "return-void",
        )
    }
}
