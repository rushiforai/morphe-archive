package id.ikuradachi.patches.crunchyroll.player.aspect

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

private const val ASPECT_HELPER_CLASS = "Lid/ikuradachi/kageroll/extension/crunchyroll/AspectHelper;"

@Suppress("unused")
val aspectModePatch = bytecodePatch(
    name = "Aspect mode cycle & persistence",
    description = "Cycles video aspect modes (Fit, Zoom, Fill) on pinch and remembers the selected mode across sessions.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    category("Player")
    extendWith("extensions/extension.mpe")

    val enableThreeWayCycle = booleanOption(
        key = "enableThreeWayCycle",
        default = true,
        title = "Enable 3-way aspect cycle",
        description = "Cycles Fit -> Zoom -> Fill -> Fit when pinching out instead of toggling only Fit and Zoom.",
    )
    val defaultAspectMode = stringOption(
        key = "defaultAspectMode",
        default = "fit",
        values = mapOf(
            "Fit (default)" to "fit",
            "Zoom (crop to fill)" to "zoom",
            "Fill (stretch)" to "fill",
        ),
        title = "Default aspect mode",
        description = "Initial video aspect mode before a user pinch selection is saved.",
        validator = { it in setOf("fit", "zoom", "fill") },
    )

    execute {
        val defaultModeInt = when (defaultAspectMode.value) {
            "zoom" -> 4
            "fill" -> 3
            else -> 0
        }
        val threeWayFlag = if (enableThreeWayCycle.value == true) 1 else 0

        AspectHelperDefaultModeFingerprint.matchAll(1..1).single().method.addInstructions(
            0,
            """
                const/4 v0, 0x$defaultModeInt
                return v0
            """.trimIndent(),
        )
        AspectHelperThreeWayFingerprint.matchAll(1..1).single().method.addInstructions(
            0,
            """
                const/4 v0, 0x$threeWayFlag
                return v0
            """.trimIndent(),
        )

        // Verify ScaleGestureDetector$OnScaleGestureListener.onScaleEnd structure is present.
        ScaleGestureOnScaleEndFingerprint.matchAll(1..1).single()

        // 1. Intercept gv0.m setResizeMode(I) dispatch to apply 3-way cycle and persist selection.
        val resizeMatch = PlayerViewResizeInvokeFingerprint.matchAll(1..1).single()
        val setResizeMatch = resizeMatch.instructionMatches[2]
        val setResizeInstr = setResizeMatch.instruction as FiveRegisterInstruction
        val viewReg = setResizeInstr.registerC
        val modeReg = setResizeInstr.registerD
        check(viewReg in 0..15 && modeReg in 0..15) {
            "Resize registers out of range in gv0.m: view=v$viewReg, mode=v$modeReg"
        }

        resizeMatch.method.addInstructions(
            setResizeMatch.index,
            """
                invoke-static {v$viewReg, v$modeReg}, $ASPECT_HELPER_CLASS->resolveAndSaveResizeMode(Landroid/view/View;I)I
                move-result v$modeReg
            """.trimIndent(),
        )

        // 2. Reapply saved resize mode on PlayerGesturesLayout.h5 attachment.
        val attachMatch = PlayerGesturesAttachAspectFingerprint.matchAll(1..1).single()
        val attachMethod = attachMatch.method
        val attachInstructions = attachMethod.implementation!!.instructions
        val iputIdx = attachMatch.instructionMatches[0].index
        val newScaleDetectorIdx = attachMatch.instructionMatches[1].index
        check(newScaleDetectorIdx > iputIdx && iputIdx + 1 < attachInstructions.size) {
            "Unexpected instruction layout between InternalPlayerViewLayout field put and ScaleGestureDetector in PlayerGesturesLayout.h5"
        }
        val resumeAfterPutInstr = attachInstructions[iputIdx + 1]

        // Use v1 as scratch: v0 holds "viewModel" string through line 1137, while v1 is freshly assigned right at resumeAfterPutInstr (new-instance v1, Lw10/b).
        attachMethod.addInstructionsWithLabels(
            iputIdx + 1,
            """
                invoke-static {p2}, $ASPECT_HELPER_CLASS->getSavedResizeMode(Landroid/view/View;)I
                move-result v1
                if-ltz v1, :skip_saved_aspect
                invoke-virtual {p2, v1}, Landroidx/media3/ui/PlayerView;->setResizeMode(I)V
            """.trimIndent(),
            ExternalLabel("skip_saved_aspect", resumeAfterPutInstr),
        )
    }
}
