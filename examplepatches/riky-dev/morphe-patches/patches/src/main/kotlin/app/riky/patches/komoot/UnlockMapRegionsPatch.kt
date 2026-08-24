package app.riky.patches.komoot

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_KOMOOT

@Suppress("unused")
val unlockMapRegionsPatch = bytecodePatch(
    name = "Unlock map regions",
    description = "Spoof Komoot Maps ownership client-side (world pack / owned regions in " +
        "shop and offline UI). Server-side limits may still apply: offline tile download " +
        "auth, sync overwriting local state, and Play receipt validation. Does not " +
        "replace a real Play Store purchase.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KOMOOT)

    execute {
        // Force ownsWorldPack=true when GetRegionsDataUseCase builds RegionsData.
        RegionsDataFingerprint.method.addInstruction(
            0,
            "const/4 p1, 0x1",
        )

        // Treat every finance Package as an active world-pack purchase.
        PackageAllRegionsFingerprint.method.addInstructions(
            0,
            """
                const/4 p0, 0x1
                return p0
            """,
        )
        PackageActiveFingerprint.method.addInstructions(
            0,
            """
                const/4 p0, 0x1
                return p0
            """,
        )
    }
}
