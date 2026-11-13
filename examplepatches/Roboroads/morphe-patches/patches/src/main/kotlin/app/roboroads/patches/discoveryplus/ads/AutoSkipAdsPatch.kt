package app.roboroads.patches.discoveryplus.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import app.roboroads.patches.shared.Constants.COMPATIBILITY_DISCOVERYPLUS_FIRETV
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/roboroads/extension/discoveryplus/AutoSkipAdsPatch;"

@Suppress("unused")
val autoSkipAdsPatch = patch(
    name = "Auto-skip ads",
    description = "Automatically skips all ads, including pre-roll and mid-roll breaks, and hides " +
        "ad overlays and pause ads. Ads are stitched into the stream, so a fraction of a second " +
        "of a pre-roll may still show.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DISCOVERYPLUS_FIRETV)

    extendWith("extensions/extension.mpe")

    execute {
        // Legacy adtech path: mark every ad break as watched when the ad skip state is created.
        AdSkipInitializeStateFingerprint.let {
            val putIndex = it.instructionMatches[1].index
            val stateRegister = it.method.getInstruction<TwoRegisterInstruction>(putIndex).registerA

            it.method.addInstruction(
                putIndex + 1,
                "invoke-static { v$stateRegister }, $EXTENSION_CLASS->markAllWatched(Ljava/lang/Object;)V",
            )
        }

        // Legacy adtech path: mark every ad break as watched when the timeline is updated.
        AdSkipUpdateStateFingerprint.let {
            val getIndex = it.instructionMatches[1].index
            val stateRegister = it.method.getInstruction<TwoRegisterInstruction>(getIndex).registerA

            it.method.addInstruction(
                getIndex + 1,
                "invoke-static { v$stateRegister }, $EXTENSION_CLASS->markAllWatched(Ljava/lang/Object;)V",
            )
        }

        // Legacy adtech path: allow user seeks while inside an ad break.
        AdSkipOnSeekRequestFingerprint.let {
            val moveResultIndex = it.instructionMatches[1].index
            val register = it.method.getInstruction<OneRegisterInstruction>(moveResultIndex).registerA

            it.method.addInstruction(moveResultIndex + 1, "const/4 v$register, 0x0")
        }

        // Legacy adtech path: skip out of an ad break the playhead is already inside
        // (pre-roll, resume or seek landing inside a break).
        // .registers 4: v0 is a scratch local overwritten by the original first instruction,
        // p0 = AdSkipModule, p2 = ModuleInputEvent.
        AdSkipModuleInputDispatcherFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/discovery/adtech/adskip/AdSkipModule;->state:Lcom/discovery/adtech/adskip/AdSkipState;
                invoke-static { p0, v0, p2 }, $EXTENSION_CLASS->skipIfInsideAdBreak(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
            """,
        )

        // TimelineManager path: every ad break counts as already watched.
        TimelineIsAdBreakAlreadyWatchedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // Pause ads and ad overlay are configured in the same method. Resolve both matches
        // before mutating, then insert at the higher index first so the lower index stays valid.
        val pauseAdsIndex = BuildAdTechSdkPauseAdsFingerprint.instructionMatches[1].index
        val adOverlayIndex = BuildAdTechSdkAdOverlayFingerprint.instructionMatches[1].index
        val adTechSdkMethod = BuildAdTechSdkPauseAdsFingerprint.method

        // Pause ads take the existing "Pause Ads disabled, no config" branch,
        // the ad overlay takes the existing "Disabling Ad UI." branch.
        listOf(pauseAdsIndex, adOverlayIndex).sortedDescending().forEach { moveResultIndex ->
            val register = adTechSdkMethod.getInstruction<OneRegisterInstruction>(moveResultIndex).registerA

            adTechSdkMethod.addInstruction(moveResultIndex + 1, "const/4 v$register, 0x0")
        }
    }
}
