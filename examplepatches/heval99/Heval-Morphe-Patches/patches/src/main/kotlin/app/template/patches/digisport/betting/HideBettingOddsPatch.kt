package app.template.patches.digisport.betting

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_DIGISPORT
import app.template.patches.shared.addInstructionsChecked

@Suppress("unused")
val hideBettingOddsPatch = bytecodePatch(
    name = "Hide betting odds",
    description = "Hides betting odds in match lists.",
) {
    compatibleWith(COMPATIBILITY_DIGISPORT)

    execute {
        // Every match row reads as having no odds, so its odds block stays GONE.
        UIResultsMatchGetBetFingerprint.method.addInstructionsChecked(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )
    }
}
