package app.unlimited.sportsnet.patches.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.unlimited.sportsnet.patches.shared.Constants.COMPATIBILITY_SPORTSNET
import app.unlimited.sportsnet.patches.shared.originalSignaturePatch

private const val ADS_MODEL = "Lcom/rogers/sportsnet/service/advertisements/model"

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Removes banner, in-feed and launch ads, and the ads in highlight videos. " +
        "Ads inside Sportsnet+ streams are part of the stream and are not removed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SPORTSNET)
    dependsOn(originalSignaturePatch)

    execute {
        // Never start the ads SDK. The consent flow waits until ads have either started or failed,
        // so report a failure instead of leaving the state unset.
        AdInitializeFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, $ADS_MODEL/AdvertisementService;->_advertisementState:Lkotlinx/coroutines/flow/MutableStateFlow;
                new-instance v1, $ADS_MODEL/AdInitializationState${'$'}Failed;
                sget-object v2, $ADS_MODEL/AdInitializationException;->INSTANCE:$ADS_MODEL/AdInitializationException;
                invoke-direct {v1, v2}, $ADS_MODEL/AdInitializationState${'$'}Failed;-><init>(Ljava/lang/Throwable;)V
                invoke-interface {v0, v1}, Lkotlinx/coroutines/flow/MutableStateFlow;->setValue(Ljava/lang/Object;)V
                sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object v0
            """
        )

        // Screens combine their content with their ads, so the ads must still arrive: as a
        // successful Result holding an empty list, which is what the ad flow emits.
        AdListForScreenFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                invoke-static {v0}, Lkotlin/Result;->box-impl(Ljava/lang/Object;)Lkotlin/Result;
                move-result-object v0
                invoke-static {v0}, Lkotlinx/coroutines/flow/FlowKt;->flowOf(Ljava/lang/Object;)Lkotlinx/coroutines/flow/Flow;
                move-result-object v0
                return-object v0
            """
        )

        ShowFullscreenAdFingerprint.method.returnEarly()
        SetupGoogleImaFingerprint.method.returnEarly()
    }
}
