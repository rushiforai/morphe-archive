package id.ikuradachi.patches.bstation.player

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction

internal fun BytecodePatchContext.applyWatermark() {
    WaterMarkLoadFingerprint.method.addInstruction(0, "return-void")
    WaterMarkSetVisibleFingerprint.method.addInstruction(0, "const/4 p1, 0x0")
    WaterMarkSetFingerprint.method.addInstruction(0, "return-void")
}
