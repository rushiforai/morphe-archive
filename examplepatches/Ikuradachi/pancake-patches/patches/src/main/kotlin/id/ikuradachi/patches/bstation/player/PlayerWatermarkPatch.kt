package id.ikuradachi.patches.bstation.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import id.ikuradachi.patches.bstation.shared.Constants.COMPATIBILITY_BSTATION

@Suppress("unused")
val playerWatermarkPatch = bytecodePatch(
    name = "Disable player watermark",
    description = "Hides the top-right brand logo and copyright/premium watermark in the video player.",
) {
    category("Player")
    compatibleWith(COMPATIBILITY_BSTATION)

    execute {
        WaterMarkLoadFingerprint.method.addInstruction(0, "return-void")
        WaterMarkSetVisibleFingerprint.method.addInstruction(0, "const/4 p1, 0x0")
        WaterMarkSetFingerprint.method.addInstruction(0, "return-void")
    }
}
