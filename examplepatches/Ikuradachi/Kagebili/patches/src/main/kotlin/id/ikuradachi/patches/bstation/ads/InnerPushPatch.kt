package id.ikuradachi.patches.bstation.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

internal fun BytecodePatchContext.applyInnerPush() {
    InnerPushFingerprint.method.addInstructions(
        0,
        "return-void",
    )
}
