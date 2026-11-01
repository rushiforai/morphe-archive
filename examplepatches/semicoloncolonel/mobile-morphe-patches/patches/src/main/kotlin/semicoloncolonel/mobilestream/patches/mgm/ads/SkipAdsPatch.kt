package semicoloncolonel.mobilestream.patches.mgm.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.mgm.shared.Constants

// MGM+ phone 240.0.2026240000. The app plays through Amazon's AIV player (the
// same stack Prime Video's phone app uses: the native libAIV*.so libraries and
// the com.amazon.avod.* Java layer, both unobfuscated here).
//
// PrepareAdPlan, a step of every playback session, asks for the title's AdPlan
// (the ad breaks and their clips). Amazon ships its own EmptyAdPlan.INSTANCE,
// the plan a session uses when it has no ads. This patch has getAdPlan() return
// that, so no ad break is ever scheduled. The playback request itself is left
// alone.
internal object PrepareAdPlanGetAdPlanFingerprint : Fingerprint(
    returnType = "Lcom/amazon/avod/media/ads/AdPlan;",
    custom = { method, classDef ->
        method.name == "getAdPlan" &&
            classDef.type == "Lcom/amazon/avod/playback/session/workflow/tasks/PrepareAdPlan;"
    },
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Gives every MGM+ playback Amazon's own empty ad plan in the phone app, so no " +
        "ad break is scheduled. The stream request is not changed. Experimental; test on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // getAdPlan has .registers 18, so v0 is free.
        PrepareAdPlanGetAdPlanFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/amazon/avod/media/ads/internal/EmptyAdPlan;->INSTANCE:Lcom/amazon/avod/media/ads/internal/EmptyAdPlan;
                return-object v0
            """.trimIndent(),
        )
    }
}
