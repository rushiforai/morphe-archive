package id.ikuradachi.patches.bstation.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

internal fun BytecodePatchContext.applyRatingPrompts() {
    RatingOwnerFingerprint.matchAll(1..1)
    RatingPresenterFingerprint.matchAll(1..1)
    RatingPresenterFingerprint.method.addInstructions(0, "return-void")
}
