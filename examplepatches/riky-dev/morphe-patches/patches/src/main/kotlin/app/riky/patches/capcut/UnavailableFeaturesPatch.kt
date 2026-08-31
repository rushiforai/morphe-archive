package app.riky.patches.capcut

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_CAPCUT

@Suppress("unused")
val hideUnavailableFeaturesPatch = bytecodePatch(
    name = "Hide Unavailable Features",
    description = "Hides cloud-gated editor options that won't work offline: AI sounds, super resolution, optical flow, and smart frame interpolation.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CAPCUT)

    execute {
        AISoundEffectAbBFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        ExportHighDefinitionConfigGetEnableFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        SlowMotionSourceGetListFingerprint.method.addInstructions(
            0,
            """
                new-instance v4, Ljava/util/ArrayList;
                invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V
                new-instance v3, Lcom/vega/edit/speed/data/SlowMotionItem;
                sget-object v2, Lcom/vega/middlebridge/swig/LVVEAlgorithmSubType;->c:Lcom/vega/middlebridge/swig/LVVEAlgorithmSubType;
                const v0, 0x7f121269
                invoke-static {v0}, Lcom/vega/infrastructure/base/ModuleCommonKt;->b(I)Ljava/lang/String;
                move-result-object v1
                const v0, 0x7f1230a1
                invoke-static {v0}, Lcom/vega/infrastructure/base/ModuleCommonKt;->b(I)Ljava/lang/String;
                move-result-object v0
                invoke-direct {v3, v2, v1, v0}, Lcom/vega/edit/speed/data/SlowMotionItem;-><init>(Lcom/vega/middlebridge/swig/LVVEAlgorithmSubType;Ljava/lang/String;Ljava/lang/String;)V
                invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                return-object v4
            """
        )

        SmartCompleteFrameUtilIsEntryVisibleFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
    }
}
