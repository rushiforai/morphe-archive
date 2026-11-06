/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3580
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Ported to RVX by lavinhoque33, 2026-10-17.
 */

// modified by lavinhoque33, 2026-10-17: ported from Morphe, adapted to RVX settings and PatchList helpers.
package app.morphe.patches.youtube.interaction.continuewatching

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.patch.PatchList.DISABLE_CONTINUE_WATCHING_PROMPT
import app.morphe.patches.youtube.utils.playservice.is_21_30_or_greater
import app.morphe.patches.youtube.utils.playservice.versionCheckPatch
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/DisableContinueWatchingPromptPatch;"

@Suppress("unused")
val disableContinueWatchingPromptPatch = bytecodePatch(
    name = DISABLE_CONTINUE_WATCHING_PROMPT.title,
    description = DISABLE_CONTINUE_WATCHING_PROMPT.summary,
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        versionCheckPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        addPreference(
            arrayOf(
                "PREFERENCE_SCREEN: PLAYER",
                "SETTINGS: DISABLE_CONTINUE_WATCHING_PROMPT"
            ),
            DISABLE_CONTINUE_WATCHING_PROMPT
        )

        AutoplayInactivityLimitFingerprint.let {
            it.method.apply {
                val index = it.instructionMatches[3].index
                val register = getInstruction<OneRegisterInstruction>(index).registerA

                addInstructions(
                    index,
                    """
                        invoke-static { v$register }, $EXTENSION_CLASS->adjustInactivityComparison(I)I
                        move-result v$register
                    """
                )
            }
        }

        (if (is_21_30_or_greater) AutoplayConfirmDialogEnabledFingerprint
        else AutoplayConfirmDialogEnabledLegacyFingerprint).method.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $EXTENSION_CLASS->disableConfirmDialog()Z
                move-result v0
                if-eqz v0, :original
                const/4 v0, 0x0
                return v0
                :original
                nop
            """
        )
    }
}
