package app.smartlife.patches.smartlife.layout.home

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.smartlife.patches.smartlife.misc.fix.signature.spoofSignaturePatch
import app.smartlife.patches.smartlife.shared.Constants.COMPATIBILITY_SMARTLIFE

private const val EXTENSION_CLASS = "Lapp/smartlife/extension/SmartLifeSettings;"

@Suppress("unused")
val hideHomeRecommendationsPatch = bytecodePatch(
    name = "Hide home recommendations",
    description = "Hides the \"おすすめ\" (Recommended) cards on the home screen. This is a runtime " +
        "toggle in the in-app \"SmartLife Patches\" settings screen. Hidden by default.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE)

    // Provides the extension and the captured app context.
    dependsOn(spoofSignaturePatch)

    execute {
        BuildHomeRecommendationsFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $EXTENSION_CLASS->hideHomeRecommendations()Z
                move-result v0
                if-eqz v0, :show_recommendations
                new-instance v0, Ljava/util/ArrayList;
                invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
                return-object v0
                :show_recommendations
                nop
            """,
        )
    }
}
