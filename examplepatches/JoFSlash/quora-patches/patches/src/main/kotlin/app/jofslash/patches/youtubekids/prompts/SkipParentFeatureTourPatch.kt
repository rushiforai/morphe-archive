package app.jofslash.patches.youtubekids.prompts

import app.jofslash.patches.youtubekids.shared.Constants.COMPATIBILITY_YOUTUBE_KIDS
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/youtubekids/FeatureTour;"

// onViewCreated of the feature tour pages (the signed-out "Parent feature tour" and the one after
// making a profile): it fills in the cards and sets the Done button's click listener last.
internal object FeatureTourViewCreatedFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    filters = listOf(
        resourceLiteral(ResourceType.ID, "feature_tour_title"),
        resourceLiteral(ResourceType.ID, "done_button"),
        methodCall(name = "setOnClickListener"),
    ),
)

@Suppress("unused")
val skipParentFeatureTourPatch = bytecodePatch(
    name = "Skip parent feature tour",
    description = "Skips the \"Parent feature tour\" slides in the setup, as if Done was pressed at once.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_YOUTUBE_KIDS)

    extendWith("extensions/youtubekids.mpe")

    execute {
        FeatureTourViewCreatedFingerprint.let {
            val setListener = it.instructionMatches.last().index
            val button = it.method.getInstruction<FiveRegisterInstruction>(setListener).registerC
            it.method.addInstruction(
                setListener + 1,
                "invoke-static { v$button }, $EXTENSION_CLASS->skip(Landroid/view/View;)V"
            )
        }
    }
}
