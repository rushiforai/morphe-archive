package app.template.patches.rustore.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.rustore.shared.Constants.COMPATIBILITY_RUSTORE

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes advertisements and recommendations from search.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUSTORE)

    execute {
        RawAdvertisementRepoGetFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        SearchZeroContentConstructorFingerprint.method.addInstructions(
            0,
            """
                const/4 p1, 0x0
                const/4 p2, 0x0
                const/4 p4, 0x0
            """,
        )
    }
}
