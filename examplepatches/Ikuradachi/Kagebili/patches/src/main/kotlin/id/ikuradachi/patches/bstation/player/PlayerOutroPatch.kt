package id.ikuradachi.patches.bstation.player

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

internal fun BytecodePatchContext.applyOutro() {
    UnlockVideoGuideProgressFingerprint.method.addInstructions(
        0,
        "return-void",
    )
    UnlockVideoGuideLandscapeFingerprint.method.addInstructions(
        0,
        "return-void",
    )
    UnlockVideoGuideWidgetFingerprint.method.addInstructions(
        0,
        "return-void",
    )
    ChronosGetCommandInfoFingerprint.method.addInstructions(
        0,
        """
            const/4 p1, 0x0
            invoke-interface {p2, p1, p1}, Lp61/p;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            return-void
        """,
    )
}
