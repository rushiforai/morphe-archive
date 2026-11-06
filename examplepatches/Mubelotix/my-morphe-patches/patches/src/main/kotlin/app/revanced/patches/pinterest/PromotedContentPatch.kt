package app.revanced.patches.pinterest

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.revanced.util.returnEarly

val promotedContentPatch = bytecodePatch(
    name = "Remove promoted content",
) {
    compatibleWith("com.pinterest"("14.23.0"));

    execute {
        isPromotedFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object v0
            """
        );

        isDownstreamPromotionFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object v0
            """
        );

        shopTheLookFingerprint.method.returnEarly();
    }
}
