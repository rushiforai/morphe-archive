package app.morphe.patches.music.layout.overlayfilter

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.extension.Constants.GENERAL_PATH
import app.morphe.patches.music.utils.patch.PatchList.HIDE_OVERLAY_FILTER
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.addSwitchPreference
import app.morphe.patches.music.utils.settings.ResourceUtils.updatePatchStatus
import app.morphe.patches.music.utils.settings.settingsPatch
import app.morphe.patches.shared.mapping.resourceMappingPatch
import app.morphe.util.Utils.printWarn
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val EXTENSION_CLASS = "$GENERAL_PATH/OverlayFilterPatch;"

@Suppress("unused")
val overlayFilterPatch = bytecodePatch(
    HIDE_OVERLAY_FILTER.title,
    HIDE_OVERLAY_FILTER.summary,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    dependsOn(settingsPatch, resourceMappingPatch)

    execute {
        val bottomSheet = BottomSheetDialogFingerprint.classDefOrNull?.let {
            BottomSheetDialogOnStartFingerprint.matchOrNull(it)
        }
        bottomSheet?.let { match ->
            // The layout is cached but onStart is called again when the same dialog is shown.
            match.method.addInstruction(
                match.instructionMatches.single().index + 1,
                "invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->updateDialogDim(Landroid/app/Dialog;)V"
            )
        }

        if (bottomSheet == null) {
            printWarn("Hide overlay filter: bottom sheet window hook unavailable.")
        }

        // The same scrim color is used by unrelated views. Hook only the contextual menu's drawing.
        val scrim = ContextualMenuScrimConstructorFingerprint.classDefOrNull?.let {
            ContextualMenuScrimDrawFingerprint.matchOrNull(it)
        }
        if (scrim != null) {
            val index = scrim.instructionMatches.single().index
            val call = scrim.method.getInstruction<FiveRegisterInstruction>(index)
            scrim.method.replaceInstruction(
                index,
                "invoke-static {v${call.registerC}, v${call.registerD}}, " +
                        "$EXTENSION_CLASS->drawMenuScrim(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V"
            )
        } else {
            printWarn("Hide overlay filter: contextual menu scrim hook unavailable.")
        }
        if (bottomSheet == null && scrim == null) return@execute

        addSwitchPreference(CategoryType.PLAYER, "revanced_hide_overlay_filter", "false")
        updatePatchStatus(HIDE_OVERLAY_FILTER)
    }
}
